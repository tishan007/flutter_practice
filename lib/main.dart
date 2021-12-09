import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String value = "Teletalk";
  List<String> operators = ["Teletalk","Grameenphone","Robi","Airtel","Banglalink"];
  TextEditingController _mobileOperatorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileOperatorController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mobileOperatorController.dispose();
  }

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
                    controller: _mobileOperatorController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.network_wifi,color: Colors.grey,),
                      suffixIcon: Icon(Icons.arrow_downward,color: Colors.grey,),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.black26)
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white54,
                      hintText: "MOBILE OPERATOR",
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
                children: operators.map((e) => RadioListTile(
                  title: Text(e),
                  value: e,
                  groupValue: value,
                  onChanged: (val){
                    setState(() {
                      value = val;
                      _mobileOperatorController.text = value;
                      print("value : "+value);
                      Navigator.of(context).pop();
                    });
                    Toast.show("$value", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  },
                )).toList(),

              ),
            ),
          ),
        );
      },
    );
  }


}

