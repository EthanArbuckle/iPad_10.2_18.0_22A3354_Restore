@implementation UIShareGroupActivityCell

- (id)_placeholderString
{
  void *v2;
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  __CFString *v5;

  -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  v5 = CFSTR("Apple\nInc");
  if (IsAccessibilityCategory)
    v5 = CFSTR("Apple\nInc\n");
  return v5;
}

- (id)_titleLabelFont
{
  id SFUIShareSheetActivityCellSpecClass_0;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "titleLabelFontTextStyleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSString *)*MEMORY[0x1E0DC48F0];
  -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIContentSizeCategoryCompareToCategory(v6, v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0DC37F0];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC48F8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v13, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_createTitleLabel
{
  void *v3;
  id SFUIShareSheetActivityCellSpecClass_0;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v12;
  double v13;

  -[UIShareGroupActivityCell _placeholderString](self, "_placeholderString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "titleLabelFontTextStyleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UIShareGroupActivityCell _titleLabelFont](self, "_titleLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v8);

  -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (IsAccessibilityCategory)
    v12 = 4;
  else
    v12 = 1;
  objc_msgSend(v7, "setTextAlignment:", v12);
  objc_msgSend(v7, "setNumberOfLines:", 0);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v13) = 0;
  objc_msgSend(v7, "_setHyphenationFactor:", v13);
  objc_msgSend(v7, "setText:", v3);
  objc_msgSend(v7, "setAlpha:", 0.0);

  return v7;
}

- (void)_installSubviewsIfNeeded
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
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
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
  id v49;
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
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id SFUIShareSheetActivityCellSpecClass_0;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;

  if (!-[UIShareGroupActivityCell didInstallSubviews](self, "didInstallSubviews"))
  {
    -[UIShareGroupActivityCell setDidInstallSubviews:](self, "setDidInstallSubviews:", 1);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F08], "effectForBlurEffect:style:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v3);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIShareGroupActivityCell setVibrantLabelView:](self, "setVibrantLabelView:", v4);
    -[UIShareGroupActivityCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[UIShareGroupActivityCell _createTitleLabel](self, "_createTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell setTitleLabel:](self, "setTitleLabel:", v7);

    -[UIShareGroupActivityCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[UIShareGroupActivityCell _createTitleLabel](self, "_createTitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell setLabelForPositioning:](self, "setLabelForPositioning:", v10);

    -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    v17 = 13.5;
    if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(v14, "continuousCornerRadius");
      v17 = v18;
    }
    v19 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIShareGroupActivityCell setImageSlotView:](self, "setImageSlotView:", v19);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 0.0);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setClipsToBounds:", 1);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", v17);

    v25 = *MEMORY[0x1E0CD2A68];
    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerCurve:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setShadowColor:", v29);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = 1032805417;
    objc_msgSend(v33, "setShadowOpacity:", v34);

    v35 = *MEMORY[0x1E0C9D820];
    v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setShadowOffset:", v35, v36);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShadowRadius:", 10.0);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setShadowPathIsBounds:", 1);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setShouldRasterize:", 0);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMasksToBounds:", 0);

    -[UIShareGroupActivityCell contentView](self, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addSubview:", v48);

    v49 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    -[UIShareGroupActivityCell setActivityImageView:](self, "setActivityImageView:", v49);

    -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    SHSheetUISpecPlaceholderColor(objc_msgSend(v50, "userInterfaceStyle"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setBackgroundColor:", v51);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setClipsToBounds:", 1);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setContentMode:", 2);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setCornerRadius:", v17);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setCornerCurve:", v25);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setShadowOffset:", v35, v36);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layer");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setShadowRadius:", 10.0);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layer");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setShadowPathIsBounds:", 1);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "layer");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setShouldRasterize:", 0);

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "layer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setMasksToBounds:", 0);

    -[UIShareGroupActivityCell contentView](self, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addSubview:", v71);

    v72 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIShareGroupActivityCell setTitleSlotView:](self, "setTitleSlotView:", v72);

    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setAlpha:", 0.0);

    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "addSubview:", v77);

    v78 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UIShareGroupActivityCell setBadgeSlotView:](self, "setBadgeSlotView:", v78);

    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setAlpha:", 0.0);

    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setBackgroundColor:", v81);

    SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "nearbyAirDropBadgeSizeForIdiom:", objc_msgSend(v84, "userInterfaceIdiom"));
    v86 = v85 * 0.5;
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "layer");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setCornerRadius:", v86);

    -[UIShareGroupActivityCell contentView](self, "contentView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addSubview:", v90);

    -[UIShareGroupActivityCell _configureImageViewForPlaceholder:](self, "_configureImageViewForPlaceholder:", 1);
    -[UIShareGroupActivityCell setupConstraints](self, "setupConstraints");

  }
}

