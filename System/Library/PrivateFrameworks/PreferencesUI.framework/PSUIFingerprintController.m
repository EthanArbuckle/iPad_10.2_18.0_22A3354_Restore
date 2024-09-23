@implementation PSUIFingerprintController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PSUIDeviceTakeOverController *v8;
  PSUIDeviceTakeOverController *dtoController;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSUIFingerprintController;
  -[PSUIFingerprintController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE63740];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__PSUIFingerprintController_viewWillAppear___block_invoke;
  v10[3] = &unk_24F9E41B8;
  v10[4] = self;
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIFingerprintController setEffectiveSettingsChangedNotificationObserver:](self, "setEffectiveSettingsChangedNotificationObserver:", v7);

  v8 = (PSUIDeviceTakeOverController *)objc_opt_new();
  dtoController = self->_dtoController;
  self->_dtoController = v8;

}

void __44__PSUIFingerprintController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  v5 = *(void **)(a1 + 32);
  if (v3 == v4)
  {
    objc_msgSend(v5, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
  else
  {
    objc_msgSend(v5, "reloadSpecifiers");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIFingerprintController;
  -[PSUIFingerprintController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIFingerprintController effectiveSettingsChangedNotificationObserver](self, "effectiveSettingsChangedNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", v5);

  -[PSUIFingerprintController setEffectiveSettingsChangedNotificationObserver:](self, "setEffectiveSettingsChangedNotificationObserver:", 0);
}

- (id)representedBiometricIdentity
{
  void *v2;
  void *v3;

  -[PSUIFingerprintController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("FingerprintIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)presentAlertIfNeededBeforeDeletingFingerPrint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIFingerprintController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("BIOMETRIC_TEMPLATE_BINDING"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("FingerprintIdentity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "GovernmentID binding status for biometric: %@ is %@", (uint8_t *)&v12, 0x16u);

  }
  if (v6)
  {
    if (objc_msgSend(v6, "BOOLValue"))
    {
      -[PSUIFingerprintController presentAlertSheetForFingerprintBindingToGovernmentID:](self, "presentAlertSheetForFingerprintBindingToGovernmentID:", v4);
    }
    else
    {
      PSUILogForCategory(1uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_22E0C8000, v11, OS_LOG_TYPE_DEFAULT, "Biometic is not bound to government ID, delete fingerprint directly", (uint8_t *)&v12, 2u);
      }

      -[PSUIFingerprintController deleteFingerprint:](self, "deleteFingerprint:", v4);
    }
  }
  else
  {
    PSUILogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "propertyForKey:", CFSTR("FingerprintIdentity"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_DEFAULT, "Have not determined biometric binding identity for biometric: %@", (uint8_t *)&v12, 0xCu);

    }
    -[PSListController configureSpin:ofCellForSpecifier:setEnabled:](self, "configureSpin:ofCellForSpecifier:setEnabled:", 1, v4, 0);
    -[PSUIFingerprintController fetchBiometricTemplateForCurrentBiometricIdentity:](self, "fetchBiometricTemplateForCurrentBiometricIdentity:", v4);
  }

}

- (void)fetchBiometricTemplateForCurrentBiometricIdentity:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PSUIFingerprintController *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(MEMORY[0x24BE1BDF0]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke;
  v7[3] = &unk_24F9E4208;
  objc_copyWeak(&v10, &location);
  v6 = v4;
  v8 = v6;
  v9 = self;
  objc_msgSend(v5, "globalAuthACLTemplateUUIDsWithCompletion:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2;
  block[3] = &unk_24F9E41E0;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 40);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v14);
}

void __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = *(_QWORD *)(a1 + 32);
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1(a1 + 32, v7, v8, v9, v10, v11, v12, v13);

      objc_msgSend(v4, "fetchBiometricTemplateForCurrentBiometricIdentity:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v31 = v14;
        _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Fetched biometric template UUIDs: %@", buf, 0xCu);
      }

      if (objc_msgSend(*(id *)(a1 + 48), "count") && *(_QWORD *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 56), "representedBiometricIdentity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v16 = *(id *)(a1 + 48);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v27 != v18)
                objc_enumerationMutation(v16);
              v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_msgSend(v15, "uuid", (_QWORD)v26);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "isEqual:", v21);

              if (v22)
              {
                PSUILogForCategory(1uLL);
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v31 = v20;
                  v32 = 2112;
                  v33 = v15;
                  _os_log_impl(&dword_22E0C8000, v23, OS_LOG_TYPE_DEFAULT, "UUID: %@ matched with biometric identity: %@", buf, 0x16u);
                }

                v17 = 1;
                goto LABEL_23;
              }
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v17)
              continue;
            break;
          }
        }
