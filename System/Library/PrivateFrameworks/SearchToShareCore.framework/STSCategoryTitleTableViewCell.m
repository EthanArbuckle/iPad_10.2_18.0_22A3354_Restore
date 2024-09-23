@implementation STSCategoryTitleTableViewCell

- (STSCategoryTitleTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  STSCategoryTitleTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIButton *clearButton;
  UIButton *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)STSCategoryTitleTableViewCell;
  v4 = -[STSCategoryTitleTableViewCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE240]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSCategoryTitleTableViewCell textLabel](v4, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v6, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v8);

    -[STSCategoryTitleTableViewCell textLabel](v4, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
    STSLocalizedString(CFSTR("CLEAR"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v10, "setTitle:forState:", v11, 0);
    -[UIButton titleLabel](v10, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    -[UIButton titleLabel](v10, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v10, "setTintColor:", v15);

    -[UIButton addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v4, sel_clearButtonPressed_, 64);
    -[UIButton setHidden:](v10, "setHidden:", 1);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    clearButton = v4->_clearButton;
    v4->_clearButton = v10;
    v17 = v10;

    -[STSCategoryTitleTableViewCell addSubview:](v4, "addSubview:", v4->_clearButton);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryTitleTableViewCell readableContentGuide](v4, "readableContentGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton centerYAnchor](v4->_clearButton, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryTitleTableViewCell centerYAnchor](v4, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v22);

    -[UIButton trailingAnchor](v4->_clearButton, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryTitleTableViewCell contentView](v4, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -4.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v26);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v18);
  }
  return v4;
}

- (void)setClearButtonHidden:(BOOL)a3
{
  -[UIButton setHidden:](self->_clearButton, "setHidden:", a3);
}

- (void)clearButtonPressed:(id)a3
{
  STSCategoryTitleTableViewCellDelegate **p_selectionDelegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_selectionDelegate = &self->_selectionDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_selectionDelegate);
  -[STSCategoryTitleTableViewCell result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "clearButton:pressedForCategoryResult:", v5, v6);

}

- (STSCategoryResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (BOOL)clearButtonHidden
{
  return self->_clearButtonHidden;
}

- (STSCategoryTitleTableViewCellDelegate)selectionDelegate
{
  return (STSCategoryTitleTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
}

@end
