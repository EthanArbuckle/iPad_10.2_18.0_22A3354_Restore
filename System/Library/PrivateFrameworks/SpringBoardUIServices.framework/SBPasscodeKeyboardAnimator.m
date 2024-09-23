@implementation SBPasscodeKeyboardAnimator

- (void)performAnimation:(id)a3 afterStarted:(id)a4 onCompletion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = (void *)MEMORY[0x1E0CEABB0];
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "_isInAnimationBlock"))
    objc_msgSend(MEMORY[0x1E0D01908], "addAlongsideAnimations:completion:", v10, v9);
  else
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:completion:", self->_animationSettings, v10, v9);

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
    v11 = v12;
  }

}

- (void)prepareForAnimationWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SBPasscodeKeyboardAnimator;
  -[_UIKeyboardAnimator prepareForAnimationWithState:](&v26, sel_prepareForAnimationWithState_, v4);
  objc_msgSend(v4, "animatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "startFrame");
  v28.origin.x = v15;
  v28.origin.y = v16;
  v28.size.width = v17;
  v28.size.height = v18;
  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  v19 = CGRectContainsRect(v27, v28);

  if (v19)
  {
    objc_msgSend(v4, "animatingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 1.0);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CEABB0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__SBPasscodeKeyboardAnimator_prepareForAnimationWithState___block_invoke;
    v24[3] = &unk_1E4C3E408;
    v22 = v4;
    v25 = v22;
    objc_msgSend(v21, "performWithoutAnimation:", v24);
    objc_msgSend(v22, "animatingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAlpha:", 0.0);

    v20 = v25;
  }

}

void __59__SBPasscodeKeyboardAnimator_prepareForAnimationWithState___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "endFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "animatingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

- (void)runAnimationWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBPasscodeKeyboardAnimator;
  -[_UIKeyboardAnimator runAnimationWithState:](&v25, sel_runAnimationWithState_, v4);
  objc_msgSend(v4, "animatingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "endFrame");
  v27.origin.x = v15;
  v27.origin.y = v16;
  v27.size.width = v17;
  v27.size.height = v18;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  v19 = CGRectContainsRect(v26, v27);

  objc_msgSend(v4, "animatingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    objc_msgSend(v20, "setAlpha:", 1.0);
  }
  else
  {
    objc_msgSend(v20, "setAlpha:", 0.0);

    v22 = (void *)MEMORY[0x1E0CEABB0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __52__SBPasscodeKeyboardAnimator_runAnimationWithState___block_invoke;
    v23[3] = &unk_1E4C3E408;
    v24 = v4;
    objc_msgSend(v22, "performWithoutAnimation:", v23);
    v21 = v24;
  }

}

void __52__SBPasscodeKeyboardAnimator_runAnimationWithState___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "startFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "animatingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

}

- (void)completeAnimationWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBPasscodeKeyboardAnimator;
  -[_UIKeyboardAnimator completeAnimationWithState:](&v7, sel_completeAnimationWithState_, v4);
  -[SBPasscodeKeyboardAnimator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "passcodeKeyboardAnimatorAnimationDidComplete:", self);
  objc_msgSend(v4, "animatingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

}

- (BSAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (SBPasscodeKeyboardAnimatorDelegate)delegate
{
  return (SBPasscodeKeyboardAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
