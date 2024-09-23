@implementation PTUISettingsController

- (PTUISettingsController)initWithRootSettings:(id)a3
{
  id v4;
  PTUIModuleController *v5;
  PTUISettingsController *v6;

  v4 = a3;
  v5 = -[PTUIModuleController initWithSettings:]([PTUIModuleController alloc], "initWithSettings:", v4);

  v6 = -[PTUISettingsController initWithRootModuleController:](self, "initWithRootModuleController:", v5);
  return v6;
}

- (id)_initWithRootModule:(id)a3
{
  id v4;
  id v5;
  PTUISettingsController *v6;

  v4 = a3;
  v5 = -[PTUIModuleController _initWithModule:presentingRow:]([PTUIModuleController alloc], "_initWithModule:presentingRow:", v4, 0);

  v6 = -[PTUISettingsController initWithRootModuleController:](self, "initWithRootModuleController:", v5);
  return v6;
}

- (PTUISettingsController)initWithRootModuleController:(id)a3
{
  PTUISettingsController *v3;
  PTUISettingsController *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PTUISettingsController initWithRootViewController:](self, "initWithRootViewController:", a3);
  v4 = v3;
  if (v3)
  {
    -[PTUISettingsController _defaultDismissButton](v3, "_defaultDismissButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUISettingsController setDismissButton:](v4, "setDismissButton:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTUISettingsController view](v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

  }
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDismissButton:(id)a3
{
  id v5;
  UIBarButtonItem **p_dismissButton;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_dismissButton = &self->_dismissButton;
  objc_storeStrong((id *)&self->_dismissButton, a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PTUISettingsController viewControllers](self, "viewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "navigationItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRightBarButtonItem:", *p_dismissButton);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", self->_dismissButton);

  v8.receiver = self;
  v8.super_class = (Class)PTUISettingsController;
  -[PTUISettingsController pushViewController:animated:](&v8, sel_pushViewController_animated_, v6, v4);

}

- (id)_defaultDismissButton
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismiss);
}

- (void)_dismiss
{
  id v2;

  -[PTUISettingsController presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_reloadWithRootModule:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  -[PTUISettingsController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PTUISettingsController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);

  objc_msgSend(v10, "_reloadWithModule:", v4);
  v9 = (id)-[PTUISettingsController popToViewController:animated:](self, "popToViewController:animated:", v10, 0);

}

- (UIBarButtonItem)dismissButton
{
  return self->_dismissButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end
