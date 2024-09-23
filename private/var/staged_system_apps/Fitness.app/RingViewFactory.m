@implementation RingViewFactory

+ (id)workoutRingWithPercent:(double)a3 colors:(id)a4 diameter:(double)a5 thickness:(double)a6
{
  return +[RingViewFactory workoutRingWithPercent:colors:diameter:thickness:renderer:](RingViewFactory, "workoutRingWithPercent:colors:diameter:thickness:renderer:", a4, 0, a3, a5, a6);
}

+ (id)workoutRingWithPercent:(double)a3 colors:(id)a4 diameter:(double)a5 thickness:(double)a6 renderer:(id)a7
{
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a4;
  v11 = objc_msgSend(objc_alloc((Class)ARUIRingGroupController), "initWithNumberOfRings:", 1);
  objc_msgSend(v11, "setPercentage:ofRingAtIndex:animated:", 0, 0, a3);
  *(float *)&v12 = a5;
  objc_msgSend(v11, "setRingDiameter:", v12);
  *(float *)&v13 = a6;
  objc_msgSend(v11, "setRingThickness:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "gradientDarkColor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "gradientLightColor"));

  objc_msgSend(v11, "setTopColor:bottomColor:ofRingAtIndex:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIRingsImageFactory renderRingGroupController:withRenderer:](ARUIRingsImageFactory, "renderRingGroupController:withRenderer:", v11, 0));

  return v16;
}

@end
