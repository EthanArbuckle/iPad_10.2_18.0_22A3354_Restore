@implementation TTRIPopupMenuTableViewCell

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

- (id)titleFont
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0DC1350];
  v3 = *MEMORY[0x1E0DC4A88];
  -[TTRIPopupMenuTableViewCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:compatibleWithTraitCollection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithDesign:", *MEMORY[0x1E0DC13A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buttonTitleAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  -[TTRIPopupMenuTableViewCell titleFont](self, "titleFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TTRIPopupMenuTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[TTRIPopupMenuTableViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[NUITableViewContainerCell containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateIntrinsicContentSize");

}

- (void)setAccessoryTitle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
  -[TTRIPopupMenuTableViewCell buttonTitleAttributes](self, "buttonTitleAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "initWithString:attributes:", v5, v7);

  -[TTRIPopupMenuTableViewCell menuButton](self, "menuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttributedTitle:forState:", v10, 0);

  -[TTRIPopupMenuTableViewCell accessoriesStackView](self, "accessoriesStackView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateIntrinsicContentSize");

}

- (void)setPopupMenu:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TTRIPopupMenuTableViewCell menuButton](self, "menuButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenu:", v4);

  -[TTRIPopupMenuTableViewCell menuButton](self, "menuButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setChangesSelectionAsPrimaryAction:", 1);

  -[TTRIPopupMenuTableViewCell menuButton](self, "menuButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  -[TTRIPopupMenuTableViewCell menuButton](self, "menuButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRIPopupMenuTableViewCell _setPopupMenuButton:](self, "_setPopupMenuButton:", v8);

}

- (TTRIPopupMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TTRIPopupMenuTableViewCell *v4;
  TTRIPopupMenuTableViewCell *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)TTRIPopupMenuTableViewCell;
  v4 = -[NUITableViewContainerCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[NUITableViewContainerCell containerView](v4, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDistribution:", 4);

    v7 = objc_alloc(MEMORY[0x1E0DC3990]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TTRIPopupMenuTableViewCell titleFont](v5, "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleAlignment:", 3);
    objc_msgSend(v10, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "background");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v13, "setContentHorizontalAlignment:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v14);

    objc_msgSend(v13, "setHidden:", 1);
    -[TTRIPopupMenuTableViewCell setMenuButton:](v5, "setMenuButton:", v13);
    -[TTRIPopupMenuTableViewCell setTitleLabel:](v5, "setTitleLabel:", v8);
    v15 = objc_alloc(MEMORY[0x1E0CFAAB0]);
    v25[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithArrangedSubviews:", v16);

    objc_msgSend(v17, "setSpacing:", 8.0);
    objc_msgSend(v17, "setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:", 1);
    -[TTRIPopupMenuTableViewCell setAccessoriesStackView:](v5, "setAccessoriesStackView:", v17);
    -[TTRIPopupMenuTableViewCell accessoriesStackView](v5, "accessoriesStackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBaselineRelativeArrangement:", 1);

    -[NUITableViewContainerCell containerView](v5, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBaselineRelativeArrangement:", 1);

    LODWORD(v20) = 1148846080;
    objc_msgSend(v13, "setLayoutSize:withContentPriority:", *MEMORY[0x1E0CFAA88], *(double *)(MEMORY[0x1E0CFAA88] + 8), v20);
    -[NUITableViewContainerCell containerView](v5, "containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addArrangedSubview:", v8);

    -[NUITableViewContainerCell containerView](v5, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addArrangedSubview:", v17);

    -[TTRIPopupMenuTableViewCell setSeparatorInset:](v5, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }
  return v5;
}

- (NUIContainerStackView)accessoriesStackView
{
  return self->_accessoriesStackView;
}

- (void)setAccessoriesStackView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesStackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->_menuButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_accessoriesStackView, 0);
}

@end
