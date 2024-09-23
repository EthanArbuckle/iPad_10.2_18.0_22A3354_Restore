@implementation TSProximitySourceTransferFlow

- (TSProximitySourceTransferFlow)initWithPeerDevice:(id)a3
{
  id v4;
  TSProximitySourceTransferFlow *v5;
  TSProximitySourceTransferFlow *v6;
  id v7;
  uint64_t v8;
  CoreTelephonyClient *ctClient;
  void *v10;
  id v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TSProximitySourceTransferFlow;
  v5 = -[TSSIMSetupFlow init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isAuthenticationCompleted = 0;
    v5->_isFlowCompleted = 0;
    v5->_isRemotePeerClosed = 0;
    v5->_passcodeType = 0;
    v7 = objc_alloc(MEMORY[0x24BDC2810]);
    v8 = objc_msgSend(v7, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    ctClient = v6->_ctClient;
    v6->_ctClient = (CoreTelephonyClient *)v8;

    -[CoreTelephonyClient setDelegate:](v6->_ctClient, "setDelegate:", v6);
    v16 = 0;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB240]), "initWithDictionary:error:", v4, &v16);
    v11 = v16;
    if (v11)
    {
      _TSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TSProximitySourceTransferFlow initWithPeerDevice:].cold.1();

      v13 = 0;
    }
    else if (objc_msgSend(v10, "nearbyActionDeviceClass"))
    {
      v13 = objc_msgSend(v10, "nearbyActionDeviceClass");
    }
    else
    {
      _TSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[TSProximitySourceTransferFlow initWithPeerDevice:]";
        _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "no device class from bluetooth, set as iPhone @%s", buf, 0xCu);
      }

      v13 = 1;
    }
    v6->_remoteDeviceClass = v13;
    -[TSProximitySourceTransferFlow _setupClient:](v6, "_setupClient:", v4);
    -[TSProximitySourceTransferFlow _assertNFC](v6, "_assertNFC");

  }
  return v6;
}

