@implementation IMViewControllerOneToOneTransitionContext

- (void)dealloc
{
  objc_super v3;

  -[IMViewControllerOneToOneTransitionContext _setFromViewController:](self, "_setFromViewController:", 0);
  -[IMViewControllerOneToOneTransitionContext _setToViewController:](self, "_setToViewController:", 0);
  -[IMViewControllerTransitionContext _setAnimator:](self, "_setAnimator:", 0);
  -[IMViewControllerTransitionContext _setInteractor:](self, "_setInteractor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMViewControllerOneToOneTransitionContext;
  -[IMViewControllerTransitionContext dealloc](&v3, "dealloc");
}

- (id)viewControllerForKey:(id)a3
{
  NSString *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;

  v4 = (NSString *)a3;
  v5 = v4;
  if (UITransitionContextToViewControllerKey == v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[IMViewControllerOneToOneTransitionContext toViewController](self, "toViewController"));
LABEL_6:
    v6 = (void *)v7;
    goto LABEL_7;
  }
  if (UITransitionContextFromViewControllerKey == v4)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[IMViewControllerOneToOneTransitionContext fromViewController](self, "fromViewController"));
    goto LABEL_6;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)viewForKey:(id)a3
{
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (NSString *)a3;
  v5 = v4;
  if (UITransitionContextFromViewKey == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerOneToOneTransitionContext fromViewController](self, "fromViewController"));
LABEL_6:
    v8 = v7;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

    goto LABEL_7;
  }
  if (UITransitionContextToViewKey == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerOneToOneTransitionContext toViewController](self, "toViewController"));
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
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
    -[IMViewControllerOneToOneTransitionContext toStartFrame](self, "toStartFrame");
LABEL_6:
    x = v10;
    y = v11;
    width = v12;
    height = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    -[IMViewControllerOneToOneTransitionContext fromStartFrame](self, "fromStartFrame");
    goto LABEL_6;
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
LABEL_7:

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  UIViewController *v4;
  UIViewController *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
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
    -[IMViewControllerOneToOneTransitionContext toEndFrame](self, "toEndFrame");
LABEL_6:
    x = v10;
    y = v11;
    width = v12;
    height = v13;
    goto LABEL_7;
  }
  if (self->_fromViewController == v4)
  {
    -[IMViewControllerOneToOneTransitionContext fromEndFrame](self, "fromEndFrame");
    goto LABEL_6;
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
LABEL_7:

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
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

- (void)_setFromViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fromViewController, a3);
}

- (UIViewController)toViewController
{
  return self->_toViewController;
}

- (void)_setToViewController:(id)a3
{
  objc_storeStrong((id *)&self->_toViewController, a3);
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

- (void)_setFromStartFrame:(CGRect)a3
{
  self->_fromStartFrame = a3;
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

- (void)_setFromEndFrame:(CGRect)a3
{
  self->_fromEndFrame = a3;
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

- (void)_setToEndFrame:(CGRect)a3
{
  self->_toEndFrame = a3;
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

- (void)_setToStartFrame:(CGRect)a3
{
  self->_toStartFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
}

@end
