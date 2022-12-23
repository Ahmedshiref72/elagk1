import 'package:elagk_pharmacy/user_directory/auth/cubit/register_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/network/dio_helper.dart';
import '../data/models/login_user_model.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit(): super(RegisterInitialState());

  static  RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;


  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String firstName,
    required String  lastName,
    required String  roles,
    required String username

  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data:{
        'firstName':firstName,
        'email':email,
        'password':password,
        'phone':phone,
        'lastName':lastName,
        'username':username,
        'roles':roles,

      },
    ).then((value) {
      print(value.data);
      loginModel= LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

}