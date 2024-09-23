@implementation _NCExpandedPlatterViewControllerAnimator

- (void)animateTransition:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  id v7;
  void (**v8)(void *, uint64_t, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  _QWORD aBlock[4];
  id v15;

  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62___NCExpandedPlatterViewControllerAnimator_animateTransition___block_invoke;
  aBlock[3] = &unk_1E8D1B568;
  v5 = v3;
  v15 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  v9 = v4;
  v10 = 3221225472;
  v11 = __62___NCExpandedPlatterViewControllerAnimator_animateTransition___block_invoke_2;
  v12 = &unk_1E8D1B8A8;
  v7 = v5;
  v13 = v7;
  v8 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(&v9);
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlockWithAnimationsEnabled", v9, v10, v11, v12))
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInRetargetableAnimationBlock"))
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateByRetargetingAnimations:completion:", v6, v8);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringInteractive:animations:completion:", 0, v6, v8);
  }
  else
  {
    v6[2](v6);
    v8[2](v8, 1, 0);
  }

}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

@end
