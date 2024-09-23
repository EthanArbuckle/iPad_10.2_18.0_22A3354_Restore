@implementation WFCompactPlatterTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[WFCompactPlatterPresentationAnimator initForPresenting:]([WFCompactPlatterPresentationAnimator alloc], "initForPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[WFCompactPlatterPresentationAnimator initForPresenting:]([WFCompactPlatterPresentationAnimator alloc], "initForPresenting:", 0);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFCompactPlatterPresentationController *v11;
  void *v13;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "conformsToProtocol:", &unk_255604718) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCompactPlatterTransitioningDelegate.m"), 28, CFSTR("Tried to present a view controller that doesn't conform to WFCompactPlatterPresentation"));

  }
  v10 = v8;
  v11 = -[WFCompactPlatterPresentationController initWithPresentedViewController:presentingViewController:]([WFCompactPlatterPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v10, v9);

  return v11;
}

@end
