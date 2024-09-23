@implementation UIKBUndoStyling

- (UIKBUndoStyling)initWithKeyboardAppearance:(int64_t)a3 isRTL:(BOOL)a4
{
  UIKBUndoStyling *v6;
  uint64_t v7;
  UIBlurEffect *backgroundBlurEffect;
  uint64_t v9;
  UIVibrancyEffect *backgroundVibrancyEffect;
  UIKBUndoStyling *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIKBUndoStyling;
  v6 = -[UIKBUndoStyling init](&v13, sel_init);
  if (v6)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundBlurEffect = v6->_backgroundBlurEffect;
    v6->_backgroundBlurEffect = (UIBlurEffect *)v7;

    -[UIKBUndoStyling vibrancyEffectForBlur:](v6, "vibrancyEffectForBlur:", v6->_backgroundBlurEffect);
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundVibrancyEffect = v6->_backgroundVibrancyEffect;
    v6->_backgroundVibrancyEffect = (UIVibrancyEffect *)v9;

    v6->_isRTL = a4;
    v6->_appearance = a3;
    -[UIKBUndoStyling createDynamicColors](v6, "createDynamicColors");
    v11 = v6;
  }

  return v6;
}

- (id)vibrancyEffectForBlur:(id)a3
{
  return +[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", a3, 7);
}

- (void)createDynamicColors
{
  UIColor *v3;
  UIColor *HUDbackgroundColor;
  UIColor *v5;
  UIColor *HUDShadowColor;
  UIColor *v7;
  UIColor *elementBackgroundColor;
  UIColor *v9;
  UIColor *elementCoverColor;
  UIColor *v11;
  UIColor *buttonGlyphColorEnabled;
  UIColor *v13;
  UIColor *buttonGlyphColorDisabled;

  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_391);
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  HUDbackgroundColor = self->_HUDbackgroundColor;
  self->_HUDbackgroundColor = v3;

  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_43_0);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  HUDShadowColor = self->_HUDShadowColor;
  self->_HUDShadowColor = v5;

  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_44_0);
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  elementBackgroundColor = self->_elementBackgroundColor;
  self->_elementBackgroundColor = v7;

  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_45_1);
  v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
  elementCoverColor = self->_elementCoverColor;
  self->_elementCoverColor = v9;

  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_46);
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  buttonGlyphColorEnabled = self->_buttonGlyphColorEnabled;
  self->_buttonGlyphColorEnabled = v11;

  objc_storeStrong((id *)&self->_buttonGlyphColorPressed, self->_buttonGlyphColorEnabled);
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &__block_literal_global_47_3);
  v13 = (UIColor *)objc_claimAutoreleasedReturnValue();
  buttonGlyphColorDisabled = self->_buttonGlyphColorDisabled;
  self->_buttonGlyphColorDisabled = v13;

}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "valueForNSIntegerTrait:", v3);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__UIKBUndoStyling_createDynamicColors__block_invoke_2;
  v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v9[4] = v4;
  objc_msgSend(v2, "traitCollectionByModifyingTraits:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __38__UIKBUndoStyling_createDynamicColors__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32) == 1)
    v2 = 2;
  else
    v2 = 1;
  v3 = a2;
  objc_msgSend(v3, "setUserInterfaceStyle:", v2);
  objc_msgSend(v3, "setUserInterfaceLevel:", 1);

}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "valueForNSIntegerTrait:", v3);

  if (v4 == 1)
    +[UIColor clearColor](UIColor, "clearColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "valueForNSIntegerTrait:", v3);

  if (v4 == 1)
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.4);
  else
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.937254902, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "valueForNSIntegerTrait:", v3);

  if (v4 == 1)
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.95);
  else
    +[UIColor systemYellowColor](UIColor, "systemYellowColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "valueForNSIntegerTrait:", v3);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __38__UIKBUndoStyling_createDynamicColors__block_invoke_7;
  v10[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v10[4] = v4;
  objc_msgSend(v2, "traitCollectionByModifyingTraits:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor labelColor](UIColor, "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolvedColorWithTraitCollection:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __38__UIKBUndoStyling_createDynamicColors__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32) == 1)
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setUserInterfaceStyle:", v2);
}

