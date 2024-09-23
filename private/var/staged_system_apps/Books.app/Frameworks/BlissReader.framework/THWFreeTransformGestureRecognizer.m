@implementation THWFreeTransformGestureRecognizer

- (THWFreeTransformGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  char *v4;
  THWFreeTransformGestureRecognizer *v5;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWFreeTransformGestureRecognizer;
  v4 = -[THWFreeTransformGestureRecognizer initWithTarget:action:](&v8, "initWithTarget:action:", a3, a4);
  v5 = (THWFreeTransformGestureRecognizer *)v4;
  if (v4)
  {
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)(v4 + 88) = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)(v4 + 104) = v6;
    *(_OWORD *)(v4 + 120) = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v4, "setScale:", 1.0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THWFreeTransformGestureRecognizer setTouch1:](self, "setTouch1:", 0);
  -[THWFreeTransformGestureRecognizer setTouch2:](self, "setTouch2:", 0);
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](self, "setUnmovingParentView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer dealloc](&v3, "dealloc");
}

- (void)p_clearDynamicFreeTransformController
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  if (-[THWFreeTransformGestureRecognizer delegate](self, "delegate"))
  {
    v3 = -[THWFreeTransformGestureRecognizer delegate](self, "delegate");
    v5 = objc_opt_class(TSDGestureDispatcher, v4);
    if ((objc_opt_isKindOfClass(v3, v5) & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformGestureRecognizer p_clearDynamicFreeTransformController]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformGestureRecognizer.m"), 78, CFSTR("Expected a the non-nil delegate to be a gesture dispatcher."));
    -[THWFreeTransformGestureRecognizer setFreeTransformDelegate:](self, "setFreeTransformDelegate:", 0);
  }
}

- (double)p_calculateScaleFromLocation1:(CGPoint)a3 location2:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  float v19;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[THWFreeTransformGestureRecognizer initialLocation1](self, "initialLocation1");
  v10 = v9;
  v12 = v11;
  v13 = -[THWFreeTransformGestureRecognizer initialLocation2](self, "initialLocation2");
  v16 = TSDDistance(v13, v10, v12, v14, v15);
  v18 = TSDDistance(v17, v7, v6, x, y) / v16;
  if (-[THWFreeTransformGestureRecognizerDelegate freeTransformGestureRecognizerShouldRubberband:](-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"), "freeTransformGestureRecognizerShouldRubberband:", self))
  {
    v19 = v18;
    return (float)((float)(logf(v19) * 0.25) + 1.0);
  }
  return v18;
}

- (double)p_calculateScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double result;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  -[THWFreeTransformGestureRecognizer previousLocation1](self, "previousLocation1");
  v4 = v3;
  v6 = v5;
  v7 = -[THWFreeTransformGestureRecognizer previousLocation2](self, "previousLocation2");
  v10 = TSDDistance(v7, v4, v6, v8, v9);
  -[THWFreeTransformGestureRecognizer location1](self, "location1");
  v12 = v11;
  v14 = v13;
  v15 = -[THWFreeTransformGestureRecognizer location2](self, "location2");
  v18 = v10 - TSDDistance(v15, v12, v14, v16, v17);
  -[THWFreeTransformGestureRecognizer scale](self, "scale");
  if (v18 != 0.0)
  {
    -[THWFreeTransformGestureRecognizer location1](self, "location1");
    v21 = v20;
    v23 = v22;
    -[THWFreeTransformGestureRecognizer location2](self, "location2");
    -[THWFreeTransformGestureRecognizer p_calculateScaleFromLocation1:location2:](self, "p_calculateScaleFromLocation1:location2:", v21, v23, v24, v25);
  }
  return result;
}

