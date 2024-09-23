@implementation PSCapacityBarCell

+ (id)specifierWithTitle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E4A69238, 0, 0, 0, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", objc_opt_class(), CFSTR("cellClass"));
  objc_msgSend(v4, "setProperty:forKey:", v3, CFSTR("label"));

  return v4;
}

+ (id)specifierWithTitle:(id)a3 useStandardFontSizeForSizeLabel:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend(a1, "specifierWithTitle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", v6, CFSTR("psCapBarSizeLblUsesStandardFont"));

  return v5;
}

- (PSCapacityBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSCapacityBarCell *v4;
  PSCapacityBarCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSCapacityBarCell;
  v4 = -[PSCapacityBarCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[PSCapacityBarCell initializeViews](v4, "initializeViews");
  return v5;
}

- (PSCapacityBarCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSCapacityBarCell *v9;
  PSCapacityBarCell *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PSCapacityBarCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[PSCapacityBarCell initializeViews](v9, "initializeViews");
    -[PSCapacityBarCell refreshCellContentsWithSpecifier:](v10, "refreshCellContentsWithSpecifier:", v8);
  }

  return v10;
}

- (void)initializeViews
{
  void *v3;
  void *v4;
  void *v5;
  UIFont *v6;
  UIFont *bigFont;
  void *v8;
  UIFont *v9;
  UIFont *legendFont;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UILabel *v16;
  UILabel *titleLabel;
  double v18;
  UILabel *v19;
  UILabel *sizeLabel;
  double v21;
  PSCapacityBarView *v22;
  PSCapacityBarView *barView;
  UIStackView *v24;
  UIStackView *legendView;
  double v26;
  UILabel *v27;
  UILabel *loadingLabel;
  PSCapacityBarLegendView *v29;
  PSCapacityBarLegendView *otherLegend;
  id WeakRetained;
  void *v32;
  UILabel *v33;
  UIStackView *v34;
  void *v35;
  objc_super v36;
  objc_super v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)PSCapacityBarCell;
  -[PSTableCell titleLabel](&v37, sel_titleLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  v36.receiver = self;
  v36.super_class = (Class)PSCapacityBarCell;
  -[PSTableCell titleLabel](&v36, sel_titleLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[PSCapacityBarCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bigFont = self->_bigFont;
  self->_bigFont = v6;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
  v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
  legendFont = self->_legendFont;
  self->_legendFont = v9;

  v11 = objc_alloc(MEMORY[0x1E0CEA700]);
  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], v13, v14, v15);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  -[UILabel setFont:](self->_titleLabel, "setFont:", self->_bigFont);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("Title"));
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 4);
  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v18) = 1132068864;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v18);
  objc_msgSend(v5, "addSubview:", self->_titleLabel);
  v19 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v12, v13, v14, v15);
  sizeLabel = self->_sizeLabel;
  self->_sizeLabel = v19;

  -[UILabel setFont:](self->_sizeLabel, "setFont:", v8);
  -[UILabel setEnabled:](self->_sizeLabel, "setEnabled:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_sizeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_sizeLabel, "setAccessibilityIdentifier:", CFSTR("Size"));
  -[UILabel setNumberOfLines:](self->_sizeLabel, "setNumberOfLines:", 1);
  -[UILabel setLineBreakMode:](self->_sizeLabel, "setLineBreakMode:", 4);
  -[UILabel setAllowsDefaultTighteningForTruncation:](self->_sizeLabel, "setAllowsDefaultTighteningForTruncation:", 1);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_sizeLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_sizeLabel, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v21) = 1144750080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_sizeLabel, "setContentHuggingPriority:forAxis:", 0, v21);
  objc_msgSend(v5, "addSubview:", self->_sizeLabel);
  v22 = -[PSCapacityBarView initWithFrame:]([PSCapacityBarView alloc], "initWithFrame:", v12, v13, v14, v15);
  barView = self->_barView;
  self->_barView = v22;

  -[PSCapacityBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_barView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PSCapacityBarView setAccessibilityIdentifier:](self->_barView, "setAccessibilityIdentifier:", CFSTR("CategoryBar"));
  objc_msgSend(v5, "addSubview:", self->_barView);
  v24 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v12, v13, v14, v15);
  legendView = self->_legendView;
  self->_legendView = v24;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_legendView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAccessibilityIdentifier:](self->_legendView, "setAccessibilityIdentifier:", CFSTR("Legend"));
  LODWORD(v26) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_legendView, "setContentHuggingPriority:forAxis:", 1, v26);
  objc_msgSend(v5, "addSubview:", self->_legendView);
  v27 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v12, v13, v14, v15);
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v27;

  -[UILabel setFont:](self->_loadingLabel, "setFont:", self->_legendFont);
  -[UILabel setEnabled:](self->_loadingLabel, "setEnabled:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_loadingLabel, "setAccessibilityIdentifier:", CFSTR("Calculating"));
  -[UILabel setNumberOfLines:](self->_loadingLabel, "setNumberOfLines:", 1);
  -[UILabel setLineBreakMode:](self->_loadingLabel, "setLineBreakMode:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_loadingLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v29 = -[PSCapacityBarLegendView initWithCapacityBarCategory:]([PSCapacityBarLegendView alloc], "initWithCapacityBarCategory:", 0);
  otherLegend = self->_otherLegend;
  self->_otherLegend = v29;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._specifier);
  objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("psCapBarHideLegend"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hideLegend = objc_msgSend(v32, "BOOLValue");

  v33 = self->_sizeLabel;
  v38[0] = self->_titleLabel;
  v38[1] = v33;
  v34 = self->_legendView;
  v38[2] = self->_barView;
  v38[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityElements:", v35);

  -[PSCapacityBarCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSCapacityBarCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)createNormalConstraints
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *normalConstraints;
  id v11;

  -[PSCapacityBarCell contentView](self, "contentView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 5, 0, v11, 5, 1.0, 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 6, 0, self->_sizeLabel, 5, 1.0, -12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 6, 0, v11, 6, 1.0, -15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 3, 0, v11, 3, 1.0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 12, 0, self->_titleLabel, 12, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_barView, 3, 0, self->_titleLabel, 4, 1.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  normalConstraints = self->_normalConstraints;
  self->_normalConstraints = v3;

}

- (void)createLargeConstraints
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *largeConstraints;
  id v14;

  -[PSCapacityBarCell contentView](self, "contentView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 9);
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 5, 0, v14, 5, 1.0, 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 6, -1, v14, 6, 1.0, -15.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 5, 0, v14, 5, 1.0, 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 6, -1, v14, 6, 1.0, -15.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_titleLabel, 3, 0, v14, 3, 1.0, 10.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 1, self->_titleLabel, 4, 1.0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_sizeLabel, 3, 0, self->_titleLabel, 4, 1.0, 4.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 1, self->_sizeLabel, 4, 1.0, 10.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_barView, 3, 0, self->_sizeLabel, 4, 1.0, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  largeConstraints = self->_largeConstraints;
  self->_largeConstraints = v3;

}

- (void)createCommonConstraints
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *barHeightConstraint;
  NSMutableArray *commonConstraints;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *legendConstraints;
  id v17;

  -[PSCapacityBarCell contentView](self, "contentView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_barView, 5, 0, v17, 5, 1.0, 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_barView, 6, 0, v17, 6, 1.0, -12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 1, self->_barView, 4, 1.0, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_barView, 8, 1, 0, 0, 0.0, 16.0);
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  barHeightConstraint = self->_barHeightConstraint;
  self->_barHeightConstraint = v7;

  -[NSMutableArray addObject:](v3, "addObject:", self->_barHeightConstraint);
  commonConstraints = self->_commonConstraints;
  self->_commonConstraints = v3;
  v10 = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendView, 5, 0, v17, 5, 1.0, 15.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendView, 6, -1, v17, 6, 1.0, -15.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_legendView, 3, 0, self->_barView, 4, 1.0, 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 1, self->_legendView, 4, 1.0, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v11, "addObject:", v15);

  legendConstraints = self->_legendConstraints;
  self->_legendConstraints = v11;

}

- (void)addVerticalLegends
{
  double v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[UIStackView setAxis:](self->_legendView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_legendView, "setAlignment:", 1);
  -[UIFont leading](self->_legendFont, "leading");
  -[UIStackView setSpacing:](self->_legendView, "setSpacing:", v3 * 1.5);
  v4 = self->_legends;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (*(PSCapacityBarLegendView **)(*((_QWORD *)&v9 + 1) + 8 * i) != self->_otherLegend)
          -[UIStackView addArrangedSubview:](self->_legendView, "addArrangedSubview:");
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (self->_showOtherLegend && -[NSArray containsObject:](v4, "containsObject:", self->_otherLegend))
    -[UIStackView addArrangedSubview:](self->_legendView, "addArrangedSubview:", self->_otherLegend);

}

- (void)addHorizontalLegends
{
  NSArray *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  PSCapacityBarLegendView *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIStackView setAxis:](self->_legendView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_legendView, "setAlignment:", 4);
  -[UIStackView setSpacing:](self->_legendView, "setSpacing:", 12.0);
  v3 = self->_legends;
  -[PSCapacityBarLegendView layoutIfNeeded](self->_otherLegend, "layoutIfNeeded");
  -[PSCapacityBarCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5 + -30.0;

  if (self->_showOtherLegend)
  {
    -[PSCapacityBarLegendView frame](self->_otherLegend, "frame");
    v6 = v6 - v7;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v3;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(PSCapacityBarLegendView **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v13 != self->_otherLegend)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "layoutIfNeeded", (_QWORD)v15);
          -[PSCapacityBarLegendView frame](v13, "frame");
          v6 = v6 - (v14 + 12.0);
          if (v6 < 0.0)
            goto LABEL_13;
          -[UIStackView addArrangedSubview:](self->_legendView, "addArrangedSubview:", v13);
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
LABEL_13:

  if (self->_showOtherLegend && -[NSArray containsObject:](v8, "containsObject:", self->_otherLegend))
    -[UIStackView addArrangedSubview:](self->_legendView, "addArrangedSubview:", self->_otherLegend);

}

- (void)updateConstraints
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  NSMutableArray **p_largeConstraints;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PSCapacityBarCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    p_largeConstraints = &self->_largeConstraints;
    if (!self->_largeConstraints)
      -[PSCapacityBarCell createLargeConstraints](self, "createLargeConstraints");
    v7 = 0;
    v8 = 0;
    if (!self->_normalConstraints)
      goto LABEL_10;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:");
    v8 = v7;
    goto LABEL_10;
  }
  p_largeConstraints = &self->_normalConstraints;
  if (!self->_normalConstraints)
    -[PSCapacityBarCell createNormalConstraints](self, "createNormalConstraints");
  v7 = 2;
  v8 = 2;
  if (self->_largeConstraints)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", *p_largeConstraints);
  -[UILabel setTextAlignment:](self->_sizeLabel, "setTextAlignment:", v8);
  if (!self->_commonConstraints)
  {
    -[PSCapacityBarCell createCommonConstraints](self, "createCommonConstraints");
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_commonConstraints);
  }
  -[UILabel font](self->_titleLabel, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lineHeight");
  v11 = v10;

  v12 = 16.0;
  if (v11 >= 16.0)
  {
    v12 = v11;
    if (v11 > 32.0)
      v12 = 32.0;
  }
  -[NSLayoutConstraint setConstant:](self->_barHeightConstraint, "setConstant:", v12);
  if (self->_hideLegend)
  {
    -[UIStackView setHidden:](self->_legendView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_legendConstraints);
    -[UIStackView subviews](self->_legendView, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "removeFromSuperview");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v15);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_legendConstraints);
    -[UIStackView subviews](self->_legendView, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "removeFromSuperview");
        }
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }
    if (IsAccessibilityCategory)
      -[PSCapacityBarCell addVerticalLegends](self, "addVerticalLegends");
    else
      -[PSCapacityBarCell addHorizontalLegends](self, "addHorizontalLegends");
    -[UIStackView setHidden:](self->_legendView, "setHidden:", 0);
  }

  v22.receiver = self;
  v22.super_class = (Class)PSCapacityBarCell;
  -[PSCapacityBarCell updateConstraints](&v22, sel_updateConstraints);
}

