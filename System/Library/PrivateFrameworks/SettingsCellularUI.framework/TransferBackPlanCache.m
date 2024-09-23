@implementation TransferBackPlanCache

- (TransferBackPlanCache)initWithDelegate:(id)a3 navigationController:(id)a4 transferBackPlan:(id)a5
{
  id v9;
  id v10;
  id v11;
  TransferBackPlanCache *v12;
  TransferBackPlanCache *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TransferBackPlanCache;
  v12 = -[TransferBackPlanCache init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_transferBackItem, a5);
    objc_storeStrong((id *)&v13->_delegate, a3);
    objc_storeWeak((id *)&v13->_navigationController, v10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel_cellularPlanChanged_, CFSTR("PSUICellularPlanChanged"), 0);

    -[TransferBackPlanCache transferBack:](v13, "transferBack:", v11);
  }

  return v13;
}

- (void)dealloc
{
  NSObject *v3;
  TSSIMSetupFlow *flow;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  TSSIMSetupFlow *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[TransferBackPlanCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    flow = self->_flow;
    *(_DWORD *)buf = 138412290;
    v8 = flow;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "release SS flow : %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)TransferBackPlanCache;
  -[TransferBackPlanCache dealloc](&v6, sel_dealloc);
}

- (void)transferBack:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *existedIccids;
  NSTimer *v19;
  NSTimer *activateTimer;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  objc_storeStrong(&self->_transferBackItem, a3);
  v5 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "iccid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[TransferBackPlanCache getLogger](self, "getLogger");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "iccid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v27 = v15;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "existed iccid : %@", buf, 0xCu);

          }
          objc_msgSend(v12, "iccid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v9);
  }

  v17 = (NSArray *)objc_msgSend(v5, "copy");
  existedIccids = self->_existedIccids;
  self->_existedIccids = v17;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TransferBackPlanCache _useLine:forPlan:](self, "_useLine:forPlan:", 1, v21);
    if (-[TransferBackPlanCache _canLaunchSIMSetupFlow](self, "_canLaunchSIMSetupFlow"))
    {
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleActivateExpiry, 0, 0, 30.0);
      v19 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      activateTimer = self->_activateTimer;
      self->_activateTimer = v19;

    }
  }
  -[TransferBackPlanCache _prepareSIMSetupFlow](self, "_prepareSIMSetupFlow");

}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  NSObject *v5;
  _QWORD block[5];
  id v7[2];
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[TransferBackPlanCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = a3;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "finish SS flow : %lu", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TransferBackPlanCache_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_24D5019D0;
  objc_copyWeak(v7, (id *)buf);
  v7[1] = (id)a3;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v7);
  objc_destroyWeak((id *)buf);
}

void __47__TransferBackPlanCache_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(v3, "setFlow:", 0);
    v7 = *(_QWORD *)(a1 + 48);
    if (v7 != 2)
    {
      if (v7 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "getLogger");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "transfer back canceled", buf, 2u);
        }

        objc_msgSend(v3, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "transferBackItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "transferBackCanceled:", v10);
        goto LABEL_13;
      }
      objc_msgSend(*(id *)(a1 + 32), "getLogger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "transfer back failed, abort", v14, 2u);
      }

      objc_msgSend(v3, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferBackItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transferBackFailed:error:", v10, v12);
LABEL_12:

LABEL_13:
      goto LABEL_14;
    }
    objc_msgSend(v3, "transferToItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferBackItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "transferToItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transferBackSuccessFrom:to:", v10, v12);
      goto LABEL_12;
    }
  }
LABEL_14:

}

- (BOOL)_canLaunchSIMSetupFlow
{
  void *v3;
  uint64_t v4;
  BOOL result;

  objc_msgSend(self->_transferBackItem, "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  result = 0;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(self->_transferBackItem, "type") == 2)
      return 1;
  }
  return result;
}

