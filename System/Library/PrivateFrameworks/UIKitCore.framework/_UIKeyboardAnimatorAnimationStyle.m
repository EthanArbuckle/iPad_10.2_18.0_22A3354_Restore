@implementation _UIKeyboardAnimatorAnimationStyle

+ (_UIKeyboardAnimatorAnimationStyle)animationStyleWithAnimator:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "animationStyleDefault");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    objc_storeWeak((id *)(v5 + 48), v4);

  return (_UIKeyboardAnimatorAnimationStyle *)v6;
}

- (id)controllerForStartPlacement:(id)a3 endPlacement:(id)a4
{
  _UIKeyboardAnimatorAnimationStyleController *v5;
  id WeakRetained;
  _UIKeyboardAnimatorAnimationStyleController *v7;

  v5 = [_UIKeyboardAnimatorAnimationStyleController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  v7 = -[_UIKeyboardAnimatorAnimationStyleController initWithAnimator:](v5, "initWithAnimator:", WeakRetained);

  return v7;
}

- (void)launchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5 forHost:(id)a6 fromCurrentPosition:(BOOL)a7
{
  UIInputViewAnimationHost **p_currentHost;
  id v14;
  id v15;
  id v16;
  id WeakRetained;
  UIInputViewAnimationHost *v18;
  id v19;

  p_currentHost = &self->_currentHost;
  objc_storeStrong((id *)&self->_currentHost, a6);
  v19 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  self->_currentFromPosition = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  objc_msgSend(WeakRetained, "performAnimation:afterStarted:onCompletion:", v16, v15, v14);

  v18 = *p_currentHost;
  *p_currentHost = 0;

}

- (void)defaultLaunchAnimation:(id)a3 afterStarted:(id)a4 completion:(id)a5
{
  UIInputViewAnimationHost *currentHost;
  _BOOL8 currentFromPosition;
  objc_super v7;

  currentHost = self->_currentHost;
  currentFromPosition = self->_currentFromPosition;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardAnimatorAnimationStyle;
  -[UIInputViewAnimationStyle launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:](&v7, sel_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition_, a3, a4, a5, currentHost, currentFromPosition);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHost, 0);
  objc_destroyWeak((id *)&self->_animator);
}

@end
