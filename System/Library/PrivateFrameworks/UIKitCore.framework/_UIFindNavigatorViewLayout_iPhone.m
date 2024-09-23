@implementation _UIFindNavigatorViewLayout_iPhone

- (_UIFindNavigatorViewLayout_iPhone)initWithFrame:(CGRect)a3
{
  _UIFindNavigatorViewLayout_iPhone *v3;
  UIStackView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIStackView *verticalStackView;
  UIStackView *v11;
  UIStackView *findStackView;
  UIStackView *v13;
  UIStackView *replaceStackView;
  UIStackView *v15;
  UIStackView *nextPrevStackView;
  uint64_t v17;
  UIView *nextPrevSpacerView;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  v3 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[UIStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    verticalStackView = v3->_verticalStackView;
    v3->_verticalStackView = (UIStackView *)v9;

    -[UIStackView setSpacing:](v3->_verticalStackView, "setSpacing:", 12.0);
    -[UIStackView setAxis:](v3->_verticalStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_verticalStackView, "setDistribution:", 1);
    -[UIView addSubview:](v3, "addSubview:", v3->_verticalStackView);
    v11 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    findStackView = v3->_findStackView;
    v3->_findStackView = v11;

    -[UIStackView setSpacing:](v3->_findStackView, "setSpacing:", 12.0);
    -[UIStackView setAxis:](v3->_findStackView, "setAxis:", 0);
    -[UIStackView addArrangedSubview:](v3->_verticalStackView, "addArrangedSubview:", v3->_findStackView);
    v13 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    replaceStackView = v3->_replaceStackView;
    v3->_replaceStackView = v13;

    -[UIStackView setSpacing:](v3->_replaceStackView, "setSpacing:", 12.0);
    -[UIStackView setAxis:](v3->_replaceStackView, "setAxis:", 0);
    -[UIStackView addArrangedSubview:](v3->_verticalStackView, "addArrangedSubview:", v3->_replaceStackView);
    v15 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    nextPrevStackView = v3->_nextPrevStackView;
    v3->_nextPrevStackView = v15;

    -[UIStackView setSpacing:](v3->_nextPrevStackView, "setSpacing:", 12.0);
    makeSpacerView();
    v17 = objc_claimAutoreleasedReturnValue();
    nextPrevSpacerView = v3->_nextPrevSpacerView;
    v3->_nextPrevSpacerView = (UIView *)v17;

    -[UIView setHidden:](v3->_nextPrevSpacerView, "setHidden:", 1);
  }
  return v3;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  -[_UIFindNavigatorViewLayout preferredContentSize](&v12, sel_preferredContentSize);
  v4 = v3;
  v6 = v5;
  if (-[_UIFindNavigatorViewLayout replaceFieldVisible](self, "replaceFieldVisible"))
    v6 = v6 + v6;
  -[UIView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v6 + v8;

  v10 = v4;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](&v5, sel_setReplaceFieldVisible_);
  -[UIView setHidden:](self->_replaceStackView, "setHidden:", v3 ^ 1);
  -[NSLayoutConstraint setActive:](self->_doneSpaceConstraint, "setActive:", v3);
  -[NSLayoutConstraint setActive:](self->_replaceButtonWidthConstraint, "setActive:", v3);
  -[UIView setHidden:](self->_nextPrevSpacerView, "setHidden:", v3 ^ 1);
}

