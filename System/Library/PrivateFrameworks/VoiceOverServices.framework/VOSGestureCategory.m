@implementation VOSGestureCategory

+ (VOSGestureCategory)oneFingerTaps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture OneFingerSingleTap](VOSGesture, "OneFingerSingleTap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture OneFingerDoubleTap](VOSGesture, "OneFingerDoubleTap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture OneFingerTripleTap](VOSGesture, "OneFingerTripleTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture OneFingerQuadrupleTap](VOSGesture, "OneFingerQuadrupleTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.OneFingerTaps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)twoFingerTaps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  VOSGestureCategory *v10;
  void *v11;
  VOSGestureCategory *v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerSingleTap](VOSGesture, "TwoFingerSingleTap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSGesture TwoFingerDoubleTap](VOSGesture, "TwoFingerDoubleTap", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  +[VOSGesture TwoFingerTripleTap](VOSGesture, "TwoFingerTripleTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  +[VOSGesture TwoFingerQuadrupleTap](VOSGesture, "TwoFingerQuadrupleTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v5;
  +[VOSGesture TwoDistantFingerSingleTap](VOSGesture, "TwoDistantFingerSingleTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v6;
  +[VOSGesture TwoDistantFingerDoubleTap](VOSGesture, "TwoDistantFingerDoubleTap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v7;
  +[VOSGesture TwoDistantFingerTripleTap](VOSGesture, "TwoDistantFingerTripleTap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerTaps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v10, "initWithGestures:localizedCategoryName:", v9, v11);

  return v12;
}

+ (VOSGestureCategory)threeFingerTaps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture ThreeFingerSingleTap](VOSGesture, "ThreeFingerSingleTap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture ThreeFingerDoubleTap](VOSGesture, "ThreeFingerDoubleTap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture ThreeFingerTripleTap](VOSGesture, "ThreeFingerTripleTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture ThreeFingerQuadrupleTap](VOSGesture, "ThreeFingerQuadrupleTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.ThreeFingerTaps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)fourFingerTaps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture FourFingerSingleTap](VOSGesture, "FourFingerSingleTap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture FourFingerDoubleTap](VOSGesture, "FourFingerDoubleTap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture FourFingerTripleTap](VOSGesture, "FourFingerTripleTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture FourFingerQuadrupleTap](VOSGesture, "FourFingerQuadrupleTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.FourFingerTaps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)fiveFingerTaps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture FiveFingerSingleTap](VOSGesture, "FiveFingerSingleTap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture FiveFingerDoubleTap](VOSGesture, "FiveFingerDoubleTap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture FiveFingerTripleTap](VOSGesture, "FiveFingerTripleTap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture FiveFingerQuadrupleTap](VOSGesture, "FiveFingerQuadrupleTap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.FiveFingerTaps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)oneFingerFlicks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture OneFingerFlickLeft](VOSGesture, "OneFingerFlickLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture OneFingerFlickRight](VOSGesture, "OneFingerFlickRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture OneFingerFlickUp](VOSGesture, "OneFingerFlickUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture OneFingerFlickDown](VOSGesture, "OneFingerFlickDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.OneFingerSwipes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)twoFingerFlicks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerFlickLeft](VOSGesture, "TwoFingerFlickLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture TwoFingerFlickRight](VOSGesture, "TwoFingerFlickRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture TwoFingerFlickUp](VOSGesture, "TwoFingerFlickUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture TwoFingerFlickDown](VOSGesture, "TwoFingerFlickDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerSwipes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)threeFingerFlicks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture ThreeFingerFlickLeft](VOSGesture, "ThreeFingerFlickLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture ThreeFingerFlickRight](VOSGesture, "ThreeFingerFlickRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture ThreeFingerFlickUp](VOSGesture, "ThreeFingerFlickUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture ThreeFingerFlickDown](VOSGesture, "ThreeFingerFlickDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.ThreeFingerSwipes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)fourFingerFlicks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture FourFingerFlickLeft](VOSGesture, "FourFingerFlickLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture FourFingerFlickRight](VOSGesture, "FourFingerFlickRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture FourFingerFlickUp](VOSGesture, "FourFingerFlickUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture FourFingerFlickDown](VOSGesture, "FourFingerFlickDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.FourFingerSwipes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)twoFingerRotates
{
  void *v2;
  void *v3;
  void *v4;
  VOSGestureCategory *v5;
  void *v6;
  VOSGestureCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerRotateCounterclockwise](VOSGesture, "TwoFingerRotateCounterclockwise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  +[VOSGesture TwoFingerRotateClockwise](VOSGesture, "TwoFingerRotateClockwise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerRotate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v5, "initWithGestures:localizedCategoryName:", v4, v6);

  return v7;
}

