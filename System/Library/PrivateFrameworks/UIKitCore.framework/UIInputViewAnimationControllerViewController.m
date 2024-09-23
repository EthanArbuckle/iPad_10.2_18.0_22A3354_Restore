@implementation UIInputViewAnimationControllerViewController

- (UIInputViewAnimationControllerViewController)initWithContext:(id)a3
{
  id v5;
  UIInputViewAnimationControllerViewController *v6;
  UIInputViewAnimationControllerViewController *v7;
  uint64_t v8;
  UIViewControllerAnimatedTransitioning_Keyboard *animator;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIInputViewAnimationControllerViewController;
  v6 = -[UIInputViewAnimationControllerViewController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(v5, "_animator");
    v8 = objc_claimAutoreleasedReturnValue();
    animator = v7->_animator;
    v7->_animator = (UIViewControllerAnimatedTransitioning_Keyboard *)v8;

  }
  return v7;
}

+ (id)controllerWithContext:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v4);

  return v5;
}

- (id)prepareAnimationWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  UIInputViewSetPlacement *v8;
  void *v9;
  UIInputViewSetPlacement *endPlacement;
  UIInputViewSetPlacement *v11;

  v8 = (UIInputViewSetPlacement *)a5;
  +[UIInputViewAnimationControllerViewControllerContext contextWithHost:startPlacement:endPlacement:transitionContext:](UIInputViewAnimationControllerViewControllerContext, "contextWithHost:startPlacement:endPlacement:transitionContext:", a3, a4, v8, self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  endPlacement = self->_endPlacement;
  self->_endPlacement = v8;
  v11 = v8;

  -[UIViewControllerAnimatedTransitioning_Keyboard prepareToAnimateKeyboard:](self->_animator, "prepareToAnimateKeyboard:", v9);
  return v9;
}

- (void)performAnimationWithHost:(id)a3 context:(id)a4
{
  UIViewControllerAnimatedTransitioning_Keyboard *animator;
  id v7;

  animator = self->_animator;
  v7 = a3;
  -[UIViewControllerAnimatedTransitioning_Keyboard animateKeyboard:](animator, "animateKeyboard:", a4);
  objc_msgSend(v7, "updateToPlacement:withNormalAnimationsAndNotifications:", self->_endPlacement, 1);

}

- (void)completeAnimationWithHost:(id)a3 context:(id)a4
{
  -[UIViewControllerAnimatedTransitioning_Keyboard completeKeyboard:](self->_animator, "completeKeyboard:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPlacement, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
