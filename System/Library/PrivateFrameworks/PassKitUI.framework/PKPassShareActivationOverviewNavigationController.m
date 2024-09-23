@implementation PKPassShareActivationOverviewNavigationController

- (PKPassShareActivationOverviewNavigationController)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PKPassShareActivationOverviewNavigationController *v9;
  PKPassShareActivationOverviewNavigationController *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSMutableArray *optionsToShow;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPassShareActivationOverviewNavigationController;
  v9 = -[PKNavigationController init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_msgSend(v7, "composedShare");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activationOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D66F40]);
    objc_msgSend(v12, "optionsOfType:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithOptions:", v14);

    v16 = objc_alloc(MEMORY[0x1E0D66F40]);
    PKPassShareActivationOptionActivationCodeTypes();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "optionsOfTypes:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithOptions:", v18);

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    optionsToShow = v10->_optionsToShow;
    v10->_optionsToShow = v20;

    -[NSMutableArray safelyAddObject:](v10->_optionsToShow, "safelyAddObject:", v15);
    -[NSMutableArray safelyAddObject:](v10->_optionsToShow, "safelyAddObject:", v19);

  }
  return v10;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)PKPassShareActivationOverviewNavigationController;
  -[PKPassShareActivationOverviewNavigationController loadView](&v7, sel_loadView);
  -[PKPassShareActivationOverviewNavigationController _showNextScreen](self, "_showNextScreen");
  -[PKPassShareActivationOverviewNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
  -[PKPassShareActivationOverviewNavigationController sheetPresentationController](self, "sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDetents:", v6);

  }
}

- (void)_showNextScreen
{
  void *v3;
  PKPassShareActivationOverviewViewController *v4;
  void *v5;
  PKPassShareActivationOverviewViewController *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_optionsToShow, "count"))
  {
    -[NSMutableArray firstObject](self->_optionsToShow, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_optionsToShow, "removeObjectAtIndex:", 0);
    v4 = [PKPassShareActivationOverviewViewController alloc];
    -[PKPassShareInitiationContext recipient](self->_context, "recipient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKPassShareActivationOverviewViewController initWithActivationOptions:recipient:isFinalScreen:delegate:](v4, "initWithActivationOptions:recipient:isFinalScreen:delegate:", v3, v5, -[NSMutableArray count](self->_optionsToShow, "count") == 0, self);

    -[PKPassShareActivationOverviewNavigationController viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[PKPassShareActivationOverviewNavigationController pushViewController:animated:](self, "pushViewController:animated:", v6, 1);
    }
    else
    {
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareActivationOverviewNavigationController setViewControllers:](self, "setViewControllers:", v9);

    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidFinish:", 0);

  }
}

- (void)shareActivationOverviewViewControllerDidFinish:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (-[NSMutableArray count](self->_optionsToShow, "count"))
  {
    -[PKPassShareActivationOverviewNavigationController _showNextScreen](self, "_showNextScreen");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidFinish:", v5);

  }
}

- (void)shareActivationOverviewViewControllerDidSelectShareCode:(id)a3
{
  PKPassShareActivationOverviewViewControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidSelectShareCode:", v4);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPassShareActivationOverviewNavigationController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "shareActivationOverviewViewControllerDidFinish:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsToShow, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