- (void)prepareForLayout
{
  _BOOL4 v3;
  UIStackView *findStackView;
  void *v5;
  UIStackView *v6;
  void *v7;
  UIStackView *nextPrevStackView;
  void *v9;
  UIStackView *v10;
  UIStackView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIStackView *v15;
  void *v16;
  void *v17;
  UIView *v18;
  UIStackView *replaceStackView;
  void *v20;
  UIStackView *v21;
  void *v22;
  void *v23;
  void *v24;
  UIStackView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *doneSpaceConstraint;
  void *v32;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *replaceButtonWidthConstraint;
  UIView *v37;

  v3 = -[_UIFindNavigatorViewLayout_iPhone usesSmallScreenStyle](self, "usesSmallScreenStyle");
  findStackView = self->_findStackView;
  -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](findStackView, "addArrangedSubview:", v5);

  v6 = self->_findStackView;
  -[_UIFindNavigatorViewLayout searchTextField](self, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v6, "addArrangedSubview:", v7);

  nextPrevStackView = self->_nextPrevStackView;
  -[_UIFindNavigatorViewLayout previousResultButton](self, "previousResultButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](nextPrevStackView, "addArrangedSubview:", v9);

  v10 = self->_nextPrevStackView;
  if (v3)
  {
    -[UIStackView addArrangedSubview:](self->_nextPrevStackView, "addArrangedSubview:", self->_nextPrevSpacerView);
    v11 = self->_nextPrevStackView;
    -[_UIFindNavigatorViewLayout nextResultButton](self, "nextResultButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v11, "addArrangedSubview:", v12);

    -[UIView _setTouchInsets:](self->_nextPrevStackView, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);
    -[_UIFindNavigatorViewLayout nextResultButton](self, "nextResultButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);

    -[_UIFindNavigatorViewLayout previousResultButton](self, "previousResultButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setTouchInsets:", 0.0, -8.0, 0.0, -8.0);

    -[UIStackView addArrangedSubview:](self->_findStackView, "addArrangedSubview:", self->_nextPrevStackView);
    v15 = self->_findStackView;
    makeSpacerView();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v15, "addArrangedSubview:", v16);

  }
  else
  {
    -[_UIFindNavigatorViewLayout nextResultButton](self, "nextResultButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v10, "addArrangedSubview:", v17);

    -[UIStackView addArrangedSubview:](self->_findStackView, "addArrangedSubview:", self->_nextPrevStackView);
  }
  v18 = [UIView alloc];
  v37 = -[UIView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIStackView addArrangedSubview:](self->_replaceStackView, "addArrangedSubview:");
  replaceStackView = self->_replaceStackView;
  -[_UIFindNavigatorViewLayout replaceTextField](self, "replaceTextField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](replaceStackView, "addArrangedSubview:", v20);

  v21 = self->_replaceStackView;
  -[_UIFindNavigatorViewLayout replaceButton](self, "replaceButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView addArrangedSubview:](v21, "addArrangedSubview:", v22);

  -[_UIFindNavigatorViewLayout replaceButton](self, "replaceButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", 0);

  -[_UIFindNavigatorViewLayout replaceTextField](self, "replaceTextField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHidden:", 0);

  if (v3)
  {
    v25 = self->_replaceStackView;
    makeSpacerView();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView addArrangedSubview:](v25, "addArrangedSubview:", v26);

  }
  -[UIView widthAnchor](v37, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewLayout doneButton](self, "doneButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  doneSpaceConstraint = self->_doneSpaceConstraint;
  self->_doneSpaceConstraint = v30;

  -[UIView widthAnchor](self->_nextPrevStackView, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewLayout replaceButton](self, "replaceButton");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v34);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  replaceButtonWidthConstraint = self->_replaceButtonWidthConstraint;
  self->_replaceButtonWidthConstraint = v35;

  -[_UIFindNavigatorViewLayout_iPhone _setAndActivateConstraints](self, "_setAndActivateConstraints");
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
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D156E0];
  -[_UIFindNavigatorViewLayout nextResultButton](self, "nextResultButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 28.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  -[_UIFindNavigatorViewLayout previousResultButton](self, "previousResultButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 28.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v10);

}

- (BOOL)usesSmallScreenStyle
{
  return 1;
}

- (CGRect)preferredVerticalStackViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[UIView safeAreaInsets](self, "safeAreaInsets");
  v4 = v3 + 2.0;
  -[UIView bounds](self, "bounds");
  v7 = v6 + 0.0;
  v9 = v8 + 3.0;
  v11 = v10 - (v4 + 3.0);
  result.size.height = v11;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v7;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorViewLayout_iPhone;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIFindNavigatorViewLayout_iPhone preferredVerticalStackViewFrame](self, "preferredVerticalStackViewFrame");
  -[UIView setFrame:](self->_verticalStackView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_doneSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_nextPrevSpacerView, 0);
  objc_storeStrong((id *)&self->_nextPrevStackView, 0);
  objc_storeStrong((id *)&self->_replaceStackView, 0);
  objc_storeStrong((id *)&self->_findStackView, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
}

@end
