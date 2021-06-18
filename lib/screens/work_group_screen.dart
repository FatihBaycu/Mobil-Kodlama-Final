import 'package:flutter/material.dart';

class Student {
  int id;
  String ad;
  String soyad;
  String ogrenci_no;
  bool cinsiyet;
  Student(this.id, this.ad, this.soyad, this.ogrenci_no, this.cinsiyet);
}

class WorkGroupScreen extends StatefulWidget {
  @override
  _WorkGroupScreenState createState() => _WorkGroupScreenState();
}

class _WorkGroupScreenState extends State<WorkGroupScreen> {
  //var students<Student>;

  List<Student> students = [];

  @override
  void initState() {
    // TODO: implement initState
    Student s1 = new Student(1, "İpek", "Tülek", "191110024", true);
    Student s2 = new Student(2, "Fatih", "Baycu", "191110011", false);
    Student s3 = new Student(3, "Enes", "Kılıç", "191110024", false);
    Student s4 = new Student(4, "Berke", "Altınkaya", "191110024", false);
    Student s5 = new Student(5, "Tufan", "Karaçam", "191110024", false);

    students.add(s1);
    students.add(s2);
    students.add(s3);
    students.add(s4);
    students.add(s5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Çalışma Grubu 3 Listesi"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              var student = students[index];
              return Card(
                child: ListTile(
                  leading:
                      CircleAvatar(child: Text(student.cinsiyet ? "K" : "E")),
                  title: Text(student.ad + " " + student.soyad),
                  subtitle: Text(student.ogrenci_no),
                  trailing: Icon(Icons.navigate_next),
                  tileColor: student.cinsiyet ? Colors.pink[200] : Colors.blue,
                  onTap: (){

                  },
                ),
              );
            }),
      ),
    );
  }
  alertDialogGoster(BuildContext context, int i) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert başlığı"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("${students[i].ad+" tıklandı"}"),
                  Text("${students[i].soyad+" tıklandı"}"),
                ],
              ),
            ),
            actions: [
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("TAMAM"),
                  ),
                  RaisedButton(
                    child: Text("KAPAT"),
                    onPressed: () => {
                      Navigator.of(context).pop()
                    },
                  ),
                ],
              ),
            ],
          );
        }
    );
  }

}
// Container(
//   child: ListView(
//   children: [
//     Card(
//       child: ListTile(
//         leading: CircleAvatar(child: Text("K"),),
//         title: Text("İpek Tülek"),
//         subtitle: Text("191110024"),
//         trailing: Icon(Icons.navigate_next),
//         tileColor: Colors.pink[200],
//       ),
//     ), Card(
//       child: ListTile(
//         leading: CircleAvatar(child: Text("E"),),
//         title: Text("Fatih Baycu"),
//         subtitle: Text("191110011"),
//         trailing: Icon(Icons.navigate_next),
//         tileColor: Colors.blue[200],
//       ),
//     ),  Card(
//       child: ListTile(
//         leading: CircleAvatar(child: Text("E"),),
//         title: Text("Enes Kılıç"),
//         subtitle: Text("191110018"),
//         trailing: Icon(Icons.navigate_next),
//         tileColor: Colors.blue[200],
//       ),
//     ),  Card(
//       child: ListTile(
//         leading: CircleAvatar(child: Text("E"),),
//         title: Text("Tufan Karaçam"),
//         subtitle: Text("191110023"),
//         trailing: Icon(Icons.navigate_next),
//         tileColor: Colors.blue[200],
//         onTap: (){},
//       ),
//     ), Card(
//       child: ListTile(
//         leading: CircleAvatar(child: Text("E"),),
//         title: Text("Berke Altınkaya"),
//         subtitle: Text("191110027"),
//         trailing: Icon(Icons.navigate_next),
//         tileColor: Colors.blue[200],
//       ),
//     ),
//
//   ],
// ),
// ),
