import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void mian()=>runApp(MaterialApp(

  home: newNote(),
  debugShowCheckedModeBanner: false,


));
class newNote extends StatefulWidget {
  @override
  _newNoteState createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  Map contant;
  String color;
  TextEditingController titleText = TextEditingController();
  TextEditingController NoteText  = TextEditingController();

  // final databasereference = FirebaseDatabase.instance.reference().child("noteKeepRecord");
   final fireStore = FirebaseFirestore.instance;
   CollectionReference reference = FirebaseFirestore.instance.collection('noteRecord');

  keepNoteRecord(String title,String Note)
  {
    reference.orderBy('field');
    print(color);
    reference.add({'title':title,'Note':Note,'color':color});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color:Colors.white,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16,30,0,0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color:Colors.black,
                          size: 30.0,
                        ),
                        onPressed: (){
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,23,0,0),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          size: 30.0,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: 333,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  child: TextFormField(
                    controller: titleText,
                    minLines: 1,
                    maxLines: 5,
                    cursorColor: Colors.black,
                    cursorHeight:40,

                    textInputAction: TextInputAction.newline,
                    // https://www.codegrepper.com/code-examples/dart/flutter+textfield+remove+border Border Remover  + cursor
                    style: TextStyle(fontSize: 25,),
                    decoration: InputDecoration(
                        border:        InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder:   InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder:InputBorder.none,
                        hintText: "Title",
                        hintStyle: TextStyle(fontSize: 25),
                        contentPadding: EdgeInsets.only(left: 20.0,top: 5.0)
                    ),
                  ),
                ),
                Container(
                  width: 333,
                  margin: EdgeInsets.symmetric(horizontal: 13),
                  child: TextField(
                    controller: NoteText,
                    cursorColor: Colors.black,
                    cursorHeight: 25,
                    style: TextStyle(
                      fontSize: 18,

                    ),
                    decoration: InputDecoration(
                        focusedBorder:     InputBorder.none,
                        border:            InputBorder.none,
                        errorBorder:       InputBorder.none,
                        enabledBorder:     InputBorder.none,
                        disabledBorder:    InputBorder.none,
                        hintText: "Note",
                        hintStyle: TextStyle(fontSize: 18),
                        contentPadding: EdgeInsets.only(left: 20.0,top: 5.0)
                    ),
                  ),
                ),
                // get Colors
                Container(
                  margin: EdgeInsets.only(top: 367),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(7,0,0,0),
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              color = "Colors.orange";
                            });
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.red)
                          ),

                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(7,0,0,0),
                        child: ElevatedButton(
                          onPressed: (){
                           setState(() {
                             color = "Colors.orange";
                           });
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.orange)
                          ),

                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(7,0,0,0),
                        child: ElevatedButton(
                          onPressed: (){
                            color = "Colors.orange";
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.yellow)
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(7,0,0,0),
                        child: ElevatedButton(
                          onPressed: (){
                            color = "Colors.orange";
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.green)
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(7,0,0,0),
                        child: ElevatedButton(
                          onPressed: (){
                            color = "Colors.orange";
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.blue)
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(7,0,0,0),
                        child: ElevatedButton(
                          onPressed: (){
                            color = "Colors.orange";
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(Colors.indigo)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    width: 400,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(onPressed: (){
                      keepNoteRecord(titleText.text, NoteText.text);
                    }, child: Text("Save Note",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),))),
              ],
            )
        ),
      ),
    );
  }
}
