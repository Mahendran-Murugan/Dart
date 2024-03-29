import 'package:flutter/material.dart';

enum Personal { name, age, food }

enum Animal { cat, dog, human }

class Value<A, B> {
  final A val1;
  final B val2;
  Value(this.val1, this.val2);
}

Stream<String> getName() {
  return Stream.periodic(const Duration(seconds: 60), (value) {
    return 'Foo';
  });
}

Iterable<int> getNo() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void GenericClass() {
  final val = Value("Mahi", 4507);
  print(val.val1);
  final val2 = Value(45, "4507");
  print(val2.val1);
}

void testGenerator() {
  for (final val in getNo()) {
    print(val);
  }
}

void testStream() async {
  await for (final value in getName()) {
    print(value);
  }
  print("Stream Finished");
}

Future<int> multiplyByTwo(int a) {
  return Future.delayed(const Duration(seconds: 3), () {
    return a * 2;
  });
}

class Species {
  final name;

  Species(this.name);

  factory Species.cat() => Species('Cat');

  void run() {
    print('${this.name} is Running');
  }

  void sleep() {
    print('${this.name} is Sleeping');
  }
}

class Cat {
  final String name;
  Cat(this.name);
}

extension Run on Cat {
  void run() {
    print("The Cat $name is running");
  }
}

void extensions() {
  final cat = Cat("meow");
  cat.run();
}

void asynchronousFunc() async {
  print(await multiplyByTwo(10));
}

void useEnumWithSwitch(Animal ani) {
  switch (ani) {
    case Animal.cat:
      print("It's Cat");
    case Animal.dog:
      print("It's Dog");
    case Animal.human:
      print("It's Human");
    default:
      print("Unidentified");
  }
  print("Executed..");
}

void useEnum() {
  print(Personal.name);
  print(Personal.name.name);
}

String shortHandFunction() => "Hello i'm Shorty";

void checkNullAndStoreValue() {
  List<String>? list = null;
  var length = list?.length ?? 0; //This means if it null store zero
  print(length);
}

void conditionalIncokation() {
  List<String>? greet = null;
  // print(greet.length); It cause error
  print(greet?.length); // No error
}

void nullSafty() {
  // const String name = null; this cause error
  String? name = null;
  print('Name is $name');
  name ??= 'Foo'; // only assign if it is a null
  print('Name is $name');
  List<String>? names = ['Mahi']; // This means list can be null
  print(names);
  names = null;
  List<String?> cities = [
    'kovai',
    'thirchy',
    null
  ]; // This means list item can be null
  print(cities);
  List<String?>? anim = [
    'aot',
    'naruto',
    'op'
  ]; // Both list and items can be null
  print(anim);
  anim[2] = null;
  anim = null;
}

void mapInDart() {
  var map = {'Name': 'Mahendran', 'Age': 19};
  map['Name'] = 'Mahendran M';
  print("${map['Name']} is ${map['Age']} years old.");
  print(map);
}

void listInDart() {
  final list = [10, 20, 30];
  final foo = list[1];
  print("The 1st index is: $foo");
  final size = list.length;
  print("The size is: $size");
}

void conditionalStatements() {
  const name = "Mahi";
  if (name == "Mahi") {
    print("you are Mahi");
  } else {
    print("you aren't Mahi");
  }
}

void main() {
  runApp(const MyApp());
}

void test() {
  print(shortHandFunction());
  conditionalStatements();
  listInDart();
  mapInDart();
  nullSafty();
  conditionalIncokation();
  checkNullAndStoreValue();
  useEnum();
  useEnumWithSwitch(Animal.cat);
  final human = Species("Human");
  human.run();
  human.sleep();
  final cat = Species.cat();
  cat.run();
  cat.sleep();
  extensions();
  asynchronousFunc();
  testStream();
  testGenerator();
  GenericClass();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    test();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
