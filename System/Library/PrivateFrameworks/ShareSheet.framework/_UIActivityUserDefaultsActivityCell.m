@implementation _UIActivityUserDefaultsActivityCell

- (_UIActivityUserDefaultsActivityCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _UIActivityUserDefaultsActivityCell *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSLayoutConstraint *titleLabelHeightAnchor;
  _UIActivityUserDefaultsActivityCell *v92;
  id v94;
  id v95;
  objc_super v96;

  v96.receiver = self;
  v96.super_class = (Class)_UIActivityUserDefaultsActivityCell;
  v4 = -[_UIActivityUserDefaultsActivityCell initWithStyle:reuseIdentifier:](&v96, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "setLineBreakMode:", 4);
    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend((id)objc_opt_class(), "bodyShortFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v7);

    -[_UIActivityUserDefaultsActivityCell setActivityTitleLabel:](v4, "setActivityTitleLabel:", v5);
    v8 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v8, "setContentMode:", 1);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityUserDefaultsActivityCell setActivityImageView:](v4, "setActivityImageView:", v8);
    v95 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v95, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityUserDefaultsActivityCell setActivityImageSlotView:](v4, "setActivityImageSlotView:", v95);
    v94 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v94, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIActivityUserDefaultsActivityCell setActivityTitleView:](v4, "setActivityTitleView:", v94);
    -[_UIActivityUserDefaultsActivityCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClipsToBounds:", 1);
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v11);

    -[_UIActivityUserDefaultsActivityCell activityImageSlotView](v4, "activityImageSlotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v12);

    -[_UIActivityUserDefaultsActivityCell activityTitleView](v4, "activityTitleView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v13);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 15.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 15.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

    objc_msgSend(v9, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 15.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, 16.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell setLabelLeadingConstraint:](v4, "setLabelLeadingConstraint:", v31);

    -[_UIActivityUserDefaultsActivityCell labelLeadingConstraint](v4, "labelLeadingConstraint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v32);

    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, -15.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v36);

    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "centerYAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v40);

    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", 29.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell setImageViewWidthConstraint:](v4, "setImageViewWidthConstraint:", v43);

    -[_UIActivityUserDefaultsActivityCell imageViewWidthConstraint](v4, "imageViewWidthConstraint");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v44);

    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "heightAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToConstant:", 29.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v47);

    -[_UIActivityUserDefaultsActivityCell activityImageSlotView](v4, "activityImageSlotView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "widthAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v52);

    -[_UIActivityUserDefaultsActivityCell activityImageSlotView](v4, "activityImageSlotView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "heightAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v57);

    -[_UIActivityUserDefaultsActivityCell activityImageSlotView](v4, "activityImageSlotView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "centerXAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "centerXAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v62);

    -[_UIActivityUserDefaultsActivityCell activityImageSlotView](v4, "activityImageSlotView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "centerYAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityImageView](v4, "activityImageView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v67);

    -[_UIActivityUserDefaultsActivityCell activityTitleView](v4, "activityTitleView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "widthAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "widthAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v72);

    -[_UIActivityUserDefaultsActivityCell activityTitleView](v4, "activityTitleView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "heightAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v77);

    -[_UIActivityUserDefaultsActivityCell activityTitleView](v4, "activityTitleView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v82);

    -[_UIActivityUserDefaultsActivityCell activityTitleView](v4, "activityTitleView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "centerXAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "centerXAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v87);

    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v4, "activityTitleLabel");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "heightAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintGreaterThanOrEqualToConstant:", 0.0);
    v90 = objc_claimAutoreleasedReturnValue();
    titleLabelHeightAnchor = v4->_titleLabelHeightAnchor;
    v4->_titleLabelHeightAnchor = (NSLayoutConstraint *)v90;

    -[NSLayoutConstraint setActive:](v4->_titleLabelHeightAnchor, "setActive:", 0);
    objc_msgSend(v14, "addObject:", v4->_titleLabelHeightAnchor);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
    v92 = v4;

  }
  return v4;
}

+ (id)bodyShortFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setActivityProxy:(id)a3
{
  NSLayoutConstraint *titleLabelHeightAnchor;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_activityProxy, a3);
  titleLabelHeightAnchor = self->_titleLabelHeightAnchor;
  if (!v12)
  {
    v11 = -[NSLayoutConstraint isActive](titleLabelHeightAnchor, "isActive");
    -[NSLayoutConstraint setActive:](self->_titleLabelHeightAnchor, "setActive:", 0);
    if (!v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[NSLayoutConstraint constant](titleLabelHeightAnchor, "constant");
  v7 = v6;
  objc_msgSend(v12, "activityTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "slotTextHeight");
  v10 = v9 / _ShareSheetDeviceScreenScale();

  -[NSLayoutConstraint setConstant:](self->_titleLabelHeightAnchor, "setConstant:", v10);
  -[NSLayoutConstraint setActive:](self->_titleLabelHeightAnchor, "setActive:", 1);
  if (vabdd_f64(v7, v10) >= 0.00000011920929)
LABEL_3:
    -[_UIActivityUserDefaultsActivityCell setNeedsLayout](self, "setNeedsLayout");
LABEL_4:

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIActivityUserDefaultsActivityCell;
  -[_UIActivityUserDefaultsActivityCell prepareForReuse](&v9, sel_prepareForReuse);
  -[_UIActivityUserDefaultsActivityCell activityImageSlotView](self, "activityImageSlotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContents:", 0);

  -[_UIActivityUserDefaultsActivityCell activityTitleView](self, "activityTitleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", 0);

  -[_UIActivityUserDefaultsActivityCell activityTitleLabel](self, "activityTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", 0);

  -[_UIActivityUserDefaultsActivityCell activityImageView](self, "activityImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", 0);

  -[_UIActivityUserDefaultsActivityCell setActivityProxy:](self, "setActivityProxy:", 0);
  -[_UIActivityUserDefaultsActivityCell setDisabled:](self, "setDisabled:", 0);
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[_UIActivityUserDefaultsActivityCell _updateImageDarkening](self, "_updateImageDarkening");
  }
}

- (void)_updateImageDarkening
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[_UIActivityUserDefaultsActivityCell activityImageSlotView](self, "activityImageSlotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaultsActivityCell activityImageSlotView](self, "activityImageSlotView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v5);

  if ((-[_UIActivityUserDefaultsActivityCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[_UIActivityUserDefaultsActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v6, "CGColor");
    v9 = 1;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  -[_UIActivityUserDefaultsActivityCell activityImageSlotView](self, "activityImageSlotView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentsMultiplyColor:", v8);

  if (v9)
  if ((-[_UIActivityUserDefaultsActivityCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[_UIActivityUserDefaultsActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v13, "CGColor"), CFSTR("inputColor"));

    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  -[_UIActivityUserDefaultsActivityCell activityImageView](self, "activityImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFilters:", v14);

}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
  objc_storeStrong((id *)&self->_activityImageView, a3);
}

- (UILabel)activityTitleLabel
{
  return self->_activityTitleLabel;
}

- (void)setActivityTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitleLabel, a3);
}

- (UIView)activityImageSlotView
{
  return self->_activityImageSlotView;
}

- (void)setActivityImageSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_activityImageSlotView, a3);
}

- (UIView)activityTitleView
{
  return self->_activityTitleView;
}

- (void)setActivityTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_activityTitleView, a3);
}

- (_UIUserDefaultsActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (NSLayoutConstraint)imageViewWidthConstraint
{
  return self->_imageViewWidthConstraint;
}

- (void)setImageViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, a3);
}

- (NSLayoutConstraint)imageViewLeadingConstraint
{
  return self->_imageViewLeadingConstraint;
}

- (void)setImageViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)labelLeadingConstraint
{
  return self->_labelLeadingConstraint;
}

- (void)setLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelLeadingConstraint, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_activityTitleView, 0);
  objc_storeStrong((id *)&self->_activityImageSlotView, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_titleLabelHeightAnchor, 0);
}

@end
