@implementation AccountLinkButtonView

- (AccountLinkButtonView)initWithSpecifier:(id)a3
{
  id v4;
  AccountLinkButtonView *v5;
  AccountLinkButton *v6;
  AccountLinkButton *linkButton;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  AccountLinkButtonView *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AccountLinkButtonView;
  v5 = -[AccountLinkButtonView init](&v14, "init");
  if (v5)
  {
    v6 = -[AccountLinkButton initWithFrame:]([AccountLinkButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    linkButton = v5->_linkButton;
    v5->_linkButton = v6;

    -[AccountLinkButton addTarget:action:forControlEvents:](v5->_linkButton, "addTarget:action:forControlEvents:", v5, "_goToAccountURL", 64);
    -[AccountLinkButtonView addSubview:](v5, "addSubview:", v5->_linkButton);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyForKey:", CFSTR("accountLinkButtonTitle")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyForKey:", CFSTR("accountLinkButtonURL")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "propertyForKey:", CFSTR("accountLinkButtonViewHeight")));
    -[AccountLinkButton setTitle:forState:](v5->_linkButton, "setTitle:forState:", v8, 0);
    objc_storeStrong((id *)&v5->_helpURL, v9);
    if (v10)
      objc_msgSend(v10, "floatValue");
    else
      v11 = 1125515264;
    LODWORD(v5->_height) = v11;
    v12 = v5;

  }
  return v5;
}

- (void)_goToAccountURL
{
  id v3;

  if (self->_helpURL)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v3, "openURL:options:completionHandler:", self->_helpURL, &__NSDictionary0__struct, 0);

  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double width;
  double height;
  float v13;
  double v14;
  float v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v16.receiver = self;
  v16.super_class = (Class)AccountLinkButtonView;
  -[AccountLinkButtonView layoutSubviews](&v16, "layoutSubviews");
  -[AccountLinkButton sizeToFit](self->_linkButton, "sizeToFit");
  -[AccountLinkButtonView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AccountLinkButton frame](self->_linkButton, "frame");
  v18 = CGRectInset(v17, -3.0, -3.0);
  width = v18.size.width;
  height = v18.size.height;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  v13 = CGRectGetMidX(v18) - width * 0.5;
  v14 = roundf(v13);
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  v15 = CGRectGetMidY(v19) - height * 0.5;
  -[AccountLinkButton setFrame:](self->_linkButton, "setFrame:", v14, roundf(v15), width, height);
}

- (double)preferredHeightForWidth:(double)a3
{
  return self->_height;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpURL, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end
