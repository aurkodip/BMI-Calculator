import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'building_block.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';



enum Gender {male, female}

class InputPage extends StatefulWidget {
  const InputPage({super.key});


  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: BuildingBlock(
                  rong: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: const IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',), onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                },
                ),
              ),
              Expanded(
                child: BuildingBlock(
                  rong: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                  cardChild: const IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',), onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                ),
              ),
            ],
          )),
          Expanded(
              child: BuildingBlock(
                rong: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                        style: kNumberTextStyle,
                        ),
                        const Text(' cm', style: kLabelTextStyle,),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 25),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 300,
                          activeColor: Colors.greenAccent,
                          inactiveColor: Colors.blueGrey,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          }
                          ),
                    ),
                  ],

                ),
                onPress: () {  },)),
          Expanded(child: Row(
            children: [
              Expanded(
                  child: BuildingBlock(
                    rong: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },),
                            const SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                              setState(() {
                                weight++;
                              }
                              );
                            },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
              Expanded(
                  child: BuildingBlock(
                    rong: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },),
                            const SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                              setState(() {
                                age++;
                              }
                              );
                            },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiresult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),),),
              );
            },
            child: Container(
              color: const Color(0xFF20C78C),
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 80.0,
              child: const Center(child: Text('CALCULATE', style: kLargeButtonTextStyle,)),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: Colors.grey,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}