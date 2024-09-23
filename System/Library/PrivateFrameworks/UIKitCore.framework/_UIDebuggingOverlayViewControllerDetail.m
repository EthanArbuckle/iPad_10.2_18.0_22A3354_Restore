@implementation _UIDebuggingOverlayViewControllerDetail

- (UIViewController)viewController
{
  return self->viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->viewController, 0);
}

@end
