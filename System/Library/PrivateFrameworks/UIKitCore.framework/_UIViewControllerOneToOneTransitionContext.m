@implementation _UIViewControllerOneToOneTransitionContext

- (BOOL)_isDeferred
{
  return self->__isDeferred;
}

- (void)_setIsDeferred:(BOOL)a3
{
  self->__isDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_toView, 0);
}

- (void)_setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
}

- (void)_setToStartFrame:(CGRect)a3
{
  self->_toStartFrame = a3;
}

- (void)_setToEndFrame:(CGRect)a3
{
  self->_toEndFrame = a3;
}

- (void)_setFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewController, a3);
}

- (void)_setFromStartFrame:(CGRect)a3
{
  self->_fromStartFrame = a3;
}

- (void)_setFromEndFrame:(CGRect)a3
{
  self->_fromEndFrame = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIViewControllerTransitionContext _setAnimator:](self, "_setAnimator:", 0);
  -[_UIViewControllerTransitionContext _setInteractor:](self, "_setInteractor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIViewControllerOneToOneTransitionContext;
  -[_UIViewControllerTransitionContext dealloc](&v3, sel_dealloc);
}

- (void)_setToView:(id)a3
{
  objc_storeStrong((id *)&self->_toView, a3);
  self->_isToViewSet = 1;
}

- (void)_setFromView:(id)a3
{
  objc_storeStrong((id *)&self->_fromView, a3);
  self->_isFromViewSet = 1;
}

- (id)viewControllerForKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("UITransitionContextToViewController"))
  {
    -[_UIViewControllerOneToOneTransitionContext toViewController](self, "toViewController");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v7;
    goto LABEL_7;
  }
  if (v4 == CFSTR("UITransitionContextFromViewController"))
  {
    -[_UIViewControllerOneToOneTransitionContext fromViewController](self, "fromViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
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
  CGRect result;

  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_toViewController == v4)
  {
    -[_UIViewControllerOneToOneTransitionContext toEndFrame](self, "toEndFrame");
LABEL_6:
    v6 = v10;
    v7 = v11;
    v8 = v12;
    v9 = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    -[_UIViewControllerOneToOneTransitionContext fromEndFrame](self, "fromEndFrame");
    goto LABEL_6;
  }
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_7:

  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)toEndFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_toEndFrame.origin.x;
  y = self->_toEndFrame.origin.y;
  width = self->_toEndFrame.size.width;
  height = self->_toEndFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIView)_toView
{
  UIView *v2;
  void *v3;

  if (self->_isToViewSet)
  {
    v2 = self->_toView;
  }
  else
  {
    -[_UIViewControllerOneToOneTransitionContext toViewController](self, "toViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v2 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (UIView)_fromView
{
  UIView *v2;
  void *v3;

  if (self->_isFromViewSet)
  {
    v2 = self->_fromView;
  }
  else
  {
    -[_UIViewControllerOneToOneTransitionContext fromViewController](self, "fromViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v2 = (UIView *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)viewForKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("UITransitionContextToView"))
  {
    -[_UIViewControllerOneToOneTransitionContext _toView](self, "_toView");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v7;
    goto LABEL_7;
  }
  if (v4 == CFSTR("UITransitionContextFromView"))
  {
    -[_UIViewControllerOneToOneTransitionContext _fromView](self, "_fromView");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
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
  CGRect result;

  v4 = (UIViewController *)a3;
  v5 = v4;
  if (self->_toViewController == v4)
  {
    -[_UIViewControllerOneToOneTransitionContext toStartFrame](self, "toStartFrame");
LABEL_6:
    v6 = v10;
    v7 = v11;
    v8 = v12;
    v9 = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    -[_UIViewControllerOneToOneTransitionContext fromStartFrame](self, "fromStartFrame");
    goto LABEL_6;
  }
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_7:

  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIViewController)fromViewController
{
  return self->_fromViewController;
}

- (CGRect)fromStartFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromStartFrame.origin.x;
  y = self->_fromStartFrame.origin.y;
  width = self->_fromStartFrame.size.width;
  height = self->_fromStartFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)fromEndFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromEndFrame.origin.x;
  y = self->_fromEndFrame.origin.y;
  width = self->_fromEndFrame.size.width;
  height = self->_fromEndFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)toStartFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_toStartFrame.origin.x;
  y = self->_toStartFrame.origin.y;
  width = self->_toStartFrame.size.width;
  height = self->_toStartFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
