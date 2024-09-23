@implementation _UIRecentsAccessoryDefaultView

- (_UIRecentsAccessoryDefaultView)init
{
  _UIRecentsAccessoryDefaultView *v2;
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *subheadLabel;
  UILabel *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[3];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)_UIRecentsAccessoryDefaultView;
  v2 = -[UIView init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;
    v5 = v3;

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    LODWORD(v7) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v7);
    -[UIView sizeToFit](v5, "sizeToFit");
    -[UIView addSubview:](v2, "addSubview:", v5);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, v2, 9, 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, v2, 3, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D156E0];
    v26[0] = v8;
    v26[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v11);

    v12 = objc_alloc_init(UILabel);
    subheadLabel = v2->_subheadLabel;
    v2->_subheadLabel = v12;
    v14 = v12;

    _UINSLocalizedStringWithDefaultValue(CFSTR("Select a previously-used email address or enter a new one. To remove one, go to Settings > General."), CFSTR("Select a previously-used email address or enter a new one. To remove one, go to Settings > General."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v14, "setText:", v15);

    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v14, "setFont:", v16);

    LODWORD(v17) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v14, "setContentHuggingPriority:forAxis:", 1, v17);
    -[UILabel setNumberOfLines:](v14, "setNumberOfLines:", 3);
    -[UILabel setTextAlignment:](v14, "setTextAlignment:", 1);
    -[UILabel setPreferredMaxLayoutWidth:](v14, "setPreferredMaxLayoutWidth:", 660.0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v14, "setAdjustsFontSizeToFitWidth:", 1);
    -[UIView sizeToFit](v14, "sizeToFit");
    -[UIView addSubview:](v2, "addSubview:", v14);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 9, 0, v5, 9, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 3, 0, v5, 4, 1.0, 20.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 0, v2, 4, 1.0, -20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0D156E0];
    v25[0] = v18;
    v25[1] = v19;
    v25[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v22);

  }
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[UIView frame](self->_subheadLabel, "frame");
  v4 = v3;
  -[UILabel intrinsicContentSize](self->_subheadLabel, "intrinsicContentSize");
  v6 = v5 + 40.0;
  -[UILabel intrinsicContentSize](self->_titleLabel, "intrinsicContentSize");
  v8 = v6 + v7;
  v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_UIRecentsAccessoryDefaultView _updateLabelTextColors](self, "_updateLabelTextColors");
  v5.receiver = self;
  v5.super_class = (Class)_UIRecentsAccessoryDefaultView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIRecentsAccessoryDefaultView;
  v4 = a3;
  -[UIView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

}

- (void)_updateLabelTextColors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 1000 || v4 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor blackColor](UIColor, "blackColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (id)v5;
  -[_UIRecentsAccessoryDefaultView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v8);

  -[_UIRecentsAccessoryDefaultView subheadLabel](self, "subheadLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subheadLabel
{
  return self->_subheadLabel;
}

- (void)setSubheadLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subheadLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheadLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
