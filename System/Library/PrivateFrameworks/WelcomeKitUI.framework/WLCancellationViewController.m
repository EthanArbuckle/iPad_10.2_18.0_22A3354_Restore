@implementation WLCancellationViewController

- (WLCancellationViewController)initWithWelcomeController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WLCancellationViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  OBTrayButton *retryButton;
  OBTrayButton *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  WLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CANCELLATION_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)WLCancellationViewController;
  v12 = -[WLCancellationViewController initWithTitle:detailText:icon:contentLayout:](&v23, sel_initWithTitle_detailText_icon_contentLayout_, v6, v8, v11, 2);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_welcomeController, a3);
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:forState:", v14, 0);

    objc_msgSend(v13, "addTarget:action:forControlEvents:", v12, sel__continue, 64);
    -[WLCancellationViewController buttonTray](v12, "buttonTray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addButton:", v13);

    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v16 = objc_claimAutoreleasedReturnValue();
    retryButton = v12->_retryButton;
    v12->_retryButton = (OBTrayButton *)v16;

    v18 = v12->_retryButton;
    WLLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v18, "setTitle:forState:", v19, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v12->_retryButton, "addTarget:action:forControlEvents:", v12, sel__retry, 64);
    -[WLCancellationViewController buttonTray](v12, "buttonTray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addButton:", v12->_retryButton);

    -[OBBaseWelcomeController navigationItem](v12, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidesBackButton:animated:", 1, 0);

  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLCancellationViewController;
  -[WLCancellationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[OBTrayButton hidesBusyIndicator](self->_retryButton, "hidesBusyIndicator");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLCancellationViewController;
  -[WLCancellationViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[OBTrayButton hidesBusyIndicator](self->_retryButton, "hidesBusyIndicator");
}

- (void)_continue
{
  void (**continueBlock)(void);

  continueBlock = (void (**)(void))self->_continueBlock;
  if (continueBlock)
    continueBlock[2]();
}

- (void)_retry
{
  void (**retryBlock)(void);

  -[OBTrayButton showsBusyIndicator](self->_retryButton, "showsBusyIndicator");
  retryBlock = (void (**)(void))self->_retryBlock;
  if (retryBlock)
    retryBlock[2]();
}

- (id)continueBlock
{
  return self->_continueBlock;
}

- (void)setContinueBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (id)retryBlock
{
  return self->_retryBlock;
}

- (void)setRetryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryBlock, 0);
  objc_storeStrong(&self->_continueBlock, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
