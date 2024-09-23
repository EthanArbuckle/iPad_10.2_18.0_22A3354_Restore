@implementation SBFolderControllerBackgroundView

void __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  double v22;
  double v23;

  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 49) || !*(_BYTE *)(a1 + 50))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeFromSuperview");
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 416);
      *(_QWORD *)(v2 + 416) = 0;

      v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 432);
      *(_QWORD *)(v5 + 432) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
    }
  }
  else
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass())
        v7 = SBFEffectiveDeviceClass() == 1;
      else
        v7 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "userInterfaceIdiom") == 0;

    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sbf_homescreenFolderBackgroundGraphicsQuality");

    v11 = v10 == 100 || v7;
    objc_msgSend(*(id *)(a1 + 32), "currentEffectMaterialRecipeNameForHighQualityBlur:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 49) || *(_BYTE *)(a1 + 50))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "removeFromSuperview");
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 432);
      *(_QWORD *)(v13 + 432) = 0;

      v15 = (void *)MEMORY[0x1E0D47498];
      SBHBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v12, v16, 0, 0, 0.01);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(v18 + 416);
      *(_QWORD *)(v18 + 416) = v17;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setGroupNameBase:", CFSTR("SBFolderControllerBackgroundViewBlurGroupName"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);
      if (v10 == 100 && v7)
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "scale");
        v23 = v22;

        if (v23 == 3.0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setBackdropScaleAdjustment:", &__block_literal_global_6);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setWeighting:", 0.0);
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    }

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "bringSubviewToFront:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
}

- (void)_updateCurrentEffect
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[5];
  BOOL v17;
  _QWORD v18[6];
  BOOL v19;
  BOOL v20;
  BOOL v21;
  _QWORD v22[3];
  char v23;

  v3 = -[SBFolderControllerBackgroundView currentEffect](self, "currentEffect");
  v4 = -[SBFolderControllerBackgroundView concreteEffect](self, "concreteEffect");
  -[SBFolderControllerBackgroundView setCurrentEffect:](self, "setCurrentEffect:", v4);
  v5 = v3 == 0;
  v22[0] = 0;
  v22[1] = v22;
  v6 = v3 - 3 < 2;
  v22[2] = 0x2020000000;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke;
  v18[3] = &unk_1E8D85B90;
  v19 = v4 - 3 < 2;
  v20 = v5;
  v21 = v6;
  v18[4] = self;
  v18[5] = v22;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v18, COERCE_DOUBLE(0x2020000000));
  if (v4 - 3 > 1)
  {
    if (UIAccessibilityIsReduceMotionEnabled() && !UIAccessibilityIsReduceTransparencyEnabled())
    {
      v12 = -[SBFolderControllerBackgroundView _isCurrentlyExpanding](self, "_isCurrentlyExpanding");
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_3;
      v16[3] = &unk_1E8D85BB8;
      v16[4] = self;
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v16);
      v13 = 0.0;
      if (v12)
        v13 = 1.0;
      -[MTMaterialView setAlpha:](self->_blurView, "setAlpha:", v13);
    }
    else
    {
      if (-[SBFolderControllerBackgroundView isEffectActive](self, "isEffectActive"))
        v11 = 1.0;
      else
        v11 = 0.0;
      if (objc_msgSend(MEMORY[0x1E0DC3F10], "_isInAnimationBlock"))
      {
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_4;
        v15[3] = &unk_1E8D84C78;
        v15[4] = self;
        *(double *)&v15[5] = v11;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringInteractive:animations:completion:", 0, v15, 0);
      }
      else
      {
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_5;
        v14[3] = &unk_1E8D84C78;
        v14[4] = self;
        *(double *)&v14[5] = v11;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_performWithoutRetargetingAnimations:", v14);
      }
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_tintColorForEffect:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_tintView, "setBackgroundColor:", v8);
    v9 = -[SBFolderControllerBackgroundView isEffectActive](self, "isEffectActive");
    v10 = 0.0;
    if (v9)
      v10 = 1.0;
    -[UIView setAlpha:](self->_tintView, "setAlpha:", v10);

  }
  _Block_object_dispose(v22, 8);
}

- (void)setCurrentEffect:(unint64_t)a3
{
  self->_currentEffect = a3;
}

- (BOOL)isEffectActive
{
  return self->_effectActive;
}

- (unint64_t)currentEffect
{
  return self->_currentEffect;
}

- (id)currentEffectMaterialRecipeNameForHighQualityBlur:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  __CFString *v5;

  v3 = a3;
  v4 = -[SBFolderControllerBackgroundView concreteEffect](self, "concreteEffect");
  if (v4 == 2)
    return CFSTR("folderExpandedBackgroundApp");
  if (v4 != 1)
    return 0;
  v5 = CFSTR("folderExpandedBackgroundHomeSimplified");
  if (v3)
    v5 = CFSTR("folderExpandedBackgroundHome");
  return v5;
}

- (unint64_t)concreteEffect
{
  unint64_t result;

  result = -[SBFolderControllerBackgroundView effect](self, "effect");
  if (!result)
  {
    if (-[SBFolderControllerBackgroundView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
      return 4;
    else
      return 1;
  }
  return result;
}

- (BOOL)isReduceTransparencyEnabled
{
  return self->_reduceTransparencyEnabled;
}

- (unint64_t)effect
{
  return self->_effect;
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBFolderControllerBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBFolderControllerBackgroundView setNeedsLayout](self, "setNeedsLayout");
    v5 = obj;
  }

}

