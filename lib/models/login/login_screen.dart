// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/components/components.dart';
import 'package:support1/models/home/home_screen.dart';
import 'package:support1/models/login/cubit/login_states.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
        builder: (context,state){
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      defualtField(
                          prefix: Icon(Icons.person),
                          userController: userController,
                          label: "username",
                          validator: (String? value){
                            if(value!.isEmpty)
                            return "username must not be empty";
                          }),
                      SizedBox(height: 10,),
                      defualtField(
                        isPassword: cubit.isPassword,
                          suffix:  IconButton(onPressed: (){
                            cubit.showPassword();
                          }, icon:cubit.visible?Icon(Icons.visibility_off_sharp) :Icon(Icons.remove_red_eye)),
                          userController: passwordController,
                          label: "password",
                          validator: (String? value){
                            if(value!.isEmpty)
                              return "password must not be empty";
                          },
                          prefix: Icon(Icons.security)
                      ),
                      SizedBox(height: 20.0,),
                      ConditionalBuilderRec(condition: state is!LoginLoadingState,
                          builder: (context)=>MaterialButton(onPressed: (){
                            if(formKey.currentState!.validate()){
                              cubit.Login(username: userController, password: passwordController);
                            }
                          },
                            child: Text('LOGIN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            height: 50,
                            color: Colors.amber,
                            minWidth: double.infinity,
                          ),
                        fallback: (context)=>Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  )),
            ),
          );
        }, listener: (context,state){
          if(state is LoginSuccessState)
            {
              navigateTo(context, HomeScreen());
            }
    });
  }
}
