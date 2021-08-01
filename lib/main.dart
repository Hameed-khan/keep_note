import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:keep_note/newNote.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp((MaterialApp(
    home: keep_note(),
  )));
}

class keep_note extends StatefulWidget {
  @override
  _keep_noteState createState() => _keep_noteState();
}

class _keep_noteState extends State<keep_note> {
  TextEditingController titleEditing = TextEditingController();
  TextEditingController NoteEditing  = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Colors color;
  var titleOfUser;
  var firestore = FirebaseFirestore.instance.collection('noteRecord');
  Widget EditTextField(String editTitle,String editNote){    // This Function is user for Updating
    titleEditing.text = editTitle;
    NoteEditing.text = editNote;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(140,0,0,0),
                child: Icon(
                  Icons.delete,
                  size: 24,
                ),
              ),
              TextField(                           // TextField editing the title
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller:titleEditing ,
              ),
            ],
          ),
          content:  Column(
            children: [
              TextField(                             // TextField editing the Note
                controller: NoteEditing,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
                 SizedBox(
                   height: 370,
                 ),
                 Row(                          // Cancel and Save Button
                   children: [
                     Container(
                         width:80,
                     child: ElevatedButton(
                         style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.grey[200])
                         ),
                         onPressed: (){
                       Navigator.pop(context);
                     }, child: Text("Cancel",style: TextStyle(color: Colors.red),))),
                     SizedBox(width: 65,),
                     Container(
                          width: 80,

                         child: ElevatedButton(
                             style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all(Colors.blue)
                             ),
                             child: Text("Save",style: TextStyle(color: Colors.white),)),
                     ),
                   ],
                 ),
            ],
          ),
        );
      },
    );
  }
  // ended of Editing alert
  Color(String color){     // For Container Color
    if(color == "Colors.red")
      {
        return Colors.red;
      }
    else if(color == "Colors.orange")
      {
        return Colors.orange;
      }
    else if(color == "Colors.yellow")
      {
        return Colors.yellow;
      }
    else if(color == "Colors.green")
      {
        return Colors.green;
      }
    else if(color == "Colors.blue")
      {
        return Colors.blue;
      }
    else if(color == "Colors.indigo")
      {
        return Colors.indigo;
      }
    else
      {
        return Colors.grey[200];
      }
  }
  // ended of color
     @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Keep Note"),
              centerTitle: true,
            ),
            // Floating Action for adding Note
            floatingActionButton:FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>newNote()));
              },
              child: Icon(
                Icons.add
              ),
            ),
            // StreamBuilder Is used for get Data from firestore and display
            body:  StreamBuilder(
            stream: FirebaseFirestore.instance.collection('noteRecord').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
              if (!snapshot.hasData) {
                return Center(child: const Text('Loading events...'));
              }
              return SizedBox(
                height: 1200,
                  // GridView.builder for designing
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color:  Color(snapshot.data.docs[index]['color']),
                          border: Border.all(color: Colors.grey[200],width: 5.0),
                        ),
                        child: Column(
                          children: [
                          Row(
                           children: [
                              Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey[300],
                                  ),
                                  child: IconButton(
                                    tooltip: 'Edit',
                                    icon: Icon(
                                      Icons.edit,
                                      size: 18,
                                    ),
                                    onPressed: (){
                                      // EditingTextField function
                                      EditTextField(snapshot.data.docs[index]['title'],snapshot.data.docs[index]['Note'],);
                                    },
                                  ),
                                ),
                               // it's used for title and Note
                               Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                     child: Text(snapshot.data.docs[index]['title'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                               ),
                             ),
                         ],
                           ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                            children: [
                              Text( snapshot.data.docs[index]['Note'],style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis, maxLines: 5,),
                          ],
                              )
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.data.docs.length,
                  ),
              );
            }
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(
              Icons.add_a_photo,
              size: 20,
            ), onPressed: (){}),
            IconButton(icon: Icon(
              Icons.ac_unit_rounded,
              size: 20,
            ), onPressed: (){}),
            SizedBox(
              width: 40.0,
            ),
            IconButton(icon: Icon(
              Icons.backpack,
              size: 20,
            ), onPressed: (){}),
            IconButton(icon: Icon(
              Icons.camera_alt,
              size: 20,
            ),),
          ],
        ),
      ),
    );
  }
}
