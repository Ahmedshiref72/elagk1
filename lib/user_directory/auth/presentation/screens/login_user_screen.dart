import 'package:elagk_pharmacy/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk_pharmacy/auth/presentation/components/screen_background.dart';
import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:elagk_pharmacy/core/utils/text_field_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../opening/presentation/screens/splash_screen.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/states.dart';
import '../components/auth_title_subtitle_widget.dart';
import '../components/logo_widget.dart';
import '../components/toast.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool inProgress=false;
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          inProgress = true;
        } else {
          inProgress = false;
        }

        if (state is LoginSuccessState) {
          showToast(text: 'Login Successfully', state: ToastStates.SUCCESS);
          navigateFinalTo(
            context:context,
            screenRoute: Routes.homeDrawerScreen,
          );
        }
        if (state is LoginErrorState) {
          showToast(text: '${state.error}', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              body: ScreenBackground(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppPadding.p15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LogoWidget(),
                          const AuthTitleAndSubtitle(
                            authTitle: AppStrings.login,
                            authSubtitle: AppStrings.pleaseLogin,
                          ),
                          MainTextFormField(
                            controller: _emailController,
                            label: AppStrings.userName,
                            hint: AppStrings.emailExample,
                            hintColor: AppColors.lightGrey,
                            inputType: TextInputType.emailAddress,
                            textDirection: TextDirection.ltr,
                            obscure: false,
                            validator: (value) => validateEmail(value!),
                          ),
                          SizedBox(
                              height: mediaQueryHeight(context) / AppSize.s30),
                          MainTextFormField(
                            controller: _passwordController,
                            label: AppStrings.password,
                            hint: AppStrings.passwordExample,
                            hintColor: AppColors.lightGrey,
                            inputType: TextInputType.visiblePassword,
                            textDirection: TextDirection.ltr,
                            obscure: true,
                            validator: (value) {
                              if (value!.length < AppSize.s8) {
                                return AppStrings.enterValidPassword;
                              } else {
                                return null;
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                navigateFinalTo(
                                  context: context,
                                  screenRoute: Routes.forgetPasswordScreen,
                                );
                              },
                              child: Text(
                                AppStrings.forgotPassword,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: AppColors.yellowBold,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: mediaQueryHeight(context) / AppSize.s80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
