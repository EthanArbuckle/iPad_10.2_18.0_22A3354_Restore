@implementation _SBFocusAnimator

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38___SBFocusAnimator_animateTransition___block_invoke;
  v9[3] = &unk_1E8E9DED8;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __38___SBFocusAnimator_animateTransition___block_invoke_3;
  v7[3] = &unk_1E8E9E980;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "fcui_animateWithAnimationType:actions:completion:", 0, v9, v7);

}

- (double)transitionDuration:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_duration");
    v5 = v4;
  }
  else
  {
    v5 = *MEMORY[0x1E0D223A8];
  }

  return v5;
}

@end
