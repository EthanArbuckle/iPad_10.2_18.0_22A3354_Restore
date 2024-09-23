@implementation PKAddressEditorTableViewCell

- (PKAddressEditorTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PKAddressEditorTableViewCell *v4;
  void *v5;
  id v6;
  uint64_t v7;
  UIStackView *stackView;
  UIStackView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKAddressEditorTableViewCell;
  v4 = -[PKAddressEditorTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAddressEditorTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[PKAddressEditorTableViewCell setOpaque:](v4, "setOpaque:", 0);
    -[PKAddressEditorTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    stackView = v4->_stackView;
    v4->_stackView = (UIStackView *)v7;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v4->_stackView, "setDistribution:", 1);
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", 0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v4->_stackView, "setLayoutMarginsRelativeArrangement:", 1);
    -[UIStackView setSpacing:](v4->_stackView, "setSpacing:", 10.0);
    -[UIStackView setPreservesSuperviewLayoutMargins:](v4->_stackView, "setPreservesSuperviewLayoutMargins:", 1);
    v9 = v4->_stackView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[PKAddressEditorTableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_stackView);
    objc_msgSend(v11, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_stackView, 6, 0, v11, 6, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v12);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_stackView, 5, 0, v11, 5, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v13);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_stackView, 3, 0, v11, 3, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v14);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_stackView, 4, 0, v11, 4, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v15);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4->_stackView, 8, 1, 0, 0, 1.0, 44.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addConstraint:", v16);

    -[PKAddressEditorTableViewCell setNeedsUpdateConstraints](v4, "setNeedsUpdateConstraints");
    -[PKAddressEditorTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67878]);

  }
  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKAddressEditorTableViewCell;
  -[PKAddressEditorTableViewCell prepareForReuse](&v13, sel_prepareForReuse);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", v8);
        objc_msgSend(v8, "removeFromSuperview");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
