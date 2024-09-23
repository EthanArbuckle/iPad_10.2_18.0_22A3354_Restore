@implementation StackElement

+ (double)borderWidth
{
  return 15.0;
}

- (StackElement)initWithItem:(id)a3 state:(int64_t)a4
{
  StackElement *v6;
  NSMutableArray *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)StackElement;
  v6 = -[StackElement init](&v9, "init");
  if (v6)
  {
    v6->_item = a3;
    v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v6->_nextState = a4;
    v6->_targetState = a4;
    v6->_previousState = a4;
    v6->_currentState = a4;
    v6->_animationInfosStack = v7;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StackElement;
  -[StackElement dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, states: %li %li %li %li, item: %@>"), NSStringFromClass(v3), self, self->_previousState, self->_currentState, self->_nextState, self->_targetState, self->_item);
}

- (int64_t)state
{
  int64_t result;

  result = self->_currentState;
  if (!result)
    return self->_previousState;
  return result;
}

- (int64_t)nextState
{
  return self->_nextState;
}

- (void)setNextState:(int64_t)a3
{
  -[StackElement setNextState:animated:](self, "setNextState:animated:", a3, 0);
}

- (void)setNextState:(int64_t)a3 animated:(BOOL)a4
{
  int64_t nextState;

  nextState = self->_nextState;
  if (nextState != a3)
  {
    self->_nextState = a3;
    if (self->_previousState == a3)
      self->_previousState = nextState;
    switch(a3)
    {
      case 1:
        -[StackElement hide:](self, "hide:", a4);
        if (!a4)
          goto LABEL_20;
        break;
      case 2:
        -[StackElement showFullsize:](self, "showFullsize:", a4);
        if (!a4)
          goto LABEL_20;
        break;
      case 3:
        -[StackElement showDimmed:](self, "showDimmed:", a4);
        if (!a4)
          goto LABEL_20;
        break;
      case 4:
        if (nextState == 6)
        {
          -[StackElement fadeInUnderneathStack:](self, "fadeInUnderneathStack:", a4);
          if (!a4)
            goto LABEL_20;
        }
        else
        {
          -[StackElement moveIntoStack:](self, "moveIntoStack:", a4);
          if (!a4)
            goto LABEL_20;
        }
        break;
      case 5:
        -[StackElement moveOutFromStack:](self, "moveOutFromStack:", a4);
        if (!a4)
          goto LABEL_20;
        break;
      case 6:
        -[StackElement fadeOutUnderneathStack:](self, "fadeOutUnderneathStack:", a4);
        goto LABEL_17;
      default:
LABEL_17:
        if (!a4)
LABEL_20:
          -[StackElement setCurrentState:](self, "setCurrentState:", a3);
        break;
    }
  }
}

- (BOOL)isVisible
{
  unint64_t v2;

  v2 = -[StackElement currentState](self, "currentState");
  return (v2 > 6) | (0x1Du >> v2) & 1;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  int64_t previousState;

  if (self->_currentState != a3)
  {
    previousState = self->_previousState;
    self->_currentState = a3;
    self->_nextState = a3;
    self->_previousState = a3;
    -[StackElementDelegate stackElement:currentStateDidChangeFrom:to:](-[StackElement delegate](self, "delegate"), "stackElement:currentStateDidChangeFrom:to:", self, previousState, a3);
  }
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(int64_t)a3
{
  int64_t targetState;

  targetState = self->_targetState;
  if (targetState != a3)
  {
    self->_targetState = a3;
    -[StackElementDelegate stackElement:targetStateDidChangeFrom:to:](-[StackElement delegate](self, "delegate"), "stackElement:targetStateDidChangeFrom:to:", self, targetState, a3);
  }
}

- (BOOL)isAnimating
{
  int64_t previousState;

  if (self->_currentState)
    return 0;
  previousState = self->_previousState;
  if (previousState != 3)
    return previousState != 2 || self->_nextState != 3;
  return self->_nextState != 2;
}

- (void)removeView
{
  -[StackElement setOrientation:](self, "setOrientation:", 0);
  if ((id)-[StackElement currentState](self, "currentState") == (id)2)
  {
    -[StackElement removeDimmingFilter](self, "removeDimmingFilter");
    -[StackElement removeOuterView](self, "removeOuterView");
  }
  else
  {
    -[StackElement removeInnerView](self, "removeInnerView");
  }
}

- (double)stackIndex
{
  id v3;
  void *v4;
  id v5;
  double v6;
  id v7;
  id v8;
  id v9;

  v3 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 0);
  if (v3)
  {
    v4 = v3;
    v5 = -[StackElementDelegate stackContainerView](-[StackElement delegate](self, "delegate"), "stackContainerView");
    v6 = 0.0;
    do
    {
      v7 = objc_msgSend(v4, "superview");
      v8 = objc_msgSend(v7, "subviews");
      v6 = v6 + (double)(unint64_t)objc_msgSend(v8, "indexOfObjectIdenticalTo:", v4);
      if (v7 == v5)
        break;
      v9 = objc_msgSend(v8, "count") ? objc_msgSend(v8, "count") : (id)10;
      v6 = v6 / (double)(unint64_t)v9;
      v4 = v7;
    }
    while (v7);
  }
  else if (-[StackElement isVisible](self, "isVisible"))
  {
    return 9.22337204e18;
  }
  else
  {
    return -1.0;
  }
  return v6;
}

- (UIView)innerView
{
  return (UIView *)-[StackElement innerViewCreateIfNeeded:](self, "innerViewCreateIfNeeded:", 1);
}

- (id)innerViewCreateIfNeeded:(BOOL)a3
{
  id result;
  BOOL v5;

  result = self->_itemView;
  if (result)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    result = -[StackElementDelegate viewForStackElement:](-[StackElement delegate](self, "delegate", a3), "viewForStackElement:", self);
    self->_itemView = (UIView *)result;
  }
  return result;
}

