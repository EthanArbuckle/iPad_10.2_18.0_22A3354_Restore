@implementation SBFolderBackgroundView

- (void)updateTintEffectColor
{
  void *v3;
  uint64_t v4;
  id v5;

  if (self->_tintView)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      -[SBFolderBackgroundView delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessibilityTintColorForBackgroundView:", self);
      v4 = objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        -[SBFolderBackgroundView _tintViewBackgroundColorAtFullAlpha](self, "_tintViewBackgroundColorAtFullAlpha");
        v4 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[SBFolderBackgroundView _tintViewBackgroundColorAtFullAlpha](self, "_tintViewBackgroundColorAtFullAlpha");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "colorWithAlphaComponent:", 0.6);
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (id)v4;

    -[UIView setBackgroundColor:](self->_tintView, "setBackgroundColor:", v5);
  }
}

- (void)setEffect:(unint64_t)a3
{
  if (-[SBFolderBackgroundView effect](self, "effect") != a3)
  {
    self->_effect = a3;
    -[SBFolderBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
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
    -[SBFolderBackgroundView updateTintEffectColor](self, "updateTintEffectColor");
    v5 = obj;
  }

}

+ (double)cornerRadiusToInsetContent
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  double v11;
  int v12;
  _BOOL4 v13;
  int v14;
  double v15;
  int v16;
  _BOOL4 v17;
  void *v18;
  double v19;
  double v21;
  void *v22;
  void *v23;

  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v2;
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 1;
      goto LABEL_11;
    }
  }
  v8 = v4 ^ 1;
  v9 = __sb__runningInSpringBoard();
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_referenceBounds");
  }
  v5 = v9 ^ 1;
  BSSizeRoundForScale();
  v10 = MEMORY[0x1E0DAB260];
  if (v11 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v16 = __sb__runningInSpringBoard();
    v3 = (uint64_t)&jpt_1CFFF2864;
    if (v16)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v6 = 0;
        v7 = 0;
        v14 = 0;
        v15 = 77.0;
        goto LABEL_26;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v4 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v4, "userInterfaceIdiom") != 1)
      {
        v7 = 0;
        v14 = 0;
        v6 = 1;
        v15 = 77.0;
        goto LABEL_26;
      }
    }
    v6 = v16 ^ 1;
    v15 = 77.0;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      v7 = 0;
      v14 = 0;
      goto LABEL_26;
    }
    v3 = __sb__runningInSpringBoard();
    if ((_DWORD)v3)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_referenceBounds");
    }
    v7 = v3 ^ 1;
    BSSizeRoundForScale();
    if (v21 < *(double *)(v10 + 360))
    {
      v14 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
LABEL_11:
  v12 = __sb__runningInSpringBoard();
  if (v12)
  {
    v13 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v3 = objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend((id)v3, "userInterfaceIdiom") == 1;
  }
  v14 = v12 ^ 1;
  if (v13)
    v15 = 53.0;
  else
    v15 = 35.0;
LABEL_26:
  if (__sb__runningInSpringBoard())
  {
    v17 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "userInterfaceIdiom") == 1;

  }
  if (v14)
  {

    if (!v7)
      goto LABEL_31;
  }
  else if (!v7)
  {
LABEL_31:
    if (v6)
      goto LABEL_32;
    goto LABEL_40;
  }

  if (v6)
  {
LABEL_32:

    if (!v5)
      goto LABEL_33;
    goto LABEL_41;
  }
LABEL_40:
  if (!v5)
  {
LABEL_33:
    if (!v8)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_41:

  if (v8)
LABEL_34:

LABEL_35:
  v19 = 3.0;
  if (v17)
    v19 = 2.0;
  return v15 + v19;
}

