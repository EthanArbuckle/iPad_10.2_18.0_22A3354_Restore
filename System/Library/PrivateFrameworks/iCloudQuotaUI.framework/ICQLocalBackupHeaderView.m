@implementation ICQLocalBackupHeaderView

- (ICQLocalBackupHeaderView)initWithSpecifier:(id)a3
{
  ICQLocalBackupHeaderView *v3;
  ICQLocalBackupHeaderView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIActivityIndicatorView *spinner;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ICQLocalBackupHeaderView;
  v3 = -[ICQSubtitleHeaderView initWithSpecifier:](&v14, sel_initWithSpecifier_, a3);
  v4 = v3;
  if (v3)
  {
    -[ICQSubtitleHeaderView titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACKUP_OPTIONS"), &stru_24E400750, CFSTR("BackupInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uppercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v8);

    -[ICQSubtitleHeaderView titleLabel](v4, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v10);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v11;

    -[UIActivityIndicatorView setAlpha:](v4->_spinner, "setAlpha:", 0.0);
    -[ICQLocalBackupHeaderView addSubview:](v4, "addSubview:", v4->_spinner);
  }
  return v4;
}

- (void)showSpinner
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", 1.0);
}

- (void)hideSpinner
{
  -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", 0.0);
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  float v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)ICQLocalBackupHeaderView;
  -[ICQSubtitleHeaderView layoutSubviews](&v23, sel_layoutSubviews);
  -[ICQSubtitleHeaderView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  v13 = v12;
  v15 = v14;
  v16 = -[ICQLocalBackupHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v17 = v5;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  if (v16)
    v21 = CGRectGetMinX(*(CGRect *)&v17) + -6.0 - v13;
  else
    v21 = CGRectGetMaxX(*(CGRect *)&v17) + 6.0;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  v22 = CGRectGetMidY(v24) + v15 * -0.5;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v21, floorf(v22), v13, v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
