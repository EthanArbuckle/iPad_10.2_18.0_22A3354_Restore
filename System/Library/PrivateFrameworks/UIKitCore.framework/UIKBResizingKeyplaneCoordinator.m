@implementation UIKBResizingKeyplaneCoordinator

- (BOOL)isResizing
{
  return self->_isResizing;
}

- (void)setRenderConfig:(id)a3
{
  int v4;
  double v5;
  UIColor *v6;
  UIColor *grabberColor;

  v4 = objc_msgSend(a3, "lightKeyboard");
  v5 = 1.0;
  if (v4)
    v5 = 0.0;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, 0.25);
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  grabberColor = self->_grabberColor;
  self->_grabberColor = v6;

  -[UIKBResizingKeyplaneCoordinator updateGrabber](self, "updateGrabber");
}

- (void)dimKeys:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "integerValue") & 4) != 0)
        {
          objc_msgSend(v11, "doubleValue");
          self->_foregroundOpacity = v12;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[UIKBResizingKeyplaneCoordinator updateGrabber](self, "updateGrabber");
}

- (void)updateGrabber
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  UIView *grabber;
  _UIGrabber *v9;
  UIView *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "keyplaneSupportsResizingGesture");

  grabber = self->_grabber;
  if (!grabber && v7)
  {
    v9 = objc_alloc_init(_UIGrabber);
    v10 = self->_grabber;
    self->_grabber = &v9->super.super;

    -[UIView sizeToFit](self->_grabber, "sizeToFit");
    -[UIView setUserInteractionEnabled:](self->_grabber, "setUserInteractionEnabled:", 0);
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;
    -[UIView layer](self->_grabber, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRasterizationScale:", v13);

    -[UIView layer](self->_grabber, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldRasterize:", 1);

    grabber = self->_grabber;
  }
  -[UIView setBackgroundColor:](grabber, "setBackgroundColor:", self->_grabberColor);
  if ((v7 & 1) != 0)
  {
    -[UIView setAlpha:](self->_grabber, "setAlpha:", self->_foregroundOpacity);
    -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hostViewForResizingKeyplane:", self);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    -[UIView center](self->_grabber, "center");
    objc_msgSend(v21, "size");
    v18 = v17 * 0.5;
    if (v5 <= 1.0)
      v19 = 6.0;
    else
      v19 = 1.0 / v5 + 5.0;
    -[UIView frame](self->_grabber, "frame");
    -[UIView setCenter:](self->_grabber, "setCenter:", v18, v19 + v20 * 0.5);
    objc_msgSend(v21, "addSubview:", self->_grabber);

  }
  else
  {
    -[UIView removeFromSuperview](self->_grabber, "removeFromSuperview");
  }
}

- (UIKBResizingKeyplaneCoordinatorCoordinatorDelegate)delegate
{
  return (UIKBResizingKeyplaneCoordinatorCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)updateGestureRecognizers
{
  void *v3;
  int v4;
  UIKBResizingKeyplanePanGestureRecognizer *gestureRecognizer;
  UIKBResizingKeyplanePanGestureRecognizer *v6;
  UIKBResizingKeyplanePanGestureRecognizer *v7;
  void *v8;
  void *v9;
  id v10;

  -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyplaneSupportsResizingGesture");

  gestureRecognizer = self->_gestureRecognizer;
  if (v4)
  {
    if (!gestureRecognizer)
    {
      v6 = objc_alloc_init(UIKBResizingKeyplanePanGestureRecognizer);
      v7 = self->_gestureRecognizer;
      self->_gestureRecognizer = v6;

      -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_gestureRecognizer, "setMaximumNumberOfTouches:", 1);
      -[UIPanGestureRecognizer _setCanPanHorizontally:](self->_gestureRecognizer, "_setCanPanHorizontally:", 0);
      -[UIKBResizingKeyplanePanGestureRecognizer setResizingDelegate:](self->_gestureRecognizer, "setResizingDelegate:", self);
      -[UIGestureRecognizer addTarget:action:](self->_gestureRecognizer, "addTarget:action:", self, sel_handleResizeGesture_);
    }
    -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hostViewForResizingKeyplane:", self);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addGestureRecognizer:", self->_gestureRecognizer);
    -[UIPanGestureRecognizer setDelegate:](self->_gestureRecognizer, "setDelegate:", self);

  }
  else
  {
    -[UIGestureRecognizer view](gestureRecognizer, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", self->_gestureRecognizer);

    -[UIPanGestureRecognizer setDelegate:](self->_gestureRecognizer, "setDelegate:", 0);
  }
}

- (void)stopResizing
{
  _UIDynamicAnimationGroup *resizingAnimationGroup;

  if (self->_isResizing)
  {
    resizingAnimationGroup = self->_resizingAnimationGroup;
    if (resizingAnimationGroup)
      -[_UIDynamicAnimation stop](resizingAnimationGroup, "stop");
  }
}

- (void)reloadResizingOffset
{
  double v3;

  objc_msgSend((id)objc_opt_class(), "savedResizingOffset");
  self->_prevResizingOffset = v3;
  self->_resizingOffset = v3;
}

+ (double)savedResizingOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v4;
  else
    v7 = v6;
  return kSnapStops[_resizingStopIndex != 0] * v7;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIKBResizingKeyplaneCoordinator)init
{
  UIKBResizingKeyplaneCoordinator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKBResizingKeyplaneCoordinator;
  result = -[UIKBResizingKeyplaneCoordinator init](&v3, sel_init);
  if (result)
    result->_foregroundOpacity = 1.0;
  return result;
}

