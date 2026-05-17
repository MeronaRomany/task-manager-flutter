
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset("assets/images/undraw_Sign_up_n6im.png"),
              const SizedBox(height: 50,),
              const Text("Discover Your \n Dream Jop here" , style:
                TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,
                  color: Color(0xff5D0E41),
                )
                ,),

              const SizedBox(height: 20,),
              const Text("Explere all the existing job roles  based on \n your "
                  "interset and study major " , style:
                TextStyle(fontSize: 18,
                ),

              ),

            const Spacer(flex: 2,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 MaterialButton(onPressed: (){
                   Navigator.pushNamed(context,  'SignIn');
                 },color: const Color(0xff5D0E41),
                 textColor: Colors.white,
                 child:
               const Text("Log in" ,style:
               TextStyle(fontSize: 20,
                 fontWeight: FontWeight.bold,),),
             ),
               TextButton(onPressed: (){
                 Navigator.pushNamed(context,  'SignUp');
               }, child:
               const Text("Register" ,style:
               TextStyle(fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Color(0xff5D0E41),
                 ),),
               ),
               ],),
            Spacer(flex: 1,),
            ]
          ),
        ),

      ),
    );
  }
}
