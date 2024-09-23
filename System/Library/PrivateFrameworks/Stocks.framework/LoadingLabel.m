@implementation LoadingLabel

- (LoadingLabel)init
{
  LoadingLabel *v2;
  UILabel *v3;
  UILabel *label;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIActivityIndicatorView *activityIndicator;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LoadingLabel;
  v2 = -[LoadingLabel initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    label = v2->_label;
    v2->_label = v3;

    +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lightFontOfSize:", 14.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v2->_label, "setFont:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v2->_label, "setTextColor:", v7);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v2->_label, "setBackgroundColor:", v8);

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 1);
    activityIndicator = v2->_activityIndicator;
    v2->_activityIndicator = (UIActivityIndicatorView *)v9;

    -[UIActivityIndicatorView setHidesWhenStopped:](v2->_activityIndicator, "setHidesWhenStopped:", 1);
    -[LoadingLabel addSubview:](v2, "addSubview:", v2->_label);
    -[LoadingLabel addSubview:](v2, "addSubview:", v2->_activityIndicator);
  }
  return v2;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGRect v10;

  -[UIActivityIndicatorView frame](self->_activityIndicator, "frame");
  v4 = v3;
  if (-[UIActivityIndicatorView isHidden](self->_activityIndicator, "isHidden"))
    v5 = 0.0;
  else
    v5 = v4 + 8.0;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v7 = v6;
  v9 = v8;
  v10.origin.y = 0.0;
  v10.origin.x = v5;
  v10.size.width = v7;
  v10.size.height = v9;
  CGRectGetMaxX(v10);
  -[LoadingLabel frame](self, "frame");
  -[LoadingLabel setFrame:](self, "setFrame:");
  UIRectCenteredYInRect();
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:");
  UIRectCenteredYInRect();
  -[UILabel setFrame:](self->_label, "setFrame:");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (a3)
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  v5.receiver = self;
  v5.super_class = (Class)LoadingLabel;
  -[LoadingLabel setHidden:](&v5, sel_setHidden_, v3);
}

- (id)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3 showingActivity:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNetworkReachable");

  if ((v7 & 1) == 0)
  {
    +[StocksBundles getBundle:](StocksBundles, "getBundle:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Network Unavailable"), &stru_24D74CF50, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_label, "setText:", v9);

    goto LABEL_5;
  }
  -[UILabel setText:](self->_label, "setText:", v10);
  if (!v4)
  {
LABEL_5:
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
    goto LABEL_6;
  }
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
LABEL_6:
  -[LoadingLabel sizeToFit](self, "sizeToFit");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