- (void)_prepareSIMSetupFlow
{
  void *v3;
  id transferBackItem;
  void *v5;
  TSSIMSetupFlow *v6;
  TSSIMSetupFlow *flow;
  TSSIMSetupFlow *v8;
  _QWORD v9[5];
  id v10;
  id location;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  if (-[TransferBackPlanCache _canLaunchSIMSetupFlow](self, "_canLaunchSIMSetupFlow"))
  {
    v3 = (void *)MEMORY[0x24BE82B38];
    v12[0] = *MEMORY[0x24BE82B48];
    v12[1] = CFSTR("TransferBackPlan");
    transferBackItem = self->_transferBackItem;
    v13[0] = &unk_24D51C320;
    v13[1] = transferBackItem;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flowWithOptions:", v5);
    v6 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
    flow = self->_flow;
    self->_flow = v6;

    -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
    location = 0;
    objc_initWeak(&location, self);
    v8 = self->_flow;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__TransferBackPlanCache__prepareSIMSetupFlow__block_invoke;
    v9[3] = &unk_24D501810;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    -[TSSIMSetupFlow firstViewController:](v8, "firstViewController:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __45__TransferBackPlanCache__prepareSIMSetupFlow__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "isPlanReactivated") & 1) == 0)
    {
      objc_msgSend(v5, "activateTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v5, "setRootViewController:", v3);
      else
        objc_msgSend(v5, "_presentViewController:", v3);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "invalid PSUIReActivateSIMSpecifier", v8, 2u);
    }

  }
}

- (void)_useLine:(BOOL)a3 forPlan:(id)a4
{
  _BOOL8 v4;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  -[TransferBackPlanCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("deselected");
    if (v4)
      v8 = CFSTR("selected");
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "%@ plan %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didSelectPlanItem:isEnable:", v6, v4);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TransferBackPlanCache getLogger](self, "getLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v10;
      _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "Failed to select plan: %@, error: %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (void)_handleActivateExpiry
{
  NSTimer *activateTimer;
  UIViewController *rootViewController;

  -[NSTimer invalidate](self->_activateTimer, "invalidate");
  activateTimer = self->_activateTimer;
  self->_activateTimer = 0;

  if (!self->_isPlanReactivated)
  {
    -[TransferBackPlanCache _useLine:forPlan:](self, "_useLine:forPlan:", 0, self->_transferBackItem);
    if (self->_rootViewController)
    {
      -[TransferBackPlanCache _presentViewController:](self, "_presentViewController:");
      rootViewController = self->_rootViewController;
      self->_rootViewController = 0;

    }
  }
}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isConnectedOverWiFi"))
  {

LABEL_4:
    -[TransferBackPlanCache getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
      objc_msgSend(WeakRetained, "topViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "present %@. current top view controller : %@", (uint8_t *)&v15, 0x16u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v4;
    }
    else
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v4);
      objc_msgSend(v11, "setModalPresentationStyle:", 2);
    }
    v12 = objc_loadWeakRetained((id *)&self->_navigationController);
    objc_msgSend(v12, "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v11, 1, 0);

    goto LABEL_13;
  }
  +[PSUIDeviceCellularState sharedInstance](PSUIDeviceCellularState, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isConnectedOverCellular");

  if ((v7 & 1) != 0)
    goto LABEL_4;
  -[TransferBackPlanCache getLogger](self, "getLogger");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "Data connectivity is not available to set up eSIM(s)", (uint8_t *)&v15, 2u);
  }

  -[TransferBackPlanCache _showWifiAlert](self, "_showWifiAlert");
LABEL_13:

}

- (void)_showWifiAlert
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOT_CONNECTED_TO_INTERNET"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sf_isiPhone");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = CFSTR("TURN_ON_WIFI_TO_SETUP_ESIM");
  else
    v9 = CFSTR("TURN_ON_WIFI_TO_SETUP_ESIM_IPAD");
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v4, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v10;
  if (objc_msgSend(v12, "sf_isChinaRegionCellularDevice"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class(), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CHOOSE_WLAN"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class(), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CHOOSE_WIFI"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD3A8];
  v16 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __39__TransferBackPlanCache__showWifiAlert__block_invoke;
  v28[3] = &unk_24D501790;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v15, "actionWithTitle:style:handler:", v14, 0, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);
  v18 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __39__TransferBackPlanCache__showWifiAlert__block_invoke_2;
  v26[3] = &unk_24D5019F8;
  v26[4] = self;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v21);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  objc_msgSend(WeakRetained, "topViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "presentViewController:animated:completion:", v11, 1, 0);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

void __39__TransferBackPlanCache__showWifiAlert__block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 51, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(a1);
  objc_msgSend(v4, "transferBackItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transferBackFailed:error:", v5, v8);

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openSensitiveURL:withOptions:", v7, 0);

}

void __39__TransferBackPlanCache__showWifiAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "user canceled setting up eSIM", v8, 2u);
  }

  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "transferBackItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transferBackCanceled:", v7);

}

- (id)getLogger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BE85668];
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(self->_transferBackItem, "iccid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("reactivate.sim.model.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggerWithCategory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cellularPlanChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  NSArray *existedIccids;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSString *v19;
  NSString *installingIccid;
  void *v21;
  int v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSTimer *activateTimer;
  NSObject *v30;
  NSObject *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (!self->_transferBackItem)
    return;
  -[TransferBackPlanCache getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v38 = CFSTR("PSUICellularPlanChanged");
    _os_log_debug_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEBUG, "received notification %@", buf, 0xCu);
  }

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v8)
    goto LABEL_29;
  v9 = v8;
  v10 = *(_QWORD *)v33;
