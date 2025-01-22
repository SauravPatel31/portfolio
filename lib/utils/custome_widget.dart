import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/utils/styling.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomeWidget {
  void launchURL(String url)async{
    Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri,mode: LaunchMode.inAppBrowserView);
    }
    else{
      throw 'Could not launch $url';
    }
  }
  List<Widget> imageList = [
    const Image(image: AssetImage("assets/image/c.jpg"),width: double.infinity,fit: BoxFit.contain,),
    const Image(image: AssetImage("assets/image/b.jpg"),width: double.infinity,fit: BoxFit.contain,),
    const Image(image: AssetImage("assets/image/a.jpg"),width: double.infinity,fit: BoxFit.contain,),
  ];
  List<Map<String,dynamic>> skills=[
    {
      'skillName':'Flutter',
      'skillImg':'assets/icons/skill/flutter-logo.png',
      'skillPer':'87%',
      'color':Colors.blueAccent
    },
    {
      'skillName':'Dart',
      'skillImg':'assets/icons/skill/dart-logo.png',
      'skillPer':'84%',
      'color':Colors.teal
    },
    {
      'skillName':'Bloc',
      'skillImg':'assets/icons/skill/bloc-logo.png',
      'skillPer':'82%',
      'color':Colors.blue.shade900
    },
    {
      'skillName':'Provider',
      'skillImg':'assets/icons/skill/provider.png',
      'skillPer':'72%',
      'color':Colors.black

    },
    {
      'skillName':'GetX',
      'skillImg':'assets/icons/skill/getx_icons.png',
      'skillPer':'78%',
      'color':Colors.deepPurple

    },
    {
      'skillName':'Sqlite',
      'skillImg':'assets/icons/skill/sqlite-logo.png',
      'skillPer':'70%',
      'color':Colors.purple
    },
    {
      'skillName':'Firebase',
      'skillImg':'assets/icons/skill/firebase-logo.png',
      'skillPer':'68%',
      'color':Colors.deepOrange
    },
    {
      'skillName':'REST API',
      'skillImg':'assets/icons/skill/api.png',
      'skillPer':'82%',
      'color':Colors.deepPurple
    },
    {
      'skillName':'HTML-CSS',
      'skillImg':'assets/icons/skill/html-css-logo.png',
      'skillPer':'78%',
      'color':Colors.pink
    },
  ];
  List<Map<String,dynamic>> projects=[
    {
      'projectName':'E-Commerce App',
      'projectDescription':"Developed a comprehensive E-Commerce App using Flutter and REST API.The app includes features such as user authentication (login/logout),product browsing,adding products to a cart,placing orders,and viewing order history.It provides a seamless shopping experience with efficient state management and user-friendly design",
      'projectImage':'assets/image/projects/e-comm.png',
      'color':Colors.deepOrangeAccent,
      'projectLink':'https://github.com/SauravPatel31/ecommerce-_ui'
    },
    {
      'projectName':'WallPaper App',
      'projectDescription':"Built a dynamic Wallpaper App using Flutter,REST API,and BLoC state management.The app features smooth animations,allowing users to search for wallpapers,download them,and set them as home or lock screen backgrounds.It ensures efficient state handling and a seamless,interactive user experience",
      'projectImage':'assets/image/projects/wallpaper.png',
      'color':Colors.blueAccent,
      'projectLink':'https://github.com/SauravPatel31/wallpaper_app'
    },
    {
      'projectName':'Expense Tracker App',
      'projectDescription':"Developed an Expense Tracker app using Flutter, REST API,bloc state management,and SQLite.The app features light and dark theme support,efficient offline data management,and robust data filters for viewing expenses by date,month,year,or category,providing an intuitive and seamless user experience.",
      'projectImage':'assets/image/projects/expenses.png',
      'color':Colors.pinkAccent,
      'projectLink':'https://github.com/SauravPatel31/expense_app'
    },
    {
      'projectName':'BMI Calculator',
      'projectDescription':"A modern mobile app to calculate Body Mass Index (BMI) based on user input. It features a clean UI, real-time calculations, categorized BMI results, and cross-platform compatibility for Android and iOS. This project highlights my skills in Flutter and Dart for building intuitive and responsive applications.",
      'projectImage':'assets/image/projects/BMI.png',
      'color':Colors.green,
      'projectLink':'https://github.com/SauravPatel31/bmi_calculator-'
    },
    {
      'projectName':'Tip Calculator',
      'projectDescription':"A sleek and simple Flutter app designed to make tip calculation and bill splitting quick, easy, and accurate. Built with Dart, this app ensures you’ll never overpay or underpay—at the dinner table again! ",
      'projectImage':'assets/image/projects/tip_calculator.png',
      'color':Colors.teal,
      'projectLink':'https://github.com/SauravPatel31/tip-calculator-'
    },

  ];
  ///name and designation and about me and social links..
  Widget details(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///name..
        SizedBox(
            height: 70,
            child: Row(
              children: [
                Text("Hi,",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,fontFamily: 'Mont'),),
                AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText('I’m Saurav Patel',speed: Duration(milliseconds: 200),textStyle:TextStyle(fontSize: 35, fontWeight: FontWeight.bold,fontFamily: "Antic"),curve: Curves.linear )
                    ])
                /*FittedBox(
                    child: Text(
                      "I’m Saurav Patel",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    )),*/
              ],
            )),
        ///designation..
        SizedBox(
            height: 65,
            child: FittedBox(
                child: Text("Flutter Developer", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,fontFamily: "Antic")))),
        ///about me..
        AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText("A passionate Flutter developer and a BCA graduate from SEMCOM College. With hands-on experience in building user-friendly mobile applications and expertise in Flutter, Dart, and state management, I specialize in creating scalable and efficient apps.I’m eager to contribute to innovative projects and continually grow as a web and mobile app developer."
                ,textAlign: TextAlign.justify, textStyle: myTextStyle18(myFontweight: FontWeight.bold),)
            ]),
        SizedBox(height: 30,),
        ///social links..
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialLinksBtn(socialImage: const AssetImage("assets/icons/linkedin-removebg-preview.png"), socialMediaName: "Linkedin",callback:(){
                launchURL("https://www.linkedin.com/in/saurav-patel-783276294/");
              },),
              const SizedBox(width: 80,),
              socialLinksBtn(socialImage: const AssetImage("assets/icons/github-removebg-preview.png"), socialMediaName: "Github",callback: (){
                launchURL("https://github.com/SauravPatel31");
                print("Clicked on Github");
              }),
              const SizedBox(width: 80,),
              socialLinksBtn(socialImage: const AssetImage("assets/icons/download-removebg-preview.png"), socialMediaName: "Resume",callback: (){
                launchURL("https://drive.google.com/file/d/1sX0sL0qAx_QzQ-hb8zct8uzgQnBt0FPr/view?usp=drive_link");
                print("Clicked on CV");
              }),
            ],
          ),
        )
      ],
    );
  }
  ///my training details or experience..
  Widget trainingDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Flutter App Development Training",style: myTextStyle25(myFontweight: FontWeight.w900),),
        const SizedBox(height: 10,),
        RichText(text: TextSpan(
            children: [
              TextSpan(text: "Compny: ",style:  myTextStyle18(myFontweight: FontWeight.bold)),
              TextSpan(text: "WsCube Tech",style: myTextStyle18(myFontweight: FontWeight.bold)),
            ]
        )),
        const SizedBox(height: 10,),
        RichText(text: TextSpan(
            children: [
              TextSpan(text: "Duration: ",style: myTextStyle18(myFontweight: FontWeight.bold)),
              TextSpan(text: "June 2024 - November 2024",style: myTextStyle18(myFontweight: FontWeight.bold)),
            ]
        )),
        const SizedBox(height: 10,),
        const Text("I successfully completed a 5-month training program in Flutter app development at WsCube Tech. During this training, I gained hands-on experience in developing mobile applications using the Flutter framework and Dart programming language.",textAlign: TextAlign.justify,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        Text("Address: ",style: myTextStyle18(myFontweight: FontWeight.bold),),
        const Text("First Floor, Laxmi Tower, BhaskarCir, Ratanada, Jodhpur, Rajasthan,342001",style: TextStyle(fontSize: 16,),),
        const SizedBox(height: 10,),
        Text("Contact:",style: myTextStyle18(myFontweight: FontWeight.bold),),
        const Text("+91 9257209053, +91 9257155617,+91 8000455617 ",style: TextStyle(fontSize: 16,),),
      ],
    );
  }
  ///skills details..
  Widget skillsDetails(){
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 20,
      runSpacing: 20,
      children: skills.map((eachSkill) {
        return CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 6.0,
          percent: 0.7,
          //addAutomaticKeepAlive:true ,
          animateFromLastPercent: true,
          footer: Text(eachSkill['skillName'],style: myTextStyle15(),),
          // animateToInitialPercent: true,
          animation: true,
          animationDuration: 3000,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Image.asset(eachSkill['skillImg'],width: 30,),
              Text(eachSkill['skillPer'],style: myTextStyle12(),)
            ],
          ),
          // widgetIndicator: ,
          progressColor: eachSkill['color'],
        );
      },).toList(),
    );
  }
  ///projects details..
  Widget projectCard({required context,VoidCallback? callbackAction}){
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 450,mainAxisExtent: MediaQuery.of(context).size.height*.58,mainAxisSpacing: 12,crossAxisSpacing: 12),
      children: projects.map((eachProject) {
        return Container(
          decoration: BoxDecoration(
            // color: Colors.red,
              color: eachProject['color'],
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image(image: AssetImage(eachProject['projectImage']),height: MediaQuery.of(context).size.height*.28,width: double.infinity,fit: BoxFit.cover,)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(eachProject['projectName'],style: myTextStyle18(),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(eachProject['projectDescription'],maxLines: 4,overflow: TextOverflow.ellipsis,style: myTextStyle15(myFontweight: FontWeight.normal),),
              ),
              const SizedBox(height: 10,),
              Card(
                elevation: 12,
                color: Colors.deepPurple,
                child: AnimatedButton(

                  animationDuration: Duration(seconds: 1),
                  onPress: (){
                    launchURL(eachProject['projectLink']);
                  },
                  height: 45,
                  text: 'Show Project',

                  selectedTextColor: Colors.black,
                  backgroundColor: Colors.black,
                  animatedOn: AnimatedOn.onHover,
                  isReverse: true,

                  transitionType: TransitionType.CENTER_ROUNDER,
                  textStyle: myTextStyle15(myFontweight: FontWeight.bold,color: Colors.white),
                ),
              )

            ],
          ),
        ) ;
      },).toList(),

    );
  }
  ///social links..
  Widget socialLinksBtn({required ImageProvider socialImage,required String socialMediaName,VoidCallback? callback}){
    return  InkWell(
      onTap:callback,
      child: Column(
        children: [
          AvatarGlow(
            startDelay: const Duration(milliseconds: 1000),
            glowColor: Colors.cyan,
            glowRadiusFactor: 0.5,
            curve: Curves.bounceOut,
            duration: Duration(seconds: 4),
            child: CircleAvatar(
              radius: 25,
              backgroundImage:socialImage ,
            ),
          ),
          Text(socialMediaName,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "Antic"),)
        ],
      ),
    );
  }


}