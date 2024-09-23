@implementation TSDKnobDragGestureRecognizer

- (TSDKnobDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  TSDKnobDragGestureRecognizer *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDKnobDragGestureRecognizer;
  v4 = -[TSDKnobDragGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, 0, 0);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer initWithInteractiveCanvasController:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"), 55, CFSTR("invalid nil value for '%s'"), "icc");
    }
    v4->mICC = (TSDInteractiveCanvasController *)a3;
    v4->mCVC = (TSDiOSCanvasViewController *)objc_msgSend((id)objc_msgSend(a3, "layerHost"), "asiOSCVC");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
  v3.receiver = self;
  v3.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)setState:(int64_t)a3
{
  objc_super v5;

  -[TSDKnobDragGestureRecognizer state](self, "state");
  v5.receiver = self;
  v5.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer setState:](&v5, sel_setState_, a3);
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer reset](&v3, sel_reset);
  -[TSDKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");

  self->mTouch = 0;
  self->mSecondTouch = 0;
  self->mKnobToTouchOffset = (CGPoint)*MEMORY[0x24BDBEFB0];

  self->mLastHitRep = 0;
  self->mTouchesMoved = 0;
  self->mKnobTouchHasMoved = 0;
  self->mDelayHasElapsed = 0;

  self->mTracker = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGFloat v7;
  CGFloat v8;
  UITouch *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  TSDKnobTracker *v14;
  TSDKnob *v15;
  void *v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint *p_mKnobToTouchOffset;
  double x;
  double y;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  TSDDynamicOperationController *v46;
  double v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  objc_super v58;

  if (!-[TSDKnobDragGestureRecognizer state](self, "state")
    && -[TSDInteractiveCanvasController currentlyScrolling](self->mICC, "currentlyScrolling")
    || -[TSDDynamicOperationController isInOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "isInOperation")&& !-[TSDKnobDragGestureRecognizer state](self, "state"))
  {
    -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 5);
    return;
  }
  v58.receiver = self;
  v58.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer touchesBegan:withEvent:](&v58, sel_touchesBegan_withEvent_, a3, a4);
  self->mTouchesMoved = 0;

  self->mLastHitRep = 0;
  -[UITouch locationInView:](self->mTouch, "locationInView:", -[UITouch window](self->mTouch, "window"));
  self->mOriginalPointInWindow.x = v7;
  self->mOriginalPointInWindow.y = v8;
  if (-[TSDKnobDragGestureRecognizer state](self, "state"))
  {
    if (-[TSDKnobDragGestureRecognizer state](self, "state") != 1)
      -[TSDKnobDragGestureRecognizer state](self, "state");
    return;
  }
  if (objc_msgSend(a3, "count") != 1)
    goto LABEL_22;
  if (self->mTouch)
    goto LABEL_22;
  v9 = (UITouch *)(id)objc_msgSend(a3, "anyObject");
  self->mTouch = v9;
  if (-[UITouch tapCount](v9, "tapCount") != 1)
    goto LABEL_22;
  -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
  v11 = v10;
  v57 = 0;
  v12 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->mICC, "hitKnobAtPoint:returningRep:", &v57);
  if (!v12 || (v13 = v12, objc_msgSend(v12, "type") == 3))
  {
    v57 = (id)objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->mICC, "layerHost"), "asiOSCVC"), "hitRepWithTouch:", self->mTouch), "repForDragging");
    if (v57)
    {
      -[TSDTrackerManipulatorCoordinator registerTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "registerTrackerManipulator:", self);
      self->mSecondTouch = self->mTouch;

      self->mTouch = 0;
      return;
    }
    goto LABEL_22;
  }
  self->mLastHitRep = (TSDRep *)v57;

  v14 = (TSDKnobTracker *)objc_msgSend(v57, "newTrackerForKnob:", v13);
  self->mTracker = v14;
  v15 = -[TSDKnobTracker knob](v14, "knob");
  if (!self->mTracker)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"), 143, CFSTR("invalid nil value for '%s'"), "mTracker");
  }
  v18 = v57;
  -[TSDKnob position](v15, "position");
  objc_msgSend(v18, "convertNaturalPointToUnscaledCanvas:");
  v20 = v19;
  v22 = v21;
  p_mKnobToTouchOffset = &self->mKnobToTouchOffset;
  if (-[TSDKnobTracker shouldUseKnobOffset](self->mTracker, "shouldUseKnobOffset"))
  {
    x = TSDSubtractPoints(v20, v22, v11);
    p_mKnobToTouchOffset->x = x;
    self->mKnobToTouchOffset.y = y;
  }
  else
  {
    *p_mKnobToTouchOffset = *(CGPoint *)MEMORY[0x24BDBEFB0];
    x = p_mKnobToTouchOffset->x;
    y = self->mKnobToTouchOffset.y;
  }
  -[TSDKnobTracker i_setKnobOffset:](self->mTracker, "i_setKnobOffset:", x, y);
  if (self->mSecondTouch)
  {
LABEL_22:
    -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 5);
    return;
  }
  -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
  -[TSDKnobTracker setCurrentPosition:](self->mTracker, "setCurrentPosition:", TSDAddPoints(v26, v27, p_mKnobToTouchOffset->x));
  -[TSDKnobDragGestureRecognizer addTarget:action:](self, "addTarget:action:", -[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), sel_handleGestureRecognizer_);
  -[TSDTrackerManipulatorCoordinator registerTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "registerTrackerManipulator:", self);
  switch(-[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType"))
  {
    case 0:
      -[TSDKnobTracker delay](self->mTracker, "delay");
      if (v28 != 0.0)
        goto LABEL_32;
      v29 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
      v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
      v32 = (void *)v29;
      v33 = v30;
      v34 = 192;
      break;
    case 1:
      -[TSDKnobTracker delay](self->mTracker, "delay");
      if (v38 != 0.0)
        goto LABEL_32;
      v39 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
      v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
      v32 = (void *)v39;
      v33 = v40;
      v34 = 199;
      break;
    case 2:
      -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 1);
      -[TSDKnobTracker delay](self->mTracker, "delay");
      if (v41 != 0.0)
      {
        v42 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
        v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
        -[TSDKnobTracker delay](self->mTracker, "delay");
        objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, v44, 207, CFSTR("requesting a delay of %f"), v45);
      }
      if (-[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "takeControlWithTrackerManipulator:", self))
      {
        if (-[TSDDynamicOperationController isInPossibleDynamicOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "isInPossibleDynamicOperation"))
        {
          -[TSDDynamicOperationController stopTransformingReps:](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "stopTransformingReps:", -[TSDDynamicOperationController currentlyTransformingReps](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "currentlyTransformingReps"));
        }
        -[TSDDynamicOperationController beginOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "beginOperation");
        v46 = -[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController");
        -[TSDDynamicOperationController startTransformingReps:](v46, "startTransformingReps:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TSDKnobTracker rep](self->mTracker, "rep")));
      }
      return;
    case 3:
      -[TSDKnobTracker delay](self->mTracker, "delay");
      if (v47 != 0.0)
      {
        v48 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v49 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
        v50 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
        -[TSDKnobTracker delay](self->mTracker, "delay");
        objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, v50, 225, CFSTR("requesting a delay of %f"), v51);
      }
      return;
    case 4:
      -[TSDKnobTracker delay](self->mTracker, "delay");
      if (v35 != 0.0)
        goto LABEL_32;
      v36 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
      v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
      v32 = (void *)v36;
      v33 = v37;
      v34 = 232;
      break;
    case 5:
      -[TSDKnobTracker delay](self->mTracker, "delay");
      if (v52 != 0.0)
      {
        v53 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v54 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer touchesBegan:withEvent:]");
        v55 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
        -[TSDKnobTracker delay](self->mTracker, "delay");
        objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, v55, 239, CFSTR("requesting a delay of %f"), v56);
      }
      return;
    default:
      return;
  }
  objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, v31, v34, CFSTR("requesting a delay of 0"));
