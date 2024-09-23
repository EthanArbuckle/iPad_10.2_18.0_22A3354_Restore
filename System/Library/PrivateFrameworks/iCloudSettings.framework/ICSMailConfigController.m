@implementation ICSMailConfigController

- (ICSMailConfigController)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICSMailConfigController *v9;
  ICSMailConfigController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSMailConfigController;
  v9 = -[ICSMailConfigController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
  }

  return v10;
}

- (void)presentCreateFreeEmailPromptWithCompletion:(id)a3 isForNotes:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  id v20;

  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TURN_ON_NOTES_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("TURN_ON_NOTES_TITLE");
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TURN_ON_MAIL_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("TURN_ON_MAIL_TITLE");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CREATE_EMAIL_BUTTON"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v13, v20, v17, v15, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v18, 0, 0);

}

- (void)configureEmailAccount
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ACAccount *account;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  _QWORD aBlock[5];

  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke;
  aBlock[3] = &unk_251C60DC8;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNetworkActivityIndicatorVisible:", 1);

  -[ACAccount identifier](self->_account, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        -[ACAccount aa_authToken](self->_account, "aa_authToken"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    account = self->_account;
    v11[0] = v3;
    v11[1] = 3221225472;
    v11[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_4;
    v11[3] = &unk_251C61418;
    v12 = v4;
    objc_msgSend(v9, "renewCredentialsForAccount:completion:", account, v11);

  }
  else
  {
    v4[2](v4);
  }

}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = dispatch_queue_create("createEmailAccountQueue", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_2;
  block[3] = &unk_251C60DC8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BE04A78], "urlConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEmailURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_3;
  v6[3] = &unk_251C61060;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
    {
      v2 = objc_alloc_init(MEMORY[0x24BEBD7A0]);
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(void **)(v3 + 24);
      *(_QWORD *)(v3 + 24) = v2;

      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setModalPresentationStyle:", 2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1));
    }
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x24BE7EDC8]);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 32);
      *(_QWORD *)(v9 + 32) = v8;

      v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    }
    objc_msgSend(v7, "setDelegate:");
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE048F8]), "initWithURLString:account:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    objc_msgSend(v13, "urlRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadXMLUIWithRequest:", v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNetworkActivityIndicatorVisible:", 0);
  }

}

void __48__ICSMailConfigController_configureEmailAccount__block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD v2[4];
  id v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48__ICSMailConfigController_configureEmailAccount__block_invoke_5;
  v2[3] = &unk_251C613F0;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __48__ICSMailConfigController_configureEmailAccount__block_invoke_5(uint64_t result)
{
  if (!*(_QWORD *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  ACAccount *v11;
  id v12;
  NSObject *v13;
  ACAccount *v14;
  id WeakRetained;
  UINavigationController *v16;
  UINavigationController *addEmailNavController;
  id v18;
  NSMutableArray *addEmailObjectModels;
  NSMutableArray *v20;
  NSMutableArray *v21;
  _QWORD block[4];
  ACAccount *v23;
  id v24;
  _QWORD aBlock[5];

  v7 = a4;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNetworkActivityIndicatorVisible:", 0);

  v9 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke;
  aBlock[3] = &unk_251C60DC8;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  if (a5 == 2)
  {
    objc_msgSend(v7, "presentInParentViewController:animated:", self->_addEmailNavController, 1);
    objc_msgSend(v7, "setDelegate:", self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "presentedViewController");
    v16 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
    addEmailNavController = self->_addEmailNavController;

    if (v16 != addEmailNavController)
    {
      v18 = objc_loadWeakRetained((id *)&self->_presenter);
      objc_msgSend(v18, "presentViewController:animated:completion:", self->_addEmailNavController, 1, 0);

    }
    addEmailObjectModels = self->_addEmailObjectModels;
    if (!addEmailObjectModels)
    {
      v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v21 = self->_addEmailObjectModels;
      self->_addEmailObjectModels = v20;

      addEmailObjectModels = self->_addEmailObjectModels;
    }
    -[NSMutableArray addObject:](addEmailObjectModels, "addObject:", v7);
  }
  else if (a5 == 1)
  {
    v11 = self->_account;
    -[ACAccount setEnabled:forDataclass:](self->_account, "setEnabled:forDataclass:", 1, *MEMORY[0x24BDB3E38]);
    v12 = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(v12, "reloadSpecifiers");

    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_2;
    block[3] = &unk_251C60E90;
    v23 = v11;
    v24 = v10;
    v14 = v11;
    dispatch_async(v13, block);

  }
}

uint64_t __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dismissViewControllerAnimated:completion:", 1, 0);
}

void __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_3;
  v5[3] = &unk_251C61440;
  v6 = v2;
  v3 = *(void **)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v2;
  objc_msgSend(v4, "aa_updatePropertiesForAppleAccount:completion:", v3, v5);

}

void __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_4;
  v3[3] = &unk_251C60FD0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "saveVerifiedAccount:withCompletionHandler:", v2, v3);

}

void __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_5;
  block[3] = &unk_251C60E68;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __67__ICSMailConfigController_loader_receivedObjectModel_actionSignal___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  id v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNetworkActivityIndicatorVisible:", 0);

}

- (id)parentViewControllerForObjectModel:(id)a3
{
  return self->_addEmailNavController;
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id WeakRetained;
  id v7;
  NSMutableArray *addEmailObjectModels;
  UINavigationController *addEmailNavController;
  _QWORD v10[5];

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x24BE7EE48]))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    objc_msgSend(WeakRetained, "reloadSpecifiers");

    v7 = objc_loadWeakRetained((id *)&self->_presenter);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__ICSMailConfigController_objectModel_pressedButton_attributes___block_invoke;
    v10[3] = &unk_251C60DC8;
    v10[4] = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v10);

    addEmailObjectModels = self->_addEmailObjectModels;
    self->_addEmailObjectModels = 0;

    addEmailNavController = self->_addEmailNavController;
    self->_addEmailNavController = 0;

    -[ICSMailConfigController _cleanupLoader](self, "_cleanupLoader");
  }
}

void __64__ICSMailConfigController_objectModel_pressedButton_attributes___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char isKindOfClass;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    if (objc_msgSend(v4, "isMailSetupForced"))
      objc_msgSend(v4, "cancelButtonTapped:", *(_QWORD *)(a1 + 32));

  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  objc_msgSend(a4, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE048F8]), "initWithURLString:account:", v9, self->_account);
  objc_msgSend(v10, "urlRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setHTTPMethod:", v8);
  LODWORD(v11) = objc_msgSend(v8, "isEqualToString:", CFSTR("POST"));

  if ((_DWORD)v11)
  {
    objc_msgSend(v15, "postbackData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHTTPBody:", v13);

  }
  -[RUILoader loadXMLUIWithRequest:](self->_addEmailLoader, "loadXMLUIWithRequest:", v12);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNetworkActivityIndicatorVisible:", 1);

}

- (unint64_t)supportedInterfaceOrientationsForObjectModel:(id)a3 page:(id)a4
{
  return 30;
}

- (void)_cleanupLoader
{
  RUILoader *addEmailLoader;

  -[RUILoader cancel](self->_addEmailLoader, "cancel");
  -[RUILoader setDelegate:](self->_addEmailLoader, "setDelegate:", 0);
  addEmailLoader = self->_addEmailLoader;
  self->_addEmailLoader = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addEmailObjectModels, 0);
  objc_storeStrong((id *)&self->_addEmailLoader, 0);
  objc_storeStrong((id *)&self->_addEmailNavController, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
