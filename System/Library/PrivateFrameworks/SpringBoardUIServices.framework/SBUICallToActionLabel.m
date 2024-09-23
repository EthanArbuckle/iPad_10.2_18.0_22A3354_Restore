@implementation SBUICallToActionLabel

- (SBUICallToActionLabel)initWithFrame:(CGRect)a3
{
  SBUICallToActionLabel *v3;
  uint64_t v4;
  NSMutableArray *animationCompletionBlocks;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBUICallToActionLabel;
  v3 = -[SBUICallToActionLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    animationCompletionBlocks = v3->_animationCompletionBlocks;
    v3->_animationCompletionBlocks = (NSMutableArray *)v4;

    -[SBUICallToActionLabel _createLabel](v3, "_createLabel");
    -[SBUICallToActionLabel _createGradientLayer](v3, "_createGradientLayer");
    -[SBUICallToActionLabel setState:](v3, "setState:", 0);
    -[SBUICallToActionLabel bs_setHitTestingDisabled:](v3, "bs_setHitTestingDisabled:", 1);
    -[SBUICallToActionLabel setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("call-to-action-label"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__preferredTextSizeChanged_, *MEMORY[0x1E0CEB3F0], 0);

  }
  return v3;
}

- (void)didMoveToSuperview
{
  void *v3;

  -[SBUICallToActionLabel superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SBUICallToActionLabel cancelFadeInTimerIfNecessary](self, "cancelFadeInTimerIfNecessary");
    -[CAGradientLayer removeAllAnimations](self->_gradientLayer, "removeAllAnimations");
  }
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  double v9;
  long double v10;
  long double v11;
  double v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)SBUICallToActionLabel;
  -[SBUICallToActionLabel layoutSubviews](&v13, sel_layoutSubviews);
  -[SBUICallToActionLabel bounds](self, "bounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidY = CGRectGetMidY(v15);
  -[SBUILegibilityLabel setFrame:](self->_label, "setFrame:", x, y, width, height);
  -[SBUILegibilityLabel setCenter:](self->_label, "setCenter:", MidX, MidY);
  -[SBUILegibilityLabel frame](self->_label, "frame");
  v10 = v9;
  -[SBUILegibilityLabel frame](self->_label, "frame");
  v12 = fmax(hypot(v10, v11) * 2.0 + 32.0, 364.0);
  -[CAGradientLayer setBounds:](self->_gradientLayer, "setBounds:", 0.0, 0.0, v12, v12);
  -[CAGradientLayer setPosition:](self->_gradientLayer, "setPosition:", MidX, MidY + 32.0);
}

- (void)sizeToFit
{
  -[SBUILegibilityLabel sizeToFit](self->_label, "sizeToFit");
  -[SBUILegibilityLabel bounds](self->_label, "bounds");
  -[SBUICallToActionLabel setBounds:](self, "setBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBUICallToActionLabel label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLegibilitySettings:", v6);

  }
}

- (double)baselineOffset
{
  void *v2;
  double v3;
  double v4;

  -[SBUICallToActionLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baselineOffset");
  v4 = v3;

  return v4;
}

- (void)fadeIn
{
  -[SBUICallToActionLabel fadeInImmediately:completion:](self, "fadeInImmediately:completion:", 0, 0);
}

- (void)fadeInImmediately:(BOOL)a3
{
  -[SBUICallToActionLabel fadeInImmediately:completion:](self, "fadeInImmediately:completion:", a3, 0);
}

- (void)fadeInImmediately:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, id);

  v4 = a3;
  v6 = (void (**)(id, id))a4;
  switch(-[SBUICallToActionLabel state](self, "state"))
  {
    case 0uLL:
      -[SBUICallToActionLabel _addAnimationCompletionBlockIfNecessary:](self, "_addAnimationCompletionBlockIfNecessary:", v6);
      -[SBUICallToActionLabel _runGradientAnimation:](self, "_runGradientAnimation:", v4);
      break;
    case 1uLL:
      -[SBUICallToActionLabel _addAnimationCompletionBlockIfNecessary:](self, "_addAnimationCompletionBlockIfNecessary:", v6);
      break;
    case 2uLL:
      if (v6)
        v6[2](v6, v6);
      break;
    case 3uLL:
      -[SBUICallToActionLabel _runFadeAnimationForFadingOut:duration:completion:](self, "_runFadeAnimationForFadingOut:duration:completion:", 0, v6, 0.4);
      break;
    default:
      break;
  }

}

