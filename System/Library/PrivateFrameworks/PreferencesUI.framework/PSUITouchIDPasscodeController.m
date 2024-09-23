@implementation PSUITouchIDPasscodeController

- (PSUITouchIDPasscodeController)init
{
  PSUITouchIDPasscodeController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  PSUIDeviceTakeOverController *dtoController;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSUITouchIDPasscodeController;
  v2 = -[PSUIBiometricController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_reloadSpecifiers, CFSTR("PSEnrollmentNameChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_biometricBindingDeleted, CFSTR("PSBiometricBindingDeleted"), 0);

    v5 = objc_opt_new();
    dtoController = v2->_dtoController;
    v2->_dtoController = (PSUIDeviceTakeOverController *)v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_backgrounded_, *MEMORY[0x24BEBDF98], 0);

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

  if (-[PSUIBiometricController isObservingBiometricTemplateFetchingStatus](self, "isObservingBiometricTemplateFetchingStatus"))
  {
    -[PSUITouchIDPasscodeController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("currentBiometricTemplateFetchStatus"));
  }
  -[BiometricKit setDelegate:](self->_highlightMatcher, "setDelegate:", 0);
  -[BiometricKit cancel](self->_highlightMatcher, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIPasscodeLockController dealloc](&v4, sel_dealloc);
}

- (void)backgrounded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  -[PSUITouchIDPasscodeController presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "splashController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    -[PSUITouchIDPasscodeController presenter](self, "presenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "splashController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__PSUITouchIDPasscodeController_backgrounded___block_invoke;
    v9[3] = &unk_24F9E3978;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __46__PSUITouchIDPasscodeController_backgrounded___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresenter:", 0);

}

- (void)suspend
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __40__PSUITouchIDPasscodeController_suspend__block_invoke;
  v2[3] = &unk_24F9E3BF8;
  v2[4] = self;
  -[PSUITouchIDPasscodeController cancelModalFlowWithCompletion:](self, "cancelModalFlowWithCompletion:", v2);
}

id __40__PSUITouchIDPasscodeController_suspend__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PSUITouchIDPasscodeController;
  return objc_msgSendSuper2(&v2, sel_suspend);
}

- (void)updateAddFingerprintSpecifier
{
  void *v3;
  id v4;

  -[PSUITouchIDPasscodeController specifierForID:](self, "specifierForID:", CFSTR("ADD_FINGERPRINT"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIBiometricController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75A18]);

  -[PSUITouchIDPasscodeController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);
}

- (void)highlightFingerprintSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  if (-[PSUITouchIDPasscodeController containsSpecifier:](self, "containsSpecifier:", v4))
  {
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v5);
      -[PSUITouchIDPasscodeController highlightQueue](self, "highlightQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke;
      block[3] = &unk_24F9E3BF8;
      v10 = v6;
      v8 = v6;
      dispatch_async(v7, block);

    }
  }

}

void __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke_2;
  block[3] = &unk_24F9E3BF8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__PSUITouchIDPasscodeController_highlightFingerprintSpecifier___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHighlighted:animated:", 1, 1);

}

