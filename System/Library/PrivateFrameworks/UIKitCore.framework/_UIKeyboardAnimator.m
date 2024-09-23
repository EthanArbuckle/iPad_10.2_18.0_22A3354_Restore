@implementation _UIKeyboardAnimator

- (_UIKeyboardAnimator)init
{
  _UIKeyboardAnimator *v2;
  uint64_t v3;
  _UIKeyboardAnimatorAnimationStyle *style;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyboardAnimator;
  v2 = -[_UIKeyboardAnimator init](&v6, sel_init);
  if (v2)
  {
    +[_UIKeyboardAnimatorAnimationStyle animationStyleWithAnimator:](_UIKeyboardAnimatorAnimationStyle, "animationStyleWithAnimator:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    style = v2->_style;
    v2->_style = (_UIKeyboardAnimatorAnimationStyle *)v3;

  }
  return v2;
}

- (void)applyToKeyboardOperations:(id)a3
{
  void (**v4)(_QWORD);
  id v5;

  v4 = (void (**)(_QWORD))a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushAnimationStyle:", self->_style);
  v4[2](v4);

  objc_msgSend(v5, "popAnimationStyle");
}

- (void)performAnimation:(id)a3 afterStarted:(id)a4 onCompletion:(id)a5
{
  -[_UIKeyboardAnimatorAnimationStyle defaultLaunchAnimation:afterStarted:completion:](self->_style, "defaultLaunchAnimation:afterStarted:completion:", a3, a4, a5);
}

- (void)prepareForAnimationWithState:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "startFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "animatingView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)runAnimationWithState:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "endFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "animatingView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
