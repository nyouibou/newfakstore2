// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:newfakstore/presentation/homescreen/controller/homescreencontroller.dart';
// import 'package:provider/provider.dart';

// class Cartscreen extends StatelessWidget {
//   const Cartscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final homescreenProvider = Provider.of<HomeScreenController>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//       ),
//       body: ListView.builder(
//         itemCount: homescreenProvider.productlist.length,
//         itemBuilder: (context, index) => Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           width: MediaQuery.sizeOf(context).width,
//           decoration: BoxDecoration(),
//           child: Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           homescreenProvider.productlist[index].image ?? "")),
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             homescreenProvider.productlist[index].title ?? "",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(homescreenProvider.productlist[index].category ?? ""),
//                     Text(
//                       "\$${homescreenProvider.productlist[index].price ?? ""}",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           decoration: BoxDecoration(
//                               border: Border.all(color: Colors.blue),
//                               borderRadius: BorderRadius.circular(100)),
//                           child: Row(
//                             children: [
//                               Icon(Icons.remove),
//                               SizedBox(width: 10),
//                               Text("1"),
//                               SizedBox(width: 10),
//                               Icon(Icons.add),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:newfakstore/presentation/homescreen/controller/homescreencontroller.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    final homescreenProvider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: homescreenProvider.myBox.length,
        itemBuilder: (context, index) {
          var product = homescreenProvider.myBox.getAt(index);
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product['img'] ??
                          ""), // Adjust this to match your data structure
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['title'] ??
                            "", // Adjust this to match your data structure
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "\$${product['price'] ?? ""}", // Adjust this to match your data structure
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              // Call the deleteData method when the "Remove" button is tapped
                              homescreenProvider.deleteData(index);
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Text("Remove"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
