// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoardModel {
  final String title;
  final String description;
  final String imageName;
  OnBoardModel(
    this.title,
    this.description,
    this.imageName,
  );

  String get imageWithPath => 'asset/images/$imageName.png';
}

class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel('Order Your Food1', "Order Your Food11", "ic_chef"),
    OnBoardModel('Order Your Food2', "Order Your Food22", "ic_delivery"),
    OnBoardModel('Order Your Food3', "Order Your Food33", "ic_door"),
  ];
}
