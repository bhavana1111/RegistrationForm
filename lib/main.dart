import 'package:flutter/material.dart';
import 'package:rdc/controller/form_controller.dart';
import 'package:rdc/model/form.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raghu Diagnostic Center',
      theme:ThemeData(
        primarySwatch:Colors.blue),
        home:MyHomePage(title:'Raghu Diagnostic Center'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}):super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey= GlobalKey<FormState>();
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  


  //TextField Controllers
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController mobileController =TextEditingController();
  TextEditingController dateController =TextEditingController();
  TextEditingController timeController =TextEditingController();
  TextEditingController genderController =TextEditingController();
  TextEditingController packageController =TextEditingController();
  TextEditingController addressController =TextEditingController();

  void _submitForm()
  {
    if(_formKey.currentState.validate())
    {
      FeedbackForm feedbackForm= FeedbackForm(
  nameController.text,
  emailController.text,
  mobileController .text,
  dateController.text,
  timeController.text,
  genderController.text,
  packageController.text,
  addressController.text,
      );
      FormController formController=FormController((String response){
        print("Response :$response");
        if(response==FormController.STATUS_SUCESS)
        {
          // Feedback is saved succesfully in google sheeets.
          _showSnackbar("Form Submitted");
        }
        else
        {
          //Error Occured while saving data in google sheets
          _showSnackbar("Error ocurred");
        }
      });
      _showSnackbar("Submitting Form");
      // Submit feedbackform and save it in google sheets
       formController.submitForm(feedbackForm);
    }
  }
  _showSnackbar(String message)
  {
    final snackBar= SnackBar(content: Text(message),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Registration Form"),
      ),
      body: Center(
        child:ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller:nameController,
                      validator:(value){
                        if(value.isEmpty)
                        {
                          return 'Enter Valid Name';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(hintText: 'Name'),
                    ),
                    TextFormField(
                      controller:emailController,
                      validator:(value){
                        if(!value.contains("@"))
                        {
                          return 'Enter a valid Email';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration:InputDecoration(
                        labelText:'Email',
                      ) ,
                    ),
                    TextFormField(
                      controller:mobileController,
                      validator:(value){
                        if(value.trim().length!=10)
                        {
                          return 'Enter a valid Phone Number';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration:InputDecoration(
                        labelText:'Mobile Number',
                      ) ,
                    ),
                    TextFormField(
                      controller:dateController,
                      validator:(value){
                        if(value.isEmpty)
                        {
                          return 'Enter a Valid date';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.datetime,
                      decoration:InputDecoration(
                        labelText:'Date',
                      ) ,
                    ),
                     TextFormField(
                      controller:timeController,
                      validator:(value){
                        if(value.isEmpty)
                        {
                          return 'Enter a Valid time';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.datetime,
                      decoration:InputDecoration(
                        labelText:'Time',
                      ) ,
                    ),
                     TextFormField(
                      controller:genderController,
                      validator:(value){
                        if(value.isEmpty)
                        {
                          return 'Enter a Valid option';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.datetime,
                      decoration:InputDecoration(
                        labelText:'Gender',
                      ) ,
                    ),
                     TextFormField(
                      controller:packageController,
                      validator:(value){
                        if(value.isEmpty)
                        {
                          return 'Enter a Valid package';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration:InputDecoration(
                        labelText:'Package',
                      ) ,
                    ),
                     TextFormField(
                      controller:addressController,
                      validator:(value){
                        if(value.isEmpty)
                        {
                          return 'Enter a address date';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      decoration:InputDecoration(
                        labelText:'Address',
                      ) ,
                    ),
                     RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed:_submitForm,
                child: Text('Submit Feedback'),
                     ),

                  ],
                  ),
                ))
          ],
          ) ,
          
          ),
    );
  }
}
//1OOHcRPc1MsaqFEjs0yp8GPYEQF2PYPGaZe4teq-0KQs