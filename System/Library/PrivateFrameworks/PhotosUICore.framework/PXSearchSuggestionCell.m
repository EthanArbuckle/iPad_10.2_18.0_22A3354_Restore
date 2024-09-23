@implementation PXSearchSuggestionCell

- (PXSearchSuggestionCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXSearchSuggestionCell *v7;
  PXSearchSuggestionCell *v8;
  void *v9;
  uint64_t v10;
  UIImageView *imageView;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  UILabel *titleLabel;
  void *v16;
  uint64_t v17;
  UILabel *countLabel;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  UIStackView *textStackView;
  uint64_t v26;
  UILayoutGuide *imageViewLayoutGuide;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *imageViewLayoutGuideWidthConstraint;
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
  objc_super v77;
  _QWORD v78[12];
  _QWORD v79[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v79[2] = *MEMORY[0x1E0C80C00];
  v77.receiver = self;
  v77.super_class = (Class)PXSearchSuggestionCell;
  v7 = -[PXSearchSuggestionCell initWithFrame:](&v77, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[PXSearchSuggestionCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", x, y, width, height);
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v8->_imageView, "setContentMode:", 4);
    v12 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4A88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v8->_imageView, "setPreferredSymbolConfiguration:", v13);

    objc_msgSend(v9, "addSubview:", v8->_imageView);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = (UILabel *)v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    PXFontWithTextStyleSymbolicTraits();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_titleLabel, "setFont:", v16);

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    countLabel = v8->_countLabel;
    v8->_countLabel = (UILabel *)v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_countLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_countLabel, "setFont:", v19);

    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_countLabel, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v20) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v8->_countLabel, "setContentHuggingPriority:forAxis:", 0, v20);
    LODWORD(v21) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_countLabel, "setContentCompressionResistancePriority:forAxis:", 0, v21);
    v22 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v79[0] = v8->_titleLabel;
    v79[1] = v8->_countLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithArrangedSubviews:", v23);
    textStackView = v8->_textStackView;
    v8->_textStackView = (UIStackView *)v24;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v8->_textStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](v8->_textStackView, "setAlignment:", 1);
    -[UIStackView setDistribution:](v8->_textStackView, "setDistribution:", 0);
    -[UIStackView setAxis:](v8->_textStackView, "setAxis:", 0);
    -[UIStackView setSpacing:](v8->_textStackView, "setSpacing:", 8.0);
    objc_msgSend(v9, "addSubview:", v8->_textStackView);
    v26 = objc_opt_new();
    imageViewLayoutGuide = v8->_imageViewLayoutGuide;
    v8->_imageViewLayoutGuide = (UILayoutGuide *)v26;

    objc_msgSend(v9, "addLayoutGuide:", v8->_imageViewLayoutGuide);
    PXEdgeInsetsMake();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[UILayoutGuide widthAnchor](v8->_imageViewLayoutGuide, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchSuggestionCell imageViewLayoutGuideWidth](v8, "imageViewLayoutGuideWidth");
    objc_msgSend(v36, "constraintEqualToConstant:");
    v37 = objc_claimAutoreleasedReturnValue();
    imageViewLayoutGuideWidthConstraint = v8->_imageViewLayoutGuideWidthConstraint;
    v8->_imageViewLayoutGuideWidthConstraint = (NSLayoutConstraint *)v37;

    -[UIImageView leadingAnchor](v8->_imageView, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](v8->_imageViewLayoutGuide, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v75);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v74;
    -[UIImageView trailingAnchor](v8->_imageView, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v8->_imageViewLayoutGuide, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v71;
    -[UIImageView heightAnchor](v8->_imageView, "heightAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView widthAnchor](v8->_imageView, "widthAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v68;
    -[UIImageView firstBaselineAnchor](v8->_imageView, "firstBaselineAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel firstBaselineAnchor](v8->_titleLabel, "firstBaselineAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v65;
    -[UIStackView leadingAnchor](v8->_textStackView, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v8->_imageViewLayoutGuide, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 8.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v78[4] = v62;
    -[UIStackView trailingAnchor](v8->_textStackView, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, v35);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v78[5] = v58;
    -[UIStackView topAnchor](v8->_textStackView, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, v29);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v78[6] = v55;
    -[UIStackView bottomAnchor](v8->_textStackView, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, v33);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v78[7] = v51;
    -[UILayoutGuide leadingAnchor](v8->_imageViewLayoutGuide, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, v31);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v78[8] = v41;
    v78[9] = v8->_imageViewLayoutGuideWidthConstraint;
    -[UILayoutGuide topAnchor](v8->_imageViewLayoutGuide, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v9;
    objc_msgSend(v9, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v78[10] = v44;
    -[UILayoutGuide bottomAnchor](v8->_imageViewLayoutGuide, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v78[11] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 12);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v54);
    -[PXSearchSuggestionCell _updateContentColors](v8, "_updateContentColors");
    -[PXSearchSuggestionCell traitCollection](v8, "traitCollection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "preferredContentSizeCategory");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchSuggestionCell _updateLayoutWithContentSizeCategory:](v8, "_updateLayoutWithContentSizeCategory:", v49);

  }
  return v8;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSearchSuggestionCell;
  -[PXSearchSuggestionCell prepareForReuse](&v6, sel_prepareForReuse);
  -[PXSearchSuggestionCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

  -[PXSearchSuggestionCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  -[PXSearchSuggestionCell countLabel](self, "countLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchSuggestionCell;
  v4 = a3;
  -[PXSearchSuggestionCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PXSearchSuggestionCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
    -[PXSearchSuggestionCell _updateLayoutWithContentSizeCategory:](self, "_updateLayoutWithContentSizeCategory:", v6);

}

- (double)imageViewLayoutGuideWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3 + 5.0;

  return v4;
}

- (void)setSearchSuggestion:(id)a3
{
  id v5;
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
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchSuggestionCell.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchSuggestion"));

  }
  objc_msgSend(v5, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchSuggestionCell imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  objc_msgSend(v5, "attributedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v18 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttributes:range:", v11, 0, objc_msgSend(v9, "length"));

  -[PXSearchSuggestionCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAttributedText:", v9);

  if (objc_msgSend(v5, "count"))
  {
    v13 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchSuggestionCell countLabel](self, "countLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  else
  {
    -[PXSearchSuggestionCell countLabel](self, "countLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", 0);
  }

}

- (void)_updateLayoutWithContentSizeCategory:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  -[PXSearchSuggestionCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v5, "setNumberOfLines:", 0);

    -[PXSearchSuggestionCell textStackView](self, "textStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "setNumberOfLines:", 1);

    -[PXSearchSuggestionCell textStackView](self, "textStackView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "setAxis:", v9);

  -[PXSearchSuggestionCell imageViewLayoutGuideWidth](self, "imageViewLayoutGuideWidth");
  v11 = v10;
  -[PXSearchSuggestionCell imageViewLayoutGuideWidthConstraint](self, "imageViewLayoutGuideWidthConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

  -[PXSearchSuggestionCell layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_updateContentColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PXSearchSuggestionCell isFocused](self, "isFocused"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v3);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  }
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_countLabel, "setTextColor:", v7);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  PXSearchSuggestionCell *v7;
  PXSearchSuggestionCell *v8;
  PXSearchSuggestionCell *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXSearchSuggestionCell;
  -[PXSearchSuggestionCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (PXSearchSuggestionCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    -[PXSearchSuggestionCell _updateContentColors](self, "_updateContentColors");
    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (PXSearchSuggestionCell *)objc_claimAutoreleasedReturnValue();

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
  -[PXSearchSuggestionCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v7);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (UIStackView)textStackView
{
  return self->_textStackView;
}

- (UILayoutGuide)imageViewLayoutGuide
{
  return self->_imageViewLayoutGuide;
}

- (NSLayoutConstraint)imageViewLayoutGuideWidthConstraint
{
  return self->_imageViewLayoutGuideWidthConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
