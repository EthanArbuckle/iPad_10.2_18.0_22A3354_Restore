@implementation UIInputViewAnimationStyleDirectional

- (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIInputViewAnimationStyleDirectional;
  -[UIInputViewAnimationStyle endPlacementForInputViewSet:windowScene:](&v9, sel_endPlacementForInputViewSet_windowScene_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection");
    objc_msgSend((id)objc_opt_class(), "placement");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  id v6;
  id v7;
  UIInputViewAnimationControllerSlide *v8;
  UIInputViewAnimationControllerSlide *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "showsInputViews")
    && objc_msgSend(v7, "showsInputViews")
    && (-[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection") == 4
     || -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection") == 5))
  {
    v8 = -[UIInputViewAnimationControllerSlide initWithSlide:]([UIInputViewAnimationControllerSlide alloc], "initWithSlide:", -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection"));
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIInputViewAnimationStyleDirectional;
    -[UIInputViewAnimationStyle controllerForStartPlacement:endPlacement:](&v11, sel_controllerForStartPlacement_endPlacement_, v6, v7);
    v8 = (UIInputViewAnimationControllerSlide *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)animationStyleAnimated:(BOOL)a3 duration:(double)a4 outDirection:(int)a5
{
  uint64_t v5;
  void *v6;
  objc_super v8;

  v5 = *(_QWORD *)&a5;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___UIInputViewAnimationStyleDirectional;
  objc_msgSendSuper2(&v8, sel_animationStyleAnimated_duration_, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOutDirection:", v5);
  return v6;
}

- (void)setOutDirection:(int)a3
{
  self->_outDirection = a3;
}

- (id)startPlacementForInputViewSet:(id)a3 currentPlacement:(id)a4 windowScene:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIInputViewAnimationStyleDirectional;
  -[UIInputViewAnimationStyle startPlacementForInputViewSet:currentPlacement:windowScene:](&v13, sel_startPlacementForInputViewSet_currentPlacement_windowScene_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection");
    objc_msgSend((id)objc_opt_class(), "placement");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;

  return v11;
}

- (int)outDirection
{
  return self->_outDirection;
}

- (BOOL)canDismissWithScrollView
{
  return -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection") == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewAnimationStyleDirectional;
  if (-[UIInputViewAnimationStyle isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection");
    v6 = v5 == objc_msgSend(v4, "outDirection");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewAnimationStyleDirectional;
  v4 = -[UIInputViewAnimationStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOutDirection:", -[UIInputViewAnimationStyleDirectional outDirection](self, "outDirection"));
  return v4;
}

@end
