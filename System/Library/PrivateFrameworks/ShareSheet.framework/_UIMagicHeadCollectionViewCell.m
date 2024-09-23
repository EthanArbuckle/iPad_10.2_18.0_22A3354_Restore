@implementation _UIMagicHeadCollectionViewCell

- (void)configureLayoutIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIMagicHeadCollectionViewCell;
  v4 = a3;
  -[UIAirDropGroupActivityCell configureLayoutIfNeeded:](&v14, sel_configureLayoutIfNeeded_, v4);
  v5 = objc_msgSend(v4, "deviceClass", v14.receiver, v14.super_class);

  v6 = &regularHeight_0;
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    v6 = &compactHeight_0;
  if (v5 == 3)
    v6 = &regularHeight5_8Rounded_0;
  layout_0 = (uint64_t)v6;
  v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[_UIMagicHeadCollectionViewCell setMagicHeadView:](self, "setMagicHeadView:", v7);

  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0);

  -[_UIMagicHeadCollectionViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[_UIMagicHeadCollectionViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bringSubviewToFront:", v13);

  -[_UIMagicHeadCollectionViewCell _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  double v5;
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
  void *v16;
  NSString *v17;
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
  _BOOL4 IsAccessibilityCategory;
  void *v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  -[_UIMagicHeadCollectionViewCell contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  if (v4 >= 414.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v5 = 80.0;
    else
      v5 = 84.0;
  }
  else
  {
    v5 = 80.0;
  }

  v8 = (void *)MEMORY[0x1E0C99DE8];
  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v11;
  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v15);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIMagicHeadCollectionViewCell traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredContentSizeCategory");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerYAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v20;
  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMagicHeadCollectionViewCell setLargeTextMHConstraints:](self, "setLargeTextMHConstraints:", v26);

  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, *(double *)layout_0 + -9.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v30;
  -[_UIMagicHeadCollectionViewCell magicHeadView](self, "magicHeadView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerXAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMagicHeadCollectionViewCell setRegularMHConstraints:](self, "setRegularMHConstraints:", v35);

  if (IsAccessibilityCategory)
    -[_UIMagicHeadCollectionViewCell largeTextMHConstraints](self, "largeTextMHConstraints");
  else
    -[_UIMagicHeadCollectionViewCell regularMHConstraints](self, "regularMHConstraints");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObjectsFromArray:", v36);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v39);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIMagicHeadCollectionViewCell;
  v4 = a3;
  -[UIAirDropGroupActivityCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[_UIMagicHeadCollectionViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[_UIMagicHeadCollectionViewCell _updateMHForCurrentSizeCategory](self, "_updateMHForCurrentSizeCategory");
}

- (void)_updateMHForCurrentSizeCategory
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[_UIMagicHeadCollectionViewCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  v6 = (void *)MEMORY[0x1E0CB3718];
  if (IsAccessibilityCategory)
  {
    -[_UIMagicHeadCollectionViewCell regularMHConstraints](self, "regularMHConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[_UIMagicHeadCollectionViewCell largeTextMHConstraints](self, "largeTextMHConstraints");
  }
  else
  {
    -[_UIMagicHeadCollectionViewCell largeTextMHConstraints](self, "largeTextMHConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v9);

    v8 = (void *)MEMORY[0x1E0CB3718];
    -[_UIMagicHeadCollectionViewCell regularMHConstraints](self, "regularMHConstraints");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v10);

  -[_UIMagicHeadCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)updateDarkening
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
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContents:", v31);

  -[UIAirDropGroupActivityCell titleSlotView](self, "titleSlotView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContents:", v7);

  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContents:", v10);

  if ((-[_UIMagicHeadCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIAirDropGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v15, "CGColor");
    v18 = 1;
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  -[UIAirDropGroupActivityCell imageSlotView](self, "imageSlotView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContentsMultiplyColor:", v17);

  if (v18)
  if ((-[_UIMagicHeadCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIAirDropGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v15, "CGColor");
    v22 = 1;
  }
  else
  {
    v22 = 0;
    v21 = 0;
  }
  -[UIAirDropGroupActivityCell transportSlotView](self, "transportSlotView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setContentsMultiplyColor:", v21);

  if (v22)
  if ((-[_UIMagicHeadCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIAirDropGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v15, "CGColor");
    v26 = 1;
  }
  else
  {
    v26 = 0;
    v25 = 0;
  }
  -[_UIMagicHeadCollectionViewCell magicHeadWheelView](self, "magicHeadWheelView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "selectedHead");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageSlotView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setContentsMultiplyColor:", v25);

  if (v26)
}

- (UIView)magicHeadView
{
  return self->_magicHeadView;
}

- (void)setMagicHeadView:(id)a3
{
  objc_storeStrong((id *)&self->_magicHeadView, a3);
}

- (SFMagicHeadWheelView)magicHeadWheelView
{
  return self->_magicHeadWheelView;
}

- (void)setMagicHeadWheelView:(id)a3
{
  objc_storeStrong((id *)&self->_magicHeadWheelView, a3);
}

- (NSArray)regularMHConstraints
{
  return self->_regularMHConstraints;
}

- (void)setRegularMHConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularMHConstraints, a3);
}

- (NSArray)largeTextMHConstraints
{
  return self->_largeTextMHConstraints;
}

- (void)setLargeTextMHConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextMHConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextMHConstraints, 0);
  objc_storeStrong((id *)&self->_regularMHConstraints, 0);
  objc_storeStrong((id *)&self->_magicHeadWheelView, 0);
  objc_storeStrong((id *)&self->_magicHeadView, 0);
}

@end
