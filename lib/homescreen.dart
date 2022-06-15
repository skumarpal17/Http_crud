import 'package:apihttp/postservices.dart';
import 'package:flutter/material.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  PostServices _postServices = PostServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Api'),
      ),
      body: FutureBuilder<List>(
        future:_postServices.getPost() ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(snapshot.data![index]['id'].toString()),
                    subtitle: Text(snapshot.data![index]['title']),
                  );
                });
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                title: Text("Simple Alert"),
                content:Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Title',
                          label: Text('Title'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Content',
                            label: Text('Content'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text('Submit')),
                    ],
                  ),
                )
              );
            },
          );
        },
        ),
      );
  }
}
