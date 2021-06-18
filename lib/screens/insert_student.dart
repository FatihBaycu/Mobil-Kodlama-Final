import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InsertScreen extends StatefulWidget {

  @override
  _InsertScreenState createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {

  String _ad,_soyad ,_sifre, _email;
  final formKey = GlobalKey<FormState>();

  Future<void> createStudent() async{
    http.Response  response =await http.post(
      Uri.parse("https://api.onurylmz.com/mobile-students/create"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode(<String,dynamic>{
        "first_name": _ad,
        "last_name": _soyad,
        "email": _email,
        "password": _sifre
      }),
    );

    if(response.statusCode==200){
      return debugPrint("Başarılı");
    }
    else{
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form İşlemleri"),),
      body: buildBody(),
    );
  }

  buildBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "İsim(*)",
                  labelText: "İsim(*)",
                  border: OutlineInputBorder()),
              validator: (String degeri) {
                if (degeri.length < 2) {
                  return "Lütfen en az 2 karakter değer giriniz.";
                } else {
                  return null;
                }
              },
              onSaved: (deger) => _ad = deger,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(

              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Soyisim(*)",
                  labelText: "Soyisim(*)",
                  border: OutlineInputBorder()),
              validator: (String degeri) {
                if (degeri.length < 2) {
                  return "Lütfen en az 2 karakter değer giriniz.";
                } else {
                  return null;
                }
              },
              onSaved: (deger) => _soyad = deger,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "E-posta adresinizi giriniz...",
                  labelText: "E-Posta Adresi(*)",
                  border: OutlineInputBorder()),
              validator: (String degeri) {
                if (!degeri.contains("@")) {
                  return "Lütfen geçerli bir e-posta giriniz.";
                } else {
                  return null;
                }
              },
              onSaved: (deger) => _email = deger,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLength: 6,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  hintText: "Şifrenizi (6 hane) giriniz...",
                  labelText: "Şifreniz(*)",
                  border: OutlineInputBorder()),
              validator: (String degeri) {
                //eğer Ad Soyad input değeri < 6 ise uyarı verelim....
                if (degeri.length < 6) {
                  return "Lütfen en az 6 karakter şifre giriniz.";
                } else {
                  return null;
                }
              },
              onSaved: (deger) => _sifre = deger,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("KAYDET"),
              onPressed: () => _girisleriKontrolEt(),
            ),
          ],
        ),
      ),
    );
  }
  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.grey,
        fontSize: 25,
        gravity: ToastGravity.TOP,
        textColor: Colors.pink
    );

  }
  _girisleriKontrolEt() {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("İsim  = $_ad");
      debugPrint("Soyisim = $_soyad");
      debugPrint("E-posta = $_email");
      debugPrint("Şifre = $_sifre");
      createStudent();
      toastMessage("Başarılı");

    }else{
      debugPrint("Hatalı alanlar var kontrol et !");
      toastMessage("Başarısız");

    }
  }
}
