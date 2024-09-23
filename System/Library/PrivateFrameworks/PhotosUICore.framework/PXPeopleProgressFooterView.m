@implementation PXPeopleProgressFooterView

- (PXPeopleProgressFooterView)initWithFrame:(CGRect)a3
{
  PXPeopleProgressFooterView *v3;
  PXPeopleProgressFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleProgressFooterView;
  v3 = -[PXPeopleProgressFooterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXPeopleProgressFooterView _setupViews](v3, "_setupViews");
  return v4;
}

- (void)_setupViews
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  UILabel *subtitleLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  id v13;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  PXFontWithTextStyleSymbolicTraits();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v13);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v5 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v5, "setTextColor:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", &stru_1E5149688);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[PXPeopleProgressFooterView addSubview:](self, "addSubview:", self->_titleLabel);
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v7;

  v9 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v10);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
  v11 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v11, "setTextColor:", v12);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", &stru_1E5149688);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[PXPeopleProgressFooterView addSubview:](self, "addSubview:", self->_subtitleLabel);
  -[PXPeopleProgressFooterView _setupConstraints](self, "_setupConstraints");

}

- (void)_setupConstraints
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
  _QWORD v27[8];

  v27[7] = *MEMORY[0x1E0C80C00];
  -[PXPeopleProgressFooterView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView subtitleLabel](self, "subtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 18.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView leadingAnchor](self, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 10.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -10.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -3.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView leadingAnchor](self, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView trailingAnchor](self, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -10.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = v26;
  v27[1] = v13;
  v27[2] = v16;
  v27[3] = v25;
  v27[4] = v24;
  v27[5] = v19;
  v27[6] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleProgressFooterView addConstraints:](self, "addConstraints:", v23);

}

- (double)preferredHeightForWidth:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v4 = a3 + -20.0;
  -[PXPeopleProgressFooterView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[PXPeopleProgressFooterView titleLabel](self, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sizeThatFits:", v4, 1.79769313e308);
    v9 = v8 + 41.0;

  }
  else
  {
    v9 = 41.0;
  }

  -[PXPeopleProgressFooterView subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    -[PXPeopleProgressFooterView subtitleLabel](self, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sizeThatFits:", v4, 1.79769313e308);
    v14 = v13;

  }
  else
  {
    v14 = 0.0;
  }

  return v9 + v14;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
