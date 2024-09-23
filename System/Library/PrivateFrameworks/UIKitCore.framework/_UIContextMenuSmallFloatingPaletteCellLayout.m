@implementation _UIContextMenuSmallFloatingPaletteCellLayout

- (_UIContextMenuSmallFloatingPaletteCellLayout)initWithContentView:(id)a3
{
  id v4;
  _UIContextMenuSmallFloatingPaletteCellLayout *v5;
  _UIContextMenuSmallFloatingPaletteCellLayout *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSmallFloatingPaletteCellLayout;
  v5 = -[_UIContextMenuSmallFloatingPaletteCellLayout init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIContextMenuSmallFloatingPaletteCellLayout setContentView:](v5, "setContentView:", v4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuSmallFloatingPaletteCellLayout setManagedConstraints:](v6, "setManagedConstraints:", v7);

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

- (BOOL)allowsHighlightingOnHover
{
  return 0;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_UIContextMenuSmallFloatingPaletteCellLayout contentView](self, "contentView");
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
  return +[UIColor clearColor](UIColor, "clearColor");
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
  return 0;
}

- (void)installConstraints
{
  void *v3;
  void *v4;
  void *v5;
  _UIFloatingContentView *v6;
  _UIFloatingContentView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _UIContextMenuSmallFloatingPaletteCellLayout *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[3];
  void *v76;
  _QWORD v77[2];
  _QWORD v78[8];

  v78[6] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuSmallFloatingPaletteCellLayout removeConstraints](self, "removeConstraints");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuSmallFloatingPaletteCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labelStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = [_UIFloatingContentView alloc];
    v7 = -[_UIFloatingContentView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIContextMenuSmallFloatingPaletteCellLayout setFloatingContentView:](self, "setFloatingContentView:", v7);
    -[_UIContextMenuSmallFloatingPaletteCellLayout _configureSharedFloatingContentViewStyle](self, "_configureSharedFloatingContentViewStyle");

  }
  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v8);

  objc_msgSend(v3, "iconView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = self;
  -[_UIContextMenuSmallFloatingPaletteCellLayout contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v12);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "paletteMinimumItemSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v9, "topAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:constant:", v62, 26.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v60;
  objc_msgSend(v9, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, -46.0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v56;
  objc_msgSend(v9, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v18;
  objc_msgSend(v9, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v3;
  objc_msgSend(v3, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v21;
  objc_msgSend(v9, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v23;
  v70 = v9;
  objc_msgSend(v9, "heightAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToConstant:", v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "addObjectsFromArray:", v26);

  v27 = v73;
  if (v73)
  {
    objc_msgSend(v70, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v73);

    objc_msgSend(v73, "centerYAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v30;
    objc_msgSend(v73, "centerXAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v74;
    objc_msgSend(v74, "addObjectsFromArray:", v35);

    objc_opt_class();
    v38 = v71;
    v37 = v72;
    v39 = v70;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v73;
      objc_msgSend(v40, "_currentImage");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v72, "options") & 4) != 0 && !objc_msgSend(v72, "selectedIconBehavior"))
      {
        v42 = v74;
        if ((objc_msgSend(v72, "isFocused") & 1) != 0)
          +[UIColor blackColor](UIColor, "blackColor");
        else
          +[UIColor labelColor](UIColor, "labelColor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v53;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v54);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v42 = v74;
        v43 = 0;
      }
      objc_msgSend(v40, "_setOverridingSymbolConfiguration:", v43);
      goto LABEL_11;
    }
  }
  else
  {
    v36 = v74;
    v38 = v71;
    v37 = v72;
    v39 = v70;
    if (v71)
    {
      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCaption1"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setFont:", v44);

      objc_msgSend(v70, "contentView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addSubview:", v71);

      objc_msgSend(v71, "centerYAnchor");
      v42 = v74;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "contentView");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "centerYAnchor");
      v61 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToAnchor:", v61);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v67;
      objc_msgSend(v71, "leadingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "contentView");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "leadingAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:constant:", v46, 10.0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v47;
      objc_msgSend(v71, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "contentView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "trailingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, -10.0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v75[2] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "addObjectsFromArray:", v52);

      v41 = (void *)v61;
      v39 = v70;

      v38 = v71;
      v37 = v72;

LABEL_11:
      v36 = v42;
      v27 = v73;
    }
  }
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v36);
  -[_UIContextMenuSmallFloatingPaletteCellLayout setManagedConstraints:](v69, "setManagedConstraints:", v36);

}

- (void)removeConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *managedConstraints;

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4 = (void *)MEMORY[0x1E0D156E0];
  -[_UIContextMenuSmallFloatingPaletteCellLayout managedConstraints](self, "managedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateConstraints:", v5);

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;

}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;

  self->_controlState = a3;
  v6 = a4;
  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControlState:withAnimationCoordinator:", a3, v6);

}

- (void)_configureSharedFloatingContentViewStyle
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
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
  void *v28;
  id v29;

  -[_UIContextMenuSmallFloatingPaletteCellLayout contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  _UIContextMenuGetPlatformMetrics(v5);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemBackgroundColorProvider");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:forState:", v8, 0);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemBackgroundColorProvider");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10[2](v10, 8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:forState:", v11, 8);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemBackgroundColorProvider");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v13[2](v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:forState:", v14, 1);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "itemBackgroundColorProvider");
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v16[2](v16, 4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:forState:", v17, 4);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFocusAnimationConfiguration:", v19);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCornerRadius:", 24.0);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRoundContentWhenDeselected:", 1);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClipsContentToBounds:", 1);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFocusedSizeIncrease:", 20.0);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setShadowOpacity:forUserInterfaceStyle:", 1, 0.3);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUseShadowImage:", 0);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShadowRadius:", 10.0);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setShadowVerticalOffset:", 10.0);

  -[_UIContextMenuSmallFloatingPaletteCellLayout floatingContentView](self, "floatingContentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentMotionRotation:translation:", 0.0, 0.0, 4.0, 4.0);

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

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingContentView, a3);
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (void)setControlState:(unint64_t)a3
{
  self->_controlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end
