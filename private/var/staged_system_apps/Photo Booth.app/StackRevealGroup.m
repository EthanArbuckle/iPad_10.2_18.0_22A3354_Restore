@implementation StackRevealGroup

- (StackRevealGroup)initWithStackElements:(id)a3
{
  StackRevealGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StackRevealGroup;
  v4 = -[StackRevealGroup init](&v6, "init");
  if (v4)
  {
    v4->_stackElements = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    v4->_state = 0;
    v4->_transitionEdge = 2;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StackRevealGroup;
  -[StackRevealGroup dealloc](&v3, "dealloc");
}

- (BOOL)containsStackElement:(id)a3 isTopElement:(BOOL *)a4
{
  if (a4)
    *a4 = -[NSMutableArray lastObject](self->_stackElements, "lastObject") == a3;
  return -[NSMutableArray containsObject:](self->_stackElements, "containsObject:", a3);
}

- (void)removeStackElement:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_stackElements, "containsObject:"))
  {
    -[StackRevealGroup _removeStackElementView:](self, "_removeStackElementView:", objc_msgSend(a3, "outerView"));
    -[NSMutableArray removeObject:](self->_stackElements, "removeObject:", a3);
  }
}

- (id)view
{
  id v3;
  id v4;
  id v5;
  UIView *v6;
  UIView *view;
  NSMutableArray *stackElements;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!self->_view)
  {
    v3 = -[StackRevealGroupDelegate stackContainerView](self->_delegate, "stackContainerView");
    v4 = objc_msgSend(-[NSMutableArray objectAtIndex:](self->_stackElements, "objectAtIndex:", 0), "outerView");
    v5 = objc_alloc((Class)UIView);
    objc_msgSend(v3, "stackBounds");
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
    self->_view = v6;
    -[UIView setOpaque:](v6, "setOpaque:", 0);
    view = self->_view;
    objc_msgSend(v3, "stackBounds");
    -[UIView setBounds:](view, "setBounds:");
    objc_msgSend(v3, "insertSubview:belowSubview:", self->_view, v4);
    objc_msgSend(v3, "addStackedView:", self->_view);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    stackElements = self->_stackElements;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackElements, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(stackElements);
          -[StackRevealGroup _addStackElementView:](self, "_addStackElementView:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "outerView"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](stackElements, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
  }
  return self->_view;
}

- (void)removeView
{
  UIView *view;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  view = self->_view;
  if (view)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = -[UIView subviews](view, "subviews", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[StackRevealGroup _removeStackElementView:](self, "_removeStackElementView:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
    objc_msgSend(-[StackRevealGroupDelegate stackContainerView](self->_delegate, "stackContainerView"), "removeStackedView:", self->_view);
    -[UIView removeFromSuperview](self->_view, "removeFromSuperview");

    self->_view = 0;
  }
}

- (void)_addStackElementView:(id)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(-[StackRevealGroupDelegate stackContainerView](self->_delegate, "stackContainerView"), "removeStackedView:", a3);
    v5 = objc_msgSend(a3, "superview");
    objc_msgSend(a3, "center");
    objc_msgSend(v5, "convertPoint:toView:", self->_view);
    objc_msgSend(a3, "setCenter:");
    -[UIView addSubview:](self->_view, "addSubview:", a3);
  }
}

- (void)_removeStackElementView:(id)a3
{
  UIView *v5;
  UIView *view;

  if (a3)
  {
    v5 = -[UIView superview](self->_view, "superview");
    view = self->_view;
    objc_msgSend(a3, "center");
    -[UIView convertPoint:toView:](view, "convertPoint:toView:", v5);
    objc_msgSend(a3, "setCenter:");
    -[UIView insertSubview:belowSubview:](v5, "insertSubview:belowSubview:", a3, self->_view);
    objc_msgSend(-[StackRevealGroupDelegate stackContainerView](self->_delegate, "stackContainerView"), "addStackedView:", a3);
  }
}