- (void)_setLayoutSpec:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIShareGroupActivityCell setLayoutSpec:](self, "setLayoutSpec:", v4);
  v5 = objc_msgSend(v4, "deviceClass");

  v6 = &regularHeight5_8Rounded_1;
  v7 = &regularHeight_1;
  if (v5 == 10)
    v7 = &visionLarge_0;
  if (v5 == 9)
    v7 = &visionCompact_0;
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    v7 = &compactHeight_1;
  if (v5 != 3)
    v6 = v7;
  layout_1 = (uint64_t)v6;
}

- (void)configureLayoutIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIShareGroupActivityCell layoutSpec](self, "layoutSpec");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell _setLayoutSpec:](self, "_setLayoutSpec:", v8);
  if (!-[UIShareGroupActivityCell didInstallSubviews](self, "didInstallSubviews"))
  {
    -[UIShareGroupActivityCell _installSubviewsIfNeeded](self, "_installSubviewsIfNeeded");
    goto LABEL_5;
  }
  v5 = v8;
  if (v4 != v8)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[UIShareGroupActivityCell allConstraints](self, "allConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deactivateConstraints:", v7);

    -[UIShareGroupActivityCell setupConstraints](self, "setupConstraints");
LABEL_5:
    v5 = v8;
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIShareGroupActivityCell;
  -[UIShareGroupActivityCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UIShareGroupActivityCell setImage:](self, "setImage:", 0);
  -[UIShareGroupActivityCell setImageSlotID:](self, "setImageSlotID:", 0);
  -[UIShareGroupActivityCell _configureImageViewForPlaceholder:](self, "_configureImageViewForPlaceholder:", 1);
  -[UIShareGroupActivityCell stopPulsing](self, "stopPulsing");
}

