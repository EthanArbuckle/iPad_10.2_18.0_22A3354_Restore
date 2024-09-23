@implementation TSPRXSIMTransferringViewController

- (TSPRXSIMTransferringViewController)initWithTitle:(id)a3 subtitle:(id)a4 otpDetectorNeeded:(BOOL)a5
{
  _BOOL4 v5;
  TSPRXSIMTransferringViewController *v6;
  TSPRXSIMTransferringViewController *v7;
  TSPRXSIMTransferringViewController *v8;
  objc_super v10;

  v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)TSPRXSIMTransferringViewController;
  v6 = -[TSIDSSimTransferringViewController initWithTitle:subtitle:](&v10, sel_initWithTitle_subtitle_, a3, a4);
  v7 = v6;
  if (v6)
  {
    if (v5)
      -[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck](v6, "_maybeEnableOneTimeCodeCheck");
    v8 = v7;
  }

  return v7;
}

- (void)_maybeEnableOneTimeCodeCheck
{
  id v3;
  CoreTelephonyClient *v4;
  CoreTelephonyClient *client;
  CoreTelephonyClient *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc(MEMORY[0x24BDC2810]);
  v4 = (CoreTelephonyClient *)objc_msgSend(v3, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  client = self->_client;
  self->_client = v4;

  objc_initWeak(&location, self);
  v6 = self->_client;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke;
  v7[3] = &unk_24DEF35F8;
  objc_copyWeak(&v8, &location);
  -[CoreTelephonyClient getSubscriptionInfo:](v6, "getSubscriptionInfo:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      _TSLogDomain();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_2((uint64_t)v6, obj);
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "subscriptions");
      obj = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
            v25[0] = CFSTR("PhoneAccountTransfer");
            v25[1] = CFSTR("OneTimeCodeForTransfer");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "client");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "copyCarrierBundleValue:keyHierarchy:bundleType:error:", v12, v14, v13, 0);

            if (v16)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (objc_msgSend(v16, "BOOLValue"))
                {
                  _TSLogDomain();
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v24 = "-[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck]_block_invoke";
                    _os_log_impl(&dword_21B647000, v17, OS_LOG_TYPE_DEFAULT, "start monitor OTP @%s", buf, 0xCu);
                  }

                  objc_msgSend(WeakRetained, "_setupOneTimeCodeDetection");
                  goto LABEL_21;
                }
              }
            }

          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
          if (v9)
            continue;
          break;
        }
LABEL_21:
        v6 = 0;
      }
    }
  }
  else
  {
    _TSLogDomain();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_1(obj);
  }

}

- (void)_setupOneTimeCodeDetection
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  IMOneTimeCodeAccelerator *v7;
  IMOneTimeCodeAccelerator *oneTimeCodeAccelerator;
  _QWORD v9[5];
  id v10;
  id location;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_initWeak(&location, self);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v3 = (void *)getIMOneTimeCodeAcceleratorClass_softClass;
  v16 = getIMOneTimeCodeAcceleratorClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getIMOneTimeCodeAcceleratorClass_softClass)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __getIMOneTimeCodeAcceleratorClass_block_invoke;
    v12[3] = &unk_24DEF2BA0;
    v12[4] = &v13;
    __getIMOneTimeCodeAcceleratorClass_block_invoke((uint64_t)v12);
    v3 = (void *)v14[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v13, 8);
  v6 = [v5 alloc];
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke;
  v9[3] = &unk_24DEF3620;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  v7 = (IMOneTimeCodeAccelerator *)objc_msgSend(v6, "initWithBlockForUpdates:", v9);
  oneTimeCodeAccelerator = self->_oneTimeCodeAccelerator;
  self->_oneTimeCodeAccelerator = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;
  _BYTE buf[24];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[TSPRXSIMTransferringViewController _setupOneTimeCodeDetection]_block_invoke";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "detect codes: %@ @%s", buf, 0x16u);
  }

  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v6 = (id *)getIMOneTimeCodeKeySymbolLoc_ptr;
  v15 = getIMOneTimeCodeKeySymbolLoc_ptr;
  if (!getIMOneTimeCodeKeySymbolLoc_ptr)
  {
    v7 = (void *)IMCoreLibrary();
    v6 = (id *)dlsym(v7, "IMOneTimeCodeKey");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v6;
    getIMOneTimeCodeKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(buf, 8);
  if (!v6)
  {
    __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_cold_1();
    __break(1u);
  }
  v8 = *v6;
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _TSLogDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[TSPRXSIMTransferringViewController _setupOneTimeCodeDetection]_block_invoke";
    _os_log_impl(&dword_21B647000, v10, OS_LOG_TYPE_DEFAULT, "OTP : %@ @%s", buf, 0x16u);
  }

  if (v9 && objc_msgSend(v9, "length"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_39;
    block[3] = &unk_24DEF2E28;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    block[4] = *(_QWORD *)(a1 + 32);
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v13);
  }

}

void __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_39(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PRXCARD_ONE_TIME_CODE_%@"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "placeHolderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "placeHolderLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBoldSubString:", *(_QWORD *)(a1 + 40));

  v11 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v11, "placeHolderLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 0);

}

- (IMOneTimeCodeAccelerator)oneTimeCodeAccelerator
{
  return (IMOneTimeCodeAccelerator *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setOneTimeCodeAccelerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1104);
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (BOOL)otpDetectorNeeded
{
  return self->_otpDetectorNeeded;
}

- (void)setOtpDetectorNeeded:(BOOL)a3
{
  self->_otpDetectorNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeAccelerator, 0);
}

void __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck]_block_invoke";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]Self doesnt exist @%s", (uint8_t *)&v1, 0xCu);
}

void __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck]_block_invoke";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]get subscription failed : %@ @%s", (uint8_t *)&v2, 0x16u);
}

uint64_t __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_1(v0);
}

@end
