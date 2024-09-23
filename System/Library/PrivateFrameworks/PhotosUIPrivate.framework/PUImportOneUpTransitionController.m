@implementation PUImportOneUpTransitionController

- (PUImportOneUpTransitionController)initWithPresentingViewController:(id)a3 pinchGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  PUImportOneUpTransitionController *v9;
  PUImportOneUpTransitionController *v10;
  PUPhotoPinchGestureRecognizer *v11;
  PUPhotoPinchGestureRecognizer *dismissPinchGestureRecognizer;
  uint64_t v13;
  UIPanGestureRecognizer *dismissPanGestureRecognizer;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUImportOneUpTransitionController;
  v9 = -[PUViewControllerTransition initWithDuration:](&v16, sel_initWithDuration_, 1.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentingViewController, a3);
    objc_storeStrong((id *)&v10->_presentingPinchGestureRecognizer, a4);
    v11 = -[PUPhotoPinchGestureRecognizer initWithTarget:action:]([PUPhotoPinchGestureRecognizer alloc], "initWithTarget:action:", v10, sel_maybeInitiateInteractiveDismiss_);
    dismissPinchGestureRecognizer = v10->_dismissPinchGestureRecognizer;
    v10->_dismissPinchGestureRecognizer = v11;

    -[PUPhotoPinchGestureRecognizer setDelegate:](v10->_dismissPinchGestureRecognizer, "setDelegate:", v10);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v10, sel_maybeInitiateInteractiveDismiss_);
    dismissPanGestureRecognizer = v10->_dismissPanGestureRecognizer;
    v10->_dismissPanGestureRecognizer = (UIPanGestureRecognizer *)v13;

    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v10->_dismissPanGestureRecognizer, "setMinimumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v10->_dismissPanGestureRecognizer, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setDelegate:](v10->_dismissPanGestureRecognizer, "setDelegate:", v10);
  }

  return v10;
}

- (id)interruptibleAnimatorForTransition:(id)a3
{
  void *v3;
  void *v4;

  -[PUImportOneUpTransitionController transition](self, "transition", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)animationEnded:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpTransitionController;
  -[PUViewControllerTransition animationEnded:](&v4, sel_animationEnded_, a3);
  -[PUImportOneUpTransitionController setTransition:](self, "setTransition:", 0);
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUImportOneUpTransitionController;
  v4 = -[PUModalTransition interactionControllerForPresentation:](&v6, sel_interactionControllerForPresentation_, a3);
  self->_operation = 0;
  return self;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUImportOneUpTransitionController;
  v4 = -[PUModalTransition interactionControllerForDismissal:](&v6, sel_interactionControllerForDismissal_, a3);
  self->_operation = 1;
  return self;
}

- (void)startInteractiveTransition:(id)a3
{
  void *v4;
  void *v5;
  PUImportOneUpModalTransition *v6;
  int64_t v7;
  void *v8;
  PUImportOneUpModalTransition *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PUViewControllerTransition setTransitionContext:](self, "setTransitionContext:");
  if (!-[PUImportOneUpTransitionController operation](self, "operation"))
  {
    objc_msgSend(v11, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUImportOneUpTransitionController installDismissGestureRecognizersOnView:](self, "installDismissGestureRecognizersOnView:", v4);

  }
  if (-[PUImportOneUpTransitionController operation](self, "operation"))
    -[PUImportOneUpTransitionController dismissPinchGestureRecognizer](self, "dismissPinchGestureRecognizer");
  else
    -[PUImportOneUpTransitionController presentingPinchGestureRecognizer](self, "presentingPinchGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [PUImportOneUpModalTransition alloc];
  v7 = -[PUImportOneUpTransitionController operation](self, "operation");
  -[PUImportOneUpTransitionController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUImportOneUpModalTransition initWithOperation:transitionContext:pinchGestureRecognizer:panGestureRecognizer:startsInteractive:](v6, "initWithOperation:transitionContext:pinchGestureRecognizer:panGestureRecognizer:startsInteractive:", v7, v11, v5, v8, -[PUViewControllerTransition startedInteractively](self, "startedInteractively"));
  -[PUImportOneUpTransitionController setTransition:](self, "setTransition:", v9);

  -[PUImportOneUpTransitionController transition](self, "transition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startTransition");

}

- (void)maybeInitiateInteractiveDismiss:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[PUImportOneUpTransitionController transition](self, "transition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[PUViewControllerTransition setStartedInteractively:](self, "setStartedInteractively:", 1);
      -[PUImportOneUpTransitionController presentingViewController](self, "presentingViewController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pu_dismissViewControllerAnimated:interactive:completion:", 1, 1, 0);

    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v4 = a3;
  -[PUImportOneUpTransitionController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_9;
    -[PUImportOneUpTransitionController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUImportOneUpTransitionController continuousGestureRecognizerIsActive:](self, "continuousGestureRecognizerIsActive:", v6);

    if (!v7)
      goto LABEL_9;
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }
  -[PUImportOneUpTransitionController presentingPinchGestureRecognizer](self, "presentingPinchGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PUImportOneUpTransitionController continuousGestureRecognizerIsActive:](self, "continuousGestureRecognizerIsActive:", v8);

  if (v9)
    goto LABEL_7;
  -[PUImportOneUpTransitionController dismissPinchGestureRecognizer](self, "dismissPinchGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PUImportOneUpTransitionController continuousGestureRecognizerIsActive:](self, "continuousGestureRecognizerIsActive:", v10);

  if (v11)
    goto LABEL_7;
  -[PUImportOneUpTransitionController transition](self, "transition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_9:
    v12 = 1;
    goto LABEL_10;
  }
  -[PUImportOneUpTransitionController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImportOneUpTransitionController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "translationInView:", v17);
  v19 = v18;
  v21 = v20;

  if (v21 <= 0.0)
    goto LABEL_7;
  v22 = -v21;
  if (v21 >= 0.0)
    v22 = v21;
  v23 = -v19;
  if (v19 >= 0.0)
    v23 = v19;
  v12 = v22 > v23;
LABEL_10:

  return v12;
}

- (BOOL)continuousGestureRecognizerIsActive:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = v3 && (objc_msgSend(v3, "state") == 1 || objc_msgSend(v4, "state") == 2);

  return v5;
}

- (void)installDismissGestureRecognizersOnView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[PUImportOneUpTransitionController dismissPinchGestureRecognizer](self, "dismissPinchGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:", v5);

    -[PUImportOneUpTransitionController dismissPanGestureRecognizer](self, "dismissPanGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addGestureRecognizer:", v6);

    -[PUImportOneUpTransitionController setHasInstalledDismissGestureRecognizers:](self, "setHasInstalledDismissGestureRecognizers:", 1);
  }
}

- (BOOL)hasInstalledDismissGestureRecognizers
{
  return self->_hasInstalledDismissGestureRecognizers;
}

- (void)setHasInstalledDismissGestureRecognizers:(BOOL)a3
{
  self->_hasInstalledDismissGestureRecognizers = a3;
}

- (PUPhotoPinchGestureRecognizer)presentingPinchGestureRecognizer
{
  return self->_presentingPinchGestureRecognizer;
}

- (PUPhotoPinchGestureRecognizer)dismissPinchGestureRecognizer
{
  return self->_dismissPinchGestureRecognizer;
}

- (void)setDismissPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissPinchGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (void)setDismissPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (int64_t)operation
{
  return self->_operation;
}

- (PUImportOneUpModalTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentingPinchGestureRecognizer, 0);
}

@end
