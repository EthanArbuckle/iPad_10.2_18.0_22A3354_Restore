@implementation PBFFocusPosterSelectionHeaderView

- (PBFFocusPosterSelectionHeaderView)initWithFrame:(CGRect)a3
{
  PBFFocusPosterSelectionHeaderView *v3;
  PBFFocusPosterSelectionHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  objc_super v26;
  _QWORD v27[8];

  v27[6] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PBFFocusPosterSelectionHeaderView;
  v3 = -[PBFFocusPosterSelectionHeaderView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBFFocusPosterSelectionHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PBFFocusPosterSelectionHeaderView _createStackView](v4, "_createStackView");
    -[PBFFocusPosterSelectionHeaderView _createSeparatorView](v4, "_createSeparatorView");
    -[PBFFocusPosterSelectionHeaderView _createTitleLabel](v4, "_createTitleLabel");
    -[PBFFocusPosterSelectionHeaderView _createSubtitleLabel](v4, "_createSubtitleLabel");
    -[UIStackView setCustomSpacing:afterView:](v4->_stackView, "setCustomSpacing:afterView:", v4->_titleLabel, 2.0);
    v19 = (void *)MEMORY[0x1E0CB3718];
    -[UIStackView leadingAnchor](v4->_stackView, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterSelectionHeaderView leadingAnchor](v4, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 10.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    -[UIStackView trailingAnchor](v4->_stackView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterSelectionHeaderView trailingAnchor](v4, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -10.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v20;
    -[UIStackView topAnchor](v4->_stackView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterSelectionHeaderView topAnchor](v4, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 12.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v16;
    -[UIStackView bottomAnchor](v4->_stackView, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFFocusPosterSelectionHeaderView bottomAnchor](v4, "bottomAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v5, -12.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v6;
    -[UIStackView leadingAnchor](v4->_stackView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v4->_separatorView, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v9;
    -[UIStackView trailingAnchor](v4->_stackView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_separatorView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v13);

  }
  return v4;
}

- (PBFFocusPosterSelectionHeaderView)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PBFFocusPosterSelectionHeaderView *v8;
  objc_super v10;

  v4 = (void *)MEMORY[0x1E0CB3488];
  v5 = a3;
  objc_msgSend(v4, "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFFocusPosterSelectionHeaderView initWithCoder:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PBFFocusPosterSelectionHeaderView.m"), 50, CFSTR("%s: not supported"), "-[PBFFocusPosterSelectionHeaderView initWithCoder:]");

  v10.receiver = self;
  v10.super_class = (Class)PBFFocusPosterSelectionHeaderView;
  v8 = -[PBFFocusPosterSelectionHeaderView initWithCoder:](&v10, sel_initWithCoder_, v5);

  return v8;
}

- (void)_createStackView
{
  UIStackView *v3;
  UIStackView *stackView;

  v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  stackView = self->_stackView;
  self->_stackView = v3;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 10.0);
  -[PBFFocusPosterSelectionHeaderView addSubview:](self, "addSubview:", self->_stackView);
}

- (void)_createSeparatorView
{
  UIView *v3;
  UIView *separatorView;
  UIView *v5;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *separatorViewHeightConstraint;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_separatorView;
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_separatorView);
  -[UIView heightAnchor](self->_separatorView, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 0.0);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  separatorViewHeightConstraint = self->_separatorViewHeightConstraint;
  self->_separatorViewHeightConstraint = v8;

  -[NSLayoutConstraint setActive:](self->_separatorViewHeightConstraint, "setActive:", 1);
  -[PBFFocusPosterSelectionHeaderView _updateSeparatorHeightConstraint](self, "_updateSeparatorHeightConstraint");
}

- (void)_createTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  v7 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", 0);
  -[UILabel setLineBreakStrategy:](self->_titleLabel, "setLineBreakStrategy:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_titleLabel);
}

- (void)_createSubtitleLabel
{
  UILabel *v3;
  UILabel *subtitleLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  v7 = self->_subtitleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7, "setTextColor:", v8);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", 0);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 1);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_subtitleLabel);
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  NSString *v6;
  NSString *title;
  id v8;

  v8 = a3;
  -[UILabel text](self->_titleLabel, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (NSString *)objc_msgSend(v8, "copy");
    title = self->_title;
    self->_title = v6;

    -[UILabel setText:](self->_titleLabel, "setText:", v8);
  }

}

- (void)setAttributedSubtitle:(id)a3
{
  void *v4;
  char v5;
  NSAttributedString *v6;
  NSAttributedString *attributedSubtitle;
  id v8;

  v8 = a3;
  -[UILabel attributedText](self->_subtitleLabel, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToAttributedString:", v8);

  if ((v5 & 1) == 0)
  {
    v6 = (NSAttributedString *)objc_msgSend(v8, "copy");
    attributedSubtitle = self->_attributedSubtitle;
    self->_attributedSubtitle = v6;

    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v8);
    -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", objc_msgSend(v8, "length") == 0);
  }

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBFFocusPosterSelectionHeaderView;
  -[PBFFocusPosterSelectionHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", 0);
  -[UILabel setHidden:](self->_subtitleLabel, "setHidden:", 1);
  -[UILabel setText:](self->_titleLabel, "setText:", 0);
  -[PBFFocusPosterSelectionHeaderView setGestureRecognizers:](self, "setGestureRecognizers:", MEMORY[0x1E0C9AA60]);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBFFocusPosterSelectionHeaderView;
  -[PBFFocusPosterSelectionHeaderView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[PBFFocusPosterSelectionHeaderView _updateSeparatorHeightConstraint](self, "_updateSeparatorHeightConstraint");
}

- (void)_updateSeparatorHeightConstraint
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSLayoutConstraint *separatorViewHeightConstraint;
  double v8;
  id v9;

  -[PBFFocusPosterSelectionHeaderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;

  separatorViewHeightConstraint = self->_separatorViewHeightConstraint;
  objc_msgSend(v9, "scale");
  -[NSLayoutConstraint setConstant:](separatorViewHeightConstraint, "setConstant:", 1.0 / v8);

}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedSubtitle
{
  return self->_attributedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedSubtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_separatorViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
