@implementation SearchUIButtonItemView

- (SearchUIButtonItemView)init
{
  SearchUIButtonItemView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend((id)objc_opt_class(), "buttonWithType:", 1);
  v3 = (SearchUIButtonItemView *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SearchUIButtonItemView createContentView](v3, "createContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItemView setButtonContentBoxView:](v3, "setButtonContentBoxView:", v4);

    -[SearchUIButtonItemView buttonContentBoxView](v3, "buttonContentBoxView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);

    -[SearchUIButtonItemView setAllowsAnimation:](v3, "setAllowsAnimation:", 1);
    v6 = (void *)objc_opt_new();
    -[SearchUIButtonItemView setImage:forState:](v3, "setImage:forState:", v6, 0);

    -[SearchUIButtonItemView imageView](v3, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItemView buttonContentBoxView](v3, "buttonContentBoxView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[SearchUIButtonItemView imageView](v3, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36C0]), "initWithDelegate:", v3);
    -[SearchUIButtonItemView setContextPreviewInteraction:](v3, "setContextPreviewInteraction:", v11);
    -[SearchUIButtonItemView addInteraction:](v3, "addInteraction:", v11);
    -[SearchUIButtonItemView layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    -[SearchUIButtonItemView buttonContentBoxView](v3, "buttonContentBoxView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAutoLayout fillContainerWithView:](SearchUIAutoLayout, "fillContainerWithView:", v13);

  }
  return v3;
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
  void *v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView layoutSubviews](&v20, sel_layoutSubviews);
  -[SearchUIButtonItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SearchUIButtonItemView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SearchUIButtonItemView backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView cornerRadius](self, "cornerRadius");
  v14 = v13;
  v15 = -[SearchUIButtonItemView useContinuousCorners](self, "useContinuousCorners");
  v16 = *MEMORY[0x1E0CD2A60];
  if (v15)
    v17 = *MEMORY[0x1E0CD2A68];
  else
    v17 = *MEMORY[0x1E0CD2A60];
  objc_msgSend(v12, "tlks_setCornerRadius:withStyle:", v17, v14);

  -[SearchUIButtonItemView iconBackgroundView](self, "iconBackgroundView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView iconBackgroundViewSize](self, "iconBackgroundViewSize");
  objc_msgSend(v18, "tlks_setCornerRadius:withStyle:", v16, v19 * 0.5);

}

- (id)createContentView
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
  {
    v3 = (void *)objc_opt_new();
    -[SearchUIButtonItemView setBackgroundView:](self, "setBackgroundView:", v3);

  }
  v4 = -[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter")
    || -[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter");
  v5 = (void *)objc_opt_new();
  -[SearchUIButtonItemView setIconView:](self, "setIconView:", v5);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseButtonColoring:", 1);

  if (v4)
    v7 = 4;
  else
    v7 = 6;
  -[SearchUIButtonItemView iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSymbolWeight:", v7);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v10);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter")
    && !-[SearchUIButtonItemView shouldAvoidBackgroundView](self, "shouldAvoidBackgroundView"))
  {
    v12 = (void *)objc_opt_new();
    -[SearchUIButtonItemView setIconBackgroundView:](self, "setIconBackgroundView:", v12);

    v13 = objc_alloc(MEMORY[0x1E0CFAA98]);
    -[SearchUIButtonItemView iconBackgroundView](self, "iconBackgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v14;
    -[SearchUIButtonItemView iconView](self, "iconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v16);

    -[SearchUIButtonItemView iconView](self, "iconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlignment:forView:inAxis:", 3, v18, 0);

    -[SearchUIButtonItemView iconView](self, "iconView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAlignment:forView:inAxis:", 3, v19, 1);

    -[SearchUIButtonItemView setIconBoxView:](self, "setIconBoxView:", v17);
    -[SearchUIButtonItemView iconBoxView](self, "iconBoxView");
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v20;
  }
  v21 = (void *)objc_opt_new();
  -[SearchUIButtonItemView setTlkTitleLabel:](self, "setTlkTitleLabel:", v21);

  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUseButtonColoring:", 1);

  if (v4)
    v23 = 1;
  else
    v23 = 3;
  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setNumberOfLines:", v23);

  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", 1);

  if (v4)
  {
    v37[0] = v11;
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v26;
    v27 = v37;
  }
  else
  {
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v26;
    v36[1] = v11;
    v27 = v36;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAAB0]), "initWithArrangedSubviews:", v28);
  objc_msgSend(v29, "setAlignment:", 3);
  objc_msgSend(v29, "setLayoutMarginsRelativeArrangement:", v4);
  objc_msgSend(v29, "setAxis:", -[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"));
  -[SearchUIButtonItemView setImageViewAndLabelStackView:](self, "setImageViewAndLabelStackView:", v29);
  -[SearchUIButtonItemView updateProminences](self, "updateProminences");
  -[SearchUIButtonItemView setIsCompact:](self, "setIsCompact:", 0);
  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
  {
    -[SearchUIButtonItemView backgroundView](self, "backgroundView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "arrayByAddingObject:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFAA98]), "initWithArrangedSubviews:", v32);
  objc_msgSend(v33, "setAlignment:forView:inAxis:", 3, v29, 0);
  objc_msgSend(v33, "setAlignment:forView:inAxis:", 3, v29, 1);

  return v33;
}

- (void)setIsCompact:(BOOL)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  self->_isCompact = a3;
  -[SearchUIButtonItemView buttonTitle](self, "buttonTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView setButtonTitle:](self, "setButtonTitle:", v4);

  v5 = -[SearchUIButtonItemView symbolScale](self, "symbolScale");
  -[SearchUIButtonItemView iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSymbolScale:", v5);

  -[SearchUIButtonItemView updateFonts](self, "updateFonts");
  -[SearchUIButtonItemView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (UIFont)defaultButtonFont
{
  void *v2;
  int v3;
  _QWORD *v4;

  v2 = (void *)MEMORY[0x1E0DBD940];
  v3 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");
  v4 = (_QWORD *)MEMORY[0x1E0DC4AB8];
  if (!v3)
    v4 = (_QWORD *)MEMORY[0x1E0DC4B10];
  return (UIFont *)objc_msgSend(v2, "cachedFontForTextStyle:isShort:fontWeight:", *v4, TLKSnippetModernizationEnabled() ^ 1, *MEMORY[0x1E0DC1448]);
}

- (void)setIconFont:(id)a3
{
  objc_storeStrong((id *)&self->_iconFont, a3);
  -[SearchUIButtonItemView updateFonts](self, "updateFonts");
}

- (void)setButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_buttonFont, a3);
  -[SearchUIButtonItemView updateFonts](self, "updateFonts");
}

- (id)resolvedIconFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SearchUIButtonItemView iconFont](self, "iconFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUIButtonItemView buttonFont](self, "buttonFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[SearchUIButtonItemView defaultIconFont](self, "defaultIconFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[SearchUIButtonItemView defaultButtonFont](self, "defaultButtonFont");
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v10;

    }
  }

  return v5;
}

- (id)resolvedButtonFont
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SearchUIButtonItemView buttonFont](self, "buttonFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SearchUIButtonItemView defaultButtonFont](self, "defaultButtonFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)updateFonts
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[SearchUIButtonItemView resolvedButtonFont](self, "resolvedButtonFont");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView resolvedIconFont](self, "resolvedIconFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView iconView](self, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSymbolFont:", v3);

  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v18);

  -[SearchUIButtonItemView horizontalPadding](self, "horizontalPadding");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DBD9B0], "scaledValueForValue:withFont:view:", v18, self);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DBD9B0], "scaledValueForValue:withFont:view:", v18, self, v7);
  v11 = v10;
  -[SearchUIButtonItemView imageViewAndLabelStackView](self, "imageViewAndLabelStackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutMargins:", 0.0, v9, 0.0, v11);

  v13 = (void *)MEMORY[0x1E0DBD9B0];
  -[SearchUIButtonItemView spacingBetweenImageAndText](self, "spacingBetweenImageAndText");
  objc_msgSend(v13, "scaledValueForValue:withFont:view:", v18, self);
  v15 = v14;
  -[SearchUIButtonItemView imageViewAndLabelStackView](self, "imageViewAndLabelStackView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSpacing:", v15);

  -[SearchUIButtonItemView iconBackgroundView](self, "iconBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView iconBackgroundViewSize](self, "iconBackgroundViewSize");
  objc_msgSend(v17, "setLayoutSize:withContentPriority:");

}

