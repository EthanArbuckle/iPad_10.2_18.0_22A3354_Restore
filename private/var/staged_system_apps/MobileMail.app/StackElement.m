@implementation StackElement

- (StackElement)initWithItem:(id)a3 state:(int64_t)a4
{
  id v7;
  StackElement *v8;
  StackElement *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)StackElement;
  v8 = -[StackElement init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_item, a3);
    v9->_nextState = a4;
    v9->_targetState = a4;
    v9->_previousState = a4;
    v9->_currentState = a4;
    v9->_nextDepth = 0;
    v9->_targetDepth = 0;
  }

  return v9;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  unint64_t previousState;
  __CFString *v8;
  unint64_t currentState;
  __CFString *v10;
  unint64_t nextState;
  __CFString *v12;
  unint64_t targetState;
  __CFString *v14;
  void *v15;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)v5;
  previousState = self->_previousState;
  if (previousState > 6)
    v8 = 0;
  else
    v8 = off_100523958[previousState];
  currentState = self->_currentState;
  if (currentState > 6)
    v10 = 0;
  else
    v10 = off_100523958[currentState];
  nextState = self->_nextState;
  if (nextState > 6)
    v12 = 0;
  else
    v12 = off_100523958[nextState];
  targetState = self->_targetState;
  if (targetState > 6)
    v14 = 0;
  else
    v14 = off_100523958[targetState];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, states: prev (%@) cur (%@) next (%@) target (%@), item: %@>"), v5, self, v8, v10, v12, v14, self->_item));

  return v15;
}

- (void)setNextState:(int64_t)a3 nextDepth:(int64_t)a4 animated:(BOOL)a5
{
  int64_t nextState;
  int64_t nextDepth;

  nextState = self->_nextState;
  nextDepth = self->_nextDepth;
  if (nextState != a3 || nextDepth != a4)
  {
    self->_nextState = a3;
    self->_nextDepth = a4;
    if (self->_previousState == a3)
      self->_previousState = nextState;
    switch(a3)
    {
      case 1:
        -[StackElement hide:](self, "hide:", a5);
        goto LABEL_18;
      case 2:
        -[StackElement showFullsize:](self, "showFullsize:", a5);
        goto LABEL_18;
      case 3:
        -[StackElement showDimmed:](self, "showDimmed:", a5);
        goto LABEL_18;
      case 4:
        if (nextState == 4)
        {
          if (nextDepth == a4)
            goto LABEL_18;
        }
        else if (nextState == 6)
        {
          -[StackElement fadeInUnderneathStack:previousDepth:](self, "fadeInUnderneathStack:previousDepth:", a5);
          goto LABEL_18;
        }
        -[StackElement moveIntoStack:](self, "moveIntoStack:", a5);
LABEL_18:
        if (!a5)
          -[StackElement setCurrentState:](self, "setCurrentState:", a3);
        return;
      case 5:
        -[StackElement moveOutFromStack:](self, "moveOutFromStack:", a5);
        goto LABEL_18;
      case 6:
        -[StackElement fadeOutUnderneathStack:previousDepth:](self, "fadeOutUnderneathStack:previousDepth:", a5);
        goto LABEL_18;
      default:
        goto LABEL_18;
    }
  }
}

- (BOOL)isVisible
{
  unint64_t v2;

  v2 = -[StackElement currentState](self, "currentState");
  return (v2 > 6) | (0x1Du >> v2) & 1;
}

- (void)setCurrentState:(int64_t)a3
{
  int64_t previousState;
  id v6;

  if (self->_currentState != a3)
  {
    previousState = self->_previousState;
    self->_currentState = a3;
    self->_nextState = a3;
    self->_previousState = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
    objc_msgSend(v6, "stackElement:currentStateDidChangeFrom:to:", self, previousState, a3);

  }
}

