@implementation PSUIPearlAttentionGroupController

- (PSUIPearlAttentionGroupController)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6;
  id v7;
  PSUIPearlAttentionGroupController *v8;
  PSUIPearlAttentionGroupController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PSUIPearlAttentionGroupController;
  v8 = -[PSUIPearlAttentionGroupController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeWeak((id *)&v9->_groupSpecifier, v7);
  }

  return v9;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v27;
  _QWORD block[4];
  id v29;
  id v30;
  id buf[2];

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BE75590];
  PSLocalizablePearlStringForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PSUIPearlAttentionGroupController useAlternateFooterTextForAttention](self, "useAlternateFooterTextForAttention"))
  {
    PSUI_LocalizedStringForPearlPeriocular(CFSTR("PEARL_ATTENTION_FOOTER_WITH_PERIOCULAR"));
  }
  else
  {
    PSLocalizablePearlStringForKey();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE75A68];
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A68]);

  v27 = v6;
  objc_msgSend(v3, "addObject:", v6);
  v9 = (void *)MEMORY[0x24BE75590];
  PSLocalizablePearlStringForKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, sel_setPearlUnlock_specifier_, sel_pearlUnlock_, 0, 6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BE75B50];
  objc_msgSend(v11, "setProperty:forKey:", CFSTR("PearlUnlockAttention"), *MEMORY[0x24BE75B50]);
  v13 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v11, "setProperty:forKey:", CFSTR("PearlUnlockAttention"), *MEMORY[0x24BE75AC0]);
  v14 = *MEMORY[0x24BE75868];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v3, "addObject:", v11);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizablePearlStringForKey();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v16, v8);

  objc_msgSend(v3, "addObject:", v15);
  v17 = (void *)MEMORY[0x24BE75590];
  PSLocalizablePearlStringForKey();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, sel_setAttentionAware_specifier_, sel_attentionAware_, 0, 6, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setProperty:forKey:", CFSTR("AttentionAware"), v12);
  objc_msgSend(v19, "setProperty:forKey:", CFSTR("AttentionAware"), v13);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v14);
  -[PSUIPearlAttentionGroupController attentionAware:](self, "attentionAware:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BE75A18];
  if (v20)
  {
    objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v21);
    PSUILogForCategory(1uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22E0C8000, v22, OS_LOG_TYPE_DEFAULT, "AttentionAwareFeatures [Disabled]", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    dispatch_get_global_queue(25, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__PSUIPearlAttentionGroupController_specifiers__block_invoke;
    block[3] = &unk_24F9E3E90;
    objc_copyWeak(&v30, buf);
    v29 = v19;
    dispatch_async(v23, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(buf);
  }
  else
  {
    objc_msgSend(v19, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v21);
    PSUILogForCategory(1uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22E0C8000, v24, OS_LOG_TYPE_DEFAULT, "AttentionAwareFeatures [Enabled]", (uint8_t *)buf, 2u);
    }

  }
  objc_msgSend(v3, "addObject:", v19);
  v25 = (void *)objc_msgSend(v3, "copy");

  return v25;
}

void __47__PSUIPearlAttentionGroupController_specifiers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE buf[24];
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v2 = (void *)getEREyeReliefClientClass_softClass;
  v19 = getEREyeReliefClientClass_softClass;
  if (!getEREyeReliefClientClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getEREyeReliefClientClass_block_invoke;
    v21 = &unk_24F9E3C20;
    v22 = &v16;
    __getEREyeReliefClientClass_block_invoke((uint64_t)buf);
    v2 = (void *)v17[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v16, 8);
  v4 = (void *)objc_opt_new();
  v15 = 0;
  v5 = objc_msgSend(v4, "isDistanceSamplingEnabledWithError:", &v15);
  v6 = (__CFString *)v15;
  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &stru_24F9E4F80;
    if (v6)
      v10 = v6;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Screen Distance Enablement [%@]%@", buf, 0x16u);

  }
  if ((v5 & 1) == 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __47__PSUIPearlAttentionGroupController_specifiers__block_invoke_27;
    v11[3] = &unk_24F9E3A18;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    v12 = *(id *)(a1 + 32);
    v14 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

    objc_destroyWeak(&v13);
  }

}