- (id)initForResumption
{
  TSProximitySourceTransferFlow *v2;
  TSProximitySourceTransferFlow *v3;
  id v4;
  uint64_t v5;
  CoreTelephonyClient *ctClient;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSProximitySourceTransferFlow;
  v2 = -[TSSIMSetupFlow init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isAuthenticationCompleted = 1;
    v2->_isFlowCompleted = 0;
    v2->_isRemotePeerClosed = 0;
    v4 = objc_alloc(MEMORY[0x24BDC2810]);
    v5 = objc_msgSend(v4, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    ctClient = v3->_ctClient;
    v3->_ctClient = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v3->_ctClient, "setDelegate:", v3);
    v3->_isResumingAfterPause = 1;
  }
  return v3;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  SSProximityDevice *btClient;
  SSProximityDevice *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[TSProximitySourceTransferFlow dealloc]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "invalidate SKSetupSIMTransferClient @%s", buf, 0xCu);
  }

  if (self->_isHiding)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[TSProximitySourceTransferFlow dealloc]";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "TSProximitySourceTransferFlow hidden @%s", buf, 0xCu);
    }

  }
  else
  {
    btClient = self->_btClient;
    if (btClient)
    {
      -[SSProximityDevice invalidate:](btClient, "invalidate:", 0);
      v6 = self->_btClient;
      self->_btClient = 0;

      -[TSProximitySourceTransferFlow _deassertNFC](self, "_deassertNFC");
    }
    else
    {
      -[CoreTelephonyClient invalidateProximityTransfer:force:completion:](self->_ctClient, "invalidateProximityTransfer:force:completion:", 1, 1, 0);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TSProximitySourceTransferFlow;
  -[TSProximitySourceTransferFlow dealloc](&v7, sel_dealloc);
}

- (id)firstViewController
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TSPRXSIMTransferringViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TSPRXSIMTransferringViewController *v17;
  unsigned int v18;
  NSObject *v19;
  BOOL v20;
  CoreTelephonyClient *ctClient;
  int v23;
  id v24;
  TSPRXDeviceUnlockViewController *v25;
  NSObject *v26;
  TSPRXDeviceUnlockViewController *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  int remoteDeviceClass;
  NSObject *v38;
  id v39;
  uint8_t buf[4];
  _BYTE v41[10];
  _WORD v42[9];

  *(_QWORD *)&v42[5] = *MEMORY[0x24BDAC8D0];
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[TSProximitySourceTransferFlow firstViewController].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
LABEL_4:

    return 0;
  }
  if (self->_isResumingAfterPause)
  {
    v12 = [TSPRXSIMTransferringViewController alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("PRXCARD_TRANSFERRING_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PRXCARD_TRANSFERRING_SUBTITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TSPRXSIMTransferringViewController initWithTitle:subtitle:otpDetectorNeeded:](v12, "initWithTitle:subtitle:otpDetectorNeeded:", v14, v16, 0);

    -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v17);
    return v17;
  }
  else
  {
    if (!self->_btClient)
    {
      _TSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[TSProximitySourceTransferFlow firstViewController].cold.2(v3, v28, v29, v30, v31, v32, v33, v34);
      goto LABEL_4;
    }
    v18 = MGGetSInt32Answer();
    if (v18 >= 0x10)
    {
      _TSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[TSProximitySourceTransferFlow firstViewController].cold.3(v18, v19);

      v18 = 0;
    }
    if (self->_remoteDeviceClass)
      v20 = v18 == 0;
    else
      v20 = 1;
    if (!v20 && v18 != self->_remoteDeviceClass)
    {
      _TSLogDomain();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        remoteDeviceClass = self->_remoteDeviceClass;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v41 = remoteDeviceClass;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = v18;
        v42[0] = 2080;
        *(_QWORD *)&v42[1] = "-[TSProximitySourceTransferFlow firstViewController]";
        _os_log_impl(&dword_21B647000, v35, OS_LOG_TYPE_DEFAULT, "device class mismatch. remote(%d), local(%d) @%s", buf, 0x18u);
      }

      return 0;
    }
    ctClient = self->_ctClient;
    v39 = 0;
    v23 = -[CoreTelephonyClient isAnyPlanTransferableFromThisDeviceOrError:](ctClient, "isAnyPlanTransferableFromThisDeviceOrError:", &v39);
    v24 = v39;
    v25 = 0;
    if (v23)
    {
      if (+[TSUtilities isDeviceLocked](TSUtilities, "isDeviceLocked"))
      {
        _TSLogDomain();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v41 = "-[TSProximitySourceTransferFlow firstViewController]";
          _os_log_impl(&dword_21B647000, v26, OS_LOG_TYPE_DEFAULT, "device locked. unlock first. @%s", buf, 0xCu);
        }

        v27 = objc_alloc_init(TSPRXDeviceUnlockViewController);
      }
      else
      {
        v27 = -[TSPRXStartViewController initWithBtDevice:]([TSPRXStartViewController alloc], "initWithBtDevice:", self->_btClient);
      }
      v25 = v27;
      -[TSPRXDeviceUnlockViewController setDelegate:](v27, "setDelegate:", self);
      -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v25);
      _TSLogDomain();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v41 = v25;
        *(_WORD *)&v41[8] = 2080;
        *(_QWORD *)v42 = "-[TSProximitySourceTransferFlow firstViewController]";
        _os_log_impl(&dword_21B647000, v38, OS_LOG_TYPE_DEFAULT, "first view controller: %@ @%s", buf, 0x16u);
      }

    }
    return v25;
  }
}

- (void)firstViewController:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void (**)(id, void *))a3;
  -[TSSIMSetupFlow delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_2551BF050);

  if (v6)
  {
    -[TSSIMSetupFlow delegate](self, "delegate");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__TSProximitySourceTransferFlow_firstViewController___block_invoke;
    v9[3] = &unk_24DEF29A8;
    v9[4] = self;
    -[NSObject setViewDisappearHandler:](v7, "setViewDisappearHandler:", v9);
  }
  else
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[TSProximitySourceTransferFlow firstViewController:].cold.1(v7);
  }

  -[TSProximitySourceTransferFlow firstViewController](self, "firstViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

}

uint64_t __53__TSProximitySourceTransferFlow_firstViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proxCardFlowDidDismiss");
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  PRXCardContentProviding *v5;
  TSPRXPasscodeEntryViewController *v7;
  TSPRXSIMTransferringViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PRXCardContentProviding *secureIntentProxCard;

  v4 = a3;
  if (self->_isRemotePeerClosed)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[TSPRXPasscodeEntryViewController initWithBtDevice:passcodeType:]([TSPRXPasscodeEntryViewController alloc], "initWithBtDevice:passcodeType:", self->_btClient, self->_passcodeType);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_2;
    secureIntentProxCard = self->_secureIntentProxCard;
    if (secureIntentProxCard)
    {
      v5 = secureIntentProxCard;
      goto LABEL_3;
    }
    if (!self->_isTransferCompleted)
      goto LABEL_2;
    -[TSProximitySourceTransferFlow _deassertNFC](self, "_deassertNFC");
    -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
    v7 = objc_alloc_init(TSPRXSIMTransferCompleteViewController);
