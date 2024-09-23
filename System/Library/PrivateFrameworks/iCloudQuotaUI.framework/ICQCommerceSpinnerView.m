@implementation ICQCommerceSpinnerView

- (ICQCommerceSpinnerView)initWithFrame:(CGRect)a3
{
  ICQCommerceSpinnerView *v3;
  uint64_t v4;
  UIActivityIndicatorView *spinner;
  id v6;
  uint64_t v7;
  UILabel *completeingPurchaseLabel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICQCommerceSpinnerView;
  v3 = -[ICQCommerceSpinnerView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView startAnimating](v3->_spinner, "startAnimating");
    -[ICQCommerceSpinnerView addSubview:](v3, "addSubview:", v3->_spinner);
    v6 = objc_alloc(MEMORY[0x24BEBD708]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    completeingPurchaseLabel = v3->_completeingPurchaseLabel;
    v3->_completeingPurchaseLabel = (UILabel *)v7;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("COMLPETING_PURCHASE"), &stru_24E400750, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_completeingPurchaseLabel, "setText:", v10);

    objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_completeingPurchaseLabel, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_completeingPurchaseLabel, "setFont:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v3->_completeingPurchaseLabel, "setBackgroundColor:", v13);

    -[UILabel sizeToFit](v3->_completeingPurchaseLabel, "sizeToFit");
    -[ICQCommerceSpinnerView addSubview:](v3, "addSubview:", v3->_completeingPurchaseLabel);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;

  -[ICQCommerceSpinnerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v8 = v7;
  v10 = v9;
  -[UILabel frame](self->_completeingPurchaseLabel, "frame");
  v12 = v11;
  v14 = v13;
  v15 = floor((v4 - v8 - v11 + -5.0) * 0.5);
  v16 = floor((v6 - v10) * 0.5);
  v18.origin.x = v15;
  v18.origin.y = v16;
  v18.size.width = v8;
  v18.size.height = v10;
  v17 = CGRectGetMaxX(v18) + 5.0;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v15, v16, v8, v10);
  -[UILabel setFrame:](self->_completeingPurchaseLabel, "setFrame:", v17, v16 + floor((v10 - v14) * 0.5), v12, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeingPurchaseLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
