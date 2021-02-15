import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:screen/screen.dart';

void main() {
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String hr;
  String min;
  String col;
  String datedate;
  String h1;
  String h2;
  String m1;
  String m2;

  @override
  void initState() {
   gettime();
   var date= DateTime.now();
print(DateFormat.yMMMMEEEEd().format(date));
       
   print("init state");
     super.initState();
  }

  // void ticking(){
  //   int timestamp=  DateTime.now().millisecondsSinceEpoch ;
  //    setState(() {
  //       col=timestamp.toString();
  //    });
     
  // }

  void gettime() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;


       hr=  TimeOfDay.now().hour.toString();
       min= TimeOfDay.now().minute.toString();
    // min='2';
   print(TimeOfDay.now().hour);
   
   print(TimeOfDay.now().minute);

   if(hr.length<2){
     h2=hr[0];
     h1='0';
   }
   else{
     h2=hr[1];
     h1=hr[0];
   }


   if(min.length<2){
     m2=min[0];
     m1='0';
   }
   else{
     m2=min[1];
     m1=min[0];
   }


   var date = DateTime.now();
    datedate=DateFormat.yMMMMEEEEd().format(date);
 
    });

  var cron = new Cron();
  cron.schedule(new Schedule.parse('*/1 * * * *'), () async {
    print('every three minutes');
    gettime();
  });

  // cron.schedule(new Schedule.parse('*/0.1 * * * *'), () async {
  //   print('every three minutes');
  //   ticking();
  // });

  }

  @override
  Widget build(BuildContext context) {

    Screen.keepOn(true);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(35),
        decoration: BoxDecoration(
            color: Color.fromRGBO(37, 32, 32, 1),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(91, 88, 88, 1),
            //borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
              Text('${h1}', style:GoogleFonts.archivo(fontWeight: FontWeight.w700, fontSize: 124, color: Color.fromRGBO(36, 228, 182, 1)),)  ,
              Text('${h2}', style:GoogleFonts.archivo(fontWeight: FontWeight.w700, fontSize: 124, color: Color.fromRGBO(110, 235, 197, 1)),)  ,
              Text(':', style: GoogleFonts.archivo(fontWeight: FontWeight.w700, fontSize: 80, color: Colors.white),),
              Text('${m1}', style:GoogleFonts.archivo(fontWeight: FontWeight.w700, fontSize: 124, color: Color.fromRGBO(241, 226, 226, 1)),)  ,
              Text('${m2}', style:GoogleFonts.archivo(fontWeight: FontWeight.w700, fontSize: 124, color: Color.fromRGBO(231, 169, 169, 1)),)  ,
              
                ],
              )
            
            ,
         Row(
           
           mainAxisAlignment: MainAxisAlignment.center,
           
           children: [ Text('$datedate', style:GoogleFonts.archivo(fontWeight: FontWeight.w700, fontSize: 25, color: Color.fromRGBO(36, 228, 182, 1)),)  ,
           ],) 
            
            ],
          ),
        ),
      ),
    ));
  }
}
