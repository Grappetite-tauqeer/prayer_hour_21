import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_hour/bloc/prayer_list/prayer_list_bloc.dart';
import 'package:prayer_hour/Model/prayer.dart';
import 'package:prayer_hour/Model/prayer_list.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
      BlocProvider(
        create: (context) => PrayerListBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;




  PrayerListBloc listBloc;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    listBloc = BlocProvider.of<PrayerListBloc>(context);
   //

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Add Prayer'),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: BlocBuilder<PrayerListBloc,PrayerListState>(
          cubit: listBloc,
          builder: (context,state){

            if (state is InitialPrayerListState){

              listBloc.add(GetList(context));

              return Center(child: Text('Inifital'),);
            }
            else if (state is PrayerLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is PrayerLoaded){

              return ListView.separated(itemBuilder: (context , index){
                return buildListTile(state.prayers.prayerList[index]);
              }, itemCount: state.prayers.prayerList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 8,
                    child: Divider(
                      thickness: 1.2,
                    ),
                  );
                },
              );



            }
            return Text('Wow');

          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget buildListTile(Prayer prayer) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(prayer.title)),
          IconButton(icon: Icon(Icons.menu), onPressed: (){

          }),
          IconButton(icon: Icon(Icons.edit), onPressed: (){

          }),
          IconButton(icon: Icon(Icons.delete), onPressed: (){

          }),
        ],
      ),
    );
  }
}
