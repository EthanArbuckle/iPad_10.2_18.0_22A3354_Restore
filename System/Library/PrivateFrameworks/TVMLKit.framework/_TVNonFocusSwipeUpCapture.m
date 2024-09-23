@implementation _TVNonFocusSwipeUpCapture

- (_TVNonFocusSwipeUpCapture)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  _TVNonFocusSwipeUpCapture *v7;
  _TVNonFocusSwipeUpCapture *v8;
  UIPanGestureRecognizer *v9;
  UIPanGestureRecognizer *gestureRecognizer;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TVNonFocusSwipeUpCapture;
  v7 = -[_TVNonFocusSwipeUpCapture init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_action = a4;
    v9 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", v8, sel__onPan_);
    -[UIPanGestureRecognizer setDelegate:](v9, "setDelegate:", v8);
    -[UIPanGestureRecognizer setEnabled:](v9, "setEnabled:", 0);
    gestureRecognizer = v8->_gestureRecognizer;
    v8->_gestureRecognizer = v9;

  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isDescendantOfView:", v7);
  return (char)v5;
}

- (void)_onPan:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CGPoint *p_translation;
  CGFloat v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGPoint *p_velocity;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  double y;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void (*v23)(void *, SEL);
  void *v24;
  CGPoint v25;
  id v26;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  self->_translation.x = v6;
  p_translation = &self->_translation;
  self->_translation.y = v8;

  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "velocityInView:", v9);
  self->_velocity.x = v10;
  self->_velocity.y = v11;
  p_velocity = &self->_velocity;

  v13 = objc_msgSend(v4, "state");
  if (v13 == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_initiallyFocusedView);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "focusedView");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (WeakRetained != v17)
      goto LABEL_15;
    y = self->_translation.y;
    if (y > -500.0)
      goto LABEL_15;
    if (fabs(y) <= fabs(p_translation->x))
      goto LABEL_15;
    v19 = self->_velocity.y;
    if (v19 > -200.0 || fabs(v19) <= fabs(p_velocity->x))
      goto LABEL_15;
    -[_TVNonFocusSwipeUpCapture target](self, "target");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "methodSignatureForSelector:", -[_TVNonFocusSwipeUpCapture action](self, "action"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVNonFocusSwipeUpCapture target](self, "target");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void (*)(void *, SEL))objc_msgSend(v22, "methodForSelector:", -[_TVNonFocusSwipeUpCapture action](self, "action"));

    if (objc_msgSend(v21, "numberOfArguments") == 2)
    {
      -[_TVNonFocusSwipeUpCapture target](self, "target");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23(v24, -[_TVNonFocusSwipeUpCapture action](self, "action"));
    }
    else
    {
      if (objc_msgSend(v21, "numberOfArguments") != 3)
      {
LABEL_14:

LABEL_15:
        objc_storeWeak((id *)&self->_initiallyFocusedView, 0);
        v25 = (CGPoint)*MEMORY[0x24BDBEFB0];
        *p_translation = *(CGPoint *)MEMORY[0x24BDBEFB0];
        *p_velocity = v25;
        return;
      }
      -[_TVNonFocusSwipeUpCapture target](self, "target");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void *, SEL, _TVNonFocusSwipeUpCapture *))v23)(v24, -[_TVNonFocusSwipeUpCapture action](self, "action"), self);
    }

    goto LABEL_14;
  }
  if (v13 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "focusedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_initiallyFocusedView, v14);

  }
}

- (UIPanGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_initiallyFocusedView);
}

@end
