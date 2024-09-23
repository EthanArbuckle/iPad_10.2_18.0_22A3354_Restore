@implementation PNPPlatterPresentationController

- (PNPPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  PNPPlatterPresentationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PNPPlatterPresentationController;
  v4 = -[PNPPlatterPresentationController initWithPresentedViewController:presentingViewController:](&v6, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  -[PNPPlatterPresentationController _setContainerIgnoresDirectTouchEvents:](v4, "_setContainerIgnoresDirectTouchEvents:", 1);
  return v4;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

@end
