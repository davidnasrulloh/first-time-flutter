import 'package:first_time/pages/data/tourism_place.dart';
import 'package:first_time/pages/destination/builder-layout.dart';
import 'package:first_time/pages/destination/detail.dart';
import 'package:first_time/pages/destination/expanded-flex.dart';
import 'package:first_time/pages/destination/home.dart';
import 'package:first_time/pages/destination/media-query.dart';
import 'package:first_time/pages/destination/list-view.dart';
import 'package:first_time/pages/destination/responsive-page.dart';
import 'package:first_time/sections/biggerText.dart';
import 'package:first_time/sections/heading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'Oswald',
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/' ,
      routes: {
        '/': (context) => const MyHomePage(title: 'Learn Flutter - David'),
        '/home': (context) => const HomeScreen(),
        '/list-view': (context) => ScrollingScreen(),
        '/expanded-flex': (context) => const Rainbow(),
        '/media-query': (context) => const MediaQueryLayout(),
        '/builder-layout': (context) => const BuilderLayout(),
        '/responsive-page': (context) => const ResponsivePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final place = settings.arguments as TourismPlace;
          return MaterialPageRoute(
            builder: (context) {
              return DetailScreen(place: place);
            },
          );
        }
        // Rute default jika nama rute tidak ditemukan
        return null;
      },
      // home: const MyHomePage(title: 'Flutter - David Nasrulloh'),
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
  String? language;
  String _name = '';
  bool lightOn = false;
  bool agree = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_name != '' ? _name : widget.title,
          style: const TextStyle(
          fontFamily: 'Oswald',
        ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.network(
                'https://picsum.photos/200/300',
                width: 200,
                height: 200,
              ),
            ),
            Center(
              child: Image.asset(
                'images/default.gif',
                width: 200,
                height: 200,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                        hintText: 'Masukkan teks di sini',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        )
                    ),
                    onSubmitted: (String value){
                      setState(() {
                        _name = value;
                      });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Hello, $_name'),
                            );
                          });
                    },
                    onChanged: (String value){
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                ),
                Switch(
                  value: lightOn,
                  onChanged: (bool value){
                    setState(() {
                      lightOn = value;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(lightOn ? 'Light On' : 'Light Off'),
                          duration: const Duration(seconds: 1),
                        )
                    );
                  }),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Home Page')
                ),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: const Text('Detail Page')
                ),
                // TextButton(
                //     onPressed: (){
                //       Navigator.pushNamed(context, '/list-view');
                //     },
                //     child: const Text('List View')
                // ),
               Center(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     TextButton(
                         onPressed: (){
                           Navigator.pushNamed(context, '/media-query');
                         },
                         child: const Text('MediaQuery')
                     ),
                     TextButton(
                         onPressed: (){
                           Navigator.pushNamed(context, '/builder-layout');
                         },
                         child: const Text('Builder Layout')
                     ),
                     TextButton(
                         onPressed: (){
                           Navigator.pushNamed(context, '/responsive-page');
                         },
                         child: const Text('Responsive')
                     ),
                   ],
                 ),
               ),
                OutlinedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/expanded-flex');
                    },
                    child: const Text('Expanded - Flex')),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    // Aksi ketika button diklik
                  },
                ),
                DropdownButton<String>(
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Dart',
                      child: Text('Dart'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Kotlin',
                      child: Text('Kotlin'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Swift',
                      child: Text('Swift'),
                    ),
                  ],
                  value: language,
                  hint: const Text('Select Language'),
                  onChanged: (String? value) {
                    setState(() {
                      language = value;
                    });
                  },
                ),
                ListTile(
                  title: Text('Agree / Disagree'),
                  leading: Checkbox(
                      value: agree,
                      onChanged: (bool? value) {
                        setState(() {
                          agree = value!;
                        });
                      }
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Radio<String>(
                        value: 'Dart',
                        groupValue: language,
                        onChanged: (String? value) {
                          setState(() {
                            language = value;
                            showSnackbar();
                          });
                        },
                      ),
                      title: Text('Dart'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'Kotlin',
                        groupValue: language,
                        onChanged: (String? value) {
                          setState(() {
                            language = value;
                            showSnackbar();
                          });
                        },
                      ),
                      title: Text('Kotlin'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'Swift',
                        groupValue: language,
                        onChanged: (String? value) {
                          setState(() {
                            language = value;
                            showSnackbar();
                          });
                        },
                      ),
                      title: Text('Swift'),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.share),
                Icon(Icons.thumb_up),
                Icon(Icons.thumb_down),
              ],
            ),
            const Heading( // mengubah widget Text
              text:"Ini Title",
            ),
            const BiggerText(text:"Hello world!"),
            const Text('Hello, world!'),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Center(
                child: TextButton(onPressed: (){
                  //   Kosong
                }, child: const Text('David'))
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.yellow, width: 3),
                  boxShadow: const [
                    BoxShadow(color: Colors.black, offset: Offset(2, 4), blurRadius: 20),
                  ]
              ),
              // color: Colors.blue,
              width: 200,
              height: 100,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  'Hi',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


