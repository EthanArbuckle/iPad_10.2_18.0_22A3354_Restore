@implementation _UIAlertControllerInteractionController

- (void)startInteractiveTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIAlertControllerInteractionController;
  v4 = a3;
  -[UIPercentDrivenInteractiveTransition startInteractiveTransition:](&v9, sel_startInteractiveTransition_, v4);
  -[_UIAlertControllerInteractionController setContext:](self, "setContext:", v4, v9.receiver, v9.super_class);

  -[_UIAlertControllerInteractionController alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visualStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIAlertControllerInteractionController alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactionProgressForTransitionOfType:forAlertController:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  if ((objc_msgSend(v8, "enteredMinimumState") & 1) == 0)
  {
    -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](self, "cancelInteractiveTransition");
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "didEnd"))
    -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](self, "finishInteractiveTransition");
  else
LABEL_5:
    objc_msgSend(v8, "addProgressObserver:", self);
LABEL_7:

}

- (void)interactionProgressDidUpdate:(id)a3
{
  double v4;

  objc_msgSend(a3, "percentComplete");
  if (v4 > 1.0)
    v4 = 1.0;
  -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self, "updateInteractiveTransition:", fmax(v4, 0.0));
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  if (a4)
    -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](self, "finishInteractiveTransition", a3);
  else
    -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](self, "cancelInteractiveTransition", a3);
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (UIViewControllerContextTransitioning)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