- (void)removeInnerView
{
  if (self->_itemView)
  {
    -[StackElementDelegate stackElement:willRemoveView:](-[StackElement delegate](self, "delegate"), "stackElement:willRemoveView:", self, self->_itemView);
    -[UIView removeFromSuperview](self->_itemView, "removeFromSuperview");

    self->_itemView = 0;
    -[StackElement removeOuterView](self, "removeOuterView");
  }
}

- (UIView)outerView
{
  return (UIView *)-[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 1);
}

- (id)outerViewCreateIfNeeded:(BOOL)a3
{
  id result;
  BOOL v5;
  id v6;
  id v7;

  result = self->_shadowedView;
  if (result)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = -[StackElement innerViewCreateIfNeeded:](self, "innerViewCreateIfNeeded:", 1);
    v7 = objc_alloc((Class)-[StackElementDelegate stackElementOuterViewClass](-[StackElement delegate](self, "delegate"), "stackElementOuterViewClass"));
    objc_msgSend(v6, "frame");
    self->_shadowedView = (UIView *)objc_msgSend(v7, "initWithFrame:");
    objc_msgSend(objc_msgSend(v6, "superview"), "insertSubview:belowSubview:", self->_shadowedView, v6);
    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[UIView bounds](self->_shadowedView, "bounds");
    objc_msgSend(v6, "setFrame:");
    -[UIView addSubview:](self->_shadowedView, "addSubview:", v6);
    objc_msgSend(v6, "alpha");
    -[UIView setAlpha:](self->_shadowedView, "setAlpha:");
    objc_msgSend(v6, "setAlpha:", 1.0);
    -[CALayer setBorderColor:](-[UIView layer](self->_shadowedView, "layer"), "setBorderColor:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
    result = self->_shadowedView;
    if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      objc_msgSend(objc_msgSend(result, "layer"), "setBorderWidth:", 15.0);
      return self->_shadowedView;
    }
  }
  return result;
}

- (void)removeOuterView
{
  UIView *shadowedView;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  shadowedView = self->_shadowedView;
  if (shadowedView)
  {
    v4 = objc_opt_class(UIImageView, a2);
    if ((objc_opt_isKindOfClass(shadowedView, v4) & 1) == 0)
    {
      v5 = -[StackElement innerViewCreateIfNeeded:](self, "innerViewCreateIfNeeded:", 0);
      if (v5)
      {
        v6 = v5;
        v7 = v5;
        objc_msgSend(v6, "removeFromSuperview");
        -[UIView frame](self->_shadowedView, "frame");
        objc_msgSend(v6, "setFrame:");
        -[UIView insertSubview:aboveSubview:](-[UIView superview](self->_shadowedView, "superview"), "insertSubview:aboveSubview:", v6, self->_shadowedView);

      }
      -[UIView removeFromSuperview](self->_shadowedView, "removeFromSuperview");
    }

    self->_shadowedView = 0;
  }
}

