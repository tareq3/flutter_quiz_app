import 'package:flutter/material.dart';
import 'package:flutter_app_destini/story.dart';
import 'package:flutter_app_destini/story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  StoryBrain _storyBrain;
  Story _firstStory;

  var storyRunning=0;


  nextStoryLoad(int choice){
   if(choice==1 &&  storyRunning==0){
     storyRunning=2;
   }else if(choice ==2 && storyRunning ==0){
     storyRunning=1;
   }
    getStory(storyRunning);
  }

   getStory(int storyNo){
     setState(() {
       _firstStory=_storyBrain.getStory(storyNo);
     });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  _storyBrain=new StoryBrain();
    getStory(storyRunning);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage (
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    '${_firstStory.storyTitle}',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    nextStoryLoad(1);
                  },
                  color: Colors.red,
                  child: Text(
                    //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                    '${_firstStory.choice1}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: FlatButton(
                  onPressed: () {
                    //Choice 2 made by user.
                    //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                    nextStoryLoad(2);
                  },
                  color: Colors.blue,
                  child: Text(
                    //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                    '${_firstStory.choice2}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

