@implementation SBFlashlightElement

- (SBFlashlightElement)initWithStyle:(unint64_t)a3 state:(unint64_t)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SBFlashlightElement *v17;
  SBFlashlightElement *v18;
  void *v19;
  double v20;
  double v21;
  objc_super v23;

  v7 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  v8 = objc_alloc(MEMORY[0x1E0DAC6A0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithPackageName:inBundle:", CFSTR("Flashlight-Leading-D83"), v9);

  objc_msgSend(v10, "setIntrinsicPackageSize:", 36.6666667, 36.6666667);
  v11 = CFSTR("OFF");
  if (a4 == 1)
    v11 = CFSTR("ON");
  if (a4 == 2)
    v12 = CFSTR("unavailable");
  else
    v12 = v11;
  objc_msgSend(v10, "setState:animated:", v12, 0);
  objc_msgSend(v7, "setLeadingContentViewProvider:", v10);
  objc_storeStrong((id *)&self->_leadingPackageViewProvider, v10);
  v13 = objc_alloc(MEMORY[0x1E0DAC6E8]);
  -[SBFlashlightElement _trailingTextForState:](self, "_trailingTextForState:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithText:style:", v14, 4);

  -[SBFlashlightElement _textColorForState:](self, "_textColorForState:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentColor:", v16);

  objc_msgSend(v7, "setTrailingContentViewProvider:", v15);
  objc_storeStrong((id *)&self->_trailingTextProvider, v15);
  self->_style = a3;
  self->_state = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBFlashlightElement;
  v17 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:](&v23, sel_initWithIdentifier_contentProvider_, self, v7);
  v18 = v17;
  if (v17)
  {
    -[SBSystemApertureProvidedContentElement setMinimumSupportedLayoutMode:](v17, "setMinimumSupportedLayoutMode:", 1);
    -[SBSystemApertureProvidedContentElement setMaximumSupportedLayoutMode:](v18, "setMaximumSupportedLayoutMode:", 3);
    -[SBSystemApertureProvidedContentElement setPreferredLayoutMode:](v18, "setPreferredLayoutMode:", 2);
    objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sensorRegionSize");
    v18->_sensorObstructionHeight = v20;
    objc_msgSend(v19, "minimumExpandedSize");
    v18->_expandedHeight = v21;

  }
  return v18;
}