- (id)dimmingColor
{
  id result;

  result = (id)qword_100043560;
  if (!qword_100043560)
  {
    result = objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.513725519, 0.521568656, 0.533333361, 1.0);
    qword_100043560 = (uint64_t)result;
  }
  return result;
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  UIColor *v11;
  id v12;
  NSString *v13;
  CABasicAnimation *v14;
  UIColor *v15;
  UIView *dimmingAnimationView;
  UIView *v17;
  double v18;

  v3 = a3;
  if (!-[StackElement item](self, "item"))
    return;
  v5 = objc_msgSend(objc_msgSend(-[NSMutableArray lastObject](self->_animationInfosStack, "lastObject"), "objectForKey:", CFSTR("animated")), "BOOLValue");
  v6 = -[StackElement innerViewCreateIfNeeded:](self, "innerViewCreateIfNeeded:", v3);
  v7 = v6;
  if (!v5)
  {
    if (v3)
    {
LABEL_8:
      v9 = objc_alloc((Class)CAFilter);
      v10 = objc_msgSend(v9, "initWithType:", kCAFilterMultiplyColor);
      objc_msgSend(v10, "setName:", CFSTR("dimFilter"));
      if (v5 | !v3)
        v11 = +[UIColor whiteColor](UIColor, "whiteColor");
      else
        v11 = -[StackElement dimmingColor](self, "dimmingColor");
      objc_msgSend(v10, "setValue:forKey:", -[UIColor CGColor](v11, "CGColor"), CFSTR("inputColor"));
      objc_msgSend(objc_msgSend(v7, "layer"), "setFilters:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v10));
      objc_msgSend(v7, "setUserInteractionEnabled:", 0);
      v12 = v10;
      if (v5)
        goto LABEL_14;
      objc_msgSend(objc_msgSend(v7, "layer"), "removeAnimationForKey:", CFSTR("dim"));
      if (v3)
        return;
LABEL_11:
      objc_msgSend(objc_msgSend(v7, "layer"), "setFilters:", 0);
      return;
    }
LABEL_10:
    objc_msgSend(objc_msgSend(v7, "layer"), "removeAnimationForKey:", CFSTR("dim"));
    goto LABEL_11;
  }
  v8 = objc_msgSend(objc_msgSend(v6, "layer"), "valueForKeyPath:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filters.%@"), CFSTR("dimFilter")));
  if (!v8 && !v3)
    goto LABEL_10;
  if (!v8)
    goto LABEL_8;
LABEL_14:
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filters.%@.inputColor"), CFSTR("dimFilter"));
  v14 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v13);
  -[CABasicAnimation setFromValue:](v14, "setFromValue:", objc_msgSend(objc_msgSend(objc_msgSend(v7, "layer"), "presentationLayer"), "valueForKeyPath:", v13));
  if (v3)
    v15 = -[StackElement dimmingColor](self, "dimmingColor");
  else
    v15 = +[UIColor whiteColor](UIColor, "whiteColor");
  -[CABasicAnimation setDuration:](v14, "setDuration:", UIAnimationDragCoefficient(-[CABasicAnimation setToValue:](v14, "setToValue:", -[UIColor CGColor](v15, "CGColor")))* 0.35);
  -[CABasicAnimation setRemovedOnCompletion:](v14, "setRemovedOnCompletion:", 0);
  -[CABasicAnimation setFillMode:](v14, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(objc_msgSend(v7, "layer"), "addAnimation:forKey:", v14, CFSTR("dim"));
  dimmingAnimationView = self->_dimmingAnimationView;
  if (!dimmingAnimationView)
  {
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    self->_dimmingAnimationView = v17;
    -[UIView setAlpha:](v17, "setAlpha:", 0.0);
    objc_msgSend(v7, "addSubview:", self->_dimmingAnimationView);
    dimmingAnimationView = self->_dimmingAnimationView;
  }
  v18 = 0.0;
  if (v3)
    v18 = 1.0;
  -[UIView setAlpha:](dimmingAnimationView, "setAlpha:", v18);
}

- (void)removeDimmingFilter
{
  id v3;

  v3 = -[StackElement innerViewCreateIfNeeded:](self, "innerViewCreateIfNeeded:", 0);
  objc_msgSend(objc_msgSend(v3, "layer"), "removeAnimationForKey:", CFSTR("dim"));
  objc_msgSend(objc_msgSend(v3, "layer"), "setFilters:", 0);
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  -[UIView removeFromSuperview](self->_dimmingAnimationView, "removeFromSuperview");

  self->_dimmingAnimationView = 0;
}

- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 didStopSelector:(SEL)a6 context:(void *)a7 animated:(BOOL)a8
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a5, a6, a7, a8, a4), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("StackElement.m"), 414, CFSTR("Commented out dead code to avoid analyzer warning"));
}

- (void)commitAnimation
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("StackElement.m"), 434, CFSTR("Commented out dead code to avoid analyzer warning"));
}

- (void)animationDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("StackElement.m"), 445, CFSTR("Commented out dead code to avoid analyzer warning"));
}

- (void)hide:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  id v6;

  v3 = a3;
  v5 = -[StackElement isVisible](self, "isVisible");
  v6 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", v5);
  objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "removeStackedView:", v6);
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 1, 1, 0, 0, v3, 0.35);
  if (v5)
  {
    if (v3
      && -[StackElementDelegate stackIsTerminating](-[StackElement delegate](self, "delegate"), "stackIsTerminating"))
    {
      +[UIView setAnimationDelay:](UIView, "setAnimationDelay:", 0.35);
      +[UIView setAnimationDuration:](UIView, "setAnimationDuration:", 0.0);
    }
    objc_msgSend(v6, "setAlpha:", 0.0);
  }
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (void)showFullsize:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[6];
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;

  v3 = a3;
  v5 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 0);
  objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "setDefaultView:", 0);
  v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v7 = -[StackElementDelegate stackIsTerminating](-[StackElement delegate](self, "delegate"), "stackIsTerminating");
  v8 = -[StackElement isVisible](self, "isVisible");
  v9 = v8;
  if (v3
    && v8
    && v7
    && objc_msgSend(objc_msgSend(objc_msgSend(v5, "superview"), "subviews"), "lastObject") != v5
    && (v11 = objc_opt_class(UIImageView, v10), (objc_opt_isKindOfClass(v5, v11) & 1) != 0))
  {
    v12 = objc_alloc((Class)UIImageView);
    objc_msgSend(v5, "bounds");
    v13 = objc_msgSend(v12, "initWithFrame:");
    objc_msgSend(v13, "setImage:", objc_msgSend(v5, "image"));
    if (v5)
    {
      objc_msgSend(v5, "transform");
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
      v25 = 0u;
    }
    v24[0] = v25;
    v24[1] = v26;
    v24[2] = v27;
    objc_msgSend(v13, "setTransform:", v24);
    objc_msgSend(v5, "center");
    objc_msgSend(v13, "setCenter:");
    v14 = objc_msgSend(v5, "layer");
    v15 = objc_msgSend(v13, "layer");
    objc_msgSend(v15, "setShadowColor:", objc_msgSend(v14, "shadowColor"));
    objc_msgSend(v14, "shadowOffset");
    objc_msgSend(v15, "setShadowOffset:");
    objc_msgSend(v14, "shadowOpacity");
    objc_msgSend(v15, "setShadowOpacity:");
    objc_msgSend(v14, "shadowRadius");
    objc_msgSend(v15, "setShadowRadius:");
    objc_msgSend(v15, "setShadowPath:", objc_msgSend(v14, "shadowPath"));
    objc_msgSend(objc_msgSend(v5, "superview"), "insertSubview:belowSubview:", v13, v5);
    objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("temporaryView"));

  }
  else if ((v9 & 1) != 0)
  {
    -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 2, 1, "fullsizeAnimationDidStop:finished:context:", v6, v3, 0.35);
    -[StackElement fullsizeTransform](self, "fullsizeTransform");
    v17 = v20;
    v18 = v21;
    v19 = v22;
    objc_msgSend(v5, "setTransform:", &v17);
    objc_msgSend(v5, "setAlpha:", 1.0);
    objc_msgSend(objc_msgSend(v5, "layer"), "setBorderWidth:", 0.0);
    -[StackElement setDimmed:](self, "setDimmed:", 0);
    goto LABEL_16;
  }
  v16 = objc_msgSend(v5, "superview");
  if (v7)
  {
    objc_msgSend(v16, "bringSubviewToFront:", v5);
    objc_msgSend(objc_msgSend(v5, "layer"), "setShouldRasterize:", 1);
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("rasterizedView"));
  }
  else
  {
    objc_msgSend(v16, "sendSubviewToBack:", v5);
  }
  -[StackElement fullsizeTransform](self, "fullsizeTransform");
  v23[0] = v23[3];
  v23[1] = v23[4];
  v23[2] = v23[5];
  objc_msgSend(v5, "setTransform:", v23);
  objc_msgSend(v5, "setAlpha:", 0.0);
  -[StackElement setDimmed:](self, "setDimmed:", 0);
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 2, 0, "fullsizeAnimationDidStop:finished:context:", v6, v3, 0.35);
  -[StackElement fullsizeTransform](self, "fullsizeTransform");
  v17 = v20;
  v18 = v21;
  v19 = v22;
  objc_msgSend(v5, "setTransform:", &v17);
  objc_msgSend(v5, "setAlpha:", 1.0);
  objc_msgSend(objc_msgSend(v5, "layer"), "setBorderWidth:", 0.0);