- (void)fadeOut
{
  -[SBUICallToActionLabel fadeOutWithDuration:completion:](self, "fadeOutWithDuration:completion:", 0, 0.4);
}

- (void)fadeOutWithDuration:(double)a3 completion:(id)a4
{
  unint64_t v6;
  void (**v7)(void);

  v7 = (void (**)(void))a4;
  v6 = -[SBUICallToActionLabel state](self, "state");
  if (v6 - 1 < 2)
  {
    -[SBUICallToActionLabel _runFadeAnimationForFadingOut:duration:completion:](self, "_runFadeAnimationForFadingOut:duration:completion:", 1, v7, a3);
  }
  else if (!v6 || v6 == 3)
  {
    -[SBUICallToActionLabel _invalidateGradientAnimationTimer](self, "_invalidateGradientAnimationTimer");
    -[CAGradientLayer removeAnimationForKey:](self->_gradientLayer, "removeAnimationForKey:", CFSTR("call-to-action"));
    if (v7)
      v7[2]();
  }

}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v5;
  _BOOL8 v6;

  if (a4)
  {
    if (a3)
      -[SBUICallToActionLabel fadeIn](self, "fadeIn");
    else
      -[SBUICallToActionLabel fadeOut](self, "fadeOut");
  }
  else
  {
    v5 = 2;
    if (!a3)
      v5 = 0;
    v6 = !a3;
    -[SBUICallToActionLabel setState:](self, "setState:", v5);
    -[SBUICallToActionLabel _resetGradientAndLabelBefore:](self, "_resetGradientAndLabelBefore:", v6);
    -[SBUICallToActionLabel _invalidateGradientAnimationTimer](self, "_invalidateGradientAnimationTimer");
    -[CAGradientLayer removeAnimationForKey:](self->_gradientLayer, "removeAnimationForKey:", CFSTR("call-to-action"));
    -[SBUICallToActionLabel _executePostAnimationCompletionBlocks](self, "_executePostAnimationCompletionBlocks");
  }
}

- (void)setText:(id)a3
{
  -[SBUICallToActionLabel setText:forLanguage:animated:](self, "setText:forLanguage:animated:", a3, 0, 0);
}

- (void)setText:(id)a3 forLanguage:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *text;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  void (**v18)(_QWORD);
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  NSString *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!self->_text || (objc_msgSend(v8, "isEqualToString:") & 1) == 0)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    text = self->_text;
    self->_text = v10;

    SBLogDashBoardCallToActionLabel();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_text;
      NSStringFromBOOL();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = self->_state - 1;
      if (v16 > 2)
        v17 = CFSTR("hidden");
      else
        v17 = off_1E4C40A38[v16];
      *(_DWORD *)buf = 138412802;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_INFO, "Changing call to action text: %@ (animated: %@, current state: %{public}@)", buf, 0x20u);

    }
    if (a5)
    {
      objc_initWeak((id *)buf, self);
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __54__SBUICallToActionLabel_setText_forLanguage_animated___block_invoke;
      v23 = &unk_1E4C409D8;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v9;
      v18 = (void (**)(_QWORD))MEMORY[0x1A85A1798](&v20);
      v19 = -[SBUICallToActionLabel state](self, "state", v20, v21, v22, v23);
      if (v19 - 1 < 2)
      {
        -[SBUICallToActionLabel _runFadeAnimationForFadingOut:duration:completion:](self, "_runFadeAnimationForFadingOut:duration:completion:", 1, v18, 0.4);
      }
      else if (v19)
      {
        if (v19 == 3)
          -[SBUICallToActionLabel _addAnimationCompletionBlockIfNecessary:](self, "_addAnimationCompletionBlockIfNecessary:", v18);
      }
      else
      {
        v18[2](v18);
      }

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[SBUICallToActionLabel _updateLabelTextWithLanguage:](self, "_updateLabelTextWithLanguage:", v9);
    }
  }

}

