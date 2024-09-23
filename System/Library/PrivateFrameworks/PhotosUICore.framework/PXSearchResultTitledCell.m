@implementation PXSearchResultTitledCell

- (PXSearchResultTitledCell)initWithFrame:(CGRect)a3
{
  PXSearchResultTitledCell *v3;
  PXSearchResultTitledCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSearchResultTitledCell;
  v3 = -[PXSearchResultTitledCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXSearchResultTitledCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutMargins:", 10.0, 20.0, 10.0, 20.0);

    -[PXSearchResultTitledCell _setupSubviews](v4, "_setupSubviews");
  }
  return v4;
}

- (void)_setupSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  PXSearchResultTitledCell *v32;
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
  double v60;
  double v61;
  _BOOL4 v62;
  PXSearchResultTitledCell *v63;
  void *v64;
  void *v65;
  _BOOL4 v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;

  -[PXSearchResultTitledCell _setupImageView](self, "_setupImageView");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultTitledCell _setupTitleLabel](self, "_setupTitleLabel");
  v3 = objc_claimAutoreleasedReturnValue();
  -[PXSearchResultTitledCell _setupSubtitleLabel](self, "_setupSubtitleLabel");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PXSearchResultTitledCell _setupCountLabel](self, "_setupCountLabel");
  v5 = objc_claimAutoreleasedReturnValue();
  -[PXSearchResultTitledCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setDistribution:", 3);
  objc_msgSend(v7, "setAlignment:", 1);
  objc_msgSend(v7, "setAxis:", 1);
  objc_msgSend(v7, "setSpacing:", 4.0);
  v69 = (void *)v3;
  objc_msgSend(v7, "addArrangedSubview:", v3);
  v68 = (void *)v4;
  objc_msgSend(v7, "addArrangedSubview:", v4);
  objc_msgSend(v6, "addSubview:", v7);
  v70 = v6;
  objc_msgSend(v6, "addSubview:", v71);
  v62 = -[PXSearchResultTitledCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout");
  if (v62)
    objc_msgSend(v7, "addArrangedSubview:", v5);
  v64 = (void *)v5;
  v66 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v63 = self;
  -[PXSearchResultTitledCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v71, "centerYAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v7;
  objc_msgSend(v7, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v10, "initWithObjects:", v12, v15, v18, 0);

  objc_msgSend(v71, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
    v21 = v70;
  else
    v21 = v9;
  if (v66)
    v22 = 70.0;
  else
    v22 = 60.0;
  objc_msgSend(v21, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v19;
  objc_msgSend(v19, "addObject:", v24);

  if (v22 == *MEMORY[0x1E0C9D820] && (v26 = *(double *)(MEMORY[0x1E0C9D820] + 8), v22 == v26))
  {
    v27 = v9;
    LODWORD(v26) = 1148846080;
    objc_msgSend(v71, "setContentCompressionResistancePriority:forAxis:", 1, v26);
    LODWORD(v28) = 1148846080;
    objc_msgSend(v71, "setContentCompressionResistancePriority:forAxis:", 0, v28);
    v30 = 0;
    v32 = v63;
    v31 = v64;
    v33 = v25;
  }
  else
  {
    v27 = v9;
    objc_msgSend(v71, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", v22);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v19;
    objc_msgSend(v19, "addObject:", v35);

    objc_msgSend(v71, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "addObject:", v30);
    v32 = v63;
    v31 = v64;
  }
  if (v62)
  {
    v37 = v67;
    objc_msgSend(v67, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v40);

    objc_msgSend(v67, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v43);

    objc_msgSend(v67, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v46);

  }
  else
  {
    LODWORD(v29) = 1144750080;
    objc_msgSend(v30, "setPriority:", v29);
    objc_msgSend(v71, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      objc_msgSend(v70, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v49);

      objc_msgSend(v71, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v70;
    }
    else
    {
      objc_msgSend(v27, "topAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v53);

      objc_msgSend(v71, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v27;
    }
    objc_msgSend(v51, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintLessThanOrEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v55);

    v37 = v67;
    objc_msgSend(v67, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v58);

    objc_msgSend(v67, "widthAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintGreaterThanOrEqualToConstant:", 50.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v60) = 1148846080;
    objc_msgSend(v44, "setPriority:", v60);
    objc_msgSend(v33, "addObject:", v44);
    LODWORD(v61) = 1132068864;
    objc_msgSend(v67, "setContentCompressionResistancePriority:forAxis:", 0, v61);
  }

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v33);
  -[PXSearchResultTitledCell setThumbnailImageView:](v32, "setThumbnailImageView:", v71);
  -[PXSearchResultTitledCell setTitleLabel:](v32, "setTitleLabel:", v69);
  -[PXSearchResultTitledCell setSubtitleLabel:](v32, "setSubtitleLabel:", v68);
  -[PXSearchResultTitledCell setCountLabel:](v32, "setCountLabel:", v31);
  -[PXSearchResultTitledCell updateAccessories](v32, "updateAccessories");
  -[PXSearchResultTitledCell updateContentColors](v32, "updateContentColors");

}

- (id)_setupTitleLabel
{
  id v2;
  void *v3;
  NSString *v4;
  double v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    objc_msgSend(v2, "setNumberOfLines:", 0);
    LODWORD(v5) = 1.0;
    objc_msgSend(v2, "_setHyphenationFactor:", v5);
  }

  return v2;
}

- (id)_setupSubtitleLabel
{
  id v3;
  void *v4;
  void *v5;
  NSString *v6;
  double v7;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXSearchResultTitledCell subtitleLabelFont](self, "subtitleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v6))
  {
    objc_msgSend(v3, "setNumberOfLines:", 0);
    LODWORD(v7) = 1.0;
    objc_msgSend(v3, "_setHyphenationFactor:", v7);
  }
  objc_msgSend(v3, "setTextAlignment:", 4);

  return v3;
}

- (id)_setupCountLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  double v8;

  if (-[PXSearchResultTitledCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PXSearchResultTitledCell countLabelFont](self, "countLabelFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFont:", v4);

    -[PXSearchResultTitledCell countString](self, "countString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v5);

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeCategory");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (UIContentSizeCategoryIsAccessibilityCategory(v7))
    {
      objc_msgSend(v3, "setNumberOfLines:", 0);
      LODWORD(v8) = 1.0;
      objc_msgSend(v3, "_setHyphenationFactor:", v8);
    }
    objc_msgSend(v3, "setTextAlignment:", 4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_setupImageView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "setContentMode:", 2);
  objc_msgSend(v2, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "setAccessibilityIgnoresInvertColors:", 1);
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  CGFloat v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchResultTitledCell;
  -[PXSearchResultTitledCell layoutSubviews](&v8, sel_layoutSubviews);
  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    || -[PXSearchResultTitledCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout"))
  {
    -[PXSearchResultTitledCell thumbnailImageView](self, "thumbnailImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXSearchResultTitledCell searchResultType](self, "searchResultType") == 3
      || -[PXSearchResultTitledCell searchResultType](self, "searchResultType") == 4)
    {
      objc_msgSend(v3, "bounds");
      v4 = CGRectGetWidth(v9) * 0.5;
      objc_msgSend(v3, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = v4;
    }
    else
    {
      objc_msgSend(v3, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 4.0;
    }
    objc_msgSend(v5, "setCornerRadius:", v7);

  }
}

- (id)titleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)italicTitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32769, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subtitleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4AB8], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)countLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureWithResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "assetCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "type") == 3
    && (objc_msgSend(v5, "title"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", &stru_1E5149688),
        v11,
        v12))
  {
    v13 = CFSTR("SEARCH_UNNAMED_RESULTS_PERSON_TITLE");
  }
  else
  {
    if (objc_msgSend(v5, "type") != 4
      || (objc_msgSend(v5, "title"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E5149688),
          v14,
          !v15))
    {
      -[PXSearchResultTitledCell titleLabelFont](self, "titleLabelFont");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v13 = CFSTR("SEARCH_UNNAMED_RESULTS_PET_TITLE");
  }
  PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
  v16 = objc_claimAutoreleasedReturnValue();

  -[PXSearchResultTitledCell italicTitleLabelFont](self, "italicTitleLabelFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v16;
LABEL_9:
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  v31 = *MEMORY[0x1E0DC1138];
  v32[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v6, v19);
  -[PXSearchResultTitledCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedText:", v20);

  -[PXSearchResultTitledCell subtitleLabel](self, "subtitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v7);

  -[PXSearchResultTitledCell setCountString:](self, "setCountString:", v10);
  -[PXSearchResultTitledCell setSearchResultType:](self, "setSearchResultType:", objc_msgSend(v5, "type"));
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    && objc_msgSend(v5, "type") == 2)
  {
    v23 = v5;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_13:
        v24 = objc_msgSend(v23, "subtype");

        -[PXSearchResultTitledCell setWantsPlayButton:](self, "setWantsPlayButton:", v24 == 3);
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "px_descriptionForAssertionMessage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v30;
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultTitledCell.m"), 304, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("searchResult"), v27, v29);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultTitledCell.m"), 304, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("searchResult"), v27);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (void)setCountString:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_countString;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_countString, a3);
      -[PXSearchResultTitledCell updateAccessories](self, "updateAccessories");
    }
  }

}

- (void)setWantsPlayButton:(BOOL)a3
{
  if (self->_wantsPlayButton != a3)
  {
    self->_wantsPlayButton = a3;
    -[PXSearchResultTitledCell updateAccessories](self, "updateAccessories");
  }
}

- (NSString)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;

  -[PXSearchResultTitledCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXSearchResultTitledCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E5149688;
  }

  -[PXSearchResultTitledCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PXSearchResultTitledCell subtitleLabel](self, "subtitleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E5149688;
  }

  -[PXSearchResultTitledCell countLabel](self, "countLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[PXSearchResultTitledCell countLabel](self, "countLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "text");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = &stru_1E5149688;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@,%@"), v8, v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultTitledCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[PXSearchResultTitledCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[PXSearchResultTitledCell _setupSubviews](self, "_setupSubviews");
  }
}

- (BOOL)shouldUseAccessibilityLayout
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  -[PXSearchResultTitledCell traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchResultTitledCell;
  -[PXSearchResultTitledCell prepareForReuse](&v6, sel_prepareForReuse);
  -[PXSearchResultTitledCell thumbnailImageView](self, "thumbnailImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[PXSearchResultTitledCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", 0);

  -[PXSearchResultTitledCell subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

  -[PXSearchResultTitledCell setCountString:](self, "setCountString:", 0);
  -[PXSearchResultTitledCell setWantsPlayButton:](self, "setWantsPlayButton:", 0);
}

- (void)updateAccessories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if (-[PXSearchResultTitledCell wantsPlayButton](self, "wantsPlayButton"))
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 30.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithPaletteColors:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configurationByApplyingConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("play.circle.fill"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v10);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v11, 1);
    v17 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultTitledCell setAccessories:](self, "setAccessories:", v13);

    goto LABEL_7;
  }
  -[PXSearchResultTitledCell countString](self, "countString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PXSearchResultTitledCell shouldUseAccessibilityLayout](self, "shouldUseAccessibilityLayout"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0DC3568]);
    if (!objc_msgSend(v9, "length"))
    {
      v15 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultTitledCell setAccessories:](self, "setAccessories:", v11);
      goto LABEL_8;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v9);
    v16[0] = v11;
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultTitledCell setAccessories:](self, "setAccessories:", v12);
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  -[PXSearchResultTitledCell countLabel](self, "countLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v9);

LABEL_9:
}

