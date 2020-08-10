import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController incomeText = new TextEditingController();

  TextEditingController rentalText = new TextEditingController();

  TextEditingController shoppingText = new TextEditingController();

  TextEditingController otherText = new TextEditingController();

  double incomeValue = 0.0;

  double rentalValue = 0.0;

  double shoppingValue = 0.0;

  double otherValue = 0.0;

  double resultantValue = 0.0;

  double balanceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Budget Calculator"),
          centerTitle: false,
          backgroundColor: Colors.deepPurpleAccent,
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('assets/Money_Icon.png'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/Bank.png'),
                  width: 128,
                  height: 128,
                ),
                TextField(
                  controller: incomeText,
                  decoration: InputDecoration(
                    labelText: "Total Income",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: rentalText,
                  decoration: InputDecoration(
                    labelText: "Rental Expenses",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: shoppingText,
                  decoration: InputDecoration(
                    labelText: "Shopping Expenses",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: otherText,
                  decoration: InputDecoration(
                    labelText: "Other Expenses",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                Text(
                  'Balance: $balanceValue',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.attach_money),
          onPressed: () {
            incomeValue = double.parse(incomeText.text);
            rentalValue = double.parse(rentalText.text);
            shoppingValue = double.parse(shoppingText.text);
            otherValue = double.parse(otherText.text);

            resultantValue =
                incomeValue - (rentalValue + shoppingValue + otherValue);

            print(resultantValue);

            setState(() {
              balanceValue = resultantValue;
            });
          },
          backgroundColor: Colors.purpleAccent,
        ),
      ),
    );
  }
}