- (void)setTargetState:(int64_t)a3
{
  int64_t targetState;
  id v6;

  targetState = self->_targetState;
  if (targetState != a3)
  {
    self->_targetState = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
    objc_msgSend(v6, "stackElement:targetStateDidChangeFrom:to:", self, targetState, a3);

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
  if ((id)-[StackElement currentState](self, "currentState") == (id)2)
    -[StackElement removeDimmingFilter](self, "removeDimmingFilter");
  -[StackElement removeItemView](self, "removeItemView");
}

- (UIView)itemView
{
  return (UIView *)-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 1);
}

- (id)itemViewCreateIfNeeded:(BOOL)a3
{
  UIView *itemView;
  BOOL v5;
  void *v6;
  UIView *v7;
  void *v8;
  UIView *v9;

  itemView = self->_itemView;
  if (itemView)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate", a3));
    v7 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewForStackElement:", self));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v7, "layer"));
    objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

    v9 = self->_itemView;
    self->_itemView = v7;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void)removeItemView
{
  void *v3;
  UIView *itemView;

  if (self->_itemView)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
    objc_msgSend(v3, "stackElement:willRemoveView:", self, self->_itemView);

    -[UIView removeFromSuperview](self->_itemView, "removeFromSuperview");
    itemView = self->_itemView;
    self->_itemView = 0;

  }
}

- (void)updateViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  __int128 v10;
  _OWORD v11[6];
  _OWORD v12[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 0));
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v12[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v12[1] = v10;
    v12[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v8, "setTransform:", v12);
    objc_msgSend(v9, "setFrame:", x, y, width, height);
    -[StackElement stackTransformWithDepth:](self, "stackTransformWithDepth:", -[StackElement targetDepth](self, "targetDepth"));
    v11[0] = v11[3];
    v11[1] = v11[4];
    v11[2] = v11[5];
    objc_msgSend(v9, "setTransform:", v11);
  }

}

- (id)dimmingColor
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1005AA5B0;
  if (!qword_1005AA5B0)
  {
    v3 = objc_msgSend(objc_alloc((Class)UIColor), "initWithWhite:alpha:", 0.831372549, 1.0);
    v4 = (void *)qword_1005AA5B0;
    qword_1005AA5B0 = (uint64_t)v3;

    v2 = (void *)qword_1005AA5B0;
  }
  return v2;
}

- (void)setDimmed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  UIView *dimmingAnimationView;
  UIView *v30;
  UIView *v31;
  double v32;
  id v33;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement item](self, "item"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", v5));
    v33 = v8;
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filters.%@"), CFSTR("dimFilter")));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", v10));

      v8 = v33;
      if (v11)
        goto LABEL_9;
    }
    else
    {
      v11 = 0;
    }
    if (!v5)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
      objc_msgSend(v12, "removeAnimationForKey:", CFSTR("dim"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      objc_msgSend(v13, "setFilters:", 0);
      v14 = v13;
      v11 = 0;
      goto LABEL_25;
    }
LABEL_9:
    if (!v11)
    {
      v15 = objc_alloc((Class)CAFilter);
      v11 = objc_msgSend(v15, "initWithType:", kCAFilterMultiplyColor);
      objc_msgSend(v11, "setName:", CFSTR("dimFilter"));
      if (!v5 || v4)
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      else
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement dimmingColor](self, "dimmingColor"));
      v17 = v16;
      objc_msgSend(v11, "setValue:forKey:", objc_msgSend(objc_retainAutorelease(v16), "CGColor"), CFSTR("inputColor"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      objc_msgSend(v19, "setFilters:", v18);

      objc_msgSend(v33, "setUserInteractionEnabled:", 0);
    }
    if (v4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("filters.%@.inputColor"), CFSTR("dimFilter")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", v14));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentationLayer"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "valueForKeyPath:", v14));
      objc_msgSend(v20, "setFromValue:", v23);

      if (v5)
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement dimmingColor](self, "dimmingColor"));
      else
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      v26 = v24;
      objc_msgSend(v20, "setToValue:", objc_msgSend(objc_retainAutorelease(v24), "CGColor"));

      objc_msgSend(v20, "setDuration:", UIAnimationDragCoefficient(v27) * 0.35);
      objc_msgSend(v20, "setRemovedOnCompletion:", 0);
      objc_msgSend(v20, "setFillMode:", kCAFillModeForwards);
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      objc_msgSend(v28, "addAnimation:forKey:", v20, CFSTR("dim"));

      dimmingAnimationView = self->_dimmingAnimationView;
      if (!dimmingAnimationView)
      {
        v30 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v31 = self->_dimmingAnimationView;
        self->_dimmingAnimationView = v30;

        -[UIView setAlpha:](self->_dimmingAnimationView, "setAlpha:", 0.0);
        objc_msgSend(v33, "addSubview:", self->_dimmingAnimationView);
        dimmingAnimationView = self->_dimmingAnimationView;
      }
      v32 = 0.0;
      if (v5)
        v32 = 1.0;
      -[UIView setAlpha:](dimmingAnimationView, "setAlpha:", v32);

    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      objc_msgSend(v25, "removeAnimationForKey:", CFSTR("dim"));

      if (v5)
      {
LABEL_26:

        return;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
      objc_msgSend(v14, "setFilters:", 0);
    }
