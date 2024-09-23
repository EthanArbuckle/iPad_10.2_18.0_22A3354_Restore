@implementation PXPeopleConfirmationHeaderView

- (PXPeopleConfirmationHeaderView)initWithFrame:(CGRect)a3
{
  PXPeopleConfirmationHeaderView *v3;
  PXPeopleConfirmationHeaderView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPeopleConfirmationHeaderView;
  v3 = -[PXPeopleConfirmationHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXPeopleConfirmationHeaderView _setupHeader](v3, "_setupHeader");
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleConfirmationHeaderView;
  -[PXPeopleConfirmationHeaderView prepareForReuse](&v3, sel_prepareForReuse);
  -[PXPeopleConfirmationHeaderView setTitle:](self, "setTitle:", &stru_1E5149688);
  -[PXPeopleConfirmationHeaderView setPerson:](self, "setPerson:", 0);
}

- (void)_setupHeader
{
  UILabel *v3;
  void *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  uint64_t v8;
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
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](v3, "setTextAlignment:", 4);
  +[PXPeopleConfirmationHeaderView _titleFont](PXPeopleConfirmationHeaderView, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v3, "setFont:", v4);

  -[UILabel setAdjustsFontForContentSizeCategory:](v3, "setAdjustsFontForContentSizeCategory:", 1);
  -[PXPeopleConfirmationHeaderView addSubview:](self, "addSubview:", v3);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;
  v6 = v3;

  -[PXPeopleConfirmationHeaderView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB3718];
  v18 = (void *)v8;
  -[UILabel bottomAnchor](v6, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  -[UILabel leadingAnchor](v6, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v19, 20.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  -[UILabel trailingAnchor](v6, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v8, -20.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPeopleConfirmationHeaderView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PXPeopleConfirmationHeaderView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PXPerson)person
{
  return self->_person;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

+ (CGSize)sizeForTitle:(id)a3 boundingSize:(CGSize)a4
{
  CGFloat width;
  CGFloat v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a4.width;
  v5 = a4.width + -40.0;
  v6 = a3;
  +[PXPeopleConfirmationHeaderView _titleFont](PXPeopleConfirmationHeaderView, "_titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleConfirmationHeaderView _sizeForString:width:multiline:font:](PXPeopleConfirmationHeaderView, "_sizeForString:width:multiline:font:", v6, 0, v7, v5);
  v9 = v8;

  v10 = v9 + 10.0 + 10.0;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (CGSize)_sizeForString:(id)a3 width:(double)a4 multiline:(BOOL)a5 font:(id)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  if (v6)
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0DC1178]);

  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DC1138]);
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", v6, v11, 0, a4, 0.0);
  v14 = v13;
  v16 = v15;

  v17 = ceil(v14);
  v18 = ceil(v16);
  result.height = v18;
  result.width = v17;
  return result;
}

+ (id)_titleFont
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *MEMORY[0x1E0DC4B58];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v2, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v5, "fontWithDescriptor:size:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
