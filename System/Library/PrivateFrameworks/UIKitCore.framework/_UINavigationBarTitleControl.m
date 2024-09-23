@implementation _UINavigationBarTitleControl

- (void)didMoveToWindow
{
  void *v3;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  UIView *backgroundView;
  NSArray *backgroundViewConstraints;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  _UITAMICAdaptorView *titleView;
  NSArray **p_titleConstraints;
  NSArray *titleConstraints;
  _UITAMICAdaptorView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *v26;
  UILabel *inlineTitleView;
  void *v28;
  void *v29;
  uint64_t v30;
  UIImageView *chevron;
  NSArray *chevronConstraints;
  void *v33;
  void *v34;
  _UINavigationBarTitleControlVisualProvider *visualProvider;
  double v36;
  NSArray *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  NSArray *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  objc_super v55;
  _QWORD v56[3];
  _QWORD v57[4];
  _QWORD v58[6];

  v58[4] = *MEMORY[0x1E0C80C00];
  v55.receiver = self;
  v55.super_class = (Class)_UINavigationBarTitleControl;
  -[UIView updateConstraints](&v55, sel_updateConstraints);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __49___UINavigationBarTitleControl_updateConstraints__block_invoke;
  v54[3] = &unk_1E16B1B28;
  v54[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v54);
  if (self->_inlineTitleView)
  {
    -[_UINavigationBarTitleControl _updateInlineTitleView](self, "_updateInlineTitleView");
    *(float *)&v4 = self->_titleViewCompressionResistancePriority;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_inlineTitleView, "setContentCompressionResistancePriority:forAxis:", 0, v4);
  }
  else
  {
    *(float *)&v3 = self->_titleViewCompressionResistancePriority;
    -[UIView setContentCompressionResistancePriority:forAxis:](self->_titleView, "setContentCompressionResistancePriority:forAxis:", 0, v3);
    -[UIView updateConstraintsIfNeeded](self->_titleView, "updateConstraintsIfNeeded");
  }
  -[_UINavigationBarTitleControl _updateContentAlpha](self, "_updateContentAlpha");
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    *(float *)&v5 = self->_titleViewCompressionResistancePriority;
    -[UIView setContentCompressionResistancePriority:forAxis:](backgroundView, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    backgroundViewConstraints = self->_backgroundViewConstraints;
    if (!backgroundViewConstraints)
    {
      -[UIView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UINavigationBarTitleControl _backgroundViewConstraintsForIdiom:](self, "_backgroundViewConstraintsForIdiom:", objc_msgSend(v8, "userInterfaceIdiom"));
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_backgroundViewConstraints;
      self->_backgroundViewConstraints = v9;

      backgroundViewConstraints = self->_backgroundViewConstraints;
    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", backgroundViewConstraints);
  }
  else if (self->_backgroundViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    v11 = self->_backgroundViewConstraints;
    self->_backgroundViewConstraints = 0;

  }
  titleView = (_UITAMICAdaptorView *)self->_titleView;
  if (titleView)
  {
    p_titleConstraints = &self->_titleConstraints;
    titleConstraints = self->_titleConstraints;
    if (!titleConstraints)
    {
      if (self->_wrapperView)
        titleView = self->_wrapperView;
      v15 = titleView;
      -[UIView leadingAnchor](v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v16;
      objc_msgSend(v16, "constraintEqualToAnchor:", v51);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v50;
      -[UIView trailingAnchor](v15, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_chevronGuide, "leadingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v17;
      objc_msgSend(v17, "constraintEqualToAnchor:", v48);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v18;
      -[UIView topAnchor](v15, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v21;
      -[UIView bottomAnchor](v15, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v58[3] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *p_titleConstraints;
      *p_titleConstraints = (NSArray *)v25;

      goto LABEL_18;
    }
  }
  else
  {
    inlineTitleView = self->_inlineTitleView;
    if (!inlineTitleView)
      goto LABEL_20;
    p_titleConstraints = &self->_inlineTitleConstraints;
    titleConstraints = self->_inlineTitleConstraints;
    if (!titleConstraints)
    {
      -[UIView leadingAnchor](inlineTitleView, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v28;
      objc_msgSend(v28, "constraintEqualToAnchor:", v51);
      v15 = (_UITAMICAdaptorView *)objc_claimAutoreleasedReturnValue();
      v57[0] = v15;
      -[UIView trailingAnchor](self->_inlineTitleView, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_chevronGuide, "leadingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v29;
      objc_msgSend(v29, "constraintEqualToAnchor:", v49);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v48;
      -[UIView topAnchor](self->_inlineTitleView, "topAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v57[2] = v20;
      -[UIView bottomAnchor](self->_inlineTitleView, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v57[3] = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
      v30 = objc_claimAutoreleasedReturnValue();
      v24 = *p_titleConstraints;
      *p_titleConstraints = (NSArray *)v30;
LABEL_18:

      titleConstraints = *p_titleConstraints;
    }
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", titleConstraints);
LABEL_20:
  chevron = self->_chevron;
  chevronConstraints = self->_chevronConstraints;
  if (chevron)
  {
    if (!chevronConstraints)
    {
      -[UIView leadingAnchor](chevron, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_chevronGuide, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      visualProvider = self->_visualProvider;
      if (visualProvider)
        -[_UINavigationBarTitleControlVisualProvider chevronToTitlePadding](visualProvider, "chevronToTitlePadding");
      else
        v36 = 6.0;
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v38;
      -[UILayoutGuide trailingAnchor](self->_chevronGuide, "trailingAnchor");
      v53 = v33;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_chevron, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v41;
      -[UILayoutGuide centerYAnchor](self->_chevronGuide, "centerYAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView centerYAnchor](self->_chevron, "centerYAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 3);
      v45 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v46 = self->_chevronConstraints;
      self->_chevronConstraints = v45;

      chevronConstraints = self->_chevronConstraints;
    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", chevronConstraints);
  }
  else if (chevronConstraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    v37 = self->_chevronConstraints;
    self->_chevronConstraints = 0;

  }
  -[UIView superview](self, "superview");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLayoutConstraint setActive:](self->_sosConstraint, "setActive:", v47 != 0);

}

- (void)_updateInlineTitleView
{
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSDictionary *titleAttributes;
  NSDictionary *resolvedAttributes;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  void *v15;
  id v16;

  -[UIView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = _UIBarsUseDynamicType(), v4, (v5 & 1) != 0))
  {
    -[UIView traitCollection](self, "traitCollection");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", CFSTR("UICTContentSizeCategoryL"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (id)v6;
  v7 = *(_QWORD *)off_1E1678D90;
  -[NSDictionary objectForKeyedSubscript:](self->_titleAttributes, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  titleAttributes = self->_titleAttributes;
  if (v8 == v9)
  {
    v14 = (NSDictionary *)-[NSDictionary copy](titleAttributes, "copy");
    resolvedAttributes = self->_resolvedAttributes;
    self->_resolvedAttributes = v14;
  }
  else
  {
    resolvedAttributes = (NSDictionary *)-[NSDictionary mutableCopy](titleAttributes, "mutableCopy");
    -[NSDictionary setObject:forKeyedSubscript:](resolvedAttributes, "setObject:forKeyedSubscript:", v9, v7);
    v12 = (NSDictionary *)-[NSDictionary copy](resolvedAttributes, "copy");
    v13 = self->_resolvedAttributes;
    self->_resolvedAttributes = v12;

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_title, self->_resolvedAttributes);
  -[UILabel setAttributedText:](self->_inlineTitleView, "setAttributedText:", v15);

}

- (id)_backgroundViewConstraintsForIdiom:(int64_t)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[UIView leadingAnchor](self->_backgroundView, "leadingAnchor", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  -[UIView trailingAnchor](self->_backgroundView, "trailingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  -[UIView topAnchor](self->_backgroundView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  -[UIView bottomAnchor](self->_backgroundView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_baselineView
{
  _UINavigationBarTitleControl *v2;
  UILabel *inlineTitleView;

  v2 = self;
  if (!self->_titleView)
  {
    inlineTitleView = self->_inlineTitleView;
    if (!inlineTitleView)
    {
      -[_UINavigationBarTitleControl _ensureNecessaryViews](self, "_ensureNecessaryViews");
      inlineTitleView = v2->_inlineTitleView;
    }
    if (inlineTitleView)
      v2 = (_UINavigationBarTitleControl *)inlineTitleView;
  }
  return v2;
}

- (void)_ensureNecessaryViews
{
  _UINavigationBarTitleControlVisualProvider *visualProvider;
  void *v4;
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  UIImageView *chevron;
  UIImageView *v12;
  UIImageView *v13;
  UIImageView *v14;
  void *v15;
  _UINavigationBarTitleControlVisualProvider *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *chevronConstraints;
  UIImageView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  UILayoutGuide *v29;
  UILayoutGuide *chevronGuide;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  _UITAMICAdaptorView *wrapperView;
  UIView *v43;
  UIView *titleView;
  _UITAMICAdaptorView *v45;
  _UITAMICAdaptorView *v46;
  double v47;
  _UITAMICAdaptorView *v48;
  UILabel *v49;
  UILabel *v50;
  UILabel *v51;
  NSArray *titleConstraints;
  UIView *v53;
  NSArray *inlineTitleConstraints;
  UILabel *inlineTitleView;
  _UINavigationBarTitleControlVisualProvider *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  if (!self->_backgroundView)
  {
    visualProvider = self->_visualProvider;
    if (!visualProvider)
      goto LABEL_4;
    -[UIControl contextMenuInteraction](self, "contextMenuInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarTitleControlVisualProvider backgroundWithInteraction:](visualProvider, "backgroundWithInteraction:", v4);
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    v7 = self->_backgroundView;
    if (!v7)
    {
LABEL_4:
      v8 = [UIView alloc];
      v9 = -[UIView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v10 = self->_backgroundView;
      self->_backgroundView = v9;

      v7 = self->_backgroundView;
    }
    -[UIView addSubview:](self, "addSubview:", v7);
  }
  if (-[_UINavigationBarTitleControl isInteractive](self, "isInteractive"))
  {
    chevron = self->_chevron;
    if (!chevron)
    {
      v12 = [UIImageView alloc];
      v13 = -[UIImageView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v14 = self->_chevron;
      self->_chevron = v13;

      +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.down.circle.fill"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_visualProvider;
      if (v16)
      {
        -[_UINavigationBarTitleControlVisualProvider chevronImage](v16, "chevronImage");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (void *)v17;
        else
          v19 = v15;
        -[UIImageView setImage:](self->_chevron, "setImage:", v19);

        -[_UINavigationBarTitleControlVisualProvider chevronSymbolConfiguration](self->_visualProvider, "chevronSymbolConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setPreferredSymbolConfiguration:](self->_chevron, "setPreferredSymbolConfiguration:", v20);

      }
      else
      {
        -[UIImageView setImage:](self->_chevron, "setImage:", v15);
        +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleHeadline"), -1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v23;
        +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "configurationByApplyingConfiguration:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setPreferredSymbolConfiguration:](self->_chevron, "setPreferredSymbolConfiguration:", v27);

      }
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_chevron, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      LODWORD(v28) = 1148829696;
      -[UIView setContentCompressionResistancePriority:forAxis:](self->_chevron, "setContentCompressionResistancePriority:forAxis:", 0, v28);

      chevron = self->_chevron;
    }
    -[UIView addSubview:](self->_backgroundView, "addSubview:", chevron);
  }
  else
  {
    if (self->_chevronConstraints)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      chevronConstraints = self->_chevronConstraints;
      self->_chevronConstraints = 0;

    }
    -[UIView removeFromSuperview](self->_chevron, "removeFromSuperview");
    v22 = self->_chevron;
    self->_chevron = 0;

  }
  if (!self->_chevronGuide)
  {
    v29 = objc_alloc_init(UILayoutGuide);
    chevronGuide = self->_chevronGuide;
    self->_chevronGuide = v29;

    -[UILayoutGuide setIdentifier:](self->_chevronGuide, "setIdentifier:", CFSTR("TitleChevronGuide"));
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", self->_chevronGuide);
    -[UILayoutGuide widthAnchor](self->_chevronGuide, "widthAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToConstant:", 0.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v33) = 1130430464;
    objc_msgSend(v32, "setPriority:", v33);
    v57 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide trailingAnchor](self->_chevronGuide, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v58;
    -[UILayoutGuide topAnchor](self->_chevronGuide, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v36;
    -[UILayoutGuide bottomAnchor](self->_chevronGuide, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v39;
    v62[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v40);

  }
  if (self->_titleView)
  {
    v41 = +[_UITAMICAdaptorView shouldWrapView:](_UITAMICAdaptorView, "shouldWrapView:");
    wrapperView = self->_wrapperView;
    if (v41)
    {
      if (wrapperView)
      {
        -[_UITAMICAdaptorView view](wrapperView, "view");
        v43 = (UIView *)objc_claimAutoreleasedReturnValue();
        titleView = self->_titleView;

        if (v43 == titleView)
          goto LABEL_37;
      }
      -[_UINavigationBarTitleControl _resetTitleViewConstraints](self, "_resetTitleViewConstraints");
      -[_UINavigationBarTitleControl _cleanupWrapperView](self, "_cleanupWrapperView");
      v45 = -[_UITAMICAdaptorView initWithView:]([_UITAMICAdaptorView alloc], "initWithView:", self->_titleView);
      v46 = self->_wrapperView;
      self->_wrapperView = v45;

      LODWORD(v47) = 1134723072;
      -[_UITAMICAdaptorView setSizingPriority:](self->_wrapperView, "setSizingPriority:", v47);
      -[_UITAMICAdaptorView setDelegate:](self->_wrapperView, "setDelegate:", self);
      v48 = self->_wrapperView;
    }
    else
    {
      if (wrapperView)
      {
        -[_UINavigationBarTitleControl _resetTitleViewConstraints](self, "_resetTitleViewConstraints");
        -[_UINavigationBarTitleControl _cleanupWrapperView](self, "_cleanupWrapperView");
      }
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v48 = (_UITAMICAdaptorView *)self->_titleView;
    }
    -[UIView addSubview:](self, "addSubview:", v48);
LABEL_37:
    if (self->_inlineTitleConstraints)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      inlineTitleConstraints = self->_inlineTitleConstraints;
      self->_inlineTitleConstraints = 0;

    }
    -[UIView removeFromSuperview](self->_inlineTitleView, "removeFromSuperview");
    inlineTitleView = self->_inlineTitleView;
    self->_inlineTitleView = 0;

    goto LABEL_40;
  }
  if (!self->_title)
  {
    if (self->_titleConstraints)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
      titleConstraints = self->_titleConstraints;
      self->_titleConstraints = 0;

    }
    -[_UINavigationBarTitleControl _cleanupWrapperView](self, "_cleanupWrapperView");
    -[UIView removeFromSuperview](self->_titleView, "removeFromSuperview");
    v53 = self->_titleView;
    self->_titleView = 0;

    goto LABEL_37;
  }
  v49 = self->_inlineTitleView;
  if (!v49)
  {
    v50 = objc_alloc_init(UILabel);
    v51 = self->_inlineTitleView;
    self->_inlineTitleView = v50;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_inlineTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_inlineTitleView, "setAdjustsFontForContentSizeCategory:", _UIBarsUseDynamicType());
    v49 = self->_inlineTitleView;
  }
  -[UIView addSubview:](self->_backgroundView, "addSubview:", v49);
LABEL_40:
  v56 = self->_visualProvider;
  if (v56)
    -[_UINavigationBarTitleControlVisualProvider titleControlDidUpdateBackground:inlineTitle:chevron:interactive:highlighted:](v56, "titleControlDidUpdateBackground:inlineTitle:chevron:interactive:highlighted:", self->_backgroundView, self->_inlineTitleView, self->_chevron, -[_UINavigationBarTitleControl isInteractive](self, "isInteractive"), -[UIControl isHighlighted](self, "isHighlighted"));
}

- (void)setTitleMenuProvider:(id)a3
{
  void *v4;
  id titleMenuProvider;

  if (self->_titleMenuProvider != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    titleMenuProvider = self->_titleMenuProvider;
    self->_titleMenuProvider = v4;

    -[_UINavigationBarTitleControl _updateInteractions](self, "_updateInteractions");
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
  -[_UINavigationBarTitleControl _updateContentAlpha](self, "_updateContentAlpha");
}

- (void)setDocumentProperties:(id)a3
{
  UIDocumentProperties *v5;
  UIDocumentProperties *v6;

  v5 = (UIDocumentProperties *)a3;
  if (self->_documentProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_documentProperties, a3);
    -[_UINavigationBarTitleControl _updateInteractions](self, "_updateInteractions");
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v5 = v6;
  }

}

- (void)setTitleViewCompressionResistancePriority:(float)a3
{
  if (self->_titleViewCompressionResistancePriority != a3)
  {
    self->_titleViewCompressionResistancePriority = a3;
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setVisualProvider:(id)a3
{
  objc_storeStrong((id *)&self->_visualProvider, a3);
}

- (_UINavigationBarTitleControl)initWithFrame:(CGRect)a3
{
  _UINavigationBarTitleControl *v3;
  void *v4;
  id v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTitleControl;
  v3 = -[UIControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIView registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", v4, sel_setNeedsUpdateConstraints);

  }
  return v3;
}

- (double)trailingPadding
{
  _BOOL4 v2;
  double result;

  v2 = -[_UINavigationBarTitleControl isInteractive](self, "isInteractive");
  result = 0.0;
  if (v2)
    return 16.0;
  return result;
}

- (void)_updateContentAlpha
{
  _BOOL4 v3;
  double contentAlpha;

  v3 = -[_UINavigationBarTitleControl isInteractive](self, "isInteractive");
  contentAlpha = 1.0;
  if (v3)
    contentAlpha = self->_contentAlpha;
  -[UIView setAlpha:](self->_titleView, "setAlpha:", contentAlpha);
  -[UIView setAlpha:](self->_backgroundView, "setAlpha:", self->_contentAlpha);
}

- (BOOL)isInteractive
{
  return self->_titleMenuProvider || self->_documentProperties != 0;
}

- (void)setMenuAlignmentInsets:(UIEdgeInsets)a3
{
  self->_menuAlignmentInsets = a3;
}

- (void)setTitleView:(id)a3
{
  UIView *v5;
  char v6;
  UIView *v7;

  v5 = (UIView *)a3;
  if (self->_titleView != v5)
  {
    v7 = v5;
    -[_UINavigationBarTitleControl _resetTitleViewConstraints](self, "_resetTitleViewConstraints");
    -[_UINavigationBarTitleControl _cleanupWrapperView](self, "_cleanupWrapperView");
    -[UIView removeFromSuperview](self->_titleView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleView, a3);
    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v6 = dyld_program_sdk_at_least();
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      -[_UINavigationBarTitleControl _ensureNecessaryViews](self, "_ensureNecessaryViews");
      v5 = v7;
    }
  }

}

- (void)setTitleAttributes:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *v6;
  char v7;
  NSDictionary *v8;
  NSDictionary *titleAttributes;
  NSDictionary *v10;

  v4 = a3;
  v5 = self->_titleAttributes;
  v6 = (NSDictionary *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSDictionary isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSDictionary *)-[NSDictionary copy](v10, "copy");
    titleAttributes = self->_titleAttributes;
    self->_titleAttributes = v8;

    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_9:

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *title;
  NSString *v10;

  v4 = a3;
  v5 = self->_title;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqual:](v5, "isEqual:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    title = self->_title;
    self->_title = v8;

    -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_9:

}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasBaseline
{
  _UINavigationBarTitleControl *v2;
  _UINavigationBarTitleControl *v3;

  v2 = self;
  -[_UINavigationBarTitleControl _baselineView](self, "_baselineView");
  v3 = (_UINavigationBarTitleControl *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 != v2;

  return (char)v2;
}

- (void)_resetTitleViewConstraints
{
  NSArray *titleConstraints;

  if (self->_titleConstraints)
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:");
    titleConstraints = self->_titleConstraints;
    self->_titleConstraints = 0;

  }
}

- (void)_cleanupWrapperView
{
  _UITAMICAdaptorView *wrapperView;

  -[_UITAMICAdaptorView setDelegate:](self->_wrapperView, "setDelegate:", 0);
  -[UIView removeFromSuperview](self->_wrapperView, "removeFromSuperview");
  wrapperView = self->_wrapperView;
  self->_wrapperView = 0;

}

- (void)setTitleLayoutGuide:(id)a3
{
  UILayoutGuide **p_titleLayoutGuide;
  NSLayoutConstraint *sosConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  double v11;
  UILayoutGuide *v12;

  p_titleLayoutGuide = &self->_titleLayoutGuide;
  v12 = (UILayoutGuide *)a3;
  if (*p_titleLayoutGuide != v12)
  {
    -[NSLayoutConstraint setActive:](self->_sosConstraint, "setActive:", 0);
    sosConstraint = self->_sosConstraint;
    self->_sosConstraint = 0;

    objc_storeStrong((id *)&self->_titleLayoutGuide, a3);
    if (*p_titleLayoutGuide)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        -[UIView heightAnchor](self, "heightAnchor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILayoutGuide heightAnchor](*p_titleLayoutGuide, "heightAnchor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "constraintEqualToAnchor:", v8);
        v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        v10 = self->_sosConstraint;
        self->_sosConstraint = v9;

        LODWORD(v11) = 25.0;
        -[NSLayoutConstraint setPriority:](self->_sosConstraint, "setPriority:", v11);
        -[NSLayoutConstraint setIdentifier:](self->_sosConstraint, "setIdentifier:", CFSTR("_UINavigationBarTitleControl-compatibility-height-ambiguity-suppression"));
        -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      }
    }
  }

}

- (CGSize)availableSizeForAdaptor:(id)a3 proposedSize:(CGSize)result
{
  UILayoutGuide *titleLayoutGuide;
  double v6;
  double v7;
  double v8;
  CGFloat height;
  double v10;
  CGRect v11;

  titleLayoutGuide = self->_titleLayoutGuide;
  if (titleLayoutGuide)
  {
    -[UILayoutGuide layoutFrame](titleLayoutGuide, "layoutFrame", a3, result.width, result.height);
    v7 = v6;
    height = v8;
    -[UILayoutGuide layoutFrame](self->_chevronGuide, "layoutFrame");
    result.width = v7 - CGRectGetWidth(v11);
  }
  else
  {
    height = result.height;
  }
  v10 = height;
  result.height = v10;
  return result;
}

- (void)setControlAlpha:(double)a3
{
  self->_controlAlpha = a3;
  -[_UINavigationBarTitleControl _updateControlAlpha](self, "_updateControlAlpha");
}

- (UILabel)titleLabel
{
  void **p_titleView;
  void *v3;

  p_titleView = (void **)&self->_titleView;
  if (!self->_titleView)
  {
    p_titleView = (void **)&self->_inlineTitleView;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    v3 = *p_titleView;
    return (UILabel *)v3;
  }
  v3 = 0;
  return (UILabel *)v3;
}

- (void)_updateInteractions
{
  -[UIControl setContextMenuInteractionEnabled:](self, "setContextMenuInteractionEnabled:", -[_UINavigationBarTitleControl isInteractive](self, "isInteractive"));
  -[UIControl setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", 1);
  -[_UINavigationBarTitleControl _invalidateSceneDraggingBehavior](self, "_invalidateSceneDraggingBehavior");
}

- (void)_updateControlAlpha
{
  -[UIView setAlpha:](self, "setAlpha:", self->_controlAlpha);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v4;
  _UINavigationBarTitleControlVisualProvider *visualProvider;
  UIView *backgroundView;
  UILabel *inlineTitleView;
  UIImageView *chevron;
  _BOOL8 v9;
  _UINavigationBarTitleControlVisualProvider *v10;
  UIView *v11;
  UILabel *v12;
  UIImageView *v13;
  uint64_t v14;
  UIView *v15;
  UILabel *v16;
  UIImageView *v17;
  double controlAlpha;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_UINavigationBarTitleControl;
  -[UIControl setHighlighted:](&v19, sel_setHighlighted_, a3);
  v4 = -[UIControl _hasActiveMenuPresentation](self, "_hasActiveMenuPresentation");
  visualProvider = self->_visualProvider;
  if (v4)
  {
    if (visualProvider)
    {
      backgroundView = self->_backgroundView;
      inlineTitleView = self->_inlineTitleView;
      chevron = self->_chevron;
      v9 = -[_UINavigationBarTitleControl isInteractive](self, "isInteractive");
      v10 = visualProvider;
      v11 = backgroundView;
      v12 = inlineTitleView;
      v13 = chevron;
      v14 = 1;
LABEL_6:
      -[_UINavigationBarTitleControlVisualProvider titleControlDidUpdateBackground:inlineTitle:chevron:interactive:highlighted:](v10, "titleControlDidUpdateBackground:inlineTitle:chevron:interactive:highlighted:", v11, v12, v13, v9, v14);
      return;
    }
    controlAlpha = 0.5;
  }
  else
  {
    if (visualProvider)
    {
      v15 = self->_backgroundView;
      v16 = self->_inlineTitleView;
      v17 = self->_chevron;
      v9 = -[_UINavigationBarTitleControl isInteractive](self, "isInteractive");
      v10 = visualProvider;
      v11 = v15;
      v12 = v16;
      v13 = v17;
      v14 = 0;
      goto LABEL_6;
    }
    controlAlpha = self->_controlAlpha;
  }
  -[UIView setAlpha:](self, "setAlpha:", controlAlpha);
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)_debugInfo
{
  void *v3;
  void *v4;
  UIView *titleView;
  _UITAMICAdaptorView *wrapperView;
  __CFString *v7;
  UILabel *inlineTitleView;
  id titleMenuProvider;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  titleView = self->_titleView;
  if (titleView)
  {
    wrapperView = self->_wrapperView;
    if (wrapperView)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("w=%p c="), self->_wrapperView);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = &stru_1E16EDF20;
    }
    objc_msgSend(v4, "appendFormat:", CFSTR("titleView=%p (%@%p) compressionResistance=%f"), titleView, v7, self->_titleConstraints, self->_titleViewCompressionResistancePriority);
    if (wrapperView)

  }
  else
  {
    inlineTitleView = self->_inlineTitleView;
    if (inlineTitleView)
      objc_msgSend(v3, "appendFormat:", CFSTR("title='%@' (v=%p, c=%p) attributes=%p compressionResistance=%f"), self->_title, inlineTitleView, self->_inlineTitleConstraints, self->_titleAttributes, self->_titleViewCompressionResistancePriority);
  }
  if (self->_chevron)
    objc_msgSend(v4, "appendFormat:", CFSTR(" chevron=%p (%p)"), self->_chevron, self->_chevronConstraints);
  titleMenuProvider = self->_titleMenuProvider;
  if (titleMenuProvider)
  {
    v10 = _Block_copy(titleMenuProvider);
    objc_msgSend(v4, "appendFormat:", CFSTR(" titleMenuProvider=%p"), v10);

  }
  if (self->_documentProperties)
    objc_msgSend(v4, "appendFormat:", CFSTR(" documentProperties=%p"), self->_documentProperties);
  return v4;
}

+ (id)titleMenuSuggestedActionsWithDocumentFileURL:(id)a3
{
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _UNKNOWN **v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  +[_UIReturnToDocumentAction actionWithFileURL:](_UIReturnToDocumentAction, "actionWithFileURL:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  v3 = &off_1E167A000;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_duplicate_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_move_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_rename_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_export_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.document"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  v9 = objc_msgSend((id)UIApp, "_supportsPrintCommand");
  if (v9)
  {
    +[UICommand _defaultCommandForAction:](UICommand, "_defaultCommandForAction:", sel_print_);
    v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v16 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  +[UIMenu _defaultInlineMenuWithIdentifier:children:](UIMenu, "_defaultInlineMenuWithIdentifier:children:", CFSTR("com.apple.menu.print"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {

  }
  return v12;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  void *v4;
  void *v5;

  -[UIDocumentProperties _representedURL](self->_documentProperties, "_representedURL", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UINavigationBarTitleControl titleMenuSuggestedActionsWithDocumentFileURL:](_UINavigationBarTitleControl, "titleMenuSuggestedActionsWithDocumentFileURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  UIDocumentProperties *v17;
  _UINavigationBarTitleControl *v18;
  id v19;
  id v20;

  v5 = a3;
  v6 = (unint64_t)_Block_copy(self->_titleMenuProvider);
  v7 = self->_documentProperties;
  if (v6 | v7)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16 = &unk_1E16C42D8;
    v20 = (id)v6;
    v17 = (UIDocumentProperties *)(id)v7;
    v18 = self;
    v19 = v5;
    +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, &v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPreferredMenuElementOrder:", 2, v13, v14, v15, v16);
    -[UIView nextResponder](self, "nextResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UITreeFindFirstAncestorMatchingCondition(v9, sel_nextResponder, &__block_literal_global_166);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "topViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFirstResponderTarget:", v11);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  _UINavigationBarTitleControlVisualProvider *visualProvider;
  double v6;
  double v7;
  double v8;
  double v9;
  UIView *titleView;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGPoint result;

  v4 = a3;
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    -[_UINavigationBarTitleControlVisualProvider menuAttachmentPointForConfiguration:](visualProvider, "menuAttachmentPointForConfiguration:", v4);
    v7 = v6;
    v9 = v8;
  }
  else
  {
    titleView = self->_titleView;
    if (titleView)
    {
      -[UIView bounds](self->_titleView, "bounds");
      -[UIView convertRect:toView:](titleView, "convertRect:toView:", self);
    }
    else
    {
      -[UIView bounds](self->_backgroundView, "bounds");
    }
    v15 = v11;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    -[_UINavigationBarTitleControl menuAlignmentInsets](self, "menuAlignmentInsets");
    v20 = v19;
    v22 = v21;
    v23 = v15 + v21;
    v24 = v16 + v19;
    v26 = v17 - (v21 + v25);
    v28 = v18 - (v19 + v27);
    -[UIView _window](self, "_window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertRect:toView:](self, "convertRect:toView:", v29, v23, v24, v26, v28);
    v7 = v22 + _UIControlMenuAttachmentPointForRectInContainer(v29, v30, v31, v32, v33);
    v9 = v20 + v34;

  }
  v35 = v7;
  v36 = v9;
  result.y = v36;
  result.x = v35;
  return result;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v5;
  _UINavigationBarTitleControlVisualProvider *visualProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTitleControl;
  -[UIControl _contextMenuInteraction:styleForMenuWithConfiguration:](&v8, sel__contextMenuInteraction_styleForMenuWithConfiguration_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeepsInputViewsVisible:", 1);
  visualProvider = self->_visualProvider;
  if (visualProvider)
    -[_UINavigationBarTitleControlVisualProvider updateContextMenuStyle:](visualProvider, "updateContextMenuStyle:", v5);
  return v5;
}

- (id)_preview
{
  void *v3;
  UIView *titleView;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIPreviewTarget *v13;
  void *v14;
  UIPreviewTarget *v15;
  void *v16;
  void *v17;
  UITargetedPreview *v18;
  UIView *v19;
  UITargetedPreview *v20;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (titleView = self->_titleView, v3, titleView))
  {
    -[UIView frame](self->_titleView, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = [UIPreviewTarget alloc];
    -[UIView superview](self->_titleView, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[UIPreviewTarget initWithContainer:center:](v13, "initWithContainer:center:", v14, v6 + v10 * 0.5, v8 + v12 * 0.5);

    v16 = (void *)objc_opt_new();
    +[UIColor clearColor](UIColor, "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    v18 = [UITargetedPreview alloc];
    v19 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v6, v8, v10, v12);
    v20 = -[UITargetedPreview initWithView:parameters:target:](v18, "initWithView:parameters:target:", v19, v16, v15);

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (BOOL)_inactiveForPointer
{
  return self->_visualProvider
      && (objc_opt_respondsToSelector() & 1) != 0
      && !-[_UINavigationBarTitleControlVisualProvider supportsPointerInteractions](self->_visualProvider, "supportsPointerInteractions")|| !-[_UINavigationBarTitleControl isInteractive](self, "isInteractive")|| self->_contentAlpha < 0.01;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  char isKindOfClass;
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

  v6 = a3;
  if (-[_UINavigationBarTitleControl _inactiveForPointer](self, "_inactiveForPointer"))
  {
    v7 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[UIView bounds](self, "bounds");
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "createRegionFromRect:targetView:identifier:selected:", self, CFSTR("com.apple.UIKit._UINavigationBarTitleControl"), 0, v9, v10, v11, v12);
    }
    else
    {
      objc_msgSend(v6, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView convertRect:toView:](self, "convertRect:toView:", v17, v13, v14, v15, v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;

      +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v19, v21, v23, v25);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)pointerShapeInContainer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *wrapperView;
  double v11;
  CGFloat x;
  double v13;
  CGFloat y;
  double v15;
  CGFloat width;
  double v17;
  CGFloat height;
  UIImageView *chevron;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MinX;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v4 = a3;
  if (self->_visualProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UINavigationBarTitleControlVisualProvider pointerShapeInContainer:](self->_visualProvider, "pointerShapeInContainer:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  -[UIView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  if (self->_titleView)
  {
    if (self->_wrapperView)
      wrapperView = self->_wrapperView;
    else
      wrapperView = self->_titleView;
  }
  else
  {
    wrapperView = self->_inlineTitleView;
    if (!wrapperView)
    {
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      x = *MEMORY[0x1E0C9D628];
      y = *(double *)(MEMORY[0x1E0C9D628] + 8);
      goto LABEL_10;
    }
  }
  objc_msgSend(wrapperView, "frame");
  x = v11;
  y = v13;
  width = v15;
  height = v17;
LABEL_10:
  chevron = self->_chevron;
  if (chevron)
  {
    -[UIView frame](chevron, "frame");
    v52.origin.x = v20;
    v52.origin.y = v21;
    v52.size.width = v22;
    v52.size.height = v23;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v49 = CGRectUnion(v48, v52);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
  }
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  MinX = CGRectGetMinX(v50);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  v25 = CGRectGetWidth(v51);
  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "navigationAndToolbarSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "buttonPadding");
  v29 = MinX - v28;
  v30 = v25 + v28 + v28;
  objc_msgSend(v27, "buttonMinimumHeight");
  v32 = (v31 - v9) * 0.5;
  if (v9 >= v31)
  {
    v33 = 0.0;
  }
  else
  {
    v9 = v31;
    v33 = v32;
  }
  v34 = v7 - v33;
  objc_msgSend(v27, "buttonMinimumWidth");
  if (v30 >= v35)
    v36 = v30;
  else
    v36 = v35;
  if (v30 >= v35)
    v37 = 0.0;
  else
    v37 = (v35 - v30) * 0.5;
  -[UIView convertRect:toView:](self, "convertRect:toView:", v4, v29 - v37, v34, v36, v9);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  objc_msgSend(v27, "buttonCornerRadius");
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v39, v41, v43, v45, v46);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  UITargetedPreview *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIView center](self, "center");
    objc_msgSend(v5, "createPreviewTargetForView:center:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", self, v6, v7);

  }
  else
  {
    v8 = -[UITargetedPreview initWithView:parameters:]([UITargetedPreview alloc], "initWithView:parameters:", self, v6);
  }
  -[UITargetedPreview target](v8, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UINavigationBarTitleControl pointerShapeInContainer:](self, "pointerShapeInContainer:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_preferredPresentationSourceItem
{
  return _UIPopoverPresentationControllerSourceItemObscuredSource(self->_chevron);
}

- (id)_preferredSender
{
  void *v2;
  uint64_t v3;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (float)titleViewCompressionResistancePriority
{
  return self->_titleViewCompressionResistancePriority;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (double)controlAlpha
{
  return self->_controlAlpha;
}

- (UIView)effectiveTitleView
{
  return self->_effectiveTitleView;
}

- (id)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (UIEdgeInsets)menuAlignmentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_menuAlignmentInsets.top;
  left = self->_menuAlignmentInsets.left;
  bottom = self->_menuAlignmentInsets.bottom;
  right = self->_menuAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UILayoutGuide)titleLayoutGuide
{
  return self->_titleLayoutGuide;
}

- (_UINavigationBarTitleControlVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_effectiveTitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chevronConstraints, 0);
  objc_storeStrong((id *)&self->_inlineTitleConstraints, 0);
  objc_storeStrong((id *)&self->_titleConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundViewConstraints, 0);
  objc_storeStrong((id *)&self->_sosConstraint, 0);
  objc_storeStrong((id *)&self->_chevronGuide, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_resolvedAttributes, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_inlineTitleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
