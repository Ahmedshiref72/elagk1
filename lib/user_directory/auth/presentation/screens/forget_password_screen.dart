import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:elagk_pharmacy/core/utils/text_field_validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/MainTextFormField.dart';
import '../components/auth_title_subtitle_widget.dart';
import '../components/logo_widget.dart';
import '../components/screen_background.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
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
                        authTitle: AppStrings.isForgotPassword,
                        authSubtitle: AppStrings.sendingVerificationCode,
                      ),
                      MainTextFormField(
                        controller: _emailController,
                        label: AppStrings.currentLoggedInEmail,
                        hint: AppStrings.emailExample,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.emailAddress,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) => validateEmail(value),
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      // BlocBuilder<PasswordBloc, PasswordState>(
                      //   builder: (BuildContext context, state) {
                      //     switch(state.forgetPasswordButtonState){
                      //       case ButtonState.loading:
                      //         return const Center(
                      //           child: CircularProgressIndicator(
                      //             color: AppColors.primary,
                      //           ),
                      //         );
                      //       case ButtonState.static:
                      //       return MainButton(
                      //         title: AppStrings.send,
                      //         onPressed: () {
                      //           if (_formKey.currentState!.validate()) {
                      //             try {
                      //               context.read<PasswordPharmacyCubit>().add(
                      //                 ForgetPasswordEvent(
                      //                   context: context,
                      //                   email: _emailController.text,
                      //                 ),
                      //               );
                      //             } catch (error) {
                      //               debugPrint(error.toString());
                      //             } finally {
                      //               if (state.forgetPassword!.email == _emailController.text) {
                      //                 context.read<PasswordBloc>().add(
                      //                   SendMailEvent(
                      //                     context: context,
                      //                     email: _emailController.text,
                      //                   ),
                      //                 );
                      //               }
                      //             }
                      //           }
                      //         },
                      //       );
                      //     }return Container();
                      //   },
                      // ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppStrings.alreadyHaveAccount,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: ' ${AppStrings.login}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: AppColors.lightGrey,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    navigateTo(
                                      context: context,
                                      screenRoute: Routes.loginUserScreen,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
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
  }
}
