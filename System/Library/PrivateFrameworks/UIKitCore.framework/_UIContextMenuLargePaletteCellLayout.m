@implementation _UIContextMenuLargePaletteCellLayout

- (_UIContextMenuLargePaletteCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuLargePaletteCellLayout *v5;
  _UIContextMenuLargePaletteCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuLargePaletteCellLayout;
  v5 = -[_UIContextMenuLargePaletteCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuLargePaletteCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuLargePaletteCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

  }
  return v6;
}

- (int64_t)layoutSize
{
  return 2;
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

  -[_UIContextMenuLargePaletteCellLayout contentView](self, "contentView");
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
  return 0;
}

- (UIShape)contentShape
{
  void *v2;
  void *v3;

  +[UIShape rectShapeWithCornerRadius:](UIShape, "rectShapeWithCornerRadius:", 8.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shapeByApplyingInsets:", 8.0, 0.0, 8.0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIShape *)v3;
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
  _UIContextMenuLargePaletteCellLayout *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _UIContextMenuLargePaletteCellLayout *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[4];
  _QWORD v40[3];

  v2 = self;
  v40[2] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuLargePaletteCellLayout removeConstraints](self, "removeConstraints");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuLargePaletteCellLayout contentView](v2, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelStackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  objc_msgSend(v4, "iconView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    objc_msgSend(v4, "addSubview:", v6);
    objc_msgSend(v6, "centerYAnchor");
    v36 = v2;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v37 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v11;
    objc_msgSend(v6, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

    v8 = v37;
    v2 = v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v6;
      objc_msgSend(v16, "_currentImage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "widthAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      objc_msgSend(v31, "constraintEqualToConstant:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v35;
      objc_msgSend(v16, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v34 = v18;
      objc_msgSend(v18, "constraintEqualToConstant:", v19);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = v33;
      objc_msgSend(v4, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v20;
      objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[2] = v22;
      objc_msgSend(v4, "heightAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "heightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v39[3] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v26);

      v2 = v36;
      v27 = v17;
      v28 = v31;
LABEL_6:

      v8 = v37;
    }
  }
  else if (v7)
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v29);

    objc_msgSend(v4, "addSubview:", v8);
    objc_msgSend(v8, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v35;
    objc_msgSend(v8, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v30;
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v33, 10.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v32;
    v37 = v8;
    objc_msgSend(v8, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -10.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v24);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v3);
  -[_UIContextMenuLargePaletteCellLayout setManagedConstraints:](v2, "setManagedConstraints:", v3);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  NSArray *managedConstraints;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuLargePaletteCellLayout managedConstraints](self, "managedConstraints");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
