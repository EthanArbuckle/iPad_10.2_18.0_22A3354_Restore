@implementation _UIProgressiveBlurContextController

- (_UIProgressiveBlurContextController)initWithPresentedViewController:(id)a3
{
  id v5;
  _UIProgressiveBlurContextController *v6;
  _UIProgressiveBlurContextController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIProgressiveBlurContextController;
  v6 = -[UIViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presentedViewController, a3);
    v7->_blurStyle = 5003;
    -[UIViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
    -[UIViewController setTransitioningDelegate:](v7, "setTransitioningDelegate:", v7);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UIProgressiveBlurContextController;
  -[UIViewController viewDidLoad](&v17, sel_viewDidLoad);
  if (!self->_presentedViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIProgressiveBlurContextController.m"), 38, CFSTR("A view controller to present is required"));

  }
  -[UIViewController addChildViewController:](self, "addChildViewController:");
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIViewController view](self->_presentedViewController, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[UIViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_presentedViewController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[UIViewController didMoveToParentViewController:](self->_presentedViewController, "didMoveToParentViewController:", self);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return -[_UIProgressiveBlurPresentationAnimator initForPresenting:]([_UIProgressiveBlurPresentationAnimator alloc], "initForPresenting:", 1);
}

- (id)animationControllerForDismissedController:(id)a3
{
  return -[_UIProgressiveBlurPresentationAnimator initForPresenting:]([_UIProgressiveBlurPresentationAnimator alloc], "initForPresenting:", 0);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  _UIProgressiveBlurPresentationController *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[_UIProgressiveBlurPresentationController initWithPresentedViewController:presentingViewController:]([_UIProgressiveBlurPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  -[_UIProgressiveBlurPresentationController setBlurStyle:](v9, "setBlurStyle:", -[_UIProgressiveBlurContextController blurStyle](self, "blurStyle"));
  return v9;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(int64_t)a3
{
  self->_blurStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
}

@end
