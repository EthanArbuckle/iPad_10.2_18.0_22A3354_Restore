@implementation UITableViewWrapperView

- (void)willRemoveSubview:(id)a3
{
  -[NSMutableArray removeObject:](self->_stuckToBackViews, "removeObject:", a3);
}

- (NSArray)stuckToBackViews
{
  return &self->_stuckToBackViews->super;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v8 = a5;
  _UITableViewSubviewToMoveForView(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)UITableViewWrapperView;
  -[UIView _addSubview:positioned:relativeTo:](&v10, sel__addSubview_positioned_relativeTo_, v9, a4, v8);

}

- (void)_unstickView:(id)a3
{
  id v4;
  UITableViewWrapperView *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4)
  {
    -[NSMutableArray removeObject:](self->_stuckToBackViews, "removeObject:", v4);
    v4 = v10;
  }
  objc_msgSend(v4, "superview");
  v5 = (UITableViewWrapperView *)objc_claimAutoreleasedReturnValue();
  if (v5 != self)
  {

LABEL_7:
    v9 = v10;
    goto LABEL_8;
  }
  -[UIView subviews](self, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v10);
  v8 = -[NSMutableArray count](self->_stuckToBackViews, "count");

  v9 = v10;
  if (v7 < v8)
  {
    -[UITableViewWrapperView bringSubviewToFront:](self, "bringSubviewToFront:", v10);
    goto LABEL_7;
  }
LABEL_8:

}

- (UITableViewWrapperView)initWithFrame:(CGRect)a3
{
  UITableViewWrapperView *v3;
  UITableViewWrapperView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITableViewWrapperView;
  v3 = -[UIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIScrollView _setZoomFeedbackGenerator:](v3, "_setZoomFeedbackGenerator:", 0);
  return v4;
}

- (void)dealloc
{
  NSMutableArray *stuckToBackViews;
  objc_super v4;

  stuckToBackViews = self->_stuckToBackViews;
  self->_stuckToBackViews = 0;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewWrapperView;
  -[UIScrollView dealloc](&v4, sel_dealloc);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  LOBYTE(self) = objc_msgSend(v8, "pointInside:withEvent:", v7);

  return (char)self;
}

- (void)_stickViewToBack:(id)a3
{
  id v4;
  NSMutableArray *stuckToBackViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    stuckToBackViews = self->_stuckToBackViews;
    v9 = v4;
    if (!stuckToBackViews)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_stuckToBackViews;
      self->_stuckToBackViews = v6;

      stuckToBackViews = self->_stuckToBackViews;
    }
    v8 = -[NSMutableArray containsObject:](stuckToBackViews, "containsObject:", v9);
    v4 = v9;
    if ((v8 & 1) == 0)
    {
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, -[NSMutableArray count](self->_stuckToBackViews, "count"));
      -[NSMutableArray addObject:](self->_stuckToBackViews, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)bringSubviewToFront:(id)a3
{
  void *v4;
  objc_super v5;

  _UITableViewSubviewToMoveForView(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)UITableViewWrapperView;
  -[UIView bringSubviewToFront:](&v5, sel_bringSubviewToFront_, v4);

}

- (void)sendSubviewToBack:(id)a3
{
  void *v4;
  objc_super v5;

  _UITableViewSubviewToMoveForView(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)UITableViewWrapperView;
  -[UIView sendSubviewToBack:](&v5, sel_sendSubviewToBack_, v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  UITableViewWrapperView *v8;
  objc_class *v9;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7;
  UITableViewWrapperView *v8;
  objc_class *v9;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7;
  UITableViewWrapperView *v8;
  objc_class *v9;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v7;
  UITableViewWrapperView *v8;
  objc_class *v9;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = self;
  v9 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v9, a2);
  Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(UITableViewWrapperView *, SEL, id, id))Implementation)(v8, a2, v12, v7);

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  int v14;
  double v15;
  _BOOL4 v16;
  double v17;
  double MinX;
  double v19;
  _BOOL8 v20;
  double v21;
  objc_super v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIScrollView contentOffset](self, "contentOffset");
  v9 = v8;
  v11 = v10;
  -[UIView superview](self, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_manuallyManagesSwipeUI");
  v14 = *((_DWORD *)&self->super.super._viewFlags + 4);
  if ((v13 & 1) == 0)
  {
    if ((v14 & 0x80000) != 0)
    {
      if (x > 0.0)
        x = 0.0;
    }
    else
    {
      x = fmax(x, 0.0);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)UITableViewWrapperView;
  -[UIScrollView setBounds:](&v22, sel_setBounds_, x, y, width, height);
  -[UIScrollView contentOffset](self, "contentOffset");
  v16 = v9 == v15;
  if (v11 != v17)
    v16 = 0;
  if (((v13 | v16) & 1) == 0)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MinX = CGRectGetMinX(v23);
    if ((v14 & 0x80000) != 0)
    {
      if (MinX >= -30.0 && !-[UIScrollView _isHorizontalBouncing](self, "_isHorizontalBouncing"))
      {
        -[UIScrollView _horizontalVelocity](self, "_horizontalVelocity");
        v20 = v21 < 0.0;
        goto LABEL_16;
      }
    }
    else if (MinX <= 30.0 && !-[UIScrollView _isHorizontalBouncing](self, "_isHorizontalBouncing"))
    {
      -[UIScrollView _horizontalVelocity](self, "_horizontalVelocity");
      v20 = v19 > 0.0;
LABEL_16:
      -[UIScrollView setBounces:](self, "setBounces:", v20);
      goto LABEL_17;
    }
    v20 = 1;
    goto LABEL_16;
  }
LABEL_17:

}

- (BOOL)_forwardsToParentScroller
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UITableViewWrapperView *v5;
  UITableViewWrapperView *v6;
  UITableViewWrapperView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UITableViewWrapperView;
  -[UIScrollView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UITableViewWrapperView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (unint64_t)_focusPrimaryScrollableAxis
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stuckToBackViews, 0);
}

@end