+ (VOSGestureCategory)twoFingerScrubs
{
  void *v2;
  void *v3;
  VOSGestureCategory *v4;
  void *v5;
  VOSGestureCategory *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerScrub](VOSGesture, "TwoFingerScrub");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerScrub"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v4, "initWithGestures:localizedCategoryName:", v3, v5);

  return v6;
}

+ (VOSGestureCategory)twoFingerPinches
{
  void *v2;
  void *v3;
  VOSGestureCategory *v4;
  void *v5;
  VOSGestureCategory *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerPinch](VOSGesture, "TwoFingerPinch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerPinch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v4, "initWithGestures:localizedCategoryName:", v3, v5);

  return v6;
}

+ (VOSGestureCategory)oneFingerTapAndHolds
{
  void *v2;
  void *v3;
  void *v4;
  VOSGestureCategory *v5;
  void *v6;
  VOSGestureCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture OneFingerSingleTapAndHold](VOSGesture, "OneFingerSingleTapAndHold");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  +[VOSGesture OneFingerDoubleTapAndHold](VOSGesture, "OneFingerDoubleTapAndHold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.OneFingerTapAndHold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v5, "initWithGestures:localizedCategoryName:", v4, v6);

  return v7;
}

+ (VOSGestureCategory)twoFingerTapAndHolds
{
  void *v2;
  void *v3;
  void *v4;
  VOSGestureCategory *v5;
  void *v6;
  VOSGestureCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerSingleTapAndHold](VOSGesture, "TwoFingerSingleTapAndHold");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  +[VOSGesture TwoFingerDoubleTapAndHold](VOSGesture, "TwoFingerDoubleTapAndHold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerTapAndHold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v5, "initWithGestures:localizedCategoryName:", v4, v6);

  return v7;
}

+ (VOSGestureCategory)threeFingerTapAndHolds
{
  void *v2;
  void *v3;
  void *v4;
  VOSGestureCategory *v5;
  void *v6;
  VOSGestureCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture ThreeFingerSingleTapAndHold](VOSGesture, "ThreeFingerSingleTapAndHold");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  +[VOSGesture ThreeFingerDoubleTapAndHold](VOSGesture, "ThreeFingerDoubleTapAndHold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.ThreeFingerTapAndHold"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v5, "initWithGestures:localizedCategoryName:", v4, v6);

  return v7;
}

+ (VOSGestureCategory)threeFingerDoubleTapHoldAndFlicks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickUp](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickUp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickLeft](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickLeft");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickDown](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickDown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture ThreeFingerDoubleTapHoldAndFlickRight](VOSGesture, "ThreeFingerDoubleTapHoldAndFlickRight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.ThreeFingerDoubleTapHoldAndFlick"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)oneFingerSplitFlicks
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VOSGestureCategory *v7;
  void *v8;
  VOSGestureCategory *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture OneFingerSplitFlickLeft](VOSGesture, "OneFingerSplitFlickLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[VOSGesture OneFingerSplitFlickRight](VOSGesture, "OneFingerSplitFlickRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[VOSGesture OneFingerSplitFlickUp](VOSGesture, "OneFingerSplitFlickUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[VOSGesture OneFingerSplitFlickDown](VOSGesture, "OneFingerSplitFlickDown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.OneFingerSplitSwipes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v7, "initWithGestures:localizedCategoryName:", v6, v8);

  return v9;
}