LABEL_6:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v33 != v10)
      objc_enumerationMutation(v7);
    v12 = *(__CFString **)(*((_QWORD *)&v32 + 1) + 8 * v11);
    existedIccids = self->_existedIccids;
    -[__CFString iccid](v12, "iccid", (_QWORD)v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(existedIccids) = -[NSArray hasIccid:](existedIccids, "hasIccid:", v14);

    if (!(_DWORD)existedIccids)
      goto LABEL_12;
    -[__CFString iccid](v12, "iccid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(self->_transferBackItem, "iccid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if (v17)
      break;
LABEL_21:
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v9)
        goto LABEL_6;
      goto LABEL_29;
    }
  }
  if (-[__CFString transferredStatus](v12, "transferredStatus"))
  {
LABEL_12:
    if (-[__CFString isInstalling](v12, "isInstalling"))
    {
      -[__CFString iccid](v12, "iccid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[__CFString iccid](v12, "iccid");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        installingIccid = self->_installingIccid;
        self->_installingIccid = v19;

      }
    }
    else
    {
      -[__CFString plan](v12, "plan");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "status");

      if (!v22)
      {
        v23 = self->_installingIccid;
        -[__CFString iccid](v12, "iccid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = -[NSString isEqualToString:](v23, "isEqualToString:", v24);

        if ((_DWORD)v23)
        {
          if ((-[__CFString isSelected](v12, "isSelected") & 1) == 0 && !self->_flow)
          {
            -[TransferBackPlanCache getLogger](self, "getLogger");
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v38 = v12;
              _os_log_impl(&dword_2161C6000, v30, OS_LOG_TYPE_DEFAULT, "transfer disabled item back as new item: %@. enable it.", buf, 0xCu);
            }

            -[TransferBackPlanCache _useLine:forPlan:](self, "_useLine:forPlan:", 1, v12);
            goto LABEL_29;
          }
          -[__CFString phoneNumber](v12, "phoneNumber");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(self->_transferBackItem, "phoneNumber");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToPhoneNumber:", v26);

          if (v27)
          {
            if (-[__CFString type](v12, "type"))
            {
              -[TransferBackPlanCache getLogger](self, "getLogger");
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2161C6000, v31, OS_LOG_TYPE_DEFAULT, "yeah, the phone number transferred back", buf, 2u);
              }

              objc_storeStrong((id *)&self->_transferToItem, v12);
              if (self->_flow)
                goto LABEL_29;
LABEL_28:
              -[PSUIReActivateSIMSpecifierModelDelegate transferBackSuccessFrom:to:](self->_delegate, "transferBackSuccessFrom:to:", self->_transferBackItem, v12);
              goto LABEL_29;
            }
          }
        }
      }
    }
    goto LABEL_21;
  }
  -[TransferBackPlanCache getLogger](self, "getLogger");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v28, OS_LOG_TYPE_DEFAULT, "the plan is activated back", buf, 2u);
  }

  -[NSTimer invalidate](self->_activateTimer, "invalidate");
  activateTimer = self->_activateTimer;
  self->_activateTimer = 0;

  self->_isPlanReactivated = 1;
  if (!self->_flow || self->_rootViewController)
    goto LABEL_28;
LABEL_29:

}

- (PSUIReActivateSIMSpecifierModelDelegate)delegate
{
  return (PSUIReActivateSIMSpecifierModelDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_navigationController);
}

- (void)setNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_navigationController, a3);
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFlow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UIViewController)rootViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRootViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)existedIccids
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExistedIccids:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)transferBackItem
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setTransferBackItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSTimer)activateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivateTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CTCellularPlanItem)transferToItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransferToItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)installingIccid
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInstallingIccid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTransferError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSError)failureWebsheetError
{
  return (NSError *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFailureWebsheetError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)isPlanReactivated
{
  return self->_isPlanReactivated;
}

- (void)setIsPlanReactivated:(BOOL)a3
{
  self->_isPlanReactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureWebsheetError, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_installingIccid, 0);
  objc_storeStrong((id *)&self->_transferToItem, 0);
  objc_storeStrong((id *)&self->_activateTimer, 0);
  objc_storeStrong(&self->_transferBackItem, 0);
  objc_storeStrong((id *)&self->_existedIccids, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
