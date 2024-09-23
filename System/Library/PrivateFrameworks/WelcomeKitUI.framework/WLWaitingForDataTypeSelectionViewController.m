@implementation WLWaitingForDataTypeSelectionViewController

- (WLWaitingForDataTypeSelectionViewController)initWithWelcomeController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WLWaitingForDataTypeSelectionViewController *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  WLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_WAITING_EXPLANATION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)WLWaitingForDataTypeSelectionViewController;
  v12 = -[WLWaitingForDataTypeSelectionViewController initWithTitle:detailText:icon:contentLayout:](&v16, sel_initWithTitle_detailText_icon_contentLayout_, v6, v8, v11, 2);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_welcomeController, a3);
    -[OBBaseWelcomeController navigationItem](v12, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", &stru_24E1499D0);

    -[OBBaseWelcomeController navigationItem](v12, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidesBackButton:animated:", 1, 0);

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLWaitingForDataTypeSelectionViewController;
  -[WLOnboardingViewController viewDidLoad](&v5, sel_viewDidLoad);
  if (self->_showCancelButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
}

- (void)cancel
{
  void (**cancellationBlock)(id, _QWORD *);
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (self->_cancellationBlock)
  {
    objc_initWeak(&location, self);
    cancellationBlock = (void (**)(id, _QWORD *))self->_cancellationBlock;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__WLWaitingForDataTypeSelectionViewController_cancel__block_invoke;
    v6[3] = &unk_24E1490E8;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[WLWaitingForDataTypeSelectionViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

void __53__WLWaitingForDataTypeSelectionViewController_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showActivityIndicatorView");

}

- (void)showActivityIndicatorView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v5, "startAnimating");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v5);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  WLWaitingForDataTypeSelectionViewController *v6;
  void (**viewWillDismissBlock)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLWaitingForDataTypeSelectionViewController;
  -[WLWaitingForDataTypeSelectionViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[WLWaitingForDataTypeSelectionViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v6 = (WLWaitingForDataTypeSelectionViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self
    && ((-[WLWaitingForDataTypeSelectionViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0|| -[WLWaitingForDataTypeSelectionViewController isBeingDismissed](self, "isBeingDismissed")))
  {
    viewWillDismissBlock = (void (**)(void))self->_viewWillDismissBlock;
    if (viewWillDismissBlock)
      viewWillDismissBlock[2]();
  }

}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (id)viewWillDismissBlock
{
  return self->_viewWillDismissBlock;
}

- (void)setViewWillDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDismissBlock, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
