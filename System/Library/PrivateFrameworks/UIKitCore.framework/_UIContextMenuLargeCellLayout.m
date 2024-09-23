@implementation _UIContextMenuLargeCellLayout

- (_UIContextMenuLargeCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuLargeCellLayout *v5;
  _UIContextMenuLargeCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuLargeCellLayout;
  v5 = -[_UIContextMenuLargeCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuLargeCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLargeCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

  }
  return v6;
}

- (int64_t)layoutSize
{
  return 2;
}

- (int64_t)labelTextAlignment
{
  return 4;
}

- (unint64_t)labelMaximumNumberOfLines
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIContextMenuLargeCellLayout contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "iconEmphasizedSymbolFont");
  else
    objc_msgSend(v6, "iconSymbolFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForCurrentContentSizeCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (UIColor)preferredContentColorForCurrentState
{
  return 0;
}

- (UIColor)preferredBackgroundColorForCurrentState
{
  return 0;
}

- (UIHoverStyle)hoverStyle
{
  return 0;
}

- (UIShape)contentShape
{
  return +[UIShape rectShape](UIShape, "rectShape");
}

- (BOOL)useContentShapeForSelectionHighlight
{
  return 0;
}

- (int64_t)focusStyle
{
  return 1;
}

- (void)installConstraints
{
  void *v3;
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  _QWORD v75[3];

  v75[2] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuLargeCellLayout removeConstraints](self, "removeConstraints");
  -[_UIContextMenuLargeCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  objc_msgSend(v3, "labelStackView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decorationView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v10;
  if (v8)
  {
    v71 = v9;
    objc_msgSend(v3, "addSubview:", v8);
    v11 = -[_UIContextMenuLargeCellLayout _hasTrailingAccessory](self, "_hasTrailingAccessory");
    objc_msgSend(v8, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v7;
    if (v11)
      objc_msgSend(v3, "trailingAnchor");
    else
      objc_msgSend(v3, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLargeCellLayout setDecorationViewCenterX:](self, "setDecorationViewCenterX:", v14);

    -[_UIContextMenuLargeCellLayout decorationViewCenterX](self, "decorationViewCenterX");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v15;
    objc_msgSend(v8, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v73;
    objc_msgSend(v73, "addObjectsFromArray:", v19);

    v7 = v70;
    v9 = v71;
  }
  if (v9)
    v20 = IsAccessibilityCategory;
  else
    v20 = 1;
  if ((v20 & 1) != 0)
  {
    objc_msgSend(v9, "removeFromSuperview");
  }
  else
  {
    objc_msgSend(v3, "addSubview:", v9);
    objc_msgSend(v9, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v23);

    objc_msgSend(v9, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLargeCellLayout setIconViewCenterXToTrailing:](self, "setIconViewCenterXToTrailing:", v26);

    -[_UIContextMenuLargeCellLayout iconViewCenterXToTrailing](self, "iconViewCenterXToTrailing");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v27);

  }
  objc_msgSend(v3, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length"))
  {

  }
  else
  {
    objc_msgSend(v3, "subtitleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "text");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (!v32)
    {
      objc_msgSend(v3, "traitCollection");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "userInterfaceIdiom");

      _UIContextMenuGetPlatformMetrics(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "itemTopToFirstBaseline");
      v64 = v63;

      _UIContextMenuGetPlatformMetrics(v61);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "itemLastBaselineToBottom");
      v67 = v66;

      objc_msgSend(v3, "heightAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintGreaterThanOrEqualToConstant:", v64 + v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIContextMenuLargeCellLayout setMinHeightConstraint:](self, "setMinHeightConstraint:", v69);

      -[_UIContextMenuLargeCellLayout minHeightConstraint](self, "minHeightConstraint");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v73;
      objc_msgSend(v73, "addObject:", v52);
      goto LABEL_19;
    }
  }
  objc_msgSend(v3, "addSubview:", v7);
  objc_msgSend(v3, "traitCollection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v33, "userInterfaceIdiom"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "menuItemInternalPadding");
  v36 = v35;
  v38 = v37;

  objc_msgSend(v7, "firstBaselineAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLargeCellLayout setTopToFirstBaseline:](self, "setTopToFirstBaseline:", v41);

  objc_msgSend(v7, "lastBaselineAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLargeCellLayout setLastBaselineToBottom:](self, "setLastBaselineToBottom:", v44);

  objc_msgSend(v7, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, v36);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLargeCellLayout setLeadingToLabelStackViewLeading:](self, "setLeadingToLabelStackViewLeading:", v47);

  objc_msgSend(v9, "superview");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v8;
  objc_msgSend(v7, "trailingAnchor");
  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerXAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintLessThanOrEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLargeCellLayout setLabelStackViewTrailingToiconViewCenterX:](self, "setLabelStackViewTrailingToiconViewCenterX:", v51);

    -[_UIContextMenuLargeCellLayout labelStackViewTrailingToiconViewCenterX](self, "labelStackViewTrailingToiconViewCenterX");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v38);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_UIContextMenuLargeCellLayout topToFirstBaseline](self, "topToFirstBaseline");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v55;
  -[_UIContextMenuLargeCellLayout lastBaselineToBottom](self, "lastBaselineToBottom");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v56;
  -[_UIContextMenuLargeCellLayout leadingToLabelStackViewLeading](self, "leadingToLabelStackViewLeading");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v57;
  v74[3] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v73;
  objc_msgSend(v73, "addObjectsFromArray:", v58);

  v8 = v72;
LABEL_19:

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v59);
  -[_UIContextMenuLargeCellLayout setManagedConstraints:](self, "setManagedConstraints:", v59);

}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSString *v7;
  BOOL IsAccessibilityCategory;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  id v76;

  -[_UIContextMenuLargeCellLayout contentView](self, "contentView");
  v76 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  objc_msgSend(v76, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  objc_msgSend(v76, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v12, "userInterfaceIdiom"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _UIContextMenuGetPlatformMetrics(v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "itemBaselineToBaseline");
  v18 = v17;

  objc_msgSend(v15, "_scaledValueForValue:useLanguageAwareScaling:", 1, v18);
  UIRoundToViewScale(v76);
  v20 = v19;
  objc_msgSend(v76, "labelStackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSpacing:", v20);

  _UIContextMenuGetPlatformMetrics(v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v11)
    objc_msgSend(v22, "itemTopToFirstBaselineWithSubtitle");
  else
    objc_msgSend(v22, "itemTopToFirstBaseline");
  v25 = v24;

  _UIContextMenuGetPlatformMetrics(v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v11)
    objc_msgSend(v26, "itemLastBaselineToBottomWithSubtitle");
  else
    objc_msgSend(v26, "itemLastBaselineToBottom");
  v29 = v28;

  objc_msgSend(v15, "_scaledValueForValue:", v25);
  UIRoundToViewScale(v76);
  v31 = v30;
  objc_msgSend(v15, "_scaledValueForValue:", v29);
  UIRoundToViewScale(v76);
  v33 = v32;
  -[_UIContextMenuLargeCellLayout topToFirstBaseline](self, "topToFirstBaseline");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setConstant:", v31);

  -[_UIContextMenuLargeCellLayout lastBaselineToBottom](self, "lastBaselineToBottom");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setConstant:", -v33);

  objc_msgSend(v76, "directionalLayoutMargins");
  v37 = v36;
  objc_msgSend(v76, "decorationView");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    v40 = -[_UIContextMenuLargeCellLayout _hasTrailingAccessory](self, "_hasTrailingAccessory");

    if (!v40)
    {
      objc_msgSend(v5, "leadingDecorationViewOffset");
      objc_msgSend(v15, "_scaledValueForValue:");
      UIRoundToViewScale(v76);
      v42 = v41;
      -[_UIContextMenuLargeCellLayout decorationViewCenterX](self, "decorationViewCenterX");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setConstant:", v42);

    }
  }
  -[_UIContextMenuLargeCellLayout leadingToLabelStackViewLeading](self, "leadingToLabelStackViewLeading");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setConstant:", v37);

  objc_msgSend(v76, "iconView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
    IsAccessibilityCategory = 1;

  if (!IsAccessibilityCategory)
  {
    _UIContextMenuGetPlatformMetrics(v4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "dynamicImageBoxWidth");
    v48 = v47;

    objc_msgSend(v15, "_scaledValueForValue:", v48);
    UIRoundToViewScale(v76);
    v50 = v49;
    objc_msgSend(v76, "directionalLayoutMargins");
    v51 = v50 * 0.5;
    v53 = v50 * 0.5 + v52;
    _UIContextMenuGetPlatformMetrics(v4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "minIntraItemSpacing");
    v56 = v55;

    -[_UIContextMenuLargeCellLayout iconViewCenterXToTrailing](self, "iconViewCenterXToTrailing");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setConstant:", -v53);

    -[_UIContextMenuLargeCellLayout labelStackViewTrailingToiconViewCenterX](self, "labelStackViewTrailingToiconViewCenterX");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setConstant:", -(v51 + v56));

  }
  objc_msgSend(v76, "decorationView");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    v61 = -[_UIContextMenuLargeCellLayout _hasTrailingAccessory](self, "_hasTrailingAccessory");

    if (v61)
    {
      objc_msgSend(v5, "trailingDecorationViewOffset");
      objc_msgSend(v15, "_scaledValueForValue:");
      _UIContextMenuGetPlatformMetrics(v4);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "menuItemInternalPadding");

      _UIContextMenuGetPlatformMetrics(v4);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "menuGutterWidth");

      UIRoundToViewScale(v76);
      v65 = -v64;
      -[_UIContextMenuLargeCellLayout decorationViewCenterX](self, "decorationViewCenterX");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setConstant:", v65);

    }
  }
  _UIContextMenuGetPlatformMetrics(v4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "itemTopToFirstBaseline");
  v69 = v68;

  _UIContextMenuGetPlatformMetrics(v4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "itemLastBaselineToBottom");
  v72 = v71;

  objc_msgSend(v15, "_scaledValueForValue:", v69 + v72);
  UIRoundToViewScale(v76);
  v74 = v73;
  -[_UIContextMenuLargeCellLayout minHeightConstraint](self, "minHeightConstraint");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setConstant:", v74);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  NSArray *managedConstraints;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuLargeCellLayout managedConstraints](self, "managedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;

}

