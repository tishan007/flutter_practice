import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flutter"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: screenSize.width - 80,
              height: screenSize.height * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mobile Number",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.black26)
                      ),
                      filled: true,
                      fillColor: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Mobile Operator",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.network_wifi,color: Colors.grey,),
                      suffixIcon: Icon(Icons.arrow_downward,color: Colors.grey,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.black26)
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white54,
                    ),
                    //onTap: showSingleChoiseDialog(context),
                    onTap: () => WidgetsBinding.instance.addPostFrameCallback((_){
                      showSingleChoiseDialog(context);
                    }),
                    readOnly: true,
                  ),
                  SizedBox(height: 20,),
                  Text("Mobile Operator Type",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 5,),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.black26)
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: () {

                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          color: Colors.deepOrange,
                          child: const Text(
                            'SUBMIT', style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }

  showSingleChoiseDialog(BuildContext context) {

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Mobile Network Operator"),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                [
                  RadioListTile(
                    title: Text("Teletalk"),
                    value: 1,
                    groupValue: 1,
                    onChanged: (val){
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Grameenphone"),
                    value: 2,
                    groupValue: 2,
                    onChanged: (val){
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Robi"),
                    value: 3,
                    groupValue: 3,
                    onChanged: (val){
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Airtel"),
                    value: 4,
                    groupValue: 4,
                    onChanged: (val){
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Banglalink"),
                    value: 5,
                    groupValue: 5,
                    onChanged: (val){
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


}

