@implementation UIPrintTableViewHeaderFooterView

- (UIPrintTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  UIPrintTableViewHeaderFooterView *v3;
  id v4;
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
  UILabel *v17;
  UILabel *label;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  UIActivityIndicatorView *spinner;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)UIPrintTableViewHeaderFooterView;
  v3 = -[UIPrintTableViewHeaderFooterView initWithReuseIdentifier:](&v35, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrintTableViewHeaderFooterView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[UIPrintTableViewHeaderFooterView contentView](v3, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintTableViewHeaderFooterView contentView](v3, "contentView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 5, 0, v34, 5, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v33;
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintTableViewHeaderFooterView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 6, 0, v8, 6, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v9;
    v10 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintTableViewHeaderFooterView contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, v11, 3, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v12;
    v13 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintTableViewHeaderFooterView contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 4, 0, v14, 4, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addConstraints:", v16);

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v3->_label;
    v3->_label = v17;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_label, "setFont:", v19);

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 4);
    -[UILabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v20);

    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", 0);
    -[UILabel setOpaque:](v3->_label, "setOpaque:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v3->_label);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 5, 0, v4, 17, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 3, 0, v4, 15, 1.0, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v22;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_label, 4, 0, v4, 16, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v24);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 4);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v25;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "addSubview:", v3->_spinner);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_spinner, 5, 0, v3->_label, 6, 1.0, 14.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v27;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_spinner, 6, -1, v4, 18, 1.0, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v28;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_spinner, 3, 0, v4, 15, 1.0, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v30);

  }
  return v3;
}

- (NSString)messageText
{
  void *v2;
  void *v3;

  -[UIPrintTableViewHeaderFooterView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMessageText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIPrintTableViewHeaderFooterView label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (BOOL)spinSpinner
{
  void *v2;
  char v3;

  -[UIPrintTableViewHeaderFooterView spinner](self, "spinner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnimating");

  return v3;
}

- (void)setSpinSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[UIPrintTableViewHeaderFooterView spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintTableViewHeaderFooterView label](self, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[UIPrintTableViewHeaderFooterView spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  v5.receiver = self;
  v5.super_class = (Class)UIPrintTableViewHeaderFooterView;
  -[UIPrintTableViewHeaderFooterView prepareForReuse](&v5, sel_prepareForReuse);
}

- (BOOL)spinnerHidden
{
  return self->_spinnerHidden;
}

- (void)setSpinnerHidden:(BOOL)a3
{
  self->_spinnerHidden = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
