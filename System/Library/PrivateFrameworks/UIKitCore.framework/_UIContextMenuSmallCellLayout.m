@implementation _UIContextMenuSmallCellLayout

- (_UIContextMenuSmallCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuSmallCellLayout *v5;
  _UIContextMenuSmallCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSmallCellLayout;
  v5 = -[_UIContextMenuSmallCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuSmallCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuSmallCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

  }
  return v6;
}

- (int64_t)layoutSize
{
  return 0;
}

- (int64_t)labelTextAlignment
{
  return 1;
}

- (unint64_t)labelMaximumNumberOfLines
{
  return 1;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
    objc_msgSend(v6, "titleEmphasizedFont");
  else
    objc_msgSend(v6, "titleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5);
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
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 6)
  {
    -[_UIContextMenuSmallCellLayout contentShape](self, "contentShape");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIHoverStyle styleWithShape:](UIHoverStyle, "styleWithShape:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (UIHoverStyle *)v7;
}

- (UIShape)contentShape
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 6)
  {
    +[UIShape circleShape](UIShape, "circleShape");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v8, "userInterfaceIdiom"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "smallItemContentShape");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIShape *)v6;
}

- (BOOL)useContentShapeForSelectionHighlight
{
  return 1;
}

- (int64_t)focusStyle
{
  return 1;
}

- (void)installConstraints
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  -[_UIContextMenuSmallCellLayout removeConstraints](self, "removeConstraints");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "labelStackView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "addSubview:", v7);
  objc_msgSend(v3, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "labelStackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    objc_msgSend(v7, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v12);

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(v3, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "iconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeFromSuperview");

    objc_msgSend(v7, "firstBaselineAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuSmallCellLayout setFirstBaselineConstraint:](self, "setFirstBaselineConstraint:", v17);

    -[_UIContextMenuSmallCellLayout firstBaselineConstraint](self, "firstBaselineConstraint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v10);
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v7, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v20);

  objc_msgSend(v3, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 10.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v23);

  objc_msgSend(v3, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "smallItemTopToFirstBaseline");
  v28 = v27;

  _UIContextMenuGetPlatformMetrics(v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "smallItemLastBaselineToBottom");
  v31 = v30;

  objc_msgSend(v3, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintGreaterThanOrEqualToConstant:", v28 + v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuSmallCellLayout setMinHeightConstraint:](self, "setMinHeightConstraint:", v33);

  -[_UIContextMenuSmallCellLayout minHeightConstraint](self, "minHeightConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObject:", v34);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v35);
  -[_UIContextMenuSmallCellLayout setManagedConstraints:](self, "setManagedConstraints:", v35);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;

  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v7, "userInterfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v7);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  _UIContextMenuGetPlatformMetrics(v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "smallItemTopToFirstBaseline");
  v12 = v11;

  objc_msgSend(v27, "_scaledValueForValue:", v12);
  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v13);
  v15 = v14;
  -[_UIContextMenuSmallCellLayout firstBaselineConstraint](self, "firstBaselineConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v15);

  _UIContextMenuGetPlatformMetrics(v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "smallItemTopToFirstBaseline");
  v19 = v18;

  _UIContextMenuGetPlatformMetrics(v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "smallItemLastBaselineToBottom");
  v22 = v21;

  objc_msgSend(v27, "_scaledValueForValue:", v19 + v22);
  -[_UIContextMenuSmallCellLayout contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale(v23);
  v25 = v24;
  -[_UIContextMenuSmallCellLayout minHeightConstraint](self, "minHeightConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setConstant:", v25);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  NSArray *managedConstraints;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuSmallCellLayout managedConstraints](self, "managedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;

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

- (NSLayoutConstraint)firstBaselineConstraint
{
  return self->_firstBaselineConstraint;
}

- (void)setFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_firstBaselineConstraint, a3);
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
  objc_storeStrong((id *)&self->_firstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
