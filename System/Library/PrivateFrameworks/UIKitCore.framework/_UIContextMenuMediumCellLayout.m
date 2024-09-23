@implementation _UIContextMenuMediumCellLayout

- (_UIContextMenuMediumCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuMediumCellLayout *v5;
  _UIContextMenuMediumCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuMediumCellLayout;
  v5 = -[_UIContextMenuMediumCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuMediumCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuMediumCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

  }
  return v6;
}

- (int64_t)layoutSize
{
  return 1;
}

- (int64_t)labelTextAlignment
{
  return 1;
}

- (unint64_t)labelMaximumNumberOfLines
{
  return 2;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  __CFString **v5;
  const UIFontTextStyle *v6;

  v3 = a3;
  v4 = -[_UIContextMenuMediumCellLayout _hasTitle](self, "_hasTitle");
  v5 = UIFontTextStyleEmphasizedFootnote;
  if (!v4)
    v5 = UIFontTextStyleEmphasizedBody;
  v6 = &UIFontTextStyleFootnote;
  if (!v4)
    v6 = &UIFontTextStyleBody;
  if (!v3)
    v5 = (__CFString **)v6;
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", *v5);
  return (id)objc_claimAutoreleasedReturnValue();
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
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_UIContextMenuMediumCellLayout contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediumItemContentShape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIShape *)v5;
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
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
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
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
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
  id v54;

  -[_UIContextMenuMediumCellLayout removeConstraints](self, "removeConstraints");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[_UIContextMenuMediumCellLayout _hasTitle](self, "_hasTitle");
  -[_UIContextMenuMediumCellLayout contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  LODWORD(v9) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v9);
  if (v6)
  {
    objc_msgSend(v4, "addSubview:", v6);
    objc_msgSend(v6, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v12);

  }
  if (v7)
  {
    objc_msgSend(v4, "addSubview:", v5);
    objc_msgSend(v5, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 10.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v15);

    objc_msgSend(v4, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 10.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v18);

  }
  v19 = !v3;
  if (!v6)
    v19 = 1;
  if ((v19 & 1) == 0)
  {
    objc_msgSend(v6, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v22 = (void *)v21;
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuMediumCellLayout setPrimaryViewCenterYConstraint:](self, "setPrimaryViewCenterYConstraint:", v23);

    objc_msgSend(v5, "firstBaselineAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuMediumCellLayout setTopConstraint:](self, "setTopConstraint:", v26);

    objc_msgSend(v4, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastBaselineAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuMediumCellLayout setBottomConstraint:](self, "setBottomConstraint:", v29);

    objc_msgSend(v4, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v5;
    goto LABEL_12;
  }
  if (v3)
  {
    objc_msgSend(v5, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v6)
    goto LABEL_13;
  objc_msgSend(v6, "centerYAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuMediumCellLayout setPrimaryViewCenterYConstraint:](self, "setPrimaryViewCenterYConstraint:", v47);

  objc_msgSend(v6, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintGreaterThanOrEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuMediumCellLayout setTopConstraint:](self, "setTopConstraint:", v50);

  objc_msgSend(v4, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastBaselineAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuMediumCellLayout setBottomConstraint:](self, "setBottomConstraint:", v53);

  objc_msgSend(v4, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v6;
LABEL_12:
  objc_msgSend(v31, "lastBaselineAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuMediumCellLayout setFittingBottomConstraint:](self, "setFittingBottomConstraint:", v33);

  -[_UIContextMenuMediumCellLayout topConstraint](self, "topConstraint");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1144750080;
  objc_msgSend(v34, "setPriority:", v35);

  -[_UIContextMenuMediumCellLayout bottomConstraint](self, "bottomConstraint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = 1144733696;
  objc_msgSend(v36, "setPriority:", v37);

  -[_UIContextMenuMediumCellLayout primaryViewCenterYConstraint](self, "primaryViewCenterYConstraint");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v38);

  -[_UIContextMenuMediumCellLayout topConstraint](self, "topConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v39);

  -[_UIContextMenuMediumCellLayout bottomConstraint](self, "bottomConstraint");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v40);

  -[_UIContextMenuMediumCellLayout fittingBottomConstraint](self, "fittingBottomConstraint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v41);

LABEL_13:
  objc_msgSend(v4, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuMediumCellLayout setMinimumHeightConstraint:](self, "setMinimumHeightConstraint:", v43);

  -[_UIContextMenuMediumCellLayout minimumHeightConstraint](self, "minimumHeightConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObject:", v44);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v54);
  -[_UIContextMenuMediumCellLayout setManagedConstraints:](self, "setManagedConstraints:", v54);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  -[_UIContextMenuMediumCellLayout contentView](self, "contentView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = -[_UIContextMenuMediumCellLayout _hasTitle](self, "_hasTitle");
  objc_msgSend(v6, "_scaledValueForValue:", 16.0);
  if ((_DWORD)v3)
  {
    objc_msgSend(v23, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v6, "_scaledValueForValue:", 48.0);
    else
      objc_msgSend(v6, "_scaledValueForValue:", 26.0);
  }
  UIRoundToViewScale(v23);
  v9 = v8;
  -[_UIContextMenuMediumCellLayout primaryViewCenterYConstraint](self, "primaryViewCenterYConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v9);

  UIRoundToViewScale(v23);
  v12 = v11;
  -[_UIContextMenuMediumCellLayout topConstraint](self, "topConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v12);

  UIRoundToViewScale(v23);
  v15 = v14;
  -[_UIContextMenuMediumCellLayout bottomConstraint](self, "bottomConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v15);

  UIRoundToViewScale(v23);
  v18 = v17;
  -[_UIContextMenuMediumCellLayout fittingBottomConstraint](self, "fittingBottomConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setConstant:", v18);

  objc_msgSend(v6, "_scaledValueForValue:", 64.0);
  v21 = v20;
  -[_UIContextMenuMediumCellLayout minimumHeightConstraint](self, "minimumHeightConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setConstant:", v21);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  NSArray *managedConstraints;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuMediumCellLayout managedConstraints](self, "managedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;

}

- (BOOL)_hasTitle
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[_UIContextMenuMediumCellLayout contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
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

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)primaryViewCenterYConstraint
{
  return self->_primaryViewCenterYConstraint;
}

- (void)setPrimaryViewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryViewCenterYConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)fittingBottomConstraint
{
  return self->_fittingBottomConstraint;
}

- (void)setFittingBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_fittingBottomConstraint, a3);
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (void)setMinimumHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_fittingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
