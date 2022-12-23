import 'package:elagk_pharmacy/drawer/data/models/pharmacy_user_model.dart';
import 'package:elagk_pharmacy/user_directory/auth/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/dio_helper.dart';
import '../../../core/network/end_points.dart';


class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,

  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data:{
        'email':email,
        'password':password,
      },
    ).then((value) {
      print(value.data);
      loginModel= PharmacyUserModel.fromJson(value.data);


      email =loginModel.data.email.toString();


      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });


  }
}