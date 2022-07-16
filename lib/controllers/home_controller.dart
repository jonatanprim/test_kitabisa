import 'package:get/get.dart';
import '../models/campaign_model.dart';
import '../services/home_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var campaignList = <CampaignModel>[].obs;

  @override
  void onInit() {
    getCampaignList();
    /*
    campaignList.value = [
      CampaignModel(title: "Bantu Anakku Sembuh 1", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 2", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 3", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 4", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 1", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 2", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 3", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 4", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 1", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 2", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 3", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
      CampaignModel(title: "Bantu Anakku Sembuh 4", urlImage: 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80', urlWebView: "https://www.google.com/"),
    ];
     */
    super.onInit();
  }
  
  // Function to get prepare list
  Future getCampaignList() async {
    isLoading(true);
    final campaignData = await HomeService().getCampaignList();
    if(campaignData != null){
        campaignList.clear();
        for(Map campaign in campaignData['data']){
          campaignList.add(CampaignModel.fromJson(campaign));
        }
        isLoading(false);
    }
    else{
      isLoading(false);
    }

  }

}