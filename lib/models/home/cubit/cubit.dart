import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support1/models/home/cubit/state.dart';
import '../../../components/products.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialState());

 static HomeCubit get(context)=> BlocProvider.of (context);

List<Products> savedProducts=[];

List<Products> initialProducts =[
  Products(image: "https://dummyjson.com/image/i/products/1/1.jpg",
    id: 1,
    title: "iPhone 9",
    price: 549,
    description: "An apple mobile which is nothing like apple"
),
  Products(image: "https://dummyjson.com/image/i/products/2/1.jpg",
      id: 2,
      title: "iPhone X",
      price: 899,
      description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ..."
  ),
  Products(image: "https://dummyjson.com/image/i/products/3/1.jpg",
      id: 3,
      title: "Samsung Universe 9",
      price: 1249,
      description: "Samsung's new variant which goes beyond Galaxy to the Universe"
  ),
  Products(image: "https://dummyjson.com/image/i/products/4/1.jpg",
      id: 4,
      title: "OPPOF19",
      price: 280,
      description: "OPPO F19 is officially announced on April 2021."
  ),
  Products(image: "https://dummyjson.com/image/i/products/5/2.jpg",
      id: 5,
      title: "Huawei P30",
      price: 499,
      description: "Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK."
  ),
  Products(image: "https://dummyjson.com/image/i/products/6/1.png",
      id: 6,
      title: "MacBook Pro",
      price: 1749,
      description: "MacBook Pro 2021 with mini-LED display may launch between September, November"
  ),
  Products(image: "https://dummyjson.com/image/i/products/7/1.jpg",
      id: 7,
      title: "Samsung Galaxy Book",
      price: 1499,
      description: "Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched"
  ),
  Products(image: "https://dummyjson.com/image/i/products/8/1.jpg",
      id: 8,
      title: "Microsoft Surface Laptop 4",
      price: 1499,
      description: "Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen."
  ),
  Products(image: "https://dummyjson.com/image/i/products/9/1.jpg",
      id: 9,
      title: "Infinix INBOOK",
      price: 1099,
      description: "Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty"
  ),
  Products(image: "https://dummyjson.com/image/i/products/10/1.jpg",
      id: 10,
      title: "HP Pavilion 15-DK1056WM",
      price: 1099,
      description: "HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10"
  ),
];
List<Products> products =[];

void loadProducts()async{
  emit(HomeGetDataLoadingState());
  await Future.delayed(const Duration(seconds: 3));
  products = initialProducts;
  emit(HomeGetDataSuccessState());
}

void removeItem({
  required int index,
}){
  emit(HomeRemoveLoadingState());
  savedProducts.remove(savedProducts.elementAt(index));
  emit(HomeRemoveSuccessState());
}
}