void __54__SBUICallToActionLabel_setText_forLanguage_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateLabelTextWithLanguage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "fadeInImmediately:", 1);

}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = self->_state - 1;
  if (v5 > 2)
    v6 = CFSTR("hidden");
  else
    v6 = off_1E4C40A38[v5];
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("state"));
  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    SBLogDashBoardCallToActionLabel();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = self->_state - 1;
      if (v5 > 2)
        v6 = CFSTR("hidden");
      else
        v6 = off_1E4C40A38[v5];
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_INFO, "Call to action label state changing to %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)_updateLabelTextWithLanguage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SBUICallToActionLabel label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAdaptLocalizedStringForView();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
    if (v8)
    {
      objc_msgSend(v6, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAttribute:value:range:", CFSTR("NSLanguage"), v8, 0, objc_msgSend(v7, "length"));

    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "setAttributedText:", v6);
  objc_msgSend(v4, "setNumberOfLines:", 4);

}

- (void)_createLabel
{
  SBUILegibilityLabel *v3;
  void *v4;
  void *v5;
  SBUILegibilityLabel *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[SBUICallToActionLabel _callToActionFont](self, "_callToActionFont");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SBUILegibilityLabel alloc];
  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUICallToActionLabel text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBUILegibilityLabel initWithSettings:strength:string:font:](v3, "initWithSettings:strength:string:font:", v4, v5, v10, 0.25);

  objc_msgSend(v10, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;

  -[SBUILegibilityLabel setMinimumScaleFactor:](v6, "setMinimumScaleFactor:", (v9 + -2.0) / v9);
  -[SBUILegibilityLabel setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", 1);
  -[SBUICallToActionLabel addSubview:](self, "addSubview:", v6);
  -[SBUICallToActionLabel setLabel:](self, "setLabel:", v6);

}

- (id)_callToActionFont
{
  void *v2;
  void *v3;
  void *v5;
  NSString *v6;
  uint64_t v7;
  int v8;
  char v9;
  id v10;
  int v11;
  char v12;
  int v13;
  char v14;
  double v15;
  id *v16;
  uint64_t v17;
  void *v18;

  if (_callToActionFont_onceToken != -1)
    dispatch_once(&_callToActionFont_onceToken, &__block_literal_global_39);
  v5 = (void *)_callToActionFont_callToActionFont;
  if (!_callToActionFont_callToActionFont)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory(v6))
      v7 = 32770;
    else
      v7 = 2;

    v8 = __sb__runningInSpringBoard();
    v9 = v8;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v10 = (id)*MEMORY[0x1E0CEB3C8];
LABEL_30:
        -[SBUICallToActionLabel _fontWithTextStyle:symbolicTraits:withMaximumFontSizeCategory:](self, "_fontWithTextStyle:symbolicTraits:withMaximumFontSizeCategory:", *MEMORY[0x1E0CEB538], v7, v10);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)_callToActionFont_callToActionFont;
        _callToActionFont_callToActionFont = v17;

        v5 = (void *)_callToActionFont_callToActionFont;
        return v5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (-[NSString userInterfaceIdiom](v6, "userInterfaceIdiom"))
      {
        v10 = (id)*MEMORY[0x1E0CEB3C8];
        goto LABEL_29;
      }
    }
    v11 = __sb__runningInSpringBoard();
    v12 = v11;
    if (v11)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v10 = (id)*MEMORY[0x1E0CEB3D0];
        if ((v9 & 1) != 0)
          goto LABEL_30;
        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom"))
      {
        v10 = (id)*MEMORY[0x1E0CEB3D0];
        goto LABEL_33;
      }
    }
    v13 = __sb__runningInSpringBoard();
    v14 = v13;
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v15 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
      v16 = (id *)MEMORY[0x1E0CEB3C8];
    else
      v16 = (id *)MEMORY[0x1E0CEB3D0];
    v10 = *v16;
    if ((v14 & 1) != 0)
    {
      if ((v12 & 1) != 0)
        goto LABEL_28;
    }
    else
    {

      if ((v12 & 1) != 0)
      {
LABEL_28:
        if ((v9 & 1) != 0)
          goto LABEL_30;
LABEL_29:

        goto LABEL_30;
      }
    }
