@implementation PSGFindMyiPhoneController

+ (id)shared
{
  void *v2;
  PSGFindMyiPhoneController *v3;
  void *v4;

  v2 = (void *)gFindMyiPhoneController;
  if (!gFindMyiPhoneController)
  {
    v3 = objc_alloc_init(PSGFindMyiPhoneController);
    v4 = (void *)gFindMyiPhoneController;
    gFindMyiPhoneController = (uint64_t)v3;

    v2 = (void *)gFindMyiPhoneController;
  }
  return v2;
}

- (PSGFindMyiPhoneController)init
{
  PSGFindMyiPhoneController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGFindMyiPhoneController;
  v2 = -[PSGFindMyiPhoneController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_locatorStateDidChange_, *MEMORY[0x24BE04C68], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSGFindMyiPhoneController;
  -[PSGFindMyiPhoneController dealloc](&v4, sel_dealloc);
}

- (BOOL)isFindMyiPhoneProvisioned
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(MEMORY[0x24BE048E0], "sharedManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x24BDB45B8];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isProvisionedForDataclass:", v7) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)isFindMyiPhoneEnabled
{
  OS_dispatch_semaphore *v3;
  OS_dispatch_semaphore *stateChangeSem;
  void *v5;
  int v6;
  void *v7;
  OS_dispatch_semaphore *v8;
  void *v9;
  char v10;

  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  stateChangeSem = self->_stateChangeSem;
  self->_stateChangeSem = v3;

  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChangingState");

  if (v6)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_stateChangeSem, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isChangingState"))
      -[PSGFindMyiPhoneController isFindMyiPhoneEnabled].cold.1();

  }
  v8 = self->_stateChangeSem;
  self->_stateChangeSem = 0;

  objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabled");

  return v10;
}

- (void)locatorStateDidChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;

  v4 = a3;
  if (self->_stateChangeSem)
  {
    v7 = v4;
    objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isChangingState");

    v4 = v7;
    if ((v6 & 1) == 0)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_stateChangeSem);
      v4 = v7;
    }
  }

}

- (id)preferredFindMyiPhoneAccount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x24BE048E0], "sharedManager", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x24BDB45B8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isProvisionedForDataclass:", v8))
        {
          if (objc_msgSend(v10, "accountServiceType") != 1
            && objc_msgSend(v10, "accountServiceType") != 2)
          {
            -[PSGFindMyiPhoneController preferredFindMyiPhoneAccount].cold.1();
          }
          if (!v6
            || objc_msgSend(v6, "accountServiceType") == 1
            && objc_msgSend(v10, "accountServiceType") == 2
            || (v11 = objc_msgSend(v6, "accountServiceType"),
                v11 == objc_msgSend(v10, "accountServiceType"))
            && objc_msgSend(v10, "primaryAccount"))
          {
            v12 = v10;

            v6 = v12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)enablePhoneLocatorWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[PSGFindMyiPhoneController isFindMyiPhoneEnabled](self, "isFindMyiPhoneEnabled"))
  {
    v4[2](v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BE04CE8];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__PSGFindMyiPhoneController_enablePhoneLocatorWithCompletion___block_invoke;
    v6[3] = &unk_24F9C8690;
    v7 = v4;
    objc_msgSend(v5, "showEnableAlertWithCompletion:", v6);

  }
}

uint64_t __62__PSGFindMyiPhoneController_enablePhoneLocatorWithCompletion___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)disablePhoneLocatorWithMessageString:(id)a3 buttonTitle:(id)a4 presentingViewController:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v25 = &unk_24F9D4350;
  v26[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke;
  v20[3] = &unk_24F9C86E0;
  v23 = v12;
  v24 = v13;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v13;
  objc_msgSend(v14, "evaluatePolicy:options:reply:", 1025, v15, v20);

}

void __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _PSGLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E024000, v5, OS_LOG_TYPE_DEFAULT, "Evalutaing Policy Location Based Device Owner Authentication", buf, 2u);
  }

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "preferredFindMyiPhoneAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _PSGLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_22E024000, v9, OS_LOG_TYPE_DEFAULT, "########### FMiP Account: %@", buf, 0xCu);
    }

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isChangingState");

      if (v11)
      {
        _PSGLoggingFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22E024000, v12, OS_LOG_TYPE_DEFAULT, "########### FMiP state is changing.", buf, 2u);
        }
        v13 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE04CF8], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEnabled");

        if ((v17 & 1) != 0)
          goto LABEL_20;
        _PSGLoggingFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v13 = 2;
          _os_log_impl(&dword_22E024000, v12, OS_LOG_TYPE_DEFAULT, "########### FMiP is already disabled.", buf, 2u);
        }
        else
        {
          v13 = 2;
        }
      }
    }
    else
    {
      _PSGLoggingFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22E024000, v12, OS_LOG_TYPE_DEFAULT, "########### No FMiP Account.", buf, 2u);
      }
      v13 = 1;
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", FindMyiPhoneControllerErrorDomain, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_23:

      goto LABEL_24;
    }
LABEL_20:
    _PSGLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v18, OS_LOG_TYPE_DEFAULT, "########### FMiP have no error, proceeding to present alert.", buf, 2u);
    }

    v19 = (void *)MEMORY[0x24BE04CE8];
    objc_msgSend(v8, "account");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 48);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke_17;
    v24[3] = &unk_24F9C86B8;
    v23 = *(_QWORD *)(a1 + 56);
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v19, "showDisableAlertForAccount:withMessage:confirmationButtonTitle:presentingViewController:completion:", v20, v21, v22, v23, v24);

    v15 = v25;
    goto LABEL_23;
  }
  _PSGLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "Policy failed with %@", buf, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", FindMyiPhoneControllerErrorDomain, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);
LABEL_24:

}

void __114__PSGFindMyiPhoneController_disablePhoneLocatorWithMessageString_buttonTitle_presentingViewController_completion___block_invoke_17(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _PSGLoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "########### User cancelled erase in FMiP alert", (uint8_t *)&v10, 2u);
    }

    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", FindMyiPhoneControllerErrorDomain, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    if (v7)
    {
      v10 = 134217984;
      v11 = objc_msgSend(v5, "length");
      _os_log_impl(&dword_22E024000, v6, OS_LOG_TYPE_DEFAULT, "########### User confirms disable FMiP and obtained wipeToken of length: %ld", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangeSem, 0);
}

- (void)isFindMyiPhoneEnabled
{
  __assert_rtn("-[PSGFindMyiPhoneController isFindMyiPhoneEnabled]", "PSGFindMyiPhoneController.m", 61, "![[AAUIDeviceLocatorService sharedInstance] isChangingState]");
}

- (void)preferredFindMyiPhoneAccount
{
  __assert_rtn("-[PSGFindMyiPhoneController preferredFindMyiPhoneAccount]", "PSGFindMyiPhoneController.m", 79, "account.accountServiceType == AAAccountServiceTypeMobileMe || account.accountServiceType == AAAccountServiceTypeiCloud");
}

@end
