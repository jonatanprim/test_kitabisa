import 'package:flutter_test/flutter_test.dart';
import 'package:testaja1/controllers/home_controller.dart';
import 'package:testaja1/services/home_service.dart';
import 'package:testaja1/widgets/bottom_navigation.dart';

void main(){

  group('Test bottom navigation', (){
    const bottomNavigation = BottomNavigation();
    test('Test default index', () async{
      expect(bottomNavigation.createState().currentIndex, 0);
    });
  });

  group('Test Home Service', (){
    final homeService = HomeService();
    test('Test send API request', () async{
      expect(await homeService.getCampaignList(), isNot(equals(null)));
    });
  });

  group('Test home controller', (){
    final homeController = HomeController();
    test('Test fetch data from API', () async{
      await homeController.getCampaignList();
      expect(homeController.campaignList.length, greaterThan(0));
    });
    test('Test isloading value == false after run getCampaignList', () async{
      await homeController.getCampaignList();
      expect(homeController.isLoading.value, false);
    });
    test('Test campaign item data not null', () async{
      await homeController.getCampaignList();
      expect(homeController.campaignList[0].title, 'Bantu anakku sembuh');
      expect(homeController.campaignList[0].urlWebView, 'https://kitabisa.com');
      expect(homeController.campaignList[0].urlImage, 'https://storage.googleapis.com/mobile-flutter-test/image.png');
    });

  });

}