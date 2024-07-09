import 'package:flutter/material.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> MyHomePageState();
}
class MyHomePageState extends State<MyHomePage>
{

  var wtController=TextEditingController();
  var feetController=TextEditingController();
  var inchController=TextEditingController();
  var  result="";

  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 14,
        backgroundColor: Colors.indigo,
        bottomOpacity: 14,
        title: Text("BMI",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 34),),
      ),

      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 343,
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w900),),
                SizedBox(height: 22,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight in kg"),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12,),

                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                      label: Text("Enter your height(feet)"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 12,),

                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text("Enter your height(inch)"),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 17,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,

                  ),
                    onPressed: (){
                    var  wt=wtController.text.toString();
                    var  ft=feetController.text.toString();
                    var  inch=inchController.text.toString();


                    if (wt!=""&&ft!=""&& inch!="")
                      {
                          var Intwt=int.parse(wt);
                          var Intft=int.parse(ft);
                          var Intinch=int.parse(inch);

                          var tinch=(Intft*12)+Intinch;

                          var tcm=tinch*2.54;

                          var tMeter=tcm/100;

                          var bmi=Intwt/(tMeter*tMeter);

                          var msg="";

                          if (bmi>25)
                            {
                              msg="You are overweight";
                              bgcolor=Colors.orange.shade200;
                            }
                          else if(bmi<18)
                            {
                              msg="You are under weight";
                              bgcolor=Colors.red.shade200;
                            }
                          else
                            {
                              msg="you are Healthy!!";
                              bgcolor=Colors.green.shade200;
                            }

                          setState(() {
                            result="$msg \nYour Bmi is: ${bmi.toStringAsFixed(3)}";
                          });
                      }
                    else
                      {
                        setState(() {
                          result="please fill all the blanks??";
                          bgcolor=Colors.white;
                        });
                      }
                },
                    child: Text("Calculate",style: TextStyle(color: Colors.white),)

                ),

                SizedBox(height: 17,),
                Text(result,style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}