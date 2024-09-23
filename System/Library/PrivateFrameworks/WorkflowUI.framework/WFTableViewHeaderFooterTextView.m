@implementation WFTableViewHeaderFooterTextView

- (WFTableViewHeaderFooterTextView)init
{
  objc_class *v3;
  void *v4;
  WFTableViewHeaderFooterTextView *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFTableViewHeaderFooterTextView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", v4);

  return v5;
}

- (WFTableViewHeaderFooterTextView)initWithReuseIdentifier:(id)a3
{
  WFTableViewHeaderFooterTextView *v3;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *label;
  UILabel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  WFTableViewHeaderFooterTextView *v18;
  void *v20;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFTableViewHeaderFooterTextView;
  v3 = -[WFTableViewHeaderFooterTextView initWithReuseIdentifier:](&v21, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v6);

    label = v3->_label;
    v3->_label = v4;
    v8 = v4;

    -[WFTableViewHeaderFooterTextView contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);
    v20 = (void *)MEMORY[0x24BDD1628];
    -[UILabel topAnchor](v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 8.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    -[UILabel bottomAnchor](v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

    -[WFTableViewHeaderFooterTextView setHorizontalPadding:](v3, "setHorizontalPadding:", 10.0);
    LODWORD(v17) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v17);

    v18 = v3;
  }

  return v3;
}

- (NSString)text
{
  void *v2;
  void *v3;

  -[WFTableViewHeaderFooterTextView label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFTableViewHeaderFooterTextView label](self, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setHorizontalPadding:(double)a3
{
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
  NSArray *v17;
  NSArray *horizontalConstraints;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  if (self->_horizontalPadding != a3)
  {
    -[WFTableViewHeaderFooterTextView label](self, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTableViewHeaderFooterTextView contentView](self, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layoutMarginsGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    -[WFTableViewHeaderFooterTextView label](self, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTableViewHeaderFooterTextView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v12, -a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFTableViewHeaderFooterTextView horizontalConstraints](self, "horizontalConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD1628];
      -[WFTableViewHeaderFooterTextView horizontalConstraints](self, "horizontalConstraints");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deactivateConstraints:", v16);

    }
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v20);
    -[WFTableViewHeaderFooterTextView horizontalConstraints](self, "horizontalConstraints");
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    horizontalConstraints = self->_horizontalConstraints;
    self->_horizontalConstraints = v17;

    self->_horizontalPadding = a3;
  }
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (UILabel)label
{
  return self->_label;
}

- (NSArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