- (void)setupConstraints
{
  void *v3;
  double v4;
  double v5;
  id SFUIShareSheetActivityCellSpecClass_0;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSString *v11;
  _BOOL4 IsAccessibilityCategory;
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
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  _BOOL4 v168;
  void *v169;
  void *v170;
  _QWORD v171[6];
  _QWORD v172[10];
  _QWORD v173[20];

  v173[18] = *MEMORY[0x1E0C80C00];
  -[UIShareGroupActivityCell contentView](self, "contentView");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell layoutSpec](self, "layoutSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharingAppIconWidth");
  v5 = v4;

  SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "nearbyAirDropBadgeSizeForIdiom:", objc_msgSend(v7, "userInterfaceIdiom"));
  v9 = v8;

  -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

  v168 = IsAccessibilityCategory;
  if (IsAccessibilityCategory)
    -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  else
    -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99DE8];
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "widthAnchor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "constraintEqualToConstant:", v5);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v173[0] = v159;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "heightAnchor");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v153, "constraintEqualToConstant:", v5);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v173[1] = v150;
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "widthAnchor");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "widthAnchor");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "constraintEqualToAnchor:", v138);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v173[2] = v135;
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "heightAnchor");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "heightAnchor");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "constraintEqualToAnchor:", v123);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v173[3] = v120;
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "centerXAnchor");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "centerXAnchor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "constraintEqualToAnchor:", v110);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v173[4] = v108;
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "centerYAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "centerYAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintEqualToAnchor:", v100);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v173[5] = v98;
  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "centerXAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "constraintEqualToAnchor:", v92);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v173[6] = v90;
  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "centerYAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:", v84);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v173[7] = v82;
  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "heightAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:", v76);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v173[8] = v75;
  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "widthAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "widthAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:", v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v173[9] = v71;
  -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "centerXAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v173[10] = v67;
  -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerYAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v173[11] = v63;
  -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "heightAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v173[12] = v59;
  -[UIShareGroupActivityCell vibrantLabelView](self, "vibrantLabelView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "widthAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = v13;
  objc_msgSend(v13, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v173[13] = v55;
  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, *(double *)(layout_1 + 32));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v173[14] = v50;
  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, *(double *)(layout_1 + 24));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v173[15] = v15;
  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v173[16] = v18;
  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v173[17] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell setAllConstraints:](self, "setAllConstraints:", v23);

  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "topAnchor");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "topAnchor");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "constraintGreaterThanOrEqualToAnchor:constant:", v160, 8.0);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v172[0] = v157;
  objc_msgSend(v170, "bottomAnchor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "bottomAnchor");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "constraintGreaterThanOrEqualToAnchor:constant:", v148, 8.0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v172[1] = v145;
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "centerYAnchor");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "centerYAnchor");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "constraintEqualToAnchor:", v133);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v172[2] = v130;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "leadingAnchor");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "leadingAnchor");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "constraintEqualToAnchor:constant:", v121, 0.0);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v172[3] = v118;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "centerYAnchor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "centerYAnchor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "constraintEqualToAnchor:", v111);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v172[4] = v109;
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "trailingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "trailingAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v103);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v172[5] = v101;
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "leadingAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "trailingAnchor");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "constraintEqualToAnchor:constant:", v93, 14.0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v172[6] = v91;
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "leadingAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintEqualToAnchor:", v83);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v172[7] = v81;
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "trailingAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v172[8] = v26;
  -[UIShareGroupActivityCell labelForPositioning](self, "labelForPositioning");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v172[9] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v172, 10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell setLargeTextConstraints:](self, "setLargeTextConstraints:", v32);

  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "centerXAnchor");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "centerXAnchor");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "constraintEqualToAnchor:", v161);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v171[0] = v158;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v155, "centerXAnchor");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "centerXAnchor");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "constraintEqualToAnchor:", v146);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v171[1] = v143;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "topAnchor");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "topAnchor");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "constraintEqualToAnchor:constant:", v134, *(double *)layout_1);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v171[2] = v131;
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "widthAnchor");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "widthAnchor");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "constraintEqualToAnchor:constant:", v122, *(double *)(layout_1 + 40));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v171[3] = v119;
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, *(double *)(layout_1 + 8));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v171[4] = v36;
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:constant:", v39, *(double *)(layout_1 + 16));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v171[5] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell setRegularConstraints:](self, "setRegularConstraints:", v41);

  -[UIShareGroupActivityCell allConstraints](self, "allConstraints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v168)
    -[UIShareGroupActivityCell largeTextConstraints](self, "largeTextConstraints");
  else
    -[UIShareGroupActivityCell regularConstraints](self, "regularConstraints");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addObjectsFromArray:", v43);

  v44 = (void *)MEMORY[0x1E0CB3718];
  -[UIShareGroupActivityCell allConstraints](self, "allConstraints");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v45);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIShareGroupActivityCell;
  v4 = a3;
  -[UIShareGroupActivityCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[UIShareGroupActivityCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[UIShareGroupActivityCell _updateConstraints](self, "_updateConstraints");
}

- (id)createTargetedPreview
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIShareGroupActivityCell image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  else
    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  objc_msgSend(v6, "setVisiblePath:", v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v4, v6);

  return v7;
}

