@implementation STSCategorySectionHeader

- (STSCategorySectionHeader)init
{
  STSCategorySectionHeader *v2;
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UILabel *titleLabel;
  UILabel *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton *clearButton;
  UIButton *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STSCategorySectionHeader;
  v2 = -[STSCategorySectionHeader init](&v18, sel_init);
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE240]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3, "setFont:", v7);

    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;
    v9 = v3;

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
    STSLocalizedString(CFSTR("CLEAR"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v10, "setTitle:forState:", v11, 0);
    -[UIButton titleLabel](v10, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v10, "setTintColor:", v14);

    -[UIButton setHidden:](v10, "setHidden:", 0);
    clearButton = v2->_clearButton;
    v2->_clearButton = v10;
    v16 = v10;

    -[STSCategorySectionHeader addSubview:](v2, "addSubview:", v2->_titleLabel);
    -[STSCategorySectionHeader addSubview:](v2, "addSubview:", v2->_clearButton);

  }
  return v2;
}

- (void)setTitle:(id)a3
{
  NSString **p_title;
  id v6;

  p_title = &self->_title;
  objc_storeStrong((id *)&self->_title, a3);
  v6 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", *p_title);

}

- (void)setClearButtonHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_clearButton, "setHidden:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;
  UILabel *titleLabel;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIButton *clearButton;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)STSCategorySectionHeader;
  -[STSCategorySectionHeader layoutSubviews](&v31, sel_layoutSubviews);
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[STSCategorySectionHeader traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  v5 = 20.0;
  if (v4 == 2)
  {
    -[STSCategorySectionHeader readableContentGuide](self, "readableContentGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layoutFrame");
    v5 = v7;

  }
  titleLabel = self->_titleLabel;
  -[STSCategorySectionHeader bounds](self, "bounds");
  v10 = v9;
  -[UILabel bounds](self->_titleLabel, "bounds");
  v12 = v10 - v11 + -15.0;
  -[UILabel bounds](self->_titleLabel, "bounds");
  v14 = v13;
  -[UILabel bounds](self->_titleLabel, "bounds");
  -[UILabel setFrame:](titleLabel, "setFrame:", v5, v12, v14);
  -[UIButton sizeToFit](self->_clearButton, "sizeToFit");
  -[STSCategorySectionHeader readableContentGuide](self, "readableContentGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutFrame");
  v17 = v16;
  v19 = v18;

  if (v4 == 2)
  {
    v20 = v17 + v19;
  }
  else
  {
    -[STSCategorySectionHeader bounds](self, "bounds");
    v20 = v21;
  }
  -[UIButton bounds](self->_clearButton, "bounds");
  v23 = v20 - v22 + -20.0;
  clearButton = self->_clearButton;
  -[STSCategorySectionHeader bounds](self, "bounds");
  v26 = v25;
  -[UIButton bounds](self->_clearButton, "bounds");
  v28 = v26 - v27 + -15.0 + 5.0;
  -[UIButton bounds](self->_clearButton, "bounds");
  v30 = v29;
  -[UIButton bounds](self->_clearButton, "bounds");
  -[UIButton setFrame:](clearButton, "setFrame:", v23, v28, v30);
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)clearButtonHidden
{
  return self->_clearButtonHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
