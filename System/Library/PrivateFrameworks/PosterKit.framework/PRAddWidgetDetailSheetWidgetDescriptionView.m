@implementation PRAddWidgetDetailSheetWidgetDescriptionView

- (PRAddWidgetDetailSheetWidgetDescriptionView)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  PRAddWidgetDetailSheetWidgetDescriptionView *v8;
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
  double v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PRAddWidgetDetailSheetWidgetDescriptionView;
  v8 = -[PRAddWidgetDetailSheetWidgetDescriptionView init](&v24, sel_init);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = v8->_titleLabel;
    -[PRAddWidgetDetailSheetWidgetDescriptionView _titleLabelFont](v8, "_titleLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v8->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setText:](v8->_titleLabel, "setText:", v6);
    -[UILabel setNumberOfLines:](v8->_titleLabel, "setNumberOfLines:", 0);
    -[PRAddWidgetDetailSheetWidgetDescriptionView addSubview:](v8, "addSubview:", v8->_titleLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    descriptionLabel = v8->_descriptionLabel;
    v8->_descriptionLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v8->_descriptionLabel, "setNumberOfLines:", 0);
    v17 = v8->_descriptionLabel;
    -[PRAddWidgetDetailSheetWidgetDescriptionView _descriptionLabelFont](v8, "_descriptionLabelFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    v19 = v8->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v20);

    -[UILabel setTextAlignment:](v8->_descriptionLabel, "setTextAlignment:", 1);
    -[UILabel setText:](v8->_descriptionLabel, "setText:", v7);
    LODWORD(v21) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v8->_descriptionLabel, "setContentHuggingPriority:forAxis:", 1, v21);
    -[PRAddWidgetDetailSheetWidgetDescriptionView addSubview:](v8, "addSubview:", v8->_descriptionLabel);
    -[PRAddWidgetDetailSheetWidgetDescriptionView _createConstraints](v8, "_createConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v8, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

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
  v4.super_class = (Class)PRAddWidgetDetailSheetWidgetDescriptionView;
  -[PRAddWidgetDetailSheetWidgetDescriptionView dealloc](&v4, sel_dealloc);
}

- (void)_createConstraints
{
  double v2;
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
  void *v26;
  _QWORD v27[9];

  v27[7] = *MEMORY[0x1E0C80C00];
  LODWORD(v2) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v2);
  v18 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView topAnchor](self, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView leadingAnchor](self, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 16.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, -16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v17;
  -[UILabel topAnchor](self->_descriptionLabel, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, 4.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v14;
  -[UILabel leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView leadingAnchor](self, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v6;
  -[UILabel trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView trailingAnchor](self, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -16.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v9;
  -[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView bottomAnchor](self, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v13);

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
  -[PRAddWidgetDetailSheetWidgetDescriptionView traitCollection](self, "traitCollection");
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
  -[PRAddWidgetDetailSheetWidgetDescriptionView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v4, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PRAddWidgetDetailSheetWidgetDescriptionView titleLabel](self, "titleLabel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView _titleLabelFont](self, "_titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[PRAddWidgetDetailSheetWidgetDescriptionView descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionView _descriptionLabelFont](self, "_descriptionLabelFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  -[PRAddWidgetDetailSheetWidgetDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRAddWidgetDetailSheetWidgetDescriptionView;
  v4 = a3;
  -[PRAddWidgetDetailSheetWidgetDescriptionView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PRAddWidgetDetailSheetWidgetDescriptionView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((v4 & 1) == 0)
    -[PRAddWidgetDetailSheetWidgetDescriptionView _contentSizeCategoryDidChange:](self, "_contentSizeCategoryDidChange:", 0);
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
