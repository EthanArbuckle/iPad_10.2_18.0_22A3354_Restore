@implementation PNPPlatterTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  PNPPlatterAnimator *v5;

  v5 = objc_alloc_init(PNPPlatterAnimator);
  -[PNPPlatterAnimator setIsPresenting:](v5, "setIsPresenting:", 1);
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  PNPPlatterAnimator *v3;

  v3 = objc_alloc_init(PNPPlatterAnimator);
  -[PNPPlatterAnimator setIsPresenting:](v3, "setIsPresenting:", 0);
  return v3;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  PNPPlatterPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PNPPlatterPresentationController initWithPresentedViewController:presentingViewController:]([PNPPlatterPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

@end
