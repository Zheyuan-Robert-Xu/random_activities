import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//Todo: Add the provider eitherFailureOrActivity.

//import '../provider/random_activity_provider.dart';

import '../widgets/widgets.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'images/water_bg.jpeg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: FittedBox(
                  child: Text(
                    'GO',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          blurRadius: 100.0,
                          color: Colors.black,
                        ),
                      ],
                      fontSize: 1000,
                    ),
                  ),
                ),
              ),
              CustomElevatedButtonWidget(
                buttonColor: Colors.white,
                textColor: Colors.black,
                iconColor: Colors.orangeAccent,
                callback: () {
                  //Todo: Add the provider eitherFailureOrActivity.

                  //Provider.of<RandomActivityProvider>(context, listen: false)

                  //    .eitherFailureOrActivity();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SkeletonWidget(),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
