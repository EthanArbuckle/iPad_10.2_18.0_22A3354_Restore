@implementation CRLiOSRectangularMarqueeGestureRecognizer

- (CRLiOSRectangularMarqueeGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  void *v5;
  CRLiOSRectangularMarqueeGestureRecognizer *v6;
  CRLiOSRectangularMarqueeGestureRecognizer *v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicOperationController"));
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  v6 = -[CRLiOSRectangularMarqueeGestureRecognizer initWithTarget:action:](&v9, "initWithTarget:action:", v5, "handleTrackerManipulator:");
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_interactiveCanvasController, v4);

  return v7;
}

- (void)setState:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = -[CRLiOSRectangularMarqueeGestureRecognizer state](self, "state");
  if (a3 == 1 && v5 != (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tmCoordinator"));

    objc_msgSend(v9, "registerTrackerManipulator:", self);
    objc_msgSend(v9, "takeControlWithTrackerManipulator:", self);
    objc_msgSend(v7, "beginOperation");

  }
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  -[CRLiOSRectangularMarqueeGestureRecognizer setState:](&v10, "setState:", a3);
}

- (void)reset
{
  id WeakRetained;
  void *v4;
  CRLiOSRectangularMarqueeGestureRecognizer *v5;
  UITouch *trackingTouch;
  CRLCanvasAutoscroll *autoscroll;
  CRLRectangularMarqueeTracker *marqueeTracker;
  objc_super v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));

  v5 = (CRLiOSRectangularMarqueeGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controllingTM"));
  if (v5 == self)
    objc_msgSend(v4, "relinquishTrackerManipulatorControl:", self);
  objc_msgSend(v4, "unregisterTrackerManipulator:", self);
  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

  -[CRLCanvasAutoscroll invalidate](self->_autoscroll, "invalidate");
  autoscroll = self->_autoscroll;
  self->_autoscroll = 0;

  marqueeTracker = self->_marqueeTracker;
  self->_marqueeTracker = 0;

  self->_initialScaledTouchLocation = (CGPoint)xmmword_100EEC428;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  -[CRLiOSRectangularMarqueeGestureRecognizer reset](&v9, "reset");

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  UITouch **p_trackingTouch;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  CRLRectangularMarqueeTracker *v31;
  void *v32;
  CRLRectangularMarqueeTracker *v33;
  CRLRectangularMarqueeTracker *marqueeTracker;
  void *v35;
  double v36;
  uint64_t v37;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asUIKitHost"));

  p_trackingTouch = &self->_trackingTouch;
  if (!self->_trackingTouch)
  {
    -[CRLiOSRectangularMarqueeGestureRecognizer setMinimumPressDuration:](self, "setMinimumPressDuration:", 0.5);
    -[CRLiOSRectangularMarqueeGestureRecognizer setAllowableMovement:](self, "setAllowableMovement:", 10.0);
    if (-[CRLiOSRectangularMarqueeGestureRecognizer p_isCanvasCurrentlyInQuickSelectMode](self, "p_isCanvasCurrentlyInQuickSelectMode"))
    {
      -[CRLiOSRectangularMarqueeGestureRecognizer setMinimumPressDuration:](self, "setMinimumPressDuration:", 0.02);
      -[CRLiOSRectangularMarqueeGestureRecognizer setAllowableMovement:](self, "setAllowableMovement:", 1.79769313e308);
    }
    if (objc_msgSend(v6, "count") == (id)1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
      if (objc_msgSend(v12, "type") == (id)3)
      {
        -[CRLiOSRectangularMarqueeGestureRecognizer setMinimumPressDuration:](self, "setMinimumPressDuration:", 0.0);
        if ((-[CRLiOSRectangularMarqueeGestureRecognizer buttonMask](self, "buttonMask") & 2) != 0
          || (-[CRLiOSRectangularMarqueeGestureRecognizer modifierFlags](self, "modifierFlags") & 0x40000) != 0)
        {
          -[CRLiOSRectangularMarqueeGestureRecognizer setState:](self, "setState:", 5);
        }
      }

    }
  }
  if (!-[CRLiOSRectangularMarqueeGestureRecognizer state](self, "state"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer view](self, "view"));
    objc_msgSend(v13, "locationInView:", v14);
    v16 = v15;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
    objc_msgSend(v19, "convertBoundsToUnscaledPoint:", v16, v18);
    v21 = v20;
    v23 = v22;

    if ((unint64_t)objc_msgSend(v6, "count") > 1
      || (unint64_t)objc_msgSend(v13, "tapCount") > 1
      || *p_trackingTouch
      || objc_msgSend(v10, "disallowRectangularMarqueeOperationAtUnscaledPoint:", v21, v23))
    {
      -[CRLiOSRectangularMarqueeGestureRecognizer setState:](self, "setState:", 5);
    }
    else
    {
      objc_storeStrong((id *)&self->_trackingTouch, v13);
      v24 = sub_10033831C(-[UITouch type](*p_trackingTouch, "type"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hitKnobAtPoint:inputType:returningRep:", v24, 0, v21, v23));

      if (v26)
      {
        -[CRLiOSRectangularMarqueeGestureRecognizer setState:](self, "setState:", 5);
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "hitRep:", v21, v23));

        if (v28
          && ((objc_msgSend(v28, "shouldPreventMarqueeInitiationAtPoint:withTouchType:", -[UITouch type](*p_trackingTouch, "type"), v21, v23) & 1) != 0|| (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "repForDragging")), v30 = objc_msgSend(v29, "shouldPreventMarqueeInitiationAtPoint:withTouchType:", -[UITouch type](*p_trackingTouch, "type"), v21, v23), v29, v30)))
        {
          -[CRLiOSRectangularMarqueeGestureRecognizer setState:](self, "setState:", 5);
        }
        else
        {
          v31 = [CRLRectangularMarqueeTracker alloc];
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
          v33 = -[CRLRectangularMarqueeTracker initWithInteractiveCanvasController:](v31, "initWithInteractiveCanvasController:", v32);
          marqueeTracker = self->_marqueeTracker;
          self->_marqueeTracker = v33;

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer marqueeTracker](self, "marqueeTracker"));
          objc_msgSend(v35, "setStartingUnscaledPoint:", v21, v23);

          self->_initialScaledTouchLocation.x = v16;
          self->_initialScaledTouchLocation.y = v18;
          -[CRLiOSRectangularMarqueeGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
          -[CRLRectangularMarqueeTracker setShouldSuppressAnimationWhenMarqueeBegins:](self->_marqueeTracker, "setShouldSuppressAnimationWhenMarqueeBegins:", v36 < 0.1);
          if ((id)-[UITouch type](*p_trackingTouch, "type") == (id)3)
            v37 = 1;
          else
            v37 = (uint64_t)objc_msgSend(v10, "isCurrentlyInQuickSelectMode");
          -[CRLRectangularMarqueeTracker setShouldSuppressContextMenu:](self->_marqueeTracker, "setShouldSuppressContextMenu:", v37);
          -[CRLRectangularMarqueeTracker setShouldSuppressRestoringOriginalSelectionIfNothingSelected:](self->_marqueeTracker, "setShouldSuppressRestoringOriginalSelectionIfNothingSelected:", v37);
          -[CRLiOSRectangularMarqueeGestureRecognizer p_setModifierFlags](self, "p_setModifierFlags");
        }

      }
    }

  }
  v38.receiver = self;
  v38.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  -[CRLiOSRectangularMarqueeGestureRecognizer touchesBegan:withEvent:](&v38, "touchesBegan:withEvent:", v6, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  UITouch *trackingTouch;
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  v6 = a3;
  -[CRLiOSRectangularMarqueeGestureRecognizer touchesMoved:withEvent:](&v18, "touchesMoved:withEvent:", v6, a4);
  LODWORD(a4) = objc_msgSend(v6, "containsObject:", self->_trackingTouch, v18.receiver, v18.super_class);

  if ((_DWORD)a4)
  {
    trackingTouch = self->_trackingTouch;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer view](self, "view"));
    -[UITouch locationInView:](trackingTouch, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
    objc_msgSend(v13, "convertBoundsToUnscaledPoint:", v10, v12);
    v15 = v14;
    v17 = v16;

    if (sub_10006108C(v10, v12, self->_initialScaledTouchLocation.x, self->_initialScaledTouchLocation.y) > 14.0)
      -[CRLRectangularMarqueeTracker setShouldSuppressRestoringOriginalSelectionIfNothingSelected:](self->_marqueeTracker, "setShouldSuppressRestoringOriginalSelectionIfNothingSelected:", 1);
    -[CRLiOSRectangularMarqueeGestureRecognizer p_updateTrackerWithUnscaledPoint:](self, "p_updateTrackerWithUnscaledPoint:", v15, v17);
    +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self, v15, v17);
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;
  id v10;
  objc_super v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asUIKitHost"));

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSRectangularMarqueeGestureRecognizer;
  if (-[CRLiOSRectangularMarqueeGestureRecognizer canPreventGestureRecognizer:](&v12, "canPreventGestureRecognizer:", v4))
  {
    -[CRLiOSRectangularMarqueeGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
    if (v8 <= 0.02)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "doubleTapGestureRecognizer"));
      v9 = v10 != v4;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSRectangularMarqueeGestureRecognizer state](self, "state") == (id)3
      || -[CRLiOSRectangularMarqueeGestureRecognizer state](self, "state") == (id)4;
}