- (void)_configureImageViewForPlaceholder:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v4 = a3;
  if (a3)
  {
    v6 = 1.0;
  }
  else
  {
    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v6 = v7;
  }
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v6);

  if (v4)
  {
    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setShadowOpacity:", v11);

    -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SHSheetUISpecPlaceholderColor(objc_msgSend(v12, "userInterfaceStyle"));
  }
  else
  {

    -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = 1032805417;
    objc_msgSend(v13, "setShadowOpacity:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  }
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  if (v4)
  {

    v16 = v12;
  }

}

- (void)_updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[UIShareGroupActivityCell _titleLabelFont](self, "_titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
    v8 = 4;
  else
    v8 = 1;
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextAlignment:", v8);

  v10 = (void *)MEMORY[0x1E0CB3718];
  if (IsAccessibilityCategory)
  {
    -[UIShareGroupActivityCell regularConstraints](self, "regularConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateConstraints:", v11);

    v12 = (void *)MEMORY[0x1E0CB3718];
    -[UIShareGroupActivityCell largeTextConstraints](self, "largeTextConstraints");
  }
  else
  {
    -[UIShareGroupActivityCell largeTextConstraints](self, "largeTextConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deactivateConstraints:", v13);

    v12 = (void *)MEMORY[0x1E0CB3718];
    -[UIShareGroupActivityCell regularConstraints](self, "regularConstraints");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v14);

  -[UIShareGroupActivityCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_disabled != a3)
  {
    v3 = a3;
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[UIShareGroupActivityCell identifier](self, "identifier");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = "no";
      if (v3)
        v8 = "yes";
      v9 = 138412546;
      v10 = v6;
      v11 = 2080;
      v12 = v8;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Updating Activity Cell with identifier:%@ to disabled:%s", (uint8_t *)&v9, 0x16u);

    }
    self->_disabled = v3;
    -[UIShareGroupActivityCell _updateDarkening](self, "_updateDarkening");
  }
}

