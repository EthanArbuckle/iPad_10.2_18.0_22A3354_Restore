@implementation SBHAddWidgetDetailSheetWidgetDescriptionView

- (SBHAddWidgetDetailSheetWidgetDescriptionView)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  SBHAddWidgetDetailSheetWidgetDescriptionView *v8;
  UILabel *v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  UILabel *descriptionLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBHAddWidgetDetailSheetWidgetDescriptionView;
  v8 = -[SBHAddWidgetDetailSheetWidgetDescriptionView init](&v26, sel_init);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = v8->_titleLabel;
    -[SBHAddWidgetDetailSheetWidgetDescriptionView _titleLabelFont](v8, "_titleLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v8->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setText:](v8->_titleLabel, "setText:", v6);
    -[UILabel setNumberOfLines:](v8->_titleLabel, "setNumberOfLines:", 0);
    -[SBHAddWidgetDetailSheetWidgetDescriptionView addSubview:](v8, "addSubview:", v8->_titleLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    descriptionLabel = v8->_descriptionLabel;
    v8->_descriptionLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v8->_descriptionLabel, "setNumberOfLines:", 0);
    v17 = v8->_descriptionLabel;
    -[SBHAddWidgetDetailSheetWidgetDescriptionView _descriptionLabelFont](v8, "_descriptionLabelFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    v19 = v8->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    -[UILabel setTextAlignment:](v8->_descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setText:](v8->_descriptionLabel, "setText:", v7);
    -[SBHAddWidgetDetailSheetWidgetDescriptionView addSubview:](v8, "addSubview:", v8->_descriptionLabel);
    -[SBHAddWidgetDetailSheetWidgetDescriptionView _createConstraints](v8, "_createConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__contentSizeCategoryDidChange, *MEMORY[0x1E0DC48E8], 0);

    objc_opt_self();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)-[SBHAddWidgetDetailSheetWidgetDescriptionView registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", v23, sel__contentSizeCategoryDidChange);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetDetailSheetWidgetDescriptionView;
  -[SBHAddWidgetDetailSheetWidgetDescriptionView dealloc](&v4, sel_dealloc);
}

- (void)_createConstraints
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
  void *v13;
  void *v14;
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
  _QWORD v26[9];

  v26[7] = *MEMORY[0x1E0C80C00];
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView topAnchor](self, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView leadingAnchor](self, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView trailingAnchor](self, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, -16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  -[UILabel topAnchor](self->_descriptionLabel, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v14, 4.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v13;
  -[UILabel leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v5;
  -[UILabel trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v8;
  -[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v12);

}

- (id)_titleLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4B50];
  -[SBHAddWidgetDetailSheetWidgetDescriptionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionLabelFont
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01928], "preferredFontProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC4A88];
  -[SBHAddWidgetDetailSheetWidgetDescriptionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBHAddWidgetDetailSheetWidgetDescriptionView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView _titleLabelFont](self, "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  -[SBHAddWidgetDetailSheetWidgetDescriptionView descriptionLabel](self, "descriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetDetailSheetWidgetDescriptionView _descriptionLabelFont](self, "_descriptionLabelFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[SBHAddWidgetDetailSheetWidgetDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
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
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
