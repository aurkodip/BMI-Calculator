import 'package:bmical/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'building_block.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.bmiresult, required this.resultText, required this.interpretation}) : super(key: key);

  final String bmiresult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR'), ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(

            child: 
          Container(padding: const EdgeInsets.all(15),
              child:
          const Text('Your result', style: kTitleTextStyle, textAlign: TextAlign.center,)),
          ),
          Expanded(
              flex: 5,
              child: BuildingBlock(
                rong: kActiveCardColor,
                cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText, style: kResultTextStyle,),
                    Text(bmiresult, style: kBMIResultTextStyle,),
                    Text(interpretation, style: kResultBodyTextStyle, textAlign: TextAlign.center,),




                  ],
              ),
              ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InputPage()),);
            },
            child: Container(
              color: const Color(0xFF20C78C),
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 80.0,
              child: const Center(child: Text('RECALCULATE', style: kLargeButtonTextStyle,)),
            ),
          ),
        ],
      ),
    );
  }
}
