@implementation ICPaperStyleHeaderView

- (ICPaperStyleHeaderView)initWithFrame:(CGRect)a3
{
  ICPaperStyleHeaderView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSLayoutConstraint *labelConstraintLeading;
  void *v14;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *labelConstraintTop;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *labelConstraintTrailing;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *labelConstraintBottom;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)ICPaperStyleHeaderView;
  v3 = -[ICPaperStyleHeaderView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[ICPaperStyleHeaderView setLabel:](v3, "setLabel:", v4);

    -[ICPaperStyleHeaderView label](v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[ICPaperStyleHeaderView label](v3, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 1);

    -[ICPaperStyleHeaderView label](v3, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfLines:", 0);

    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView label](v3, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[ICPaperStyleHeaderView label](v3, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView addSubview:](v3, "addSubview:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "ICGroupedBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v11);

    v30 = (void *)MEMORY[0x1E0CB3718];
    -[ICPaperStyleHeaderView label](v3, "label");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView leadingAnchor](v3, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v12 = objc_claimAutoreleasedReturnValue();
    labelConstraintLeading = v3->_labelConstraintLeading;
    v3->_labelConstraintLeading = (NSLayoutConstraint *)v12;

    v36[0] = v12;
    -[ICPaperStyleHeaderView label](v3, "label");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView topAnchor](v3, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    labelConstraintTop = v3->_labelConstraintTop;
    v3->_labelConstraintTop = (NSLayoutConstraint *)v16;

    v36[1] = v16;
    -[ICPaperStyleHeaderView label](v3, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView trailingAnchor](v3, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    labelConstraintTrailing = v3->_labelConstraintTrailing;
    v3->_labelConstraintTrailing = (NSLayoutConstraint *)v21;

    v36[2] = v21;
    -[ICPaperStyleHeaderView label](v3, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICPaperStyleHeaderView bottomAnchor](v3, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    labelConstraintBottom = v3->_labelConstraintBottom;
    v3->_labelConstraintBottom = (NSLayoutConstraint *)v26;

    v36[3] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "activateConstraints:", v28);

    -[ICPaperStyleHeaderView contentSizeCategoryDidChange](v3, "contentSizeCategoryDidChange");
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICPaperStyleHeaderView label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[ICPaperStyleHeaderView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[ICPaperStyleHeaderView labelConstraintLeading](self, "labelConstraintLeading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", left);

  -[ICPaperStyleHeaderView labelConstraintTop](self, "labelConstraintTop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstant:", top);

  -[ICPaperStyleHeaderView labelConstraintTrailing](self, "labelConstraintTrailing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", -right);

  -[ICPaperStyleHeaderView labelConstraintBottom](self, "labelConstraintBottom");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", -bottom);

}

- (UIEdgeInsets)titleInsets
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[ICPaperStyleHeaderView labelConstraintTop](self, "labelConstraintTop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constant");
  v5 = v4;
  -[ICPaperStyleHeaderView labelConstraintLeading](self, "labelConstraintLeading");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  v8 = v7;
  -[ICPaperStyleHeaderView labelConstraintBottom](self, "labelConstraintBottom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constant");
  v11 = -v10;
  -[ICPaperStyleHeaderView labelConstraintTrailing](self, "labelConstraintTrailing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constant");
  v14 = -v13;

  v15 = v5;
  v16 = v8;
  v17 = v11;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_fontWithSingleLineA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPaperStyleHeaderView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSLayoutConstraint)labelConstraintLeading
{
  return self->_labelConstraintLeading;
}

- (void)setLabelConstraintLeading:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraintLeading, a3);
}

- (NSLayoutConstraint)labelConstraintTop
{
  return self->_labelConstraintTop;
}

- (void)setLabelConstraintTop:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraintTop, a3);
}

- (NSLayoutConstraint)labelConstraintTrailing
{
  return self->_labelConstraintTrailing;
}

- (void)setLabelConstraintTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraintTrailing, a3);
}

- (NSLayoutConstraint)labelConstraintBottom
{
  return self->_labelConstraintBottom;
}

- (void)setLabelConstraintBottom:(id)a3
{
  objc_storeStrong((id *)&self->_labelConstraintBottom, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelConstraintBottom, 0);
  objc_storeStrong((id *)&self->_labelConstraintTrailing, 0);
  objc_storeStrong((id *)&self->_labelConstraintTop, 0);
  objc_storeStrong((id *)&self->_labelConstraintLeading, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