- (BOOL)_hasTrailingAccessory
{
  void *v2;
  char v3;

  -[_UIContextMenuLargeCellLayout contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ~objc_msgSend(v2, "options");

  return (v3 & 0x30) == 0;
}

- (_UIContextMenuCellContentView)contentView
{
  return (_UIContextMenuCellContentView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (NSArray)managedConstraints
{
  return self->_managedConstraints;
}

- (void)setManagedConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_managedConstraints, a3);
}

- (NSLayoutConstraint)topToFirstBaseline
{
  return self->_topToFirstBaseline;
}

- (void)setTopToFirstBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_topToFirstBaseline, a3);
}

- (NSLayoutConstraint)lastBaselineToBottom
{
  return self->_lastBaselineToBottom;
}

- (void)setLastBaselineToBottom:(id)a3
{
  objc_storeStrong((id *)&self->_lastBaselineToBottom, a3);
}

- (NSLayoutConstraint)leadingToLabelStackViewLeading
{
  return self->_leadingToLabelStackViewLeading;
}

- (void)setLeadingToLabelStackViewLeading:(id)a3
{
  objc_storeStrong((id *)&self->_leadingToLabelStackViewLeading, a3);
}

- (NSLayoutConstraint)decorationViewCenterX
{
  return self->_decorationViewCenterX;
}

- (void)setDecorationViewCenterX:(id)a3
{
  objc_storeStrong((id *)&self->_decorationViewCenterX, a3);
}

- (NSLayoutConstraint)iconViewCenterXToTrailing
{
  return self->_iconViewCenterXToTrailing;
}

- (void)setIconViewCenterXToTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_iconViewCenterXToTrailing, a3);
}

- (NSLayoutConstraint)labelStackViewTrailingToiconViewCenterX
{
  return self->_labelStackViewTrailingToiconViewCenterX;
}

- (void)setLabelStackViewTrailingToiconViewCenterX:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackViewTrailingToiconViewCenterX, a3);
}

- (NSLayoutConstraint)minHeightConstraint
{
  return self->_minHeightConstraint;
}

- (void)setMinHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelStackViewTrailingToiconViewCenterX, 0);
  objc_storeStrong((id *)&self->_iconViewCenterXToTrailing, 0);
  objc_storeStrong((id *)&self->_decorationViewCenterX, 0);
  objc_storeStrong((id *)&self->_leadingToLabelStackViewLeading, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottom, 0);
  objc_storeStrong((id *)&self->_topToFirstBaseline, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