void __47__PSUIPearlAttentionGroupController_specifiers__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_BYTE *)(a1 + 48) == 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75A18]);

    objc_msgSend(WeakRetained, "listController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v7 = CFSTR("disabled");
      else
        v7 = CFSTR("enabled");
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_22E0C8000, v6, OS_LOG_TYPE_DEFAULT, "AttentionAwareFeatures [%@]", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (id)_pearlDevice
{
  BKDevicePearl **p_pearlDevice;
  BKDevicePearl *v3;
  BKDevicePearl *pearlDevice;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  char isKindOfClass;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v27;
  id *location;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  pearlDevice = self->_pearlDevice;
  p_pearlDevice = &self->_pearlDevice;
  v3 = pearlDevice;
  if (pearlDevice)
    return v3;
  location = (id *)p_pearlDevice;
  objc_msgSend(MEMORY[0x24BE0CE28], "availableDevices");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        v29 = 0;
        objc_msgSend(MEMORY[0x24BE0CE08], "deviceWithDescriptor:error:", v11, &v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v29;
        if (v13)
        {
          PSUILogForCategory(1uLL);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_error_impl(&dword_22E0C8000, v14, OS_LOG_TYPE_ERROR, "Could not get device: %@", buf, 0xCu);
          }

        }
        objc_msgSend(v12, "descriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "type") == 2)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_storeStrong(location, v12);
            PSUILogForCategory(1uLL);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v27 = *location;
              *(_DWORD *)buf = 138412290;
              v35 = v27;
              _os_log_impl(&dword_22E0C8000, v25, OS_LOG_TYPE_DEFAULT, "Got device: %@", buf, 0xCu);
            }

            v24 = *location;
            v17 = v6;
            goto LABEL_24;
          }
        }
        else
        {

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v8)
        continue;
      break;
    }
  }

  PSUILogForCategory(1uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[PSUIPearlAttentionGroupController _pearlDevice].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
  v24 = 0;
LABEL_24:

  return v24;
}

- (void)setProtectedCredentialsWithPasscode:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  BKUserProtectedConfiguration *updatedConfiguration;
  id v16;
  NSObject *v17;
  BKUserProtectedConfiguration *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28[5];
  NSObject *v29;
  __int128 *p_buf;
  uint64_t v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v36 = 0;
    v31 = 0;
    v5 = ACMContextCreate();
    if ((_DWORD)v5)
    {
      PSUILogForCategory(1uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PSUIPearlAttentionGroupController setProtectedCredentialsWithPasscode:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
      v13 = 0;
    }
    else
    {
      v28[1] = (id)MEMORY[0x24BDAC760];
      v28[2] = (id)3221225472;
      v28[3] = __credentialSetWithPasscodeCredential_block_invoke;
      v28[4] = &unk_24F9E3F20;
      p_buf = &buf;
      v29 = v4;
      ACMContextGetExternalForm();
      v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      v6 = v29;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v13 = 0;
  }

  -[PSUIPearlAttentionGroupController _pearlDevice](self, "_pearlDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  updatedConfiguration = self->_updatedConfiguration;
  v28[0] = 0;
  objc_msgSend(v14, "setProtectedConfiguration:forUser:credentialSet:error:", updatedConfiguration, getuid(), v13, v28);
  v16 = v28[0];

  PSUILogForCategory(1uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = self->_updatedConfiguration;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_22E0C8000, v17, OS_LOG_TYPE_DEFAULT, "Will set config: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v16)
  {
    PSUILogForCategory(1uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[PSUIPearlAttentionGroupController setProtectedCredentialsWithPasscode:].cold.1((uint64_t)v16, v19, v20, v21, v22, v23, v24, v25);

  }
  v26 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v26, "specifierForID:", CFSTR("PearlUnlockAttention"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "reloadSpecifier:", v27);

}

- (void)didCancelEnteringPIN
{
  void *v2;
  id v3;

  v3 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v3, "specifierForID:", CFSTR("PearlUnlockAttention"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifier:", v2);

}

- (void)setAttentionAware:(id)a3 specifier:(id)a4
{
  objc_msgSend(a3, "BOOLValue");
  _AXSSetAttentionAwarenessFeaturesEnabled();
}

- (id)attentionAware:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSAttentionAwarenessFeaturesEnabled());
}

- (void)setPearlUnlock:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
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
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  void (**v30)(_QWORD);
  _QWORD v31[5];
  _QWORD aBlock[5];
  id v33;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke;
  aBlock[3] = &unk_24F9E39A0;
  aBlock[4] = self;
  v7 = v5;
  v33 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "isPeriocularEnrollmentSupported") & 1) != 0)
      {
        v10 = -[PSUIPearlAttentionGroupController isPeriocularEnabled](self, "isPeriocularEnabled");

        if (v10)
        {
          PSUI_LocalizedStringForPasscodePeriocular(CFSTR("PEARL_PERIOCULAR_UNLOCK_ALERT_BODY"));
          v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
          v12 = (void *)v11;
          v13 = (void *)MEMORY[0x24BEBD3B0];
          PSLocalizablePearlStringForKey();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v14, v12, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)MEMORY[0x24BEBD3A8];
          PSLocalizablePearlStringForKey();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v6;
          v31[1] = 3221225472;
          v31[2] = __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_2;
          v31[3] = &unk_24F9E3EB8;
          v31[4] = self;
          objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addAction:", v18);
          v19 = (void *)MEMORY[0x24BEBD3A8];
          PSLocalizablePearlStringForKey();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v6;
          v27 = 3221225472;
          v28 = __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_3;
          v29 = &unk_24F9E3EE0;
          v30 = v8;
          objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, &v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "addAction:", v21, v26, v27, v28, v29);
          WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
          objc_msgSend(WeakRetained, "view");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "window");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "rootViewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "presentViewController:animated:completion:", v15, 1, 0);

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    PSLocalizablePearlStringForKey();
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8[2](v8);
LABEL_10:

}

