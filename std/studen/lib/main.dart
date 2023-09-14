import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StudentList> {
  final List<String> stdList = ['A', 'B', 'C'];
  final List<String> id = ['64543206004-6', '64543206004-7', '64543206004-8'];
  final List<String> age = ['15', '16', '17'];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: stdList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Text(id[index]),
              title: Text('${stdList[index]}'),
              subtitle: Text('${id[index]}, ${age[index]}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.amber),
                onPressed: () {
                  setState(() {
                    stdList.removeAt(index);
                    id.removeAt(index);
                    age.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      )
    ]);
  }
}
