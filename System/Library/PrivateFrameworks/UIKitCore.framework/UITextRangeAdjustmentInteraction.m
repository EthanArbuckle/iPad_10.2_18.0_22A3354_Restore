@implementation UITextRangeAdjustmentInteraction

- (id)gestureRecognizerHostView
{
  return objc_loadWeakRetained((id *)&self->_gestureHostView);
}

- (BOOL)doesControlDelegate
{
  return 0;
}

- (UITextRangeAdjustmentInteraction)initWithAdjustmentDelegate:(id)a3 gestureHostView:(id)a4
{
  id v6;
  id v7;
  UITextRangeAdjustmentInteraction *v8;
  UITextRangeAdjustmentInteraction *v9;
  UITextRangeAdjustmentGestureRecognizer *v10;
  UITextRangeAdjustmentGestureRecognizer *adjustmentGestureRecognizer;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITextRangeAdjustmentInteraction;
  v8 = -[UITextInteraction init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_adjustmentDelegate, v6);
    objc_storeWeak((id *)&v9->_gestureHostView, v7);
    v10 = -[UIPanGestureRecognizer initWithTarget:action:]([UITextRangeAdjustmentGestureRecognizer alloc], "initWithTarget:action:", v9, sel__didRecognizeAdjustmentGesture_);
    adjustmentGestureRecognizer = v9->_adjustmentGestureRecognizer;
    v9->_adjustmentGestureRecognizer = v10;

    -[UIPanGestureRecognizer _setHysteresis:](v9->_adjustmentGestureRecognizer, "_setHysteresis:", 1.0);
    -[UIPanGestureRecognizer setDelegate:](v9->_adjustmentGestureRecognizer, "setDelegate:", v9);
    -[UIGestureRecognizer setName:](v9->_adjustmentGestureRecognizer, "setName:", CFSTR("UITextRangeAdjustmentGestureRecognizer"));
    -[UITextInteraction addGestureRecognizer:withName:](v9, "addGestureRecognizer:withName:", v9->_adjustmentGestureRecognizer, 0x1E1778900);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouch, 0);
  objc_storeStrong((id *)&self->_adjustmentGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_adjustmentDelegate);
  objc_storeStrong((id *)&self->_loupeSession, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
  objc_destroyWeak((id *)&self->_gestureHostView);
}