- (void)unhighlightFingerprintSpecifiersAfterDelay:(double)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  double v10;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", self);
  -[PSUITouchIDPasscodeController highlightQueue](self, "highlightQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke;
  v8[3] = &unk_24F9E39C8;
  v10 = a3;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  if (*(double *)(a1 + 40) > 0.0)
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke_2;
  block[3] = &unk_24F9E3BF8;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__PSUITouchIDPasscodeController_unhighlightFingerprintSpecifiersAfterDelay___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
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
  objc_msgSend(*(id *)(a1 + 32), "anyObject", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "specifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x24BE75D18];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "propertyForKey:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isHighlighted"))
        {
          objc_msgSend(v8, "propertyForKey:", CFSTR("FingerprintIdentity"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v9, "setHighlighted:animated:", 0, 1);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)_setupMatching
{
  void *v2;
  BOOL v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  BOOL v7;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState") == 0;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PSUITouchIDPasscodeController__setupMatching__block_invoke;
  block[3] = &unk_24F9E4190;
  objc_copyWeak(&v6, &location);
  v7 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__PSUITouchIDPasscodeController__setupMatching__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _DWORD v14[2];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[PSUIBiometrics identities](PSUIBiometrics, "identities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(unsigned __int8 *)(a1 + 40);

    if (v4)
    {
      objc_msgSend(WeakRetained, "highlightMatcher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDelegate:", 0);

      objc_msgSend(MEMORY[0x24BE0CE60], "manager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setHighlightMatcher:", v6);

      objc_msgSend(WeakRetained, "highlightMatcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", WeakRetained);

      objc_msgSend(WeakRetained, "authorizationToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "highlightMatcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8)
      {
        v15 = CFSTR("BKOptionMatchAuthTokenToBypassPasscodeBiolockout");
        v16[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "match:withOptions:", 0, v11);

      }
      else
      {
        v12 = objc_msgSend(v9, "match:withOptions:", 0, 0);
      }

      if (v12)
      {
        PSUILogForCategory(1uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14[0] = 67109120;
          v14[1] = v12;
          _os_log_impl(&dword_22E0C8000, v13, OS_LOG_TYPE_DEFAULT, "Failed to start matching: %i", (uint8_t *)v14, 8u);
        }

      }
    }
  }
  else
  {

  }
}

- (void)_cancelMatching
{
  void *v3;
  void *v4;

  -[PSUITouchIDPasscodeController highlightMatcher](self, "highlightMatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[PSUITouchIDPasscodeController highlightMatcher](self, "highlightMatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[PSUITouchIDPasscodeController setHighlightMatcher:](self, "setHighlightMatcher:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIPasscodeLockController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PSUIBiometricController enrollContainerController](self, "enrollContainerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PSUITouchIDPasscodeController _setupMatching](self, "_setupMatching");
  -[PSUITouchIDPasscodeController configureBiometricTemplateMatching](self, "configureBiometricTemplateMatching");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUITouchIDPasscodeController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PSUITouchIDPasscodeController _cancelMatching](self, "_cancelMatching");
}

- (void)enrollmentControllerDidDismiss
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIBiometricController enrollmentControllerDidDismiss](&v3, sel_enrollmentControllerDidDismiss);
  -[PSUITouchIDPasscodeController _setupMatching](self, "_setupMatching");
}

- (void)biometricBindingDeleted
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIBiometricController deleteGlobalAuthACL](&v2, sel_deleteGlobalAuthACL);
}

- (void)configureBiometricTemplateMatching
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7;
  id location;

  switch(-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus"))
  {
    case 1uLL:
      goto LABEL_4;
    case 2uLL:
    case 4uLL:
      -[PSUITouchIDPasscodeController matchBiometricIdentitiesWithBiometricTemplates](self, "matchBiometricIdentitiesWithBiometricTemplates");
      break;
    case 3uLL:
      objc_initWeak(&location, self);
      v3 = MEMORY[0x24BDAC760];
      v4 = 3221225472;
      v5 = __67__PSUITouchIDPasscodeController_configureBiometricTemplateMatching__block_invoke;
      v6 = &unk_24F9E3978;
      objc_copyWeak(&v7, &location);
      -[PSUIBiometricController fetchBiometricTemplateUUIDsWithCompletion:](self, "fetchBiometricTemplateUUIDsWithCompletion:", &v3);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
LABEL_4:
      if (!-[PSUIBiometricController isObservingBiometricTemplateFetchingStatus](self, "isObservingBiometricTemplateFetchingStatus", v3, v4, v5, v6))
      {
        -[PSUITouchIDPasscodeController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("currentBiometricTemplateFetchStatus"), 1, CFSTR("BiometricTemplateFetchingState"));
        -[PSUIBiometricController setIsObservingBiometricTemplateFetchingStatus:](self, "setIsObservingBiometricTemplateFetchingStatus:", 1);
      }
      break;
    default:
      return;
  }
}

void __67__PSUITouchIDPasscodeController_configureBiometricTemplateMatching__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    if (objc_msgSend(v3, "currentBiometricTemplateFetchStatus") == 3)
      objc_msgSend(v3, "configureBiometricTemplateMatching");
    else
      objc_msgSend(v3, "matchBiometricIdentitiesWithBiometricTemplates");

  }
}

- (void)updateWithReplacedUUIDs:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIBiometricController updateWithReplacedUUIDs:](&v4, sel_updateWithReplacedUUIDs_, a3);
  -[PSUITouchIDPasscodeController matchBiometricIdentitiesWithBiometricTemplates](self, "matchBiometricIdentitiesWithBiometricTemplates");
}

