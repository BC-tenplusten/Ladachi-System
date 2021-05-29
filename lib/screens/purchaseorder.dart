import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

TextEditingController initVbrand;
TextEditingController initVdescrp;
TextEditingController initVqty;
TextEditingController initVup;
TextEditingController initVp;

class PurchaseOrder extends StatefulWidget {
  PurchaseOrder({Key key}) : super(key: key);

  @override
  _PurchaseOrderState createState() => _PurchaseOrderState();
}

class _PurchaseOrderState extends State<PurchaseOrder> {
  @override
  void initState() {
    super.initState();
    initVbrand = new TextEditingController(text: 'Brand');
    initVdescrp = new TextEditingController(text: 'Description');
    initVqty = new TextEditingController(text: 'QTY');
    initVup = new TextEditingController(text: 'Unit Price');
    initVp = new TextEditingController(text: 'Price');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('L10001'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              customerdetails,
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('Brand')),
                      // DataColumn(label: Text('Description')),
                      // DataColumn(label: Text('Quantity')),
                      // DataColumn(label: Text('Unit Price')),
                      // DataColumn(label: Text('Price')),
                    ],
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DropDownField(
                            enabled: true,
                            controller: brandselect,
                            itemsVisibleInDropdown: 2,
                            items: brands,
                            onValueChanged: (value) {
                              setState(() {
                                selectbrand = value;
                              });
                            },
                          ),
                        )),
                        // DataCell(TextField(
                        //   enabled: false,
                        //   keyboardType: TextInputType.multiline,
                        // )),
                        // DataCell(TextField(
                        //   keyboardType: TextInputType.number,
                        // )),
                        // DataCell(TextField()),
                        // DataCell(TextField()),
                      ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customerdetails = Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 250.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              textAlign: TextAlign.right,
              enabled: false,
              decoration: new InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date',
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact',
                    ),
                  ))
            ],
          ),
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Address',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Delivery Date',
          ),
        )
      ],
    ));

Widget productdetails = Container(
  padding: EdgeInsets.all(5),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black),
  ),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('Brand')),
        DataColumn(label: Text('Description')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Unit Price')),
        DataColumn(label: Text('Price')),
      ],
      rows: <DataRow>[
        DataRow(cells: <DataCell>[
          DataCell(
            DropDownField(
              enabled: true,
              controller: brandselect,
              items: brands,
              onValueChanged: (value) {},
            ),
          ),
          DataCell(TextField(
            enabled: false,
            keyboardType: TextInputType.multiline,
          )),
          DataCell(TextField(
            keyboardType: TextInputType.number,
          )),
          DataCell(TextField()),
          DataCell(TextField()),
        ])
      ],
    ),
  ),
);

final brandselect = TextEditingController();
String selectbrand = "";

List<String> brands = [
  "Dreamland",
  "Getha",
];
