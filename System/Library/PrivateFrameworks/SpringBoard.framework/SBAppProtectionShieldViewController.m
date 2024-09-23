@implementation SBAppProtectionShieldViewController

- (SBAppProtectionShieldViewController)initWithAssistant:(id)a3 systemAppOutlet:(id)a4
{
  id v6;
  id v7;
  SBAppProtectionShieldViewController *v8;
  SBAppProtectionShieldView *v9;
  SBAppProtectionShieldView *shieldView;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAppProtectionShieldViewController;
  v8 = -[SBAppProtectionShieldViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = -[SBAppProtectionShieldView initWithAssistant:systemAppOutlet:]([SBAppProtectionShieldView alloc], "initWithAssistant:systemAppOutlet:", v6, v7);
    shieldView = v8->_shieldView;
    v8->_shieldView = v9;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAppProtectionShieldViewController;
  -[SBAppProtectionShieldViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SBAppProtectionShieldViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_shieldView);

}

- (void)viewWillLayoutSubviews
{
  SBAppProtectionShieldView *shieldView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppProtectionShieldViewController;
  -[SBAppProtectionShieldViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  shieldView = self->_shieldView;
  -[SBAppProtectionShieldViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBAppProtectionShieldView setFrame:](shieldView, "setFrame:");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldView, 0);
}

@end