LABEL_6:
    v5 = (PRXCardContentProviding *)v7;
    if (v7)
      goto LABEL_3;
    goto LABEL_2;
  }
  if (!self->_isAuthenticationCompleted)
    goto LABEL_2;
  v8 = [TSPRXSIMTransferringViewController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PRXCARD_TRANSFERRING_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PRXCARD_TRANSFERRING_SUBTITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TSPRXSIMTransferringViewController initWithTitle:subtitle:otpDetectorNeeded:](v8, "initWithTitle:subtitle:otpDetectorNeeded:", v10, v12, 1);

  if (!v5)
  {
LABEL_2:
    self->_isFlowCompleted = 1;
    -[TSProximitySourceTransferFlow _deassertNFC](self, "_deassertNFC");
    -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
    v5 = 0;
  }
LABEL_3:

  return v5;
}

- (void)didRequestPresentationForProxCard:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke;
  block[3] = &unk_24DEF2B00;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  char isKindOfClass;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (uint64_t *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *v6;
      v8 = objc_loadWeakRetained(v2);
      objc_msgSend(v8, "setSecureIntentProxCard:", v7);

      v12 = objc_loadWeakRetained(v2);
      objc_msgSend(v12, "topViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "viewControllerDidComplete:", v9);

    }
    else
    {
      _TSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_1((uint64_t)v6, v11);

    }
  }
  else
  {
    _TSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_2(v2, v10);

  }
}

- (void)didComplete
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__TSProximitySourceTransferFlow_didComplete__block_invoke;
  v2[3] = &unk_24DEF29F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __44__TSProximitySourceTransferFlow_didComplete__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "isRemotePeerClosed");

  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "_deassertNFC");

    v31 = objc_loadWeakRetained(v1);
    objc_msgSend(v31, "attemptFailed");

    return;
  }
  objc_msgSend(v4, "secureIntentProxCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_9;
  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "secureIntentProxCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isSecureIntentFailed") & 1) == 0)
  {

LABEL_9:
    v13 = objc_loadWeakRetained(v1);
    objc_msgSend(v13, "setSecureIntentProxCard:", 0);

    v14 = objc_loadWeakRetained(v1);
    objc_msgSend(v14, "topViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v9, "viewControllers");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v20);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = objc_loadWeakRetained(v1);
            objc_msgSend(v29, "setTopViewController:", v21);

            v30 = (id)objc_msgSend(v9, "popToViewController:animated:", v21, 1);
            goto LABEL_20;
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v18)
          continue;
        break;
      }
    }

    _TSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __44__TSProximitySourceTransferFlow_didComplete__block_invoke_cold_1(v16, v22, v23, v24, v25, v26, v27, v28);
LABEL_20:

    goto LABEL_21;
  }
  _TSLogDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[TSProximitySourceTransferFlow didComplete]_block_invoke";
    _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "secure intent failed, cancel the flow @%s", buf, 0xCu);
  }

  v11 = objc_loadWeakRetained(v1);
  objc_msgSend(v11, "_deassertNFC");

  v12 = objc_loadWeakRetained(v1);
  objc_msgSend(v12, "userDidTapCancel");

LABEL_21:
}

- (void)transferEventUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v4;
    v22 = 2080;
    v23 = "-[TSProximitySourceTransferFlow transferEventUpdate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", buf, 0x16u);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("kTransferConfirmation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      self->_isTransferCompleted = 1;
      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSProximitySourceTransferFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v9);

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("UpdateProxCardVisibility"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v10, "BOOLValue"))
      {
        _TSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[TSProximitySourceTransferFlow transferEventUpdate:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

      }
      else
      {
        self->_isHiding = 1;
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __53__TSProximitySourceTransferFlow_transferEventUpdate___block_invoke;
        v19[3] = &unk_24DEF29A8;
        v19[4] = self;
        -[TSProximitySourceTransferFlow _resetExtension:](self, "_resetExtension:", v19);
      }
    }
  }

}

