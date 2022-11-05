  // ignore_for_file: prefer_const_constructors

  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:conditional_builder_rec/conditional_builder_rec.dart';
  import '../../components/components.dart';
import '../cart/Cart_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return BlocConsumer<HomeCubit,HomeStates>
        (
          builder: (context,state){
            HomeCubit cubit = HomeCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: SizedBox(),
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                backgroundColor: Colors.amber,
                title: Text("Salla",
                  style: TextStyle(
                      color: Colors.black
                  ),),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: (){
                    navigateTo(context, CartScreen());
                  },
                      icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                  ),
                ],
              ),
              body: ConditionalBuilderRec(
                condition: state is! HomeGetDataLoadingState,
                builder: (context)=>GridView.count(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 15.0,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 2,
                  children: List.generate(
                    cubit.products.length,
                        (index) => buildGridBook(
                        onPressed: (){
                          cubit.savedProducts.add(cubit.products[index]);
                          showToast(text: 'The product was added successfully', color: Colors.green);
                        },
                        products: cubit.products,
                        index: index,
                    ),
                  ),
                ),
                fallback: (context)=>Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
          listener: (context,state){}
      );
    }
  }