LABEL_33:

    if ((v9 & 1) != 0)
      goto LABEL_30;
    goto LABEL_29;
  }
  return v5;
}

void __42__SBUICallToActionLabel__callToActionFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CEB3F0];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v0, 0, v1, &__block_literal_global_19);

}

void __42__SBUICallToActionLabel__callToActionFont__block_invoke_2()
{
  void *v0;

  v0 = (void *)_callToActionFont_callToActionFont;
  _callToActionFont_callToActionFont = 0;

}

- (id)_fontWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 withMaximumFontSizeCategory:(id)a5
{
  uint64_t v6;
  id v7;
  NSString *v8;
  NSString *v9;
  NSComparisonResult v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (NSString *)a5;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = UIContentSizeCategoryCompareToCategory(v9, v8);

  v11 = (void *)MEMORY[0x1E0CEA5F0];
  if (v10 == NSOrderedAscending)
  {
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_createGradientLayer
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  objc_msgSend(v3, "setType:", *MEMORY[0x1E0CD2F58]);
  objc_msgSend(v3, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v3, "setEndPoint:", 1.0, 1.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10[0] = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10[1] = objc_msgSend(v5, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColors:", v6);

  -[SBUICallToActionLabel _resetGradientAndLabelBefore:](self, "_resetGradientAndLabelBefore:", 1);
  -[SBUICallToActionLabel layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", v3);

  -[SBUICallToActionLabel setGradientLayer:](self, "setGradientLayer:", v3);
  -[SBUICallToActionLabel label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMask:", v3);

}

- (void)_preferredTextSizeChanged:(id)a3
{
  SBUILegibilityLabel *label;
  void *v5;

  label = self->_label;
  -[SBUICallToActionLabel _callToActionFont](self, "_callToActionFont", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUILegibilityLabel setFont:](label, "setFont:", v5);

  -[SBUICallToActionLabel _updateLabelTextWithLanguage:](self, "_updateLabelTextWithLanguage:", 0);
}

- (void)_runGradientAnimation:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;

  if (a3)
  {
    -[SBUICallToActionLabel _invalidateGradientAnimationTimer](self, "_invalidateGradientAnimationTimer");
    SBLogDashBoardCallToActionLabel();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[SBUICallToActionLabel _runGradientAnimation:].cold.1();

    -[SBUICallToActionLabel _actuallyRunGradientAnimation](self, "_actuallyRunGradientAnimation");
  }
  else
  {
    -[SBUICallToActionLabel animationTimer](self, "animationTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      SBLogDashBoardCallToActionLabel();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        -[SBUICallToActionLabel _runGradientAnimation:].cold.2();

      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__actuallyRunGradientAnimation, 0, 0, 4.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUICallToActionLabel setAnimationTimer:](self, "setAnimationTimer:", v7);

    }
  }
}

- (void)_invalidateGradientAnimationTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, v0, v1, "%{public}@: invalidating fade-in timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_timerTriggered
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, v0, v1, "%{public}@: fade-in timer triggered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_actuallyRunGradientAnimation
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1A471F000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: adding gradient animation: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runFadeAnimationForFadingOut:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  if (a3)
    v8 = 3;
  else
    v8 = 1;
  v9 = a5;
  -[SBUICallToActionLabel setState:](self, "setState:", v8);
  -[SBUICallToActionLabel _invalidateGradientAnimationTimer](self, "_invalidateGradientAnimationTimer");
  -[CAGradientLayer removeAnimationForKey:](self->_gradientLayer, "removeAnimationForKey:", CFSTR("call-to-action"));
  -[SBUICallToActionLabel _addAnimationCompletionBlockIfNecessary:](self, "_addAnimationCompletionBlockIfNecessary:", v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke;
  v12[3] = &unk_1E4C3E430;
  v12[4] = self;
  v13 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke_2;
  v10[3] = &unk_1E4C3EBD0;
  v11 = a3;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 4, v12, v10, a4, 0.0);
}

uint64_t __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", v1);
}

uint64_t __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_resetGradientAndLabelBefore:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_executePostAnimationCompletionBlocks");
}

