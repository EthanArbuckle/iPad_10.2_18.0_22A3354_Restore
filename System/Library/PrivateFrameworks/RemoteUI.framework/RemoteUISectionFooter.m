@implementation RemoteUISectionFooter

- (RemoteUISectionFooter)initWithAttributes:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  RemoteUISectionFooter *v7;
  RUILinkLabel *v8;
  RUILinkLabel *linkLabel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  UIStackView *v18;
  UIStackView *stackView;
  UIStackView *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *topContraint;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[4];
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)RemoteUISectionFooter;
  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = -[RemoteUISectionFooter initWithFrame:](&v37, sel_initWithFrame_, a3, *MEMORY[0x24BDBF090], v4, v5, v6);
  if (v7)
  {
    v8 = -[RUILinkLabel initWithFrame:]([RUILinkLabel alloc], "initWithFrame:", v3, v4, v5, v6);
    linkLabel = v7->_linkLabel;
    v7->_linkLabel = v8;

    RemoteUIFooterFont();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel textLabel](v7->_linkLabel, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    RemoteUIFooterTextColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel textLabel](v7->_linkLabel, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILinkLabel textLabel](v7->_linkLabel, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

    -[RUILinkLabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_linkLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = objc_alloc(MEMORY[0x24BEBD978]);
    v39[0] = v7->_linkLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (UIStackView *)objc_msgSend(v16, "initWithArrangedSubviews:", v17);

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v18, "setAxis:", 1);
    -[UIStackView setDistribution:](v18, "setDistribution:", 3);
    -[UIStackView setAlignment:](v18, "setAlignment:", 1);
    stackView = v7->_stackView;
    v7->_stackView = v18;
    v20 = v18;

    -[RemoteUISectionFooter addSubview:](v7, "addSubview:", v20);
    -[UIStackView topAnchor](v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUISectionFooter topAnchor](v7, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 8.0);
    v23 = objc_claimAutoreleasedReturnValue();
    topContraint = v7->_topContraint;
    v7->_topContraint = (NSLayoutConstraint *)v23;

    v34 = (void *)MEMORY[0x24BDD1628];
    v38[0] = v7->_topContraint;
    -[UIStackView leadingAnchor](v20, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUISectionFooter leadingAnchor](v7, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v25;
    -[UIStackView trailingAnchor](v20, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUISectionFooter trailingAnchor](v7, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v28;
    -[UIStackView bottomAnchor](v20, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUISectionFooter bottomAnchor](v7, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -7.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v32);

  }
  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[RemoteUISectionFooter footerHeightForWidth:inView:](self, "footerHeightForWidth:inView:", self, a3.width, a3.height);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UILabel)textLabel
{
  return -[RUILinkLabel textLabel](self->_linkLabel, "textLabel");
}

- (UIButton)linkButton
{
  if (!self->_usesCustomTextAlignment)
  {
    -[RUILinkLabel setTextAlignment:](self->_linkLabel, "setTextAlignment:", 1);
    -[RemoteUISectionFooter setNeedsLayout](self, "setNeedsLayout");
  }
  return -[RUILinkLabel linkButton](self->_linkLabel, "linkButton");
}

- (void)setLinkURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;
  id linkAction;
  RUILinkLabel *linkLabel;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v5 = (NSURL *)a3;
  v6 = v5;
  if (self->_linkURL != v5)
  {
    if (v5)
    {
      linkAction = self->_linkAction;
      self->_linkAction = 0;

    }
    objc_storeStrong((id *)&self->_linkURL, a3);
    objc_initWeak(&location, self);
    linkLabel = self->_linkLabel;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __36__RemoteUISectionFooter_setLinkURL___block_invoke;
    v12 = &unk_24C297688;
    objc_copyWeak(&v13, &location);
    -[RUILinkLabel setAction:](linkLabel, "setAction:", &v9);
    -[RemoteUISectionFooter setNeedsLayout](self, "setNeedsLayout", v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __36__RemoteUISectionFooter_setLinkURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_linkPressed");

}

- (void)setLinkAction:(id)a3
{
  id v4;
  NSURL *linkURL;
  void *v6;
  id linkAction;
  id v8;

  v4 = a3;
  if (self->_linkAction != v4)
  {
    v8 = v4;
    if (v4)
    {
      linkURL = self->_linkURL;
      self->_linkURL = 0;

    }
    v6 = (void *)objc_msgSend(v8, "copy");
    linkAction = self->_linkAction;
    self->_linkAction = v6;

    -[RUILinkLabel setAction:](self->_linkLabel, "setAction:", self->_linkAction);
    -[RemoteUISectionFooter setNeedsLayout](self, "setNeedsLayout");
    v4 = v8;
  }

}

- (void)setText:(id)a3 attributes:(id)a4
{
  -[RUILinkLabel setText:](self->_linkLabel, "setText:", a3, a4);
  -[RemoteUISectionFooter setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextAlignment:(int64_t)a3
{
  if (-[RUILinkLabel textAlignment](self->_linkLabel, "textAlignment") != a3)
  {
    self->_usesCustomTextAlignment = 1;
    -[RUILinkLabel setTextAlignment:](self->_linkLabel, "setTextAlignment:", a3);
    -[RemoteUISectionFooter setNeedsLayout](self, "setNeedsLayout");
  }
  if ((unint64_t)a3 <= 4)
    -[UIStackView setAlignment:](self->_stackView, "setAlignment:", qword_209F75FE8[a3]);
}

- (void)setTextColor:(id)a3
{
  RUILinkLabel *linkLabel;
  id v4;
  id v5;

  linkLabel = self->_linkLabel;
  v4 = a3;
  -[RUILinkLabel textLabel](linkLabel, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setTopMargin:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_topContraint, "setConstant:", a3);
}

- (void)setFont:(id)a3
{
  -[RUILinkLabel setFont:](self->_linkLabel, "setFont:", a3);
}

- (double)_footerHeightForWidth:(double)a3
{
  double v3;

  -[RemoteUISectionFooter _labelSizeForWidth:](self, "_labelSizeForWidth:", a3);
  return v3;
}

- (CGSize)_labelSizeForWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  -[RemoteUISectionFooter systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a3, *(double *)(MEMORY[0x24BEBE588] + 8));
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_linkPressed
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[RemoteUISectionFooter linkURL](self, "linkURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "footerView:activatedLinkWithURL:", self, v3);

}

- (RUITableFooterDelegate)delegate
{
  return (RUITableFooterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (id)linkAction
{
  return self->_linkAction;
}

- (RUILinkLabel)linkLabel
{
  return self->_linkLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkAction, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomContraint, 0);
  objc_storeStrong((id *)&self->_topContraint, 0);
  objc_storeStrong((id *)&self->_linkLabel, 0);
}

@end
