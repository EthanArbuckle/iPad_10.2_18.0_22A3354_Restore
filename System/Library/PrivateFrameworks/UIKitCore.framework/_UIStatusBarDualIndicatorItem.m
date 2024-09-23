@implementation _UIStatusBarDualIndicatorItem

- (id)dependentEntryKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[_UIStatusBarDualIndicatorItem indicatorEntryKey](self, "indicatorEntryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDualIndicatorItem secondaryIndicatorEntryKey](self, "secondaryIndicatorEntryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indicatorEntryKey
{
  return &stru_1E16EDF20;
}

- (id)secondaryIndicatorEntryKey
{
  return &stru_1E16EDF20;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (id)secondarySystemImageNameForUpdate:(id)a3
{
  return 0;
}

- (id)createDisplayItemForIdentifier:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  objc_super v36;
  _QWORD v37[9];

  v37[7] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)_UIStatusBarDualIndicatorItem;
  -[_UIStatusBarItem createDisplayItemForIdentifier:](&v36, sel_createDisplayItemForIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[_UIStatusBarDualIndicatorItem iconsView](self, "iconsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIStatusBarDualIndicatorItem iconView](self, "iconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v8);
    -[_UIStatusBarDualIndicatorItem secondaryIconView](self, "secondaryIconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v9);
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDualIndicatorItem itemSpacing](self, "itemSpacing");
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDualIndicatorItem setItemSpacingConstraint:](self, "setItemSpacingConstraint:", v12);

    objc_msgSend(v8, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    v34 = v8;
    objc_msgSend(v8, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v29;
    objc_msgSend(v8, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v26;
    -[_UIStatusBarDualIndicatorItem itemSpacingConstraint](self, "itemSpacingConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v25;
    objc_msgSend(v9, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37[4] = v13;
    objc_msgSend(v9, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v16;
    objc_msgSend(v9, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v18 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v18;
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v23);

  }
  return v4;
}

- (_UIStatusBarDisplayableContainerView)iconsView
{
  _UIStatusBarDisplayableContainerView *iconsView;

  iconsView = self->_iconsView;
  if (!iconsView)
  {
    -[_UIStatusBarDualIndicatorItem _create_iconsView](self, "_create_iconsView");
    iconsView = self->_iconsView;
  }
  return iconsView;
}

- (void)_create_iconsView
{
  _UIStatusBarDisplayableContainerView *v3;
  _UIStatusBarDisplayableContainerView *v4;
  _UIStatusBarDisplayableContainerView *iconsView;

  v3 = [_UIStatusBarDisplayableContainerView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconsView = self->_iconsView;
  self->_iconsView = v4;

}

- (_UIStatusBarImageView)iconView
{
  _UIStatusBarImageView *iconView;

  iconView = self->_iconView;
  if (!iconView)
  {
    -[_UIStatusBarDualIndicatorItem _create_iconView](self, "_create_iconView");
    iconView = self->_iconView;
  }
  return iconView;
}

- (void)_create_iconView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *iconView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

}

- (_UIStatusBarImageView)secondaryIconView
{
  _UIStatusBarImageView *secondaryIconView;

  secondaryIconView = self->_secondaryIconView;
  if (!secondaryIconView)
  {
    -[_UIStatusBarDualIndicatorItem _create_secondaryIconView](self, "_create_secondaryIconView");
    secondaryIconView = self->_secondaryIconView;
  }
  return secondaryIconView;
}

- (void)_create_secondaryIconView
{
  _UIStatusBarImageView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *secondaryIconView;

  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  secondaryIconView = self->_secondaryIconView;
  self->_secondaryIconView = v4;

}

- (id)imageForUpdate:(id)a3 secondary:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (a4)
    -[_UIStatusBarDualIndicatorItem secondarySystemImageNameForUpdate:](self, "secondarySystemImageNameForUpdate:", v6);
  else
    -[_UIStatusBarDualIndicatorItem systemImageNameForUpdate:](self, "systemImageNameForUpdate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)additionRemovalAnimationForSubItem:(id)a3 image:(id)a4 update:(id)a5 displayItem:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _UIStatusBarDualIndicatorItem *v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93___UIStatusBarDualIndicatorItem_additionRemovalAnimationForSubItem_image_update_displayItem___block_invoke;
  v14[3] = &unk_1E16C6080;
  v15 = v9;
  v16 = v8;
  v17 = self;
  v10 = v8;
  v11 = v9;
  +[_UIStatusBarAnimation animationWithBlock:](_UIStatusBarAnimation, "animationWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  _BOOL4 v37;
  objc_super v38;
  objc_super v39;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultDisplayIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9)
  {

LABEL_25:
    v29 = 0;
    goto LABEL_26;
  }
  v10 = objc_msgSend(v7, "isEnabled");

  if (!v10 || !objc_msgSend(v6, "dataChanged"))
    goto LABEL_25;
  -[_UIStatusBarDualIndicatorItem iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarDualIndicatorItem secondaryIconView](self, "secondaryIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "image");
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDualIndicatorItem indicatorEntryKey](self, "indicatorEntryKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "data");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDualIndicatorItem secondaryIndicatorEntryKey](self, "secondaryIndicatorEntryKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17)
    v22 = v12 == 0;
  else
    v22 = 1;
  if (v14)
    v22 = 1;
  v37 = v22;
  if (v20)
    v23 = v17 == 0;
  else
    v23 = 1;
  if (v20)
    v24 = v14 == 0;
  else
    v24 = 1;
  v25 = v12 | v14;
  if (v12)
    v26 = 1;
  else
    v26 = v24;

  if (v25 && v23 && v37 && (v26 & 1) != 0)
  {
    if (v17)
    {
      -[_UIStatusBarDualIndicatorItem imageForUpdate:secondary:](self, "imageForUpdate:secondary:", v6, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarDualIndicatorItem iconView](self, "iconView");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v21)
      {
        v38.receiver = self;
        v38.super_class = (Class)_UIStatusBarDualIndicatorItem;
        -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v38, sel_applyUpdate_toDisplayItem_, v6, v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      -[_UIStatusBarDualIndicatorItem imageForUpdate:secondary:](self, "imageForUpdate:secondary:", v6, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIStatusBarDualIndicatorItem secondaryIconView](self, "secondaryIconView");
      v28 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v28;
    -[_UIStatusBarDualIndicatorItem additionRemovalAnimationForSubItem:image:update:displayItem:](self, "additionRemovalAnimationForSubItem:image:update:displayItem:", v28, v27, v6, v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)_UIStatusBarDualIndicatorItem;
    -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v39, sel_applyUpdate_toDisplayItem_, v6, v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDualIndicatorItem imageForUpdate:secondary:](self, "imageForUpdate:secondary:", v6, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDualIndicatorItem iconView](self, "iconView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setImage:", v27);

    -[_UIStatusBarDualIndicatorItem imageForUpdate:secondary:](self, "imageForUpdate:secondary:", v6, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDualIndicatorItem secondaryIconView](self, "secondaryIconView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:", v32);

    v34 = 0.0;
    if (v27 && v32)
    {
      -[_UIStatusBarDualIndicatorItem itemSpacing](self, "itemSpacing");
      v34 = v35;
    }
    -[_UIStatusBarDualIndicatorItem itemSpacingConstraint](self, "itemSpacingConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setConstant:", v34);

  }
LABEL_26:

  return v29;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (double)additionRemovalScale
{
  return self->_additionRemovalScale;
}

- (void)setAdditionRemovalScale:(double)a3
{
  self->_additionRemovalScale = a3;
}

- (double)additionRemovalDuration
{
  return self->_additionRemovalDuration;
}

- (void)setAdditionRemovalDuration:(double)a3
{
  self->_additionRemovalDuration = a3;
}

- (void)setIconsView:(id)a3
{
  objc_storeStrong((id *)&self->_iconsView, a3);
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (void)setSecondaryIconView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryIconView, a3);
}

- (NSLayoutConstraint)itemSpacingConstraint
{
  return self->_itemSpacingConstraint;
}

- (void)setItemSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_itemSpacingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryIconView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_iconsView, 0);
}

@end
