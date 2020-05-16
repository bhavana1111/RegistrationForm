import 'dart:convert'as convert;
import 'package:http/http.dart'as http;
import 'package:rdc/model/form.dart';
class FormController
{
  final void Function(String) callback;

  //Google app script web URL
  static const String URL="https://script.google.com/macros/s/AKfycbxR3bf6e85PT05PcvxUyVVf3JvhdMo3Wadn2P_QbX9W1fJcPp0/exec";


  //SUcces Status Message
  static const STATUS_SUCESS="SUCCESS";

  //Default Constructor
  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async
  {
    try {
      await http.get(URL+feedbackForm.toParams()
      ).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    }
    catch(e)
    {
      print(e);
    }
  }
}
//https://script.google.com/macros/s/AKfycbxR3bf6e85PT05PcvxUyVVf3JvhdMo3Wadn2P_QbX9W1fJcPp0/exec