@implementation PREditingTimeFontPickerCellView

- (PREditingTimeFontPickerCellView)initWithFrame:(CGRect)a3
{
  PREditingTimeFontPickerCellView *v3;
  UILabel *v4;
  UILabel *contentLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PREditingTimeFontPickerCellView;
  v3 = -[PREditingPickerCellView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    contentLabel = v3->_contentLabel;
    v3->_contentLabel = v4;

    -[UILabel setTextAlignment:](v3->_contentLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditingTimeFontPickerCellView addSubview:](v3, "addSubview:", v3->_contentLabel);
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_contentLabel, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTimeFontPickerCellView topAnchor](v3, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    -[UILabel centerXAnchor](v3->_contentLabel, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTimeFontPickerCellView centerXAnchor](v3, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    -[UILabel bottomAnchor](v3->_contentLabel, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTimeFontPickerCellView bottomAnchor](v3, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v14);

  }
  return v3;
}

- (void)configureWithFont:(id)a3 text:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PREditingTimeFontPickerCellView;
  -[PREditingFontPickerCellView configureWithFont:text:](&v9, sel_configureWithFont_text_, a3, a4);
  -[PREditingTimeFontPickerCellView contentLabel](self, "contentLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontPickerCellView contentFont](self, "contentFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[PREditingTimeFontPickerCellView contentLabel](self, "contentLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingFontPickerCellView contentText](self, "contentText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end