- (void)setState:(unint64_t)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = CFSTR("OFF");
    if (a3 == 1)
      v5 = CFSTR("ON");
    if (a3 == 2)
      v5 = CFSTR("unavailable");
    v6 = v5;
    -[SBFlashlightElement leadingPackageViewProvider](self, "leadingPackageViewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setState:animated:", v6, 1);

    -[SBFlashlightElement expandedLeadingPackageButton](self, "expandedLeadingPackageButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setState:animated:", v6, 1);

    -[SBFlashlightElement trailingTextProvider](self, "trailingTextProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFlashlightElement _trailingTextForState:](self, "_trailingTextForState:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFlashlightElement _textColorForState:](self, "_textColorForState:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "swapInText:textColor:", v10, v11);
    -[SBFlashlightElement expandedTrailingLabel](self, "expandedTrailingLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v10);
    objc_msgSend(v12, "setTextColor:", v11);
    if (-[SBSystemApertureProvidedContentElement layoutMode](self, "layoutMode") == 3)
    {
      objc_msgSend(v12, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[SBFlashlightElement layoutHostContainerViewDidLayoutSubviews:](self, "layoutHostContainerViewDidLayoutSubviews:", v13);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("SBSystemApertureNotificationUserInfoElementKey");
    v17[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0, v15);

  }
}

- (NSString)elementIdentifier
{
  if (self->_style)
    return (NSString *)CFSTR("Flashlight Unavailable");
  else
    return (NSString *)CFSTR("Flashlight");
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  SBUISystemApertureCAPackageContentProvider *leadingPackageViewProvider;
  id v5;
  id v6;

  leadingPackageViewProvider = self->_leadingPackageViewProvider;
  v5 = a3;
  -[SBUISystemApertureCAPackageContentProvider providedView](leadingPackageViewProvider, "providedView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  CGFloat top;
  CGFloat trailing;
  CGFloat leading;
  void *v9;
  double v10;
  CGFloat bottom;
  double v12;
  double v13;

  top = result.top;
  if (a3 == 3)
  {
    trailing = a5.trailing;
    leading = a5.leading;
    -[SBSystemApertureProvidedContentElement layoutHost](self, "layoutHost", result.top, result.leading, result.bottom, result.trailing, a5.top, a5.leading, a5.bottom);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "edgeOutsetsForSize:", 1.79769313e308, self->_expandedHeight);
    bottom = v10;

    result.leading = leading;
    result.trailing = trailing;
  }
  else
  {
    bottom = result.bottom;
  }
  v12 = top;
  v13 = bottom;
  result.bottom = v13;
  result.top = v12;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CGFloat rect;
  double rect_16;
  CGFloat v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v44 = a3;
  v4 = -[SBSystemApertureProvidedContentElement layoutMode](self, "layoutMode");
  -[SBFlashlightElement expandedLeadingPackageButton](self, "expandedLeadingPackageButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 1.0;
  if (v4 == 3)
  {
    objc_msgSend(v5, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v44, "effectiveUserInterfaceLayoutDirection");
      objc_msgSend(v44, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v44, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayScale");

      -[SBFlashlightElement expandedLeadingPackageButton](self, "expandedLeadingPackageButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "intrinsicContentSize");
      v21 = v20;

      v45.origin.x = v11;
      v43 = v13;
      v45.origin.y = v13;
      v45.size.width = v15;
      v45.size.height = v17;
      CGRectGetHeight(v45);
      UIRoundToScale();
      v23 = v22;
      if (v9 == 1)
      {
        v46.origin.x = v11;
        v46.size.width = v15;
        v46.origin.y = v13;
        v46.size.height = v17;
        CGRectGetWidth(v46);
      }
      BSPointRoundForScale();
      objc_msgSend(v6, "setFrame:");
      -[SBFlashlightElement expandedTrailingLabel](self, "expandedTrailingLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v23 + v21 + v23;
      v47.origin.x = v11;
      v47.origin.y = v13;
      v47.size.width = v15;
      v47.size.height = v17;
      CGRectGetHeight(v47);
      v26 = v11;
      objc_msgSend(v24, "font");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lineHeight");
      UIFloorToScale();
      v29 = v28;

      v48.origin.x = v11;
      v48.origin.y = v13;
      v48.size.width = v15;
      v48.size.height = v17;
      rect_16 = v25;
      v30 = CGRectGetWidth(v48) - v23 - v29 - v25;
      rect = v26;
      v49.origin.x = v26;
      v49.origin.y = v13;
      v49.size.width = v15;
      v49.size.height = v17;
      v31 = CGRectGetHeight(v49) - self->_sensorObstructionHeight + -12.0;
      objc_msgSend(v24, "sizeThatFits:", v30, v31);
      BSSizeCeilForScale();
      if (v30 - v32 <= 0.0)
        v33 = v30;
      else
        v33 = v32;
      v7 = 0.0;
      if (v30 - v32 <= 0.0)
        v34 = 0.0;
      else
        v34 = v30 - v32;
      if (v9 != 1)
      {
        v50.origin.x = rect;
        v50.size.width = v15;
        v50.origin.y = v43;
        v50.size.height = v17;
        v29 = CGRectGetWidth(v50) - v33 - v29;
      }
      -[SBFlashlightElement _layoutHuggingObstructionForLabel:x:width:maxLabelHeight:](self, "_layoutHuggingObstructionForLabel:x:width:maxLabelHeight:", v24, v29, v33, v31);
      -[SBFlashlightElement expandedTitleLabel](self, "expandedTitleLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v23 + v33 + v29;
      if (v9 != 1)
        v36 = rect_16;
      -[SBFlashlightElement _layoutHuggingObstructionForLabel:x:width:maxLabelHeight:](self, "_layoutHuggingObstructionForLabel:x:width:maxLabelHeight:", v35, v36, v34, v31);

    }
    else
    {
      v7 = 0.0;
    }
  }
  -[SBFlashlightElement leadingPackageViewProvider](self, "leadingPackageViewProvider");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "providedView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAlpha:", v7);

  -[SBFlashlightElement trailingTextProvider](self, "trailingTextProvider");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "providedView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAlpha:", v7);

}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  if (-[SBSystemApertureProvidedContentElement layoutMode](self, "layoutMode") == 3)
  {
    -[SBFlashlightElement _configureCustomViewsIfNecessary](self, "_configureCustomViewsIfNecessary");
    -[SBFlashlightElement expandedLeadingPackageButton](self, "expandedLeadingPackageButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v11);

    -[SBFlashlightElement expandedTitleLabel](self, "expandedTitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v12);

    -[SBFlashlightElement expandedTrailingLabel](self, "expandedTrailingLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v13);

  }
  v14.receiver = self;
  v14.super_class = (Class)SBFlashlightElement;
  -[SBSystemApertureProvidedContentElement contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:](&v14, sel_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator_, v9, v10, width, height);

}

- (UIColor)keyColor
{
  return (UIColor *)-[SBFlashlightElement _textColorForState:](self, "_textColorForState:", self->_state);
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  SBUISystemApertureCAPackageContentProvider *leadingPackageViewProvider;
  id v5;
  id v6;

  leadingPackageViewProvider = self->_leadingPackageViewProvider;
  v5 = a3;
  -[SBUISystemApertureCAPackageContentProvider providedView](leadingPackageViewProvider, "providedView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0.0;
}

- (id)_trailingTextForState:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("FLASHLIGHT_ON");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("FLASHLIGHT_OFF");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_textColorForState:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      goto LABEL_4;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.835294118, 0.823529412, 1.0, 1.0);
      self = (SBFlashlightElement *)objc_claimAutoreleasedReturnValue();
      return self;
    case 0uLL:
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CEA478], "sbui_inactiveColor");
      self = (SBFlashlightElement *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return self;
}

- (id)_titleTextForStyle:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FLASHLIGHT_UNAVAILABLE_TITLE");
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FLASHLIGHT_TITLE");
LABEL_5:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_titleColorForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "sbui_inactiveColor");
    self = (SBFlashlightElement *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    self = (SBFlashlightElement *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (void)_configureCustomViewsIfNecessary
{
  SBUISystemApertureCAPackageButton **p_expandedLeadingPackageButton;
  unint64_t state;
  unint64_t style;
  id v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  UILabel *expandedTrailingLabel;
  _QWORD v31[4];
  id v32;
  id location;

  p_expandedLeadingPackageButton = &self->_expandedLeadingPackageButton;
  if (!self->_expandedLeadingPackageButton)
  {
    state = self->_state;
    style = self->_style;
    v6 = objc_alloc(MEMORY[0x1E0DAC6A0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithPackageName:inBundle:", CFSTR("Flashlight-Leading-Expanded-D83"), v7);

    objc_msgSend(v8, "setIntrinsicPackageSize:", 73.3333333, 73.3333333);
    objc_initWeak(&location, self);
    v9 = objc_alloc(MEMORY[0x1E0DAC698]);
    v10 = CFSTR("OFF");
    if (state == 1)
      v10 = CFSTR("ON");
    if (state == 2)
      v10 = CFSTR("unavailable");
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0CEA2A8];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __55__SBFlashlightElement__configureCustomViewsIfNecessary__block_invoke;
    v31[3] = &unk_1E8EA3C88;
    objc_copyWeak(&v32, &location);
    objc_msgSend(v12, "actionWithHandler:", v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v9, "initWithPackageProvider:state:primaryAction:", v8, v11, v13);

    objc_storeStrong((id *)p_expandedLeadingPackageButton, v14);
    v15 = (void *)MEMORY[0x1E0CEAB40];
    SBUISystemApertureDefaultContentSizeCategory();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "traitCollectionWithPreferredContentSizeCategory:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0CEA700]);
    v20 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v24 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], v21, v22, v23);
    -[SBFlashlightElement _titleTextForStyle:](self, "_titleTextForStyle:", style);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v25);

    -[SBFlashlightElement _titleColorForStyle:](self, "_titleColorForStyle:", style);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v26);

    objc_msgSend(v24, "setFont:", v18);
    objc_storeStrong((id *)&self->_expandedTitleLabel, v24);
    v27 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v20, v21, v22, v23);
    -[SBFlashlightElement _trailingTextForState:](self, "_trailingTextForState:", state);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v27, "setText:", v28);

    -[SBFlashlightElement _textColorForState:](self, "_textColorForState:", state);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v27, "setTextColor:", v29);

    -[UILabel setFont:](v27, "setFont:", v18);
    expandedTrailingLabel = self->_expandedTrailingLabel;
    self->_expandedTrailingLabel = v27;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

void __55__SBFlashlightElement__configureCustomViewsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleExpandedLeadingButtonAction");

}

- (void)_layoutHuggingObstructionForLabel:(id)a3 x:(double)a4 width:(double)a5 maxLabelHeight:(double)a6
{
  double v9;
  void *v10;
  id v11;

  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = a3;
  objc_msgSend(v11, "setFrame:", a4, v9, a5, a6);
  objc_msgSend(v11, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");

  objc_msgSend(v11, "_tightBoundingRectOfFirstLine");
  UICeilToScale();
  BSRectRoundForScale();
  objc_msgSend(v11, "setFrame:");

}

- (SBUISystemApertureCAPackageContentProvider)leadingPackageViewProvider
{
  return self->_leadingPackageViewProvider;
}

- (SBUISystemApertureTextContentProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (SBUISystemApertureCAPackageButton)expandedLeadingPackageButton
{
  return self->_expandedLeadingPackageButton;
}

- (UILabel)expandedTitleLabel
{
  return self->_expandedTitleLabel;
}

- (UILabel)expandedTrailingLabel
{
  return self->_expandedTrailingLabel;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedTrailingLabel, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabel, 0);
  objc_storeStrong((id *)&self->_expandedLeadingPackageButton, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingPackageViewProvider, 0);
}

@end