LABEL_23:

        objc_msgSend(v4, "specifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setProperty:forKey:", v25, CFSTR("BIOMETRIC_TEMPLATE_BINDING"));

      }
      else
      {
        objc_msgSend(v4, "specifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C0], CFSTR("BIOMETRIC_TEMPLATE_BINDING"));
      }

      objc_msgSend(v4, "configureSpin:ofCellForSpecifier:setEnabled:", 0, *(_QWORD *)(a1 + 40), 1);
      objc_msgSend(v4, "presentAlertIfNeededBeforeDeletingFingerPrint:", *(_QWORD *)(a1 + 40));
    }

  }
}

- (void)presentAlertSheetForFingerprintBindingToGovernmentID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  PSUIFingerprintController *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[16];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Presenting first alert for government binding biometrics", buf, 2u);
  }

  v6 = (void *)MEMORY[0x24BEBD3B0];
  PSLocalizableMesaStringForKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizableMesaStringForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUIBiometrics identities](PSUIBiometrics, "identities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = MEMORY[0x24BDAC760];
  if (v11 >= 2)
  {
    v13 = (void *)MEMORY[0x24BEBD3A8];
    PSLocalizableMesaStringForKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    v29[1] = 3221225472;
    v29[2] = __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke;
    v29[3] = &unk_24F9E3B08;
    v29[4] = self;
    v30 = v4;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v15);

  }
  v16 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  v24 = 3221225472;
  v25 = __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke_251;
  v26 = &unk_24F9E3B08;
  v27 = self;
  v28 = v4;
  v18 = v4;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 2, &v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v19, v23, v24, v25, v26, v27);

  v20 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v22);

  -[PSUIFingerprintController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Proceed replacing biobinding identity", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "replaceFingerprint:", *(_QWORD *)(a1 + 40));
}

uint64_t __82__PSUIFingerprintController_presentAlertSheetForFingerprintBindingToGovernmentID___block_invoke_251(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Continue presenting second alert for deleting biometric identity", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "presentPopUpAlertForFingerprintBindingToGovernmentID:", *(_QWORD *)(a1 + 40));
}

- (void)presentPopUpAlertForFingerprintBindingToGovernmentID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  PSUIFingerprintController *v21;
  id v22;
  uint8_t buf[16];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Presenting second alert for government binding biometrics", buf, 2u);
  }

  v6 = (void *)MEMORY[0x24BEBD3B0];
  PSLocalizableMesaStringForKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizableMesaStringForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizableMesaStringForKey();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __82__PSUIFingerprintController_presentPopUpAlertForFingerprintBindingToGovernmentID___block_invoke;
  v20 = &unk_24F9E3B08;
  v21 = self;
  v22 = v4;
  v15 = v4;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 2, &v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v16, v17, v18, v19, v20, v21);

  -[PSUIFingerprintController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __82__PSUIFingerprintController_presentPopUpAlertForFingerprintBindingToGovernmentID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Proceed to delete government binding fingerprint", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSBiometricBindingDeleted"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "deleteFingerprint:", *(_QWORD *)(a1 + 40));
}

- (void)replaceFingerprint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id buf[2];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Showing biometric replacement UI", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = objc_alloc_init(MEMORY[0x24BE1DEF8]);
  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke;
  v10[3] = &unk_24F9E4250;
  objc_copyWeak(&v11, buf);
  v10[4] = self;
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke_264;
  v8[3] = &unk_24F9E42A0;
  objc_copyWeak(&v9, buf);
  v8[4] = self;
  objc_msgSend(v6, "beginBiometricReplacementWithAuthenticationHandler:andCompletion:", v10, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(buf);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2;
  block[3] = &unk_24F9E3A90;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a1[4])
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, WeakRetained, sel_cancelModalFlow);
    objc_msgSend(a1[4], "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLeftBarButtonItem:", v3);

    objc_msgSend(a1[4], "setModalPresentationStyle:", 2);
    objc_msgSend(MEMORY[0x24BE6E3E0], "preferredContentSize");
    objc_msgSend(a1[4], "setPreferredContentSize:");
    objc_msgSend(a1[5], "presentViewController:animated:completion:", a1[4], 1, &__block_literal_global_3);

  }
  else
  {
    PSUILogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Did not show biometric replacement UI", v6, 2u);
    }

  }
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_262()
{
  NSObject *v0;
  uint8_t v1[16];

  PSUILogForCategory(1uLL);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22E0C8000, v0, OS_LOG_TYPE_DEFAULT, "Has shown biometric replacement UI in modal sheet", v1, 2u);
  }

}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_264(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_265;
  v10[3] = &unk_24F9E4278;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v14);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_265(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(_QWORD *)(a1 + 32))
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_265_cold_1(a1 + 32, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "representedBiometricIdentity");
    v3 = objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = *(id *)(a1 + 48);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          -[NSObject uuid](v3, "uuid", (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v17, "isEqual:", v16);

          v13 |= v16;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    PSUILogForCategory(1uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      v29 = 1024;
      v30 = v13 & 1;
      _os_log_impl(&dword_22E0C8000, v18, OS_LOG_TYPE_DEFAULT, "Replaced biometric identity with new UUIDs: %@, current identity binding status: %d", buf, 0x12u);
    }

    objc_msgSend(WeakRetained, "specifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13 & 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProperty:forKey:", v21, CFSTR("BIOMETRIC_TEMPLATE_BINDING"));

    objc_msgSend(*(id *)(a1 + 40), "parentController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateWithReplacedUUIDs:", *(_QWORD *)(a1 + 48));

  }
}

