import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:portfolio/utils/styling.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
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
      'skillPer':'75%',
      'color':Colors.blue.shade900
    },
    {
      'skillName':'Provider',
      'skillImg':'assets/icons/skill/provider.png',
      'skillPer':'72%',
      'color':Colors.black

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
    'projectDescription':"E-Commerce App orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
    'projectImage':'assets/image/b.jpg',
      'color':Colors.blueAccent,
      'projectLink':'https://github.com/SauravPatel31/expense_app'
  },
    {
    'projectName':'Tip Calculator',
    'projectDescription':"E-Commerce App orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy ",
    'projectImage':'assets/image/b.jpg',
      'color':Colors.blueAccent,
      'projectLink':'https://github.com/SauravPatel31/expense_app'
  },

  ];

  void launchURL(String url)async{
    Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri,mode: LaunchMode.inAppBrowserView);
    }
    else{
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.black,
      body: MediaQuery.of(context).orientation==Orientation.landscape?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            ///Profile image and details..
            SizedBox(
              width: MediaQuery.of(context).size.width,
             // color:Colors.blueAccent ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///details..
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: details()),
                  ///profile image..
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height*0.7,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                            image: AssetImage("assets/image/me.png"),fit: BoxFit.contain,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ///Training..
            SizedBox(
              height: 45,
              child: FittedBox(
                  child: Text("Training",textAlign: TextAlign.center,style: myTextStyle28(),)),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.32,
                  height: 300,
                  child: CarouselSlider(
                    options: CarouselOptions(
                     height: 300,
                      viewportFraction: 1,
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: imageList,

                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: trainingDetails(),
                )
              ],
            ),
            ///Skills..
            const SizedBox(height: 18,),
            SizedBox(
              height: 45,
              child: FittedBox(
                  child: Text("Skills",textAlign: TextAlign.center,style: myTextStyle28(),)),
            ),
            skillsDetails(),
            ///Projects..
            const SizedBox(height: 18,),
            SizedBox(
              height: 45,
              child: FittedBox(
                  child: Text("Projects",textAlign: TextAlign.center,style: myTextStyle28(),)),
            ),
            Container(
              color: Colors.grey.shade200,
              child:projectCard(context: context),
            )
          ],
        ),
      ):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(

          children: [
            ///profile image..
            Container(
             // width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                  //color: Colors.red,
                 // shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/image/me_pot.png"),fit: BoxFit.contain,),
              ),
            ),
            ///Details..
            details(),
            const SizedBox(height: 40,),
            ///Training..
            const SizedBox(
              height: 45,
              child: FittedBox(
                  child: Text("Training",textAlign: TextAlign.center,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)),
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  trainingDetails(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 300,
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      items: imageList,

                    ),
                  )
                ],
              ),
            ),
            ///Skills..
           // SizedBox(height: 18,),
            SizedBox(
              height: 45,
              child: FittedBox(
                  child: Text("Skills",textAlign: TextAlign.center,style: myTextStyle28(),)),
            ),
            const SizedBox(height: 10,),
            skillsDetails(),
            ///Projects..
            const SizedBox(height: 18,),
            SizedBox(
              height: 44,
              child: FittedBox(
                  child: Text("Projects",textAlign: TextAlign.center,style: myTextStyle28(),)),
            ),
            projectCard(context: context)
          ],
        ),
      ),
    );
  }
  Widget details(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///name..
        const SizedBox(
            height: 70,
            child: FittedBox(
                child: Text(
                  "Hi, I’m Saurav Patel",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ))),
        ///designation..
        const SizedBox(
            height: 60,
            child: FittedBox(
                child: Text(
                  "Flutter Developer",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ))),
        ///about me..
        Text(
          "A passionate Flutter developer and a BCA graduate from SEMCOM College. With hands-on experience in building user-friendly mobile applications and expertise in Flutter, Dart, and state management, I specialize in creating scalable and efficient apps.I’m eager to contribute to innovative projects and continually grow as a web and mobile app developer."
          ,textAlign: TextAlign.justify, style: myTextStyle18(myFontweight: FontWeight.bold),
        ),
        ///social links..
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialLinksBtn(socialImage: const AssetImage("assets/icons/linkedin.png"), socialMediaName: "Linkedin",callback:(){
                launchURL("https://www.linkedin.com/in/saurav-patel-783276294/");
    },),
              const SizedBox(width: 80,),
              socialLinksBtn(socialImage: const AssetImage("assets/icons/github.png"), socialMediaName: "Github",callback: (){
                launchURL("https://github.com/SauravPatel31");
                print("Clicked on Github");
              }),
              const SizedBox(width: 80,),
              socialLinksBtn(socialImage: const AssetImage("assets/icons/download.png"), socialMediaName: "Resume",callback: (){
                print("Clicked on CV");
              }),
            ],
          ),
        )
      ],
    );
  }
  Widget trainingDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Flutter App Development Training",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
  Widget projectCard({required context,VoidCallback? callbackAction}){
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 450,mainAxisExtent: MediaQuery.of(context).size.height*.53,mainAxisSpacing: 12,crossAxisSpacing: 12),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(onPressed: (){
                  launchURL(eachProject['projectLink']);
                }, child: Text("Show Project",style: myTextStyle15(myFontweight: FontWeight.bold),),style: OutlinedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width, 45),backgroundColor: Colors.black,foregroundColor: Colors.white,)
                ),
              )],
          ),
        ) ;
      },).toList(),

    );
  }
  Widget socialLinksBtn({required ImageProvider socialImage,required String socialMediaName,VoidCallback? callback}){
    return  InkWell(
      onTap:callback,
      child: Column(
        children: [
          Card(
            shadowColor: Colors.blue,
            elevation: 11,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            child: CircleAvatar(
              radius: 25,
              backgroundImage:socialImage ,
            ),
          ),
          Text(socialMediaName,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}