void __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x24BE0CE50]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAttentionDetectionEnabled:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "pinCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProtectedCredentialsWithPasscode:", v6);

}

void __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v2, "specifierForID:", CFSTR("PearlUnlockAttention"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reloadSpecifier:", v3);

}

uint64_t __62__PSUIPearlAttentionGroupController_setPearlUnlock_specifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)pearlUnlock:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[PSUIPearlAttentionGroupController _pearlDevice](self, "_pearlDevice", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v3, "protectedConfigurationForUser:error:", getuid(), &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;

  if (v5)
  {
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PSUIPearlAttentionGroupController pearlUnlock:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  PSUILogForCategory(1uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "attentionDetectionEnabled");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_22E0C8000, v13, OS_LOG_TYPE_DEFAULT, "Could attention detect: %@ %@", buf, 0x16u);

  }
  objc_msgSend(v4, "attentionDetectionEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)useAlternateFooterTextForAttention
{
  int v2;
  void *v3;
  char v4;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPeriocularEnrollmentSupported");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)isPeriocularEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v7;
  void *v8;
  uint64_t v10;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceForType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v3, "protectedConfigurationForUser:error:", getuid(), &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v10 == 0;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v4, "periocularFaceIDMatchEnabled");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)pinCode
{
  return self->_pinCode;
}

- (void)setPinCode:(id)a3
{
  objc_storeStrong((id *)&self->_pinCode, a3);
}

- (PSListController)listController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_listController);
}

- (void)setListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (PSSpecifier)groupSpecifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_groupSpecifier);
}

- (void)setGroupSpecifier:(id)a3
{
  objc_storeWeak((id *)&self->_groupSpecifier, a3);
}

- (BKDevicePearl)pearlDevice
{
  return self->_pearlDevice;
}

- (void)setPearlDevice:(id)a3
{
  objc_storeStrong((id *)&self->_pearlDevice, a3);
}

- (BKUserProtectedConfiguration)updatedConfiguration
{
  return self->_updatedConfiguration;
}

- (void)setUpdatedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_updatedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedConfiguration, 0);
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_pinCode, 0);
}

- (void)_pearlDevice
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Could not find pearl device: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)setProtectedCredentialsWithPasscode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Could not set protected config: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_1();
}

- (void)setProtectedCredentialsWithPasscode:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_22E0C8000, a2, a3, "Could not create auth context: %d", a5, a6, a7, a8, 0);
}

- (void)pearlUnlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22E0C8000, a2, a3, "Could not get protected config: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_1();
}

@end
