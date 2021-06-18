import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobil Kodlama (Final Sınavı)"),
      ),
      drawer: drawerWidget(),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: GestureDetector(
            onLongPress: () {
              showToast();
            },
            child: Icon(
              Icons.info,
              size: 32,
              color: Colors.purple,
            )),
      ),
    );
  }

  drawerWidget() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Grup 3 Final Çalışması"),
            accountEmail: Text("Mobil Kodlama"),
            currentAccountPicture: Image.asset("assets/igun_logo.png"),
            otherAccountsPictures: [
              CircleAvatar(
                child: Text("IGÜ"),
                backgroundColor: Colors.pink,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("ÇALIŞMA GRUBU"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.pushNamed(context, '/WorkGroupScreen');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.http),
                  title: Text("HTTP GET İŞLEMLERİ"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.pushNamed(context, '/HttpScreen');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("FORM İŞLEMLERİ"),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.pushNamed(context, '/InsertScreen');
                  },
                ),
                Divider(
                  height: 10,
                ),
                Divider(
                  height: 10,
                ),
                AboutListTile(
                  icon: Icon(Icons.android),
                  applicationName: "Mobil Kodlama Dersi",
                  applicationVersion: "1.0.0",
                  applicationIcon: Icon(Icons.android),
                  child: Text("HAKKINDA"),
                  applicationLegalese: "2021 Yılı",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textProperties(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
    );
  }



  buildBody() {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 1,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/WorkGroupScreen');
          },
          child: Card(
            color: Colors.orange[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  size: 64,
                  color: Colors.white,
                ),
                textProperties("ÇALIŞMA GRUBU\nBİLGİLERİ")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/HttpScreen');
          },
          child: Card(
            color: Colors.green[300],

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.http,
                  size: 64,
                  color: Colors.black,
                ),
                textProperties("HTTP GET İŞLEMLERİ"),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/InsertScreen');
          },
          child: Card(
            color: Colors.indigo[300],

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_link,
                  size: 64,
                  color: Colors.pink,
                ),
                textProperties("FORM İŞLEMLERİ"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "2020 - 2021 BLG206 Final Sınavı",
        backgroundColor: Colors.grey,
        fontSize: 25,
        gravity: ToastGravity.TOP,
        textColor: Colors.pink);
  }
}
//   Container(
//     child: GridView(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 1,
// childAspectRatio: 2/1,
// ),
// itemCount: 3,itemBuilder: (context,index){
//   return Card(
//   child: Container(
//   alignment: Alignment.center,
// child: Column(
// children: [
//   CircleAvatar(child: Icon(Icons.http),),
// Text("asd"),
// ],
// ),
//   ),
//   );
// },),
//
// ),