- (double)p_calculateAngleFromLocation1:(CGPoint)a3 location2:(CGPoint)a4
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __n128 v17;
  __n128 v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  __n128 v24;
  __n128 v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[THWFreeTransformGestureRecognizer initialLocation1](self, "initialLocation1");
  v10 = v9;
  v12 = v11;
  -[THWFreeTransformGestureRecognizer initialLocation2](self, "initialLocation2");
  v14 = v13;
  v16 = v15;
  v17.n128_u64[0] = v10;
  v18.n128_u64[0] = v12;
  v19 = TSDSubtractPoints(v17, v18, v14, v16);
  v23 = TSDAngleFromDelta(v20, v21, v19, v22);
  v24.n128_f64[0] = v7;
  v25.n128_f64[0] = v6;
  v26 = TSDSubtractPoints(v24, v25, x, y);
  v30 = TSDAngleFromDelta(v27, v28, v26, v29) - v23;
  if (-[THWFreeTransformGestureRecognizerDelegate freeTransformGestureRecognizerShouldRubberband:](-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"), "freeTransformGestureRecognizerShouldRubberband:", self))return (fmod(v30 + 9.42477796, 6.28318531) + -3.14159265) * 0.5;
  return v30;
}

- (double)p_calculateAngle
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;

  -[THWFreeTransformGestureRecognizer angle](self, "angle");
  v4 = v3;
  -[THWFreeTransformGestureRecognizer location1](self, "location1");
  v6 = v5;
  v8 = v7;
  -[THWFreeTransformGestureRecognizer location2](self, "location2");
  v11 = -[THWFreeTransformGestureRecognizer p_calculateAngleFromLocation1:location2:](self, "p_calculateAngleFromLocation1:location2:", v6, v8, v9, v10);
  v13 = v12;
  v14 = TSDDeltaFromAngle(v11, v4);
  v16 = v15;
  v18 = TSDDeltaFromAngle(v17, v13);
  v22 = TSDAveragePoints(v19, v20, v14, v16, v18, v21);
  return round(TSDAngleFromDelta(v23, v24, v22, v25) * 100.0) / 100.0;
}

- (CGAffineTransform)transformWithScale:(SEL)a3 angle:(double)a4
{
  double x;
  double y;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform *result;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform t1;
  CGAffineTransform t2;

  v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v22;
  v20 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v20;
  x = self->mInitialDelta.x;
  y = self->mInitialDelta.y;
  CGAffineTransformMakeTranslation(&t2, -x, -y);
  *(_OWORD *)&t1.a = v21;
  *(_OWORD *)&t1.c = v22;
  *(_OWORD *)&t1.tx = v20;
  CGAffineTransformConcat(retstr, &t1, &t2);
  CGAffineTransformMakeScale(&v27, a4, a4);
  v11 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v11;
  *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v26, &v27);
  v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeRotation(&v25, a5);
  v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v13;
  *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v26, &v25);
  v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v24, x, y);
  v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v15;
  *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v26, &v24);
  v16 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v23, self->mPreviousTranslation.x, self->mPreviousTranslation.y);
  v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v17;
  *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&t1, &v26, &v23);
  v19 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v19;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  return result;
}

- (void)updateAngle
{
  -[THWFreeTransformGestureRecognizer p_calculateAngle](self, "p_calculateAngle");
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:");
  -[THWFreeTransformGestureRecognizer p_updateTransform](self, "p_updateTransform");
}

- (void)recenterOnTargetWithRectInView:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[THWFreeTransformGestureRecognizer touch1](self, "touch1"))
  {
    if (-[THWFreeTransformGestureRecognizer touch2](self, "touch2"))
    {
      v8 = -[THWFreeTransformGestureRecognizer view](self, "view");
      -[UITouch locationInView:](-[THWFreeTransformGestureRecognizer touch1](self, "touch1"), "locationInView:", v8);
      v10 = v9;
      v12 = v11;
      -[UITouch locationInView:](-[THWFreeTransformGestureRecognizer touch2](self, "touch2"), "locationInView:", v8);
      -[THWFreeTransformGestureRecognizer recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:](self, "recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:", x, y, width, height, v10, v12, v13, v14);
    }
  }
}

- (void)recenterOnTargetWithRectInView:(CGRect)a3 withTouchPoint:(CGPoint)a4 withTouchPoint:(CGPoint)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = TSDAveragePoints(self, a2, a4.x, a4.y, a5.x, a5.y);
  v12 = v11;
  self->mInitialDelta.x = v10 - TSDCenterOfRect(x, y, width, height);
  self->mInitialDelta.y = v12 - v13;
}