- (void)_didRecognizeAdjustmentGesture:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "_allActiveTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeAdjustmentInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  if (-[UITextRangeAdjustmentInteraction _gestureTuningEnabledForTouches:](self, "_gestureTuningEnabledForTouches:", v4))
  {
    -[UITextGestureTuning updateWithTouches:gestureState:](self->_gestureTuning, "updateWithTouches:gestureState:", v4, objc_msgSend(v25, "state"));
  }
  if (objc_msgSend(v25, "state") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextRangeAdjustmentInteraction setActiveTouch:](self, "setActiveTouch:", v5);

  }
  objc_msgSend(v25, "startPoint");
  -[UITextRangeAdjustmentInteraction _convertPointToViewCoordinateSpace:](self, "_convertPointToViewCoordinateSpace:");
  v7 = v6;
  v9 = v8;
  -[UITextRangeAdjustmentInteraction activeTouch](self, "activeTouch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextRangeAdjustmentInteraction _gestureView](self, "_gestureView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationInView:", v11);
  v13 = v12;
  v15 = v14;

  -[UITextRangeAdjustmentInteraction _convertPointToViewCoordinateSpace:](self, "_convertPointToViewCoordinateSpace:", v13, v15);
  v17 = v16;
  v19 = v18;
  -[UITextRangeAdjustmentInteraction activeTouch](self, "activeTouch");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "type");

  -[UITextRangeAdjustmentInteraction activeTouch](self, "activeTouch");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "_isPointerTouch");

  if (v23)
    v24 = 3;
  else
    v24 = v21;
  -[UITextRangeAdjustmentInteraction _updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:](self, "_updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:", objc_msgSend(v25, "state"), v24, v17, v19, v7, v9);

}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  if ((objc_msgSend(v4, "_isGestureType:", 10) & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_createGestureTuningIfNecessary
{
  UITextGestureTuning *v3;
  UITextGestureTuning *gestureTuning;
  void *v5;
  void *v6;
  id v7;

  if (!self->_gestureTuning)
  {
    v3 = objc_alloc_init(UITextGestureTuning);
    gestureTuning = self->_gestureTuning;
    self->_gestureTuning = v3;

    -[UITextGestureTuning setShouldUseLineThreshold:](self->_gestureTuning, "setShouldUseLineThreshold:", 1);
    -[UITextGestureTuning setStrongerBiasAgainstUp:](self->_gestureTuning, "setStrongerBiasAgainstUp:", 1);
    -[UITextInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextGestureTuning setGestureCoordinateSpace:](self->_gestureTuning, "setGestureCoordinateSpace:", v5);

    -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerCoordinateSpaceForTextRangeAdjustmentInteraction:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v6);

  }
}

- (BOOL)_gestureTuningEnabledForTouches:(id)a3
{
  UITextRangeAdjustmentInteraction *v3;
  void *v4;

  if (!self->_gestureTuning)
    return 0;
  v3 = self;
  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[UITextRangeAdjustmentInteraction _shouldApplyOffsetForTouchType:](v3, "_shouldApplyOffsetForTouchType:", objc_msgSend(v4, "type"));

  return (char)v3;
}

- (id)_gestureView
{
  void *v2;
  void *v3;

  -[UITextInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGPoint)_convertPointToViewCoordinateSpace:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[UITextRangeAdjustmentInteraction _gestureView](self, "_gestureView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_hostingWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UITextRangeAdjustmentInteraction activeTouch](self, "activeTouch");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = *(void **)(v9 + 360);
      else
        v11 = 0;
      v12 = v11;
      objc_msgSend(v6, "convertPoint:toView:", v12, x, y);
      v14 = v13;
      v16 = v15;

      objc_msgSend(v6, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "convertPoint:toView:", v6, v14, v16);
      x = v18;
      y = v19;

    }
  }

  v20 = x;
  v21 = y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (BOOL)_pointCloserToEnd:(CGPoint)a3
{
  UITextRangeAdjustmentInteractionDelegate **p_adjustmentDelegate;
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v34;
  CGRect v35;

  p_adjustmentDelegate = &self->_adjustmentDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  objc_msgSend(WeakRetained, "paddedTextRangeAdjustmentHitRegionForEdge:precision:", 0, 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
  objc_msgSend(v13, "paddedTextRangeAdjustmentHitRegionForEdge:precision:", 1, 0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v34.origin.x = v6;
  v34.origin.y = v8;
  v34.size.width = v10;
  v34.size.height = v12;
  if (CGRectIsNull(v34)
    || (v35.origin.x = v15, v35.origin.y = v17, v35.size.width = v19, v35.size.height = v21, CGRectIsNull(v35)))
  {
    v22 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
    objc_msgSend(v22, "textRangeAdjustmentRectForEdge:", 0);
    v6 = v23;
    v8 = v24;
    v10 = v25;
    v12 = v26;

    v27 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
    objc_msgSend(v27, "textRangeAdjustmentRectForEdge:", 1);
    v15 = v28;
    v17 = v29;
    v19 = v30;
    v21 = v31;

  }
  return sqrt((v15 + v19 * 0.5 - a3.x) * (v15 + v19 * 0.5 - a3.x) + (v17 + v21 * 0.5 - a3.y) * (v17 + v21 * 0.5 - a3.y)) < sqrt((v6 + v10 * 0.5 - a3.x) * (v6 + v10 * 0.5 - a3.x) + (v8 + v12 * 0.5 - a3.y) * (v8 + v12 * 0.5 - a3.y));
}

- (void)updateBaseAndExtentPointsFromEdges
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;

  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textRangeAdjustmentRectForEdge:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textRangeAdjustmentRectForEdge:", 1);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = -[UITextRangeAdjustmentInteraction baseIsStart](self, "baseIsStart");
  if (v21)
    v22 = v5;
  else
    v22 = v14;
  if (v21)
    v23 = v7;
  else
    v23 = v16;
  if (v21)
    v24 = v9;
  else
    v24 = v18;
  if (v21)
    v25 = v11;
  else
    v25 = v20;
  if (v21)
  {
    v5 = v14;
    v7 = v16;
    v9 = v18;
    v11 = v20;
  }
  -[UITextRangeAdjustmentInteraction setBasePoint:](self, "setBasePoint:", v22 + v24 * 0.5, v23 + v25 * 0.5);
  -[UITextRangeAdjustmentInteraction setExtentPoint:](self, "setExtentPoint:", v5 + v9 * 0.5, v7 + v11 * 0.5);
}

- (BOOL)_shouldApplyOffsetForTouchType:(int64_t)a3
{
  id WeakRetained;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  v6 = objc_msgSend(WeakRetained, "textRangeAdjustmentInteractionShouldApplyTouchOffset:", self);

  if (a3 == 3)
    return 0;
  else
    return v6;
}

- (BOOL)_shouldDisplayLoupeForTouchType:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "textRangeAdjustmentInteraction:shouldDisplayLoupeForTouchType:", self, a3);

  return a3;
}

