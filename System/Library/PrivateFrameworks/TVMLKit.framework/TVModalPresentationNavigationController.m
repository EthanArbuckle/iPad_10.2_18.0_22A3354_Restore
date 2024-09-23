@implementation TVModalPresentationNavigationController

- (NSHashTable)presentedViewControllers
{
  NSHashTable *presentedViewControllers;
  NSHashTable *v4;
  NSHashTable *v5;

  presentedViewControllers = self->_presentedViewControllers;
  if (!presentedViewControllers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_presentedViewControllers;
    self->_presentedViewControllers = v4;

    presentedViewControllers = self->_presentedViewControllers;
  }
  return presentedViewControllers;
}

- (TVModalPresentationNavigationController)initWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  TVModalPresentationNavigationController *v9;
  TVModalPresentationNavigationController *v10;
  uint64_t v11;
  NSMapTable *pushCompletionBlocks;
  uint64_t v13;
  NSMapTable *popCompletionBlocks;
  void *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F98]), "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  v18.receiver = self;
  v18.super_class = (Class)TVModalPresentationNavigationController;
  v9 = -[TVModalPresentationNavigationController initWithRootViewController:](&v18, sel_initWithRootViewController_, v6);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootViewController, v6);
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0x10000);
    v11 = objc_claimAutoreleasedReturnValue();
    pushCompletionBlocks = v10->_pushCompletionBlocks;
    v10->_pushCompletionBlocks = (NSMapTable *)v11;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0x10000);
    v13 = objc_claimAutoreleasedReturnValue();
    popCompletionBlocks = v10->_popCompletionBlocks;
    v10->_popCompletionBlocks = (NSMapTable *)v13;

    objc_storeStrong((id *)&v10->_configuration, a3);
    -[TVModalPresentationNavigationController _updateConfiguration](v10, "_updateConfiguration");
    -[TVModalPresentationNavigationController navigationBar](v10, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPrefersLargeTitles:", 1);

    -[TVModalPresentationNavigationController navigationBar](v10, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setHidesShadow:", 1);

  }
  return v10;
}

- (void)setConfiguration:(id)a3
{
  TVModalPresentationConfiguration *v5;
  TVModalPresentationConfiguration *v6;

  v5 = (TVModalPresentationConfiguration *)a3;
  if (self->_configuration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    -[TVModalPresentationNavigationController _updateConfiguration](self, "_updateConfiguration");
    v5 = v6;
  }

}

- (void)_updateConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[TVModalPresentationNavigationController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1000)
    goto LABEL_4;
  -[TVModalPresentationNavigationController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 1001)
  {

LABEL_4:
    v5 = 0;
    goto LABEL_5;
  }
  -[TVModalPresentationNavigationController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 1002)
  {
    v5 = 0;
    goto LABEL_6;
  }
  -[TVModalPresentationNavigationController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "type");
LABEL_5:

LABEL_6:
  -[TVModalPresentationNavigationController setModalPresentationStyle:](self, "setModalPresentationStyle:", v5);
  -[TVModalPresentationNavigationController configuration](self, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TVModalPresentationNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", objc_msgSend(v8, "isNavigationBarHidden"), 0);

}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSMapTable *popCompletionBlocks;
  void *v10;
  void *v11;
  NSMapTable *v12;
  void *v13;
  NSArray *previousViewControllers;
  _QWORD block[4];
  id v16;

  v5 = a3;
  v6 = (void *)-[NSArray copy](self->_previousViewControllers, "copy");
  -[TVModalPresentationNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v5) & 1) == 0
    && (objc_msgSend(v7, "lastObject"), v8 = (id)objc_claimAutoreleasedReturnValue(), v8, v8 == v5))
  {
    -[NSMapTable objectForKey:](self->_pushCompletionBlocks, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_pushCompletionBlocks, "removeObjectForKey:", v5);
  }
  else
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    objc_msgSend(v6, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](popCompletionBlocks, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = self->_popCompletionBlocks;
    objc_msgSend(v6, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](v12, "removeObjectForKey:", v13);

  }
  previousViewControllers = self->_previousViewControllers;
  self->_previousViewControllers = 0;

  if (v11)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__TVModalPresentationNavigationController_didShowViewController_animated___block_invoke;
    block[3] = &unk_24EB85320;
    v16 = v11;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __74__TVModalPresentationNavigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  NSMapTable *pushCompletionBlocks;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if (a5)
  {
    pushCompletionBlocks = self->_pushCompletionBlocks;
    v9 = (void *)MEMORY[0x22767F470](a5);
    -[NSMapTable setObject:forKey:](pushCompletionBlocks, "setObject:forKey:", v9, v10);

  }
  -[TVModalPresentationNavigationController pushViewController:animated:](self, "pushViewController:animated:", v10, v6);

}

- (id)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  NSMapTable *popCompletionBlocks;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (a4)
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    v7 = (void *)MEMORY[0x22767F470](a4, a2);
    -[TVModalPresentationNavigationController viewControllers](self, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](popCompletionBlocks, "setObject:forKey:", v7, v9);

  }
  return -[TVModalPresentationNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", v4);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *previousViewControllers;
  objc_super v13;

  v4 = a4;
  v6 = a3;
  -[TVModalPresentationNavigationController viewControllers](self, "viewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v6, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidesBackButton:", 1);

  }
  -[TVModalPresentationNavigationController viewControllers](self, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSArray *)objc_msgSend(v10, "copy");
  previousViewControllers = self->_previousViewControllers;
  self->_previousViewControllers = v11;

  v13.receiver = self;
  v13.super_class = (Class)TVModalPresentationNavigationController;
  -[TVModalPresentationNavigationController pushViewController:animated:](&v13, sel_pushViewController_animated_, v6, v4);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSArray *v6;
  NSArray *previousViewControllers;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v3 = a3;
  -[TVModalPresentationNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  previousViewControllers = self->_previousViewControllers;
  self->_previousViewControllers = v6;

  -[TVModalPresentationNavigationController viewControllers](self, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 2)
  {
    -[TVModalPresentationNavigationController _dismissForLastViewController:](self, "_dismissForLastViewController:", v3);
    return 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TVModalPresentationNavigationController;
    -[TVModalPresentationNavigationController popViewControllerAnimated:](&v11, sel_popViewControllerAnimated_, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_dismissForLastViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  -[NSArray lastObject](self->_previousViewControllers, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_popCompletionBlocks, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVModalPresentationNavigationController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__TVModalPresentationNavigationController__dismissForLastViewController___block_invoke;
  v10[3] = &unk_24EB85320;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v3, v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("TVModalPresentationNavigationControllerDismissedNotification"), self);

}

uint64_t __73__TVModalPresentationNavigationController__dismissForLastViewController___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[TVModalPresentationNavigationController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2557AEA40))
    objc_msgSend(v5, "updatePreferredFocusedViewStateForFocus:", v3);

}

- (UIAlertController)containingAlertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_containingAlertController);
}

- (void)setContainingAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_containingAlertController, a3);
}

- (TVModalPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_containingAlertController);
  objc_storeStrong((id *)&self->_popCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pushCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_previousViewControllers, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_presentedViewControllers, 0);
}

@end
