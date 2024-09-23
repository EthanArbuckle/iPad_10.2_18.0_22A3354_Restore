@implementation WLTransferringViewController

- (WLTransferringViewController)initWithSourceDevice:(id)a3 welcomeController:(id)a4 showsTips:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WLTransferringViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *transferProgressDescription;
  void *v19;
  uint64_t v20;
  NSString *importProgressDescription;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSDateComponentsFormatter *v30;
  NSDateComponentsFormatter *remainingDownloadTimeFormatter;
  objc_super v33;

  v5 = a5;
  v8 = a4;
  WLLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)WLTransferringViewController;
  v13 = -[OBSetupAssistantProgressController initWithTitle:detailText:icon:](&v33, sel_initWithTitle_detailText_icon_, v9, 0, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_welcomeController, a4);
    -[OBBaseWelcomeController navigationItem](v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", &stru_24E1499D0);

    -[OBBaseWelcomeController navigationItem](v13, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_TRANSFERRING_TEXT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v17 = objc_claimAutoreleasedReturnValue();
    transferProgressDescription = v13->_transferProgressDescription;
    v13->_transferProgressDescription = (NSString *)v17;

    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_IMPORTING_TEXT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v20 = objc_claimAutoreleasedReturnValue();
    importProgressDescription = v13->_importProgressDescription;
    v13->_importProgressDescription = (NSString *)v20;

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_LEARN_HOW_TO_USE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      WLLocalizedString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTitle:forState:", v24, 0);

      objc_msgSend(v22, "addTarget:action:forControlEvents:", v13, sel_tipsButtonPressed_, 64);
      v25 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "imageNamed:inBundle:", CFSTR("tips"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setImage:", v27);
      objc_msgSend(v28, "setImagePlacement:", 1);
      objc_msgSend(v28, "setImagePadding:", 20.0);
      objc_msgSend(v22, "setConfiguration:", v28);
      -[WLTransferringViewController buttonTray](v13, "buttonTray");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addButton:", v22);

    }
    v30 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    remainingDownloadTimeFormatter = v13->_remainingDownloadTimeFormatter;
    v13->_remainingDownloadTimeFormatter = v30;

    -[NSDateComponentsFormatter setUnitsStyle:](v13->_remainingDownloadTimeFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setAllowedUnits:](v13->_remainingDownloadTimeFormatter, "setAllowedUnits:", 96);
    -[NSDateComponentsFormatter setIncludesApproximationPhrase:](v13->_remainingDownloadTimeFormatter, "setIncludesApproximationPhrase:", 1);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[WLTransferringViewController removeProgressBar](self, "removeProgressBar");
  -[WLTransferringViewController _cancelRemainingDownloadTimeUpdateTimer](self, "_cancelRemainingDownloadTimeUpdateTimer");
  v3.receiver = self;
  v3.super_class = (Class)WLTransferringViewController;
  -[WLTransferringViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WLTransferringViewController;
  -[WLOnboardingProgressViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (self->_showCancelButton)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel);
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  }
  WLLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v5, self->_transferProgressDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTransferringViewController setProgressText:](self, "setProgressText:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLTransferringViewController;
  -[WLTransferringViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WLTransferringViewController removeProgressBar](self, "removeProgressBar");
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
    v6[2] = __38__WLTransferringViewController_cancel__block_invoke;
    v6[3] = &unk_24E1490E8;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[WLTransferringViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

void __38__WLTransferringViewController_cancel__block_invoke(uint64_t a1)
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
  WLTransferringViewController *v6;
  void (**viewWillDismissBlock)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLTransferringViewController;
  -[WLTransferringViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[WLTransferringViewController _cancelRemainingDownloadTimeUpdateTimer](self, "_cancelRemainingDownloadTimeUpdateTimer");
  -[WLTransferringViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v6 = (WLTransferringViewController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self
    && ((-[WLTransferringViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0
     || -[WLTransferringViewController isBeingDismissed](self, "isBeingDismissed")))
  {
    viewWillDismissBlock = (void (**)(void))self->_viewWillDismissBlock;
    if (viewWillDismissBlock)
      viewWillDismissBlock[2]();
  }

}

- (void)setProgress:(double)a3
{
  objc_super v5;

  self->_progress = a3;
  -[WLProgressBar setProgress:](self->_progressBar, "setProgress:");
  v5.receiver = self;
  v5.super_class = (Class)WLTransferringViewController;
  -[OBSetupAssistantProgressController setProgress:](&v5, sel_setProgress_, a3);
}

- (void)setProgressText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WLTransferringViewController;
  -[OBSetupAssistantProgressController setProgressText:](&v4, sel_setProgressText_, a3);
  -[WLTransferringViewController _cancelRemainingDownloadTimeUpdateTimer](self, "_cancelRemainingDownloadTimeUpdateTimer");
}

- (void)setRemainingDownloadTime:(double)a3
{
  OS_dispatch_source *v4;
  OS_dispatch_source *remainingDownloadTimeUpdateTimer;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (a3 < 60.0)
    a3 = 60.0;
  self->_remainingDownloadTime = a3;
  if (!self->_remainingDownloadTimeUpdateTimer)
  {
    _WLLog();
    objc_initWeak(&location, self);
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    remainingDownloadTimeUpdateTimer = self->_remainingDownloadTimeUpdateTimer;
    self->_remainingDownloadTimeUpdateTimer = v4;

    v6 = self->_remainingDownloadTimeUpdateTimer;
    v7 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v6, v7, 0x3B9ACA00uLL, 0xBEBC200uLL);
    v8 = self->_remainingDownloadTimeUpdateTimer;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__WLTransferringViewController_setRemainingDownloadTime___block_invoke;
    v9[3] = &unk_24E1490E8;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v8, v9);
    dispatch_activate((dispatch_object_t)self->_remainingDownloadTimeUpdateTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__WLTransferringViewController_setRemainingDownloadTime___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateProgressText");

}

- (void)setCompletedOperationCount:(unint64_t)a3 totalOperationCount:(unint64_t)a4
{
  self->_completedOperationCount = a3;
  self->_totalOperationCount = a4;
}

- (void)updateProgressText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (self->_isImporting)
  {
    _WLLog();
    v3 = (void *)MEMORY[0x24BDD17C8];
    WLLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringWithFormat:", v4, self->_completedOperationCount, self->_totalOperationCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v5, self->_importProgressDescription);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSDateComponentsFormatter stringFromTimeInterval:](self->_remainingDownloadTimeFormatter, "stringFromTimeInterval:", self->_remainingDownloadTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();
    v8 = (void *)MEMORY[0x24BDD17C8];
    WLLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v9, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v5, self->_transferProgressDescription);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[WLProgressBar setProgressText:](self->_progressBar, "setProgressText:", v5);
  v10.receiver = self;
  v10.super_class = (Class)WLTransferringViewController;
  -[OBSetupAssistantProgressController setProgressText:](&v10, sel_setProgressText_, v6);

}

- (void)_cancelRemainingDownloadTimeUpdateTimer
{
  NSObject *remainingDownloadTimeUpdateTimer;
  OS_dispatch_source *v4;

  remainingDownloadTimeUpdateTimer = self->_remainingDownloadTimeUpdateTimer;
  if (remainingDownloadTimeUpdateTimer)
  {
    dispatch_source_cancel(remainingDownloadTimeUpdateTimer);
    v4 = self->_remainingDownloadTimeUpdateTimer;
    self->_remainingDownloadTimeUpdateTimer = 0;

  }
}

- (void)setIsImporting:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  self->_isImporting = a3;
  if (a3)
  {
    WLLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSetupAssistantProgressController setTitle:](self, "setTitle:", v4);

    v5 = (void *)MEMORY[0x24BDD17C8];
    WLLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@\n\n%@"), v6, self->_importProgressDescription);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8.receiver = self;
    v8.super_class = (Class)WLTransferringViewController;
    -[OBSetupAssistantProgressController setProgressText:](&v8, sel_setProgressText_, v7);

  }
}

- (void)tipsButtonPressed:(id)a3
{
  void *v4;
  WLTipsListViewController *v5;

  v5 = -[WLTipsListViewController initWithItems]([WLTipsListViewController alloc], "initWithItems");
  -[WLTransferringViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

  -[WLTransferringViewController addProgressBar](self, "addProgressBar");
}

- (void)removeProgressBar
{
  WLProgressBar *progressBar;

  -[WLProgressBar removeFromSuperview](self->_progressBar, "removeFromSuperview");
  progressBar = self->_progressBar;
  self->_progressBar = 0;

}

- (void)addProgressBar
{
  WLProgressBar *v3;
  WLProgressBar *v4;
  WLProgressBar *progressBar;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  -[WLTransferringViewController removeProgressBar](self, "removeProgressBar");
  v3 = [WLProgressBar alloc];
  v4 = -[WLProgressBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  progressBar = self->_progressBar;
  self->_progressBar = v4;

  -[WLProgressBar setTranslatesAutoresizingMaskIntoConstraints:](self->_progressBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WLTransferringViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addSubview:", self->_progressBar);
  v18 = (void *)MEMORY[0x24BDD1628];
  -[WLProgressBar topAnchor](self->_progressBar, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLProgressBar height](WLProgressBar, "height");
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  -[WLProgressBar leadingAnchor](self->_progressBar, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v16;
  -[WLProgressBar trailingAnchor](self->_progressBar, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v11;
  -[WLProgressBar bottomAnchor](self->_progressBar, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v15);

  if (self->_progress > 0.0)
    -[WLProgressBar setProgress:](self->_progressBar, "setProgress:");
  if (self->_remainingDownloadTime > 0.0)
    -[WLTransferringViewController updateProgressText](self, "updateProgressText");

}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (BOOL)isImporting
{
  return self->_isImporting;
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (id)viewWillDismissBlock
{
  return self->_viewWillDismissBlock;
}

- (void)setViewWillDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDismissBlock, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_importProgressDescription, 0);
  objc_storeStrong((id *)&self->_transferProgressDescription, 0);
  objc_storeStrong((id *)&self->_remainingDownloadTimeFormatter, 0);
  objc_storeStrong((id *)&self->_remainingDownloadTimeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