LABEL_16:
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (void)fullsizeAnimationDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  objc_msgSend(objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("rasterizedView"), a4), "layer"), "setShouldRasterize:", 0);
  objc_msgSend(objc_msgSend(a5, "objectForKey:", CFSTR("temporaryView")), "removeFromSuperview");

}

- (void)showDimmed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  _BOOL8 v6;
  int64_t currentState;
  _OWORD v8[6];
  _OWORD v9[6];

  v3 = a3;
  v5 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 1);
  objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "setDefaultView:", v5);
  v6 = -[StackElement isVisible](self, "isVisible");
  if (!v6)
  {
    objc_msgSend(objc_msgSend(v5, "superview"), "sendSubviewToBack:", v5);
    -[StackElement fullsizeTransform](self, "fullsizeTransform");
    v9[0] = v9[3];
    v9[1] = v9[4];
    v9[2] = v9[5];
    objc_msgSend(v5, "setTransform:", v9);
    objc_msgSend(v5, "setAlpha:", 0.0);
    -[StackElement setDimmed:](self, "setDimmed:", 1);
  }
  currentState = self->_currentState;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 3, v6, 0, 0, v3, 0.35);
  if (currentState != 2)
    objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "sizeToFit:", v5);
  -[StackElement fullsizeTransform](self, "fullsizeTransform");
  v8[0] = v8[3];
  v8[1] = v8[4];
  v8[2] = v8[5];
  objc_msgSend(v5, "setTransform:", v8);
  objc_msgSend(v5, "setAlpha:", 1.0);
  objc_msgSend(objc_msgSend(v5, "layer"), "setBorderWidth:", 0.0);
  if (v6)
    -[StackElement setDimmed:](self, "setDimmed:", 1);
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (void)moveIntoStack:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  _BOOL8 v6;
  __int128 v7;
  _BOOL4 v8;
  _OWORD v9[6];
  _OWORD v10[6];
  _OWORD v11[3];

  v3 = a3;
  v5 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 1);
  v6 = -[StackElement isVisible](self, "isVisible");
  if (!v6)
  {
    objc_msgSend(objc_msgSend(v5, "superview"), "bringSubviewToFront:", v5);
    v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v11[1] = v7;
    v11[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v5, "setTransform:", v11);
    objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "stackBounds");
    objc_msgSend(v5, "setFrame:");
    -[StackElement offscreenTransform](self, "offscreenTransform");
    v10[0] = v10[3];
    v10[1] = v10[4];
    v10[2] = v10[5];
    objc_msgSend(v5, "setTransform:", v10);
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[StackElement setDimmed:](self, "setDimmed:", 0);
  }
  v8 = (id)-[StackElement state](self, "state") == (id)3 || (id)-[StackElement state](self, "state") == (id)2;
  objc_msgSend(objc_msgSend(v5, "layer"), "setBorderWidth:", 15.0);
  objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "addStackedView:", v5);
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 4, v6, 0, 0, v3, 0.35);
  -[StackElementDelegate stackElement:delayForAnimation:](-[StackElement delegate](self, "delegate"), "stackElement:delayForAnimation:", self, 0);
  +[UIView setAnimationDelay:](UIView, "setAnimationDelay:");
  if (v8)
  {
    objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "stackBounds");
    objc_msgSend(v5, "setFrame:");
  }
  -[StackElement onStackTransform](self, "onStackTransform");
  v9[0] = v9[3];
  v9[1] = v9[4];
  v9[2] = v9[5];
  objc_msgSend(v5, "setTransform:", v9);
  objc_msgSend(v5, "setAlpha:", 1.0);
  if (v6)
    -[StackElement setDimmed:](self, "setDimmed:", 0);
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (void)moveOutFromStack:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  unsigned int v6;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = a3;
  v5 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 0);
  v6 = -[StackElement isVisible](self, "isVisible");
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 5, 1, 0, 0, v3, 0.35);
  if (v6)
  {
    -[StackElementDelegate stackElement:delayForAnimation:](-[StackElement delegate](self, "delegate"), "stackElement:delayForAnimation:", self, 1);
    +[UIView setAnimationDelay:](UIView, "setAnimationDelay:");
    if (self)
    {
      -[StackElement offscreenTransform](self, "offscreenTransform");
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    objc_msgSend(v5, "setTransform:", v7);
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[StackElement setDimmed:](self, "setDimmed:", 0);
  }
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (void)fadeOutUnderneathStack:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  unsigned int v6;

  v3 = a3;
  v5 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 0);
  v6 = -[StackElement isVisible](self, "isVisible");
  objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "removeStackedView:", v5);
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 6, 1, 0, 0, v3, 1.0);
  if (v6)
    objc_msgSend(v5, "setAlpha:", 0.0);
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (void)fadeInUnderneathStack:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[6];

  v3 = a3;
  v5 = -[StackElement outerViewCreateIfNeeded:](self, "outerViewCreateIfNeeded:", 1);
  objc_msgSend(-[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView"), "addStackedView:", v5);
  if (-[StackElement isVisible](self, "isVisible") && (id)-[StackElement previousState](self, "previousState") != (id)6)
  {
    -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 4, 1, 0, 0, v3, 0.05);
    -[StackElement onStackTransform](self, "onStackTransform");
    v6 = v9;
    v7 = v10;
    v8 = v11;
    objc_msgSend(v5, "setTransform:", &v6);
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[StackElement setDimmed:](self, "setDimmed:", 0);
  }
  else
  {
    objc_msgSend(objc_msgSend(v5, "superview"), "sendSubviewToBack:", v5);
    -[StackElement onStackTransform](self, "onStackTransform");
    v12[0] = v12[3];
    v12[1] = v12[4];
    v12[2] = v12[5];
    objc_msgSend(v5, "setTransform:", v12);
    objc_msgSend(v5, "setAlpha:", 0.0);
    -[StackElement setDimmed:](self, "setDimmed:", 0);
    -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:didStopSelector:context:animated:", 4, 0, 0, 0, v3, 0.05);
    -[StackElement onStackTransform](self, "onStackTransform");
    v6 = v9;
    v7 = v10;
    v8 = v11;
    objc_msgSend(v5, "setTransform:", &v6);
    objc_msgSend(v5, "setAlpha:", 1.0);
  }
  -[StackElement commitAnimation](self, "commitAnimation");
}