- (void)_resetGradientAndLabelBefore:(BOOL)a3
{
  _BOOL4 v3;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v6;
  CATransform3D *v7;
  CATransform3D v8;
  CATransform3D v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[SBUILegibilityLabel setAlpha:](self->_label, "setAlpha:", 1.0);
  gradientLayer = self->_gradientLayer;
  if (v3)
  {
    -[CAGradientLayer setLocations:](gradientLayer, "setLocations:", &unk_1E4C7AFA0);
    v6 = self->_gradientLayer;
    CATransform3DMakeScale(&v9, 0.0, 0.0, 1.0);
    v7 = &v9;
  }
  else
  {
    -[CAGradientLayer setLocations:](gradientLayer, "setLocations:", &unk_1E4C7AFB8);
    v6 = self->_gradientLayer;
    CATransform3DMakeScale(&v8, 1.0, 1.0, 1.0);
    v7 = &v8;
  }
  -[CAGradientLayer setTransform:](v6, "setTransform:", v7);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)_addAnimationCompletionBlockIfNecessary:(id)a3
{
  NSMutableArray *animationCompletionBlocks;
  void *v4;
  id v5;

  if (a3)
  {
    animationCompletionBlocks = self->_animationCompletionBlocks;
    v5 = (id)objc_msgSend(a3, "copy");
    v4 = (void *)MEMORY[0x1A85A1798]();
    -[NSMutableArray addObject:](animationCompletionBlocks, "addObject:", v4);

  }
}

- (void)_executePostAnimationCompletionBlocks
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_animationCompletionBlocks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_animationCompletionBlocks, "removeAllObjects", (_QWORD)v8);
}

- (void)animationDidStart:(id)a3
{
  -[SBUICallToActionLabel setState:](self, "setState:", 1);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;

  v4 = a4;
  SBLogDashBoardCallToActionLabel();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBUICallToActionLabel animationDidStop:finished:].cold.1();

  if (v4 && -[SBUICallToActionLabel state](self, "state") == 1)
  {
    -[SBUICallToActionLabel setState:](self, "setState:", 2);
    -[SBUICallToActionLabel _executePostAnimationCompletionBlocks](self, "_executePostAnimationCompletionBlocks");
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (NSString)text
{
  return self->_text;
}

- (SBUILegibilityLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_animationTimer, a3);
}

- (NSMutableArray)animationCompletionBlocks
{
  return self->_animationCompletionBlocks;
}

- (void)setAnimationCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_animationCompletionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

- (void)_runGradientAnimation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, v0, v1, "%{public}@: running fade-in animation immediately", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runGradientAnimation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, v0, v1, "%{public}@: scheduling fade-in timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)animationDidStop:finished:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_0(&dword_1A471F000, v0, v1, "%{public}@: gradient fade-in finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
