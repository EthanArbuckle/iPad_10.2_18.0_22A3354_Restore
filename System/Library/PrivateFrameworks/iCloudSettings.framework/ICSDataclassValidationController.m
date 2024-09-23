@implementation ICSDataclassValidationController

- (ICSDataclassValidationController)initWithAccount:(id)a3 presentingViewController:(id)a4
{
  id v7;
  id v8;
  ICSDataclassValidationController *v9;
  ICSDataclassValidationController *v10;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *validationAccessSemaphore;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *validationAccessQueue;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICSDataclassValidationController;
  v9 = -[ICSDataclassValidationController init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_presentingViewController, v8);
    v11 = dispatch_semaphore_create(1);
    validationAccessSemaphore = v10->_validationAccessSemaphore;
    v10->_validationAccessSemaphore = (OS_dispatch_semaphore *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.validation-access-queue", v13);
    validationAccessQueue = v10->_validationAccessQueue;
    v10->_validationAccessQueue = (OS_dispatch_queue *)v14;

    -[ICSDataclassValidationController _startObservingNotifications](v10, "_startObservingNotifications");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ICSDataclassValidationController _stopObservingNotifications](self, "_stopObservingNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICSDataclassValidationController;
  -[ICSDataclassValidationController dealloc](&v3, sel_dealloc);
}

- (BOOL)isDataclassAvailable:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = self->_manateeAvailable
    || -[ICSDataclassValidationController _currentWalrusStatus](self, "_currentWalrusStatus") == 2
    || -[ICSDataclassValidationController _isDataclassAllowlisted:](self, "_isDataclassAllowlisted:", v4);

  return v5;
}

- (void)validateAccessForDataclass:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  OS_dispatch_semaphore *v9;
  NSObject *validationAccessQueue;
  OS_dispatch_semaphore *v11;
  _QWORD v12[4];
  OS_dispatch_semaphore *v13;
  id v14;
  void (**v15)(id, uint64_t);
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "[ICSDataclassValidationController validateAccessForDataclass] dataclass: %@", buf, 0xCu);
  }

  if (self->_manateeAvailable
    || -[ICSDataclassValidationController _currentWalrusStatus](self, "_currentWalrusStatus") == 2
    || -[ICSDataclassValidationController _isDataclassAllowlisted:](self, "_isDataclassAllowlisted:", v6))
  {
    v7[2](v7, 1);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v9 = self->_validationAccessSemaphore;
    validationAccessQueue = self->_validationAccessQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke;
    v12[3] = &unk_251C60EB8;
    v13 = v9;
    v11 = v9;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v7;
    v14 = v6;
    dispatch_async(validationAccessQueue, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v14;
  id v15;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2;
  aBlock[3] = &unk_251C60E40;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v4 = _Block_copy(aBlock);
  if (WeakRetained)
  {
    v5 = objc_msgSend(WeakRetained, "_currentWalrusStatus");
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_2();

      objc_msgSend(WeakRetained, "_walrusValidateAccessForDataclass:completion:", *(_QWORD *)(a1 + 40), v4);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "ICSDataclassValidationController: Dataclass access cannot be validated, walrus status is unknown", buf, 2u);
      }

      v9[0] = v3;
      v9[1] = 3221225472;
      v9[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_24;
      v9[3] = &unk_251C60E90;
      v10 = WeakRetained;
      v11 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v9);

    }
  }
  else
  {
    LogSubsystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_1();

    (*((void (**)(void *, _QWORD))v4 + 2))(v4, 0);
  }

}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD v4[4];
  id v5;
  char v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_3;
  v4[3] = &unk_251C60E18;
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

uint64_t __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_24(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2_25;
  v2[3] = &unk_251C60E68;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_walrusPresentUnknownErrorWithCompletionHandler:", v2);

}

uint64_t __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_2_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_startObservingNotifications
{
  -[ICSDataclassValidationController _startObservingWalrusStateChangeNotification](self, "_startObservingWalrusStateChangeNotification");
  -[ICSDataclassValidationController _startObservingManateeAvailabilityNotification](self, "_startObservingManateeAvailabilityNotification");
}

- (void)_stopObservingNotifications
{
  -[ICSDataclassValidationController _stopObservingWalrusStateChangeNotification](self, "_stopObservingWalrusStateChangeNotification");
  -[ICSDataclassValidationController _stopObservingManateeAvailabilityNotification](self, "_stopObservingManateeAvailabilityNotification");
}

- (void)_reloadSpecifiers
{
  id v3;

  -[ICSDataclassValidationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifiersForDataclassValidationController:", self);

}

- (BOOL)_isEligibleForWalrus
{
  void *v2;
  char v3;

  -[ICSDataclassValidationController account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

  return v3;
}

- (unint64_t)_currentWalrusStatus
{
  if (-[ICSDataclassValidationController _isEligibleForWalrus](self, "_isEligibleForWalrus"))
    return self->_currentWalrusStatus;
  else
    return 2;
}

- (void)_startObservingWalrusStateChangeNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_24B4C1000, v0, v1, "Account not eligible for walrus, will not observe walrus state changes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Received walrus state change notification, fetching current status...", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_26;
  v7[3] = &unk_251C60F08;
  v5 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "walrusStatusWithCompletion:", v7);

}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v5 = a3;
  if (v5)
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_26_cold_1((uint64_t)v5, a2, v6);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_27;
  block[3] = &unk_251C60EE0;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = a2;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_27(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(a1 + 48);
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 134217984;
    v8 = v5;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Setting current walrus status to: %lu", (uint8_t *)&v7, 0xCu);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 48);
  if (v2 != v3)
    objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_30(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a2;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE1A370];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_2;
  v9[3] = &unk_251C60F58;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v9);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v4[3];
  v4[3] = v7;

}