- (void)saveResizingStopIndex:(unint64_t)a3
{
  _resizingStopIndex = a3;
}

- (void)uninstallGestureRecognizers
{
  UIKBResizingKeyplanePanGestureRecognizer *gestureRecognizer;
  void *v4;
  UIKBResizingKeyplanePanGestureRecognizer *v5;

  gestureRecognizer = self->_gestureRecognizer;
  if (gestureRecognizer)
  {
    -[UIGestureRecognizer view](gestureRecognizer, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_gestureRecognizer);

    v5 = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIKBResizingKeyplanePanGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = (UIKBResizingKeyplanePanGestureRecognizer *)a3;
  if (self->_gestureRecognizer == v4)
  {
    -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostViewForResizingKeyplane:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "frame");
    if (v8 >= 1.0)
    {
      v9 = v8;
      -[UIPanGestureRecognizer locationInView:](v4, "locationInView:", v7);
      v5 = (v10 - v9 * 0.5) / (v9 * 0.5) * ((v10 - v9 * 0.5) / (v9 * 0.5)) + (v11 + 47.0) / 94.0 * ((v11 + 47.0) / 94.0) <= 1.0;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)handleResizeGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  _UIDynamicAnimationGroup *resizingAnimationGroup;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  char v29;
  double v30;
  char v31;
  double v32;
  double v33;
  _UIDynamicValueAnimation *v34;
  void *v35;
  void *v36;
  _UIDynamicAnimationGroup *v37;
  _UIDynamicAnimationGroup *v38;
  _UIDynamicAnimationGroup *v39;
  _QWORD v40[6];
  _QWORD v41[6];

  v4 = a3;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  if (v7 >= v9)
    v10 = v7;
  else
    v10 = v9;
  -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hostViewForResizingKeyplane:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v10 * 0.0;
    v14 = v10 * 0.242610837 - v10 * 0.0;
    objc_msgSend(v12, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v15);
    v17 = v16;

    objc_msgSend(v12, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "velocityInView:", v18);
    v20 = v19;

    v21 = self->_prevResizingOffset - v17;
    if (v21 <= v10 * 0.242610837)
    {
      if (v21 < v13)
        v21 = v13 - v14 * (1.0 - 1.0 / ((v13 - v21) / v14 * 0.55 + 1.0));
    }
    else
    {
      v21 = v10 * 0.242610837 + v14 * (1.0 - 1.0 / ((v21 - v10 * 0.242610837) / v14 * 0.55 + 1.0));
    }
    if (objc_msgSend(v4, "state") == 1)
    {
      resizingAnimationGroup = self->_resizingAnimationGroup;
      if (resizingAnimationGroup)
        -[_UIDynamicAnimation stop](resizingAnimationGroup, "stop");
      self->_isResizing = 1;
    }
    else
    {
      v23 = round(v21);
      if (objc_msgSend(v4, "state") == 2)
      {
        -[UIKBResizingKeyplaneCoordinator resizeKeyplaneWithOffset:andRedraw:](self, "resizeKeyplaneWithOffset:andRedraw:", 0, v23);
      }
      else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
      {
        v24 = 0;
        v25 = 0;
        v26 = -v20;
        v27 = v23 + v20 * -0.25;
        v28 = 0.0;
        v29 = 1;
        v30 = 1.79769313e308;
        do
        {
          v31 = v29;
          v32 = v10 * kSnapStops[v24];
          v33 = v32 - v27;
          if (v32 - v27 < 0.0)
            v33 = -(v32 - v27);
          if (v33 < v30)
          {
            v28 = v10 * kSnapStops[v24];
            v30 = v33;
            v25 = v24;
          }
          v24 = 1;
          v29 = 0;
        }
        while ((v31 & 1) != 0);
        -[UIKBResizingKeyplaneCoordinator saveResizingStopIndex:](self, "saveResizingStopIndex:", v25);
        v34 = -[_UIDynamicValueAnimation initWithValue:velocity:unitSize:]([_UIDynamicValueAnimation alloc], "initWithValue:velocity:unitSize:", v23, v26, 1.0);
        -[_UIDynamicValueAnimation setFriction:](v34, "setFriction:", 0.5);
        +[_UIDynamicAnimationActiveValue upperBoundary:ofType:](_UIDynamicAnimationActiveValue, "upperBoundary:ofType:", 1, v28);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UIDynamicAnimationActiveValue lowerBoundary:ofType:](_UIDynamicAnimationActiveValue, "lowerBoundary:ofType:", 1, v28);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIDynamicValueAnimation addActiveValue:](v34, "addActiveValue:", v35);
        -[_UIDynamicValueAnimation addActiveValue:](v34, "addActiveValue:", v36);
        v37 = objc_alloc_init(_UIDynamicAnimationGroup);
        v38 = self->_resizingAnimationGroup;
        self->_resizingAnimationGroup = v37;

        -[_UIDynamicAnimationGroup addAnimation:](self->_resizingAnimationGroup, "addAnimation:", v34);
        v39 = self->_resizingAnimationGroup;
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke;
        v41[3] = &unk_1E16E6518;
        v41[4] = self;
        *(double *)&v41[5] = v28;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke_2;
        v40[3] = &unk_1E16B7A60;
        v40[4] = self;
        *(double *)&v40[5] = v28;
        -[_UIDynamicAnimationGroup runWithGroupApplier:completion:](v39, "runWithGroupApplier:completion:", v41, v40);

      }
    }
  }

}

