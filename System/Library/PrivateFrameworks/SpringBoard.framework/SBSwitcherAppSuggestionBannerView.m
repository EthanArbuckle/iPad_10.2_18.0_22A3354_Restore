@implementation SBSwitcherAppSuggestionBannerView

- (SBSwitcherAppSuggestionBannerView)initWithRecipe:(int64_t)a3
{
  return -[SBSwitcherAppSuggestionBannerView initWithFrame:appSuggestion:style:](self, "initWithFrame:appSuggestion:style:", 0, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (SBSwitcherAppSuggestionBannerView)initWithFrame:(CGRect)a3 appSuggestion:(id)a4 style:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBSwitcherAppSuggestionBannerView *v18;
  SBSwitcherAppSuggestionBannerView *v19;
  SBBestAppSuggestion **p_suggestion;
  void *v21;
  void *v22;
  int v24;
  __int128 v25;
  uint64_t v26;
  objc_super v27;
  _QWORD v28[3];
  _QWORD v29[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29[3] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v29[0] = CFSTR("cmdTabLight");
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v15;
  v29[1] = CFSTR("cmdTabLight");
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v16;
  v29[2] = CFSTR("cmdTabDark");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v27.receiver = self;
  v27.super_class = (Class)SBSwitcherAppSuggestionBannerView;
  v18 = -[PLPlatterView initWithRecipeNamesByTraitCollection:inBundle:](&v27, sel_initWithRecipeNamesByTraitCollection_inBundle_, v17, v13);
  v19 = v18;
  if (v18)
  {
    v18->_style = a5;
    p_suggestion = &v18->_suggestion;
    objc_storeStrong((id *)&v18->_suggestion, a4);
    -[PLPlatterView setHasShadow:](v19, "setHasShadow:", 1);
    v24 = 1036831949;
    v25 = xmmword_1D0E892C0;
    v26 = 0x4036800000000000;
    -[PLPlatterView setShadowAttributes:](v19, "setShadowAttributes:", &v24);
    -[SBSwitcherAppSuggestionBannerView setFrame:](v19, "setFrame:", x, y, width, height);
    -[SBSwitcherAppSuggestionBannerView _createAppLabelForSuggestion:](v19, "_createAppLabelForSuggestion:", *p_suggestion);
    -[SBSwitcherAppSuggestionBannerView _createIconViewForSuggestion:](v19, "_createIconViewForSuggestion:", *p_suggestion);
    -[SBSwitcherAppSuggestionBannerView _createDescriptionLabelForSuggestion:](v19, "_createDescriptionLabelForSuggestion:", *p_suggestion);
    -[SBSwitcherAppSuggestionBannerView _createDarkeningView](v19, "_createDarkeningView");
    -[SBSwitcherAppSuggestionBannerView _configureConstraints](v19, "_configureConstraints");
    -[SBSwitcherAppSuggestionBannerView _updateAppearanceForCurrentUserInterfaceStyle](v19, "_updateAppearanceForCurrentUserInterfaceStyle");
    -[SBSwitcherAppSuggestionBannerView _borderView](v19, "_borderView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterView _continuousCornerRadius](v19, "_continuousCornerRadius");
    objc_msgSend(v21, "_setContinuousCornerRadius:");
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderWidth:", 0.3);

  }
  return v19;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[UIView setHidden:](self->_highlightDarkeningView, "setHidden:", !a3);
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (SBBestAppSuggestion)representedAppSuggestion
{
  return self->_suggestion;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  -[SBSwitcherAppSuggestionBannerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[SBSwitcherAppSuggestionBannerView _updateAppearanceForCurrentUserInterfaceStyle](self, "_updateAppearanceForCurrentUserInterfaceStyle");
}

- (void)_updateAppearanceForCurrentUserInterfaceStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  -[SBSwitcherAppSuggestionBannerView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[SBSwitcherAppSuggestionBannerView _borderView](self, "_borderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (v4 == 2)
    v7 = 1.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", v7, 0.08);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v8, "CGColor"));

  -[SBSwitcherAppSuggestionBannerView _updateIconViewImage](self, "_updateIconViewImage");
}

- (id)_textStyle
{
  id v3;
  id v4;

  v3 = (id)*MEMORY[0x1E0CEB548];
  if (-[SBSwitcherAppSuggestionBannerView _isSingleLine](self, "_isSingleLine"))
  {
    v4 = (id)*MEMORY[0x1E0CEB558];

    v3 = v4;
  }
  return v3;
}

- (id)_titleFont
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAppSuggestionBannerView _textStyle](self, "_textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:", v4, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_descriptionFont
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAppSuggestionBannerView _textStyle](self, "_textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isSingleLine
{
  return self->_style == 0;
}

- (void)_configureConstraints
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  -[PLPlatterView customContentView](self, "customContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", self->_appLabel, CFSTR("appLabel"));
  objc_msgSend(v4, "setObject:forKey:", self->_descriptionLabel, CFSTR("descriptionLabel"));
  objc_msgSend(v4, "setObject:forKey:", self->_iconView, CFSTR("iconView"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("contentView"));
  objc_msgSend(v4, "setObject:forKey:", self->_highlightDarkeningView, CFSTR("darkeningView"));
  v29[0] = CFSTR("spaceFromLeftEdge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  v29[1] = CFSTR("iconMargin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v6;
  v29[2] = CFSTR("iconLabelMargin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[contentView]|"), 0, v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[contentView]|"), 0, v8, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[darkeningView]|"), 0, v8, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[darkeningView]|"), 0, v8, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
  -[SBSwitcherAppSuggestionBannerView _titleFont](self, "_titleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSwitcherAppSuggestionBannerView _isSingleLine](self, "_isSingleLine"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 3, 0, self->_appLabel, 11, 1.0, -24.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 3, 0, self->_descriptionLabel, 11, 1.0, -24.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("|-iconMargin-[iconView]-iconLabelMargin-[appLabel][descriptionLabel]-(>=spaceFromLeftEdge)-|");
  }
  else
  {
    objc_msgSend(v14, "_scaledValueForValue:", 18.0);
    v20 = -v19;
    objc_msgSend(v14, "_scaledValueForValue:", 13.0);
    v22 = -v21;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 3, 0, self->_appLabel, 11, 1.0, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_appLabel, 11, 0, self->_descriptionLabel, 11, 1.0, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_appLabel, 5, 0, self->_descriptionLabel, 5, 1.0, 0.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_appLabel, 6, -1, v3, 6, 1.0, -8.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_descriptionLabel, 6, -1, v3, 6, 1.0, -8.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("|-iconMargin-[iconView]-iconLabelMargin-[appLabel]");
  }
  objc_msgSend(v15, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", v18, 0, v8, v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v27);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconView, 10, 0, v3, 10, 1.0, 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v28);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v15);
}

- (void)_createAppLabelForSuggestion:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *appLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[SBSwitcherAppSuggestionBannerView _appTitleForSuggestion:](self, "_appTitleForSuggestion:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEA700]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  appLabel = self->_appLabel;
  self->_appLabel = v5;

  -[UILabel setText:](self->_appLabel, "setText:", v13);
  v7 = self->_appLabel;
  -[SBSwitcherAppSuggestionBannerView _titleFont](self, "_titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7, "setFont:", v8);

  v9 = self->_appLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.75);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v9, "setTextColor:", v11);

  -[UILabel setTextAlignment:](self->_appLabel, "setTextAlignment:", 0);
  -[UILabel setLineBreakMode:](self->_appLabel, "setLineBreakMode:", 5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_appLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PLPlatterView customContentView](self, "customContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_appLabel);

}

- (id)_appTitleForSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v3, "isLocationPredictionOfType:", 0) & 1) != 0
      || objc_msgSend(v3, "isLocationPredictionOfType:", 1))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("LOCATION_DIRECTION_LAUNCH_SUGGESTION_FORMAT");
    }
    else
    {
      if (!objc_msgSend(v3, "isLocationPredictionOfType:", 2))
      {
        objc_msgSend(v6, "displayName");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("LOCATION_RIDE_LAUNCH_SUGGESTION_FORMAT");
    }
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "suggestedLocationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v10, v12, v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!objc_msgSend(v3, "isSiriSuggestion"))
    {
      v14 = &stru_1E8EC7EC0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SIRI"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v14;
}

- (id)_meCardShortName
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_ios_meContactWithKeysToFetch:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 1000);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_firstWakeGreetingString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FIRST_WAKE_SUGGESTION_NONAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_descriptionStringForSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;

  v4 = a3;
  if (objc_msgSend(v4, "isArrivedAtHomePrediction"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("ARRIVED_AT_HOME_SUGGESTION");
LABEL_7:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isArrivedAtWorkPrediction"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("ARRIVED_AT_WORK_SUGGESTION");
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isLocationBasedSuggestion"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("CONTINUITY_LOCATION_BASED_SUGGESTION");
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "isLocationPredictionFromSource:", 0) & 1) != 0
    || objc_msgSend(v4, "isLocationPredictionFromSource:", 1))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originatingBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationWithBundleIdentifier:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v4, "isLocationPredictionFromSource:", 0);
    v16 = CFSTR("LOCATION_COPIED_IN_APP_SUGGESTION_FORMAT");
    if (v15)
      v16 = CFSTR("LOCATION_DONATED_IN_APP_SUGGESTION_FORMAT");
    v17 = (void *)MEMORY[0x1E0CB34D0];
    v18 = v16;
    objc_msgSend(v17, "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v18, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "displayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v20, v22);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isLocallyGeneratedSuggestion") & 1) == 0)
  {
    objc_msgSend(v4, "originatingDeviceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("CONTINUITY_ORIGINATOR_NAME_FORMAT");
LABEL_29:
      objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "originatingDeviceName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", v6, v31);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  if (objc_msgSend(v4, "isPrediction") && objc_msgSend(v4, "isFirstWakePrediction"))
  {
    -[SBSwitcherAppSuggestionBannerView _firstWakeGreetingString](self, "_firstWakeGreetingString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isPrediction") && objc_msgSend(v4, "isCarPlayPrediction"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("CARPLAY_CONNECTED_SUGGESTION");
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isPrediction"))
    {
      objc_msgSend(v4, "originatingDeviceName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = CFSTR("DEVICE_CONNECTED_SUGGESTION_NAME_FORMAT");
        goto LABEL_29;
      }
    }
    if (objc_msgSend(v4, "isPrediction") && objc_msgSend(v4, "isHeadphonesPrediction"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("HEADPHONES_CONNECTED_SUGGESTION");
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isPrediction") && objc_msgSend(v4, "isBluetoothPrediction"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("BLUETOOTH_DEVICE_CONNECTED_SUGGESTION");
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isPrediction"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("GENERIC_DEVICE_CONNECTED_SUGGESTION");
      goto LABEL_7;
    }
    v8 = &stru_1E8EC7EC0;
  }
LABEL_9:
  if (-[SBSwitcherAppSuggestionBannerView _isSingleLine](self, "_isSingleLine"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SINGLE_LINE_SUGGESTION_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v11;
  }

  return v8;
}

- (void)_createDescriptionLabelForSuggestion:(id)a3
{
  id v4;
  UILabel *v5;
  UILabel *descriptionLabel;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[SBSwitcherAppSuggestionBannerView _descriptionStringForSuggestion:](self, "_descriptionStringForSuggestion:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEA700]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v5;

  -[UILabel setText:](self->_descriptionLabel, "setText:", v13);
  v7 = self->_descriptionLabel;
  -[SBSwitcherAppSuggestionBannerView _descriptionFont](self, "_descriptionFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7, "setFont:", v8);

  v9 = self->_descriptionLabel;
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.75);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v9, "setTextColor:", v11);

  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 0);
  -[UILabel setLineBreakMode:](self->_descriptionLabel, "setLineBreakMode:", 5);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PLPlatterView customContentView](self, "customContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_descriptionLabel);

}

- (id)_iconImageFromAppWithBundleIdentifier:(id)a3 withIconImageCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Siri")))
  {
    objc_msgSend(v8, "notificationIconImageCache");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v7)
      v10 = CFSTR("siri-suggestion-landscape");
    else
      v10 = CFSTR("siri-suggestion");
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.75);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "applicationIconForBundleIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSwitcherAppSuggestionBannerView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageForIcon:compatibleWithTraitCollection:options:", v11, v12, 2);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v13;

  return v15;
}

