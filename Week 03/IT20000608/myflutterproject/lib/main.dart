import 'package:flutter/material.dart';
import 'package:myflutterproject/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.orange),
    home: Home(),
  ));
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // final List<String> todos = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   todos.add("Item 1");
//   //   todos.add("Item 2");
//   // }
//   final List<String> todos = [];

// // @override
//   void initState() {
//     super.initState();
//     todos.add('message 1');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Todos"),
//       ),
//       // body: ListView.builder(
//       //     itemCount: todos.length,
//       //     itemBuilder: (BuildContext context, int index) {
//       //       return Dismissible(
//       //           key: todos[index],
//       //           child: Card(
//       //             child: ListTile(title: Text(todos[index])),
//       //           ));
//       //     })
//     );
//   }
// }