- (void)matchBiometricIdentitiesWithBiometricTemplates
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PSUIBiometricController storedBiometricTemplates](self, "storedBiometricTemplates");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[PSUITouchIDPasscodeController specifiers](self, "specifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[PSUITouchIDPasscodeController specifiers](self, "specifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(v10, "propertyForKey:", CFSTR("FingerprintIdentity"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUITouchIDPasscodeController isBiometricIdentityMatchingGovernmentIDTemplate:](self, "isBiometricIdentityMatchingGovernmentIDTemplate:", v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setProperty:forKey:", v12, CFSTR("BIOMETRIC_TEMPLATE_BINDING"));

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

    }
  }
  else
  {

  }
}

- (id)headerForUseBiometricSection
{
  return (id)PSLocalizableMesaStringForKey();
}

- (id)biometricNameDescription
{
  return (id)PSLocalizableMesaStringForKey();
}

- (id)biometricLogo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 4, 40.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("touchid"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemPinkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_flatImageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != 6)
    {
      -[PSUIBiometricController placardSpecifier](self, "placardSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    v9 = dispatch_queue_create("com.apple.Preferences.highlighting", 0);
    -[PSUITouchIDPasscodeController setHighlightQueue:](self, "setHighlightQueue:", v9);

    -[PSUIBiometricController useBiometricForSpecifiers](self, "useBiometricForSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUITouchIDPasscodeController addFooterToUseForGroup:](self, "addFooterToUseForGroup:", v11);
    objc_msgSend(v5, "addObjectsFromArray:", v10);
    -[PSUITouchIDPasscodeController fingerprintSpecifiers](self, "fingerprintSpecifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v12);

    v16.receiver = self;
    v16.super_class = (Class)PSUITouchIDPasscodeController;
    -[PSUIPasscodeLockController specifiers](&v16, sel_specifiers);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v13);

    v14 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)addFooterToUseForGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSRange v16;

  v4 = (void *)MEMORY[0x24BE6E428];
  v5 = (void *)MEMORY[0x24BE6E3F8];
  v6 = a3;
  objc_msgSend(v5, "bundleWithIdentifier:", CFSTR("com.apple.onboarding.touchid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flowWithBundle:", v7);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "localizedButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PSUI_LocalizedStringForTouchID(CFSTR("USE_TOUCHID_FOR_GROUP_FOOTER_PREFIX"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A30]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75A68]);
  v16.location = objc_msgSend(v10, "rangeOfString:", v8);
  NSStringFromRange(v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A50]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("learnMoreTapped:"), *MEMORY[0x24BE75A38]);
}

- (void)learnMoreTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.touchid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUITouchIDPasscodeController setPresenter:](self, "setPresenter:", v4);

  -[PSUITouchIDPasscodeController presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", self);

  -[PSUITouchIDPasscodeController presenter](self, "presenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "present");

}

- (id)_fingerprintSpecifierForIdentity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24F9E4F80;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFingerprintModificationAllowed");

  if (v10)
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, objc_opt_class(), 1, 0);
  else
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, -1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v4, CFSTR("FingerprintIdentity"));
  if (-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUITouchIDPasscodeController isBiometricIdentityMatchingGovernmentIDTemplate:](self, "isBiometricIdentityMatchingGovernmentIDTemplate:", v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v12, CFSTR("BIOMETRIC_TEMPLATE_BINDING"));

  }
  return v11;
}

