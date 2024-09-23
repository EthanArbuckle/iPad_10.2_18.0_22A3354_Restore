@implementation SBHLibraryPodFadeAnimator

- (SBHLibraryPodFadeAnimator)initWithAnimationContainer:(id)a3 innerFolderController:(id)a4 searchBar:(id)a5
{
  id v9;
  id v10;
  SBHLibraryPodFadeAnimator *v11;
  SBHLibraryPodFadeAnimator *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodFadeAnimator;
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
  v16.super_class = (Class)SBHLibraryPodFadeAnimator;
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
  v5.super_class = (Class)SBHLibraryPodFadeAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  if (!self->_animationComplete)
    -[SBHLibraryPodFadeAnimator _applyAlphaForFraction:](self, "_applyAlphaForFraction:", a3);
}

- (void)_applyAlphaForFraction:(double)a3
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
  v3.super_class = (Class)SBHLibraryPodFadeAnimator;
  return -[SBIconAnimator _numberOfSignificantAnimations](&v3, sel__numberOfSignificantAnimations) + 1;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  objc_super v14;

  v8 = a5;
  v9 = -[SBIconAnimator isAnimating](self, "isAnimating");
  v14.receiver = self;
  v14.super_class = (Class)SBHLibraryPodFadeAnimator;
  -[SBIconAnimator _animateToFraction:afterDelay:withSharedCompletion:](&v14, sel__animateToFraction_afterDelay_withSharedCompletion_, v8, a3, a4);
  if (v9)
    v10 = 6;
  else
    v10 = 2;
  v11 = (void *)MEMORY[0x1E0D01908];
  -[SBIconAnimator centralAnimationFactory](self, "centralAnimationFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__SBHLibraryPodFadeAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v13[3] = &unk_1E8D84C78;
  v13[4] = self;
  *(double *)&v13[5] = a3;
  objc_msgSend(v11, "animateWithFactory:additionalDelay:options:actions:completion:", v12, v10, v13, v8, a4);

}

uint64_t __80__SBHLibraryPodFadeAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAlphaForFraction:", *(double *)(a1 + 40));
}

- (void)cleanup
{
  objc_super v2;

  self->_animationComplete = 1;
  v2.receiver = self;
  v2.super_class = (Class)SBHLibraryPodFadeAnimator;
  -[SBIconAnimator cleanup](&v2, sel_cleanup);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_innerFolderController, 0);
}

@end
