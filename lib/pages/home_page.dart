import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/campaign_card.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/loading_block.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Kitabisa",
        titleSize: 24.0,
        isLight: true,
        enableSearch: true,
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          if (homeController.isLoading.value == true) {
          } else {
            homeController.getCampaignList();
          }
        },
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
              child: const Text('Campaigns',
                style: TextStyle(color: Colors.black87, fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),

            Expanded(
              child: Obx(()=> homeController.isLoading.value == true ?
              GridView.builder(
                itemCount: homeController.campaignList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          child: LoadingBlock(
                            height: 130,
                            width: double.infinity,
                          ),
                        ),
                        LoadingBlock(height: 24, width: 200, mb: 8, ml: 8, mr: 8, mt: 8,),
                      ],),);
                },
              )
                  :
              GridView.builder(
                itemCount: homeController.campaignList.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return CampaignCard(
                    campaign: homeController.campaignList[index],
                  );
                },
              )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
