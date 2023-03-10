import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/drawer_widgets/menu_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget homePageAppBar(
  BuildContext context, {
  required String title,
  required Function()? onTap,
  required Widget actionWidget,
}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p5),
          child: InkWell(
            onTap: CacheHelper.getData(key: AppConstants.token) == null
                ? () {
                    // TODO.
                    /*navigateTo(
                      context: context,
                      screenRoute: Routes.makeLoginScreen,
                      arguments: const MakeLoginScreenArguments(title: 'الشراء'),
                    );*/
                  } : onTap,
            child: Container(
              width: AppSize.s40,
              height: AppSize.s40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.offWhite,
                  width: AppSize.s1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s15),
              ),
              child: actionWidget,
            ),
          ),
        ),
      ],
      leading: const MenuWidget(), // TODO.
    );