- (void)p_updateTransform
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  __n128 v31;
  __n128 v32;
  CGFloat v33;
  CGFloat v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  -[THWFreeTransformGestureRecognizer scale](self, "scale");
  v4 = v3;
  -[THWFreeTransformGestureRecognizer angle](self, "angle");
  v6 = v5;
  -[THWFreeTransformGestureRecognizer location1](self, "location1");
  v8 = v7;
  v10 = v9;
  -[THWFreeTransformGestureRecognizer location2](self, "location2");
  v12 = v11;
  v14 = v13;
  -[THWFreeTransformGestureRecognizer initialLocation1](self, "initialLocation1");
  v16 = v15;
  v18 = v17;
  v19 = -[THWFreeTransformGestureRecognizer initialLocation2](self, "initialLocation2");
  v23 = TSDAveragePoints(v19, v20, v16, v18, v21, v22);
  v25 = v24;
  v28 = TSDAveragePoints(v26, v27, v8, v10, v12, v14);
  v30 = v29;
  -[THWFreeTransformGestureRecognizer setCenterPoint:](self, "setCenterPoint:");
  v31.n128_f64[0] = v28;
  v32.n128_u64[0] = v30;
  self->mPreviousTranslation.x = TSDSubtractPoints(v31, v32, v23, v25);
  self->mPreviousTranslation.y = v33;
  if (-[THWFreeTransformGestureRecognizerDelegate freeTransformGestureRecognizerShouldRubberband:](-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"), "freeTransformGestureRecognizerShouldRubberband:", self))
  {
    self->mPreviousTranslation.x = TSDMultiplyPointScalar(self->mPreviousTranslation.x, self->mPreviousTranslation.y, 0.5);
    self->mPreviousTranslation.y = v34;
  }
  -[THWFreeTransformGestureRecognizer transformWithScale:angle:](self, "transformWithScale:angle:", v4, v6);
  *(_OWORD *)&self->mTransform.a = v35;
  *(_OWORD *)&self->mTransform.c = v36;
  *(_OWORD *)&self->mTransform.tx = v37;
}

- (void)p_tryToBegin
{
  double v3;
  double v4;

  if (!-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformGestureRecognizer p_tryToBegin]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformGestureRecognizer.m"), 197, CFSTR("Attempting to begin with a nil delegate."));
  if (-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate")
    && ((-[THWFreeTransformGestureRecognizerDelegate freeTransformGestureRecognizerShouldAllowPinchDown:](-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"), "freeTransformGestureRecognizerShouldAllowPinchDown:", self) & 1) != 0|| (-[THWFreeTransformGestureRecognizer scale](self, "scale"), v3 >= 1.0))&& ((-[THWFreeTransformGestureRecognizerDelegate freeTransformGestureRecognizerShouldAllowPinchUp:](-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"), "freeTransformGestureRecognizerShouldAllowPinchUp:", self) & 1) != 0|| (-[THWFreeTransformGestureRecognizer scale](self, "scale"), v4 <= 1.0)))
  {
    -[THWFreeTransformGestureRecognizer p_updateTransform](self, "p_updateTransform");
    -[THWFreeTransformGestureRecognizer setState:](self, "setState:", 1);
  }
  else
  {
    -[THWFreeTransformGestureRecognizer p_failWithGestureState:](self, "p_failWithGestureState:", 5);
  }
}

- (void)cancel
{
  -[THWFreeTransformGestureRecognizer p_failWithGestureState:](self, "p_failWithGestureState:", 4);
}