- (BOOL)isBiometricIdentityMatchingGovernmentIDTemplate:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIBiometricController storedBiometricTemplates](self, "storedBiometricTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = -[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus");

    if (v6 != 4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[PSUIBiometricController storedBiometricTemplates](self, "storedBiometricTemplates", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v4, "uuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v12) = objc_msgSend(v12, "isEqual:", v13);

            if ((v12 & 1) != 0)
            {

              v14 = 1;
              goto LABEL_14;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
      }

    }
  }
  else
  {

  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)fingerprintSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", CFSTR("FINGERPRINTS"));
  PSLocalizableMesaStringForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  objc_msgSend(v3, "addObject:", v4);
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identitiesForIdentityType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        -[PSUITouchIDPasscodeController _fingerprintSpecifierForIdentity:](self, "_fingerprintSpecifierForIdentity:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v14 = (void *)MEMORY[0x24BE75590];
  PSLocalizableMesaStringForKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setButtonAction:", sel_addEnrollment_);
  objc_msgSend(v16, "setIdentifier:", CFSTR("ADD_FINGERPRINT"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIBiometricController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProperty:forKey:", v17, *MEMORY[0x24BE75A18]);

  objc_msgSend(v3, "addObject:", v16);
  return v3;
}

- (void)enrollBiometric
{
  -[PSUITouchIDPasscodeController addEnrollment:](self, "addEnrollment:", 0);
}

- (LAContext)authContext
{
  void *v3;
  void *v4;
  LAContext *authContext;
  void *v6;
  id v7;
  LAContext *v8;
  LAContext *v9;
  LAContext *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PSUITouchIDPasscodeController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  authContext = self->_authContext;
  if (v4)
  {
    if (!authContext)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v6 = (void *)getLAContextClass_softClass_0;
      v22 = getLAContextClass_softClass_0;
      if (!getLAContextClass_softClass_0)
      {
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v26 = __getLAContextClass_block_invoke_0;
        v27 = &unk_24F9E3C20;
        v28 = &v19;
        __getLAContextClass_block_invoke_0((uint64_t)&buf);
        v6 = (void *)v20[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v19, 8);
      v8 = (LAContext *)objc_opt_new();
      v9 = self->_authContext;
      self->_authContext = v8;

      -[LAContext setUiDelegate:](self->_authContext, "setUiDelegate:", self);
      v10 = self->_authContext;
      v23 = &unk_24F9EBAC0;
      v24 = &unk_24F9EBAD8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      v12 = (id)-[LAContext evaluatePolicy:options:error:](v10, "evaluatePolicy:options:error:", 1007, v11, &v18);
      v13 = v18;

      if (v13)
      {
        PSUILogForCategory(1uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v13, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v15;
          _os_log_impl(&dword_22E0C8000, v14, OS_LOG_TYPE_DEFAULT, "LAContextClass evaluatePolicy failed: %@", (uint8_t *)&buf, 0xCu);

        }
      }

      authContext = self->_authContext;
    }
    return authContext;
  }
  else
  {
    self->_authContext = 0;

    PSUILogForCategory(1uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PSUITouchIDPasscodeController authContext].cold.1();

    return (LAContext *)0;
  }
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v8 = a5;
  if (a3 == 2)
  {
    objc_msgSend(a4, "objectForKey:", &unk_24F9EBAF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      -[PSUITouchIDPasscodeController specifier](self, "specifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        PSUILogForCategory(1uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[PSUITouchIDPasscodeController event:params:reply:].cold.2();

      }
      -[PSUITouchIDPasscodeController specifier](self, "specifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BE75CC0];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        PSUILogForCategory(1uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[PSUITouchIDPasscodeController event:params:reply:].cold.1();

      }
      -[PSUITouchIDPasscodeController authContext](self, "authContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUITouchIDPasscodeController specifier](self, "specifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __52__PSUITouchIDPasscodeController_event_params_reply___block_invoke;
      v21[3] = &unk_24F9E40F0;
      v22 = v8;
      objc_msgSend(v17, "setCredential:forProcessedEvent:credentialType:reply:", v20, 2, -1, v21);

    }
  }

}

uint64_t __52__PSUITouchIDPasscodeController_event_params_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addEnrollment:(id)a3
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
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Touch ID: User pressed Add a Fingerprint", (uint8_t *)buf, 2u);
  }

  -[PSUITouchIDPasscodeController dtoController](self, "dtoController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRatchetEnabled");

  if (v7)
  {
    objc_initWeak(buf, self);
    -[PSUITouchIDPasscodeController dtoController](self, "dtoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke;
    v9[3] = &unk_24F9E3F70;
    objc_copyWeak(&v11, buf);
    v10 = v4;
    objc_msgSend(v8, "gateWithRatchetForOperation:forPresentingVC:completion:", 5, self, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    -[PSUITouchIDPasscodeController proceedToAddEnrollment:](self, "proceedToAddEnrollment:", v4);
  }

}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke(uint64_t a1, uint64_t a2)
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
      __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_cold_1();

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_84;
    v4[3] = &unk_24F9E3E90;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_84(uint64_t a1)
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
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Touch ID: Starting addition of fingerprint", v5, 2u);
    }

    objc_msgSend(WeakRetained, "proceedToAddEnrollment:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_84_cold_1();

  }
}

- (void)proceedToAddEnrollment:(id)a3
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = *MEMORY[0x24BE75A18];
  v5 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v4);
  -[PSUITouchIDPasscodeController reloadSpecifier:](self, "reloadSpecifier:", v5);

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke;
  v7[3] = &unk_24F9E3978;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE0CF18], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getEnrollUIViewController:bundleName:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(WeakRetained, "_cancelMatching");
    objc_msgSend(MEMORY[0x24BE0CE60], "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBiometricKit:", v5);

    objc_msgSend(v4, "setDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "authContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalizedContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v4, "setProperty:forKey:", v7, CFSTR("credset"));
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke_2;
    v8[3] = &unk_24F9E3E90;
    objc_copyWeak(&v10, v1);
    v9 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

    objc_destroyWeak(&v10);
  }

}

