@implementation SBIconFadeAnimator

- (SBIconFadeAnimator)initWithAnimationContainer:(id)a3 crossfadeView:(id)a4
{
  id v7;
  SBIconFadeAnimator *v8;
  SBIconFadeAnimator *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBIconFadeAnimator;
  v8 = -[SBIconAnimator initWithAnimationContainer:](&v16, sel_initWithAnimationContainer_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_crossfadeView, a4);
    v9->_fadesReferenceView = 1;
    objc_msgSend(v7, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[SBIconAnimator animationContainer](v9, "animationContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fallbackIconContainerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v7);

      objc_msgSend(v7, "window");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v9->_addedToWindow = 1;
      }
      else if (v7)
      {
        SBLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[SBIconFadeAnimator initWithAnimationContainer:crossfadeView:].cold.1(v14);

      }
    }
  }

  return v9;
}

- (void)_prepareAnimation
{
  objc_super v3;

  -[UIView setHidden:](self->_crossfadeView, "setHidden:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBIconFadeAnimator;
  -[SBIconAnimator _prepareAnimation](&v3, sel__prepareAnimation);
}

- (void)_setAnimationFraction:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconFadeAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  -[SBIconFadeAnimator _applyAlphaForFraction:](self, "_applyAlphaForFraction:", a3);
}

- (void)_cleanupAnimation
{
  void (**v3)(_QWORD);
  void *v4;
  objc_super v5;
  _QWORD aBlock[5];

  if (self->_addedToWindow)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__SBIconFadeAnimator__cleanupAnimation__block_invoke;
    aBlock[3] = &unk_1E8D84C50;
    aBlock[4] = self;
    v3 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[SBIconAnimator delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || objc_msgSend(v4, "iconAnimator:canAlterViewHierarchyDuringCleanupUsingBlock:", self, v3))
    {
      v3[2](v3);
    }

  }
  -[UIView setAlpha:](self->_crossfadeView, "setAlpha:", 1.0);
  v5.receiver = self;
  v5.super_class = (Class)SBIconFadeAnimator;
  -[SBIconAnimator _cleanupAnimation](&v5, sel__cleanupAnimation);
}

uint64_t __39__SBIconFadeAnimator__cleanupAnimation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeFromSuperview");
}

- (unint64_t)_numberOfSignificantAnimations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIconFadeAnimator;
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
  v14.super_class = (Class)SBIconFadeAnimator;
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
  v13[2] = __73__SBIconFadeAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v13[3] = &unk_1E8D84C78;
  v13[4] = self;
  *(double *)&v13[5] = a3;
  objc_msgSend(v11, "animateWithFactory:additionalDelay:options:actions:completion:", v12, v10, v13, v8, a4);

}

uint64_t __73__SBIconFadeAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAlphaForFraction:", *(double *)(a1 + 40));
}

- (void)_applyAlphaForFraction:(double)a3
{
  id v5;

  -[UIView setAlpha:](self->_crossfadeView, "setAlpha:");
  if (-[SBIconFadeAnimator fadesReferenceView](self, "fadesReferenceView"))
  {
    -[SBIconAnimator referenceView](self, "referenceView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0 - a3);

  }
}

- (BOOL)fadesReferenceView
{
  return self->_fadesReferenceView;
}

- (void)setFadesReferenceView:(BOOL)a3
{
  self->_fadesReferenceView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeView, 0);
}

- (void)initWithAnimationContainer:(os_log_t)log crossfadeView:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Fade icon animator was not attached to hierarchy!", v1, 2u);
}

@end
