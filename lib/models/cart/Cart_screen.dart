// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/components/components.dart';
import '../home/cubit/cubit.dart';
import '../home/cubit/state.dart';
import '../home/home_screen.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){navigateTo(context, HomeScreen());},icon: Icon(Icons.arrow_back,),),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.amber,
        title: Text("Cart",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
      child: BlocConsumer<HomeCubit,HomeStates>(
          builder: (context,state){
            HomeCubit cubit = HomeCubit.get(context);
            return cubit.savedProducts.isNotEmpty? ListView.builder(
              itemBuilder:(context,index)=> buildCartItems(
                  context: context,
                  onPressed: (){
                    cubit.removeItem(index: index);
                  },
                  onDismiss: (direction){
                   cubit.removeItem(index: index);
                  },
                  products: cubit.savedProducts,
                  index: index
              ),
              itemCount: cubit.savedProducts.length,
            ):Center(child: Text("There is no selected products"),);

          },
          listener: (context,state){}
      ),
      ),
    );
  }
}
