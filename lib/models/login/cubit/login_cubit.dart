 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/components/components.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool visible = false;
  bool isPassword = true;
  void showPassword(){
    visible = !visible;
    isPassword = !isPassword;
    emit(LoginChangePasswordIconState());
  }

  void Login({
    required TextEditingController username,
    required TextEditingController password,
})async{
    emit(LoginLoadingState());
    if(username.text=="test"&&password.text=="123456")
      {
        await Future.delayed(Duration(seconds: 3));
        emit(LoginSuccessState());
      }
    else{
      showToast(text: "wrong email or password", color: Colors.red);
      emit(LoginErrorState());
    }
  }
}