void __56__PSUITouchIDPasscodeController_proceedToAddEnrollment___block_invoke_2(uint64_t a1)
{
  PSEnrollContainerViewController *v2;
  PSEnrollmentNavigationController *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = -[PSEnrollContainerViewController initWithNibName:bundle:]([PSEnrollContainerViewController alloc], "initWithNibName:bundle:", 0, 0);
  -[PSEnrollContainerViewController setEnrollController:](v2, "setEnrollController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEnrollContainerController:", v2);
  v3 = -[PSEnrollmentNavigationController initWithRootViewController:]([PSEnrollmentNavigationController alloc], "initWithRootViewController:", v2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, WeakRetained, sel_cancelModalFlow);
  v5 = objc_msgSend((id)objc_opt_class(), "shouldPresentInModalSheet");
  -[PSEnrollContainerViewController navigationItem](v2, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setLeftBarButtonItem:", v4);

    objc_msgSend(WeakRetained, "presentSheetForContentViewController:", v3);
  }
  else
  {
    objc_msgSend(v6, "setRightBarButtonItem:", v4);

    -[PSEnrollmentNavigationController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 0);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);
  }

}

- (void)cancelModalFlow
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIBiometricController cancelModalFlowWithCompletion:](&v2, sel_cancelModalFlowWithCompletion_, 0);
}

- (void)cancelModalFlowWithCompletion:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[PSUITouchIDPasscodeController updateAddFingerprintSpecifier](self, "updateAddFingerprintSpecifier");
  v5.receiver = self;
  v5.super_class = (Class)PSUITouchIDPasscodeController;
  -[PSUIBiometricController cancelModalFlowWithCompletion:](&v5, sel_cancelModalFlowWithCompletion_, v4);

}

- (void)matchResult:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(a3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[PSUITouchIDPasscodeController specifiers](self, "specifiers", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v10, "propertyForKey:", CFSTR("FingerprintIdentity"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11)
            {
              objc_msgSend(v11, "uuid");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (v13 && objc_msgSend(v4, "isEqual:", v13))
              {
                -[PSUITouchIDPasscodeController highlightFingerprintSpecifier:](self, "highlightFingerprintSpecifier:", v10);
                -[PSUITouchIDPasscodeController highlightMatcher](self, "highlightMatcher");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "inUse");

                if ((v15 & 1) == 0)
                  -[PSUITouchIDPasscodeController unhighlightFingerprintSpecifiersAfterDelay:](self, "unhighlightFingerprintSpecifiersAfterDelay:", 0.5);

                goto LABEL_18;
              }

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_18:

    }
  }
}

