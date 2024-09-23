@implementation WFDrawerGestureCoordinator

- (WFDrawerGestureCoordinator)initWithDelegate:(id)a3
{
  id v5;
  WFDrawerGestureCoordinator *v6;
  WFDrawerGestureCoordinator *v7;
  WFDrawerVelocityFilter *v8;
  WFDrawerVelocityFilter *heightVelocityFilter;
  WFDrawerVelocityFilter *v10;
  WFDrawerVelocityFilter *heightAccelerationFilter;
  UIPanGestureRecognizer *v12;
  void *v13;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v15;
  UITapGestureRecognizer *v16;
  void *v17;
  UITapGestureRecognizer *tapGestureRecognizer;
  WFDrawerGestureCoordinator *v19;
  void *v21;
  objc_super v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDrawerGestureCoordinator.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFDrawerGestureCoordinator;
  v6 = -[WFDrawerGestureCoordinator init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, v5);
    v8 = objc_alloc_init(WFDrawerVelocityFilter);
    heightVelocityFilter = v7->_heightVelocityFilter;
    v7->_heightVelocityFilter = v8;

    v10 = objc_alloc_init(WFDrawerVelocityFilter);
    heightAccelerationFilter = v7->_heightAccelerationFilter;
    v7->_heightAccelerationFilter = v10;

    v12 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", v7, sel_handlePanGesture_);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v12, "setMaximumNumberOfTouches:", 1);
    objc_msgSend(v5, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v12);

    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = v12;
    v15 = v12;

    v16 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v7, sel_handleTapGesture_);
    -[UITapGestureRecognizer setEnabled:](v16, "setEnabled:", 0);
    objc_msgSend(v5, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addGestureRecognizer:", v16);

    tapGestureRecognizer = v7->_tapGestureRecognizer;
    v7->_tapGestureRecognizer = v16;

    v19 = v7;
  }

  return v7;
}

