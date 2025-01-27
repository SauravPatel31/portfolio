import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/theme_provider.dart';

import 'package:portfolio/utils/custome_widget.dart';
import 'package:portfolio/utils/projects_page.dart';
import 'package:portfolio/utils/styling.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() =>HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValue =context.watch<ThemeProvider>().getThemeValue();
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      backgroundColor: isDark?Colors.black:Color(0xfff5f3f4),
      appBar: AppBar(
        backgroundColor: isDark?Colors.black:Color(0xfff5f3f4),
        actions: [
        IconButton(
      tooltip: isValue?"Dark Mode":"Light Mode",
          onPressed: ()async{
            context.read<ThemeProvider>().changeThemeValue(newValue: isValue=!isValue);
          }, icon: Icon(isDark? Icons.light_mode:Icons.dark_mode))
        ],
      ),
      body: MediaQuery.of(context).orientation == Orientation.landscape ? _buildLandscapeLayout() : _buildPortraitLayout(),
    );
  }
  /// Landscape layout
  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:18),
      child: ListView(
        children: [
          /// Profile image and details
          FadeTransition(
            opacity: _fadeInAnimation,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Details
                  Expanded(
                    flex: 2,
                    child: CustomWidget().details(context),
                  ),
                  /// Profile image
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.easeInOut,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: const BoxDecoration(
                       // color: Colors.deepPurple,
                        image: DecorationImage(
                          image: AssetImage("assets/image/me.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          /// Training Section
          _buildSectionHeader("Training"),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: CustomWidget().imageList,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomWidget().trainingDetails(context),
              ),
            ],
          ),
          const SizedBox(height: 18),
          /// Skills Section
          _buildSectionHeader("Skills"),
          CustomWidget().skillsDetails(),
          const SizedBox(height: 18),
          /// Projects Section
          _buildSectionHeader("Projects"),
          ProjectCardWidget(context: context),
          const SizedBox(height: 18),
          _buildSectionHeader("Get In Touch"),
          SizedBox(height: 10,),
          CustomWidget().buildFooter()
        ],
      ),
    );
  }

  /// Portrait Layout
  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: ListView(
        children: [
          /// Profile image
          FadeTransition(
            opacity: _fadeInAnimation,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/me_pot.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          CustomWidget().details(context),
          const SizedBox(height: 40),
          /// Training Section
          _buildSectionHeader("Training"),
          const SizedBox(height: 10),
          Column(
            children: [
              CustomWidget().trainingDetails(context),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: CustomWidget().imageList,
              ),
            ],
          ),
          const SizedBox(height: 18),
          /// Skills Section
          _buildSectionHeader("Skills"),
          CustomWidget().skillsDetails(),
          const SizedBox(height: 18),
          /// Projects Section
          _buildSectionHeader("Projects"),
          ProjectCardWidget(context: context),
          const SizedBox(height: 18),
          _buildSectionHeader("Get In Touch"),
          SizedBox(height: 10,),
          CustomWidget().buildFooter()
        ],
      ),
    );
  }
  ///Title Animation
  Widget _buildSectionHeader(String title) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(_controller),
      child: SizedBox(
        height: 45,
        child: FittedBox(
          child: Text(title, textAlign: TextAlign.center, style: myTextStyle28()),
        ),
      ),
    );
  }
}