LABEL_25:

    goto LABEL_26;
  }
}

- (void)removeDimmingFilter
{
  void *v3;
  void *v4;
  UIView *dimmingAnimationView;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("dim"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v4, "setFilters:", 0);

  objc_msgSend(v6, "setUserInteractionEnabled:", 1);
  -[UIView removeFromSuperview](self->_dimmingAnimationView, "removeFromSuperview");
  dimmingAnimationView = self->_dimmingAnimationView;
  self->_dimmingAnimationView = 0;

}

- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 animated:(BOOL)a6 animations:(id)a7
{
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:completion:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:completion:", a3, a5, a6, a7, 0, a4);
}

- (void)beginAnimationToState:(int64_t)a3 withDuration:(double)a4 beginsFromCurrentState:(BOOL)a5 animated:(BOOL)a6 animations:(id)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v12;
  id v13;
  _QWORD *v14;
  double v15;
  _QWORD v16[5];
  id v17;
  int64_t v18;

  v9 = a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001DA77C;
  v16[3] = &unk_100523938;
  v16[4] = self;
  v18 = a3;
  v12 = a8;
  v17 = v12;
  v13 = a7;
  v14 = objc_retainBlock(v16);
  self->_currentState = 0;
  v15 = 0.0;
  if (v9)
    v15 = a4;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v13, v14, v15, 0.0);

}

- (void)hide:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;

  v3 = a3;
  v5 = -[StackElement isVisible](self, "isVisible");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DA8B0;
  v7[3] = &unk_10051C6A8;
  v9 = v5;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", v5));
  v6 = v8;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:", 1, 1, v3, v7, 0.35);

}

- (void)showFullsize:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  StackElement *v22;
  BOOL v23;
  BOOL v24;
  _OWORD v25[6];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
  v7 = objc_msgSend(v6, "stackIsTerminating");

  v8 = -[StackElement isVisible](self, "isVisible");
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    if (v7)
    {
      objc_msgSend(v10, "bringSubviewToFront:", v5);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
      objc_msgSend(v11, "setShouldRasterize:", 1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v12, "scale");
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
      objc_msgSend(v15, "setRasterizationScale:", v14);

      v9 = v5;
    }
    else
    {
      objc_msgSend(v10, "sendSubviewToBack:", v5);

      v9 = 0;
    }
    -[StackElement fullsizeTransform](self, "fullsizeTransform");
    v25[0] = v25[3];
    v25[1] = v25[4];
    v25[2] = v25[5];
    objc_msgSend(v5, "setTransform:", v25);
    objc_msgSend(v5, "setAlpha:", 0.0);
    -[StackElement setDimmed:animated:](self, "setDimmed:animated:", 0, 0);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001DAB58;
  v20[3] = &unk_10051E6D8;
  v16 = v5;
  v21 = v16;
  v22 = self;
  v23 = v8;
  v24 = v3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001DABDC;
  v18[3] = &unk_10051A848;
  v19 = v9;
  v17 = v9;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:completion:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:completion:", 2, v8, v3, v20, v18, 0.35);

}

