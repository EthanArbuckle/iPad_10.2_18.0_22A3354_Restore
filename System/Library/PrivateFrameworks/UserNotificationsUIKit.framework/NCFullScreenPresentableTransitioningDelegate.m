@implementation NCFullScreenPresentableTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[NCFullScreenPresentableTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:userInfo:](self, "animationControllerForPresentedController:presentingController:sourceController:userInfo:", a3, a4, a5, 0);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[NCFullScreenPresentableTransitioningDelegate animationControllerForDismissedController:userInfo:](self, "animationControllerForDismissedController:userInfo:", a3, 0);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