- (void)_updateAdjustmentInteractionWithState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6
{
  switch(a3)
  {
    case 1:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionBeganWithLocation:startPoint:forTouchType:](self, "_adjustmentInteractionBeganWithLocation:startPoint:forTouchType:", a6, a4.x, a4.y, a5.x, a5.y);
      break;
    case 2:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionChangedWithLocation:forTouchType:](self, "_adjustmentInteractionChangedWithLocation:forTouchType:", a6, a4.x, a4.y, a5.x, a5.y);
      break;
    case 3:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionEndedAtLocation:forTouchType:](self, "_adjustmentInteractionEndedAtLocation:forTouchType:", a6, a4.x, a4.y, a5.x, a5.y);
      break;
    case 4:
    case 5:
      -[UITextRangeAdjustmentInteraction _adjustmentInteractionCancelled](self, "_adjustmentInteractionCancelled", a4.x, a4.y, a5.x, a5.y);
      break;
    default:
      return;
  }
}

- (CGRect)_activeAdjustmentEdgeRect
{
  _BOOL8 baseIsStart;
  id WeakRetained;
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
  CGRect result;

  baseIsStart = self->_baseIsStart;
  WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  objc_msgSend(WeakRetained, "textRangeAdjustmentRectForEdge:", baseIsStart);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  UITextRangeAdjustmentInteractionDelegate **p_adjustmentDelegate;
  id WeakRetained;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  BOOL v23;
  id v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGPoint v34;
  CGPoint v35;
  CGRect v36;
  CGRect v37;

  v6 = a4;
  if (a3)
    a3 = (id)*((_QWORD *)a3 + 23);
  p_adjustmentDelegate = &self->_adjustmentDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  objc_msgSend(WeakRetained, "containerCoordinateSpaceForTextRangeAdjustmentInteraction:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  v14 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
  objc_msgSend(v14, "paddedTextRangeAdjustmentHitRegionForEdge:precision:", 0, a3);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v36.origin.x = v16;
  v36.origin.y = v18;
  v36.size.width = v20;
  v36.size.height = v22;
  v34.x = v11;
  v34.y = v13;
  if (CGRectContainsPoint(v36, v34))
  {
    v23 = 1;
  }
  else
  {
    v24 = objc_loadWeakRetained((id *)p_adjustmentDelegate);
    objc_msgSend(v24, "paddedTextRangeAdjustmentHitRegionForEdge:precision:", 1, a3);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v37.origin.x = v26;
    v37.origin.y = v28;
    v37.size.width = v30;
    v37.size.height = v32;
    v35.x = v11;
    v35.y = v13;
    v23 = CGRectContainsPoint(v37, v35);
  }

  return v23;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;

  v4 = a3;
  -[UITextRangeAdjustmentInteraction _gestureView](self, "_gestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
  LOBYTE(self) = objc_msgSend(WeakRetained, "textRangeAdjustmentInteraction:shouldBeginAtPoint:", self, v7, v9);

  return (char)self;
}

- (void)_adjustmentInteractionBeganWithLocation:(CGPoint)a3 startPoint:(CGPoint)a4 forTouchType:(int64_t)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  UITextGestureTuning *gestureTuning;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id WeakRetained;
  void *v39;
  UITextLoupeSession *v40;
  UITextLoupeSession *loupeSession;
  id v42;

  y = a4.y;
  x = a4.x;
  -[UITextRangeAdjustmentInteraction setInitialPoint:](self, "setInitialPoint:", a4.x, a4.y);
  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerCoordinateSpaceForTextRangeAdjustmentInteraction:", self);
  v42 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextRangeAdjustmentInteraction _gestureView](self, "_gestureView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "convertPoint:fromCoordinateSpace:", v10, x, y);
  v12 = v11;
  v14 = v13;

  self->_baseIsStart = -[UITextRangeAdjustmentInteraction _pointCloserToEnd:](self, "_pointCloserToEnd:", v12, v14);
  -[UITextRangeAdjustmentInteraction updateBaseAndExtentPointsFromEdges](self, "updateBaseAndExtentPointsFromEdges");
  -[UITextRangeAdjustmentInteraction extentPoint](self, "extentPoint");
  self->_initialExtentPoint.x = v15;
  self->_initialExtentPoint.y = v16;
  -[UITextRangeAdjustmentInteraction basePoint](self, "basePoint");
  -[UITextRangeAdjustmentInteraction setInitialBasePoint:](self, "setInitialBasePoint:");
  -[UITextRangeAdjustmentInteraction initialBasePoint](self, "initialBasePoint");
  v18 = v17;
  v20 = v19;
  -[UITextRangeAdjustmentInteraction initialExtentPoint](self, "initialExtentPoint");
  -[UITextRangeAdjustmentInteraction setInitialDistance:](self, "setInitialDistance:", sqrt((v21 - v18) * (v21 - v18) + (v22 - v20) * (v22 - v20)));
  -[UITextRangeAdjustmentInteraction setFirstMovedTime:](self, "setFirstMovedTime:", -1.0);
  -[UITextRangeAdjustmentInteraction setExtentPoint:](self, "setExtentPoint:", x, y);
  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textRangeAdjustmentInteraction:didBeginAtPoint:", self, x, y);

  -[UITextRangeAdjustmentInteraction _activeAdjustmentEdgeRect](self, "_activeAdjustmentEdgeRect");
  -[UITextGestureTuning assertInitialPositionFromTopOfCaret:distanceFromCaret:](self->_gestureTuning, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", y - v27, x - (v25 + v24 * 0.5), y - (v27 + v26 * 0.5));
  if (-[UITextRangeAdjustmentInteraction _shouldDisplayLoupeForTouchType:](self, "_shouldDisplayLoupeForTouchType:", a5))
  {
    -[UITextRangeAdjustmentInteraction _gestureView](self, "_gestureView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v28, "_rangeAdjustmentGestureView");
      v29 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v29;
    }
    if (-[UITextRangeAdjustmentInteraction _shouldApplyOffsetForTouchType:](self, "_shouldApplyOffsetForTouchType:", a5))
    {
      gestureTuning = self->_gestureTuning;
      -[UITextRangeAdjustmentInteraction initialPoint](self, "initialPoint");
      -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", x, y, x - v31, y - v32);
      x = v33;
      y = v34;
    }
    -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "loupeOrientationForTextRangeAdjustmentInteraction:", self);

    -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
    objc_msgSend(WeakRetained, "textRangeAdjustmentViewForEdge:", self->_baseIsStart);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    +[UITextLoupeSession _beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:](UITextLoupeSession, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", v39, v28, v36, x, y);
    v40 = (UITextLoupeSession *)objc_claimAutoreleasedReturnValue();
    loupeSession = self->_loupeSession;
    self->_loupeSession = v40;

    -[UITextLoupeSession setDelegate:](self->_loupeSession, "setDelegate:", self);
    -[UITextLoupeSession setGestureTuning:](self->_loupeSession, "setGestureTuning:", self->_gestureTuning);

  }
}

- (void)setModelPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[UITextLoupeSession delegate](self->_loupeSession, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[UITextLoupeSession setDelegate:](self->_loupeSession, "setDelegate:", self);
  -[UITextLoupeSession setModelPosition:](self->_loupeSession, "setModelPosition:", x, y);
}

- (void)_loupeSessionDidInvalidate:(id)a3
{
  UITextLoupeSession *v4;
  UITextLoupeSession *v5;

  v4 = (UITextLoupeSession *)a3;
  if (self->_loupeSession == v4)
  {
    self->_loupeSession = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (void)_adjustmentInteractionChangedWithLocation:(CGPoint)a3 forTouchType:(int64_t)a4
{
  double y;
  double x;
  UITextGestureTuning *gestureTuning;
  double v8;
  double v9;
  double v10;
  double v11;
  UITextLoupeSession *loupeSession;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  y = a3.y;
  x = a3.x;
  if (-[UITextRangeAdjustmentInteraction _shouldApplyOffsetForTouchType:](self, "_shouldApplyOffsetForTouchType:", a4))
  {
    gestureTuning = self->_gestureTuning;
    -[UITextRangeAdjustmentInteraction initialPoint](self, "initialPoint");
    -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", x, y, x - v8, y - v9);
    x = v10;
    y = v11;
  }
  loupeSession = self->_loupeSession;
  -[UITextRangeAdjustmentInteraction _activeAdjustmentEdgeRect](self, "_activeAdjustmentEdgeRect");
  -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](loupeSession, "moveToPoint:withCaretRect:trackingCaret:", 1, x, y, v13, v14, v15, v16);
  -[UITextRangeAdjustmentInteraction setExtentPoint:](self, "setExtentPoint:", x, y);
  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextRangeAdjustmentInteraction extentPoint](self, "extentPoint");
  objc_msgSend(v17, "textRangeAdjustmentInteraction:selectionMoved:withTouchPoint:", self);

}

- (void)_adjustmentInteractionEndedAtLocation:(CGPoint)a3 forTouchType:(int64_t)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  UITextGestureTuning *gestureTuning;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  y = a3.y;
  x = a3.x;
  if (-[UITextRangeAdjustmentInteraction _shouldApplyOffsetForTouchType:](self, "_shouldApplyOffsetForTouchType:", a4))
  {
    -[UITextGestureTuning pointIfPlacedCarefully:](self->_gestureTuning, "pointIfPlacedCarefully:", x, y);
    v8 = v7;
    v10 = v9;
    gestureTuning = self->_gestureTuning;
    -[UITextRangeAdjustmentInteraction initialPoint](self, "initialPoint");
    -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", v8, v10, v8 - v12, v10 - v13);
    x = v14;
    y = v15;
  }
  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textRangeAdjustmentInteraction:didEndAtPoint:", self, x, y);

  -[UITextRangeAdjustmentInteraction _activeTouchEnded](self, "_activeTouchEnded");
}

- (BOOL)hasActiveTouch
{
  return self->_activeTouch != 0;
}

- (void)_adjustmentInteractionCancelled
{
  void *v3;

  -[UITextRangeAdjustmentInteraction adjustmentDelegate](self, "adjustmentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textRangeAdjustmentInteractionWasCancelled:", self);

  -[UITextRangeAdjustmentInteraction _activeTouchEnded](self, "_activeTouchEnded");
}

- (void)_activeTouchEnded
{
  void *v3;
  UITextLoupeSession *loupeSession;
  UITouch *activeTouch;

  -[UITextLoupeSession invalidate](self->_loupeSession, "invalidate");
  -[UITextLoupeSession delegate](self->_loupeSession, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    loupeSession = self->_loupeSession;
    self->_loupeSession = 0;

  }
  activeTouch = self->_activeTouch;
  self->_activeTouch = 0;

}

- (void)manuallyUpdateInteractionWithGestureState:(int64_t)a3 location:(CGPoint)a4 locationOfFirstTouch:(CGPoint)a5 forTouchType:(int64_t)a6
{
  double y;
  double x;
  double v9;
  double v10;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  -[UITextRangeAdjustmentInteraction _createGestureTuningIfNecessary](self, "_createGestureTuningIfNecessary");
  if (-[UITextRangeAdjustmentInteraction _shouldApplyOffsetForTouchType:](self, "_shouldApplyOffsetForTouchType:", a6))
    -[UITextGestureTuning updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:](self->_gestureTuning, "updateVisibilityOffsetForGestureState:touchType:locationInSceneReferenceSpace:majorRadius:", a3, 0, v10, v9, 1.0);
  -[UITextRangeAdjustmentInteraction _updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:](self, "_updateAdjustmentInteractionWithState:location:locationOfFirstTouch:forTouchType:", a3, a6, v10, v9, x, y);
}

- (BOOL)baseIsStart
{
  return self->_baseIsStart;
}

- (void)setBaseIsStart:(BOOL)a3
{
  self->_baseIsStart = a3;
}

- (CGPoint)initialExtentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialExtentPoint.x;
  y = self->_initialExtentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)extentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_extentPoint.x;
  y = self->_extentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setExtentPoint:(CGPoint)a3
{
  self->_extentPoint = a3;
}

