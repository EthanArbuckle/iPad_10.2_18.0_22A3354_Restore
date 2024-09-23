@implementation STIOSAlertPresenter

- (STIOSAlertPresenter)initWithPresentingViewController:(id)a3
{
  UIViewController *v4;
  STIOSAlertPresenter *v5;
  UIViewController *presentingViewController;
  objc_super v8;

  v4 = (UIViewController *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STIOSAlertPresenter;
  v5 = -[STIOSAlertPresenter init](&v8, sel_init);
  presentingViewController = v5->_presentingViewController;
  v5->_presentingViewController = v4;

  return v5;
}

- (void)showAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v9, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonOK"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v13);
  objc_msgSend(v11, "setPreferredAction:", v13);
  -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", v11, 1, v8);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
