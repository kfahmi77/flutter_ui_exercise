import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ListViewUI extends StatefulWidget {
  const ListViewUI({super.key});

  @override
  _ListViewUIState createState() => _ListViewUIState();
}

class _ListViewUIState extends State<ListViewUI> {
  final List<ListItem> _items =
      List.generate(100, (index) => ListItem('Item $index'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('ListView'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = _items[index];
            //random icon
            final icon = index.isEven ? Icons.ac_unit : Icons.access_alarm;

            return Dismissible(
              key: Key(item.id), // Use the unique id as the key
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _items.removeAt(index);
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.content} dismissed'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        setState(() {
                          _items.insert(index,
                              item); // Reinsert the item using its original object
                        });
                      },
                    ),
                  ),
                );
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete),
              ),
              child: ListTile(
                title: Text(item.content),
                subtitle: const Text('Subtitle'),
                leading: Icon(icon),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  print('Tapped on ${item.id}');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListItem {
  String id;
  String content;

  ListItem(this.content) : id = const Uuid().v6();
}
