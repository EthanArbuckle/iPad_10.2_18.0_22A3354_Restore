@implementation THGuidedPanPageWell

- (double)weightWithMovement:(CGPoint)a3 proposedLocation:(id)a4 controller:(id)a5
{
  return 1.0;
}

- (id)contentLocationWithMovement:(CGPoint)a3 controller:(id)a4
{
  return 0;
}

- (id)contentAnimationToFocalPointFromLocation:(id)a3 withMovement:(CGPoint)a4 velocity:(CGPoint)a5 controller:(id)a6
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  TSDContentLocation *v16;
  id v17;
  double v18;
  NSNumber *v19;
  double v20;

  objc_msgSend(-[THGuidedPanPageWell guidedPanTargetWithController:location:](self, "guidedPanTargetWithController:location:", a6, a3, a4.x, a4.y, a5.x, a5.y), "guidedPanTargetUnscaledRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (objc_msgSend(a6, "delegate"))
    objc_msgSend(objc_msgSend(a6, "delegate"), "guidedPanZoomedOutViewScale");
  else
    objc_msgSend(a6, "viewScaleForUnscaledRect:forPage:", 1, v9, v11, v13, v15);
  v16 = +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", TSDCenterOfRect(v9, v11, v13, v15));
  v17 = +[TSDContentPathAnimation animation](TSDContentPathAnimation, "animation");
  objc_msgSend(v17, "setContentLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a3, v16, 0));
  objc_msgSend(v17, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut));
  LODWORD(v18) = 0;
  v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18);
  LODWORD(v20) = 1.0;
  objc_msgSend(v17, "setKeyTimes:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v19, +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20), 0));
  objc_msgSend(v17, "setDuration:", 0.300000012);
  return v17;
}

- (int)guidedPanWellRatingWithMovement:(CGPoint)a3 velocity:(CGPoint)a4 controller:(id)a5
{
  return 2;
}

- (id)guidedPanTargetWithController:(id)a3 location:(id)a4
{
  return +[THGuidedPanPageTarget guidedPanTargetForPageAtLocation:controller:](THGuidedPanPageTarget, "guidedPanTargetForPageAtLocation:controller:", a4, a3);
}

- (double)smoothWeight
{
  return self->_smoothWeight;
}

- (void)setSmoothWeight:(double)a3
{
  self->_smoothWeight = a3;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (double)currentBlendedWeight
{
  return self->_currentBlendedWeight;
}

- (void)setCurrentBlendedWeight:(double)a3
{
  self->_currentBlendedWeight = a3;
}

- (double)previousBlendedWeight
{
  return self->_previousBlendedWeight;
}

- (void)setPreviousBlendedWeight:(double)a3
{
  self->_previousBlendedWeight = a3;
}

@end
