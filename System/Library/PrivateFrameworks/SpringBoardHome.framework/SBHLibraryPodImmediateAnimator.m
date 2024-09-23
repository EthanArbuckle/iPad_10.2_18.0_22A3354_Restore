@implementation SBHLibraryPodImmediateAnimator

- (SBHLibraryPodImmediateAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 searchBar:(id)a5
{
  id v9;
  id v10;
  SBHLibraryPodImmediateAnimator *v11;
  SBHLibraryPodImmediateAnimator *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodImmediateAnimator;
  v11 = -[SBIconAnimator initWithAnimationContainer:](&v14, sel_initWithAnimationContainer_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_innerFolderController, a4);
    objc_storeStrong((id *)&v12->_searchBar, a5);
  }

  return v12;
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryPodImmediateAnimator;
  -[SBIconAnimator _prepareAnimation](&v16, sel__prepareAnimation);
  -[SBFolderController view](self->_innerFolderController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v3, "setNeedsLayout");
  objc_msgSend(v3, "layoutIfNeeded");
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v3);

}

- (void)_setAnimationFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryPodImmediateAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  if (!self->_animationComplete)
    -[SBHLibraryPodImmediateAnimator _configureForFraction:](self, "_configureForFraction:", a3);
}

- (void)_configureForFraction:(double)a3
{
  void *v5;
  id v6;

  -[SBIconAnimator animationContainer](self, "animationContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentAlpha:", 1.0 - a3);

  -[UIView setAlpha:](self->_searchBar, "setAlpha:", 1.0 - a3);
  -[SBFolderController view](self->_innerFolderController, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodImmediateAnimator;
  return -[SBIconAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 1;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  void (**v8)(id, uint64_t);
  _QWORD v9[6];
  objc_super v10;

  v8 = (void (**)(id, uint64_t))a5;
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryPodImmediateAnimator;
  -[SBIconAnimator _animateToFraction:afterDelay:withSharedCompletion:](&v10, sel__animateToFraction_afterDelay_withSharedCompletion_, v8, a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__SBHLibraryPodImmediateAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v9[3] = &unk_1E8D84C78;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
  if (v8)
    v8[2](v8, 1);

}

uint64_t __85__SBHLibraryPodImmediateAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureForFraction:", *(double *)(a1 + 40));
}

- (void)cleanup
{
  objc_super v2;

  self->_animationComplete = 1;
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodImmediateAnimator;
  -[SBIconAnimator cleanup](&v2, sel_cleanup);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_innerFolderController, 0);
}

@end