- (CGAffineTransform)fullsizeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CGAffineTransform)offscreenTransform
{
  id v4;
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
  double width;
  double height;
  double v22;
  double v23;

  v4 = -[StackElementDelegate stackContainerView](self->_delegate, "stackContainerView");
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v22 = v10;
  v23 = v9;
  objc_msgSend(v4, "stackBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  switch((unint64_t)-[StackElementDelegate transitionEdge](-[StackElement delegate](self, "delegate"), "transitionEdge"))
  {
    case 1uLL:
      height = v8 - (v14 + v18);
      break;
    case 2uLL:
      width = v6 - (v12 + v16);
      break;
    case 4uLL:
      height = v8 + v22 - v14;
      break;
    case 8uLL:
      width = v6 + v23 - v12;
      break;
    default:
      return -[StackElement _affineTransformWithTranslation:](self, "_affineTransformWithTranslation:", width, height);
  }
  return -[StackElement _affineTransformWithTranslation:](self, "_affineTransformWithTranslation:", width, height);
}

- (CGAffineTransform)onStackTransform
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransformWithTranslation:](self, "_affineTransformWithTranslation:", CGSizeZero.width, CGSizeZero.height);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGAffineTransform)_affineTransformWithTranslation:(SEL)a3
{
  int64_t v6;
  __int128 v7;
  CGAffineTransform *result;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(retstr, a4.width, a4.height);
  v6 = -[StackElement orientation](self, "orientation");
  v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformRotate(&v11, &v10, (double)(~(3 * ((v6 + 1) / 3)) + v6 + 1) * 1.5 * 3.14159265 / 180.0);
  v9 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  return result;
}

- (StackElementDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (StackElementDelegate *)a3;
}

- (id)item
{
  return self->_item;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

@end