- (void)showDimmed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  StackElement *v12;
  BOOL v13;
  BOOL v14;
  _OWORD v15[6];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 1));
  v6 = -[StackElement isVisible](self, "isVisible");
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
    objc_msgSend(v7, "sendSubviewToBack:", v5);

    -[StackElement fullsizeTransform](self, "fullsizeTransform");
    v15[0] = v15[3];
    v15[1] = v15[4];
    v15[2] = v15[5];
    objc_msgSend(v5, "setTransform:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v8, "setBorderWidth:", 0.0);

    objc_msgSend(v5, "setAlpha:", 0.0);
    -[StackElement setDimmed:animated:](self, "setDimmed:animated:", 1, 0);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001DAD9C;
  v10[3] = &unk_10051E6D8;
  v9 = v5;
  v11 = v9;
  v12 = self;
  v13 = v6;
  v14 = v3;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:", 3, v6, v3, v10, 0.35);

}

- (void)moveIntoStack:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  BOOL v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 1));
  v6 = -[StackElement isVisible](self, "isVisible");
  if (!v6)
  {
    -[StackElement updateItemView:onStack:adjustSubviewIndex:](self, "updateItemView:onStack:adjustSubviewIndex:", v5, 0, 1);
    objc_msgSend(v5, "setAlpha:", 1.0);
    -[StackElement setDimmed:animated:](self, "setDimmed:animated:", 0, 0);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DAF64;
  v8[3] = &unk_10051E6D8;
  v8[4] = self;
  v7 = v5;
  v9 = v7;
  v10 = v6;
  v11 = v3;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:", 4, v6, v3, v8, 0.35);

}

- (void)moveOutFromStack:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 1));
  v6 = -[StackElement isVisible](self, "isVisible");
  if (!v6)
  {
    -[StackElement updateItemView:onStack:adjustSubviewIndex:](self, "updateItemView:onStack:adjustSubviewIndex:", v5, 1, 1);
    objc_msgSend(v5, "setAlpha:", 1.0);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DB0B0;
  v8[3] = &unk_100520BF8;
  v8[4] = self;
  v7 = v5;
  v9 = v7;
  v10 = v3;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:", 5, v6, v3, v8, 0.35);

}

- (void)fadeOutUnderneathStack:(BOOL)a3 previousDepth:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  unsigned int v8;
  id v9;
  double v10;
  int64_t nextDepth;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  char v23;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 0));
  v8 = -[StackElement isVisible](self, "isVisible");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001DB2C0;
  v21[3] = &unk_100520BF8;
  v23 = v8;
  v21[4] = self;
  v9 = v7;
  v22 = v9;
  v10 = 0.35;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:", 6, 1, v5, v21, 0.35);
  if (v8)
  {
    nextDepth = self->_nextDepth;
    v12 = 0.0;
    v13 = nextDepth - a4;
    if (nextDepth > a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
      v15 = (double)v13;
      v16 = (double)((unint64_t)objc_msgSend(v14, "maximumStackElementDepth") - a4);

      v17 = 1.0 / (double)v13;
      if (v17 < 0.0)
        v17 = -(1.0 / v15);
      v10 = v17 * 0.35;
      v18 = v16 / v15;
      if (v16 / v15 < 0.0)
        v18 = -(v16 / v15);
      v12 = v18 * 0.35;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001DB2D8;
    v19[3] = &unk_10051AA98;
    v20 = v9;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v19, 0, v10, v12);

  }
}

