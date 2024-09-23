@implementation PXPeopleBootstrapFooterView

- (PXPeopleBootstrapFooterView)initWithFrame:(CGRect)a3
{
  PXPeopleBootstrapFooterView *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *descriptionLabel;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleBootstrapFooterView;
  v3 = -[PXPeopleBootstrapFooterView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4, "setAdjustsFontForContentSizeCategory:", 1);
    +[PXPeopleBootstrapFooterView _descriptionLabelFont](PXPeopleBootstrapFooterView, "_descriptionLabelFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v5);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    -[PXPeopleBootstrapFooterView addSubview:](v3, "addSubview:", v4);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v4;
    v8 = v4;

    v18 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v8, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleBootstrapFooterView leadingAnchor](v3, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 20.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v21;
    -[UILabel trailingAnchor](v8, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleBootstrapFooterView trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -20.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v9;
    -[UILabel centerXAnchor](v8, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleBootstrapFooterView centerXAnchor](v3, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v12;
    -[UILabel lastBaselineAnchor](v8, "lastBaselineAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleBootstrapFooterView bottomAnchor](v3, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -20.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPeopleBootstrapFooterView;
  v4 = a3;
  -[PXPeopleBootstrapFooterView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleBootstrapFooterView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    -[PXPeopleBootstrapFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDescriptionText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleBootstrapFooterView descriptionLabel](self, "descriptionLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

+ (CGSize)sizeForBoundingSize:(CGSize)a3 descriptionText:(id)a4
{
  CGFloat width;
  CGFloat v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD v14[2];
  CGSize result;

  width = a3.width;
  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3.width + -40.0;
  v13 = *MEMORY[0x1E0DC1138];
  v6 = a4;
  +[PXPeopleBootstrapFooterView _descriptionLabelFont](PXPeopleBootstrapFooterView, "_descriptionLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v5, 0.0);
  v10 = v9;

  v11 = ceil(v10) + 20.0;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

+ (id)_descriptionLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

@end