id __38__UIKBUndoStyling_createDynamicColors__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "valueForNSIntegerTrait:", v3);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__UIKBUndoStyling_createDynamicColors__block_invoke_9;
  v9[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
  v9[4] = v4;
  objc_msgSend(v2, "traitCollectionByModifyingTraits:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedColorWithTraitCollection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __38__UIKBUndoStyling_createDynamicColors__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32) == 1)
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setUserInterfaceStyle:", v2);
}

- (UIFont)undoInteractiveControlLabelFont
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *MEMORY[0x1E0DC5D78];
  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC5D70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:maximumPointSize:compatibleWithTraitCollection:", v2, v3, 18.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (UIFont)undoStateControlLabelFont
{
  void *v2;
  void *v3;

  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", CFSTR("UICTContentSizeCategoryL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:maximumPointSize:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleEmphasizedFootnote"), v2, 20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIFont)undoStateControlUnavailableLabelFont
{
  void *v2;
  void *v3;

  +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", CFSTR("UICTContentSizeCategoryL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:maximumPointSize:compatibleWithTraitCollection:", CFSTR("UICTFontTextStyleEmphasizedCaption2"), v2, 20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (UIBlurEffect)backgroundBlurEffect
{
  return self->_backgroundBlurEffect;
}

- (void)setBackgroundBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundBlurEffect, a3);
}

- (UIVibrancyEffect)backgroundVibrancyEffect
{
  return self->_backgroundVibrancyEffect;
}

- (void)setBackgroundVibrancyEffect:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVibrancyEffect, a3);
}

- (UIColor)HUDbackgroundColor
{
  return self->_HUDbackgroundColor;
}

- (void)setHUDbackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_HUDbackgroundColor, a3);
}

- (UIColor)HUDShadowColor
{
  return self->_HUDShadowColor;
}

- (void)setHUDShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_HUDShadowColor, a3);
}

- (UIColor)buttonGlyphColorEnabled
{
  return self->_buttonGlyphColorEnabled;
}

- (void)setButtonGlyphColorEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGlyphColorEnabled, a3);
}

- (UIColor)buttonGlyphColorPressed
{
  return self->_buttonGlyphColorPressed;
}

- (void)setButtonGlyphColorPressed:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGlyphColorPressed, a3);
}

- (UIColor)buttonGlyphColorDisabled
{
  return self->_buttonGlyphColorDisabled;
}

- (void)setButtonGlyphColorDisabled:(id)a3
{
  objc_storeStrong((id *)&self->_buttonGlyphColorDisabled, a3);
}

- (UIColor)elementBackgroundColor
{
  return self->_elementBackgroundColor;
}

- (void)setElementBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_elementBackgroundColor, a3);
}

- (UIColor)elementCoverColor
{
  return self->_elementCoverColor;
}

- (void)setElementCoverColor:(id)a3
{
  objc_storeStrong((id *)&self->_elementCoverColor, a3);
}

- (BOOL)undoRedoIconOnly
{
  return self->_undoRedoIconOnly;
}

- (void)setUndoRedoIconOnly:(BOOL)a3
{
  self->_undoRedoIconOnly = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (double)undoControlMinWidth
{
  return self->_undoControlMinWidth;
}

- (void)setUndoControlMinWidth:(double)a3
{
  self->_undoControlMinWidth = a3;
}

- (double)cutControlMinWidth
{
  return self->_cutControlMinWidth;
}

- (void)setCutControlMinWidth:(double)a3
{
  self->_cutControlMinWidth = a3;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (BOOL)cutCopyPasteIconOnly
{
  return self->_cutCopyPasteIconOnly;
}

- (void)setCutCopyPasteIconOnly:(BOOL)a3
{
  self->_cutCopyPasteIconOnly = a3;
}

- (BOOL)tooSmallForInstructionalText
{
  return self->_tooSmallForInstructionalText;
}

- (void)setTooSmallForInstructionalText:(BOOL)a3
{
  self->_tooSmallForInstructionalText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementCoverColor, 0);
  objc_storeStrong((id *)&self->_elementBackgroundColor, 0);
  objc_storeStrong((id *)&self->_buttonGlyphColorDisabled, 0);
  objc_storeStrong((id *)&self->_buttonGlyphColorPressed, 0);
  objc_storeStrong((id *)&self->_buttonGlyphColorEnabled, 0);
  objc_storeStrong((id *)&self->_HUDShadowColor, 0);
  objc_storeStrong((id *)&self->_HUDbackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_backgroundBlurEffect, 0);
}

@end