- (void)createLegends:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *legends;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  PSCapacityBarLegendView *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "orderedCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") && !self->_forceLoading)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count") + 1);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "bytes"))
          {
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("_CAT_OTHER_"));

            if ((v15 & 1) == 0)
            {
              v16 = -[PSCapacityBarLegendView initWithCapacityBarCategory:]([PSCapacityBarLegendView alloc], "initWithCapacityBarCategory:", v13);
              -[PSCapacityBarLegendView setTextColor:](v16, "setTextColor:", self->_legendTextColor);
              -[NSArray addObject:](v7, "addObject:", v16);

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    if (self->_showOtherLegend)
    {
      -[PSCapacityBarLegendView setTextColor:](self->_otherLegend, "setTextColor:", self->_legendTextColor);
      -[NSArray addObject:](v7, "addObject:", self->_otherLegend);
    }
    legends = self->_legends;
    self->_legends = v7;
    v4 = v17;
  }
  else
  {
    v23[0] = self->_loadingLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    legends = self->_legends;
    self->_legends = v5;
  }

}

- (id)usageString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "capacity"))
  {
    v5 = objc_msgSend(v4, "bytesUsed");
    v6 = 1000;
    if (self->_sizesAreMem)
      v6 = 1024;
    v7 = 0x40000000;
    if (!self->_sizesAreMem)
      v7 = 1000000000;
    if (v7 < v5)
    {
      v8 = (double)v5 / (double)v7;
      v9 = (double)v6;
      while (v8 > v9)
      {
        v8 = v8 / v9;
        v7 *= v6;
      }
    }
    NSLocalizedFileSizeDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLocalizedFileSizeDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", self->_sizeFormat, v11, v12);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_1E4A69238;
  }

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PSCapacityBarLegendView **p_otherLegend;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UILabel **p_titleLabel;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  objc_super v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PSCapacityBarCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v37, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarLoading"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UILabel setText:](self->_loadingLabel, "setText:", v5);
  }
  else
  {
    PSStorageLocStr(CFSTR("CALC_BAR_LOADING"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_loadingLabel, "setText:", v6);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarOtherDataLegendText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    p_otherLegend = &self->_otherLegend;
    -[PSCapacityBarLegendView setText:](self->_otherLegend, "setText:", v7);
  }
  else
  {
    PSStorageLocStr(CFSTR("OTHER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    p_otherLegend = &self->_otherLegend;
    -[PSCapacityBarLegendView setText:](self->_otherLegend, "setText:", v9);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarSizesAreMem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sizesAreMem = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarSizeFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    PSStorageLocStr(CFSTR("USED_OF_FMT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_sizeFormat, v12);
  if (!v11)

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCapacityBarCell usageString:](self, "usageString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)PSCapacityBarCell;
  -[PSTableCell titleLabel](&v36, sel_titleLabel);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[UILabel setText:](self->_sizeLabel, "setText:", v14);
  -[UILabel setHidden:](self->_sizeLabel, "setHidden:", objc_msgSend(v14, "length") == 0);
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarSizeLblUsesStandardFont"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if (v17)
    -[UILabel setFont:](self->_sizeLabel, "setFont:", self->_bigFont);
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarBackgroundColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCapacityBarView setBarBackgroundColor:](self->_barView, "setBarBackgroundColor:", v18);

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarOtherDataColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCapacityBarView setBarOtherDataColor:](self->_barView, "setBarOtherDataColor:", v19);

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarSeparatorColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCapacityBarView setBarSeparatorColor:](self->_barView, "setBarSeparatorColor:", v20);

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarBackgroundColor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCapacityBarView setBarBackgroundColor:](self->_barView, "setBarBackgroundColor:", v21);

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarTitleTextColor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    p_titleLabel = &self->_titleLabel;
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    p_titleLabel = &self->_titleLabel;
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v24);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarSizeTextColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[UILabel setTextColor:](self->_sizeLabel, "setTextColor:", v25);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_sizeLabel, "setTextColor:", v26);

  }
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarLegendTextColor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_legendTextColor, v28);
  if (!v27)

  -[PSCapacityBarView barOtherDataColor](self->_barView, "barOtherDataColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSCapacityBarLegendView setColor:](*p_otherLegend, "setColor:", v29);

  -[PSCapacityBarLegendView setTextColor:](*p_otherLegend, "setTextColor:", self->_legendTextColor);
  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarHideLegend"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hideLegend = objc_msgSend(v30, "BOOLValue");

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarShowOtherDataLegend"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showOtherLegend = objc_msgSend(v31, "BOOLValue");

  objc_msgSend(v4, "propertyForKey:", CFSTR("psCapBarForceLoading"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  self->_forceLoading = objc_msgSend(v32, "BOOLValue");

  -[PSCapacityBarCell createLegends:](self, "createLegends:", v13);
  -[PSCapacityBarView setBarData:](self->_barView, "setBarData:", v13);
  objc_msgSend(v4, "propertyForKey:", CFSTR("label"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel text](*p_titleLabel, "text");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  if ((v35 & 1) == 0)
    -[UILabel setText:](*p_titleLabel, "setText:", v33);
  -[PSCapacityBarCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSCapacityBarCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSCapacityBarCell;
  -[PSCapacityBarCell traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PSCapacityBarCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[PSCapacityBarCell setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeFormat, 0);
  objc_storeStrong((id *)&self->_legendTextColor, 0);
  objc_storeStrong((id *)&self->_bigFont, 0);
  objc_storeStrong((id *)&self->_legendFont, 0);
  objc_storeStrong((id *)&self->_otherLegend, 0);
  objc_storeStrong((id *)&self->_legends, 0);
  objc_storeStrong((id *)&self->_legendView, 0);
  objc_storeStrong((id *)&self->_barView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_barHeightConstraint, 0);
  objc_storeStrong((id *)&self->_commonConstraints, 0);
  objc_storeStrong((id *)&self->_legendConstraints, 0);
  objc_storeStrong((id *)&self->_largeConstraints, 0);
  objc_storeStrong((id *)&self->_normalConstraints, 0);
}

@end