- (void)beginRevealAnimation
{
  id v3;
  char *v4;
  double v5;
  unint64_t transitionEdge;
  double v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CABasicAnimation *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;

  if (self->_state)
    return;
  self->_state = 1;
  v3 = -[StackRevealGroup view](self, "view");
  v4 = (char *)-[UIApplication statusBarOrientation](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "statusBarOrientation")- 1;
  if ((unint64_t)v4 >= 2)
    v5 = 15.0;
  else
    v5 = 12.0;
  transitionEdge = self->_transitionEdge;
  switch(transitionEdge)
  {
    case 8uLL:
      v7 = 180.0;
      goto LABEL_10;
    case 4uLL:
      v5 = 270.0 - v5;
      break;
    case 1uLL:
      v7 = 90.0;
LABEL_10:
      v5 = v5 + v7;
      break;
  }
  v8 = objc_alloc((Class)CAFilter);
  v9 = objc_msgSend(v8, "initWithType:", kCAFilterPageCurl);
  objc_msgSend(v9, "setCachesInputImage:", 1);
  objc_msgSend(v9, "setName:", CFSTR("pageCurl"));
  v11 = v5 * 3.14159265;
  v10 = v5 * 3.14159265 / 180.0;
  LODWORD(v11) = 1117782016;
  if ((unint64_t)v4 < 2)
    *(float *)&v11 = 100.0;
  objc_msgSend(v9, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11), CFSTR("inputRadius"));
  *(float *)&v12 = v10;
  objc_msgSend(v9, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12), CFSTR("inputAngle"));
  LODWORD(v13) = 0;
  objc_msgSend(v9, "setValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13), CFSTR("inputTime"));
  objc_msgSend(v9, "setValue:forKey:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"), CFSTR("inputFrontColor"));
  objc_msgSend(v3, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v3, "bounds");
  v23 = v22 * 0.0949999988;
  objc_msgSend(v3, "bounds");
  v25 = dbl_1000274E0[(unint64_t)v4 < 2] * v24;
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.height = v21;
  v35 = CGRectInset(v34, v23, v25);
  objc_msgSend(v9, "setValue:forKey:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height), CFSTR("inputShadowBounds"));
  objc_msgSend(objc_msgSend(v3, "layer"), "setFilters:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v9));

  v26 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filters.%@.inputTime"), CFSTR("pageCurl")));
  LODWORD(v27) = 0;
  -[CABasicAnimation setFromValue:](v26, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27));
  LODWORD(v28) = 1050253722;
  -[CABasicAnimation setDuration:](v26, "setDuration:", UIAnimationDragCoefficient(-[CABasicAnimation setToValue:](v26, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28)))* 0.449999988);
  LODWORD(v29) = 0;
  LODWORD(v30) = 0.75;
  LODWORD(v31) = 0.5;
  LODWORD(v32) = 1.0;
  -[CABasicAnimation setTimingFunction:](v26, "setTimingFunction:", +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v29, v30, v31, v32));
  -[CABasicAnimation setRemovedOnCompletion:](v26, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v26, "setFillMode:", kCAFillModeForwards);
  -[CABasicAnimation setDelegate:](v26, "setDelegate:", self);
  objc_msgSend(objc_msgSend(v3, "layer"), "addAnimation:forKey:", v26, CFSTR("reveal"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_revealBeginTime = v33;
}

- (void)cancel:(BOOL)a3
{
  StackRevealGroupDelegate *v4;
  NSString *v5;
  CABasicAnimation *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a3)
  {
    if (self->_state == 1)
    {
      self->_state = 2;
      v4 = -[StackRevealGroup delegate](self, "delegate");
      if ((objc_opt_respondsToSelector(v4, "stackRevealGroupDidReveal:") & 1) != 0)
        -[StackRevealGroupDelegate stackRevealGroupDidReveal:](v4, "stackRevealGroupDidReveal:", self);
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filters.%@.inputTime"), CFSTR("pageCurl"));
      v6 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v5);
      -[CABasicAnimation setFromValue:](v6, "setFromValue:", objc_msgSend(objc_msgSend(objc_msgSend(-[StackRevealGroup view](self, "view"), "layer"), "presentationLayer"), "valueForKeyPath:", v5));
      LODWORD(v7) = 0;
      v8 = UIAnimationDragCoefficient(-[CABasicAnimation setToValue:](v6, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7)))* 0.449999988;
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      -[CABasicAnimation setDuration:](v6, "setDuration:", v8 * (1.0 - fmax(v8 - (v9 - self->_revealBeginTime), 0.0) / v8));
      LODWORD(v10) = 0.5;
      LODWORD(v11) = 0;
      LODWORD(v12) = 1.0;
      LODWORD(v13) = 0.25;
      -[CABasicAnimation setTimingFunction:](v6, "setTimingFunction:", +[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v10, v11, v12, v13));
      -[CABasicAnimation setRemovedOnCompletion:](v6, "setRemovedOnCompletion:", 0);
      -[CABasicAnimation setFillMode:](v6, "setFillMode:", kCAFillModeBoth);
      -[CABasicAnimation setDelegate:](v6, "setDelegate:", self);
      objc_msgSend(objc_msgSend(-[StackRevealGroup view](self, "view"), "layer"), "addAnimation:forKey:", v6, CFSTR("reveal"));
    }
  }
  else
  {
    -[StackRevealGroup finish](self, "finish");
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v6;
  float v7;

  v6 = objc_opt_class(CABasicAnimation, a2);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
  {
    objc_msgSend(objc_msgSend(a3, "toValue"), "floatValue");
    if (v7 <= 0.0)
      -[StackRevealGroup finish](self, "finish");
    else
      -[StackRevealGroup cancel:](self, "cancel:", 1);
  }
}

- (void)finish
{
  StackRevealGroupDelegate *v3;
  StackRevealGroup *v4;
  StackRevealGroup *v5;

  if (self->_state != 3)
  {
    self->_state = 3;
    -[StackRevealGroup removeView](self, "removeView");
    v3 = -[StackRevealGroup delegate](self, "delegate");
    if ((objc_opt_respondsToSelector(v3, "stackRevealGroupDidFinish:") & 1) != 0)
    {
      v4 = self;
      -[StackRevealGroupDelegate stackRevealGroupDidFinish:](v3, "stackRevealGroupDidFinish:", self);
      v5 = self;
    }
  }
}

- (BOOL)isRevealing
{
  return self->_state < 2;
}

- (StackRevealGroupDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (StackRevealGroupDelegate *)a3;
}

- (unint64_t)transitionEdge
{
  return self->_transitionEdge;
}

- (void)setTransitionEdge:(unint64_t)a3
{
  self->_transitionEdge = a3;
}

@end
