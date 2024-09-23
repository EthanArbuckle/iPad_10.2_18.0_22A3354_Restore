@implementation SHSDualSIMToneTitleView

- (SHSDualSIMToneTitleView)init
{
  SHSDualSIMToneTitleView *v2;
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SHSBadgeView *v9;
  SHSBadgeView *badgeView;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIStackView *stackView;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SHSDualSIMToneTitleView;
  v2 = -[SHSDualSIMToneTitleView init](&v17, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    -[UILabel setUserInteractionEnabled:](v2->_titleLabel, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v7, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_titleLabel, "setFont:", v8);

    -[UILabel setAdjustsFontForContentSizeCategory:](v2->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v9 = objc_alloc_init(SHSBadgeView);
    badgeView = v2->_badgeView;
    v2->_badgeView = v9;

    v11 = objc_alloc(MEMORY[0x24BEBD978]);
    -[SHSDualSIMToneTitleView badgeView](v2, "badgeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = v2->_titleLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithArrangedSubviews:", v13);
    stackView = v2->_stackView;
    v2->_stackView = (UIStackView *)v14;

    -[UIStackView setAlignment:](v2->_stackView, "setAlignment:", 3);
    -[UIStackView setAxis:](v2->_stackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v2->_stackView, "setDistribution:", 3);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v2->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setSpacing:](v2->_stackView, "setSpacing:", 6.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setUserInteractionEnabled:](v2->_stackView, "setUserInteractionEnabled:", 0);
    -[SHSDualSIMToneTitleView addSubview:](v2, "addSubview:", v2->_stackView);
    -[SHSDualSIMToneTitleView loadConstraintsForTitleView](v2, "loadConstraintsForTitleView");

  }
  return v2;
}

- (void)loadConstraintsForTitleView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  id v46;

  -[SHSDualSIMToneTitleView badgeView](self, "badgeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[SHSDualSIMToneTitleView badgeView](self, "badgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[SHSDualSIMToneTitleView badgeView](self, "badgeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  -[SHSDualSIMToneTitleView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "capHeight");
  v15 = v14;
  -[SHSDualSIMToneTitleView badgeView](self, "badgeView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v5, v8, v11, v15);

  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView topAnchor](self, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView bottomAnchor](self, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView leadingAnchor](self, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView centerYAnchor](self, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[SHSDualSIMToneTitleView badgeView](self, "badgeView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerYAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[SHSDualSIMToneTitleView titleLabel](self, "titleLabel");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "centerYAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMToneTitleView stackView](self, "stackView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

}

- (void)updateContentsWithTitle:(id)a3 badgeText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SHSDualSIMToneTitleView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[SHSDualSIMToneTitleView badgeView](self, "badgeView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

}

- (SHSBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
