@implementation TSProximityWaitingViewController

- (TSProximityWaitingViewController)initWithBTServer:(id)a3 transferBackPhoneNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TSProximityWaitingViewController *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PRX_TRANSFER_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PRX_TRANSFER_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PRX_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)TSProximityWaitingViewController;
  v14 = -[TSProximityWaitingViewController initWithTitle:detailText:symbolName:](&v16, sel_initWithTitle_detailText_symbolName_, v13, v11, CFSTR("antenna.radiowaves.left.and.right"));

  if (v14)
    objc_storeWeak((id *)&v14->_btServer, v6);

  return v14;
}

- (BOOL)isStartOverRequiredOnBackButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_btServer);
  objc_msgSend(WeakRetained, "invalidate:", 0);

  return 0;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSProximityDevice)btServer
{
  return (SSProximityDevice *)objc_loadWeakRetained((id *)&self->_btServer);
}

- (void)setBtServer:(id)a3
{
  objc_storeWeak((id *)&self->_btServer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_btServer);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
