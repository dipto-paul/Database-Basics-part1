import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextFormField()),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                color: Colors.black,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(value: false, onChanged: (_) {}),
                  title: Text('This is title'),
                   trailing: Row(

                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit, color: Colors.orange)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red)),

                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