uint64_t __53__TSProximitySourceTransferFlow_transferEventUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endFlowGracefully:", 2);
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  TSProximitySourceTransferFlow *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TSProximitySourceTransferFlow didComplete](self, "didComplete");
  }
  else
  {
    -[TSProximitySourceTransferFlow nextViewControllerFrom:](self, "nextViewControllerFrom:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSProximitySourceTransferFlow;
      -[TSSIMSetupFlow viewControllerDidComplete:](&v7, sel_viewControllerDidComplete_, v4);
    }
    else
    {
      _TSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[TSProximitySourceTransferFlow viewControllerDidComplete:]";
        _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "flow end, reset extension @%s", buf, 0xCu);
      }

      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __59__TSProximitySourceTransferFlow_viewControllerDidComplete___block_invoke;
      v8[3] = &unk_24DEF2A48;
      v9 = v4;
      v10 = self;
      -[TSProximitySourceTransferFlow _resetExtension:](self, "_resetExtension:", v8);

    }
  }

}

id __59__TSProximitySourceTransferFlow_viewControllerDidComplete___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TSProximitySourceTransferFlow;
  return objc_msgSendSuper2(&v3, sel_viewControllerDidComplete_, v1);
}

- (void)_setupClient:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSProximityDevice *v13;
  SSProximityDevice *v14;
  SSProximityDevice *btClient;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  if (self->_btClient)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[TSProximitySourceTransferFlow _setupClient:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    v13 = [SSProximityDevice alloc];
    v14 = -[SSProximityDevice initWithQueue:endpoint:remoteInfo:](v13, "initWithQueue:endpoint:remoteInfo:", MEMORY[0x24BDAC9B8], 1, v4);
    btClient = self->_btClient;
    self->_btClient = v14;

    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__TSProximitySourceTransferFlow__setupClient___block_invoke;
    v16[3] = &unk_24DEF3E18;
    objc_copyWeak(&v17, &location);
    -[SSProximityDevice setEventHandler:](self->_btClient, "setEventHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __46__TSProximitySourceTransferFlow__setupClient___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSKEvent:", v3);

}

- (void)_handleSKEvent:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  char isKindOfClass;
  NSObject *v19;
  char v20;
  NSObject *v21;
  int v22;
  _BYTE v23[10];
  const char *v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    *(_QWORD *)v23 = v4;
    *(_WORD *)&v23[8] = 2080;
    v24 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "receive SKEvent: %@ @%s", (uint8_t *)&v22, 0x16u);
  }

  v6 = objc_msgSend(v4, "eventType");
  if (v6 <= 40)
  {
    if (v6 != 20)
    {
      if (v6 == 40)
      {
        -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 1);
        -[TSProximitySourceTransferFlow _bootstrapTransfer](self, "_bootstrapTransfer");
      }
      goto LABEL_29;
    }
    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      goto LABEL_29;
    self->_isAuthenticationCompleted = 1;
    goto LABEL_19;
  }
  if (v6 == 41)
  {
    -[TSProximitySourceTransferFlow _deassertNFC](self, "_deassertNFC");
    -[TSSIMSetupFlow setIdleTimerDisabled:](self, "setIdleTimerDisabled:", 0);
    _TSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      *(_QWORD *)v23 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
      _os_log_impl(&dword_21B647000, v16, OS_LOG_TYPE_DEFAULT, "connection closed from remote peer @%s", (uint8_t *)&v22, 0xCu);
    }

    self->_isRemotePeerClosed = 1;
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_19:
      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[TSProximitySourceTransferFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v7);
LABEL_28:

    }
  }
  else
  {
    if (v6 != 120)
      goto LABEL_29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v4;
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = objc_msgSend(v7, "pairingFlags");
        v10 = objc_msgSend(v7, "passwordType");
        v11 = objc_msgSend(v7, "throttleSeconds");
        v22 = 67109890;
        *(_DWORD *)v23 = v9;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v10;
        LOWORD(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 2) = v11;
        HIWORD(v24) = 2080;
        v25 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
        _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "flag:%d, type:%d, throttle:%d @%s", (uint8_t *)&v22, 0x1Eu);
      }

      self->_passcodeType = objc_msgSend(v7, "passwordType");
      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 & 1) != 0)
      {
        -[TSProximitySourceTransferFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v14);
      }
      else
      {
        objc_opt_class();
        v20 = objc_opt_isKindOfClass();

        if ((v20 & 1) == 0)
          goto LABEL_28;
        _TSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 136315138;
          *(_QWORD *)v23 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
          _os_log_impl(&dword_21B647000, v21, OS_LOG_TYPE_DEFAULT, "the PIN code is wrong, retry @%s", (uint8_t *)&v22, 0xCu);
        }

        -[TSSIMSetupFlow topViewController](self, "topViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "retry");
      }

      goto LABEL_28;
    }
    _TSLogDomain();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[TSProximitySourceTransferFlow _handleSKEvent:].cold.1(v4, v19);

  }
