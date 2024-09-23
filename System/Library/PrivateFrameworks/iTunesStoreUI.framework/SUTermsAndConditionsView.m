@implementation SUTermsAndConditionsView

- (SUTermsAndConditionsView)initWithFrame:(CGRect)a3
{
  SUTermsAndConditionsView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUTermsAndConditionsView;
  v3 = -[SUTermsAndConditionsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__accountsChangedNotification_, *MEMORY[0x24BEB20F0], 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB20F0], 0);
  -[SUTermsAndConditionsView _destroyButton](self, "_destroyButton");

  -[SULinkControl removeTarget:action:forControlEvents:](self->_termsAndConditionsControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  self->_termsAndConditionsControl = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUTermsAndConditionsView;
  -[SUTermsAndConditionsView dealloc](&v4, sel_dealloc);
}

- (SUTermsAndConditionsViewDelegate)delegate
{
  return (SUTermsAndConditionsViewDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setHideAccountButton:(BOOL)a3
{
  if (self->_hideAccountButton != a3)
  {
    self->_hideAccountButton = a3;
    -[SUTermsAndConditionsView _destroyButton](self, "_destroyButton");
    -[SUTermsAndConditionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRightMargin:(double)a3
{
  if (self->_rightMargin != a3)
  {
    self->_rightMargin = a3;
    -[SUTermsAndConditionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SUTermsAndConditionsView _destroyButton](self, "_destroyButton");
    -[SULinkControl setStyle:](self->_termsAndConditionsControl, "setStyle:", -[SUTermsAndConditionsView _linkStyleForStyle:](self, "_linkStyleForStyle:", self->_style));
    -[SUTermsAndConditionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  id v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;

  -[SUTermsAndConditionsView bounds](self, "bounds");
  v4 = v3 - self->_rightMargin;
  if (!self->_hideAccountButton)
  {
    v5 = -[SUTermsAndConditionsView _button](self, "_button");
    -[SUTermsAndConditionsView _buttonHeightForStyle:](self, "_buttonHeightForStyle:", self->_style);
    objc_msgSend(v5, "setFrame:", 9.0, 8.0, v4 + -9.0 + -9.0, v6);
  }
  v7 = -[SUTermsAndConditionsView _termsAndConditionsControl](self, "_termsAndConditionsControl");
  objc_msgSend(v7, "frame");
  v9 = ceil((v4 - v8) * 0.5);
  v10 = 91.0;
  if (self->_hideAccountButton)
    v10 = 26.0;
  objc_msgSend(v7, "setFrame:", v9, v10);
}

- (void)sizeToFit
{
  -[SUTermsAndConditionsView frame](self, "frame");
  -[SUTermsAndConditionsView setFrame:](self, "setFrame:");
}

- (void)_buttonAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount"), "accountName");
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ITUNES_ACCOUNT"), &stru_24DE83F60, 0), v5, 1);
    v7 = (void *)MEMORY[0x24BDF67E8];
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("VIEW_ACCOUNT"), &stru_24DE83F60, 0);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__SUTermsAndConditionsView__buttonAction___block_invoke;
    v11[3] = &unk_24DE7B760;
    v11[4] = self;
    objc_msgSend(v6, "addAction:", objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v11));
    objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SIGN_OUT"), &stru_24DE83F60, 0), 0, &__block_literal_global_3));
    objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("FORGOT_PASSWORD"), &stru_24DE83F60, 0), 0, &__block_literal_global_23));
    objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DE83F60, 0), 1, 0));
    objc_msgSend((id)-[SUTermsAndConditionsViewDelegate viewControllerForPresentingAccountAlertControllerFromTermsAndConditionsView:](-[SUTermsAndConditionsView delegate](self, "delegate"), "viewControllerForPresentingAccountAlertControllerFromTermsAndConditionsView:", self), "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x24BEC8C28]);
    v10 = (void *)objc_msgSend(v9, "initWithAuthenticationContext:", objc_msgSend(MEMORY[0x24BEB1DC0], "contextForSignIn"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v10);

  }
  -[SUTermsAndConditionsView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__clearButtonSelection_, a3, 0.100000001);
}