- (UITextRangeAdjustmentInteractionDelegate)adjustmentDelegate
{
  return (UITextRangeAdjustmentInteractionDelegate *)objc_loadWeakRetained((id *)&self->_adjustmentDelegate);
}

- (void)setAdjustmentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_adjustmentDelegate, a3);
}

- (UITextRangeAdjustmentGestureRecognizer)adjustmentGestureRecognizer
{
  return self->_adjustmentGestureRecognizer;
}

- (CGPoint)initialPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialPoint.x;
  y = self->_initialPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialPoint:(CGPoint)a3
{
  self->_initialPoint = a3;
}

- (CGPoint)basePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_basePoint.x;
  y = self->_basePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBasePoint:(CGPoint)a3
{
  self->_basePoint = a3;
}

- (CGPoint)initialBasePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialBasePoint.x;
  y = self->_initialBasePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialBasePoint:(CGPoint)a3
{
  self->_initialBasePoint = a3;
}

- (double)initialDistance
{
  return self->_initialDistance;
}

- (void)setInitialDistance:(double)a3
{
  self->_initialDistance = a3;
}

- (double)firstMovedTime
{
  return self->_firstMovedTime;
}

- (void)setFirstMovedTime:(double)a3
{
  self->_firstMovedTime = a3;
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (void)setActiveTouch:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouch, a3);
}

@end
