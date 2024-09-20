import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_assignment4/cart_items.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  List<CartItems> cartItems = [
    CartItems(
        productImage: 'https://i.etsystatic.com/13098966/r/il/dfbcbd/6146488284/il_570xN.6146488284_qj3y.jpg',
        productTitle: 'PullOver',
        color: 'Black',
        size: 'L',
        price: 51),
    CartItems(
        productImage: 'https://i.etsystatic.com/13098966/r/il/dfbcbd/6146488284/il_570xN.6146488284_qj3y.jpg',
        productTitle: 'T-Shirt',
        color: 'Grey',
        size: 'M',
        price: 32),
    CartItems(
        productImage: 'https://i.etsystatic.com/13098966/r/il/dfbcbd/6146488284/il_570xN.6146488284_qj3y.jpg',
        productTitle: 'Sports Dress',
        color: 'White',
        size: 'S',
        price: 78)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar( title:
            Text('Cart'),
            centerTitle: true,
          ),
      body: Column(
      children: [
        Expanded(child: ListView.builder(
            itemCount: cartItems.length,
          itemBuilder: (context, index) {
            var item = cartItems[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Product Image
                    Image.network(
                      item.productImage,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    // Product details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.productTitle,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'Color: ${item.color} ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(item.color),
                              SizedBox(width: 8),
                              Text(
                                'Size: ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(item.size),
                            ]
                          ),
                    // Quantity selector
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: (){
                            onRemoveButton(index);
                          }
                        ),
                        Text(
                          item.quantity.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            onPlusButton(index);
                          }
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    // Price

                  ],

                ),
              ),
                    Column(
                      children: [
                       IconButton(
                           onPressed: (){},
                           icon: Icon(Icons.more_vert)),
                      SizedBox(height: 16,),
                      Text(
                        '\$${item.price * item.quantity}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ])
                  ]
                )
              )
            );

          }
        ),
        ),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   'Total amount:',
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Text(
                   '\$${getTotalAmount()}',
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
        ),
       SizedBox(height: 16,),
       // Row(
       //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       //      children: [
       //        Text(
       //          'Total amount:',
       //          style: TextStyle(
       //            fontSize: 18,
       //            fontWeight: FontWeight.bold,
       //          ),
       //        ),
       //        Text(
       //          '\$$getTotalAmount',
       //          style: TextStyle(
       //            fontSize: 18,
       //            fontWeight: FontWeight.bold,
       //          ),
       //        ),
       //      ],
       //    ),
        ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('Congratulations! Checkout Successful!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'CHECK OUT',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),

      ]
      )
    );

 }

void onPlusButton(index){
    cartItems[index].quantity++;
    setState(() {
    });
 }

  void onRemoveButton(index){
    cartItems[index].quantity--;
    setState(() {
    });
  }

  int getTotalAmount() {
    int total = 0;
    for (var item in cartItems) {
      total += (item.price * item.quantity).toInt();
    }
    return total;
  }

}



