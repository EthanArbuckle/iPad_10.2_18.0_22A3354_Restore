@implementation PUIOnboardingCell

- (PUIOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 title:(id)a5
{
  id v8;
  PUIOnboardingCell *v9;
  PUIOnboardingCell *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  UIStackView *stackView;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  UIImageView *symbolImageView;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  v8 = a5;
  v45.receiver = self;
  v45.super_class = (Class)PUIOnboardingCell;
  v9 = -[PUIOnboardingCell initWithStyle:reuseIdentifier:](&v45, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v10 = v9;
  if (v9)
  {
    -[PUIOnboardingCell setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSTableCell titleLabel](v10, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[PUIOnboardingCell detailTextLabel](v10, "detailTextLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);

    v13 = objc_opt_new();
    stackView = v10->_stackView;
    v10->_stackView = (UIStackView *)v13;

    -[UIStackView setSpacing:](v10->_stackView, "setSpacing:", 0.0);
    -[UIStackView setAxis:](v10->_stackView, "setAxis:", 1);
    -[UIStackView setAlignment:](v10->_stackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](v10->_stackView, "setDistribution:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v10->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIOnboardingCell contentView](v10, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v10->_stackView);

    -[UIStackView topAnchor](v10->_stackView, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell contentView](v10, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[UIStackView bottomAnchor](v10->_stackView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell contentView](v10, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, -16.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[UIStackView leadingAnchor](v10->_stackView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell contentView](v10, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIStackView trailingAnchor](v10->_stackView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell contentView](v10, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -16.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    v32 = objc_opt_new();
    symbolImageView = v10->_symbolImageView;
    v10->_symbolImageView = (UIImageView *)v32;

    -[UIImageView setContentMode:](v10->_symbolImageView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_symbolImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView widthAnchor](v10->_symbolImageView, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", 60.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UIImageView heightAnchor](v10->_symbolImageView, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToConstant:", 60.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setActive:", 1);

    -[UIStackView addArrangedSubview:](v10->_stackView, "addArrangedSubview:", v10->_symbolImageView);
    -[UIStackView setCustomSpacing:afterView:](v10->_stackView, "setCustomSpacing:afterView:", v10->_symbolImageView, 12.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "fontDescriptor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fontDescriptorWithSymbolicTraits:", 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)objc_opt_new();
    objc_msgSend(v41, "setText:", v8);
    objc_msgSend(v41, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTextColor:", v42);

    objc_msgSend(v41, "setTextAlignment:", 1);
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v40, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFont:", v43);

    -[UIStackView addArrangedSubview:](v10->_stackView, "addArrangedSubview:", v41);
  }

  return v10;
}

- (void)setDetailText:(id)a3 linkText:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3778];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

  v9 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setAlignment:", 1);
  v11 = objc_msgSend(v8, "length");
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v10, 0, v11);
  v12 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:value:range:", v12, v13, 0, v11);

  v14 = *MEMORY[0x1E0DC1138];
  v15 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:value:range:", v14, v16, 0, v11);

  objc_msgSend(v9, "setEditable:", 0);
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setSelectable:", 1);
  objc_msgSend(v9, "setScrollEnabled:", 0);
  objc_msgSend(v9, "setAttributedText:", v8);
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v9, "textContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v9, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v18);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v9);
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:forState:", v22, 0);
    objc_msgSend(v19, "titleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v21);

    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel_didTapOnboardingCellLink_, 64);
    -[UIStackView setCustomSpacing:afterView:](self->_stackView, "setCustomSpacing:afterView:", v9, 0.0);
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v19);

  }
}

- (void)setSymbolImage:(id)a3 tintColor:(id)a4
{
  UIImageView *symbolImageView;
  id v7;

  symbolImageView = self->_symbolImageView;
  v7 = a4;
  -[UIImageView setImage:](symbolImageView, "setImage:", a3);
  -[UIImageView setTintColor:](self->_symbolImageView, "setTintColor:", v7);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUIOnboardingCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  -[PUIOnboardingCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1, v7.receiver, v7.super_class);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUIOnboardingCellDelegateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nonretainedObjectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIOnboardingCell setDelegate:](self, "setDelegate:", v6);

}

- (void)didTapOnboardingCellLink:(id)a3
{
  id v4;

  -[PUIOnboardingCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapOnboardingCellLink:", self);

}

- (PUIOnboardingCellDelegate)delegate
{
  return (PUIOnboardingCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
