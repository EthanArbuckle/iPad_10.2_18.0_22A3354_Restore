@implementation CACCorrectionsCollectionViewCell

- (CACCorrectionsCollectionViewCell)initWithFrame:(CGRect)a3
{
  CACCorrectionsCollectionViewCell *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  UILabel *textLabel;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[5];

  v41[4] = *MEMORY[0x24BDAC8D0];
  v40.receiver = self;
  v40.super_class = (Class)CACCorrectionsCollectionViewCell;
  v3 = -[CACCorrectionsCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACCorrectionsCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[CACCorrectionsCollectionViewCell layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderColor:", v8);

    objc_msgSend(v5, "scaledValueForValue:", 0.0);
    v11 = round(v10);
    -[CACCorrectionsCollectionViewCell layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", v11);

    objc_msgSend(v5, "scaledValueForValue:", 8.0);
    v14 = round(v13);
    -[CACCorrectionsCollectionViewCell layer](v3, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", v14);

    v16 = objc_opt_new();
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_textLabel, "setFont:", v18);

    -[UILabel setTextAlignment:](v3->_textLabel, "setTextAlignment:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v3->_textLabel, "setNumberOfLines:", 0);
    -[CACCorrectionsCollectionViewCell contentView](v3, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v3->_textLabel);
    v39 = v5;
    objc_msgSend(v5, "scaledValueForValue:", 8.0);
    v21 = v20;
    objc_msgSend(v5, "scaledValueForValue:", 8.0);
    v23 = v22;
    v33 = (void *)MEMORY[0x24BDD1628];
    -[UILabel leadingAnchor](v3->_textLabel, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v36;
    -[UILabel trailingAnchor](v3->_textLabel, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v24;
    -[UILabel topAnchor](v3->_textLabel, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v27;
    -[UILabel bottomAnchor](v3->_textLabel, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v31);

  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[UILabel accessibilityLabel](self->_textLabel, "accessibilityLabel");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACCorrectionsCollectionViewCell;
  -[CACCorrectionsCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  if (a3)
    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACCorrectionsCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CACCorrectionsCollectionViewCell;
  -[CACCorrectionsCollectionViewCell preferredLayoutAttributesFittingAttributes:](&v7, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  objc_msgSend(v3, "setSize:", fmax(v4, 40.0), fmax(v5, 40.0));
  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