- (int64_t)symbolScale
{
  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
    return 2;
  if (-[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
    return 2;
  return 1;
}

- (double)spacingBetweenImageAndText
{
  _BOOL4 v2;
  double result;
  int v4;

  v2 = -[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter");
  result = 2.0;
  if (v2)
  {
    v4 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS", 2.0);
    result = 6.0;
    if (v4)
      return 3.0;
  }
  return result;
}

- (double)cornerRadius
{
  CGRect v3;

  -[SearchUIButtonItemView bounds](self, "bounds");
  return CGRectGetHeight(v3) * 0.5;
}

- (double)minimumIconPadding
{
  _BOOL4 v2;
  double result;

  v2 = -[SearchUIButtonItemView isCompact](self, "isCompact");
  result = 4.0;
  if (v2)
    return 2.0;
  return result;
}

- (CGSize)iconBackgroundViewSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (-[SearchUIButtonItemView isCompact](self, "isCompact"))
  {
    +[SearchUISuggestionImageUtilities maximumSize](SearchUISuggestionImageUtilities, "maximumSize");
    v4 = v3;
  }
  else
  {
    -[SearchUIButtonItemView resolvedIconFont](self, "resolvedIconFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pointSize");
    v4 = v6 * 2.4;

  }
  v7 = v4;
  v8 = v4;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[SearchUIButtonItemView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[SearchUIButtonItemView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[SearchUIButtonItemView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[SearchUIButtonItemView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView tlk_updateForAppearance:](&v30, sel_tlk_updateForAppearance_, v4);
  -[SearchUIButtonItemView buttonAppearance](self, "buttonAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "searchUI_colorGeneratorClass")), "initWithSFColor:", v6);
    v8 = objc_msgSend(v4, "isDark");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__SearchUIButtonItemView_tlk_updateForAppearance___block_invoke;
    v23[3] = &unk_1EA1F6670;
    v23[4] = &v24;
    objc_msgSend(v7, "generateUIColorsIsDark:completionHandler:", v8, v23);

  }
  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
  {
    v9 = v25[5];
    -[SearchUIButtonItemView backgroundView](self, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v9);

  }
  if (-[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
  {
    v11 = v25[5];
    -[SearchUIButtonItemView iconBackgroundView](self, "iconBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v11);

  }
  if ((-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter")
     || -[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
    && !-[SearchUIButtonItemView useHierarchicalColorRendering](self, "useHierarchicalColorRendering"))
  {
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", 0);

    -[SearchUIButtonItemView iconView](self, "iconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setOverrideColor:", 0);

    if (v25[5])
    {
      v19 = +[SearchUIBackgroundColorUtilities backgroundColorPrefersWhiteForegroundText:](SearchUIBackgroundColorUtilities, "backgroundColorPrefersWhiteForegroundText:");
      objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithVibrancyEnabled:isDark:", 1, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIButtonItemView buttonContentBoxView](self, "buttonContentBoxView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "overrideAppearanceForView:", v21);

    }
    else
    {
      v22 = (void *)MEMORY[0x1E0DBD910];
      -[SearchUIButtonItemView buttonContentBoxView](self, "buttonContentBoxView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "disableAppearanceOverrideForView:", v20);
    }

    -[SearchUIButtonItemView updateProminences](self, "updateProminences");
  }
  else
  {
    v13 = v25[5];
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = v25[5];
    -[SearchUIButtonItemView iconView](self, "iconView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setOverrideColor:", v15);

  }
  _Block_object_dispose(&v24, 8);

}

void __50__SearchUIButtonItemView_tlk_updateForAppearance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setButtonAppearance:(id)a3
{
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", self->_buttonAppearance) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonAppearance, a3);
    v5 = -[SearchUIButtonItemView useHierarchicalColorRendering](self, "useHierarchicalColorRendering");
    -[SearchUIButtonItemView backgroundView](self, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseHierarchicalColorRendering:", v5);

    v7 = -[SearchUIButtonItemView useHierarchicalColorRendering](self, "useHierarchicalColorRendering");
    -[SearchUIButtonItemView iconBackgroundView](self, "iconBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUseHierarchicalColorRendering:", v7);

    -[SearchUIButtonItemView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }

}

- (BOOL)useHierarchicalColorRendering
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SearchUIButtonItemView buttonAppearance](self, "buttonAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "renderingMode") == 2;
  else
    v4 = 0;

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView setEnabled:](&v4, sel_setEnabled_, a3);
  -[SearchUIButtonItemView updateProminences](self, "updateProminences");
}

- (void)updateProminences
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[SearchUIButtonItemView buttonAppearance](self, "buttonAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !-[SearchUIButtonItemView isEnabled](self, "isEnabled"))
  {
    v5 = 0;
  }
  else if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
  {
    v5 = 1;
  }
  else if (-[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
  {
    v5 = 1;
  }
  else
  {
    v5 = 2;
  }

  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProminence:", v5);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProminence:", v5);

}

- (BOOL)useContinuousCorners
{
  return 1;
}

- (BOOL)drawsBackgroundPlatter
{
  return 1;
}

- (BOOL)drawsTitle
{
  return 1;
}

- (BOOL)drawsIconBackgroundPlatter
{
  return 0;
}

- (void)setSfImage:(id)a3
{
  -[SearchUIButtonItemView setSfImage:animateTransition:](self, "setSfImage:animateTransition:", a3, 0);
}

- (void)setSfImage:(id)a3 animateTransition:(BOOL)a4
{
  _BOOL4 v4;
  SFImage *v6;
  SFImage *sfImage;
  SFImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFImage *v17;

  v4 = a4;
  v6 = (SFImage *)a3;
  sfImage = self->_sfImage;
  if (sfImage == v6)
    goto LABEL_14;
  self->_sfImage = v6;
  v8 = v6;

  +[SearchUIImage imageWithSFImage:](SearchUIImage, "imageWithSFImage:", v8);
  v17 = (SFImage *)objc_claimAutoreleasedReturnValue();

  if (-[SearchUIButtonItemView allowsAnimation](self, "allowsAnimation"))
  {
    -[SearchUIButtonItemView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "supportsContextMenuConfiguration") && v4 && v17)
    {
      -[SearchUIButtonItemView iconView](self, "iconView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SearchUIButtonItemView transitionIconToSFImage:](self, "transitionIconToSFImage:", v17);
        goto LABEL_10;
      }
    }
    else
    {

    }
  }
  -[SearchUIButtonItemView iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithImage:animateTransition:", v17, 0);

LABEL_10:
  -[SearchUIButtonItemView iconView](self, "iconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", v17 == 0);

  v6 = v17;
  if (v17)
  {
    -[SearchUIButtonItemView window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[SearchUIButtonItemView iconView](self, "iconView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DBD910], "bestAppearanceForView:", self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tlk_updateForAppearance:", v16);

    }
    v6 = v17;
  }
LABEL_14:

}

- (void)setButtonTitle:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_buttonTitle, a3);
  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v8);

  if (objc_msgSend(v8, "length"))
    v6 = -[SearchUIButtonItemView drawsTitle](self, "drawsTitle") ^ 1;
  else
    v6 = 1;
  -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[SearchUIButtonItemView setAccessibilityLabel:](self, "setAccessibilityLabel:", v8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[SearchUIButtonItemView buttonContentBoxView](self, "buttonContentBoxView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveLayoutSizeFittingSize:", width, height);
  v8 = v7;
  v10 = v9;

  -[SearchUIButtonItemView verticalPaddingFontMultipler](self, "verticalPaddingFontMultipler");
  if (v11 != 0.0)
  {
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intrinsicContentSize");
    v14 = v13;
    -[SearchUIButtonItemView verticalPaddingFontMultipler](self, "verticalPaddingFontMultipler");
    v10 = v14 * v15;

  }
  v16 = v8;
  v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  -[SearchUIButtonItemView delegate](self, "delegate", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsContextMenuConfiguration");

  if (v6)
  {
    -[SearchUIButtonItemView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewCommandHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItemView setCommandHandler:](self, "setCommandHandler:", v8);

    -[SearchUIButtonItemView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "customPreviewMenu");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10
      || (v15[0] = MEMORY[0x1E0C809B0],
          v15[1] = 3221225472,
          v15[2] = __80__SearchUIButtonItemView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke,
          v15[3] = &unk_1EA1F6698,
          v15[4] = self,
          objc_msgSend(MEMORY[0x1E0DC36B8], "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v15), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SearchUIButtonItemView commandHandler](self, "commandHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUICollectionPeekDelegate menuConfigurationForCommandHandler:](SearchUICollectionPeekDelegate, "menuConfigurationForCommandHandler:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

id __80__SearchUIButtonItemView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "customPreviewMenu");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double x;
  double y;
  double width;
  double height;
  double v32;
  double v33;
  void *v34;
  void *v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  if (-[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
  {
    -[SearchUIButtonItemView iconBackgroundView](self, "iconBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[SearchUIButtonItemView iconBoxView](self, "iconBoxView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIButtonItemView convertRect:fromView:](self, "convertRect:fromView:", v17, v10, v12, v14, v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", v19, v21, v23, v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
      v27 = 0.0;
    else
      v27 = 5.0;
    -[SearchUIButtonItemView bounds](self, "bounds");
    v38 = CGRectInset(v37, -v27, -v27);
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
    {
      -[SearchUIButtonItemView cornerRadius](self, "cornerRadius");
      v33 = v32;
    }
    else
    {
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v33 = CGRectGetHeight(v39) * 0.1;
    }
    if (-[SearchUIButtonItemView useContinuousCorners](self, "useContinuousCorners"))
      objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithPillRect:cornerRadius:", x, y, width, height, v33);
    else
      objc_msgSend(MEMORY[0x1E0DC3508], "_bezierPathWithArcRoundedRect:cornerRadius:", x, y, width, height, v33);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v26;
  objc_msgSend(v6, "setVisiblePath:", v26);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v6);
  return v35;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[SearchUIButtonItemView commandHandler](self, "commandHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUICollectionPeekDelegate contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:animator:](SearchUICollectionPeekDelegate, "contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:animator:", v7, v6);

}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIButtonItemView;
  v9 = a3;
  -[SearchUIButtonItemView contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v12, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, v9, a4, v8);
  -[SearchUIButtonItemView contextPreviewInteraction](self, "contextPreviewInteraction", v12.receiver, v12.super_class);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[SearchUIButtonItemView commandHandler](self, "commandHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICollectionPeekDelegate contextMenuInteractionWillDisplayMenuForCommandHandler:animator:](SearchUICollectionPeekDelegate, "contextMenuInteractionWillDisplayMenuForCommandHandler:animator:", v11, v8);

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIButtonItemView;
  v9 = a3;
  -[SearchUIButtonItemView contextMenuInteraction:willEndForConfiguration:animator:](&v12, sel_contextMenuInteraction_willEndForConfiguration_animator_, v9, a4, v8);
  -[SearchUIButtonItemView contextPreviewInteraction](self, "contextPreviewInteraction", v12.receiver, v12.super_class);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[SearchUIButtonItemView commandHandler](self, "commandHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICollectionPeekDelegate contextMenuInteractionWillEndForCommandHandler:animator:](SearchUICollectionPeekDelegate, "contextMenuInteractionWillEndForCommandHandler:animator:", v11, v8);

  }
  -[SearchUIButtonItemView setCommandHandler:](self, "setCommandHandler:", 0);

}

- (double)effectiveFirstBaselineOffsetFromTop
{
  double result;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter")
    || -[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIButtonItemView;
    -[SearchUIButtonItemView effectiveFirstBaselineOffsetFromTop](&v7, sel_effectiveFirstBaselineOffsetFromTop);
  }
  else
  {
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveFirstBaselineOffsetFromTop");
    v6 = v5;

    return v6;
  }
  return result;
}

- (double)effectiveBaselineOffsetFromBottom
{
  double result;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter")
    || -[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIButtonItemView;
    -[SearchUIButtonItemView effectiveBaselineOffsetFromBottom](&v7, sel_effectiveBaselineOffsetFromBottom);
  }
  else
  {
    -[SearchUIButtonItemView tlkTitleLabel](self, "tlkTitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectiveBaselineOffsetFromBottom");
    v6 = v5;

    return v6;
  }
  return result;
}

- (id)accessibilityIdentifier
{
  return CFSTR("standard-button");
}

- (double)buttonAnimationOutDelay
{
  void *v2;
  double v3;
  double v4;

  +[SearchUISpringAnimationSettings buttonSelection](_TtC8SearchUI31SearchUISpringAnimationSettings, "buttonSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "perceptualDuration");
  v4 = v3 * 0.5;

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, a3, a4);
  if (-[SearchUIButtonItemView allowsAnimation](self, "allowsAnimation"))
  {
    -[SearchUIButtonItemView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsContextMenuConfiguration");

    if ((v6 & 1) == 0)
    {
      +[SearchUISpringAnimationSettings buttonSelection](_TtC8SearchUI31SearchUISpringAnimationSettings, "buttonSelection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__SearchUIButtonItemView_touchesBegan_withEvent___block_invoke;
      v9[3] = &unk_1EA1F62F0;
      v9[4] = self;
      +[SearchUIAnimator animateWith:animations:completion:](_TtC8SearchUI16SearchUIAnimator, "animateWith:animations:completion:", v7, v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIButtonItemView setSelectionAnimator:](self, "setSelectionAnimator:", v8);

    }
  }
}

uint64_t __49__SearchUIButtonItemView_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.8, 0.8);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, a3, a4);
  if (-[SearchUIButtonItemView allowsAnimation](self, "allowsAnimation"))
  {
    -[SearchUIButtonItemView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsContextMenuConfiguration");

    if ((v6 & 1) == 0)
    {
      +[SearchUISpringAnimationSettings buttonSelectionCancel](_TtC8SearchUI31SearchUISpringAnimationSettings, "buttonSelectionCancel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIButtonItemView buttonAnimationOutDelay](self, "buttonAnimationOutDelay");
      objc_msgSend(v7, "setDelay:");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__SearchUIButtonItemView_touchesCancelled_withEvent___block_invoke;
      v9[3] = &unk_1EA1F62F0;
      v9[4] = self;
      v8 = +[SearchUIAnimator animateWith:animations:completion:](_TtC8SearchUI16SearchUIAnimator, "animateWith:animations:completion:", v7, v9, 0);

    }
  }
}

uint64_t __53__SearchUIButtonItemView_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIButtonItemView;
  -[SearchUIButtonItemView touchesEnded:withEvent:](&v10, sel_touchesEnded_withEvent_, a3, a4);
  if (-[SearchUIButtonItemView allowsAnimation](self, "allowsAnimation"))
  {
    -[SearchUIButtonItemView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "supportsContextMenuConfiguration");

    if ((v6 & 1) == 0)
    {
      +[SearchUISpringAnimationSettings buttonSelection](_TtC8SearchUI31SearchUISpringAnimationSettings, "buttonSelection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIButtonItemView buttonAnimationOutDelay](self, "buttonAnimationOutDelay");
      objc_msgSend(v7, "setDelay:");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__SearchUIButtonItemView_touchesEnded_withEvent___block_invoke;
      v9[3] = &unk_1EA1F62F0;
      v9[4] = self;
      v8 = +[SearchUIAnimator animateWith:animations:completion:](_TtC8SearchUI16SearchUIAnimator, "animateWith:animations:completion:", v7, v9, 0);

    }
  }
}

uint64_t __49__SearchUIButtonItemView_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)transitionIconToSFImage:(id)a3
{
  id v4;
  double v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SearchUIButtonItemView buttonAnimationOutDelay](self, "buttonAnimationOutDelay");
  v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke;
  v8[3] = &unk_1EA1F6210;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

}

void __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "animateIconOutToSFImage:", *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 100000000);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke_2;
  v4[3] = &unk_1EA1F6210;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v4);

}

uint64_t __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animateIconInToSFImage:", *(_QWORD *)(a1 + 40));
}

- (void)animateIconOutToSFImage:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  -[SearchUIButtonItemView transitionIconView](self, "transitionIconView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_opt_new();
    -[SearchUIButtonItemView setTransitionIconView:](self, "setTransitionIconView:", v4);
    objc_msgSend(v4, "setUseButtonColoring:", 1);
    +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v4);
  }
  objc_msgSend(v4, "setHidden:", 0);
  if (-[SearchUIButtonItemView drawsBackgroundPlatter](self, "drawsBackgroundPlatter"))
  {
    v5 = 4;
  }
  else if (-[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"))
  {
    v5 = 4;
  }
  else
  {
    v5 = 6;
  }
  objc_msgSend(v4, "setSymbolWeight:", v5);
  -[SearchUIButtonItemView iconView](self, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithImage:", v7);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v4, "setFrame:");

  objc_msgSend(v4, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 0;
  objc_msgSend(v10, "setOpacity:", v11);

  -[SearchUIButtonItemView transitionIconView](self, "transitionIconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "imageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities applyGaussianBlurToView:withRadius:](SearchUIUtilities, "applyGaussianBlurToView:withRadius:", v13, 6.0);

  -[SearchUIButtonItemView imageViewAndLabelStackView](self, "imageViewAndLabelStackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView transitionIconView](self, "transitionIconView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  +[SearchUIBasicLayerAnimation blurFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "blurFrom:to:", 0.0, 6.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIBasicLayerAnimation opacityFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "opacityFrom:to:", 1.0, 0.0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v17;
  +[SearchUIBasicLayerAnimation scaleFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "scaleFrom:to:", 1.0, 0.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUISpringAnimationSettings buttonSelection](_TtC8SearchUI31SearchUISpringAnimationSettings, "buttonSelection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAnimator animateWithLayer:with:key:animations:delegate:](_TtC8SearchUI16SearchUIAnimator, "animateWithLayer:with:key:animations:delegate:", v22, v20, CFSTR("disappearAnimation"), v19, self);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 0;
  objc_msgSend(v25, "setOpacity:", v26);

}

- (void)animateIconInToSFImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIButtonItemView iconView](self, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setOpacity:", v8);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities applyGaussianBlurToView:withRadius:](SearchUIUtilities, "applyGaussianBlurToView:withRadius:", v10, 0.0);

  -[SearchUIButtonItemView iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithImage:animateTransition:", v4, 0);

  +[SearchUIBasicLayerAnimation blurFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "blurFrom:to:", 6.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIBasicLayerAnimation opacityFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "opacityFrom:to:", 0.0, 1.0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  +[SearchUIBasicLayerAnimation scaleFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "scaleFrom:to:", 0.5, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUISpringAnimationSettings buttonIconAppear](_TtC8SearchUI31SearchUISpringAnimationSettings, "buttonIconAppear");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItemView iconView](self, "iconView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIAnimator animateWithLayer:with:key:animations:delegate:](_TtC8SearchUI16SearchUIAnimator, "animateWithLayer:with:key:animations:delegate:", v19, v16, CFSTR("appearAnimation"), v15, self);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;

  v23 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  -[SearchUIButtonItemView transitionIconView](self, "transitionIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationForKey:", CFSTR("disappearAnimation"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v23)
  {
    -[SearchUIButtonItemView transitionIconView](self, "transitionIconView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);
    goto LABEL_5;
  }
  -[SearchUIButtonItemView iconView](self, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "animationForKey:", CFSTR("appearAnimation"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v23)
  {
    -[SearchUIButtonItemView iconView](self, "iconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllAnimations");

    -[SearchUIButtonItemView iconView](self, "iconView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFilters:", MEMORY[0x1E0C9AA60]);

    -[SearchUIButtonItemView iconView](self, "iconView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1.0;
    objc_msgSend(v21, "setOpacity:", v22);

LABEL_5:
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (SFButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (SFImage)sfImage
{
  return self->_sfImage;
}

- (SearchUIButtonItemViewDelegate)delegate
{
  return (SearchUIButtonItemViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIFont)iconFont
{
  return self->_iconFont;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (BOOL)allowsAnimation
{
  return self->_allowsAnimation;
}

- (void)setAllowsAnimation:(BOOL)a3
{
  self->_allowsAnimation = a3;
}

- (BOOL)shouldAvoidBackgroundView
{
  return self->_shouldAvoidBackgroundView;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (double)verticalPaddingFontMultipler
{
  return self->_verticalPaddingFontMultipler;
}

- (NUIContainerBoxView)buttonContentBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 824, 1);
}

- (void)setButtonContentBoxView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 824);
}

- (SearchUIButtonBackgroundView)backgroundView
{
  return (SearchUIButtonBackgroundView *)objc_getProperty(self, a2, 832, 1);
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 832);
}

- (TLKLabel)tlkTitleLabel
{
  return (TLKLabel *)objc_getProperty(self, a2, 840, 1);
}

- (void)setTlkTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 840);
}

- (SearchUIImageView)iconView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 848, 1);
}

- (void)setIconView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 848);
}

- (SearchUIButtonBackgroundView)iconBackgroundView
{
  return (SearchUIButtonBackgroundView *)objc_getProperty(self, a2, 856, 1);
}

- (void)setIconBackgroundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 856);
}

- (NUIContainerBoxView)iconBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 864, 1);
}

- (void)setIconBoxView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 864);
}

- (SearchUICommandHandler)commandHandler
{
  return (SearchUICommandHandler *)objc_getProperty(self, a2, 872, 1);
}

- (void)setCommandHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 872);
}

- (NUIContainerStackView)imageViewAndLabelStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 880, 1);
}

- (void)setImageViewAndLabelStackView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 880);
}

- (UIContextMenuInteraction)contextPreviewInteraction
{
  return (UIContextMenuInteraction *)objc_getProperty(self, a2, 888, 1);
}

- (void)setContextPreviewInteraction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 888);
}

- (UIViewPropertyAnimator)selectionAnimator
{
  return self->_selectionAnimator;
}

- (void)setSelectionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionAnimator, a3);
}

- (SearchUIImageView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionIconView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_storeStrong((id *)&self->_selectionAnimator, 0);
  objc_storeStrong((id *)&self->_contextPreviewInteraction, 0);
  objc_storeStrong((id *)&self->_imageViewAndLabelStackView, 0);
  objc_storeStrong((id *)&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_iconBoxView, 0);
  objc_storeStrong((id *)&self->_iconBackgroundView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_tlkTitleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_buttonContentBoxView, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_iconFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sfImage, 0);
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
