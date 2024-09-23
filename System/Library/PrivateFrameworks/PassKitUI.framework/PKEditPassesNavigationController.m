@implementation PKEditPassesNavigationController

- (PKEditPassesNavigationController)init
{
  return -[PKEditPassesNavigationController initWithExistingGroupsController:](self, "initWithExistingGroupsController:", 0);
}

- (PKEditPassesNavigationController)initWithExistingGroupsController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PKEditPassesNavigationController *v10;
  PKEditPassesNavigationController *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v4 = a3;
  v5 = -[PKEditGroupsViewController initInEditingMode:existingGroupsController:isForWatch:]([PKEditGroupsViewController alloc], "initInEditingMode:existingGroupsController:isForWatch:", 1, v4, 0);
  objc_msgSend(v5, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("PASS_EDITING_DONE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 2, self, sel__done);
  objc_msgSend(v6, "setRightBarButtonItem:", v9);

  v18.receiver = self;
  v18.super_class = (Class)PKEditPassesNavigationController;
  v10 = -[PKNavigationController init](&v18, sel_init);
  v11 = v10;
  if (v10)
    -[PKEditPassesNavigationController pushViewController:animated:](v10, "pushViewController:animated:", v5, 0);
  -[PKEditPassesNavigationController _beginDelayingPresentation:cancellationHandler:](v11, "_beginDelayingPresentation:cancellationHandler:", 0, 2.0);
  objc_initWeak(&location, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke;
  v14[3] = &unk_1E3E64790;
  objc_copyWeak(&v16, &location);
  v12 = v5;
  v15 = v12;
  +[PKEditTableViewController loadPlaceholdersWithCompletion:](PKEditTableViewController, "loadPlaceholdersWithCompletion:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __69__PKEditPassesNavigationController_initWithExistingGroupsController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlaceholders:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_endDelayingPresentation");
  }

}

- (PKEditPassesNavigationController)initWithExistingGroupsController:(id)a3 specificGroup:(id)a4 isForWatch:(BOOL)a5 delegate:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PKEditGroupViewController *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  PKEditPassesNavigationController *v18;
  PKEditPassesNavigationController *v19;
  PKEditGroupViewController *v20;
  _QWORD v22[4];
  PKEditGroupViewController *v23;
  id v24;
  id location;
  objc_super v26;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[PKEditGroupViewController initWithGroup:existingGroupsController:style:placeholders:isForWatch:delegate:]([PKEditGroupViewController alloc], "initWithGroup:existingGroupsController:style:placeholders:isForWatch:delegate:", v11, v10, 1, 0, v7, v12);
  -[PKEditGroupViewController navigationItem](v13, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("PASS_EDITING_DONE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTitle:style:target:action:", v16, 2, self, sel__done);
  objc_msgSend(v14, "setRightBarButtonItem:", v17);

  v26.receiver = self;
  v26.super_class = (Class)PKEditPassesNavigationController;
  v18 = -[PKNavigationController init](&v26, sel_init);
  v19 = v18;
  if (v18)
    -[PKEditPassesNavigationController pushViewController:animated:](v18, "pushViewController:animated:", v13, 0);
  -[PKEditPassesNavigationController _beginDelayingPresentation:cancellationHandler:](v19, "_beginDelayingPresentation:cancellationHandler:", 0, 2.0);
  objc_initWeak(&location, v19);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke;
  v22[3] = &unk_1E3E64790;
  objc_copyWeak(&v24, &location);
  v20 = v13;
  v23 = v20;
  +[PKEditTableViewController loadPlaceholdersWithCompletion:](PKEditTableViewController, "loadPlaceholdersWithCompletion:", v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v19;
}

void __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __103__PKEditPassesNavigationController_initWithExistingGroupsController_specificGroup_isForWatch_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlaceholders:", *(_QWORD *)(a1 + 40));
    objc_msgSend(WeakRetained, "_endDelayingPresentation");
  }

}

- (void)_done
{
  id v2;

  -[PKEditPassesNavigationController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
