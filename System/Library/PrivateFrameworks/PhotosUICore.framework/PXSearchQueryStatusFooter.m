@implementation PXSearchQueryStatusFooter

- (PXSearchQueryStatusFooter)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PXSearchQueryStatusFooter *result;
  objc_class *v8;
  PXSearchQueryStatusFooter *v9;
  uint64_t v10;
  UILabel *titleLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UILabel *detailLabel;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
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
  PXSearchQueryStatusFooter *v50;
  objc_super v51;
  _QWORD v52[11];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v52[9] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)PXSearchQueryStatusFooter;
  result = -[PXSearchQueryStatusFooter initWithFrame:](&v51, sel_initWithFrame_);
  if (result)
  {
    v8 = (objc_class *)MEMORY[0x1E0DC3990];
    v50 = result;
    v9 = result;
    v10 = objc_msgSend([v8 alloc], "initWithFrame:", x, y, width, height);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B58]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v49, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_titleLabel, "setFont:", v13);

    -[UILabel setAdjustsFontForContentSizeCategory:](v9->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_titleLabel, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v9->_titleLabel, "setTextAlignment:", 1);
    PXLocalizedStringFromTable(CFSTR("SEARCH_NO_RESULTS"), CFSTR("PhotosUICore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_titleLabel, "setText:", v15);

    -[PXSearchQueryStatusFooter addSubview:](v9, "addSubview:", v9->_titleLabel);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", x, y, width, height);
    detailLabel = v9->_detailLabel;
    v9->_detailLabel = (UILabel *)v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_detailLabel, "setFont:", v18);

    -[UILabel setAdjustsFontForContentSizeCategory:](v9->_detailLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_detailLabel, "setTextColor:", v19);

    -[UILabel setTextAlignment:](v9->_detailLabel, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v9->_detailLabel, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](v9->_detailLabel, "setNumberOfLines:", 0);
    -[PXSearchQueryStatusFooter addSubview:](v9, "addSubview:", v9->_detailLabel);
    -[UILabel centerXAnchor](v9->_titleLabel, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter centerXAnchor](v9, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v46;
    -[UILabel topAnchor](v9->_titleLabel, "topAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter topAnchor](v9, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 60.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v43;
    -[UILabel leadingAnchor](v9->_titleLabel, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter leadingAnchor](v9, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintGreaterThanOrEqualToAnchor:constant:", v41, 20.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v40;
    -[UILabel trailingAnchor](v9->_titleLabel, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter trailingAnchor](v9, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:constant:", v38, 20.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v37;
    -[UILabel centerXAnchor](v9->_detailLabel, "centerXAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter centerXAnchor](v9, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v52[4] = v34;
    -[UILabel topAnchor](v9->_detailLabel, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v9->_titleLabel, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v32, 1.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v31;
    -[UILabel leadingAnchor](v9->_detailLabel, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter leadingAnchor](v9, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v21, 20.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v22;
    -[UILabel trailingAnchor](v9->_detailLabel, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchQueryStatusFooter trailingAnchor](v9, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:constant:", v24, 20.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v52[7] = v25;
    -[PXSearchQueryStatusFooter bottomAnchor](v9, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v9->_detailLabel;

    -[UILabel bottomAnchor](v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v28, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52[8] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v30);
    return v50;
  }
  return result;
}

- (void)setSearchText:(id)a3
{
  void *v4;
  id v5;

  PXLocalizedStringFromTable(CFSTR("SEARCH_NO_RESULTS_DESCRIPTION"), CFSTR("PhotosUICore"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSearchQueryStatusFooter detailLabel](self, "detailLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
