import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/campaign_model.dart';
import '../pages/webview_page.dart';

class CampaignCard extends StatelessWidget {
  final CampaignModel campaign;
  const CampaignCard({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            Get.to(WebViewPage(url: campaign.urlWebView, title: campaign.title));
          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            elevation: 4.0,
            shadowColor: Colors.black.withOpacity(0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Image.network(campaign.urlImage,
                      fit: BoxFit.cover,
                      height: 125,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Text(campaign.title, maxLines: 2,
                    style: const TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500,),
                  ),
                ),
              ],
            ),
          )
    );
  }
}