- (void)_updateCurrentEffect
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL4 IsReduceMotionEnabled;
  double v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[6];
  BOOL v12;
  BOOL v13;
  BOOL v14;
  _QWORD v15[3];
  char v16;

  v3 = -[SBFolderBackgroundView currentEffect](self, "currentEffect");
  v4 = -[SBFolderBackgroundView concreteEffect](self, "concreteEffect");
  -[SBFolderBackgroundView setCurrentEffect:](self, "setCurrentEffect:", v4);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke;
  v11[3] = &unk_1E8D85B90;
  v12 = v4 == 2;
  v13 = v3 == 0;
  v14 = v3 == 2;
  v11[4] = self;
  v11[5] = v15;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11, COERCE_DOUBLE(0x2020000000));
  if (v4 == 2)
  {
    -[SBFolderBackgroundView updateTintEffectColor](self, "updateTintEffectColor");
  }
  else
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    if (v3 != v4 && IsReduceMotionEnabled)
    {
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke_2;
      v9[3] = &unk_1E8D85BB8;
      v9[4] = self;
      v10 = v4 == 1;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
      v8 = 0.0;
      if (v4 == 1)
        v8 = 1.0;
      -[MTMaterialView setAlpha:](self->_blurView, "setAlpha:", v8);
    }
  }
  _Block_object_dispose(v15, 8);
}

- (void)setCurrentEffect:(unint64_t)a3
{
  self->_currentEffect = a3;
}

- (unint64_t)currentEffect
{
  return self->_currentEffect;
}

- (unint64_t)concreteEffect
{
  unint64_t result;

  result = -[SBFolderBackgroundView effect](self, "effect");
  if (!result)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
      return 2;
    else
      return 1;
  }
  return result;
}

- (unint64_t)effect
{
  return self->_effect;
}

void __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 49) || !*(_BYTE *)(a1 + 50))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeFromSuperview");
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 424);
      *(_QWORD *)(v2 + 424) = 0;

      v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 416);
      *(_QWORD *)(v5 + 416) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "_setContinuousCornerRadius:", *(double *)(*(_QWORD *)(a1 + 32) + 432));
      objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    }
  }
  else if (*(_BYTE *)(a1 + 49) || *(_BYTE *)(a1 + 50))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "removeFromSuperview");
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 416);
    *(_QWORD *)(v7 + 416) = 0;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "sbf_animatedBlurRadiusGraphicsQuality");

    if (v10 == 100)
      v11 = CFSTR("folderLight");
    else
      v11 = CFSTR("folderLightSimplified");
    v12 = CFSTR("folderDark");
    if (v10 != 100)
      v12 = CFSTR("folderDarkSimplified");
    v13 = (void *)MEMORY[0x1E0DC3E88];
    v14 = v12;
    v15 = v11;
    objc_msgSend(v13, "traitCollectionWithUserInterfaceStyle:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    v27[0] = v15;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v17;
    v27[1] = v15;
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v18;
    v27[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0D47498];
    SBHBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v19, v21, 0, 0, v22, 1.0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 424);
    *(_QWORD *)(v24 + 424) = v23;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "_setContinuousCornerRadius:", *(double *)(*(_QWORD *)(a1 + 32) + 432));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setGroupName:", CFSTR("SBFolderBackgroundViewBlurGroupName"));
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  }
}

+ (CGSize)folderBackgroundSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 400.0;
  v3 = 400.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (SBFolderBackgroundView)initWithFrame:(CGRect)a3
{
  SBFolderBackgroundView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFolderBackgroundView;
  v3 = -[SBFolderBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__reduceTransparencyChanged, *MEMORY[0x1E0DC45B8], 0);

    -[SBFolderBackgroundView _reduceTransparencyChanged](v3, "_reduceTransparencyChanged");
  }
  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  self->_continuousCornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_tintView, "_setContinuousCornerRadius:");
  -[MTMaterialView _setContinuousCornerRadius:](self->_blurView, "_setContinuousCornerRadius:", a3);
  -[SBFolderBackgroundView _updateCurrentEffect](self, "_updateCurrentEffect");
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

  -[SBFolderBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_tintView, "setFrame:");
  -[MTMaterialView setFrame:](self->_blurView, "setFrame:", v4, v6, v8, v10);
}

uint64_t __46__SBFolderBackgroundView__updateCurrentEffect__block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", v1);
}

- (id)_tintViewBackgroundColorAtFullAlpha
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.831372549, 1.0);
}

- (SBFolderBackgroundViewDelegate)delegate
{
  return (SBFolderBackgroundViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
}

@end