void __42__SUTermsAndConditionsView__buttonAction___block_invoke(uint64_t a1)
{
  SUAccountViewController *v2;

  v2 = objc_alloc_init(SUAccountViewController);
  -[SUViewController setClientInterface:](v2, "setClientInterface:", objc_msgSend(*(id *)(a1 + 32), "clientInterface"));
  -[SUAccountViewController setStyle:](v2, "setStyle:", 2);
  +[SUClientDispatch enterAccountFlowWithViewController:animated:](SUClientDispatch, "enterAccountFlowWithViewController:animated:", v2, 1);

}

uint64_t __42__SUTermsAndConditionsView__buttonAction___block_invoke_2()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "signOutAllAccounts");
}

void __42__SUTermsAndConditionsView__buttonAction___block_invoke_3()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc(MEMORY[0x24BEC8BD8]);
  v2 = (id)objc_msgSend(v0, "initWithURLBagKey:", *MEMORY[0x24BEB2AA0]);
  objc_msgSend(v2, "setITunesStoreURL:", 0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC8BD0]), "initWithOpenURLRequest:", v2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", v1);

}

- (void)_termsAndConditionsAction:(id)a3
{
  SUOpenExternalURL(objc_msgSend(MEMORY[0x24BDBCF48], "termsAndConditionsURL", a3), -[SUTermsAndConditionsView clientInterface](self, "clientInterface"));
}

- (id)_button
{
  id result;
  double v4;
  double v5;
  double v6;
  int64_t style;
  SUSubtitledButton *v8;
  uint64_t v9;
  uint64_t v10;
  SUSubtitledButton *button;
  uint64_t v12;
  SUSubtitledButton *v13;
  void *v14;
  SUSubtitledButton *v15;
  double v16;
  void *v17;
  UILabel *v18;

  result = self->_button;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    v5 = v4 + -18.0;
    -[SUTermsAndConditionsView _buttonHeightForStyle:](self, "_buttonHeightForStyle:", self->_style);
    style = self->_style;
    if (style == 2)
    {
      v8 = -[SUSubtitledButton initWithFrame:]([SUSubtitledButton alloc], "initWithFrame:", 9.0, 8.0, v5, v6);
      self->_button = v8;
      -[SUSubtitledButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, 7.0, 0.0, 7.0);
      v9 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("GradientButtonBackground.png"), v9), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0), 0);
      -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0);
      v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("GradientButtonBackgroundPressed.png"), v9), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0);
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", v10, 1);
      button = self->_button;
      v12 = v10;
    }
    else
    {
      if (!style)
      {
        self->_button = (SUSubtitledButton *)-[SURoundedCornersButton initWithFrame:]([SURoundedCornersButton alloc], "initWithFrame:", 9.0, 8.0, v5, v6);
LABEL_8:
        -[SUSubtitledButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel__buttonAction_, 64);
        -[SUSubtitledButton setSubtitleColor:forState:](self->_button, "setSubtitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0);
        -[SUSubtitledButton setSubtitleColor:forState:](self->_button, "setSubtitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 1);
        -[SUSubtitledButton setSubtitleColor:forState:](self->_button, "setSubtitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 4);
        -[SUSubtitledButton setSubtitleShadowColor:forState:](self->_button, "setSubtitleShadowColor:forState:", 0, 0);
        -[SUSubtitledButton setSubtitleShadowColor:forState:](self->_button, "setSubtitleShadowColor:forState:", 0, 1);
        -[SUSubtitledButton setSubtitleShadowColor:forState:](self->_button, "setSubtitleShadowColor:forState:", 0, 4);
        -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "blackColor"), 0);
        -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 1);
        -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"), 4);
        -[SUSubtitledButton setTitleShadowColor:forState:](self->_button, "setTitleShadowColor:forState:", 0, 0);
        -[SUSubtitledButton setTitleShadowColor:forState:](self->_button, "setTitleShadowColor:forState:", 0, 1);
        -[SUSubtitledButton setTitleShadowColor:forState:](self->_button, "setTitleShadowColor:forState:", 0, 4);
        -[SUSubtitledButton titleEdgeInsets](self->_button, "titleEdgeInsets");
        -[SUSubtitledButton setTitleEdgeInsets:](self->_button, "setTitleEdgeInsets:", v16 + 1.0);
        v17 = (void *)-[SUSubtitledButton titleLabel](self->_button, "titleLabel");
        objc_msgSend(v17, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 14.0));
        objc_msgSend(v17, "setTextAlignment:", 1);
        v18 = -[SUSubtitledButton subtitleLabel](self->_button, "subtitleLabel");
        -[UILabel setFont:](v18, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 13.0));
        -[UILabel setTextAlignment:](v18, "setTextAlignment:", 1);
        -[SUTermsAndConditionsView addSubview:](self, "addSubview:", self->_button);
        -[SUTermsAndConditionsView _updateButton](self, "_updateButton");
        return self->_button;
      }
      v13 = -[SUSubtitledButton initWithFrame:]([SUSubtitledButton alloc], "initWithFrame:", 9.0, 8.0, v5, v6);
      self->_button = v13;
      -[SUSubtitledButton setTitleEdgeInsets:](v13, "setTitleEdgeInsets:", 0.0, 7.0, 0.0, 7.0);
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("AccountButtonBackground.png")), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0), 0);
      v14 = (void *)objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("GradientButtonBackgroundPressed.png"), objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()));
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", objc_msgSend(v14, "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0), 1);
      v15 = self->_button;
      v12 = objc_msgSend(v14, "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0);
      button = v15;
    }
    -[SUSubtitledButton setBackgroundImage:forState:](button, "setBackgroundImage:forState:", v12, 4);
    goto LABEL_8;
  }
  return result;
}

