@implementation ICQUIPreferencesLiftUIDelegate

- (ICQUIPreferencesLiftUIDelegate)initWithNavigationController:(id)a3 account:(id)a4
{
  id v7;
  id v8;
  ICQUIPreferencesLiftUIDelegate *v9;
  ICQUIPreferencesLiftUIDelegate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQUIPreferencesLiftUIDelegate;
  v9 = -[ICQUIPreferencesLiftUIDelegate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigation, a3);
    objc_storeStrong((id *)&v10->_account, a4);
  }

  return v10;
}

- (void)loadURL:(id)a3
{
  id v4;
  ICQLiftUIPresenter *v5;
  void *v6;
  ICQLiftUIPresenter *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = [ICQLiftUIPresenter alloc];
  -[ICQUIPreferencesLiftUIDelegate account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICQLiftUIPresenter initWithURL:account:data:](v5, "initWithURL:account:data:", v4, v6, 0);

  -[ICQUIPreferencesLiftUIDelegate setPresenter:](self, "setPresenter:", v7);
  -[ICQUIPreferencesLiftUIDelegate presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[ICQUIPreferencesLiftUIDelegate presenter](self, "presenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQUIPreferencesLiftUIDelegate navigation](self, "navigation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushInNavigationController:animated:", v9, 1);

}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v3;
  id v4;

  -[ICQUIPreferencesLiftUIDelegate navigation](self, "navigation", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)liftUIPresenterDidComplete:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[ICQUIPreferencesLiftUIDelegate navigation](self, "navigation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  -[ICQUIPreferencesLiftUIDelegate delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadTopControllerWithAdditionalHeaders:", 0);

}

- (PreferencesRemoteUIDelegateProtocol)delegate
{
  return (PreferencesRemoteUIDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationController)navigation
{
  return self->_navigation;
}

- (void)setNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_navigation, a3);
}

- (ICQLiftUIPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_navigation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