LABEL_29:

}

- (void)_bootstrapTransfer
{
  TSCellularPlanProximityTransferController *v3;
  TSCellularPlanProximityTransferController *proxTransferController;
  void *v5;
  CoreTelephonyClient *ctClient;
  _QWORD v7[5];
  id v8;
  id location;

  if (!self->_proxTransferController)
  {
    v3 = -[TSCellularPlanProximityTransferController initWithESIMDelegate:]([TSCellularPlanProximityTransferController alloc], "initWithESIMDelegate:", self);
    proxTransferController = self->_proxTransferController;
    self->_proxTransferController = v3;

  }
  -[SSProximityDevice templateSession](self->_btClient, "templateSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  ctClient = self->_ctClient;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke;
  v7[3] = &unk_24DEF3E40;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  -[CoreTelephonyClient bootstrapPlanTransferForEndpoint:usingMessageSession:completion:](ctClient, "bootstrapPlanTransferForEndpoint:usingMessageSession:completion:", 1, v5, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_cold_1();

    +[TSUtilities getErrorTitleDetail:forCarrier:](TSUtilities, "getErrorTitleDetail:forCarrier:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ErrorHeader"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ErrorDetail"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_105;
    v20[3] = &unk_24DEF2A20;
    v14 = (id *)(a1 + 40);
    objc_copyWeak(&v21, v14);
    objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15);

    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_2;
    block[3] = &unk_24DEF2B00;
    objc_copyWeak(&v19, v14);
    v18 = v9;
    v16 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

  }
}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_105(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "btClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate:", 1);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setBtClient:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "_deassertNFC");

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "userDidTapCancel");

}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);

}

- (void)_resetExtension:(id)a3
{
  void (**v4)(_QWORD);
  CoreTelephonyClient *ctClient;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    ctClient = self->_ctClient;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __49__TSProximitySourceTransferFlow__resetExtension___block_invoke;
    v14[3] = &unk_24DEF3000;
    v15 = v4;
    -[CoreTelephonyClient resetProximityTransportExtension:](ctClient, "resetProximityTransportExtension:", v14);

  }
  else
  {
    _TSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TSProximitySourceTransferFlow _resetExtension:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v4[2](v4);
  }

}

void __49__TSProximitySourceTransferFlow__resetExtension___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__TSProximitySourceTransferFlow__resetExtension___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_proxCardFlowDidDismiss
{
  void *v3;
  char isKindOfClass;
  NSObject *v5;
  _BOOL4 isFlowCompleted;
  _BOOL4 isAuthenticationCompleted;
  NSObject *v8;
  int v9;
  _BYTE v10[10];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      isFlowCompleted = self->_isFlowCompleted;
      isAuthenticationCompleted = self->_isAuthenticationCompleted;
      v9 = 67109634;
      *(_DWORD *)v10 = isFlowCompleted;
      *(_WORD *)&v10[4] = 1024;
      *(_DWORD *)&v10[6] = isAuthenticationCompleted;
      v11 = 2080;
      v12 = "-[TSProximitySourceTransferFlow _proxCardFlowDidDismiss]";
      _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "flow dismiss. flow.complete:%d, auth.complete:%d @%s", (uint8_t *)&v9, 0x18u);
    }

    if (!self->_isFlowCompleted)
    {
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        *(_QWORD *)v10 = "-[TSProximitySourceTransferFlow _proxCardFlowDidDismiss]";
        _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "prox card being dismissed @%s", (uint8_t *)&v9, 0xCu);
      }

      -[TSSIMSetupFlow attemptFailed](self, "attemptFailed");
      -[TSProximitySourceTransferFlow _deassertNFC](self, "_deassertNFC");
    }
  }
}

- (void)_assertNFC
{
  SSNFCAssertion *v3;
  SSNFCAssertion *nfcAssertion;

  if (!self->_nfcAssertion)
  {
    v3 = objc_alloc_init(SSNFCAssertion);
    nfcAssertion = self->_nfcAssertion;
    self->_nfcAssertion = v3;

  }
}

- (void)_deassertNFC
{
  SSNFCAssertion *nfcAssertion;

  nfcAssertion = self->_nfcAssertion;
  self->_nfcAssertion = 0;

}

