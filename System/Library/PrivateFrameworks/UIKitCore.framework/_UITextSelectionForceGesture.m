@implementation _UITextSelectionForceGesture

- (_UITextSelectionForceGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  _UITextSelectionForceGesture *v4;
  _UITextSelectionForceGesture *v5;
  UIKBPanGestureVelocitySample *v6;
  UIKBPanGestureVelocitySample *velocitySample;
  UIKBPanGestureVelocitySample *v8;
  UIKBPanGestureVelocitySample *previousVelocitySample;
  UIKBPanGestureVelocitySample *v10;
  UIKBPanGestureVelocitySample *liftOffSample;
  CGSize v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UITextSelectionForceGesture;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v14, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &unk_1E1A94328);
    -[UIGestureRecognizer setName:](v5, "setName:", CFSTR("com.apple.UIKit.textSelectionForce"));
    -[UILongPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:](v5, "set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:", 1);
    v6 = objc_alloc_init(UIKBPanGestureVelocitySample);
    velocitySample = v5->_velocitySample;
    v5->_velocitySample = v6;

    v8 = objc_alloc_init(UIKBPanGestureVelocitySample);
    previousVelocitySample = v5->_previousVelocitySample;
    v5->_previousVelocitySample = v8;

    v10 = objc_alloc_init(UIKBPanGestureVelocitySample);
    liftOffSample = v5->_liftOffSample;
    v5->_liftOffSample = v10;

    v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v5->_velocityRange.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v5->_velocityRange.size = v12;
    v5->_touchEclipsesVelocity = 0;
  }
  return v5;
}

- (void)enoughTimeElapsed:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[_UITextSelectionForceGesture shouldFailWithoutForce](self, "shouldFailWithoutForce")
    || self && self->super.super._forcePressCount)
  {
    -[_UITextSelectionForceGesture setDidLongPress:](self, "setDidLongPress:", 1);
    v5.receiver = self;
    v5.super_class = (Class)_UITextSelectionForceGesture;
    -[UILongPressGestureRecognizer enoughTimeElapsed:](&v5, sel_enoughTimeElapsed_, v4);
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[_UITextSelectionForceGesture shouldFailWithoutForce](self, "shouldFailWithoutForce");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITextSelectionForceGesture;
    LOBYTE(v3) = -[UIGestureRecognizer _shouldDelayUntilForceLevelRequirementIsMet](&v5, sel__shouldDelayUntilForceLevelRequirementIsMet);
  }
  return v3;
}

- (void)_resetVelocitySamples
{
  void *v3;
  void *v4;
  id v5;

  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetValues");

  -[_UITextSelectionForceGesture _previousVelocitySample](self, "_previousVelocitySample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetValues");

  -[_UITextSelectionForceGesture _liftOffSample](self, "_liftOffSample");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetValues");

}