- (void)updateContentColors
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
  id v12;

  if (-[PXSearchResultTitledCell isFocused](self, "isFocused"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultTitledCell titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultTitledCell subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultTitledCell titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchResultTitledCell subtitleLabel](self, "subtitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultTitledCell countLabel](self, "countLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v12);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  PXSearchResultTitledCell *v7;
  PXSearchResultTitledCell *v8;
  PXSearchResultTitledCell *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchResultTitledCell;
  -[PXSearchResultTitledCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (PXSearchResultTitledCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    -[PXSearchResultTitledCell updateContentColors](self, "updateContentColors");
    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (PXSearchResultTitledCell *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC34D8];
  v5 = a3;
  objc_msgSend(v4, "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedConfigurationForState:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "isFocused");
  if ((_DWORD)v6)
    objc_msgSend(v7, "setBackgroundColorTransformer:", 0);
  -[PXSearchResultTitledCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v7);

}

- (CGSize)thumbnailImageViewPixelSize
{
  void *v3;
  double v4;
  double v5;
  CGSize result;

  -[PXSearchResultTitledCell thumbnailImageView](self, "thumbnailImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");

  -[PXSearchResultTitledCell px_screenScale](self, "px_screenScale");
  PXSizeScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setThumbnailImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchResultTitledCell thumbnailImageView](self, "thumbnailImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (void)setThumbnailImageView:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (NSString)countString
{
  return self->_countString;
}

- (unint64_t)searchResultType
{
  return self->_searchResultType;
}

- (void)setSearchResultType:(unint64_t)a3
{
  self->_searchResultType = a3;
}

- (BOOL)wantsPlayButton
{
  return self->_wantsPlayButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countString, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
}

@end
