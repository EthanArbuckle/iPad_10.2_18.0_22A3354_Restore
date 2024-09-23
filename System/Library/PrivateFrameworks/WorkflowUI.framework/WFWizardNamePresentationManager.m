@implementation WFWizardNamePresentationManager

- (WFWizardNamePresentationManager)initWithNavigationController:(id)a3 wizardNameViewController:(id)a4
{
  id v7;
  id v8;
  WFWizardNamePresentationManager *v9;
  WFWizardNamePresentationManager *v10;
  void *v11;
  void *v12;
  WFWizardNamePresentationManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFWizardNamePresentationManager;
  v9 = -[WFWizardNamePresentationManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationController, a3);
    objc_storeStrong((id *)&v10->_wizardNameViewController, a4);
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "userInterfaceIdiom"))
    {
      v10->_presentsModally = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_presentsModally = (unint64_t)(objc_msgSend(v12, "orientation") - 3) < 2;

    }
    v13 = v10;
  }

  return v10;
}

- (void)present
{
  void *v3;
  id v4;

  if (-[WFWizardNamePresentationManager presentsModally](self, "presentsModally"))
  {
    -[WFWizardNamePresentationManager presentModal](self, "presentModal");
  }
  else
  {
    -[WFWizardNamePresentationManager navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[WFWizardNamePresentationManager wizardNameViewController](self, "wizardNameViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pushViewController:animated:", v3, 1);

  }
}

- (void)presentModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x24BEBD7A0]);
  -[WFWizardNamePresentationManager wizardNameViewController](self, "wizardNameViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "initWithRootViewController:", v4);

  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismiss);
  -[WFWizardNamePresentationManager wizardNameViewController](self, "wizardNameViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v5);

  -[WFWizardNamePresentationManager navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)dismiss
{
  id v3;

  if (-[WFWizardNamePresentationManager presentsModally](self, "presentsModally"))
  {
    -[WFWizardNamePresentationManager navigationController](self, "navigationController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (WFWorkflowWizardNameViewController)wizardNameViewController
{
  return self->_wizardNameViewController;
}

- (BOOL)presentsModally
{
  return self->_presentsModally;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wizardNameViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
