@implementation NCNotificationListCountIndicatorButton

- (NCNotificationListCountIndicatorButton)initWithTitle:(id)a3 symbolName:(id)a4 withFont:(id)a5 legibilitySettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NCNotificationListCountIndicatorButton *v14;
  SBUILegibilityLabel *v15;
  SBUILegibilityLabel *label;
  void *v17;
  double v18;
  void *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)NCNotificationListCountIndicatorButton;
  v14 = -[NCNotificationListCountIndicatorButton initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v14)
  {
    v15 = (SBUILegibilityLabel *)objc_alloc_init(MEMORY[0x1E0DAC5D8]);
    label = v14->_label;
    v14->_label = v15;

    -[NCNotificationListCountIndicatorButton _attributedStringWithText:symbolName:withFont:](v14, "_attributedStringWithText:symbolName:withFont:", v10, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityLabel setAttributedText:](v14->_label, "setAttributedText:", v17);
    -[SBUILegibilityLabel setFont:](v14->_label, "setFont:", v12);
    -[SBUILegibilityLabel setNumberOfLines:](v14->_label, "setNumberOfLines:", 1);
    -[SBUILegibilityLabel setLineBreakMode:](v14->_label, "setLineBreakMode:", 4);
    -[SBUILegibilityLabel setTextAlignment:](v14->_label, "setTextAlignment:", 1);
    LODWORD(v18) = 1036831949;
    -[SBUILegibilityLabel setHyphenationFactor:](v14->_label, "setHyphenationFactor:", v18);
    -[SBUILegibilityLabel setOptions:](v14->_label, "setOptions:", 2);
    -[SBUILegibilityLabel setUserInteractionEnabled:](v14->_label, "setUserInteractionEnabled:", 0);
    -[SBUILegibilityLabel setAlpha:](v14->_label, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("focus-text-%@"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUILegibilityLabel setAccessibilityIdentifier:](v14->_label, "setAccessibilityIdentifier:", v19);
    -[SBUILegibilityLabel setLegibilitySettings:](v14->_label, "setLegibilitySettings:", v13);

  }
  return v14;
}

- (void)hideContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  void (**v12)(_QWORD);
  _QWORD v13[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = v6;
  if (v4)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke;
    v13[3] = &unk_1E8D1B568;
    v13[4] = self;
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke_2;
    v11 = &unk_1E8D1B148;
    v12 = v6;
    +[NCMigrationGatewayFromCAtoC2 animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:](NCMigrationGatewayFromCAtoC2, "animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:", 1, v13, &v8, 0.25, 240.0, 20.0);

  }
  else if (v6)
  {
    v6[2](v6);
  }
  -[NCNotificationListCountIndicatorButton setNeedsLayout](self, "setNeedsLayout", v8, v9, v10, v11);

}

uint64_t __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 0.0);
}

uint64_t __73__NCNotificationListCountIndicatorButton_hideContentAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[SBUILegibilityLabel setNumberOfLines:](self->_label, "setNumberOfLines:", a3);
}

- (int64_t)numberOfLines
{
  return -[SBUILegibilityLabel numberOfLines](self->_label, "numberOfLines");
}

- (void)setLegibilitySettings:(id)a3
{
  -[SBUILegibilityLabel setLegibilitySettings:](self->_label, "setLegibilitySettings:", a3);
}

- (_UILegibilitySettings)legibilitySettings
{
  return (_UILegibilitySettings *)-[SBUILegibilityLabel legibilitySettings](self->_label, "legibilitySettings");
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

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCountIndicatorButton;
  -[NCNotificationListCountIndicatorButton layoutSubviews](&v3, sel_layoutSubviews);
  -[NCNotificationListCountIndicatorButton _configureButtonIfNecessary](self, "_configureButtonIfNecessary");
  -[NCNotificationListCountIndicatorButton _configureLabelIfNecessary](self, "_configureLabelIfNecessary");
  -[NCNotificationListCountIndicatorButton _layout](self, "_layout");
}

- (void)_configureLabelIfNecessary
{
  void *v3;

  -[SBUILegibilityLabel superview](self->_label, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[NCNotificationListCountIndicatorButton addSubview:](self, "addSubview:", self->_label);
    -[NCNotificationListCountIndicatorButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_label);
  }
}

- (void)_configureButtonIfNecessary
{
  UIButton *v3;
  UIButton *button;

  if (!self->_button)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    button = self->_button;
    self->_button = v3;

    -[UIButton _setTouchInsets:](self->_button, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
    -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
    -[NCNotificationListCountIndicatorButton addSubview:](self, "addSubview:", self->_button);
    -[NCNotificationListCountIndicatorButton bringSubviewToFront:](self, "bringSubviewToFront:", self->_button);
    -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTouchDown_, 1);
    -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonTouchEnded_, 352);
  }
}

- (void)_layout
{
  UIButton *button;
  SBUILegibilityLabel *label;
  __int128 v5;
  SBUILegibilityLabel *v6;
  SBUILegibilityLabel *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  button = self->_button;
  -[NCNotificationListCountIndicatorButton bounds](self, "bounds");
  -[UIButton setFrame:](button, "setFrame:");
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  label = self->_label;
  if (label)
  {
    -[SBUILegibilityLabel transform](label, "transform");
    label = self->_label;
  }
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8 = *MEMORY[0x1E0C9BAA8];
  v9 = v5;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[SBUILegibilityLabel setTransform:](label, "setTransform:", &v8);
  v6 = self->_label;
  -[NCNotificationListCountIndicatorButton bounds](self, "bounds");
  -[SBUILegibilityLabel setFrame:](v6, "setFrame:");
  -[SBUILegibilityLabel setAlpha:](self->_label, "setAlpha:", 1.0);
  v7 = self->_label;
  v8 = v11;
  v9 = v12;
  v10 = v13;
  -[SBUILegibilityLabel setTransform:](v7, "setTransform:", &v8);
}

