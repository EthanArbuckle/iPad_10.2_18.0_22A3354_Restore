@implementation TSKSheetViewController

- (TSKSheetViewController)initWithContentViewController:(id)a3
{
  return -[TSKSheetViewController initWithContentViewController:allowTapsOutsideContentView:](self, "initWithContentViewController:allowTapsOutsideContentView:", a3, 1);
}

- (TSKSheetViewController)initWithContentViewController:(id)a3 allowTapsOutsideContentView:(BOOL)a4
{
  _BOOL4 v4;
  TSKSheetViewController *v6;
  TSKSheetViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSKSheetViewController;
  v6 = -[TSKSheetViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_contentViewController = (UIViewController *)a3;
    -[TSKSheetViewController setTransitioningDelegate:](v6, "setTransitioningDelegate:", v6);
    -[TSKSheetViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 4);
    v8 = (void *)-[TSKSheetViewController view](v7, "view");
    v9 = (void *)objc_msgSend(a3, "view");
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TSKSheetViewController addChildViewController:](v7, "addChildViewController:", a3);
    objc_msgSend(v8, "addSubview:", v9);
    objc_msgSend(v8, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[contentView]|"), 0, 0, _NSDictionaryOfVariableBindings((NSString *)CFSTR("contentView"), v9, 0)));
    -[TSKSheetViewController setContentHidden:](v7, "setContentHidden:", 1);
    objc_msgSend(a3, "preferredContentSize");
    objc_msgSend(v8, "addConstraint:", objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 8, 0, 0, 0, 1.0));
    objc_msgSend(a3, "didMoveToParentViewController:", v7);
    if (v4)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v7, sel_didTapView);
      objc_msgSend(v10, "setDelegate:", v7);
      objc_msgSend(v8, "addGestureRecognizer:", v10);

    }
  }
  return v7;
}

- (void)dismissSheetAnimated:(BOOL)a3 completion:(id)a4
{
  _QWORD v4[6];
  _QWORD v5[5];

  if (a3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke;
    v5[3] = &unk_24D829278;
    v5[4] = self;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke_2;
    v4[3] = &unk_24D82A8A8;
    v4[4] = self;
    v4[5] = a4;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v5, v4, 0.25, 0.0);
  }
  else
  {
    -[TSKSheetViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3, a4);
  }
}

uint64_t __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(*(id *)(a1 + 32), "setContentHidden:", 1);
  return objc_msgSend(v2, "layoutIfNeeded");
}

uint64_t __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, *(_QWORD *)(a1 + 40));
}

- (void)didTapView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__TSKSheetViewController_didTapView__block_invoke;
  v2[3] = &unk_24D829278;
  v2[4] = self;
  -[TSKSheetViewController dismissSheetAnimated:completion:](self, "dismissSheetAnimated:completion:", 1, v2);
}

uint64_t __36__TSKSheetViewController_didTapView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "didDismissSheetViewController:");
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (double)transitionDuration:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[TSKSheetViewController isShowingForTransitionContext:](self, "isShowingForTransitionContext:", a3);
  result = 0.0;
  if (v3)
    return 0.25;
  return result;
}

- (void)animateTransition:(id)a3
{
  if (-[TSKSheetViewController isShowingForTransitionContext:](self, "isShowingForTransitionContext:"))
    -[TSKSheetViewController animateShowWithContext:](self, "animateShowWithContext:", a3);
  else
    -[TSKSheetViewController animateDismissWithContext:](self, "animateDismissWithContext:", a3);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a4, "view", a3);
  return v5 == -[TSKSheetViewController view](self, "view");
}

- (BOOL)isShowingForTransitionContext:(id)a3
{
  return objc_msgSend(a3, "viewControllerForKey:", *MEMORY[0x24BDF7F90]) == (_QWORD)self;
}

- (void)animateShowWithContext:(id)a3
{
  void *v5;
  void *v6;
  NSDictionary *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v5 = (void *)objc_msgSend(a3, "containerView");
  v6 = (void *)-[TSKSheetViewController view](self, "view");
  objc_msgSend(v5, "addSubview:", v6);
  v7 = _NSDictionaryOfVariableBindings((NSString *)CFSTR("rootView"), v6, 0);
  objc_msgSend(v5, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[rootView]|"), 0, 0, v7));
  objc_msgSend(v5, "addConstraints:", objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[rootView]|"), 0, 0, v7));
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[TSKSheetViewController setContentHidden:](self, "setContentHidden:", 1);
  objc_msgSend(v6, "layoutIfNeeded");
  v8[4] = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__TSKSheetViewController_animateShowWithContext___block_invoke;
  v9[3] = &unk_24D82A5C8;
  v9[4] = v6;
  v9[5] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__TSKSheetViewController_animateShowWithContext___block_invoke_2;
  v8[3] = &unk_24D82A8D0;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v9, v8, 0.25, 0.0);
}

uint64_t __49__TSKSheetViewController_animateShowWithContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.4));
  objc_msgSend(*(id *)(a1 + 40), "setContentHidden:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __49__TSKSheetViewController_animateShowWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (void)animateDismissWithContext:(id)a3
{
  objc_msgSend((id)-[TSKSheetViewController view](self, "view"), "removeFromSuperview");
  objc_msgSend(a3, "completeTransition:", 1);
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIView *v6;
  uint64_t v7;
  NSLayoutConstraint *v8;

  if (self->_isContentHidden != a3)
  {
    v3 = a3;
    self->_isContentHidden = a3;
    v5 = (void *)-[TSKSheetViewController view](self, "view");
    v6 = -[UIViewController view](self->_contentViewController, "view");
    if (self->_contentVerticalConstraint)
      objc_msgSend(v5, "removeConstraint:");
    if (v3)
      v7 = 3;
    else
      v7 = 4;
    v8 = (NSLayoutConstraint *)objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, v7, 0, v5, 4, 1.0, 0.0);
    self->_contentVerticalConstraint = v8;
    objc_msgSend(v5, "addConstraint:", v8);
  }
}

- (TSKSheetViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSKSheetViewControllerDelegate *)a3;
}

@end