- (void)_updateDarkening
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
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContents:", v5);

  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContents:", v8);

  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContents:", v11);

  if ((-[UIShareGroupActivityCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIShareGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v16, "CGColor");
    v19 = 1;
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentsMultiplyColor:", v18);

  if (v19)
  if ((-[UIShareGroupActivityCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[UIShareGroupActivityCell isDisabled](self, "isDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "setValue:forKey:", objc_msgSend(v23, "CGColor"), CFSTR("inputColor"));

    v27[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFilters:", v24);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[UIShareGroupActivityCell isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIShareGroupActivityCell;
    -[UIShareGroupActivityCell setHighlighted:](&v5, sel_setHighlighted_, v3);
    -[UIShareGroupActivityCell _updateDarkening](self, "_updateDarkening");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
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
  objc_super v20;

  v3 = a3;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)UIShareGroupActivityCell;
  -[UIShareGroupActivityCell setSelected:](&v20, sel_setSelected_, v3);
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContents:", v7);

  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContents:", v10);

  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContents:", v13);

}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *title;
  NSString *v7;
  char v8;
  NSString *v9;

  v5 = a3;
  title = self->_title;
  v9 = (NSString *)v5;
  v7 = title;
  if (v7 == v9)
  {

  }
  else
  {
    if ((v9 == 0) != (v7 != 0))
    {
      v8 = -[NSString isEqual:](v9, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_title, a3);
    -[UIShareGroupActivityCell _updateTitleView](self, "_updateTitleView");
  }
LABEL_8:

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[UIShareGroupActivityCell _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setImageSlotID:(unsigned int)a3
{
  if (self->_imageSlotID != a3)
  {
    self->_imageSlotID = a3;
    -[UIShareGroupActivityCell _updateImageView](self, "_updateImageView");
  }
}

- (void)setTitleSlotID:(unsigned int)a3
{
  if (self->_titleSlotID != a3)
  {
    self->_titleSlotID = a3;
    -[UIShareGroupActivityCell _updateTitleView](self, "_updateTitleView");
  }
}

- (void)setBadgeSlotID:(unsigned int)a3
{
  if (self->_badgeSlotID != a3)
  {
    self->_badgeSlotID = a3;
    -[UIShareGroupActivityCell _updateBadgeSlotView](self, "_updateBadgeSlotView");
  }
}

- (void)startPulsing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  if (!-[UIShareGroupActivityCell isPulsing](self, "isPulsing"))
  {
    -[UIShareGroupActivityCell setIsPulsing:](self, "setIsPulsing:", 1);
    -[UIShareGroupActivityCell title](self, "title");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
    else
      -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAlpha:", 1.0);
    v5 = (void *)MEMORY[0x1E0DC3F10];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__UIShareGroupActivityCell_startPulsing__block_invoke;
    v7[3] = &unk_1E4001608;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 24, v7, 0, 0.75, 0.0);

  }
}

uint64_t __40__UIShareGroupActivityCell_startPulsing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.2);
}

- (void)stopPulsing
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  if (-[UIShareGroupActivityCell isPulsing](self, "isPulsing"))
  {
    -[UIShareGroupActivityCell setIsPulsing:](self, "setIsPulsing:", 0);
    -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAnimations");

    -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alpha");
    v7 = v6;

    if (v7 > 0.0)
    {
      -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

    }
    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllAnimations");

    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alpha");
    v13 = v12;

    if (v13 > 0.0)
    {
      -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAlpha:", 1.0);

    }
  }
}

- (void)_updateImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  void *v11;
  double v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  -[UIShareGroupActivityCell _configureImageViewForPlaceholder:](self, "_configureImageViewForPlaceholder:", 0);
  -[UIShareGroupActivityCell image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  -[UIShareGroupActivityCell image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0.0;
  if (v5)
  {
    v8 = 1.0;
    v9 = 0.07;
  }
  else
  {
    v9 = 0.0;
  }
  objc_msgSend(v6, "setAlpha:", v8);

  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = v9;
  objc_msgSend(v11, "setShadowOpacity:", v12);

  v13 = -[UIShareGroupActivityCell imageSlotID](self, "imageSlotID");
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[UIShareGroupActivityCell imageSlotID](self, "imageSlotID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CD2F88];
    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentsGravity:", v15);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContents:", v14);

    -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBackgroundColor:", 0);
LABEL_6:

    goto LABEL_11;
  }
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContents:", 0);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;
  }
  else
  {
    -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SHSheetUISpecPlaceholderColor(objc_msgSend(v14, "userInterfaceStyle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIShareGroupActivityCell activityImageView](self, "activityImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v20);

  if (!v5)
    goto LABEL_6;
LABEL_11:

  if (v13)
    v24 = 1.0;
  else
    v24 = 0.0;
  -[UIShareGroupActivityCell imageSlotView](self, "imageSlotView");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAlpha:", v24);

}

- (void)_updateTitleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSString *v13;
  _BOOL4 IsAccessibilityCategory;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  id v31;

  -[UIShareGroupActivityCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[UIShareGroupActivityCell title](self, "title");
  else
    -[UIShareGroupActivityCell _placeholderString](self, "_placeholderString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  if (v4)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[UIShareGroupActivityCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

  v9 = -[UIShareGroupActivityCell titleSlotID](self, "titleSlotID");
  if (v9)
  {
    -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "layoutDirection");

    -[UIShareGroupActivityCell traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v15 = (id *)MEMORY[0x1E0CD2FA0];
    if (v11 != 1)
      v15 = (id *)MEMORY[0x1E0CD2F80];
    v16 = (void *)MEMORY[0x1E0CD2720];
    v17 = *v15;
    objc_msgSend(v16, "objectForSlot:", -[UIShareGroupActivityCell titleSlotID](self, "titleSlotID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _ShareSheetDeviceScreenScale();
    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentsScale:", v19);

    v22 = _ShareSheetDeviceScreenScale();
    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRasterizationScale:", v22);

    if (IsAccessibilityCategory)
      v25 = v17;
    else
      v25 = (id)*MEMORY[0x1E0CD2F60];
    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setContentsGravity:", v25);

    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setContents:", v18);

  }
  else
  {
    -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContents:", 0);
  }

  if (v9)
    v30 = 1.0;
  else
    v30 = 0.0;
  -[UIShareGroupActivityCell titleSlotView](self, "titleSlotView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", v30);

}

- (void)_updateBadgeSlotView
{
  unsigned int v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v3 = -[UIShareGroupActivityCell badgeSlotID](self, "badgeSlotID");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", -[UIShareGroupActivityCell badgeSlotID](self, "badgeSlotID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _ShareSheetDeviceScreenScale();
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentsScale:", v5);

    v8 = _ShareSheetDeviceScreenScale();
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRasterizationScale:", v8);

    v11 = *MEMORY[0x1E0CD2F78];
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentsGravity:", v11);

    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContents:", v4);

  }
  else
  {
    -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContents:", 0);
  }

  if (v3)
    v16 = 1.0;
  else
    v16 = 0.0;
  -[UIShareGroupActivityCell badgeSlotView](self, "badgeSlotView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v16);

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (_UIHostActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void)setActivityProxy:(id)a3
{
  objc_storeStrong((id *)&self->_activityProxy, a3);
}

- (unsigned)imageSlotID
{
  return self->_imageSlotID;
}

- (unsigned)titleSlotID
{
  return self->_titleSlotID;
}

- (unsigned)badgeSlotID
{
  return self->_badgeSlotID;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isLongPressable
{
  return self->_longPressable;
}

- (void)setLongPressable:(BOOL)a3
{
  self->_longPressable = a3;
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void)setIsPulsing:(BOOL)a3
{
  self->_isPulsing = a3;
}

- (BOOL)didInstallSubviews
{
  return self->_didInstallSubviews;
}

- (void)setDidInstallSubviews:(BOOL)a3
{
  self->_didInstallSubviews = a3;
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  return (SHSheetContentLayoutSpec *)objc_loadWeakRetained((id *)&self->_layoutSpec);
}

- (void)setLayoutSpec:(id)a3
{
  objc_storeWeak((id *)&self->_layoutSpec, a3);
}

- (UIVisualEffectView)vibrantLabelView
{
  return self->_vibrantLabelView;
}

- (void)setVibrantLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrantLabelView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)labelForPositioning
{
  return self->_labelForPositioning;
}

- (void)setLabelForPositioning:(id)a3
{
  objc_storeStrong((id *)&self->_labelForPositioning, a3);
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
  objc_storeStrong((id *)&self->_activityImageView, a3);
}

- (UIView)imageSlotView
{
  return self->_imageSlotView;
}

- (void)setImageSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_imageSlotView, a3);
}

- (UIView)titleSlotView
{
  return self->_titleSlotView;
}

- (void)setTitleSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_titleSlotView, a3);
}

- (UIView)badgeSlotView
{
  return self->_badgeSlotView;
}

- (void)setBadgeSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeSlotView, a3);
}

- (NSMutableArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_allConstraints, a3);
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_regularConstraints, a3);
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_largeTextConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_badgeSlotView, 0);
  objc_storeStrong((id *)&self->_titleSlotView, 0);
  objc_storeStrong((id *)&self->_imageSlotView, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_labelForPositioning, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_vibrantLabelView, 0);
  objc_destroyWeak((id *)&self->_layoutSpec);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