- (SSProximityDevice)btClient
{
  return (SSProximityDevice *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBtClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCtClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isAuthenticationCompleted
{
  return self->_isAuthenticationCompleted;
}

- (void)setIsAuthenticationCompleted:(BOOL)a3
{
  self->_isAuthenticationCompleted = a3;
}

- (BOOL)isFlowCompleted
{
  return self->_isFlowCompleted;
}

- (void)setIsFlowCompleted:(BOOL)a3
{
  self->_isFlowCompleted = a3;
}

- (BOOL)isRemotePeerClosed
{
  return self->_isRemotePeerClosed;
}

- (void)setIsRemotePeerClosed:(BOOL)a3
{
  self->_isRemotePeerClosed = a3;
}

- (BOOL)isTransferCompleted
{
  return self->_isTransferCompleted;
}

- (void)setIsTransferCompleted:(BOOL)a3
{
  self->_isTransferCompleted = a3;
}

- (BOOL)isHiding
{
  return self->_isHiding;
}

- (void)setIsHiding:(BOOL)a3
{
  self->_isHiding = a3;
}

- (BOOL)isResumingAfterPause
{
  return self->_isResumingAfterPause;
}

- (void)setIsResumingAfterPause:(BOOL)a3
{
  self->_isResumingAfterPause = a3;
}

- (int)passcodeType
{
  return self->_passcodeType;
}

- (void)setPasscodeType:(int)a3
{
  self->_passcodeType = a3;
}

- (TSCellularPlanProximityTransferController)proxTransferController
{
  return (TSCellularPlanProximityTransferController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setProxTransferController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PRXCardContentProviding)secureIntentProxCard
{
  return (PRXCardContentProviding *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSecureIntentProxCard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (unsigned)remoteDeviceClass
{
  return self->_remoteDeviceClass;
}

- (void)setRemoteDeviceClass:(unsigned __int8)a3
{
  self->_remoteDeviceClass = a3;
}

- (SSNFCAssertion)nfcAssertion
{
  return (SSNFCAssertion *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNfcAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcAssertion, 0);
  objc_storeStrong((id *)&self->_secureIntentProxCard, 0);
  objc_storeStrong((id *)&self->_proxTransferController, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_btClient, 0);
}

- (void)initWithPeerDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSProximitySourceTransferFlow initWithPeerDevice:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]invalid cb device : %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)firstViewController
{
  _DWORD v2[2];
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = a1;
  v3 = 2080;
  v4 = "-[TSProximitySourceTransferFlow firstViewController]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]invalid device class read from mobile gestalt : %d @%s", (uint8_t *)v2, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)firstViewController:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  void *v2;
  __int16 v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 138412546;
  v2 = &unk_2551BF050;
  v3 = 2080;
  v4 = "-[TSProximitySourceTransferFlow firstViewController:]";
  _os_log_fault_impl(&dword_21B647000, log, OS_LOG_TYPE_FAULT, "[F]delegate not conforms to protocol : %@ @%s", (uint8_t *)&v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[14];
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  v5 = "-[TSProximitySourceTransferFlow didRequestPresentationForProxCard:]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, v3, "[E]invalid secure intent prox card:%@ @%s", v4);
}

void __67__TSProximitySourceTransferFlow_didRequestPresentationForProxCard___block_invoke_cold_2(id *a1, NSObject *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  v7 = "-[TSProximitySourceTransferFlow didRequestPresentationForProxCard:]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, v5, "[E]invalid current view controller:%@ @%s", v6);

}

void __44__TSProximitySourceTransferFlow_didComplete__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]missing TSPRXSIMTransferringViewController on view stack @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)transferEventUpdate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Unexpected transferEventUpdate for resuming prox card @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_setupClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]already activate @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleSKEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v4[2];
  __int16 v5;
  void *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109634;
  v4[1] = objc_msgSend(a1, "eventType");
  v5 = 2112;
  v6 = a1;
  v7 = 2080;
  v8 = "-[TSProximitySourceTransferFlow _handleSKEvent:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]invalid SKEvent class for event : %d : %@ @%s", (uint8_t *)v4, 0x1Cu);
}

void __51__TSProximitySourceTransferFlow__bootstrapTransfer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSProximitySourceTransferFlow _bootstrapTransfer]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]bootstrap plan transfer failed : %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_resetExtension:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]missing @selector(resetProximityTransportExtension:) @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __49__TSProximitySourceTransferFlow__resetExtension___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = "-[TSProximitySourceTransferFlow _resetExtension:]_block_invoke";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, v0, v1, "[E]resetCBExtension failed : %@ @%s", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
