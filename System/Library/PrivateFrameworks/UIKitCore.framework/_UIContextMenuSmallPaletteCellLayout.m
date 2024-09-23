@implementation _UIContextMenuSmallPaletteCellLayout

- (_UIContextMenuSmallPaletteCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuSmallPaletteCellLayout *v5;
  _UIContextMenuSmallPaletteCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSmallPaletteCellLayout;
  v5 = -[_UIContextMenuSmallPaletteCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuSmallPaletteCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuSmallPaletteCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

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

  -[_UIContextMenuSmallPaletteCellLayout contentView](self, "contentView");
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
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  uint64_t v8;

  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuSmallPaletteCellLayout contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "options");

  if ((v5 & 1) != 0)
  {
    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[_UIContextMenuSmallPaletteCellLayout contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "options");

  if ((v7 & 2) != 0)
  {
    v8 = 0;
LABEL_5:

    v3 = (void *)v8;
  }
  return (UIColor *)v3;
}

- (UIColor)preferredBackgroundColorForCurrentState
{
  return 0;
}

- (void)installConstraints
{
  _UIContextMenuSmallPaletteCellLayout *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _UIContextMenuSmallPaletteCellLayout *v51;
  _UIContextMenuSmallPaletteCellLayout *v52;
  void *v53;
  _QWORD v54[3];
  void *v55;
  _QWORD v56[3];

  v2 = self;
  v56[2] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuSmallPaletteCellLayout removeConstraints](self, "removeConstraints");
  -[_UIContextMenuSmallPaletteCellLayout contentView](v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v3, "iconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    v51 = v2;
    v8 = (void *)v6;
    objc_msgSend(v3, "addSubview:", v5);
    objc_msgSend(v5, "centerYAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerYAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v11;
    objc_msgSend(v5, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "centerXAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v5;
      objc_msgSend(v16, "_currentImage");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if ((objc_msgSend(v3, "options") & 4) != 0)
      {
        v2 = v51;
        if (objc_msgSend(v3, "selectedIconBehavior"))
        {
          v17 = 0;
        }
        else
        {
          objc_msgSend(v3, "tintColor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v26;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v27);
          v28 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v28;
        }
      }
      else
      {
        v17 = 0;
        v2 = v51;
      }
      objc_msgSend(v3, "traitCollection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0.0;
      if (objc_msgSend(v50, "isSymbolImage") && objc_msgSend(v25, "userInterfaceStyle") == 1)
      {
        v49 = v25;
        objc_msgSend(v50, "symbolConfiguration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_colors");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "_luminance");
          v25 = v49;
          if (v34 > 0.8)
          {
            +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "traitCollection");
            v53 = v33;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "displayScale");
            v38 = 1.0 / v37;
            objc_msgSend(v16, "layer");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setRimWidth:", v38);

            objc_msgSend(v16, "layer");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 1.0;
            LODWORD(v41) = 1.0;
            objc_msgSend(v40, "setRimOpacity:", v41);

            objc_msgSend(v53, "_colorBlendedWithColor:compositingFilter:", v35, *MEMORY[0x1E0CD2E98]);
            v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v47 = objc_msgSend(v42, "CGColor");
            objc_msgSend(v16, "layer");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setRimColor:", v47);

            v25 = v49;
            v33 = v53;

          }
        }
        else
        {
          v25 = v49;
        }

      }
      objc_msgSend(v16, "layer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v45 = v29;
      objc_msgSend(v44, "setRimOpacity:", v45);

      objc_msgSend(v16, "_setOverridingSymbolConfiguration:", v17);
      goto LABEL_20;
    }
    v7 = v8;
    v2 = v51;
  }
  else
  {
    if (v6)
    {
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFont:", v18);

      objc_msgSend(v3, "addSubview:", v7);
      objc_msgSend(v7, "centerYAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "centerYAnchor");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "constraintEqualToAnchor:", v16);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v50;
      objc_msgSend(v7, "leadingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", v19, 10.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v20;
      objc_msgSend(v7, "trailingAnchor");
      v52 = v2;
      v21 = v7;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -10.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v46;
      v7 = v21;
      v2 = v52;

      v25 = v48;
LABEL_20:

      goto LABEL_21;
    }
    v15 = 0;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v15);
  -[_UIContextMenuSmallPaletteCellLayout setManagedConstraints:](v2, "setManagedConstraints:", v15);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  NSArray *managedConstraints;

  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuSmallPaletteCellLayout managedConstraints](self, "managedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;

}

- (UIHoverStyle)hoverStyle
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  UITargetedPreview *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  -[_UIContextMenuSmallPaletteCellLayout contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "titleLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isSymbolImage"))
    {
      _UIImageName(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsString:", CFSTR("circle.fill")) & 1) != 0
        || (objc_msgSend(v8, "containsString:", CFSTR("square.fill")) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v9 = objc_msgSend(v8, "containsString:", CFSTR("rectangle.fill"));
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  v10 = -[UITargetedPreview initWithView:]([UITargetedPreview alloc], "initWithView:", v6);
  if (v9)
  {
    +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    v16 = CGRectGetWidth(v39);
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v17 = CGRectGetHeight(v40);
    if (v16 < v17)
      v17 = v16;
    +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v17 * 0.5);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_scaledValueForValue:", 8.0);
    v21 = v20;
    objc_msgSend(v2, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayScale");
    UIRoundToScale(v21, v23);
    v25 = v24;

    +[UIPointerEffect effectWithPreview:](UIPointerHighlightEffect, "effectWithPreview:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bounds");
    v42 = CGRectInset(v41, v25, v25);
    v26 = v42.origin.x;
    v27 = v42.origin.y;
    v28 = v42.size.width;
    v29 = v42.size.height;
    objc_msgSend(v6, "bounds");
    v30 = v25 + v25 + CGRectGetWidth(v43);
    v44.origin.x = v26;
    v44.origin.y = v27;
    v44.size.width = v28;
    v44.size.height = v29;
    v31 = CGRectGetHeight(v44);
    if (v30 < v31)
      v30 = v31;
    objc_msgSend(v2, "bounds");
    +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v33 + (v32 - v30) * 0.5, v35 + (v34 - v29) * 0.5, v30, v29);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v18;
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v11, v18);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIHoverStyle *)v37;
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
  void *v2;
  BOOL v3;

  -[_UIContextMenuSmallPaletteCellLayout contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedIconBehavior") == 1;

  return v3;
}

- (int64_t)focusStyle
{
  return 1;
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
