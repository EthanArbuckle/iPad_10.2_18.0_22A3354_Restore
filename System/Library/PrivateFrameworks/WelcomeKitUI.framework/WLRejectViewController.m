@implementation WLRejectViewController

- (WLRejectViewController)initWithWelcomeController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WLRejectViewController *v11;
  uint64_t v12;
  OBTrayButton *retryButton;
  OBTrayButton *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  WLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)WLRejectViewController;
  v11 = -[WLRejectViewController initWithTitle:detailText:icon:contentLayout:](&v19, sel_initWithTitle_detailText_icon_contentLayout_, v6, v7, v10, 2);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_welcomeController, a3);
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v12 = objc_claimAutoreleasedReturnValue();
    retryButton = v11->_retryButton;
    v11->_retryButton = (OBTrayButton *)v12;

    v14 = v11->_retryButton;
    WLLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTrayButton setTitle:forState:](v14, "setTitle:forState:", v15, 0);

    -[OBTrayButton addTarget:action:forControlEvents:](v11->_retryButton, "addTarget:action:forControlEvents:", v11, sel__retry, 64);
    -[WLRejectViewController buttonTray](v11, "buttonTray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addButton:", v11->_retryButton);

    -[OBBaseWelcomeController navigationItem](v11, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidesBackButton:animated:", 1, 0);

  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLRejectViewController;
  -[WLRejectViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[OBTrayButton hidesBusyIndicator](self->_retryButton, "hidesBusyIndicator");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLRejectViewController;
  -[WLRejectViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[OBTrayButton hidesBusyIndicator](self->_retryButton, "hidesBusyIndicator");
}

- (void)_retry
{
  void (**retryBlock)(void);

  -[OBTrayButton showsBusyIndicator](self->_retryButton, "showsBusyIndicator");
  retryBlock = (void (**)(void))self->_retryBlock;
  if (retryBlock)
    retryBlock[2]();
}

- (id)retryBlock
{
  return self->_retryBlock;
}

- (void)setRetryBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryBlock, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
