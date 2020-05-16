class FeedbackForm
{
  String _name;
  String _email;
  String _mobileNo;
  String _date;
  String _time;
  String _gender;
  String _package;
  String _address;
  FeedbackForm(this. _name,
  this. _email,
  this._mobileNo,
  this. _date,
  this. _time,
  this._gender,
  this._package,
  this._address,
  );
  String toParams() => 
  "?name=$_name&email=$_email&mobileNo=$_mobileNo&date=$_date&time=$_time&gender=$_gender&package=$_package&address=$_address";
}