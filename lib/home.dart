import 'package:flutter/material.dart';





class Todo extends StatefulWidget {
  

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
 var output="";
  List<dynamic> todos=["Add your tasks here"];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
     appBar: AppBar(
        title: Text("ToDo App by Ahsan"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
        elevation: 0.00,
        backgroundColor: Colors.black87,
      ),


      body:Container(
        decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1490974490321-81ee04915455?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover)),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
          return Container(
            height: 50,
            decoration: BoxDecoration(
    gradient: LinearGradient(
        colors: [Colors.grey.shade300, Colors.blue.shade400])
  ),
            margin: EdgeInsets.only(top:15),
            child: ListTile(
              title: Text("${todos[index]}"),
              trailing: Container(
                width: 50,
                child: Row(
                  children: [
                    GestureDetector(onTap:(){
                    showDialog(context: context, builder: (context){
              return AlertDialog(
                title:Text("Edit Item"),
                content:TextField(
                  onChanged: (value){
                    output=value;
                  }
                ),
                actions: [
                  ElevatedButton(onPressed:(){
                   setState((){
                     todos.replaceRange(index,index+1,{output});
                   });
                   Navigator.of(context).pop();
                  }, child: Text("Edit"))
                ],
              );
          });
                     

                    },child: Icon(Icons.edit)),
                    GestureDetector(onTap:(){
                      setState(() {
                        todos.removeAt(index);
                      });
                    },child: Icon(Icons.clear_outlined)),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor :Colors.black,
        onPressed: (){
       
        showDialog(context: context, builder: (context){
            return AlertDialog(
              title:Text("Add Item"),
              content:TextField(
                onChanged: (value){
                  output=value;
                }
              ),
              actions: [
                ElevatedButton(
                  
                  
                  onPressed:(){
                 setState((){
                   todos.add(output);
                 });
                 Navigator.of(context).pop();
                }, child: Text("Tap to Add"),
     style: ElevatedButton.styleFrom(
      primary: Colors.teal,
      onPrimary: Colors.white,
      shadowColor: Colors.red,
      elevation: 5,
                               ),
                )
              ],
            );
        });
      },child: Icon(Icons.add),
      
      ),//flt button always comes in bottom
    );
  }
}


