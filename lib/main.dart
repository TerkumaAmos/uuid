import 'package:flutter/material.dart';
import 'package:hate/counter.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Todo(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TodoPage(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'quiz.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (ctx) => Quiz(),
//       child: MaterialApp(
//         home: QuizPage(),
//       ),
//     );
//   }
// }

// class QuizPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var quiz = Provider.of<Quiz>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('Quiz App')),
//       body: quiz.isQuizFinished
//           ? Center(
//               child: Text('Your score: ${quiz.totalScore}'),
//             )
//           : Column(
//               children: <Widget>[
//                 Text(quiz.questions[quiz.questionIndex]['questionText']),
//                 ...(quiz.questions[quiz.questionIndex]['answers']
//                         as List<Map<String, dynamic>>)
//                     .map((answer) => ElevatedButton(
//                           onPressed: () => quiz.answerQuestion(answer['score']),
//                           child: Text(answer['text']),
//                         ))
//                     .toList(),
//               ],
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: quiz.resetQuiz,
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);
    TextEditingController todoController = TextEditingController();

    void showEditDialog(int index) {
      todoController.text = todo.todos[index]; // Pre-fill with current todo
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Todo'),
            content: TextField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: 'Edit todo',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Cancel
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (todoController.text.isNotEmpty) {
                    todo.edit(index, todoController.text);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      ).then((_) => todoController.clear()); // Clear controller after dialog
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'T.E.C.H_uma\'s Todo App',
        ),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Type Todo and hit enter',
              contentPadding: EdgeInsets.all(10),
            ),
            controller: todoController,
            onSubmitted: (value) {
              todo.add(value);
              todoController.clear();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todo.todos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // Checkbox(onChanged: ,value: ,);
                    ListTile(
                      title: Text(
                        todo.todos[index],
                      ),
                      onTap: () => showEditDialog(index),
                      trailing: IconButton(
                        onPressed: () {
                          todo.remove(
                            todo.todos[index],
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (_) => BreadCrumbProvider(),
//     child: MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const HomePage(),
//       routes: {
//         '/new': (context) => const Material(),
//       },
//     ),
//   ));
// }

// class BreadCrumb {
//   bool isActive;
//   final String name;
//   final String uuid;
//   BreadCrumb({
//     required this.name,
//     required this.isActive,
//   }) : uuid = const Uuid().v4();

//   void activate() {
//     isActive = true;
//   }

//   @override
//   bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

//   @override
//   int get hashCode => uuid.hashCode;

//   String get title => name + (isActive ? '>' : '');
// }

// class BreadCrumbProvider extends ChangeNotifier {
//   final List<BreadCrumb> _items = [];
//   UnmodifiableListView<BreadCrumb> get item => UnmodifiableListView(_items);

//   void add(BreadCrumb breadCrumb) {
//     for (final item in _items) {
//       item.activate();
//     }
//     _items.add(breadCrumb);
//     notifyListeners();
//   }

//   void reset() {
//     _items.clear();
//     notifyListeners();
//   }
// }

// class BreadCrumbsWidget extends StatelessWidget {
//   final UnmodifiableListView<BreadCrumb> breadCrumbs;
//   const BreadCrumbsWidget({super.key, required this.breadCrumbs});

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: breadCrumbs.map((breadCrumb) {
//         return Text(
//           breadCrumb.title,
//           style: TextStyle(
//             color: breadCrumb.isActive ? Colors.blue : Colors.black,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: Column(
//         children: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed(
//                 '/new',
//               );
//             },
//             child: Text(
//               'Add new bread crumb',
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               context.read<BreadCrumbProvider>().reset();
//             },
//             child: Text('Reset'),
//           ),
//         ],
//       ),
//     );
//   }
// }
