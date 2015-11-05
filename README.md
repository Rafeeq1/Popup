Custom Popup 
============
This is a very simple code to integrate a POPUP like alertview.

The class <b>REPopOverView</b> contains a tableview which is about to show the options .you can change it as your need.


HOW TO USE IT
=============
Drag <b>REPopOverView</b>.h,.m and .xib files into your project.

Confirm the protocol of <b>REPopOverView</b> in which class you are using it. 
This is just to get the callback on what you click over the popup

Create a transfarnt UIView which should cover full screen and paste the below code on any button click / place you want popup


     REPopOverView *repView =
    [[[NSBundle mainBundle] loadNibNamed:@"REPopOverView" owner:self options:nil]objectAtIndex:0];

    repView.center=self.view.center;
    repView.REPDelegate=self;
    
    [repView viewsetupWithHeight:250 withData:data withImages:nil withTitle:@"Share with"];
    
    [transfarntView addSubview:repView];

SCHREEN SHOT
=========

![Alt text](http://g.recordit.co/sqvskt1E9m.gif)