- (void)p_failWithGestureState:(int64_t)a3
{
  -[THWFreeTransformGestureRecognizer setState:](self, "setState:", a3);
  -[THWFreeTransformGestureRecognizer p_clearDynamicFreeTransformController](self, "p_clearDynamicFreeTransformController");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  THWFreeTransformGestureRecognizer *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  UIView *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer touchesBegan:withEvent:](&v28, "touchesBegan:withEvent:");
  if ((unint64_t)objc_msgSend(a3, "count") >= 3)
    goto LABEL_2;
  v9 = objc_msgSend(a4, "allTouches");
  if (objc_msgSend(v9, "count") != (char *)&dword_0 + 2 || -[THWFreeTransformGestureRecognizer state](self, "state"))
  {
    if (-[THWFreeTransformGestureRecognizer state](self, "state") != (char *)&dword_0 + 1
      || objc_msgSend(v9, "containsObject:", -[THWFreeTransformGestureRecognizer touch1](self, "touch1"))
      && (objc_msgSend(v9, "containsObject:", -[THWFreeTransformGestureRecognizer touch2](self, "touch2")) & 1) != 0)
    {
      -[THWFreeTransformGestureRecognizer setState:](self, "setState:", 0);
      return;
    }
    v7 = self;
    v8 = 4;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v9, "allObjects");
  v11 = objc_msgSend(v10, "objectAtIndex:", 0);
  v12 = objc_msgSend(v10, "objectAtIndex:", 1);
  v13 = -[THWFreeTransformGestureRecognizer view](self, "view");
  v14 = objc_msgSend(v13, "superview");
  objc_msgSend(v11, "locationInView:", v14);
  v16 = v15;
  v18 = v17;
  v19 = objc_msgSend(v12, "locationInView:", v14);
  if (!objc_msgSend(objc_msgSend(v14, "hitTest:withEvent:", 0, TSDAveragePoints(v19, v20, v16, v18, v21, v22)), "isDescendantOfView:", v13))
  {
LABEL_2:
    v7 = self;
    v8 = 5;
LABEL_10:
    -[THWFreeTransformGestureRecognizer p_failWithGestureState:](v7, "p_failWithGestureState:", v8);
    return;
  }
  -[THWFreeTransformGestureRecognizer setTouch1:](self, "setTouch1:", v11);
  -[THWFreeTransformGestureRecognizer setTouch2:](self, "setTouch2:", v12);
  v23 = (objc_opt_respondsToSelector(-[THWFreeTransformGestureRecognizer delegate](self, "delegate"), "gestureRecognizerShouldBegin:") & 1) != 0&& !objc_msgSend(-[THWFreeTransformGestureRecognizer delegate](self, "delegate"), "gestureRecognizerShouldBegin:", self)|| -[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate") == 0;
  if (-[THWFreeTransformGestureRecognizer delegate](self, "delegate"))
  {
    v24 = -[THWFreeTransformGestureRecognizer delegate](self, "delegate");
    v26 = objc_opt_class(TSDGestureDispatcher, v25);
    if ((objc_opt_isKindOfClass(v24, v26) & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWFreeTransformGestureRecognizer touchesBegan:withEvent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWFreeTransformGestureRecognizer.m"), 266, CFSTR("Expected a the non-nil delegate to be a gesture dispatcher."));
  }
  if (v23)
  {
    -[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate");
    -[THWFreeTransformGestureRecognizer setTouch1:](self, "setTouch1:", 0);
    -[THWFreeTransformGestureRecognizer setTouch2:](self, "setTouch2:", 0);
    goto LABEL_2;
  }
  v27 = -[THWFreeTransformGestureRecognizer unmovingParentView](self, "unmovingParentView");
  -[THWFreeTransformGestureRecognizer setMovements:](self, "setMovements:", 0);
  objc_msgSend(v11, "locationInView:", v27);
  -[THWFreeTransformGestureRecognizer setInitialLocation1:](self, "setInitialLocation1:");
  objc_msgSend(v12, "locationInView:", v27);
  -[THWFreeTransformGestureRecognizer setInitialLocation2:](self, "setInitialLocation2:");
  -[THWFreeTransformGestureRecognizer initialLocation1](self, "initialLocation1");
  -[THWFreeTransformGestureRecognizer setPreviousLocation1:](self, "setPreviousLocation1:");
  -[THWFreeTransformGestureRecognizer initialLocation2](self, "initialLocation2");
  -[THWFreeTransformGestureRecognizer setPreviousLocation2:](self, "setPreviousLocation2:");
  -[THWFreeTransformGestureRecognizer initialLocation1](self, "initialLocation1");
  -[THWFreeTransformGestureRecognizer setLocation1:](self, "setLocation1:");
  -[THWFreeTransformGestureRecognizer initialLocation2](self, "initialLocation2");
  -[THWFreeTransformGestureRecognizer setLocation2:](self, "setLocation2:");
  -[THWFreeTransformGestureRecognizer p_calculateScale](self, "p_calculateScale");
  -[THWFreeTransformGestureRecognizer setScale:](self, "setScale:");
  -[THWFreeTransformGestureRecognizer p_calculateAngle](self, "p_calculateAngle");
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:");
  if (-[THWFreeTransformGestureRecognizer useGestureViewForReCentering](self, "useGestureViewForReCentering"))
    v27 = (UIView *)-[THWFreeTransformGestureRecognizer view](self, "view");
  objc_msgSend(v11, "locationInView:", v27);
  objc_msgSend(v12, "locationInView:", v27);
  -[UIView bounds](v27, "bounds");
  -[THWFreeTransformGestureRecognizer recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:](self, "recenterOnTargetWithRectInView:withTouchPoint:withTouchPoint:");
  self->mReady = 1;
  if ((-[THWFreeTransformGestureRecognizerDelegate freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:](-[THWFreeTransformGestureRecognizer freeTransformDelegate](self, "freeTransformDelegate"), "freeTransformGestureRecognizerShouldDelayRecognizeUntilScaleChange:", self) & 1) == 0)-[THWFreeTransformGestureRecognizer p_tryToBegin](self, "p_tryToBegin");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7;
  THWFreeTransformGestureRecognizer *v8;
  uint64_t v9;
  double v10;
  objc_super v11;

  v7 = objc_msgSend(a4, "allTouches");
  -[UITouch previousLocationInView:](-[THWFreeTransformGestureRecognizer touch1](self, "touch1"), "previousLocationInView:", -[THWFreeTransformGestureRecognizer unmovingParentView](self, "unmovingParentView"));
  -[THWFreeTransformGestureRecognizer setPreviousLocation1:](self, "setPreviousLocation1:");
  -[UITouch previousLocationInView:](-[THWFreeTransformGestureRecognizer touch2](self, "touch2"), "previousLocationInView:", -[THWFreeTransformGestureRecognizer unmovingParentView](self, "unmovingParentView"));
  -[THWFreeTransformGestureRecognizer setPreviousLocation2:](self, "setPreviousLocation2:");
  -[UITouch locationInView:](-[THWFreeTransformGestureRecognizer touch1](self, "touch1"), "locationInView:", -[THWFreeTransformGestureRecognizer unmovingParentView](self, "unmovingParentView"));
  -[THWFreeTransformGestureRecognizer setLocation1:](self, "setLocation1:");
  -[UITouch locationInView:](-[THWFreeTransformGestureRecognizer touch2](self, "touch2"), "locationInView:", -[THWFreeTransformGestureRecognizer unmovingParentView](self, "unmovingParentView"));
  -[THWFreeTransformGestureRecognizer setLocation2:](self, "setLocation2:");
  -[THWFreeTransformGestureRecognizer p_calculateScale](self, "p_calculateScale");
  -[THWFreeTransformGestureRecognizer setScale:](self, "setScale:");
  -[THWFreeTransformGestureRecognizer p_calculateAngle](self, "p_calculateAngle");
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:");
  if (-[THWFreeTransformGestureRecognizer state](self, "state") || !self->mReady)
  {
    if (-[THWFreeTransformGestureRecognizer state](self, "state") != (char *)&dword_0 + 1
      || objc_msgSend(v7, "containsObject:", -[THWFreeTransformGestureRecognizer touch1](self, "touch1"))
      && (objc_msgSend(v7, "containsObject:", -[THWFreeTransformGestureRecognizer touch2](self, "touch2")) & 1) != 0)
    {
      if (-[THWFreeTransformGestureRecognizer state](self, "state") != (char *)&dword_0 + 1
        && -[THWFreeTransformGestureRecognizer state](self, "state") != (char *)&dword_0 + 2)
      {
        goto LABEL_13;
      }
      -[THWFreeTransformGestureRecognizer setMovements:](self, "setMovements:", (char *)-[THWFreeTransformGestureRecognizer movements](self, "movements") + 1);
      -[THWFreeTransformGestureRecognizer p_updateTransform](self, "p_updateTransform");
      v8 = self;
      v9 = 2;
    }
    else
    {
      v8 = self;
      v9 = 4;
    }
    -[THWFreeTransformGestureRecognizer setState:](v8, "setState:", v9);
    goto LABEL_13;
  }
  -[THWFreeTransformGestureRecognizer scale](self, "scale");
  if (v10 != 1.0)
    -[THWFreeTransformGestureRecognizer p_tryToBegin](self, "p_tryToBegin");
LABEL_13:
  v11.receiver = self;
  v11.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer touchesMoved:withEvent:](&v11, "touchesMoved:withEvent:", a3, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  objc_super v8;

  if (-[THWFreeTransformGestureRecognizer state](self, "state") == (char *)&dword_0 + 2
    || -[THWFreeTransformGestureRecognizer state](self, "state") == (char *)&dword_0 + 1)
  {
    v7 = 3;
  }
  else
  {
    if (objc_msgSend(objc_msgSend(a4, "allTouches"), "count") != (char *)&dword_0 + 1)
      goto LABEL_5;
    v7 = 4;
  }
  -[THWFreeTransformGestureRecognizer setState:](self, "setState:", v7);
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer touchesEnded:withEvent:](&v8, "touchesEnded:withEvent:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  -[THWFreeTransformGestureRecognizer setState:](self, "setState:", 4);
  v7.receiver = self;
  v7.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer touchesCancelled:withEvent:](&v7, "touchesCancelled:withEvent:", a3, a4);
}

- (void)reset
{
  double y;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWFreeTransformGestureRecognizer;
  -[THWFreeTransformGestureRecognizer reset](&v5, "reset");
  -[THWFreeTransformGestureRecognizer setMovements:](self, "setMovements:", 0);
  y = CGPointZero.y;
  -[THWFreeTransformGestureRecognizer setInitialLocation1:](self, "setInitialLocation1:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setInitialLocation2:](self, "setInitialLocation2:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setPreviousLocation1:](self, "setPreviousLocation1:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setPreviousLocation2:](self, "setPreviousLocation2:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setLocation1:](self, "setLocation1:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setLocation2:](self, "setLocation2:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setCenterPoint:](self, "setCenterPoint:", CGPointZero.x, y);
  -[THWFreeTransformGestureRecognizer setScale:](self, "setScale:", 1.0);
  -[THWFreeTransformGestureRecognizer setAngle:](self, "setAngle:", 0.0);
  -[THWFreeTransformGestureRecognizer setTouch1:](self, "setTouch1:", 0);
  -[THWFreeTransformGestureRecognizer setTouch2:](self, "setTouch2:", 0);
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mTransform.c = v4;
  *(_OWORD *)&self->mTransform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  self->mReady = 0;
  -[THWFreeTransformGestureRecognizer p_clearDynamicFreeTransformController](self, "p_clearDynamicFreeTransformController");
  objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSDGestureDelegate, -[THWFreeTransformGestureRecognizer delegate](self, "delegate")), "didReset:", self);
}

