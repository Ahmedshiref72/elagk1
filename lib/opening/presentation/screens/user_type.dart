import 'package:elagk_pharmacy/auth/presentation/components/auth_title_subtitle_widget.dart';
import 'package:elagk_pharmacy/auth/presentation/components/logo_widget.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/auth/presentation/screens/login_pharmacy_screen.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:flutter/material.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: ScreenBackground(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LogoWidget(),
                    const AuthTitleAndSubtitle(
                      authTitle: AppStrings.login,
                      authSubtitle: '',
                    ),
                    BuildItem(MediaQuery.of(context).size,
                        'user',
                        'كمستخدم',
                        context,
                        Routes.loginUserScreen
                    ),
                    SizedBox(height: 15,),
                    BuildItem(MediaQuery.of(context).size,
                        'pharmacy',
                        'كصيدليه',
                        context,
                        Routes.loginPharmacyScreen
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget BuildItem(size, logoName, text, context,route) => InkWell(
      onTap: ()
      {
        navigateTo(context: context, screenRoute: route);
      },
      child: Container(
        width: size.width * .4,
        height: size.height * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.lightGrey.withOpacity(.4),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/images/login/${logoName}.png',
              ),
              width: size.width * .27,
              height: size.height * .1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${text}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