- (void)_buttonTapped:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  -[NCNotificationListCountIndicatorButton delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (!self->_longPressStartTime)
    goto LABEL_5;
  v5 = -[NCNotificationListCountIndicatorButton shouldAllowLongPressInteraction](self, "shouldAllowLongPressInteraction");
  v4 = v9;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_longPressStartTime);
  v8 = v7;

  v4 = v9;
  if (v8 > 0.1)
    objc_msgSend(v9, "buttonWasLongPressed:", self);
  else
LABEL_5:
    objc_msgSend(v4, "buttonWasTapped:", self);

}

- (void)_updateHighlighting:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  double v6;
  _QWORD v7[5];

  v3 = a3;
  v5 = -[NCNotificationListCountIndicatorButton shouldAllowLongPressInteraction](self, "shouldAllowLongPressInteraction");
  if (!v3 || v5)
  {
    if (!v3)
    {
      -[SBUILegibilityLabel alpha](self->_label, "alpha");
      if (v6 < 1.0)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __62__NCNotificationListCountIndicatorButton__updateHighlighting___block_invoke;
        v7[3] = &unk_1E8D1B568;
        v7[4] = self;
        +[NCMigrationGatewayFromCAtoC2 animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:](NCMigrationGatewayFromCAtoC2, "animateWithDuration:orUsingSpringWithTension:friction:interactive:animations:completion:", 1, v7, 0, 0.25, 240.0, 20.0);
      }
    }
  }
  else
  {
    -[SBUILegibilityLabel setAlpha:](self->_label, "setAlpha:", 0.2);
  }
}

uint64_t __62__NCNotificationListCountIndicatorButton__updateHighlighting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setAlpha:", 1.0);
}

- (void)_buttonTouchDown:(id)a3
{
  -[NCNotificationListCountIndicatorButton _updateLongPressStateIsActiveTouch:](self, "_updateLongPressStateIsActiveTouch:", 1);
  -[NCNotificationListCountIndicatorButton _updateHighlighting:](self, "_updateHighlighting:", 1);
}

- (void)_buttonTouchEnded:(id)a3
{
  -[NCNotificationListCountIndicatorButton _updateLongPressStateIsActiveTouch:](self, "_updateLongPressStateIsActiveTouch:", 0);
  -[NCNotificationListCountIndicatorButton _updateHighlighting:](self, "_updateHighlighting:", 0);
}

- (void)_updateLongPressStateIsActiveTouch:(BOOL)a3
{
  NSDate *longPressStartTime;
  NSDate *v5;
  NSDate *v6;
  NCNotificationListCountIndicatorButton *v7;
  uint64_t v8;

  longPressStartTime = self->_longPressStartTime;
  if (!a3)
  {
    self->_longPressStartTime = 0;

    v7 = self;
    v8 = 0;
    goto LABEL_6;
  }
  if (!longPressStartTime
    && -[NCNotificationListCountIndicatorButton shouldAllowLongPressInteraction](self, "shouldAllowLongPressInteraction"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_longPressStartTime;
    self->_longPressStartTime = v5;

    v7 = self;
    v8 = 1;
LABEL_6:
    -[NCNotificationListCountIndicatorButton _setLabelScaled:](v7, "_setLabelScaled:", v8);
  }
}

- (void)_setLabelScaled:(BOOL)a3
{
  __int128 v4;
  SBUILegibilityLabel *label;
  _QWORD v6[5];
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  if (a3)
  {
    CGAffineTransformMakeScale(&v10, 1.15, 1.15);
  }
  else
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v10.c = v4;
    *(_OWORD *)&v10.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  label = self->_label;
  if (label)
    -[SBUILegibilityLabel transform](label, "transform");
  else
    memset(&t2, 0, sizeof(t2));
  t1 = v10;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v6[1] = 3221225472;
    v7 = v10;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[2] = __58__NCNotificationListCountIndicatorButton__setLabelScaled___block_invoke;
    v6[3] = &unk_1E8D1CD98;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v6, 0, 240.0, 20.0);
  }
}

uint64_t __58__NCNotificationListCountIndicatorButton__setLabelScaled___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (id)_attributedStringWithText:(id)a3 symbolName:(id)a4 withFont:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    if (v8)
    {
      v15 = 0;
      goto LABEL_9;
    }
LABEL_14:
    v15 = objc_alloc_init(MEMORY[0x1E0CB3498]);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageWithRenderingMode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v14, "setImage:", v13);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 && v15)
  {
    v16 = -[NCNotificationListCountIndicatorButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v17 = objc_alloc(MEMORY[0x1E0CB3778]);
    v18 = v17;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ "), v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithString:", v19);

      objc_msgSend(v20, "appendAttributedString:", v15);
    }
    else
    {
      v20 = (void *)objc_msgSend(v17, "initWithAttributedString:", v15);
      v21 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithString:", v22);
      objc_msgSend(v20, "appendAttributedString:", v23);

    }
    goto LABEL_11;
  }
  if (!v8)
  {
    if (v15)
      goto LABEL_12;
    goto LABEL_14;
  }
LABEL_9:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);
LABEL_11:

  v15 = v20;
LABEL_12:

  return v15;
}

- (BOOL)shouldAllowLongPressInteraction
{
  return self->_shouldAllowLongPressInteraction;
}

- (void)setShouldAllowLongPressInteraction:(BOOL)a3
{
  self->_shouldAllowLongPressInteraction = a3;
}

- (NCNotificationListCountIndicatorButtonDelegate)delegate
{
  return (NCNotificationListCountIndicatorButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressStartTime, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