- (SBFolderControllerBackgroundView)initWithFrame:(CGRect)a3
{
  SBFolderControllerBackgroundView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFolderControllerBackgroundView;
  v3 = -[SBFolderControllerBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__reduceTransparencyEnabledStateChanged, *MEMORY[0x1E0DC45B8], 0);

    -[SBFolderControllerBackgroundView _reduceTransparencyEnabledStateChanged](v3, "_reduceTransparencyEnabledStateChanged");
  }
  return v3;
}

- (void)_reduceTransparencyEnabledStateChanged
{
  _BOOL8 IsReduceTransparencyEnabled;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (IsReduceTransparencyEnabled != -[SBFolderControllerBackgroundView isReduceTransparencyEnabled](self, "isReduceTransparencyEnabled"))
  {
    -[SBFolderControllerBackgroundView setReduceTransparencyEnabled:](self, "setReduceTransparencyEnabled:", IsReduceTransparencyEnabled);
    -[SBFolderControllerBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
  }
}

double __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_2()
{
  return 0.35;
}

- (void)setTransitionCancelled:(BOOL)a3
{
  if (self->_transitionCancelled != a3)
  {
    self->_transitionCancelled = a3;
    -[SBFolderControllerBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
  }
}

- (void)setEffectActive:(BOOL)a3
{
  if (self->_effectActive != a3)
  {
    self->_effectActive = a3;
    -[SBFolderControllerBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
  }
}

uint64_t __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setWeighting:", *(double *)(a1 + 40));
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGAffineTransform v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)SBFolderControllerBackgroundView;
  -[SBFolderControllerBackgroundView layoutSubviews](&v18, sel_layoutSubviews);
  -[SBFolderControllerBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFolderControllerBackgroundView minimumHomeScreenScale](self, "minimumHomeScreenScale");
  v12 = v11;
  if (BSFloatGreaterThanFloat())
  {
    UIRectGetCenter();
    CGAffineTransformMakeScale(&v17, 1.0 / v12, 1.0 / v12);
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    CGRectApplyAffineTransform(v19, &v17);
    UIRectCenteredAboutPoint();
    v4 = v13;
    v6 = v14;
    v8 = v15;
    v10 = v16;
  }
  -[MTMaterialView setFrame:](self->_blurView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_tintView, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_blurViewSnapshot, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_debugFreezingView, "setFrame:", v4, v6, v8, v10);
}

- (double)minimumHomeScreenScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SBFolderControllerBackgroundView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "minimumHomeScreenScaleForFolderControllerBackgroundView:", self);
    v6 = v5;
  }
  else
  {
    v6 = 1.0;
  }

  return v6;
}

- (SBFolderControllerBackgroundViewDelegate)delegate
{
  return (SBFolderControllerBackgroundViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugFreezingView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_blurViewSnapshot, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

+ (id)_tintColorForEffect:(unint64_t)a3
{
  double v3;
  void *v4;

  if (a3 == 3)
  {
    v3 = 0.6;
  }
  else
  {
    if (a3 != 4)
    {
      v4 = 0;
      return v4;
    }
    v3 = 0.8;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)setEffect:(unint64_t)a3
{
  if (self->_effect != a3)
  {
    self->_effect = a3;
    -[SBFolderControllerBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
  }
}

uint64_t __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setWeighting:", 1.0);
}

uint64_t __56__SBFolderControllerBackgroundView__updateCurrentEffect__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setWeighting:", *(double *)(a1 + 40));
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v4;
  void *blurViewSnapshot;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *v12;
  _QWORD v13[5];

  if (self->_frozen != a3)
  {
    self->_frozen = a3;
    v4 = !a3;
    -[UIView setHidden:](self->_debugFreezingView, "setHidden:", !a3);
    if (v4)
    {
      -[SBFolderControllerBackgroundView addSubview:](self, "addSubview:", self->_blurView);
      -[UIImageView removeFromSuperview](self->_blurViewSnapshot, "removeFromSuperview");
      blurViewSnapshot = self->_blurViewSnapshot;
      self->_blurViewSnapshot = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
      blurViewSnapshot = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(blurViewSnapshot, "setOpaque:", 1);
      v6 = objc_alloc(MEMORY[0x1E0DC3828]);
      -[MTMaterialView bounds](self->_blurView, "bounds");
      v9 = (void *)objc_msgSend(v6, "initWithSize:format:", blurViewSnapshot, v7, v8);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __46__SBFolderControllerBackgroundView_setFrozen___block_invoke;
      v13[3] = &unk_1E8D85BE0;
      v13[4] = self;
      objc_msgSend(v9, "imageWithActions:", v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v12 = self->_blurViewSnapshot;
      self->_blurViewSnapshot = v11;

      -[UIImageView setImage:](self->_blurViewSnapshot, "setImage:", v10);
      -[SBFolderControllerBackgroundView addSubview:](self, "addSubview:", self->_blurViewSnapshot);
      -[MTMaterialView removeFromSuperview](self->_blurView, "removeFromSuperview");

    }
    -[SBFolderControllerBackgroundView bringSubviewToFront:](self, "bringSubviewToFront:", self->_debugFreezingView);
    -[SBFolderControllerBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __46__SBFolderControllerBackgroundView_setFrozen___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  objc_msgSend(v1, "bounds");
  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

- (BOOL)_isCurrentlyExpanding
{
  BOOL v3;

  v3 = -[SBFolderControllerBackgroundView isExpanding](self, "isExpanding");
  return v3 ^ -[SBFolderControllerBackgroundView isTransitionCancelled](self, "isTransitionCancelled");
}

- (BOOL)isTransitionCancelled
{
  return self->_transitionCancelled;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
  self->_reduceTransparencyEnabled = a3;
}

@end
