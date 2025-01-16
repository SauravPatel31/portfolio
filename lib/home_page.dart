import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/utils/custome_widget.dart';
import 'package:portfolio/utils/projects_page.dart';
import 'package:portfolio/utils/styling.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? _buildLandscapeLayout()
          : _buildPortraitLayout(),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    child: CustomeWidget().details(),
                  ),
                  /// Profile image
                  Expanded(
                    flex: 1,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: const BoxDecoration(
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
                flex: 1,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: CustomeWidget().imageList,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: CustomeWidget().trainingDetails(),
              ),
            ],
          ),
          const SizedBox(height: 18),
          /// Skills Section
          _buildSectionHeader("Skills"),
          CustomeWidget().skillsDetails(),
          const SizedBox(height: 18),
          /// Projects Section
          _buildSectionHeader("Projects"),
          ProjectCardWidget(context: context),
        ],
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
          CustomeWidget().details(),
          const SizedBox(height: 40),
          /// Training Section
          _buildSectionHeader("Training"),
          const SizedBox(height: 10),
          Column(
            children: [
              CustomeWidget().trainingDetails(),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: CustomeWidget().imageList,
              ),
            ],
          ),
          const SizedBox(height: 18),
          /// Skills Section
          _buildSectionHeader("Skills"),
          CustomeWidget().skillsDetails(),
          const SizedBox(height: 18),
          /// Projects Section
          _buildSectionHeader("Projects"),
          ProjectCardWidget(context: context),
        ],
      ),
    );
  }

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
