
import 'package:flutter/material.dart';
import 'package:stream_builder_flutter/strem_get_list/list_stream_repository.dart';
import 'package:stream_builder_flutter/strem_get_list/user_model.dart';

class ListStreamPage extends StatefulWidget {
  const ListStreamPage({Key? key}) : super(key: key);

  @override
  _ListStreamPageState createState() => _ListStreamPageState();
}

class _ListStreamPageState extends State<ListStreamPage> {

  late Stream<List<UserModel?>?> userListStream;


  @override
  void initState() {
    super.initState();

    userListStream = ListStreamRepository().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stream list"),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black12,


        child: Center(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<List<UserModel?>?>(

                  stream: userListStream,
                  builder: (context , snapshot){

                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if(snapshot.hasData){




                      return Column(



                        children: [


                          ListView.builder(

                              scrollDirection: Axis.vertical,
                               shrinkWrap: true,
                               itemCount: snapshot.data!.length,
                               itemBuilder: (context , index){

                                 return Container(
                                   width: MediaQuery.of(context).size.width,
                                   height: 50,
                                   color: Colors.blueGrey,
                                   margin: EdgeInsets.all(10),

                                   child: Center(
                                     child: Text(snapshot.data![index]!.name + " " +snapshot.data![index]!.family),
                                   ),

                                 );
                               }),



                          RaisedButton(
                              child: Text("get data"),
                              onPressed: (){
                                setState(() {
                                  userListStream = ListStreamRepository().getUsers();
                                });

                              })

                        ],
                      );
                    }else{
                      return Container();
                    }

                  },
                ),
              ),


              RaisedButton(
                child: Text("get data"),
                  onPressed: (){
                    setState(() {
                      userListStream = ListStreamRepository().getUsers();
                    });
                  })

            ],
          ),
        ) ,

      ),
    );
  }


}
