
class Settings{
  static var blacklist = "";
  static var blackLsitArr = [];
  var sellectedImage = "big-smile";

  String getBlackList(){
    blackLsitArr.forEach((element) {blacklist = blacklist+",$element";});
    return blacklist;
  }

  addToArr(String str){
    blackLsitArr.add(str);
  }

  remoweFromArr(String str){
    blackLsitArr.forEach((element) {if(element == str) blackLsitArr.remove(element);});
  }
}