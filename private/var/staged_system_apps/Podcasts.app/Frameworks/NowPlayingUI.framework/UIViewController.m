@implementation UIViewController

- (void)compositeComponentWillMoveToParentViewController:(id)a3
{
  if (a3)
    objc_msgSend(a3, "addChildViewController:", self);
  else
    -[UIViewController willMoveToParentViewController:](self, "willMoveToParentViewController:", 0);
}

- (void)compositeComponentDidMoveToParentViewController:(id)a3
{
  if (a3)
    -[UIViewController didMoveToParentViewController:](self, "didMoveToParentViewController:");
  else
    -[UIViewController removeFromParentViewController](self, "removeFromParentViewController");
}

@end