- (double)_buttonHeightForStyle:(int64_t)a3
{
  double result;

  result = 47.0;
  if (!a3)
    return 48.0;
  return result;
}

- (void)_clearButtonSelection:(id)a3
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, a3);
  objc_msgSend(a3, "setSelected:", 0);
}

- (void)_destroyButton
{
  -[SUSubtitledButton removeFromSuperview](self->_button, "removeFromSuperview");
  -[SUSubtitledButton removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_button = 0;
}

- (int64_t)_linkStyleForStyle:(int64_t)a3
{
  return 2 * (a3 == 1);
}

- (id)_termsAndConditionsControl
{
  id result;
  SULinkControl *v4;
  double v5;

  result = self->_termsAndConditionsControl;
  if (!result)
  {
    v4 = objc_alloc_init(SULinkControl);
    self->_termsAndConditionsControl = v4;
    -[SULinkControl addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self, sel__termsAndConditionsAction_, 64);
    -[SULinkControl setBackgroundColor:](self->_termsAndConditionsControl, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    LODWORD(v5) = -1097229926;
    -[SULinkControl setCharge:](self->_termsAndConditionsControl, "setCharge:", v5);
    -[SULinkControl setStyle:](self->_termsAndConditionsControl, "setStyle:", -[SUTermsAndConditionsView _linkStyleForStyle:](self, "_linkStyleForStyle:", self->_style));
    -[SULinkControl setText:](self->_termsAndConditionsControl, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_24DE83F60, 0));
    -[SULinkControl sizeToFit](self->_termsAndConditionsControl, "sizeToFit");
    -[SUTermsAndConditionsView addSubview:](self, "addSubview:", self->_termsAndConditionsControl);
    return self->_termsAndConditionsControl;
  }
  return result;
}

- (void)_updateButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SUSubtitledButton *button;
  uint64_t v8;
  SUSubtitledButton *v9;
  uint64_t v10;
  SUSubtitledButton *v11;
  SUSubtitledButton *v12;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"), "activeAccount");
  v4 = (void *)objc_msgSend(v3, "accountName");
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(v3, "creditsString");
    v6 = objc_msgSend(v5, "length");
    button = self->_button;
    if (v6)
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ACCOUNT_BUTTON_CREDIT_FORMAT"), &stru_24DE83F60, 0), v5);
    else
      v8 = 0;
    -[SUSubtitledButton setSubtitle:forState:](button, "setSubtitle:forState:", v8, 0);
    v12 = self->_button;
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ACCOUNT_FORMAT"), &stru_24DE83F60, 0), v4);
    v11 = v12;
  }
  else
  {
    -[SUSubtitledButton setSubtitle:forState:](self->_button, "setSubtitle:forState:", 0, 0);
    v9 = self->_button;
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("SIGN_IN"), &stru_24DE83F60, 0);
    v11 = v9;
  }
  -[SUSubtitledButton setTitle:forState:](v11, "setTitle:forState:", v10, 0);
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (BOOL)hideAccountButton
{
  return self->_hideAccountButton;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (int64_t)style
{
  return self->_style;
}

@end
