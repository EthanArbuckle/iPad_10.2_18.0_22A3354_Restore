@implementation AccountSetupController

- (AccountSetupController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  AccountSetupController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AccountSetupController;
  v8 = -[AccountSetupController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, "_accountSetupDidFinish:", ACUIAccountSetupDidFinish, 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, ACUIAccountSetupDidFinish, 0);

  v4.receiver = self;
  v4.super_class = (Class)AccountSetupController;
  -[AccountSetupController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  ACUIAddAccountViewController *v3;
  ACUIAddAccountViewController *addTypeController;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AccountSetupController;
  -[AccountSetupController loadView](&v5, "loadView");
  v3 = (ACUIAddAccountViewController *)objc_alloc_init((Class)ACUIAddMailAccountViewController);
  addTypeController = self->_addTypeController;
  self->_addTypeController = v3;

  -[AccountSetupController showController:](self, "showController:", self->_addTypeController);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AccountSetupController;
  -[AccountSetupController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountSetupController scene](self, "scene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedLaunchTracker"));
  objc_msgSend(v5, "observeViewController:scene:", self, v4);

  self->_setupWasInProgress = -[AccountSetupController accountSetupInProgress](self, "accountSetupInProgress");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AccountSetupController;
  -[AccountSetupController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (self->_setupWasInProgress)
  {
    self->_setupWasInProgress = 0;
    -[AccountSetupController _accountSetupDidChange:](self, "_accountSetupDidChange:", 0);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccountSetupController scene](self, "scene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedLaunchTracker"));
  objc_msgSend(v5, "didFinishLoadViewController:scene:", self, v4);

}

- (void)didDismissFormSheetView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AccountSetupController;
  -[AccountSetupController didDismissFormSheetView](&v3, "didDismissFormSheetView");
  -[AccountSetupController _accountSetupDidChange:](self, "_accountSetupDidChange:", 0);
}

- (BOOL)shouldSnapshot
{
  AccountSetupController *v2;
  ACUIAddAccountViewController *v3;

  v2 = self;
  v3 = (ACUIAddAccountViewController *)objc_claimAutoreleasedReturnValue(-[AccountSetupController visibleViewController](self, "visibleViewController"));
  LOBYTE(v2) = v3 == v2->_addTypeController;

  return (char)v2;
}

- (id)customDefaultPNGName
{
  id v3;
  __CFString *v4;
  objc_super v6;

  if ((+[UIDevice mf_isPad](UIDevice, "mf_isPad") & 1) != 0
    || !-[AccountSetupController shouldSnapshot](self, "shouldSnapshot"))
  {
    v4 = CFSTR("Default-AccountSetup");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AccountSetupController;
    v3 = -[AccountSetupController customDefaultPNGName](&v6, "customDefaultPNGName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(v3);
  }
  return v4;
}

- (void)_accountSetupDidChange:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AccountSetupController accountSetupDelegate](self, "accountSetupDelegate"));
  if ((objc_opt_respondsToSelector(v5, "accountSetupControllerDidChange:finished:") & 1) != 0)
    objc_msgSend(v5, "accountSetupControllerDidChange:finished:", self, v3);

}

- (void)_accountSetupDidFinish:(id)a3
{
  -[AccountSetupController _accountSetupDidChange:](self, "_accountSetupDidChange:", 1);
}

- (BOOL)accountSetupInProgress
{
  AccountSetupController *v2;
  ACUIAddAccountViewController *v3;

  v2 = self;
  v3 = (ACUIAddAccountViewController *)objc_claimAutoreleasedReturnValue(-[AccountSetupController visibleViewController](self, "visibleViewController"));
  LOBYTE(v2) = v3 != v2->_addTypeController;

  return (char)v2;
}

- (AccountSetupControllerDelegate)accountSetupDelegate
{
  return (AccountSetupControllerDelegate *)objc_loadWeakRetained((id *)&self->_accountSetupDelegate);
}

- (void)setAccountSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accountSetupDelegate, a3);
}

- (MailMainScene)scene
{
  return (MailMainScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_destroyWeak((id *)&self->_accountSetupDelegate);
  objc_storeStrong((id *)&self->_addTypeController, 0);
}

@end
