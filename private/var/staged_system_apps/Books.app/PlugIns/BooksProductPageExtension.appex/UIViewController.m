@implementation UIViewController

- (void)doneButtonPressed
{
  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