- (void)reset
{
  objc_super v3;

  -[_UITextSelectionForceGesture setTouchEclipsesVelocity:](self, "setTouchEclipsesVelocity:", 0);
  -[_UITextSelectionForceGesture setVelocityRange:](self, "setVelocityRange:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_UITextSelectionForceGesture setLiftOffState:](self, "setLiftOffState:", 0);
  -[_UITextSelectionForceGesture setIncreasingForceState:](self, "setIncreasingForceState:", 0);
  -[_UITextSelectionForceGesture setIncreasingForceTimestamp:](self, "setIncreasingForceTimestamp:", 0.0);
  -[_UITextSelectionForceGesture setDidLongPress:](self, "setDidLongPress:", 0);
  -[_UITextSelectionForceGesture _resetVelocitySamples](self, "_resetVelocitySamples");
  v3.receiver = self;
  v3.super_class = (Class)_UITextSelectionForceGesture;
  -[UIGestureRecognizer reset](&v3, sel_reset);
}

- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dt");
  if (v8 >= 0.001)
  {
    objc_msgSend(v6, "start");
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v7);
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "end");
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v7);
    v16 = v15;
    v18 = v17 - v12;
    objc_msgSend(v6, "dt");
    v9 = v18 / v19;
    objc_msgSend(v6, "dt");
    v10 = (v16 - v14) / v20;
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v21 = v9;
  v22 = v10;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)velocityInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  -[_UITextSelectionForceGesture _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:", self->_velocitySample, v4);
  v6 = v5;
  v8 = v7;
  -[_UITextSelectionForceGesture _previousVelocitySample](self, "_previousVelocitySample");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dt");
  v11 = v10;

  if (v11 > 0.00000011920929)
  {
    -[_UITextSelectionForceGesture _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:", self->_previousVelocitySample, v4);
    v6 = v6 * 0.25 + v12 * 0.75;
    v8 = v8 * 0.25 + v13 * 0.75;
  }

  v14 = v6;
  v15 = v8;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)_locationOfTouches:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  objc_msgSend(a3, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationInView:", 0);
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (UIOffset)_offsetInViewFromSceneReferenceLocation:(CGPoint)a3 toSceneReferenceLocation:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIOffset result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[UIGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v9, v7, v6);
  v11 = v10;
  v13 = v12;

  -[UIGestureRecognizer view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v14, x, y);
  v16 = v15;
  v18 = v17;

  v19 = v16 - v11;
  v20 = v18 - v13;
  result.vertical = v20;
  result.horizontal = v19;
  return result;
}

- (CGPoint)_shiftPanLocationToNewSceneReferenceLocation:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  -[_UITextSelectionForceGesture _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](self, "_offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:", self->_lastUnadjustedSceneReferenceLocation.x, self->_lastUnadjustedSceneReferenceLocation.y, a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  -[UIGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v8, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  v10 = v9;
  v12 = v11;

  -[UIGestureRecognizer view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v13, v5 + v10, v7 + v12);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result
{
  if (self->_lastSceneReferenceLocation.x != self->_lastUnadjustedSceneReferenceLocation.x
    || self->_lastSceneReferenceLocation.y != self->_lastUnadjustedSceneReferenceLocation.y)
  {
    -[_UITextSelectionForceGesture _shiftPanLocationToNewSceneReferenceLocation:](self, "_shiftPanLocationToNewSceneReferenceLocation:", result.x, result.y);
  }
  return result;
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 physicalTouch:(id)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  -[_UITextSelectionForceGesture _adjustSceneReferenceLocation:](self, "_adjustSceneReferenceLocation:", x, y);
  v11 = v10;
  v13 = v12;
  v14 = a4 - self->_lastTouchTime;
  -[_UITextSelectionForceGesture _previousVelocitySample](self, "_previousVelocitySample");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pullValuesFrom:", v16);

  v17 = self->_lastSceneReferenceLocation.x;
  v18 = self->_lastSceneReferenceLocation.y;
  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStart:", v17, v18);

  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEnd:", v11, v13);

  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDt:", v14);

  objc_msgSend(v9, "force");
  v23 = v22;
  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setForce:", v23);

  objc_msgSend(v9, "majorRadius");
  v26 = v25;

  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMajorRadius:", v26);

  self->_lastUnadjustedSceneReferenceLocation.x = x;
  self->_lastUnadjustedSceneReferenceLocation.y = y;
  self->_lastSceneReferenceLocation.x = v11;
  self->_lastSceneReferenceLocation.y = v13;
  self->_lastTouchTime = a4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[UILongPressGestureRecognizer touches](self, "touches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v13.receiver = self;
  v13.super_class = (Class)_UITextSelectionForceGesture;
  -[UILongPressGestureRecognizer touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, v6, v7);
  if (!v9)
  {
    -[_UITextSelectionForceGesture _locationOfTouches:](self, "_locationOfTouches:", v6);
    self->_lastSceneReferenceLocation.x = v10;
    self->_lastSceneReferenceLocation.y = v11;
    self->_lastUnadjustedSceneReferenceLocation = self->_lastSceneReferenceLocation;
    objc_msgSend(v7, "timestamp");
    self->_lastTouchTime = v12;
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double x;
  double v30;
  double y;
  double width;
  double height;
  void *v34;
  double v35;
  double v36;
  double v37;
  _BOOL8 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  int64_t v44;
  uint64_t v45;
  objc_super v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v6 = a4;
  v7 = a3;
  -[UIGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionForceGesture velocityInView:](self, "velocityInView:", v8);
  v10 = v9;
  v12 = v11;

  v46.receiver = self;
  v46.super_class = (Class)_UITextSelectionForceGesture;
  -[UILongPressGestureRecognizer touchesMoved:withEvent:](&v46, sel_touchesMoved_withEvent_, v7, v6);
  -[_UITextSelectionForceGesture _locationOfTouches:](self, "_locationOfTouches:", v7);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "timestamp");
  v18 = v17;

  objc_msgSend(v7, "anyObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextSelectionForceGesture _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v19, v14, v16, v18);
  if (!self
    || (unint64_t)(self->super.super._state - 1) > 2
    || (*(_QWORD *)&self->super.super._gestureFlags & 0x4000000000000) != 0)
  {
    v20 = floor(v10);
    v21 = floor(v12);
    -[UIGestureRecognizer view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextSelectionForceGesture velocityInView:](self, "velocityInView:", v22);
    v24 = floor(v23);
    v26 = floor(v25);

    -[UIGestureRecognizer view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILongPressGestureRecognizer locationInView:](self, "locationInView:", v27);
    x = v28;
    y = v30;
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (!-[_UITextSelectionForceGesture shouldResetRangeForVelocity:previousVelocity:](self, "shouldResetRangeForVelocity:previousVelocity:", v24, v26, v20, v21))
    {
      -[_UITextSelectionForceGesture velocityRange](self, "velocityRange");
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v49.size.height = height;
      v48 = CGRectUnion(v47, v49);
      x = v48.origin.x;
      y = v48.origin.y;
      width = v48.size.width;
      height = v48.size.height;
    }
    -[_UITextSelectionForceGesture setVelocityRange:](self, "setVelocityRange:", x, y, width, height);
    -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "majorRadius");
    v36 = v35 * 0.3;

    -[_UITextSelectionForceGesture velocityRange](self, "velocityRange");
    if (v37 <= v36)
    {
      -[_UITextSelectionForceGesture velocityRange](self, "velocityRange");
      v38 = v39 <= v36;
    }
    else
    {
      v38 = 0;
    }
    -[_UITextSelectionForceGesture setTouchEclipsesVelocity:](self, "setTouchEclipsesVelocity:", v38);
    -[UIKBPanGestureVelocitySample force](self->_velocitySample, "force");
    v41 = v40;
    -[UIKBPanGestureVelocitySample force](self->_previousVelocitySample, "force");
    v43 = v42;
    v44 = -[_UITextSelectionForceGesture increasingForceState](self, "increasingForceState");
    if (v41 >= v43)
    {
      if (v44)
        return;
      -[_UITextSelectionForceGesture setIncreasingForceTimestamp:](self, "setIncreasingForceTimestamp:", CFAbsoluteTimeGetCurrent());
      v45 = 1;
    }
    else
    {
      if (v44 != 1)
        return;
      v45 = 0;
    }
    -[_UITextSelectionForceGesture setIncreasingForceState:](self, "setIncreasingForceState:", v45);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __double2 v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)_UITextSelectionForceGesture;
  v6 = a4;
  v7 = a3;
  -[UILongPressGestureRecognizer touchesEnded:withEvent:](&v31, sel_touchesEnded_withEvent_, v7, v6);
  -[_UITextSelectionForceGesture _locationOfTouches:](self, "_locationOfTouches:", v7, v31.receiver, v31.super_class);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v6, "timestamp");
  v13 = v12;

  objc_msgSend(v7, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITextSelectionForceGesture _centroidMovedTo:atTime:physicalTouch:](self, "_centroidMovedTo:atTime:physicalTouch:", v14, v9, v11, v13);
  if (-[_UITextSelectionForceGesture liftOffState](self, "liftOffState") == 1)
  {
    -[UIGestureRecognizer view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITextSelectionForceGesture velocityInView:](self, "velocityInView:", v15);
    v17 = v16;
    v19 = v18;

    -[_UITextSelectionForceGesture _liftOffSample](self, "_liftOffSample");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "majorRadius");
    v22 = v21;

    if (v17 * v17 + v19 * v19 >= v22 * v22)
    {
      v23 = atan2(-v19, -v17);
      -[_UITextSelectionForceGesture _liftOffSample](self, "_liftOffSample");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "end");
      v26 = v25;
      v28 = v27;

      v29 = __sincos_stret(v23);
      -[_UITextSelectionForceGesture _liftOffSample](self, "_liftOffSample");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setEnd:", v22 * v29.__cosval * 0.1 + v26, v22 * v29.__sinval * 0.1 + v28);

    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIGestureRecognizer setState:](self, "setState:", 5, a4);
}

- (BOOL)shouldResetRangeForVelocity:(CGPoint)a3 previousVelocity:(CGPoint)a4
{
  long double y;
  long double x;
  double v7;
  double v8;

  y = a3.y;
  x = a3.x;
  if (a4.x == 0.0 && a3.x != 0.0 || a4.y == 0.0 && a3.y != 0.0)
    return 1;
  v7 = atan2(a4.y, a4.x) + 3.14159265 + 3.14159265;
  v8 = atan2(y, x) + 3.14159265 + 3.14159265;
  return v8 >= v7 + 0.785398163 || v8 <= v7 + -0.785398163;
}

- (void)_updateLiftOffState
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  int64_t v9;
  void *v10;
  id v11;

  -[_UITextSelectionForceGesture _velocitySample](self, "_velocitySample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "majorRadius");
  v5 = v4;
  -[_UITextSelectionForceGesture _previousVelocitySample](self, "_previousVelocitySample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "majorRadius");
  v8 = v7;

  v9 = -[_UITextSelectionForceGesture liftOffState](self, "liftOffState");
  if (v9 == 1)
  {
    -[_UITextSelectionForceGesture setLiftOffState:](self, "setLiftOffState:", v5 < v8);
  }
  else if (!v9 && v5 < v8)
  {
    -[_UITextSelectionForceGesture setLiftOffState:](self, "setLiftOffState:", 1);
    -[_UITextSelectionForceGesture _liftOffSample](self, "_liftOffSample");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_UITextSelectionForceGesture _previousVelocitySample](self, "_previousVelocitySample");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pullValuesFrom:", v10);

  }
}

- (CGPoint)_centroidInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGPoint result;

  v4 = a3;
  if (-[_UITextSelectionForceGesture liftOffState](self, "liftOffState") == 1)
  {
    -[_UITextSelectionForceGesture _liftOffSample](self, "_liftOffSample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "end");
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v4);
    v7 = v6;
    v9 = v8;

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UITextSelectionForceGesture;
    -[UILongPressGestureRecognizer _centroidInView:](&v14, sel__centroidInView_, v4);
    v7 = v10;
    v9 = v11;
  }

  v12 = v7;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)forceHasIncreasedForTimeInterval:(double)a3
{
  double Current;
  double v6;

  if (-[_UITextSelectionForceGesture increasingForceState](self, "increasingForceState") != 1
    || -[UIGestureRecognizer currentPreviewForceState](self, "currentPreviewForceState") < 1)
  {
    return 0;
  }
  Current = CFAbsoluteTimeGetCurrent();
  -[_UITextSelectionForceGesture increasingForceTimestamp](self, "increasingForceTimestamp");
  return Current - v6 >= a3;
}

- (UIKBPanGestureVelocitySample)_velocitySample
{
  return (UIKBPanGestureVelocitySample *)objc_getProperty(self, a2, 504, 1);
}

- (UIKBPanGestureVelocitySample)_previousVelocitySample
{
  return (UIKBPanGestureVelocitySample *)objc_getProperty(self, a2, 512, 1);
}

- (UIKBPanGestureVelocitySample)_liftOffSample
{
  return (UIKBPanGestureVelocitySample *)objc_getProperty(self, a2, 520, 1);
}

- (BOOL)shouldFailWithoutForce
{
  return self->_shouldFailWithoutForce;
}

- (void)setShouldFailWithoutForce:(BOOL)a3
{
  self->_shouldFailWithoutForce = a3;
}

- (BOOL)didLongPress
{
  return self->_didLongPress;
}

- (void)setDidLongPress:(BOOL)a3
{
  self->_didLongPress = a3;
}

- (BOOL)touchEclipsesVelocity
{
  return self->_touchEclipsesVelocity;
}

- (void)setTouchEclipsesVelocity:(BOOL)a3
{
  self->_touchEclipsesVelocity = a3;
}

- (double)increasingForceTimestamp
{
  return self->_increasingForceTimestamp;
}

- (void)setIncreasingForceTimestamp:(double)a3
{
  self->_increasingForceTimestamp = a3;
}

- (double)lastTouchTime
{
  return self->_lastTouchTime;
}

- (void)setLastTouchTime:(double)a3
{
  self->_lastTouchTime = a3;
}

- (CGPoint)lastSceneReferenceLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastSceneReferenceLocation.x;
  y = self->_lastSceneReferenceLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastSceneReferenceLocation:(CGPoint)a3
{
  self->_lastSceneReferenceLocation = a3;
}

- (CGPoint)lastUnadjustedSceneReferenceLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastUnadjustedSceneReferenceLocation.x;
  y = self->_lastUnadjustedSceneReferenceLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastUnadjustedSceneReferenceLocation:(CGPoint)a3
{
  self->_lastUnadjustedSceneReferenceLocation = a3;
}

- (int64_t)liftOffState
{
  return self->_liftOffState;
}

- (void)setLiftOffState:(int64_t)a3
{
  self->_liftOffState = a3;
}

- (int64_t)increasingForceState
{
  return self->_increasingForceState;
}

- (void)setIncreasingForceState:(int64_t)a3
{
  self->_increasingForceState = a3;
}

- (CGRect)velocityRange
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_velocityRange.origin.x;
  y = self->_velocityRange.origin.y;
  width = self->_velocityRange.size.width;
  height = self->_velocityRange.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVelocityRange:(CGRect)a3
{
  self->_velocityRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftOffSample, 0);
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
}

@end
