class CampaignModel{
  String title;
  String urlImage;
  String urlWebView;

  CampaignModel({
    required this.title,
    required this.urlImage,
    required this.urlWebView,
  });

  factory CampaignModel.fromJson(Map<dynamic, dynamic> json){
    return CampaignModel(
        title: json['title'],
        urlImage: json['url_image'],
        urlWebView: json['url_webview'],
    );
  }

}