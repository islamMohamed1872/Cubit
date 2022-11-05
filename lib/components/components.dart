// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:support1/components/products.dart';

Widget buildGridBook({
  required List<Products> products,
  required int index,
  required VoidCallback onPressed,
 }) =>
    InkWell(
       child: Card(
        elevation: 10.0,
        child:   Padding(
          padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(products[index].image),
              width: double.infinity,
              fit: BoxFit.cover,
              height: 210.0,
            ),
            SizedBox(height: 5,),
            Text(
              products[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            Text(
              "${products[index].price} \$",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
              ),
            ),
            Center(
              child:MaterialButton(
                minWidth: double.infinity,
                color: Colors.amber,
                onPressed: onPressed,
                child: Text("Add to cart"),
              )
              ,
            )
          ],
        ),
        ),
      ),
    );

void navigateTo(context, Widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => Widget,
  ),
);

void showToast({
   required String text,
  required Color color,
 }) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );

Widget buildCartItems({
  required List<Products> products,
  required int index,
  required DismissDirectionCallback onDismiss,
  required GestureTapCallback onPressed,
  required context,
}) =>Dismissible(
  key: Key(products[index].id.toString()),
  onDismissed: onDismiss,
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child:Image.network(products[index].image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(products[index].description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey
                  ),
                ),
              ],
            ),
            ),
            SizedBox(width: 10,),
            Column(
              children: [
                InkWell(
                  onTap: onPressed,
                  child: Icon(Icons.remove_shopping_cart_outlined,color: Colors.red,),
                ),
                Text("${products[index].price} \$",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    ),
);

Widget defualtField({
  required TextEditingController userController,
  required String label,
  required FormFieldValidator<String> validator,
  required Icon prefix,
  IconButton? suffix ,
  bool isPassword = false,
  TextInputType textInputType = TextInputType.name,
})=>TextFormField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    prefixIcon: prefix,
    suffixIcon: suffix,
    labelText: label,
  ),
  validator: validator,
  controller: userController,
  obscureText: isPassword,
  keyboardType: textInputType,
);
