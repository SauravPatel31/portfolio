import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:portfolio/utils/custome_widget.dart';
import 'package:portfolio/utils/styling.dart';

class ProjectCardWidget extends StatefulWidget {
  final BuildContext context;
  final VoidCallback? callbackAction;

  const ProjectCardWidget({
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
    final List<Map<String, dynamic>> visibleProjects = showAllProjects ? CustomeWidget().projects : CustomeWidget().projects.take(3).toList(); // Initially display only 3 cards
    return Column(
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
              return Container(
                decoration: BoxDecoration(
                  color: eachProject['color'],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image(
                        image: AssetImage(eachProject['projectImage']),
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        eachProject['projectName'],
                        style: myTextStyle18(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        eachProject['projectDescription'],
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: myTextStyle15(myFontweight: FontWeight.normal),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 12,
                      color: Colors.deepPurple,
                      child: AnimatedButton(
                        animationDuration: const Duration(seconds: 1),
                        onPress: () {
                          CustomeWidget().launchURL(eachProject['projectLink']);
                        },
                        height: 45,
                        text: 'Show Project',
                        selectedTextColor: Colors.black,
                        backgroundColor: Colors.black,
                        animatedOn: AnimatedOn.onHover,
                        isReverse: true,
                        transitionType: TransitionType.CENTER_ROUNDER,
                        textStyle: myTextStyle15(
                          myFontweight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        if (!showAllProjects && CustomeWidget().projects.length > 3) // Show button only if more projects exist
          ElevatedButton(
            onPressed: () {
              setState(() {
                showAllProjects = true; // Trigger animation to expand
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Show More',
              style: myTextStyle15(
                color: Colors.white,
                myFontweight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
