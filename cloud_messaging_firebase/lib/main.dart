import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('📬 Background message: ${message.messageId}');
  print('📩 Title: ${message.notification?.title}');
  print('📝 Body: ${message.notification?.body}');
  print('🧾 Data: ${message.data}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
  runApp(MessagingTutorial());
}

class MessagingTutorial extends StatelessWidget {
  const MessagingTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Messaging',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Cloud Messaging with Firebase'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FirebaseMessaging messaging;
  String? _token;
  String? _message;
  final List<String> _history = [];

  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;

    // Request permission for Android 13+
    messaging.requestPermission();

    // Get FCM token
    messaging.getToken().then((value) {
      print('🔑 FCM Token: $value');
      setState(() {
        _token = value;
      });
    });

    // Foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('🔔 Foreground message received');
      print('📝 Title: ${message.notification?.title}');
      print('📝 Body: ${message.notification?.body}');
      print('🧾 Data: ${message.data}');

      String type = message.data['notificationType']?.toLowerCase() ?? 'regular';
      String body = message.notification?.body ?? 'No content';

      Color bgColor = type == 'important' ? Colors.red : Colors.blue;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: bgColor,
          title: Text(
            type == 'important' ? "🔥 IMPORTANT" : "🔔 Notification",
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            body,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _message = body;
                  _history.add(body);
                });
              },
              child: Text("View", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Dismiss", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('📲 Notification clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("FCM Token:", style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(_token ?? 'Fetching token...'),
            SizedBox(height: 20),
            Text(
              "Send a notification from Firebase Console to this token.",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),
            Text("Notification History:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text(_history[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