+ (VOSGestureCategory)twoFingerSplitFlicks
{
  void *v2;
  void *v3;
  void *v4;
  VOSGestureCategory *v5;
  void *v6;
  VOSGestureCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  +[VOSGesture TwoFingerSplitFlickLeft](VOSGesture, "TwoFingerSplitFlickLeft");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  +[VOSGesture TwoFingerSplitFlickRight](VOSGesture, "TwoFingerSplitFlickRight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.TwoFingerSplitSwipes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v5, "initWithGestures:localizedCategoryName:", v4, v6);

  return v7;
}

+ (VOSGestureCategory)backTaps
{
  void *v2;
  void *v3;
  void *v4;
  VOSGestureCategory *v5;
  void *v6;
  VOSGestureCategory *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (AXDeviceSupportsBackTap())
  {
    +[VOSGesture BackTapDoubleTap](VOSGesture, "BackTapDoubleTap");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v2;
    +[VOSGesture BackTapTripleTap](VOSGesture, "BackTapTripleTap");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  v5 = [VOSGestureCategory alloc];
  VOSLocString(CFSTR("VOSGestureCategory.BackTap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](v5, "initWithGestures:localizedCategoryName:", v4, v6);

  return v7;
}

+ (NSArray)allCategories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[20];

  v24[18] = *MEMORY[0x24BDAC8D0];
  +[VOSGestureCategory oneFingerTaps](VOSGestureCategory, "oneFingerTaps");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v23;
  +[VOSGestureCategory twoFingerTaps](VOSGestureCategory, "twoFingerTaps");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v22;
  +[VOSGestureCategory threeFingerTaps](VOSGestureCategory, "threeFingerTaps");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v21;
  +[VOSGestureCategory fourFingerTaps](VOSGestureCategory, "fourFingerTaps");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v20;
  +[VOSGestureCategory fiveFingerTaps](VOSGestureCategory, "fiveFingerTaps");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v19;
  +[VOSGestureCategory oneFingerFlicks](VOSGestureCategory, "oneFingerFlicks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v18;
  +[VOSGestureCategory twoFingerFlicks](VOSGestureCategory, "twoFingerFlicks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v17;
  +[VOSGestureCategory threeFingerFlicks](VOSGestureCategory, "threeFingerFlicks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v16;
  +[VOSGestureCategory fourFingerFlicks](VOSGestureCategory, "fourFingerFlicks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v15;
  +[VOSGestureCategory twoFingerRotates](VOSGestureCategory, "twoFingerRotates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v14;
  +[VOSGestureCategory twoFingerScrubs](VOSGestureCategory, "twoFingerScrubs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v2;
  +[VOSGestureCategory twoFingerPinches](VOSGestureCategory, "twoFingerPinches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v3;
  +[VOSGestureCategory oneFingerTapAndHolds](VOSGestureCategory, "oneFingerTapAndHolds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v4;
  +[VOSGestureCategory twoFingerTapAndHolds](VOSGestureCategory, "twoFingerTapAndHolds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v5;
  +[VOSGestureCategory threeFingerTapAndHolds](VOSGestureCategory, "threeFingerTapAndHolds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v6;
  +[VOSGestureCategory threeFingerDoubleTapHoldAndFlicks](VOSGestureCategory, "threeFingerDoubleTapHoldAndFlicks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v7;
  +[VOSGestureCategory oneFingerSplitFlicks](VOSGestureCategory, "oneFingerSplitFlicks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v8;
  +[VOSGestureCategory twoFingerSplitFlicks](VOSGestureCategory, "twoFingerSplitFlicks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (AXDeviceSupportsBackTap())
  {
    +[VOSGestureCategory backTaps](VOSGestureCategory, "backTaps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  return (NSArray *)v10;
}

- (VOSGestureCategory)initWithGestures:(id)a3 localizedCategoryName:(id)a4
{
  id v6;
  id v7;
  VOSGestureCategory *v8;
  VOSGestureCategory *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOSGestureCategory;
  v8 = -[VOSGestureCategory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[VOSGestureCategory setLocalizedCategoryName:](v8, "setLocalizedCategoryName:", v7);
    -[VOSGestureCategory setGestures:](v9, "setGestures:", v6);
  }

  return v9;
}

- (VOSGestureCategory)init
{
  void *v3;
  VOSGestureCategory *v4;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VOSGestureCategory initWithGestures:localizedCategoryName:](self, "initWithGestures:localizedCategoryName:", v3, &stru_24CBADC48);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VOSGestureCategory gestures](self, "gestures");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gestures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToArray:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VOSGestureCategory gestures](self, "gestures", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 ^= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[VOSGestureCategory gestures](self, "gestures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (BOOL)isFlickGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "oneFingerFlicks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsGesture:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "twoFingerFlicks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsGesture:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(a1, "threeFingerFlicks");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsGesture:", v4) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(a1, "fourFingerFlicks");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "containsGesture:", v4);

      }
    }

  }
  return v6;
}

+ (BOOL)isTapGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "oneFingerTaps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsGesture:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "twoFingerTaps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsGesture:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(a1, "threeFingerTaps");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsGesture:", v4) & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(a1, "fourFingerTaps");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsGesture:", v4) & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          objc_msgSend(a1, "fiveFingerTaps");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v10, "containsGesture:", v4);

        }
      }

    }
  }

  return v6;
}

+ (BOOL)isRotateGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "twoFingerRotates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsGesture:", v4);

  return v6;
}

+ (BOOL)isScrubGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "twoFingerScrubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsGesture:", v4);

  return v6;
}

+ (BOOL)isTapAndHoldGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "oneFingerTapAndHolds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsGesture:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "twoFingerTapAndHolds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsGesture:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(a1, "threeFingerTapAndHolds");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "containsGesture:", v4);

    }
  }

  return v6;
}

+ (BOOL)isSplitFlickGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "oneFingerSplitFlicks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsGesture:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "twoFingerSplitFlicks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsGesture:", v4);

  }
  return v6;
}

- (NSArray)gestures
{
  return self->_gestures;
}

- (void)setGestures:(id)a3
{
  objc_storeStrong((id *)&self->_gestures, a3);
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCategoryName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);
  objc_storeStrong((id *)&self->_gestures, 0);
}

@end
