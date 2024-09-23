@implementation PKLinkedApplicationActionCell

- (PKLinkedApplicationActionCell)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKLinkedApplicationActionCell init](self, "init");
}

- (PKLinkedApplicationActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[PKLinkedApplicationActionCell initWithStoreIDs:appLaunchURL:reuseIdentifier:](self, "initWithStoreIDs:appLaunchURL:reuseIdentifier:", 0, 0, a4);
}

- (PKLinkedApplicationActionCell)initWithStoreIDs:(id)a3 appLaunchURL:(id)a4 reuseIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKLinkedApplication *v11;
  PKLinkedApplicationActionCell *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithStoreIDs:defaultLaunchURL:", v10, v9);

  v12 = -[PKLinkedApplicationActionCell initWithLinkedApplication:reuseIdentifier:](self, "initWithLinkedApplication:reuseIdentifier:", v11, v8);
  return v12;
}

- (PKLinkedApplicationActionCell)initWithLinkedApplication:(id)a3 reuseIdentifier:(id)a4
{
  PKLinkedApplication *v6;
  PKLinkedApplicationActionCell *v7;
  PKLinkedApplication *v8;
  objc_super v10;

  v6 = (PKLinkedApplication *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PKLinkedApplicationActionCell;
  v7 = -[PKLinkedApplicationActionCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v7)
  {
    v8 = v6;
    if (!v6)
      v8 = -[PKLinkedApplication initWithStoreIDs:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithStoreIDs:defaultLaunchURL:", 0, 0);
    objc_storeStrong((id *)&v7->_linkedApplication, v8);
    if (!v6)

    -[PKLinkedApplication addObserver:](v7->_linkedApplication, "addObserver:", v7);
    -[PKLinkedApplicationActionCell setNeedsLayout](v7, "setNeedsLayout");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PKLinkedApplication removeObserver:](self->_linkedApplication, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedApplicationActionCell;
  -[PKLinkedApplicationActionCell dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedApplicationActionCell;
  -[PKLinkedApplicationActionCell didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PKLinkedApplicationActionCell window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
}

- (void)layoutSubviews
{
  int64_t v3;
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  UIActivityIndicatorView *v12;
  UIActivityIndicatorView *activityIndicator;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKLinkedApplicationActionCell;
  -[PKLinkedApplicationActionCell layoutSubviews](&v17, sel_layoutSubviews);
  v3 = -[PKLinkedApplication state](self->_linkedApplication, "state");
  v4 = v3 != 1 && v3 == 0;
  v5 = v3 == 1;
  -[PKLinkedApplicationActionCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 || !v5)
  {
    if (!self->_disabledTextColor)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(v6, "setTextColor:");
    goto LABEL_12;
  }
  if (self->_textColor)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v9 = (void *)v8;
  objc_msgSend(v7, "setTextColor:", v8);

LABEL_12:
  -[PKLinkedApplication displayName](self->_linkedApplication, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    PKLocalizedString(CFSTR("OPEN_APP"), CFSTR("%@"), v10, 0);
  else
    PKLocalizedString(CFSTR("OPEN_APP_NO_NAME"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v11);

  if (v4)
  {
    if (!self->_activityIndicator)
    {
      v12 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      activityIndicator = self->_activityIndicator;
      self->_activityIndicator = v12;

    }
    -[PKLinkedApplicationActionCell accessoryView](self, "accessoryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[PKLinkedApplicationActionCell setAccessoryView:](self, "setAccessoryView:", self->_activityIndicator);
      -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    }
  }
  else
  {
    -[PKLinkedApplicationActionCell accessoryView](self, "accessoryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
      -[PKLinkedApplicationActionCell setAccessoryView:](self, "setAccessoryView:", 0);
    }
  }
  if (v5)
    v16 = 3;
  else
    v16 = 0;
  -[PKLinkedApplicationActionCell setSelectionStyle:](self, "setSelectionStyle:", v16);
  -[PKLinkedApplicationActionCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v5);

}

- (void)reloadApplicationStateIfNecessary
{
  -[PKLinkedApplication reloadApplicationStateIfNecessary](self->_linkedApplication, "reloadApplicationStateIfNecessary");
}

- (NSArray)storeIDs
{
  return -[PKLinkedApplication storeIDs](self->_linkedApplication, "storeIDs");
}

- (void)setStoreIDs:(id)a3
{
  -[PKLinkedApplication setStoreIDs:](self->_linkedApplication, "setStoreIDs:", a3);
}

- (NSURL)appLaunchURL
{
  return -[PKLinkedApplication defaultLaunchURL](self->_linkedApplication, "defaultLaunchURL");
}

- (void)setAppLaunchURL:(id)a3
{
  -[PKLinkedApplication setDefaultLaunchURL:](self->_linkedApplication, "setDefaultLaunchURL:", a3);
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!objc_msgSend(v5, "state"))
  {
    -[PKLinkedApplicationActionCell window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(v5, "reloadApplicationStateIfNecessary");
  }
  -[PKLinkedApplicationActionCell setNeedsLayout](self, "setNeedsLayout");

}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