- (UITouch)touch1
{
  return self->mTouch1;
}

- (void)setTouch1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UITouch)touch2
{
  return self->mTouch2;
}

- (void)setTouch2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CGPoint)initialLocation1
{
  double x;
  double y;
  CGPoint result;

  x = self->mInitialLocation1.x;
  y = self->mInitialLocation1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocation1:(CGPoint)a3
{
  self->mInitialLocation1 = a3;
}

- (CGPoint)initialLocation2
{
  double x;
  double y;
  CGPoint result;

  x = self->mInitialLocation2.x;
  y = self->mInitialLocation2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocation2:(CGPoint)a3
{
  self->mInitialLocation2 = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].d;
  return self;
}

- (CGPoint)centerPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mCenterPoint.x;
  y = self->mCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCenterPoint:(CGPoint)a3
{
  self->mCenterPoint = a3;
}

- (UIView)unmovingParentView
{
  return self->mUnmovingParentView;
}

- (void)setUnmovingParentView:(id)a3
{
  self->mUnmovingParentView = (UIView *)a3;
}

- (THWFreeTransformGestureRecognizerDelegate)freeTransformDelegate
{
  return self->mFreeTransformDelegate;
}

- (void)setFreeTransformDelegate:(id)a3
{
  self->mFreeTransformDelegate = (THWFreeTransformGestureRecognizerDelegate *)a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

- (BOOL)useGestureViewForReCentering
{
  return self->_useGestureViewForReCentering;
}

- (void)setUseGestureViewForReCentering:(BOOL)a3
{
  self->_useGestureViewForReCentering = a3;
}

- (CGPoint)previousLocation1
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousLocation1.x;
  y = self->_previousLocation1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousLocation1:(CGPoint)a3
{
  self->_previousLocation1 = a3;
}

- (CGPoint)previousLocation2
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousLocation2.x;
  y = self->_previousLocation2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousLocation2:(CGPoint)a3
{
  self->_previousLocation2 = a3;
}

- (CGPoint)location1
{
  double x;
  double y;
  CGPoint result;

  x = self->_location1.x;
  y = self->_location1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation1:(CGPoint)a3
{
  self->_location1 = a3;
}

- (CGPoint)location2
{
  double x;
  double y;
  CGPoint result;

  x = self->_location2.x;
  y = self->_location2.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation2:(CGPoint)a3
{
  self->_location2 = a3;
}

- (unint64_t)movements
{
  return self->_movements;
}

- (void)setMovements:(unint64_t)a3
{
  self->_movements = a3;
}

@end
