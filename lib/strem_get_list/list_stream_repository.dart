import 'package:stream_builder_flutter/strem_get_list/user_model.dart';

class ListStreamRepository{



  Stream<List<UserModel?>?> getUsers() async* {

    await Future.delayed(const Duration(seconds: 3));

    List<UserModel> userList = [];
    userList.add(UserModel("hasan", "hassani"));
    userList.add(UserModel("milad", "miladi"));
    userList.add(UserModel("nabi", "rezai"));


    yield userList;


  }
}