- (id)_iconImageViewFromAppWithBundleIdentifier:(id)a3 withIconImageCache:(id)a4
{
  void *v4;
  void *v5;

  -[SBSwitcherAppSuggestionBannerView _iconImageFromAppWithBundleIdentifier:withIconImageCache:](self, "_iconImageFromAppWithBundleIdentifier:withIconImageCache:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);

  return v5;
}

- (id)_iconImageCache
{
  void *v3;
  void *v4;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBSwitcherAppSuggestionBannerView _isSingleLine](self, "_isSingleLine"))
    objc_msgSend(v3, "notificationIconImageCache");
  else
    objc_msgSend(v3, "tableUIIconImageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_createIconViewForSuggestion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIImageView *iconView;
  UIImageView *v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isSiriSuggestion") & 1) != 0
    || (objc_msgSend(v4, "bundleIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v6))
  {
    -[SBSwitcherAppSuggestionBannerView _iconImageCache](self, "_iconImageCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherAppSuggestionBannerView _iconImageViewFromAppWithBundleIdentifier:withIconImageCache:](self, "_iconImageViewFromAppWithBundleIdentifier:withIconImageCache:", v8, v7);
    v9 = (UIImageView *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "iconImageInfo");
    -[UIImageView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:", v10);
    -[UIImageView layer](v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMasksToBounds:", 1);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBSwitcherAppSuggestionBannerView _isSingleLine](self, "_isSingleLine");
    -[UIImageView setBounds:](v9, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 24.0, 24.0);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 8, 0, 0, 0, 1.0, 24.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 7, 0, 0, 0, 1.0, 24.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView addConstraints:](v9, "addConstraints:", v14);
    iconView = self->_iconView;
    self->_iconView = v9;
    v16 = v9;

    -[PLPlatterView customContentView](self, "customContentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_iconView);

  }
}

- (void)_updateIconViewImage
{
  void *v3;
  void *v4;
  id v5;

  -[SBSwitcherAppSuggestionBannerView _iconImageCache](self, "_iconImageCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBBestAppSuggestion bundleIdentifier](self->_suggestion, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSwitcherAppSuggestionBannerView _iconImageFromAppWithBundleIdentifier:withIconImageCache:](self, "_iconImageFromAppWithBundleIdentifier:withIconImageCache:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_iconView, "setImage:", v4);

}

- (void)_createDarkeningView
{
  id v3;
  UIView *v4;
  UIView *highlightDarkeningView;
  UIView *v6;
  void *v7;
  UIView *v8;

  v3 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[SBSwitcherAppSuggestionBannerView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  highlightDarkeningView = self->_highlightDarkeningView;
  self->_highlightDarkeningView = v4;

  v6 = self->_highlightDarkeningView;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UIView setUserInteractionEnabled:](self->_highlightDarkeningView, "setUserInteractionEnabled:", 0);
  -[UIView setHidden:](self->_highlightDarkeningView, "setHidden:", 1);
  v8 = self->_highlightDarkeningView;
  -[PLPlatterView _continuousCornerRadius](self, "_continuousCornerRadius");
  -[UIView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:");
  -[SBSwitcherAppSuggestionBannerView addSubview:](self, "addSubview:", self->_highlightDarkeningView);
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDarkeningView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_appLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