- (void)fadeInUnderneathStack:(BOOL)a3 previousDepth:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  id v9;
  int64_t nextDepth;
  uint64_t v11;
  void *v12;
  float64x2_t v18;
  float64x2_t v19;
  uint64_t v20;
  id v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  char v28;
  BOOL v29;

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement itemViewCreateIfNeeded:](self, "itemViewCreateIfNeeded:", 1));
  if (-[StackElement isVisible](self, "isVisible") && (id)-[StackElement previousState](self, "previousState") != (id)6)
  {
    v8 = 1;
  }
  else
  {
    -[StackElement updateItemView:onStack:adjustSubviewIndex:stackDepth:](self, "updateItemView:onStack:adjustSubviewIndex:stackDepth:", v7, 1, 1, a4);
    objc_msgSend(v7, "setAlpha:", 0.0);
    -[StackElement setDimmed:animated:](self, "setDimmed:animated:", 0, 0);
    v8 = 0;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001DB52C;
  v26[3] = &unk_10051E6D8;
  v26[4] = self;
  v9 = v7;
  v27 = v9;
  v28 = v8;
  v29 = v5;
  -[StackElement beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:](self, "beginAnimationToState:withDuration:beginsFromCurrentState:animated:animations:", 4, v8, v5, v26, 0.35);
  nextDepth = self->_nextDepth;
  v11 = a4 - nextDepth;
  if (a4 <= nextDepth)
  {
    v19.f64[1] = 0.35;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
    v22 = (double)(uint64_t)(~(unint64_t)objc_msgSend(v12, "maximumStackElementDepth") + a4);

    __asm { FMOV            V0.2D, #1.0 }
    _Q0.f64[0] = v22;
    v18 = vdivq_f64(_Q0, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v11), 0));
    v19 = vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v18), (int8x16_t)vnegq_f64(v18), (int8x16_t)v18), (float64x2_t)vdupq_n_s64(0x3FD6666666666666uLL));
  }
  v23 = v19.f64[1];
  if ((_DWORD)v8)
    v20 = 4;
  else
    v20 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001DB574;
  v24[3] = &unk_10051AA98;
  v21 = v9;
  v25 = v21;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v20, v24, 0, v23);

}

- (void)updateItemView:(id)a3
{
  -[StackElement updateItemView:onStack:](self, "updateItemView:onStack:", a3, 1);
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4
{
  -[StackElement updateItemView:onStack:stackDepth:](self, "updateItemView:onStack:stackDepth:", a3, a4, self->_nextDepth);
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4 stackDepth:(int64_t)a5
{
  -[StackElement updateItemView:onStack:adjustSubviewIndex:stackDepth:](self, "updateItemView:onStack:adjustSubviewIndex:stackDepth:", a3, a4, 0, a5);
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4 adjustSubviewIndex:(BOOL)a5
{
  -[StackElement updateItemView:onStack:adjustSubviewIndex:stackDepth:](self, "updateItemView:onStack:adjustSubviewIndex:stackDepth:", a3, a4, a5, self->_nextDepth);
}

- (void)updateItemView:(id)a3 onStack:(BOOL)a4 adjustSubviewIndex:(BOOL)a5 stackDepth:(int64_t)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  double x;
  double y;
  double v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _OWORD v22[6];

  v7 = a5;
  v8 = a4;
  v10 = a3;
  if (v8)
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  else
  {
    -[StackElement offStackTranslation](self, "offStackTranslation");
  }
  -[StackElement stackTransformWithDepth:translation:](self, "stackTransformWithDepth:translation:", a6, x, y);
  v22[0] = v22[3];
  v22[1] = v22[4];
  v22[2] = v22[5];
  objc_msgSend(v10, "setTransform:", v22);
  -[StackElement borderWidthWithStackDepth:](self, "borderWidthWithStackDepth:", a6);
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v15, "setBorderWidth:", v14);

  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[StackElement borderColorWithStackDepth:](self, "borderColorWithStackDepth:", a6)));
  v17 = objc_msgSend(v16, "CGColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v18, "setBorderColor:", v17);

  if (v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewBelowStackElement:", self));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));
    if (v20)
      objc_msgSend(v21, "insertSubview:aboveSubview:", v10, v20);
    else
      objc_msgSend(v21, "sendSubviewToBack:", v10);

  }
}

- (double)borderWidthWithStackDepth:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "scale");
  v7 = 1.0 / v6;

  -[StackElement _scaleFactorWithDepth:translation:](self, "_scaleFactorWithDepth:translation:", a3, 0);
  return v7 * (1.0 / v8);
}