uint64_t __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_stopObservingWalrusStateChangeNotification
{
  void *v3;
  id walrusStateChangeNotificationObserver;
  id v5;

  v5 = self->_walrusStateChangeNotificationObserver;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", v5);

  }
  walrusStateChangeNotificationObserver = self->_walrusStateChangeNotificationObserver;
  self->_walrusStateChangeNotificationObserver = 0;

}

- (void)_startObservingManateeAvailabilityNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_24B4C1000, v0, v1, "Account not eligible for walrus, will not observe manatee availability", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__ICSDataclassValidationController__startObservingManateeAvailabilityNotification__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  unsigned __int8 *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(v2);
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE1A360]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
      v7 = WeakRetained[16];
      WeakRetained[16] = v6;
      if (v7 != v6)
        objc_msgSend(WeakRetained, "_reloadSpecifiers");
    }
  }

}

- (void)_stopObservingManateeAvailabilityNotification
{
  void *v3;
  id manateeAvailabilityNotificationObserver;
  id v5;

  v5 = self->_manateeAvailabilityNotificationObserver;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", v5);

  }
  manateeAvailabilityNotificationObserver = self->_manateeAvailabilityNotificationObserver;
  self->_manateeAvailabilityNotificationObserver = 0;

}

- (void)_walrusValidateAccessForDataclass:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v18;

  v5 = a4;
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke;
  aBlock[3] = &unk_251C60FD0;
  v7 = v5;
  v18 = v7;
  v8 = _Block_copy(aBlock);
  if (-[ICSDataclassValidationController _isEligibleForWalrus](self, "_isEligibleForWalrus"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04CD8]), "initWithType:", 4);
    v10 = objc_alloc(MEMORY[0x24BE04D30]);
    -[ICSDataclassValidationController presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFlowContext:withPresentingViewController:", v9, v11);

    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_42;
    v14[3] = &unk_251C60FD0;
    v15 = v8;
    objc_msgSend(v12, "verifyAndRepairManateeWithCompletion:", v14);

  }
  else
  {
    LogSubsystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v13, OS_LOG_TYPE_DEFAULT, "Account not eligible for walrus, will not perform dataclass access validation", buf, 2u);
    }

    (*((void (**)(void *, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

void __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (a2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

void __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_42(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_2;
  block[3] = &unk_251C60FF8;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_walrusPresentUnknownErrorWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESS_DATACLASS_VALIDATION_FAILED_TITLE"), &stru_251C6B070, CFSTR("Localizable-Walrus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACCESS_DATACLASS_VALIDATION_FAILED_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-Walrus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ACCESS_DATACLASS_VALIDATION_FAILED_BUTTON_TITLE"), &stru_251C6B070, CFSTR("Localizable-Walrus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertWithTitle:message:buttonTitle:", v7, v9, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[ICSDataclassValidationController presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, v4);

}

- (BOOL)_isDataclassAllowlisted:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = _isDataclassAllowlisted__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isDataclassAllowlisted__once, &__block_literal_global);
  v5 = objc_msgSend((id)_isDataclassAllowlisted__allowlistedDataclasses, "containsObject:", v4);

  return v5;
}

void __60__ICSDataclassValidationController__isDataclassAllowlisted___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BDB3DE8];
  v5[0] = *MEMORY[0x24BDB3DD8];
  v5[1] = v1;
  v5[2] = *MEMORY[0x24BDB3E38];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_isDataclassAllowlisted__allowlistedDataclasses;
  _isDataclassAllowlisted__allowlistedDataclasses = v3;

}

- (ACAccount)account
{
  return self->_account;
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (ICSDataclassValidationControllerDelegate)delegate
{
  return (ICSDataclassValidationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_validationAccessQueue, 0);
  objc_storeStrong((id *)&self->_validationAccessSemaphore, 0);
  objc_storeStrong(&self->_manateeAvailabilityNotificationObserver, 0);
  objc_storeStrong(&self->_walrusStateChangeNotificationObserver, 0);
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_24B4C1000, v0, OS_LOG_TYPE_ERROR, "ICSDataclassValidationController has been released, unable to continue validation", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __74__ICSDataclassValidationController_validateAccessForDataclass_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_24B4C1000, v0, v1, "Attempting to toggle dataclass switch on walrus account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __80__ICSDataclassValidationController__startObservingWalrusStateChangeNotification__block_invoke_26_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "Failed to determine walrus status (%lu) with error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __81__ICSDataclassValidationController__walrusValidateAccessForDataclass_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Failed to repair manatee state for walrus account with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
