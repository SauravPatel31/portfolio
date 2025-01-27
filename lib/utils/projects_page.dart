import 'package:flutter/material.dart';

import 'package:portfolio/utils/custome_widget.dart';
import 'package:portfolio/utils/styling.dart';

class ProjectCardWidget extends StatefulWidget {
  final BuildContext context;
  final VoidCallback? callbackAction;

  ProjectCardWidget({
    required this.context,
    this.callbackAction,
    Key? key,
  }) : super(key: key);

  @override
  _ProjectCardWidgetState createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget>
    with SingleTickerProviderStateMixin {
  bool showAllProjects = false;

  @override
  Widget build(BuildContext context) {
    // Determine visible projects
    final List<Map<String, dynamic>> visibleProjects = showAllProjects ? CustomWidget().projects : CustomWidget().projects.take(4).toList(); // Initially display only 3 cards
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 450,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.58,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            children: visibleProjects.map((eachProject) {
              return Card(
                elevation: 10,
                shadowColor:eachProject['color'],
                child: Container(
                  decoration: BoxDecoration(
                    color:Theme.of(context).brightness==Brightness.dark?Colors.black: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ///Project Image
                      Expanded(
                        flex:3,
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image(
                            image: AssetImage(eachProject['projectImage']),
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ///Project Name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          eachProject['projectName'],
                          style: myTextStyle20(myFontweight: FontWeight.bold),
                        ),
                      ),
                      ///Project Description
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            eachProject['projectDescription'],
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: myTextStyle15(myFontweight: FontWeight.normal),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ///GitHub Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap:(){
                            CustomWidget().launchURL(eachProject['projectLink']);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: eachProject['color'],
                              boxShadow: [
                                BoxShadow(
                                  color: eachProject['color'],
                                  spreadRadius: 2,
                                  blurRadius: 5,)
                              ],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                  
                            ),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing:10,
                                children: [
                                  Image(image: AssetImage("assets/icons/github-removebg-preview.png"),height: 25,width: 25,),
                                  Text("GitHub",style: myTextStyle15(myFontweight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        if (!showAllProjects && CustomWidget().projects.length > 3) // Show button only if more projects exist
          TextButton(
            onPressed: () {
              setState(() {
                showAllProjects = true; // Trigger animation to expand
              });
            },
            child: Text('Show More',style: myTextStyle15(myFontweight: FontWeight.bold,),
            ),
          ),
      ],
    );
  }
}
/*
onPress: () {
CustomeWidget().launchURL(eachProject['projectLink']);
},*/