- (id)borderColorWithStackDepth:(int64_t)a3
{
  void *v4;
  id v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StackElement delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "maximumStackElementDepth");

  if ((uint64_t)v5 >= a3)
    v6 = a3;
  else
    v6 = (int64_t)v5;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, (double)v6 * -0.05 + 0.4);
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

- (CGAffineTransform)stackTransformWithDepth:(SEL)a3
{
  return -[StackElement stackTransformWithDepth:translation:](self, "stackTransformWithDepth:translation:", a4, CGPointZero.x, CGPointZero.y);
}

- (CGAffineTransform)stackTransformWithDepth:(SEL)a3 translation:(int64_t)a4
{
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  __int128 v12;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGPoint v16;

  y = a5.y;
  x = a5.x;
  v16 = CGPointZero;
  -[StackElement _scaleFactorWithDepth:translation:](self, "_scaleFactorWithDepth:translation:", a4, &v16);
  v9 = v8;
  v11 = v10;
  *(_QWORD *)&v12 = -1;
  *((_QWORD *)&v12 + 1) = -1;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = v12;
  *(_OWORD *)&v15.a = v12;
  CGAffineTransformMakeTranslation(&v15, x + v16.x, y + v16.y);
  v14 = v15;
  return CGAffineTransformScale(retstr, &v14, v9, v11);
}

- (CGSize)_scaleFactorWithDepth:(int64_t)a3 translation:(CGPoint *)a4
{
  id WeakRetained;
  void *v8;
  __n128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  __n128 v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stackContainerView"));

  -[StackElement _stackContainerSize](self, "_stackContainerSize");
  v11 = v9.n128_f64[0];
  v12 = v10;
  v13 = 1.0;
  v14 = CGSizeZero.width == v9.n128_f64[0] && CGSizeZero.height == v10;
  v15 = 1.0;
  if (!v14)
  {
    v16 = v9.n128_f64[0] + -64.0;
    v9.n128_f64[0] = v10 * ((v9.n128_f64[0] + -64.0) / v9.n128_f64[0]);
    v17.n128_f64[0] = UIRoundToViewScale(v8, v9);
    v18 = v17.n128_f64[0];
    if (a3)
    {
      v16 = v16 + (double)a3 * -2.0 * 4.0;
      v17.n128_f64[0] = v12 * (v16 / v11);
      v17.n128_f64[0] = UIRoundToViewScale(v8, v17);
      if (!a4)
      {
LABEL_8:
        v13 = v16 / v11;
        v15 = v17.n128_f64[0] / v12;
        goto LABEL_9;
      }
    }
    else if (!a4)
    {
      goto LABEL_8;
    }
    a4->x = 0.0;
    a4->y = (v18 - v17.n128_f64[0]) * -0.5 + (double)a3 * -4.0;
    goto LABEL_8;
  }
LABEL_9:

  v19 = v13;
  v20 = v15;
  result.height = v20;
  result.width = v19;
  return result;
}

- (CGPoint)offStackTranslation
{
  double v3;
  double v4;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  CGPoint result;

  -[StackElement _stackContainerSize](self, "_stackContainerSize");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stackContainerView"));
  v7 = objc_msgSend(v6, "_shouldReverseLayoutDirection");

  v8 = -v4;
  if (v7)
    v8 = v4;
  v9 = 0.0;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)_stackContainerSize
{
  id WeakRetained;
  void *v3;
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
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stackContainerView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  objc_msgSend(WeakRetained, "stackContainerViewEdgeInsets");
  v10 = v5 - (v8 + v9);
  v13 = v7 - (v11 + v12);

  v14 = v10;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (StackElementDelegate)delegate
{
  return (StackElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)item
{
  return self->_item;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)nextState
{
  return self->_nextState;
}

- (int64_t)targetState
{
  return self->_targetState;
}

- (int64_t)nextDepth
{
  return self->_nextDepth;
}

- (int64_t)targetDepth
{
  return self->_targetDepth;
}

- (void)setTargetDepth:(int64_t)a3
{
  self->_targetDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_dimmingAnimationView, 0);
}

@end
