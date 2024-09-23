@implementation ICQInternetPrivacySheetPresenter

+ (id)presenterWithIdentifier:(id)a3 viewModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  ICQInternetPrivacySheet *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[ICQInternetPrivacySheet initWithIdentifier:viewModel:]([ICQInternetPrivacySheet alloc], "initWithIdentifier:viewModel:", v6, v5);

  objc_msgSend(v7, "setSheet:", v8);
  v9 = objc_alloc(MEMORY[0x24BEBD7A0]);
  objc_msgSend(v7, "sheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithRootViewController:", v10);
  objc_msgSend(v7, "setNavigationController:", v11);

  objc_msgSend(v7, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModalPresentationStyle:", 2);

  return v7;
}

- (void)present
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[ICQInternetPrivacySheetPresenter present]";
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "presentingViewController is nil in %s!", (uint8_t *)&v1, 0xCu);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (ICQInternetPrivacySheet)sheet
{
  return self->_sheet;
}

- (void)setSheet:(id)a3
{
  objc_storeStrong((id *)&self->_sheet, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_sheet, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