LABEL_32:
  -[TSDKnobTracker delay](self->mTracker, "delay");
  -[TSDKnobDragGestureRecognizer p_requestDelayedKnobTracking:](self, "p_requestDelayedKnobTracking:");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v7;
  double v8;
  TSDKnobDragGestureRecognizer *v9;
  uint64_t v10;
  TSDDynamicOperationController *v11;
  double v12;
  double v13;
  objc_super v14;

  self->mTouchesMoved = 1;
  self->mKnobTouchHasMoved = 1;
  if (!self->mDelayHasElapsed && -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") == 4)
  {
    -[UITouch locationInView:](self->mTouch, "locationInView:", -[UITouch window](self->mTouch, "window"));
    if (TSDDistance(self->mOriginalPointInWindow.x, self->mOriginalPointInWindow.y, v7, v8) >= 14.0)
    {
      -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 5);
      -[TSDKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, a3, a4);
  if (objc_msgSend(a3, "containsObject:", self->mTouch))
  {
    if (-[TSDKnobDragGestureRecognizer state](self, "state"))
    {
      if (-[TSDKnobDragGestureRecognizer state](self, "state") == 1)
      {
        v9 = self;
        v10 = 2;
LABEL_16:
        -[TSDKnobDragGestureRecognizer setState:](v9, "setState:", v10);
      }
    }
    else
    {
      if (-[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") == 3
        || -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") == 1
        || -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") == 5)
      {
        -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 1);
        -[TSDKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
      }
      else
      {
        if (-[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") || !self->mDelayHasElapsed)
          goto LABEL_17;
        -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 1);
      }
      if (!-[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "takeControlWithTrackerManipulator:", self))
      {
        v9 = self;
        v10 = 5;
        goto LABEL_16;
      }
      -[TSDDynamicOperationController beginOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "beginOperation");
      v11 = -[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController");
      -[TSDDynamicOperationController startTransformingReps:](v11, "startTransformingReps:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", self->mLastHitRep));
    }
LABEL_17:
    -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
    -[TSDKnobTracker setCurrentPosition:](self->mTracker, "setCurrentPosition:", TSDAddPoints(v12, v13, self->mKnobToTouchOffset.x));
  }
  if (-[TSDKnobDragGestureRecognizer state](self, "state") == 2)
  {
    if (-[TSDKnobTracker wantsAutoscroll](self->mTracker, "wantsAutoscroll"))
    {
      -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
      +[TSDAutoscroll startAutoscroll:unscaledPoint:](TSDAutoscroll, "startAutoscroll:unscaledPoint:", self);
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  double v6;
  double v7;
  TSDDynamicOperationController *v8;
  double v9;
  double v10;
  TSDRep *mLastHitRep;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, a3, a4);
  if (objc_msgSend(a3, "containsObject:", self->mTouch))
  {
    if (-[TSDKnobDragGestureRecognizer state](self, "state")
      || -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType")
      && -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") != 3)
    {
      if (-[TSDKnobDragGestureRecognizer state](self, "state")
        || self->mDelayHasElapsed
        || -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") != 4
        && -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType")
        && -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") != 1)
      {
        if (-[TSDKnobDragGestureRecognizer state](self, "state")
          || -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType") != 5)
        {
          -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 3);
          -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
          -[TSDKnobTracker setCurrentPosition:](self->mTracker, "setCurrentPosition:", TSDAddPoints(v9, v10, self->mKnobToTouchOffset.x));
          -[TSDKnobTracker setDragEnding:](self->mTracker, "setDragEnding:", 1);
          -[TSDAutoscroll invalidate](self->mAutoscroll, "invalidate");
        }
        else
        {
          -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 3);
          -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
          -[TSDKnobTracker setCurrentPosition:](self->mTracker, "setCurrentPosition:", TSDAddPoints(v6, v7, self->mKnobToTouchOffset.x));
          -[TSDKnobTracker setDragEnding:](self->mTracker, "setDragEnding:", 1);
          if (-[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "takeControlWithTrackerManipulator:", self))
          {
            -[TSDDynamicOperationController beginOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "beginOperation");
            v8 = -[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController");
            -[TSDDynamicOperationController startTransformingReps:](v8, "startTransformingReps:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", self->mLastHitRep));
          }
        }
      }
      else
      {
        -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 5);
        -[TSDKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
      }
    }
    else
    {
      -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 5);
    }
  }
  if (self->mSecondTouch && objc_msgSend(a3, "containsObject:"))
  {

    self->mSecondTouch = 0;
  }
  if (!self->mTouchesMoved)
  {
    mLastHitRep = self->mLastHitRep;
    if (mLastHitRep)
    {
      if (-[TSDRep isSelected](mLastHitRep, "isSelected")
        && -[TSDKnobTracker allowHUDToDisplay](self->mTracker, "allowHUDToDisplay")
        && -[TSDKnobDragGestureRecognizer state](self, "state") == 3)
      {
        -[TSDiOSCanvasViewController performSelector:withObject:afterDelay:](self->mCVC, "performSelector:withObject:afterDelay:", sel_toggleEditMenuForCurrentSelection, 0, 0.0);

        self->mLastHitRep = 0;
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  TSDKnobDragGestureRecognizer *v7;
  uint64_t v8;
  objc_super v9;

  -[TSDKnobDragGestureRecognizer p_cancelDelayedKnobTracking](self, "p_cancelDelayedKnobTracking");
  v9.receiver = self;
  v9.super_class = (Class)TSDKnobDragGestureRecognizer;
  -[TSDKnobDragGestureRecognizer touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, a3, a4);
  if (objc_msgSend(a3, "containsObject:", self->mTouch))
  {
    if (!-[TSDKnobDragGestureRecognizer state](self, "state"))
    {
      v7 = self;
      v8 = 5;
      goto LABEL_9;
    }
    if (-[TSDKnobDragGestureRecognizer state](self, "state") == 1
      || -[TSDKnobDragGestureRecognizer state](self, "state") == 2)
    {
      v7 = self;
      v8 = 4;
LABEL_9:
      -[TSDKnobDragGestureRecognizer setState:](v7, "setState:", v8);
    }
  }
  else if (objc_msgSend(a3, "containsObject:", self->mSecondTouch))
  {

    self->mSecondTouch = 0;
  }

  self->mLastHitRep = 0;
}

- (void)cancelBecauseOfRotation
{
  if (self->mTracker)
    -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 5);
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (id)tracker
{
  return self->mTracker;
}

- (BOOL)readyToEndOperation
{
  return -[TSDKnobDragGestureRecognizer state](self, "state") == 3;
}

- (void)operationDidEnd
{
  UITouch *mSecondTouch;
  TSDRep *mLastHitRep;

  if (self->mTracker)
  {
    if ((TSDKnobDragGestureRecognizer *)-[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM") == self&& !self->mTouchesMoved)
    {
      mLastHitRep = self->mLastHitRep;
      if (mLastHitRep)
      {
        if (-[TSDRep isSelected](mLastHitRep, "isSelected")
          && -[TSDKnobTracker allowHUDToDisplay](self->mTracker, "allowHUDToDisplay"))
        {
          -[TSDiOSCanvasViewController performSelector:withObject:afterDelay:](self->mCVC, "performSelector:withObject:afterDelay:", sel_toggleEditMenuForCurrentSelection, 0, 0.0);
        }
      }
    }
    -[TSDKnobDragGestureRecognizer removeTarget:action:](self, "removeTarget:action:", -[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), sel_handleGestureRecognizer_);

    self->mTracker = 0;
  }
  mSecondTouch = self->mSecondTouch;
  if (mSecondTouch)
  {
    if (!self->mTouch)
    {

      self->mSecondTouch = 0;
    }
  }
}

- (void)p_cancelDelayedKnobTracking
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_p_triggerDelayedKnobTracking_, 0);
}

- (void)p_requestDelayedKnobTracking:(double)a3
{
  self->mDelayHasElapsed = 0;
  -[TSDKnobDragGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_triggerDelayedKnobTracking_, 0, a3);
}

- (void)p_triggerDelayedKnobTracking:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  TSDDynamicOperationController *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  self->mDelayHasElapsed = 1;
  if (-[TSDKnobDragGestureRecognizer state](self, "state", a3))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m");
    -[TSDKnobDragGestureRecognizer state](self, "state");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 511, CFSTR("delay fired when knob GR in state %@"), NSStringFromUIGestureRecognizerState());
  }
  else
  {
    v7 = -[TSDKnob dragType](-[TSDKnobTracker knob](self->mTracker, "knob"), "dragType");
    if (v7 <= 5)
    {
      if (((1 << v7) & 0x2C) != 0)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDKnobDragGestureRecognizer p_triggerDelayedKnobTracking:]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobDragGestureRecognizer.m"), 520, CFSTR("shouldn't have delayed knob tracking!"));
      }
      else if (((1 << v7) & 0x12) != 0 || self->mKnobTouchHasMoved)
      {
        -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 1);
      }
    }
    if (-[TSDKnobDragGestureRecognizer state](self, "state") == 1
      && -[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "takeControlWithTrackerManipulator:", self))
    {
      if (-[TSDDynamicOperationController isInPossibleDynamicOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "isInPossibleDynamicOperation"))
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v10 = -[TSDDynamicOperationController currentlyTransformingReps](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "currentlyTransformingReps");
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "showKnobsDuringManipulation:", 0);
            }
            v12 = -[NSSet countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          }
          while (v12);
        }
        -[TSDDynamicOperationController stopTransformingReps:](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "stopTransformingReps:", -[TSDDynamicOperationController currentlyTransformingReps](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "currentlyTransformingReps"));
      }
      -[TSDDynamicOperationController beginOperation](-[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController"), "beginOperation");
      v15 = -[TSDInteractiveCanvasController dynamicOperationController](self->mICC, "dynamicOperationController");
      -[TSDDynamicOperationController startTransformingReps:](v15, "startTransformingReps:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TSDKnobTracker rep](self->mTracker, "rep")));
    }
  }
}

- (TSDInteractiveCanvasController)icc
{
  return self->mICC;
}

- (void)updateAfterAutoscroll:(id)a3
{
  double v5;
  double v6;

  -[TSDKnobDragGestureRecognizer p_pointInUnscaledCanvas](self, "p_pointInUnscaledCanvas");
  -[TSDKnobTracker setCurrentPosition:](self->mTracker, "setCurrentPosition:", TSDAddPoints(v5, v6, self->mKnobToTouchOffset.x));
  -[TSDKnobTracker updateAfterAutoscroll:](self->mTracker, "updateAfterAutoscroll:", a3);
  -[TSDKnobDragGestureRecognizer setState:](self, "setState:", 2);
}

- (void)autoscrollWillNotStart
{
  -[TSDKnobTracker autoscrollWillNotStart](self->mTracker, "autoscrollWillNotStart");
}

- (double)unscaledStartAutoscrollThreshold
{
  double result;

  -[TSDKnobTracker unscaledStartAutoscrollThreshold](self->mTracker, "unscaledStartAutoscrollThreshold");
  return result;
}

- (int)allowedAutoscrollDirections
{
  return -[TSDKnobTracker allowedAutoscrollDirections](self->mTracker, "allowedAutoscrollDirections");
}

- (BOOL)p_hitRepIsValid:(id)a3
{
  double v3;
  double v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "boundsForStandardKnobs");
  return v4 > 1.0 && v3 > 1.0;
}

- (CGPoint)p_pointInUnscaledCanvas
{
  TSDInteractiveCanvasController *mICC;
  double v3;
  double v4;
  CGPoint result;

  mICC = self->mICC;
  -[UITouch locationInView:](self->mTouch, "locationInView:", -[TSDInteractiveCanvasController canvasView](mICC, "canvasView"));
  -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (TSDAutoscroll)autoscroll
{
  return self->mAutoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (CGPoint)autoscrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mAutoscrollPoint.x;
  y = self->mAutoscrollPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAutoscrollPoint:(CGPoint)a3
{
  self->mAutoscrollPoint = a3;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mICC;
}

@end