- (void)statusMessage:(unsigned int)a3
{
  if (a3 == 64)
    -[PSUITouchIDPasscodeController unhighlightFingerprintSpecifiersAfterDelay:](self, "unhighlightFingerprintSpecifiersAfterDelay:", 0.0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (a6 == CFSTR("BiometricTemplateFetchingState"))
  {
    PSUILogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = -[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus");
      _os_log_impl(&dword_22E0C8000, v11, OS_LOG_TYPE_DEFAULT, "In KVO, current biometric template fetch status: %ld", buf, 0xCu);
    }

    if (-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus") == 2)
    {
      -[PSUITouchIDPasscodeController matchBiometricIdentitiesWithBiometricTemplates](self, "matchBiometricIdentitiesWithBiometricTemplates");
      -[PSUITouchIDPasscodeController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, v10);
      -[PSUIBiometricController setIsObservingBiometricTemplateFetchingStatus:](self, "setIsObservingBiometricTemplateFetchingStatus:", 0);
    }
    else if (-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus") == 3)
    {
      -[PSUIBiometricController fetchBiometricTemplateUUIDsWithCompletion:](self, "fetchBiometricTemplateUUIDsWithCompletion:", 0);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PSUITouchIDPasscodeController;
    -[PSUITouchIDPasscodeController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _Unwind_Exception *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 1:
      if (v6)
      {
        -[PSUIBiometricController enrollmentCompletedForIdentity:](self, "enrollmentCompletedForIdentity:", v6);
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __57__PSUITouchIDPasscodeController_enrollResult_bkIdentity___block_invoke;
        v14[3] = &unk_24F9E3BF8;
        v15 = v7;
        -[PSUIBiometricController setModalFlowCancelCompletion:](self, "setModalFlowCancelCompletion:", v14);

      }
      break;
    case 3:
      -[PSUITouchIDPasscodeController cancelModalFlowWithCompletion:](self, "cancelModalFlowWithCompletion:", 0);
      break;
    case 4:
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v8 = (void *)getBYFlowSkipControllerClass_softClass;
      v24 = getBYFlowSkipControllerClass_softClass;
      if (!getBYFlowSkipControllerClass_softClass)
      {
        v16 = MEMORY[0x24BDAC760];
        v17 = 3221225472;
        v18 = (uint64_t)__getBYFlowSkipControllerClass_block_invoke;
        v19 = &unk_24F9E3C20;
        v20 = &v21;
        __getBYFlowSkipControllerClass_block_invoke((uint64_t)&v16);
        v8 = (void *)v22[3];
      }
      v9 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v21, 8);
      v10 = objc_alloc_init(v9);
      v16 = 0;
      v17 = (uint64_t)&v16;
      v18 = 0x2020000000;
      v11 = (_QWORD *)getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr;
      v19 = (void *)getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr;
      if (!getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr)
      {
        v12 = (void *)SetupAssistantLibrary();
        v11 = dlsym(v12, "BYFlowSkipIdentifierTouchID");
        *(_QWORD *)(v17 + 24) = v11;
        getBYFlowSkipIdentifierTouchIDSymbolLoc_ptr = (uint64_t)v11;
      }
      _Block_object_dispose(&v16, 8);
      if (!v11)
      {
        v13 = (_Unwind_Exception *)-[PSUITouchIDPasscodeController enrollResult:bkIdentity:].cold.1();
        _Block_object_dispose(&v21, 8);
        _Unwind_Resume(v13);
      }
      objc_msgSend(v10, "didCompleteFlow:", *v11);

      if (-[PSUIBiometricController isPasscodeSet](self, "isPasscodeSet"))
        -[PSUIBiometricController completeModalFlow](self, "completeModalFlow");
      else
        -[PSUIBiometricController pushPasscodePane](self, "pushPasscodePane");
      break;
    case 8:
      -[PSUIBiometricController hideCancelButton](self, "hideCancelButton");
      break;
    default:
      break;
  }

}

void __57__PSUITouchIDPasscodeController_enrollResult_bkIdentity___block_invoke(uint64_t a1)
{
  id v2;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeIdentity:completion:", *(_QWORD *)(a1 + 32), 0);

}

- (BiometricKit)highlightMatcher
{
  return self->_highlightMatcher;
}

- (void)setHighlightMatcher:(id)a3
{
  objc_storeStrong((id *)&self->_highlightMatcher, a3);
}

- (OS_dispatch_queue)highlightQueue
{
  return self->_highlightQueue;
}

- (void)setHighlightQueue:(id)a3
{
  objc_storeStrong((id *)&self->_highlightQueue, a3);
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
  objc_storeStrong((id *)&self->_dtoController, a3);
}

- (OBPrivacyPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_highlightQueue, 0);
  objc_storeStrong((id *)&self->_highlightMatcher, 0);
}

- (void)authContext
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Touch ID: authContext = nil - No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)event:params:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "LAUIDelegate event: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)event:params:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "LAUIDelegate event: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Touch ID: Not adding a fingerprint as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__PSUITouchIDPasscodeController_addEnrollment___block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Touch ID: Not adding fingerprint as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (uint64_t)enrollResult:bkIdentity:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __79__PSUIFingerprintController_fetchBiometricTemplateForCurrentBiometricIdentity___block_invoke_2_cold_1(v0);
}

@end
