@implementation RPTActivationInteraction

- (id)initForAction:(unint64_t)a3 window:(id)a4
{
  id v7;
  RPTActivationInteraction *v8;
  RPTActivationInteraction *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RPTActivationInteraction;
  v8 = -[RPTActivationInteraction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_action = a3;
    objc_storeStrong((id *)&v8->_window, a4);
  }

  return v9;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v5;

  v5 = a3;
  -[RPTActivationInteraction actionPoint](self, "actionPoint");
  objc_msgSend(v5, "pointerOrFingerTap:");

}

- (id)reversedInteraction
{
  return -[RPTActivationInteraction initForAction:window:]([RPTActivationInteraction alloc], "initForAction:window:", -[RPTActivationInteraction action](self, "action") == 0, self->_window);
}

- (CGPoint)actionPoint
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MaxX;
  CGFloat MinY;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;
  CGPoint v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v3 = -[RPTActivationInteraction action](self, "action");
  -[RPTActivationInteraction window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_rpt_safeVisibleFrameOfScreen");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[RPTActivationInteraction window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v28 = CGRectInset(v27, -10.0, -10.0);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;

    v29.origin.x = v7;
    v29.origin.y = v9;
    v29.size.width = v11;
    v29.size.height = v13;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v30 = CGRectIntersection(v29, v33);
    MaxX = v30.origin.x;
    MinY = v30.origin.y;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v26.x = MaxX;
    v26.y = MinY;
    if (CGRectContainsPoint(v30, v26))
    {
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      MaxX = CGRectGetMaxX(v31);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      MinY = CGRectGetMinY(v32);
    }
  }
  else
  {
    objc_msgSend(v4, "rpt_accessibilityActivationPointAttribute");
    MaxX = v21;
    MinY = v22;

  }
  v23 = MaxX;
  v24 = MinY;
  result.y = v24;
  result.x = v23;
  return result;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
