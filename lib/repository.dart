

class MyRepository{


  // Future<String> sendReplyComment(int id) async {
  //   await Future.delayed(const Duration(seconds: 4));
  //   return "200";
  // }

  Stream<String?> getNumbers() async* {

    await Future.delayed(const Duration(seconds: 2));
    yield "200";

    await Future.delayed(const Duration(seconds: 2));
    yield null;

    await Future.delayed(const Duration(seconds: 2));
    yield "404";

    await Future.delayed(const Duration(seconds: 2));
    throw "an error";

  }

}