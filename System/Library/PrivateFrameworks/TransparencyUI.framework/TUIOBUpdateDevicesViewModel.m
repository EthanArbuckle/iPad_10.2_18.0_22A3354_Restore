@implementation TUIOBUpdateDevicesViewModel

- (TUIOBUpdateDevicesViewModel)initWithAccountManager:(id)a3 devicesWithIssuesIdentifiers:(id)a4
{
  id v6;
  id v7;
  TUIOBUpdateDevicesViewModel *v8;
  TUIOBUpdateDevicesViewModel *v9;
  TUIDevicesWithIssuesViewController *v10;
  UIViewController *contentViewController;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIOBUpdateDevicesViewModel;
  v8 = -[TUIUpdateDevicesModel init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TUIUpdateDevicesModel setDevicesWithIssuesIdentifiers:](v8, "setDevicesWithIssuesIdentifiers:", v7);
    v9->_contentViewLayout = 2;
    v10 = -[TUIDevicesWithIssuesViewController initWithAccountManager:devicesWithIssuesIdentifiers:]([TUIDevicesWithIssuesViewController alloc], "initWithAccountManager:devicesWithIssuesIdentifiers:", v6, v7);
    contentViewController = v9->_contentViewController;
    v9->_contentViewController = &v10->super.super.super;

  }
  return v9;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
