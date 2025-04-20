import 'package:flutter/material.dart';
import 'package:hate/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Todo(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoPage(),
      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<Todo>(context);
    TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Provider Todo App',
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
                return ListTile(
                  title: Text(
                    todo.todos[index],
                  ),
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
