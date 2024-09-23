@implementation _UIFindNavigatorViewLayout_iPad

- (_UIFindNavigatorViewLayout_iPad)initWithFrame:(CGRect)a3
{
  _UIFindNavigatorViewLayout_iPad *v3;
  UIStackView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIStackView *contentStackView;
  UIStackView *v11;
  UIStackView *textFieldsStackView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIFindNavigatorViewLayout_iPad;
  v3 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    contentStackView = v3->_contentStackView;
    v3->_contentStackView = (UIStackView *)v9;

    -[UIStackView setSpacing:](v3->_contentStackView, "setSpacing:", 8.0);
    -[UIStackView setAxis:](v3->_contentStackView, "setAxis:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_contentStackView);
    v11 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    textFieldsStackView = v3->_textFieldsStackView;
    v3->_textFieldsStackView = v11;

    -[UIStackView setSpacing:](v3->_textFieldsStackView, "setSpacing:", 8.0);
    -[UIStackView setAxis:](v3->_textFieldsStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v3->_textFieldsStackView, "setDistribution:", 1);
  }
  return v3;
}

- (void)prepareForLayout
{
  UIStackView *contentStackView;
  void *v4;
  UIStackView *textFieldsStackView;
  void *v6;
  UIStackView *v7;
  void *v8;
  UIStackView *v9;
  void *v10;
  UIStackView *v11;
  void *v12;
  UIStackView *v13;
  void *v14;

  contentStackView = self->_contentStackView;
  -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](contentStackView, "addArrangedSubview:", v4);

  textFieldsStackView = self->_textFieldsStackView;
  -[_UIFindNavigatorViewLayout searchTextField](self, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](textFieldsStackView, "addArrangedSubview:", v6);

  v7 = self->_textFieldsStackView;
  -[_UIFindNavigatorViewLayout replaceTextField](self, "replaceTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v7, "addArrangedSubview:", v8);

  -[UIStackView addArrangedSubview:](self->_contentStackView, "addArrangedSubview:", self->_textFieldsStackView);
  v9 = self->_contentStackView;
  -[_UIFindNavigatorViewLayout replaceButton](self, "replaceButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v9, "addArrangedSubview:", v10);

  v11 = self->_contentStackView;
  -[_UIFindNavigatorViewLayout previousResultButton](self, "previousResultButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v11, "addArrangedSubview:", v12);

  v13 = self->_contentStackView;
  -[_UIFindNavigatorViewLayout nextResultButton](self, "nextResultButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v13, "addArrangedSubview:", v14);

  -[_UIFindNavigatorViewLayout_iPad _setAndActivateConstraints](self, "_setAndActivateConstraints");
}

- (void)_setAndActivateConstraints
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
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIFindNavigatorViewLayout nextResultButton](self, "nextResultButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_contentStackView, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[_UIFindNavigatorViewLayout previousResultButton](self, "previousResultButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView heightAnchor](self->_contentStackView, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v12);

}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFindNavigatorViewLayout_iPad;
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](&v10, sel_setReplaceFieldVisible_);
  -[_UIFindNavigatorViewLayout replaceButton](self, "replaceButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[_UIFindNavigatorViewLayout replaceTextField](self, "replaceTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[_UIFindNavigatorViewLayout replaceTextField](self, "replaceTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setHidden:", v9);

}

- (void)layoutSubviews
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorViewLayout_iPad;
  -[UIView layoutSubviews](&v20, sel_layoutSubviews);
  v3 = -[_UIFindNavigatorViewLayout assistantBarStyle](self, "assistantBarStyle");
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v13 = v12;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  if (v3)
    v15 = 0.0;
  else
    v15 = 3.0;
  v16 = v5 + v14;
  v17 = v9 - (v13 + v14);
  v18 = v15 + v7;
  v19 = 6.0;
  if (v3)
    v19 = 0.0;
  -[UIView setFrame:](self->_contentStackView, "setFrame:", v16, v18, v17, v11 - v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldsStackView, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
}

@end