uint64_t __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  double v3;
  double v4;
  __CFString **v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (a2 <= 4)
  {
    v2 = result;
    if (((1 << a2) & 0x19) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(result + 32) + 56) = 0;
      result = objc_msgSend(*(id *)(result + 32), "resizeKeyplaneWithOffset:andRedraw:", 1, *(double *)(result + 40));
      v3 = *(double *)(v2 + 40);
      v4 = *(double *)(*(_QWORD *)(v2 + 32) + 8);
      if (v3 != v4)
      {
        if (v3 <= v4)
          v5 = UIKBAnalyticsCandidateUIDirectionClose;
        else
          v5 = UIKBAnalyticsCandidateUIDirectionOpen;
        return +[UIKBAnalyticsDispatcher handwritingResized:](UIKBAnalyticsDispatcher, "handwritingResized:", *v5);
      }
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 32), "animations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v9 = v8;

      return objc_msgSend(*(id *)(v2 + 32), "resizeKeyplaneWithOffset:andRedraw:", 0, v9);
    }
  }
  return result;
}

void __55__UIKBResizingKeyplaneCoordinator_handleResizeGesture___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
}

- (void)resizeKeyplaneWithOffset:(double)a3 andRedraw:(BOOL)a4
{
  double v4;
  _BOOL8 v5;
  id v6;

  v4 = round(a3);
  if (v4 != self->_resizingOffset)
  {
    v5 = a4;
    self->_resizingOffset = v4;
    -[UIKBResizingKeyplaneCoordinator delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resizeKeyplaneAndRedraw:", v5);

  }
}

- (BOOL)shouldStartResizeForTranslationY:(double)a3
{
  return self->_resizingOffset > 0.0 || a3 < 0.0;
}

- (double)resizingOffset
{
  return self->_resizingOffset;
}

- (UIKBResizingKeyplanePanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grabberColor, 0);
  objc_storeStrong((id *)&self->_grabber, 0);
  objc_storeStrong((id *)&self->_resizingAnimationGroup, 0);
}

@end
