@implementation UIPrintSuppliesDisclaminerFooterView

- (UIPrintSuppliesDisclaminerFooterView)initWithReuseIdentifier:(id)a3
{
  UIPrintSuppliesDisclaminerFooterView *v3;
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
  id v17;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v46;
  _QWORD v47[4];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)UIPrintSuppliesDisclaminerFooterView;
  v3 = -[UIPrintSuppliesDisclaminerFooterView initWithReuseIdentifier:](&v46, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPrintSuppliesDisclaminerFooterView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

    -[UIPrintSuppliesDisclaminerFooterView contentView](v3, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView contentView](v3, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 5, 0, v44, 5, 1.0, 0.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v43;
    v7 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 6, 0, v8, 6, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v9;
    v10 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView contentView](v3, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 3, 0, v11, 3, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v12;
    v13 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView contentView](v3, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 4, 0, v14, 4, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addConstraints:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UIPrintSuppliesDisclaminerFooterView setDisclaimerLabel:](v3, "setDisclaimerLabel:", v17);

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", 0);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextAlignment:", 4);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLineBreakMode:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v23);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", 0);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setOpaque:", 0);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v28);

    v29 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v45, 5, 0, v4, 17, 1.0, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v30;
    v31 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 3, 0, v4, 15, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v33;
    v34 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 4, 0, v4, 16, 1.0, 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v36;
    v37 = (void *)MEMORY[0x1E0CB3718];
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](v3, "disclaimerLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v38, 6, 0, v4, 6, 1.0, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addConstraints:", v40);

  }
  return v3;
}

- (id)messageText
{
  void *v2;
  void *v3;

  -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](self, "disclaimerLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateDisclaimerTextWithInfoURL:(id)a3 tintColor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIPrintLabelTappableLinkGestureRecognizer *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[UIPrintSuppliesDisclaminerFooterView setSuppliesInfoURL:](self, "setSuppliesInfoURL:", a3);
  v7 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Supply levels shown are approximate."), CFSTR("Supply levels shown are approximate."), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithString:", v9);

  if (a3)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("More Info"), CFSTR("More Info"), CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0DC32A8];
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initWithString:attributes:", v15, v16);

    -[UIPrintSuppliesDisclaminerFooterView setSuppliesInfoLinkRange:](self, "setSuppliesInfoLinkRange:", objc_msgSend(v10, "length"), objc_msgSend(v17, "length"));
    objc_msgSend(v10, "appendAttributedString:", v17);
    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](self, "disclaimerLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUserInteractionEnabled:", 1);

    -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](self, "disclaimerLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIPrintLabelTappableLinkGestureRecognizer initWithTarget:action:]([UIPrintLabelTappableLinkGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleTapOnLabel_);
    objc_msgSend(v19, "addGestureRecognizer:", v20);

  }
  -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](self, "disclaimerLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedText:", v10);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](self, "disclaimerLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", 0);

  -[UIPrintSuppliesDisclaminerFooterView setSuppliesInfoURL:](self, "setSuppliesInfoURL:", 0);
  v4.receiver = self;
  v4.super_class = (Class)UIPrintSuppliesDisclaminerFooterView;
  -[UIPrintSuppliesDisclaminerFooterView prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)handleTapOnLabel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UIPrintSuppliesDisclaminerFooterView disclaimerLabel](self, "disclaimerLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIPrintSuppliesDisclaminerFooterView suppliesInfoLinkRange](self, "suppliesInfoLinkRange");
  v8 = objc_msgSend(v4, "didTapAttributedTextInLabel:inRange:", v5, v6, v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UIPrintSuppliesDisclaminerFooterView suppliesInfoURL](self, "suppliesInfoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:options:completionHandler:", v9, MEMORY[0x1E0C9AA70], 0);

  }
}

- (UILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (void)setDisclaimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLabel, a3);
}

- (NSURL)suppliesInfoURL
{
  return self->_suppliesInfoURL;
}

- (void)setSuppliesInfoURL:(id)a3
{
  objc_storeStrong((id *)&self->_suppliesInfoURL, a3);
}

- (_NSRange)suppliesInfoLinkRange
{
  _NSRange *p_suppliesInfoLinkRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_suppliesInfoLinkRange = &self->_suppliesInfoLinkRange;
  location = self->_suppliesInfoLinkRange.location;
  length = p_suppliesInfoLinkRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSuppliesInfoLinkRange:(_NSRange)a3
{
  self->_suppliesInfoLinkRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppliesInfoURL, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
}

@end