- (void)deleteFingerprint:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id buf[2];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Touch ID: User pressed Delete Fingerprint", (uint8_t *)buf, 2u);
  }

  -[PSUIFingerprintController dtoController](self, "dtoController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRatchetEnabled");

  if (v7)
  {
    objc_initWeak(buf, self);
    -[PSUIFingerprintController dtoController](self, "dtoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__PSUIFingerprintController_deleteFingerprint___block_invoke;
    v9[3] = &unk_24F9E3F70;
    objc_copyWeak(&v11, buf);
    v10 = v4;
    objc_msgSend(v8, "gateWithRatchetForOperation:forPresentingVC:completion:", 4, self, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    -[PSUIFingerprintController proceedWithDeleteFingerprintFor:](self, "proceedWithDeleteFingerprintFor:", v4);
  }

}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2 == 2)
  {
    PSUILogForCategory(1uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __47__PSUIFingerprintController_deleteFingerprint___block_invoke_cold_1();

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__PSUIFingerprintController_deleteFingerprint___block_invoke_266;
    v4[3] = &unk_24F9E3E90;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke_266(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Touch ID: Starting deletion of fingerprint", v5, 2u);
    }

    objc_msgSend(WeakRetained, "proceedWithDeleteFingerprintFor:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__PSUIFingerprintController_deleteFingerprint___block_invoke_266_cold_1();

  }
}

- (void)proceedWithDeleteFingerprintFor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  -[PSUIFingerprintController parentController](self, "parentController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIFingerprintController representedBiometricIdentity](self, "representedBiometricIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__PSUIFingerprintController_proceedWithDeleteFingerprintFor___block_invoke;
  v10[3] = &unk_24F9E42C8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "removeIdentity:completion:", v6, v10);

  -[PSUIFingerprintController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

uint64_t __61__PSUIFingerprintController_proceedWithDeleteFingerprintFor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)fingerprintName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[PSUIFingerprintController representedBiometricIdentity](self, "representedBiometricIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_24F9E4F80;
  v5 = v3;

  return v5;
}

- (void)setFingerprintName:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIFingerprintController representedBiometricIdentity](self, "representedBiometricIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:forIdentity:completion:", v6, v5, &__block_literal_global_267);

  }
}

void __48__PSUIFingerprintController_setFingerprintName___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_268);
}

void __48__PSUIFingerprintController_setFingerprintName___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PSEnrollmentNameChanged"), 0);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[PSUIFingerprintController setTitle:](self, "setTitle:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setFingerprintName_, sel_fingerprintName, 0, 8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A08]);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFingerprintModificationAllowed");

    if ((v9 & 1) == 0)
      objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(v5, "addObject:", v7);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFingerprintModificationAllowed");

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      v13 = (void *)MEMORY[0x24BE75590];
      PSLocalizableMesaStringForKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteButtonSpecifierWithName:target:action:", v14, self, sel_presentAlertIfNeededBeforeDeletingFingerPrint_);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setIdentifier:", CFSTR("DELETE_FINGERPRINT"));
      objc_msgSend(v5, "addObject:", v15);

    }
    v16 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSUIFingerprintController;
  -[PSUIFingerprintController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 8)
  {
    objc_msgSend(v5, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutocapitalizationType:", 2);
    objc_msgSend(v6, "setAutocorrectionType:", 1);
    objc_msgSend(v6, "setAutoresizesTextToFit:", 1);
    objc_msgSend(v6, "setReturnKeyType:", 9);
    objc_msgSend(v6, "setClearButtonMode:", 1);
    -[PSUIFingerprintController fingerprintName](self, "fingerprintName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaceholder:", v7);

    objc_msgSend(v5, "setControllerDelegate:", self);
  }
  return v5;
}

- (id)passcodeController
{
  return objc_alloc_init(PSTouchIDPINController);
}

- (id)effectiveSettingsChangedNotificationObserver
{
  return self->_effectiveSettingsChangedNotificationObserver;
}

- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, a3);
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
  objc_storeStrong((id *)&self->_dtoController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, 0);
}

void __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Failed fetching biometric template UUIDs with error: %@", a5, a6, a7, a8, 2u);
}

void __48__PSUIFingerprintController_replaceFingerprint___block_invoke_2_265_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Error replacing biometric identity: %@", a5, a6, a7, a8, 2u);
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Touch ID: Not deleting fingerprint as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__PSUIFingerprintController_deleteFingerprint___block_invoke_266_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Touch ID: Not deleting fingerprint as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
