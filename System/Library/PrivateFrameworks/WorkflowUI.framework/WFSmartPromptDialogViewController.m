@implementation WFSmartPromptDialogViewController

- (NSArray)actions
{
  NSArray **p_actions;
  NSArray *actions;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id location[2];

  p_actions = &self->_actions;
  actions = self->_actions;
  if (actions)
    return actions;
  objc_initWeak(location, self);
  v6 = (void *)objc_opt_new();
  -[WFCompactDialogViewController request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    -[WFCompactDialogViewController request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v9;
    v37[1] = 3221225472;
    v37[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke;
    v37[3] = &unk_24E604D60;
    objc_copyWeak(&v38, location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v11, v37);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    objc_destroyWeak(&v38);
  }
  -[WFCompactDialogViewController request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allowOnceButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WFCompactDialogViewController request](self, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allowOnceButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke_3;
    v35[3] = &unk_24E604D60;
    objc_copyWeak(&v36, location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v16, v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v17);

    objc_destroyWeak(&v36);
  }
  -[WFCompactDialogViewController request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allowAlwaysButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[WFCompactDialogViewController request](self, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allowAlwaysButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v9;
    v33[1] = 3221225472;
    v33[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke_4;
    v33[3] = &unk_24E604D60;
    objc_copyWeak(&v34, location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v21, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v22);

    objc_destroyWeak(&v34);
  }
  -[WFCompactDialogViewController request](self, "request");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "denyButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[WFCompactDialogViewController request](self, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "denyButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v9;
    v29 = 3221225472;
    v30 = __44__WFSmartPromptDialogViewController_actions__block_invoke_5;
    v31 = &unk_24E604D60;
    objc_copyWeak(&v32, location);
    +[WFCompactDialogAction actionForButton:handler:](WFCompactDialogAction, "actionForButton:handler:", v26, &v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v27, v28, v29, v30, v31);

    objc_destroyWeak(&v32);
  }
  objc_storeStrong((id *)p_actions, v6);
  objc_destroyWeak(location);
  return (NSArray *)v6;
}

- (void)loadView
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFSmartPromptDialogViewController;
  -[WFCompactDialogViewController loadView](&v11, sel_loadView);
  -[WFSmartPromptDialogViewController actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (unint64_t)objc_msgSend(v3, "count") > 2;
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrangeActionsVertically:", v4);

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondaryText:", v8);

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSecondaryTextAlignment:", 1);

  -[WFCompactPlatterViewController platterView](self, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSecondaryTextFontStyle:", *MEMORY[0x24BEBE1F0]);

  -[WFCompactDialogViewController configureActionGroupWithActions:](self, "configureActionGroupWithActions:", v3);
  -[WFSmartPromptDialogViewController loadContentCollection](self, "loadContentCollection");

}

- (void)loadContentCollection
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[WFSmartPromptDialogViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WFCompactDialogViewController request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke;
    v5[3] = &unk_24E604790;
    v5[4] = self;
    objc_msgSend(v4, "getContentCollectionWithCompletionHandler:", v5);

  }
}

- (BOOL)shouldHideSashView
{
  return 0;
}

- (void)finishWithResult:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactDialogViewController request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deletionAuthorizationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEC4090];
  -[WFCompactDialogViewController request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v17 = 0;
    objc_msgSend(v9, "prepareDeletionAuthorizationDatabaseDataFromConfiguration:resultCode:error:", v11, a3, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    objc_msgSend(v5, "addObject:", v12);
  }
  else
  {
    v16 = 0;
    objc_msgSend(v9, "prepareSmartPromptsDatabaseDataFromConfiguration:resultCode:error:", v11, a3, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    v14 = objc_msgSend(v12, "mutableCopy");

    v5 = (void *)v14;
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC4090]), "initWithResult:promptedStatesData:", a3, v5);
  -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v15);

}

- (UIStackView)sourceDestinationView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_sourceDestinationView);
}

- (void)setSourceDestinationView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceDestinationView, a3);
}

- (WFContentCollection)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_sourceDestinationView);
}

void __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDataSource:", v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_2;
  v6[3] = &unk_24E604E80;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  dispatch_time_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  _QWORD v31[6];

  v31[4] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfItems"))
  {
    v29 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "setContentViewController:", v29);
    objc_msgSend(*(id *)(a1 + 40), "dataSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFSmartPromptHostingControllerFactory makeHostingController:](WFSmartPromptHostingControllerFactory, "makeHostingController:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addChildViewController:", v3);

    objc_msgSend(*(id *)(a1 + 40), "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);
    v28 = v3;
    objc_msgSend(v3, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v21 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v7, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v24;
    objc_msgSend(v7, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v11;
    objc_msgSend(v7, "leftAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v6;
    objc_msgSend(v6, "leftAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v14;
    objc_msgSend(v7, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:", v18);

    objc_msgSend(*(id *)(a1 + 40), "contentViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "didMoveToParentViewController:", v19);

    objc_msgSend(*(id *)(a1 + 40), "invalidateContentSize");
    v20 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_3;
    block[3] = &unk_24E604D88;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_after(v20, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __58__WFSmartPromptDialogViewController_loadContentCollection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateContentSize");
}

void __44__WFSmartPromptDialogViewController_actions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BEC2F30]);
  objc_msgSend(v3, "setDelegate:", WeakRetained);
  objc_msgSend(v3, "setDataSource:", v2);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  objc_msgSend(v3, "setOverrideParentApplicationDisplayIdentifier:", *MEMORY[0x24BEC17D8]);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__WFSmartPromptDialogViewController_actions__block_invoke_2;
  v5[3] = &unk_24E604768;
  v5[4] = &v10;
  v5[5] = &v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

  objc_msgSend(v3, "setIsContentManaged:", v7[3] > v11[3]);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithResult:", 2);

}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithResult:", 1);

}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "denyButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC46C8]);

  if (v4)
    v5 = 5;
  else
    v5 = 0;
  objc_msgSend(WeakRetained, "finishWithResult:", v5);

}

void __44__WFSmartPromptDialogViewController_actions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "attributionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToBeSentToDestinationWithManagedLevel:", 1);

  if (v4)
  {
    v5 = a1 + 32;
    v6 = v9;
LABEL_5:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 24);
    goto LABEL_6;
  }
  objc_msgSend(v9, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAllowedToBeSentToDestinationWithManagedLevel:", 2);

  v6 = v9;
  if (v8)
  {
    v5 = a1 + 40;
    goto LABEL_5;
  }
LABEL_6:

}

@end