- (void)updateTapGestureRecognizer
{
  _BOOL8 v3;
  id v4;

  v3 = -[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount") != 0;
  -[WFDrawerGestureCoordinator tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)beginIgnoringTapGestures
{
  -[WFDrawerGestureCoordinator setTapGestureIgnoringCount:](self, "setTapGestureIgnoringCount:", -[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount") + 1);
  -[WFDrawerGestureCoordinator updateTapGestureRecognizer](self, "updateTapGestureRecognizer");
}

- (void)endIgnoringTapGestures
{
  void *v4;

  if (!-[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDrawerGestureCoordinator.m"), 90, CFSTR("Calls to endIgnoringTapGestures must mirror begin calls"));

  }
  -[WFDrawerGestureCoordinator setTapGestureIgnoringCount:](self, "setTapGestureIgnoringCount:", -[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount") - 1);
  -[WFDrawerGestureCoordinator updateTapGestureRecognizer](self, "updateTapGestureRecognizer");
}

- (void)beginDragging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[WFDrawerGestureCoordinator heightVelocityFilter](self, "heightVelocityFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerGestureCoordinator drawerHeight](self, "drawerHeight");
  objc_msgSend(v3, "resetWithValue:");

  -[WFDrawerGestureCoordinator heightAccelerationFilter](self, "heightAccelerationFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetWithValue:", 0.0);

  -[WFDrawerGestureCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumDrawerHeight");
  -[WFDrawerGestureCoordinator setMinimumDrawerHeight:](self, "setMinimumDrawerHeight:");

  -[WFDrawerGestureCoordinator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maximumDrawerHeight");
  -[WFDrawerGestureCoordinator setMaximumDrawerHeight:](self, "setMaximumDrawerHeight:");

  -[WFDrawerGestureCoordinator containerHeight](self, "containerHeight");
  v8 = v7;
  -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
  v10 = v8 - v9;
  if (v10 < 0.0)
    v10 = 0.0;
  -[WFDrawerGestureCoordinator setTopRubberBandRange:](self, "setTopRubberBandRange:", v10);
  -[WFDrawerGestureCoordinator setBottomRubberBandRange:](self, "setBottomRubberBandRange:", 15.0);
  -[WFDrawerGestureCoordinator delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gestureCoordinatorDidBeginInteraction:", self);

}

- (void)dragTranslatedWithVerticalDelta:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  -[WFDrawerGestureCoordinator drawerHeight](self, "drawerHeight");
  -[WFDrawerGestureCoordinator heightForRubberBandHeight:](self, "heightForRubberBandHeight:");
  -[WFDrawerGestureCoordinator rubberBandHeightForHeight:](self, "rubberBandHeightForHeight:", v8 + a3);
  v10 = round(v7 * v9) / v7;
  -[WFDrawerGestureCoordinator heightVelocityFilter](self, "heightVelocityFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSample:", v10);

  -[WFDrawerGestureCoordinator heightAccelerationFilter](self, "heightAccelerationFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerGestureCoordinator heightVelocityFilter](self, "heightVelocityFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "calculatedVelocity");
  objc_msgSend(v12, "addSample:");

  -[WFDrawerGestureCoordinator delegate](self, "delegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "gestureCoordinator:didContinueInteractionWithDrawerHeight:", self, v10);

}

- (void)endDraggingWithAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFDrawerGestureCoordinator heightVelocityFilter](self, "heightVelocityFilter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calculatedVelocity");
  -[WFDrawerGestureCoordinator endDraggingWithVerticalVelocity:animation:](self, "endDraggingWithVerticalVelocity:animation:", v4);

}

- (void)endDraggingWithVerticalVelocity:(double)a3 animation:(id)a4
{
  void *v6;
  double v7;
  id v8;

  -[WFDrawerGestureCoordinator delegate](self, "delegate", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[WFDrawerGestureCoordinator heightAccelerationFilter](self, "heightAccelerationFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calculatedVelocity");
  objc_msgSend(v8, "gestureCoordinator:didFinishInteractionWithVelocity:acceleration:animation:", self, 0, a3, v7);

}

- (void)handlePanGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  v4 = objc_msgSend(v22, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      _UIUpdateRequestActivate();
      -[WFDrawerGestureCoordinator delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "containerView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "translationInView:", v15);
      v17 = v16;
      v19 = v18;

      -[WFDrawerGestureCoordinator previousPanTranslation](self, "previousPanTranslation");
      v21 = v20 - v19;
      -[WFDrawerGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", v17, v19);
      -[WFDrawerGestureCoordinator dragTranslatedWithVerticalDelta:](self, "dragTranslatedWithVerticalDelta:", v21);
    }
    else if (v4 == 1)
    {
      -[WFDrawerGestureCoordinator delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeAllAnimations");

      -[WFDrawerGestureCoordinator beginDragging](self, "beginDragging");
      -[WFDrawerGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    }
  }
  else
  {
    _UIUpdateRequestDeactivate();
    -[WFDrawerGestureCoordinator setPreviousPanTranslation:](self, "setPreviousPanTranslation:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    -[WFDrawerGestureCoordinator heightVelocityFilter](self, "heightVelocityFilter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "calculatedVelocity");
    v7 = v6;

    if (objc_msgSend(v22, "state") == 3)
    {
      -[WFDrawerGestureCoordinator delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "velocityInView:", v9);
      v7 = -v10;

    }
    -[WFDrawerGestureCoordinator endDraggingWithVerticalVelocity:animation:](self, "endDraggingWithVerticalVelocity:animation:", 0, v7);
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (!-[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount"))
  {
    -[WFDrawerGestureCoordinator beginDragging](self, "beginDragging");
    -[WFDrawerGestureCoordinator setScrollView:](self, "setScrollView:", v11);
    objc_msgSend(v11, "contentOffset");
    -[WFDrawerGestureCoordinator setUnmodifiedInitialContentOffset:](self, "setUnmodifiedInitialContentOffset:");
    objc_msgSend(v11, "contentOffset");
    v5 = v4;
    objc_msgSend(v11, "contentOffset");
    v7 = v6;
    objc_msgSend(v11, "contentInset");
    v9 = v7 + v8;
    objc_msgSend(v11, "contentInset");
    if (v10 == 0.0 && v9 < 0.0 || v9 > 0.0 && v9 < 0.1)
      v9 = 0.0;
    -[WFDrawerGestureCoordinator setInitialContentOffset:](self, "setInitialContentOffset:", v5, v9);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  unint64_t v4;
  id v5;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  uint64_t v27;
  double v28;
  id v29;

  v29 = a3;
  v4 = -[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount");
  if (v29)
  {
    if (!v4)
    {
      -[WFDrawerGestureCoordinator scrollView](self, "scrollView");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 == v29 && !-[WFDrawerGestureCoordinator correctingContentOffset](self, "correctingContentOffset"))
      {
        -[WFDrawerGestureCoordinator initialContentOffset](self, "initialContentOffset");
        v7 = v6;
        v9 = v8;
        objc_msgSend(v29, "contentOffset");
        v11 = v10;
        v13 = v12;
        objc_msgSend(v29, "contentInset");
        v15 = v14;
        v16 = v13 - v9 + v14;
        -[WFDrawerGestureCoordinator drawerHeight](self, "drawerHeight");
        v18 = v17;
        -[WFDrawerGestureCoordinator clampedDrawerHeight:](self, "clampedDrawerHeight:", v17 + v16);
        v20 = v19;
        v21 = v19 - v18;
        if (v20 >= v18 || v9 <= 0.0)
        {
          if (fabs(v21) >= 0.00000011920929)
          {
            v28 = v9 + v16 - v21 - v15;
            -[WFDrawerGestureCoordinator dragTranslatedWithVerticalDelta:](self, "dragTranslatedWithVerticalDelta:");
            -[WFDrawerGestureCoordinator setCorrectingContentOffset:](self, "setCorrectingContentOffset:", 1);
            objc_msgSend(v29, "setContentOffset:", v11, v28);
            -[WFDrawerGestureCoordinator setCorrectingContentOffset:](self, "setCorrectingContentOffset:", 0);
            if (!objc_msgSend(v29, "showsVerticalScrollIndicator"))
              goto LABEL_19;
            v26 = v29;
            v27 = 0;
          }
          else
          {
            if ((objc_msgSend(v29, "showsVerticalScrollIndicator") & 1) != 0)
              goto LABEL_19;
            v26 = v29;
            v27 = 1;
          }
          objc_msgSend(v26, "setShowsVerticalScrollIndicator:", v27);
          goto LABEL_19;
        }
        v22 = v9 + v21;
        objc_msgSend(v29, "contentInset");
        v24 = 0.0;
        if (v22 >= 0.0 || v23 != 0.0)
          v24 = v22;
        -[WFDrawerGestureCoordinator setInitialContentOffset:](self, "setInitialContentOffset:", v7, v24);
      }
    }
  }
LABEL_19:

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  unint64_t v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v7 = -[WFDrawerGestureCoordinator tapGestureIgnoringCount](self, "tapGestureIgnoringCount");
  v8 = v17;
  if (v17)
  {
    if (!v7)
    {
      -[WFDrawerGestureCoordinator scrollView](self, "scrollView");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v17;
      if (v9 == v17)
      {
        objc_msgSend(v17, "contentOffset");
        v11 = v10;
        -[WFDrawerGestureCoordinator unmodifiedInitialContentOffset](self, "unmodifiedInitialContentOffset");
        if (v11 == v12)
        {
          objc_msgSend(v17, "contentOffset");
          a5->x = v13;
          a5->y = v14;
        }
        -[WFDrawerGestureCoordinator setScrollView:](self, "setScrollView:", 0);
        v15 = *MEMORY[0x24BDBEFB0];
        v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        -[WFDrawerGestureCoordinator setInitialContentOffset:](self, "setInitialContentOffset:", *MEMORY[0x24BDBEFB0], v16);
        -[WFDrawerGestureCoordinator setUnmodifiedInitialContentOffset:](self, "setUnmodifiedInitialContentOffset:", v15, v16);
        -[WFDrawerGestureCoordinator endDraggingWithAnimation:](self, "endDraggingWithAnimation:", 0);
        v8 = v17;
      }
    }
  }

}

- (double)applyRubberBandToValue:(double)a3 withRange:(double)a4
{
  double v4;
  double v5;

  v4 = a4 + a3 * 0.550000012;
  v5 = 0.0;
  if (fabs(v4) >= 0.00000011920929)
    return a4 * 0.550000012 * a3 / v4;
  return v5;
}

- (double)unapplyRubberBandToValue:(double)a3 withRange:(double)a4
{
  double v4;
  double v5;

  v4 = (a4 - a3) * 0.550000012;
  v5 = 0.0;
  if (fabs(v4) >= 0.00000011920929)
    return a3 * a4 / v4;
  return v5;
}

- (double)rubberBandHeightForHeight:(double)a3
{
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

  -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
  if (v5 >= a3)
  {
    -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
    if (v12 > a3)
    {
      -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
      v14 = v13;
      -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
      v16 = v15 - a3;
      -[WFDrawerGestureCoordinator bottomRubberBandRange](self, "bottomRubberBandRange");
      -[WFDrawerGestureCoordinator applyRubberBandToValue:withRange:](self, "applyRubberBandToValue:withRange:", v16, v17);
      return v14 - v18;
    }
  }
  else
  {
    -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
    v7 = v6;
    -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
    v9 = a3 - v8;
    -[WFDrawerGestureCoordinator topRubberBandRange](self, "topRubberBandRange");
    -[WFDrawerGestureCoordinator applyRubberBandToValue:withRange:](self, "applyRubberBandToValue:withRange:", v9, v10);
    return v7 + v11;
  }
  return a3;
}

- (double)heightForRubberBandHeight:(double)a3
{
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

  -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
  if (v5 >= a3)
  {
    -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
    if (v12 > a3)
    {
      -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
      v14 = v13;
      -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
      v16 = v15 - a3;
      -[WFDrawerGestureCoordinator bottomRubberBandRange](self, "bottomRubberBandRange");
      -[WFDrawerGestureCoordinator unapplyRubberBandToValue:withRange:](self, "unapplyRubberBandToValue:withRange:", v16, v17);
      return v14 - v18;
    }
  }
  else
  {
    -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
    v7 = v6;
    -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
    v9 = a3 - v8;
    -[WFDrawerGestureCoordinator topRubberBandRange](self, "topRubberBandRange");
    -[WFDrawerGestureCoordinator unapplyRubberBandToValue:withRange:](self, "unapplyRubberBandToValue:withRange:", v9, v10);
    return v7 + v11;
  }
  return a3;
}

- (double)drawerHeight
{
  void *v2;
  double v3;
  double v4;

  -[WFDrawerGestureCoordinator delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawerHeight");
  v4 = v3;

  return v4;
}

- (double)containerHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[WFDrawerGestureCoordinator delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  return v5;
}

- (double)clampedDrawerHeight:(double)a3
{
  double v5;
  double result;

  -[WFDrawerGestureCoordinator minimumDrawerHeight](self, "minimumDrawerHeight");
  if (v5 > a3)
    a3 = v5;
  -[WFDrawerGestureCoordinator maximumDrawerHeight](self, "maximumDrawerHeight");
  if (a3 < result)
    return a3;
  return result;
}

- (WFDrawerGestureCoordinatorDelegate)delegate
{
  return (WFDrawerGestureCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (WFDrawerVelocityFilter)heightVelocityFilter
{
  return self->_heightVelocityFilter;
}

- (WFDrawerVelocityFilter)heightAccelerationFilter
{
  return self->_heightAccelerationFilter;
}

- (unint64_t)tapGestureIgnoringCount
{
  return self->_tapGestureIgnoringCount;
}

- (void)setTapGestureIgnoringCount:(unint64_t)a3
{
  self->_tapGestureIgnoringCount = a3;
}

- (CGPoint)previousPanTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPanTranslation.x;
  y = self->_previousPanTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPanTranslation:(CGPoint)a3
{
  self->_previousPanTranslation = a3;
}

- (double)minimumDrawerHeight
{
  return self->_minimumDrawerHeight;
}

- (void)setMinimumDrawerHeight:(double)a3
{
  self->_minimumDrawerHeight = a3;
}

- (double)maximumDrawerHeight
{
  return self->_maximumDrawerHeight;
}

- (void)setMaximumDrawerHeight:(double)a3
{
  self->_maximumDrawerHeight = a3;
}

- (double)topRubberBandRange
{
  return self->_topRubberBandRange;
}

- (void)setTopRubberBandRange:(double)a3
{
  self->_topRubberBandRange = a3;
}

- (double)bottomRubberBandRange
{
  return self->_bottomRubberBandRange;
}

- (void)setBottomRubberBandRange:(double)a3
{
  self->_bottomRubberBandRange = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (CGPoint)initialContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialContentOffset.x;
  y = self->_initialContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialContentOffset:(CGPoint)a3
{
  self->_initialContentOffset = a3;
}

- (CGPoint)unmodifiedInitialContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_unmodifiedInitialContentOffset.x;
  y = self->_unmodifiedInitialContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnmodifiedInitialContentOffset:(CGPoint)a3
{
  self->_unmodifiedInitialContentOffset = a3;
}

- (BOOL)correctingContentOffset
{
  return self->_correctingContentOffset;
}

- (void)setCorrectingContentOffset:(BOOL)a3
{
  self->_correctingContentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_heightAccelerationFilter, 0);
  objc_storeStrong((id *)&self->_heightVelocityFilter, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