- (void)operationDidEnd
{
  UITouch *trackingTouch;

  -[CRLCanvasAutoscroll invalidate](self->_autoscroll, "invalidate");
  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

}

- (void)updateAfterAutoscroll:(id)a3
{
  UITouch *trackingTouch;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  trackingTouch = self->_trackingTouch;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer view](self, "view", a3));
  -[UITouch locationInView:](trackingTouch, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer icc](self, "icc"));
  objc_msgSend(v10, "convertBoundsToUnscaledPoint:", v7, v9);
  v12 = v11;
  v14 = v13;

  -[CRLiOSRectangularMarqueeGestureRecognizer p_updateTrackerWithUnscaledPoint:](self, "p_updateTrackerWithUnscaledPoint:", v12, v14);
  -[CRLiOSRectangularMarqueeGestureRecognizer setState:](self, "setState:", 2);
}

- (void)p_setModifierFlags
{
  unint64_t v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  v3 = ((unint64_t)-[CRLiOSRectangularMarqueeGestureRecognizer modifierFlags](self, "modifierFlags") >> 19) & 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer marqueeTracker](self, "marqueeTracker"));
  objc_msgSend(v4, "setShouldCenterResizeMarqueeRect:", v3);

  v5 = -[CRLiOSRectangularMarqueeGestureRecognizer p_shouldInvertOriginalSelectionForModifierFlags:](self, "p_shouldInvertOriginalSelectionForModifierFlags:", -[CRLiOSRectangularMarqueeGestureRecognizer modifierFlags](self, "modifierFlags"));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer marqueeTracker](self, "marqueeTracker"));
  objc_msgSend(v6, "setShouldInvertOriginalSelection:", v5);

}

- (BOOL)p_shouldInvertOriginalSelectionForModifierFlags:(int64_t)a3
{
  return ((a3 & 0x120000) != 0) ^ -[CRLiOSRectangularMarqueeGestureRecognizer p_isCanvasCurrentlyInQuickSelectMode](self, "p_isCanvasCurrentlyInQuickSelectMode");
}

- (void)p_updateTrackerWithUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  -[CRLiOSRectangularMarqueeGestureRecognizer p_setModifierFlags](self, "p_setModifierFlags");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSRectangularMarqueeGestureRecognizer marqueeTracker](self, "marqueeTracker"));
  objc_msgSend(v6, "setCurrentUnscaledDragPoint:", x, y);

}

- (BOOL)p_isCanvasCurrentlyInQuickSelectMode
{
  id WeakRetained;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asUIKitHost"));
  v5 = objc_msgSend(v4, "isCurrentlyInQuickSelectMode");

  return v5;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->_autoscroll, a3);
}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (CRLRectangularMarqueeTracker)marqueeTracker
{
  return self->_marqueeTracker;
}

- (void)setMarqueeTracker:(id)a3
{
  objc_storeStrong((id *)&self->_marqueeTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeTracker, 0);
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong((id *)&self->_trackingTouch, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
