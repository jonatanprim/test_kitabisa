import 'package:get/get.dart';
import '../models/campaign_model.dart';
import '../services/home_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var campaignList = <CampaignModel>[].obs;

  @override
  void onInit() {
    getCampaignList();
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