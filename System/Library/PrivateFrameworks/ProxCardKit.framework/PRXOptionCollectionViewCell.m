@implementation PRXOptionCollectionViewCell

- (PRXOptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  PRXOptionCollectionViewCell *v3;
  PRXOptionCollectionViewCell *v4;
  void *v5;
  UILabel *v6;
  UILabel *textLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PRXSelectionIndicatorView *v12;
  PRXSelectionIndicatorView *selectionIndicator;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
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
  PRXOptionCollectionViewCell *v30;
  void *v32;
  void *v33;
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
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[8];

  v47[6] = *MEMORY[0x24BDAC8D0];
  v46.receiver = self;
  v46.super_class = (Class)PRXOptionCollectionViewCell;
  v3 = -[PRXOptionCollectionViewCell initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRXOptionCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDirectionalLayoutMargins:", 8.0, 15.0, 8.0, 15.0);

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v6;

    objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BDF77B0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v45, "pointSize");
    objc_msgSend(v9, "fontWithDescriptor:size:", v45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_textLabel, "setFont:", v10);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXOptionCollectionViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_textLabel);

    v12 = objc_alloc_init(PRXSelectionIndicatorView);
    selectionIndicator = v4->_selectionIndicator;
    v4->_selectionIndicator = v12;

    -[PRXSelectionIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4->_selectionIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXOptionCollectionViewCell contentView](v4, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v4->_selectionIndicator);

    v15 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    objc_msgSend(v15, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderColor:", v17);

    objc_msgSend(v15, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderWidth:", 1.0);

    v44 = v15;
    objc_msgSend(v15, "_setContinuousCornerRadius:", 12.0);
    -[PRXOptionCollectionViewCell setBackgroundView:](v4, "setBackgroundView:", v15);
    -[PRXOptionCollectionViewCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layoutMarginsGuide");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x24BDD1628];
    -[UILabel leadingAnchor](v4->_textLabel, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v41;
    -[UILabel trailingAnchor](v4->_textLabel, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXSelectionIndicatorView leadingAnchor](v4->_selectionIndicator, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v38;
    -[UILabel centerYAnchor](v4->_textLabel, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v34;
    -[UILabel topAnchor](v4->_textLabel, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v22;
    -[PRXSelectionIndicatorView centerYAnchor](v4->_selectionIndicator, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[4] = v25;
    -[PRXSelectionIndicatorView trailingAnchor](v4->_selectionIndicator, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47[5] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v29);

    v30 = v4;
  }

  return v4;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXOptionCollectionViewCell;
  -[PRXOptionCollectionViewCell _dynamicUserInterfaceTraitDidChange](&v7, sel__dynamicUserInterfaceTraitDidChange);
  objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[PRXOptionCollectionViewCell backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v4);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PRXOptionCollectionViewCell;
  -[PRXOptionCollectionViewCell setSelected:](&v5, sel_setSelected_);
  -[PRXSelectionIndicatorView setSelected:](self->_selectionIndicator, "setSelected:", v3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_selectionIndicator, 0);
}

@end
