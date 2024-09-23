@implementation PSUIPearlPasscodeController

- (PSUIPearlPasscodeController)init
{
  PSUIPearlPasscodeController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  PSUIDeviceTakeOverController *dtoController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUIPearlPasscodeController;
  v2 = -[PSUIBiometricController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_reloadSpecifiers, CFSTR("PSUIBiometricsDidUpdate"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_backgrounded_, *MEMORY[0x24BEBDF98], 0);

    v5 = objc_opt_new();
    dtoController = v2->_dtoController;
    v2->_dtoController = (PSUIDeviceTakeOverController *)v5;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[PSUIBiometricController isObservingBiometricTemplateFetchingStatus](self, "isObservingBiometricTemplateFetchingStatus"))
  {
    -[PSUIPearlPasscodeController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("currentBiometricTemplateFetchStatus"));
  }
  -[LAContext invalidate](self->_authContext, "invalidate");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PSUIBiometricsDidUpdate"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);

  v5.receiver = self;
  v5.super_class = (Class)PSUIPearlPasscodeController;
  -[PSUIPasscodeLockController dealloc](&v5, sel_dealloc);
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
  -[PSUIBiometricController cancelModalFlowWithCompletion:](self, "cancelModalFlowWithCompletion:", 0);
  -[PSUIPearlPasscodeController popPearlEnrollmentController](self, "popPearlEnrollmentController");
  -[PSUIPearlPasscodeController presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "splashController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    -[PSUIPearlPasscodeController presenter](self, "presenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "splashController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__PSUIPearlPasscodeController_backgrounded___block_invoke;
    v9[3] = &unk_24F9E3978;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __44__PSUIPearlPasscodeController_backgrounded___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresenter:", 0);

}

- (void)popPearlEnrollmentController
{
  void *v3;
  void *v4;

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[PSUIPearlPasscodeController setFaceIDEnrollmentCoordinator:](self, "setFaceIDEnrollmentCoordinator:", 0);
}

- (void)enrollBiometric
{
  -[PSUIPearlPasscodeController enroll:](self, "enroll:", self->_enrollFaceSpecifier);
}

- (void)validateBiometricTemplateUUIDWithSpecifier:(id)a3 action:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  PSUILogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = -[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus");
    _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, "Current biometric template fetch status: %ld", (uint8_t *)&v12, 0xCu);
  }

  switch(-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus"))
  {
    case 0uLL:
    case 3uLL:
      PSUILogForCategory(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_22E0C8000, v9, OS_LOG_TYPE_DEFAULT, "Refetching biometric templates", (uint8_t *)&v12, 2u);
      }

      -[PSUIPearlPasscodeController refetchBiometricTemplateWithSpecifier:action:](self, "refetchBiometricTemplateWithSpecifier:action:", v6, v7);
      break;
    case 1uLL:
      PSUILogForCategory(1uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_22E0C8000, v11, OS_LOG_TYPE_DEFAULT, "Still in process of fetching biometric templates, wait for it to finish", (uint8_t *)&v12, 2u);
      }

      -[PSListController configureSpin:ofCellForSpecifier:setEnabled:](self, "configureSpin:ofCellForSpecifier:setEnabled:", 1, v6, 0);
      if (!-[PSUIBiometricController isObservingBiometricTemplateFetchingStatus](self, "isObservingBiometricTemplateFetchingStatus"))
      {
        -[PSUIPearlPasscodeController addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("currentBiometricTemplateFetchStatus"), 1, CFSTR("BiometricTemplateFetchingState"));
        -[PSUIBiometricController setIsObservingBiometricTemplateFetchingStatus:](self, "setIsObservingBiometricTemplateFetchingStatus:", 1);
      }
      break;
    case 2uLL:
    case 4uLL:
      PSUILogForCategory(1uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_22E0C8000, v10, OS_LOG_TYPE_DEFAULT, "Finished fetching biometric templates, check to see if need to present alert for alternate appearance", (uint8_t *)&v12, 2u);
      }

      v7[2](v7);
      break;
    default:
      break;
  }

}

- (void)validateBiometricTemplateUUIDAndEnroll:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Set Up an Alternate Appearance", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __70__PSUIPearlPasscodeController_validateBiometricTemplateUUIDAndEnroll___block_invoke;
  v11 = &unk_24F9E3E90;
  objc_copyWeak(&v13, buf);
  v6 = v4;
  v12 = v6;
  v7 = _Block_copy(&v8);
  -[PSUIPearlPasscodeController validateBiometricTemplateUUIDWithSpecifier:action:](self, "validateBiometricTemplateUUIDWithSpecifier:action:", v6, v7, v8, v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);

}

void __70__PSUIPearlPasscodeController_validateBiometricTemplateUUIDAndEnroll___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentAlertForAlternateAppearanceIfNecessary:", *(_QWORD *)(a1 + 32));

}

- (void)refetchBiometricTemplateWithSpecifier:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[8];
  id location;

  v6 = a3;
  v7 = a4;
  -[PSListController configureSpin:ofCellForSpecifier:setEnabled:](self, "configureSpin:ofCellForSpecifier:setEnabled:", 1, v6, 0);
  objc_initWeak(&location, self);
  PSUILogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, "Start refetching biometric templates", buf, 2u);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke;
  v11[3] = &unk_24F9E3F48;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  -[PSUIBiometricController fetchBiometricTemplateUUIDsWithCompletion:](self, "fetchBiometricTemplateUUIDsWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    v5 = objc_msgSend(v4, "currentBiometricTemplateFetchStatus");
    PSUILogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 3)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke_cold_1();

      objc_msgSend(v4, "refetchBiometricTemplateWithSpecifier:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Configure alert for alternate appearance", v8, 2u);
      }

      objc_msgSend(v4, "configureSpin:ofCellForSpecifier:setEnabled:", 0, *(_QWORD *)(a1 + 32), 1);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (BOOL)hasMatchingBiometricTemplate
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  __int128 v20;
  id obj;
  char v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  PSUILogForCategory(1uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v2, OS_LOG_TYPE_DEFAULT, "Checking biometric identify for matched biometric template", buf, 2u);
  }

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForIdentityType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v5)
  {
    v7 = v5;
    v22 = 0;
    v23 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138412546;
    v20 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        -[PSUIBiometricController storedBiometricTemplates](self, "storedBiometricTemplates", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v9, "uuid");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v15, "isEqual:", v16);

              if (v17)
              {
                PSUILogForCategory(1uLL);
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v20;
                  v34 = v9;
                  v35 = 2112;
                  v36 = v15;
                  _os_log_impl(&dword_22E0C8000, v18, OS_LOG_TYPE_DEFAULT, "Found matching BKIdentity: %@ matches UUID:%@ in stored biometric templates", buf, 0x16u);
                }

                v22 = 1;
                goto LABEL_20;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_20:

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v7);
  }
  else
  {
    v22 = 0;
  }

  return v22 & 1;
}

- (void)presentAlertForAlternateAppearanceIfNecessary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PSUIPearlPasscodeController *v22;
  id v23;
  uint8_t buf[16];

  v4 = a3;
  -[PSUIBiometricController storedBiometricTemplates](self, "storedBiometricTemplates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_8;
  }
  v6 = -[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus");

  if (v6 == 4)
  {
LABEL_8:
    PSUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      -[PSUIPearlPasscodeController enroll:](self, "enroll:", v4);
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v17 = "No stored biometric templates, start enrolling process";
LABEL_10:
    _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    goto LABEL_11;
  }
  v7 = -[PSUIPearlPasscodeController hasMatchingBiometricTemplate](self, "hasMatchingBiometricTemplate");
  PSUILogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v9)
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = "Did not found matching biometric template for enrolled faceID, proceed to enroll alternate appearance";
    goto LABEL_10;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E0C8000, v8, OS_LOG_TYPE_DEFAULT, "Found matching biometric template for enrolled faceID, presenting alert", buf, 2u);
  }

  v10 = (void *)MEMORY[0x24BEBD3B0];
  PSLocalizablePearlStringForKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizablePearlStringForKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizablePearlStringForKey();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __77__PSUIPearlPasscodeController_presentAlertForAlternateAppearanceIfNecessary___block_invoke;
  v21 = &unk_24F9E3B08;
  v22 = self;
  v23 = v4;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, &v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v16, v18, v19, v20, v21, v22);

  -[PSUIPearlPasscodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
LABEL_12:

}

uint64_t __77__PSUIPearlPasscodeController_presentAlertForAlternateAppearanceIfNecessary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enroll:", *(_QWORD *)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_super v21;
  uint8_t buf[4];
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (a6 == CFSTR("BiometricTemplateFetchingState"))
  {
    PSUILogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = -[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus");
      _os_log_impl(&dword_22E0C8000, v11, OS_LOG_TYPE_DEFAULT, "In KVO, current biometric template fetch status: %ld", buf, 0xCu);
    }

    if (-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus") == 2)
    {
      -[PSUIPearlPasscodeController specifierForID:](self, "specifierForID:", CFSTR("UPDATE_APPEARANCE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = (_QWORD *)MEMORY[0x24BE75D18];
      if (v12)
      {
        objc_msgSend(v12, "propertyForKey:", *MEMORY[0x24BE75D18]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "cellEnabled") & 1) == 0)
        {
          PSUILogForCategory(1uLL);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22E0C8000, v16, OS_LOG_TYPE_DEFAULT, "In KVO, continue validating biometric template for updating appearance", buf, 2u);
          }

          -[PSListController configureSpin:ofCellForSpecifier:setEnabled:](self, "configureSpin:ofCellForSpecifier:setEnabled:", 0, v13, 1);
          -[PSUIPearlPasscodeController validateBiometricTemplateUUIDAndEnroll:](self, "validateBiometricTemplateUUIDAndEnroll:", v13);
        }

      }
      -[PSUIPearlPasscodeController specifierForID:](self, "specifierForID:", CFSTR("PEARL_REMOVE_FACE"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "propertyForKey:", *v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "cellEnabled") & 1) == 0)
        {
          PSUILogForCategory(1uLL);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22E0C8000, v20, OS_LOG_TYPE_DEFAULT, "In KVO, continue validating biometric template for resetting faceID", buf, 2u);
          }

          -[PSListController configureSpin:ofCellForSpecifier:setEnabled:](self, "configureSpin:ofCellForSpecifier:setEnabled:", 0, v18, 1);
          -[PSUIPearlPasscodeController deleteFaceIDIdentitiesCheckWithSpecifier:](self, "deleteFaceIDIdentitiesCheckWithSpecifier:", v18);
        }

      }
      -[PSUIPearlPasscodeController removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, v10);
      -[PSUIBiometricController setIsObservingBiometricTemplateFetchingStatus:](self, "setIsObservingBiometricTemplateFetchingStatus:", 0);

    }
    else if (-[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus") == 3)
    {
      -[PSUIBiometricController fetchBiometricTemplateUUIDsWithCompletion:](self, "fetchBiometricTemplateUUIDsWithCompletion:", 0);
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PSUIPearlPasscodeController;
    -[PSUIPearlPasscodeController observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);
  }

}

- (void)enroll:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Set up Face ID/an Alternate Appearance", (uint8_t *)buf, 2u);
  }

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Not enrolling as we have a faceIDEnrollmentCoordinator", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    -[PSUIPearlPasscodeController dtoController](self, "dtoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRatchetEnabled");

    if (v9)
    {
      objc_initWeak(buf, self);
      -[PSUIPearlPasscodeController dtoController](self, "dtoController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __38__PSUIPearlPasscodeController_enroll___block_invoke;
      v11[3] = &unk_24F9E3F70;
      objc_copyWeak(&v13, buf);
      v12 = v4;
      objc_msgSend(v10, "gateWithRatchetForOperation:forPresentingVC:completion:", 1, self, v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      -[PSUIPearlPasscodeController proceedToEnrollWithSpecifier:](self, "proceedToEnrollWithSpecifier:", v4);
    }
  }

}

void __38__PSUIPearlPasscodeController_enroll___block_invoke(uint64_t a1, uint64_t a2)
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
      __38__PSUIPearlPasscodeController_enroll___block_invoke_cold_1();

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __38__PSUIPearlPasscodeController_enroll___block_invoke_86;
    v4[3] = &unk_24F9E3E90;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke_86(uint64_t a1)
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
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Face ID: Starting enrollment", v5, 2u);
    }

    objc_msgSend(WeakRetained, "proceedToEnrollWithSpecifier:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __38__PSUIPearlPasscodeController_enroll___block_invoke_86_cold_1();

  }
}

- (void)proceedToEnrollWithSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  PSUIFaceIDEnrollmentCoordinator *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke;
  aBlock[3] = &unk_24F9E3F98;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63838]);

  if (v8 == 2)
  {
    v9 = (void *)MEMORY[0x24BEBD3B0];
    PSLocalizablePearlStringForKey();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PSLocalizablePearlStringForKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BEBD3A8];
    PSLocalizablePearlStringForKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v15);

    v31[0] = v5;
    v31[1] = 3221225472;
    v31[2] = __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke_2;
    v31[3] = &unk_24F9E3FC0;
    v31[4] = self;
    v32 = v6;
    -[PSUIPearlPasscodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, v31);
    v16 = v32;
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isPeriocularEnrollmentSupported");

      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    v20 = -[PSUIFaceIDEnrollmentCoordinator initWithPresentingViewController:configuration:]([PSUIFaceIDEnrollmentCoordinator alloc], "initWithPresentingViewController:configuration:", self, v19);
    -[PSUIPearlPasscodeController setFaceIDEnrollmentCoordinator:](self, "setFaceIDEnrollmentCoordinator:", v20);

    -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", self);

    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
    -[PSUIPearlPasscodeController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v12, "setAccessoryView:", v16);
    objc_msgSend(v12, "setCellEnabled:", 0);
    objc_msgSend(v12, "setNeedsDisplay");
    objc_msgSend(v16, "startAnimating");
    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      PSUILogForCategory(1uLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PSUIPearlPasscodeController proceedToEnrollWithSpecifier:].cold.2();

    }
    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x24BE75CC0];
    objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      PSUILogForCategory(1uLL);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[PSUIPearlPasscodeController proceedToEnrollWithSpecifier:].cold.1();

    }
    -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startWithPasscode:", v30);

  }
  -[PSUIPearlPasscodeController setCurrentlyPresentingPearlEnrollSpecifier:](self, "setCurrentlyPresentingPearlEnrollSpecifier:", v4);

}

void __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "specifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "cachedCellForSpecifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setUserInteractionEnabled:", a2);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

uint64_t __60__PSUIPearlPasscodeController_proceedToEnrollWithSpecifier___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentlyPresentingPearlEnrollSpecifier:", 0);
}

- (BOOL)isEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identitiesForIdentityType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)pearlEnrollSpecifiers
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *enrollFaceSpecifier;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSUIPearlPasscodeController isEnrolled](self, "isEnrolled");
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BE75590];
    PSLocalizablePearlStringForKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 13, 0);
    enrollFaceSpecifier = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(enrollFaceSpecifier, "setButtonAction:", sel_deleteFaceIDIdentitiesCheckWithSpecifier_);
    v9 = *MEMORY[0x24BE75AC0];
    objc_msgSend(enrollFaceSpecifier, "setProperty:forKey:", CFSTR("PEARL_REMOVE_FACE"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE75A18];
    objc_msgSend(enrollFaceSpecifier, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);

    if (-[PSUIPearlPasscodeController hasReachedMaximumBiometricEnrollmentCount](self, "hasReachedMaximumBiometricEnrollmentCount"))
    {
      PSLocalizablePearlStringForKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", v12, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v5);
      objc_msgSend(v3, "addObject:", enrollFaceSpecifier);
    }
    else
    {
      PSLocalizablePearlStringForKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProperty:forKey:", v18, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v5);
      v19 = (void *)MEMORY[0x24BE75590];
      PSLocalizablePearlStringForKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, 0, 13, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setButtonAction:", sel_validateBiometricTemplateUUIDAndEnroll_);
      objc_msgSend(v21, "setProperty:forKey:", CFSTR("UPDATE_APPEARANCE"), v9);
      v22 = (void *)MEMORY[0x24BDD16E0];
      if (-[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"))
        v23 = PSIsPearlInterlocked() ^ 1;
      else
        v23 = 0;
      objc_msgSend(v22, "numberWithInt:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProperty:forKey:", v25, v11);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIPearlPasscodeController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setProperty:forKey:", v26, v11);

      objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      objc_msgSend(v3, "addObject:", v21);
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v27);

      objc_msgSend(v3, "addObject:", enrollFaceSpecifier);
    }
  }
  else
  {
    objc_msgSend(v3, "addObject:", v5);
    v13 = (void *)MEMORY[0x24BE75590];
    PSLocalizablePearlStringForKey();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 13, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setButtonAction:", sel_enroll_);
    objc_msgSend(v15, "setProperty:forKey:", CFSTR("PEARL_ENROLL"), *MEMORY[0x24BE75AC0]);
    v16 = (void *)MEMORY[0x24BDD16E0];
    if (-[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"))
      v17 = PSIsPearlInterlocked() ^ 1;
    else
      v17 = 0;
    objc_msgSend(v16, "numberWithInt:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", v24, *MEMORY[0x24BE75A18]);

    objc_msgSend(v3, "addObject:", v15);
    enrollFaceSpecifier = self->_enrollFaceSpecifier;
    self->_enrollFaceSpecifier = (PSSpecifier *)v15;
  }

  v28 = (void *)objc_msgSend(v3, "copy");
  return v28;
}

- (BOOL)hasReachedMaximumBiometricEnrollmentCount
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumIdentityCountForIdentityType:", 2);

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identitiesForIdentityType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6 >= v3;
}

- (void)setPeriocularFaceIDMatchEnabled:(id)a3 specifier:(id)a4
{
  int v6;
  void *v7;
  void *v8;
  PSUIPearlPasscodeController *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v6 = objc_msgSend(a3, "BOOLValue");
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identitiesForIdentityType:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!objc_msgSend(v8, "na_any:", &__block_literal_global_2))
    {
      -[PSUIPearlPasscodeController enrollPeriocularForExistingAppearance:](self, "enrollPeriocularForExistingAppearance:", v11);
      goto LABEL_7;
    }
    v9 = self;
    v10 = 1;
  }
  else
  {
    v9 = self;
    v10 = 0;
  }
  -[PSUIPearlPasscodeController configurePeriocularEnabled:](v9, "configurePeriocularEnabled:", v10);
  -[PSUIPearlPasscodeController reloadSpecifiers](self, "reloadSpecifiers");
LABEL_7:

}

uint64_t __73__PSUIPearlPasscodeController_setPeriocularFaceIDMatchEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPeriocularEnrollment");
}

- (id)isPeriocularFaceIDMatchEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIPearlPasscodeController isPeriocularEnabled](self, "isPeriocularEnabled", a3));
}

- (void)enrollGlassesForExistingAppearance:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Add Glasses", (uint8_t *)buf, 2u);
  }

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Not enrolling with Add Glasses as we have a faceIDEnrollmentCoordinator", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    -[PSUIPearlPasscodeController dtoController](self, "dtoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRatchetEnabled");

    if (v9)
    {
      objc_initWeak(buf, self);
      -[PSUIPearlPasscodeController dtoController](self, "dtoController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke;
      v11[3] = &unk_24F9E3F70;
      objc_copyWeak(&v13, buf);
      v12 = v4;
      objc_msgSend(v10, "gateWithRatchetForOperation:forPresentingVC:completion:", 3, self, v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      -[PSUIPearlPasscodeController proceedToEnrollGlassesForExistingAppearance:](self, "proceedToEnrollGlassesForExistingAppearance:", v4);
    }
  }

}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke(uint64_t a1, uint64_t a2)
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
      __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_cold_1();

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_117;
    v4[3] = &unk_24F9E3E90;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_117(uint64_t a1)
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
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Face ID: Starting enrollment with Add Glasses", v5, 2u);
    }

    objc_msgSend(WeakRetained, "proceedToEnrollGlassesForExistingAppearance:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_117_cold_1();

  }
}

- (void)proceedToEnrollGlassesForExistingAppearance:(id)a3
{
  PSUIFaceIDEnrollmentCoordinator *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = -[PSUIFaceIDEnrollmentCoordinator initWithPresentingViewController:configuration:]([PSUIFaceIDEnrollmentCoordinator alloc], "initWithPresentingViewController:configuration:", self, 3);
  -[PSUIPearlPasscodeController setFaceIDEnrollmentCoordinator:](self, "setFaceIDEnrollmentCoordinator:", v4);

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController proceedToEnrollGlassesForExistingAppearance:].cold.2();

  }
  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE75CC0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PSUILogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController proceedToEnrollGlassesForExistingAppearance:].cold.1();

  }
  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startWithPasscode:", v14);

}

- (void)toggleToState:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  PSUILogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "%@: Auto toggling to state [%@]", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75DA0]);

  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPearlPasscodeController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", v11, 1);

}

- (void)enrollPeriocularForExistingAppearance:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id buf[2];

  v4 = a3;
  PSUILogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User toggled to ON - Face ID with a Mask", (uint8_t *)buf, 2u);
  }

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Not enrolling periocular for existing appearance as we have a faceIDEnrollmentCoordinator", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    -[PSUIPearlPasscodeController dtoController](self, "dtoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRatchetEnabled");

    if (v9)
    {
      objc_initWeak(buf, self);
      -[PSUIPearlPasscodeController dtoController](self, "dtoController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke;
      v11[3] = &unk_24F9E3F70;
      objc_copyWeak(&v13, buf);
      v12 = v4;
      objc_msgSend(v10, "gateWithRatchetForOperation:forPresentingVC:completion:", 2, self, v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      -[PSUIPearlPasscodeController proceedToEnrollPeriocularForExistingAppearance:](self, "proceedToEnrollPeriocularForExistingAppearance:", v4);
    }
  }

}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke(uint64_t a1, void *a2)
{
  _QWORD block[4];
  id v5;
  id v6[2];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2;
  block[3] = &unk_24F9E4028;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v6);
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    PSUILogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_1();

    v4 = *(_QWORD *)(a1 + 32);
    v5 = WeakRetained;
LABEL_12:
    objc_msgSend(v5, "toggleToState:forIdentifier:", 0, v4);
    goto LABEL_13;
  }
  PSUILogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_2();

    v4 = *(_QWORD *)(a1 + 32);
    v5 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22E0C8000, v7, OS_LOG_TYPE_DEFAULT, "Face ID: Starting enrollment of periocular for existing appearance", v8, 2u);
  }

  objc_msgSend(WeakRetained, "proceedToEnrollPeriocularForExistingAppearance:", *(_QWORD *)(a1 + 32));
LABEL_13:

}

- (void)proceedToEnrollPeriocularForExistingAppearance:(id)a3
{
  PSUIFaceIDEnrollmentCoordinator *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = -[PSUIFaceIDEnrollmentCoordinator initWithPresentingViewController:configuration:]([PSUIFaceIDEnrollmentCoordinator alloc], "initWithPresentingViewController:configuration:", self, 2);
  -[PSUIPearlPasscodeController setFaceIDEnrollmentCoordinator:](self, "setFaceIDEnrollmentCoordinator:", v4);

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PSUILogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController proceedToEnrollPeriocularForExistingAppearance:].cold.2();

  }
  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE75CC0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PSUILogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController proceedToEnrollPeriocularForExistingAppearance:].cold.1();

  }
  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startWithPasscode:", v14);

}

- (unint64_t)currentPeriocularEnrollmentState
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identitiesForIdentityType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maximumIdentityCountForIdentityType:", 2);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "hasPeriocularEnrollment", (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

    if (v9 == 1)
      v12 = 1;
    else
      v12 = 2 * (v9 == v5);
  }
  else
  {

    v12 = 2 * (v5 == 0);
  }

  return v12;
}

- (void)configurePeriocularEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceForType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIPearlPasscodeController authContext](self, "authContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = &unk_24F9EBA78;
  v13[0] = &unk_24F9EBA90;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "evaluatePolicy:options:error:", 1007, v8, 0);

  -[PSUIPearlPasscodeController authContext](self, "authContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "externalizedContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE0CF10], "setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:enabled:", v6, v11, v3);
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

- (unint64_t)numberOfAppsUsingPearl
{
  void *v2;
  unint64_t v3;

  v2 = (void *)TCCAccessCopyInformation();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)numberOfAppsUsingPearlDescription:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[PSUIPearlPasscodeController numberOfAppsUsingPearl](self, "numberOfAppsUsingPearl", a3);
  if (v3)
  {
    v4 = v3;
    if (v3 == 2 || v3 == 1)
    {
      PSLocalizablePearlStringForKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)objc_opt_new();
      v9 = (void *)MEMORY[0x24BDD17C8];
      PSLocalizablePearlStringForKey();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromNumber:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v7;
  }
  else
  {
    PSUILogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController numberOfAppsUsingPearlDescription:].cold.1(v5);

    return &stru_24F9E4F80;
  }
}

- (id)headerForUseBiometricSection
{
  return (id)PSLocalizablePearlStringForKey();
}

- (id)biometricNameDescription
{
  return (id)PSLocalizablePearlStringForKey();
}

- (void)pearlLearnMoreTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.faceid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPearlPasscodeController setPresenter:](self, "setPresenter:", v4);

  -[PSUIPearlPasscodeController presenter](self, "presenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", self);

  -[PSUIPearlPasscodeController presenter](self, "presenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "present");

}

- (void)setBiometricUnlockEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSUIPearlPasscodeController;
  -[PSUIBiometricController setBiometricUnlockEnabled:specifier:](&v10, sel_setBiometricUnlockEnabled_specifier_, v6, a4);
  if (v6)
  {
    -[PSUIPearlPasscodeController authContext](self, "authContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &unk_24F9EBA78;
    v12[0] = &unk_24F9EBA90;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "evaluatePolicy:options:error:", 1007, v8, 0);

  }
  -[PSUIPasscodeLockController updatePhoneAutounlockSection:](self, "updatePhoneAutounlockSection:", objc_msgSend(v6, "BOOLValue"));

}

- (LAContext)authContext
{
  LAContext *authContext;
  void *v4;
  id v5;
  LAContext *v6;
  LAContext *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  authContext = self->_authContext;
  if (!authContext)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getLAContextClass_softClass;
    v13 = getLAContextClass_softClass;
    if (!getLAContextClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getLAContextClass_block_invoke;
      v9[3] = &unk_24F9E3C20;
      v9[4] = &v10;
      __getLAContextClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (LAContext *)objc_opt_new();
    v7 = self->_authContext;
    self->_authContext = v6;

    -[LAContext setUiDelegate:](self->_authContext, "setUiDelegate:", self);
    authContext = self->_authContext;
  }
  return authContext;
}

- (id)biometricLogo
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  if (v4 >= 3.0)
    goto LABEL_3;
  v5 = (void *)MEMORY[0x24BEBD640];
  PSPreferencesUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("faceID-header@2x-n84.png"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_flatImageWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_3:
    v10 = (void *)MEMORY[0x24BEBD640];
    PSPreferencesUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("faceID-header"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_flatImageWithColor:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)biometricTableViewHeader
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  if (PSIsPearlInterlocked())
  {
    v3 = (void *)objc_opt_new();
    -[PSUIPearlPasscodeController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;

    objc_msgSend(v3, "heightForWidth:", v6);
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, v6, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PSUIPearlPasscodeController;
    -[PSUIBiometricController biometricTableViewHeader](&v9, sel_biometricTableViewHeader);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)resetFaceIDSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  PSLocalizablePearlStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel_deleteFaceIDIdentitiesCheckWithSpecifier_);
  objc_msgSend(v5, "setIdentifier:", CFSTR("PEARL_REMOVE_FACE"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A18]);

  return v5;
}

- (id)setupFaceIDSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE75590];
  PSLocalizablePearlStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel_enroll_);
  objc_msgSend(v5, "setIdentifier:", CFSTR("PEARL_ENROLL"));
  v6 = (void *)MEMORY[0x24BDD16E0];
  if (-[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed"))
    v7 = PSIsPearlInterlocked() ^ 1;
  else
    v7 = 0;
  objc_msgSend(v6, "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75A18]);

  return v5;
}

- (id)setupAlternateAppearanceSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  PSLocalizablePearlStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setButtonAction:", sel_validateBiometricTemplateUUIDAndEnroll_);
  objc_msgSend(v5, "setIdentifier:", CFSTR("UPDATE_APPEARANCE"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PSUIPearlPasscodeController isEnrollmentAvailable](self, "isEnrollmentAvailable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A18]);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  return v5;
}

- (id)unlockWithFaceMaskSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForIdentityType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_reduceWithInitialValue:reducer:", &unk_24F9EBA90, &__block_literal_global_149);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPearlPeriocular(CFSTR("UNLOCK_WITH_FACE_MASK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, sel_setPeriocularFaceIDMatchEnabled_specifier_, sel_isPeriocularFaceIDMatchEnabled_, 0, 6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIdentifier:", CFSTR("UNLOCK_WITH_FACE_MASK"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  if (objc_msgSend(v5, "integerValue")
    && -[PSUIPearlPasscodeController isPeriocularEnabled](self, "isPeriocularEnabled"))
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    PSUI_LocalizedStringForPearlPeriocular(CFSTR("GLASSES_COUNT_SECONDARY_LABEL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, objc_msgSend(v5, "integerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75D28]);

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BE75D28]);
  }

  return v8;
}

uint64_t __58__PSUIPearlPasscodeController_unlockWithFaceMaskSpecifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  v6 = objc_msgSend(a2, "secondaryPeriocularEnrollments");
  v7 = objc_msgSend(v5, "integerValue");

  return objc_msgSend(v4, "numberWithInteger:", v7 + v6);
}

- (id)addGlassesSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPearlPeriocular(CFSTR("ADD_GLASSES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("ADD_GLASSES"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "setButtonAction:", sel_enrollGlassesForExistingAppearance_);
  return v5;
}

- (id)enrollPeriocularAlternateAppearanceSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  PSUI_LocalizedStringForPearlPeriocular(CFSTR("UNLOCK_WITH_FACE_MASK_ALTERNATE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 13, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("UNLOCK_WITH_FACE_MASK_ALTERNATE"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v5, "setButtonAction:", sel_enrollPeriocularForExistingAppearance_);
  return v5;
}

- (id)faceIDSpecifiersWithPeriocular
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  char v8;
  void *v9;
  void *v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSUIPearlPasscodeController isEnrolled](self, "isEnrolled"))
  {
    +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identitiesForIdentityType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_167);
    v7 = objc_msgSend(v5, "na_all:", &__block_literal_global_168);
    if (-[PSUIPearlPasscodeController hasReachedMaximumBiometricEnrollmentCount](self, "hasReachedMaximumBiometricEnrollmentCount"))
    {
      v8 = objc_msgSend(v5, "na_all:", &__block_literal_global_169);
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PSUI_LocalizedStringForPearlPeriocular(CFSTR("UNLOCK_WITH_FACE_MASK_FOOTER"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE75A68];
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v9);
      -[PSUIPearlPasscodeController unlockWithFaceMaskSpecifier](self, "unlockWithFaceMaskSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

      if ((v7 & v6) == 1 && -[PSUIPearlPasscodeController isPeriocularEnabled](self, "isPeriocularEnabled"))
      {
        -[PSUIPearlPasscodeController addGlassesSpecifier](self, "addGlassesSpecifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

      }
      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PSUI_LocalizedStringForPearlPeriocular(CFSTR("UNLOCK_WITH_FACE_MASK_ALTERNATE_FOOTER"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v11);

        objc_msgSend(v3, "addObject:", v14);
        -[PSUIPearlPasscodeController enrollPeriocularAlternateAppearanceSpecifier](self, "enrollPeriocularAlternateAppearanceSpecifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

      }
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PSLocalizablePearlStringForKey();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v11);

      objc_msgSend(v3, "addObject:", v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PSLocalizablePearlStringForKey();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BE75A68];
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v9);
      -[PSUIPearlPasscodeController setupAlternateAppearanceSpecifier](self, "setupAlternateAppearanceSpecifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v22);

      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PSUI_LocalizedStringForPearlPeriocular(CFSTR("UNLOCK_WITH_FACE_MASK_FOOTER"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v21);

      objc_msgSend(v3, "addObject:", v17);
      -[PSUIPearlPasscodeController unlockWithFaceMaskSpecifier](self, "unlockWithFaceMaskSpecifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v24);

      if ((v7 & v6) == 1 && -[PSUIPearlPasscodeController isPeriocularEnabled](self, "isPeriocularEnabled"))
      {
        -[PSUIPearlPasscodeController addGlassesSpecifier](self, "addGlassesSpecifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v25);

      }
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v26);

    }
    -[PSUIPearlPasscodeController resetFaceIDSpecifier](self, "resetFaceIDSpecifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

    -[PSUIPearlPasscodeController setupFaceIDSpecifier](self, "setupFaceIDSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);
  }

  v28 = (void *)objc_msgSend(v3, "copy");
  return v28;
}

uint64_t __61__PSUIPearlPasscodeController_faceIDSpecifiersWithPeriocular__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPeriocularEnrollment");
}

uint64_t __61__PSUIPearlPasscodeController_faceIDSpecifiersWithPeriocular__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canAddPeriocularEnrollment");
}

uint64_t __61__PSUIPearlPasscodeController_faceIDSpecifiersWithPeriocular__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPeriocularEnrollment");
}

- (id)faceIDSpecifiers
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSUIPearlPasscodeController isEnrolled](self, "isEnrolled"))
  {
    v4 = -[PSUIPearlPasscodeController hasReachedMaximumBiometricEnrollmentCount](self, "hasReachedMaximumBiometricEnrollmentCount");
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PSLocalizablePearlStringForKey();
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v5);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75A68]);

      objc_msgSend(v3, "addObject:", v5);
      -[PSUIPearlPasscodeController setupAlternateAppearanceSpecifier](self, "setupAlternateAppearanceSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);

      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

    }
    -[PSUIPearlPasscodeController resetFaceIDSpecifier](self, "resetFaceIDSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

    -[PSUIPearlPasscodeController setupFaceIDSpecifier](self, "setupFaceIDSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  PSUIPearlAttentionGroupController *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  NSRange v46;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v45.receiver = self;
    v45.super_class = (Class)PSUIPearlPasscodeController;
    -[PSUIPasscodeLockController specifiers](&v45, sel_specifiers);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 != 6)
    {
      -[PSUIBiometricController placardSpecifier](self, "placardSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

    }
    -[PSUIBiometricController useBiometricForSpecifiers](self, "useBiometricForSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BE6E428];
    objc_msgSend(MEMORY[0x24BE6E3F8], "bundleWithIdentifier:", CFSTR("com.apple.onboarding.faceid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "flowWithBundle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = v13;
    objc_msgSend(v13, "localizedButtonTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PSLocalizablePearlStringForKey();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75A30]);

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A68]);
    v46.location = objc_msgSend(v15, "rangeOfString:", v14);
    NSStringFromRange(v46);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75A40]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75A50]);

    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("pearlLearnMoreTapped:"), *MEMORY[0x24BE75A38]);
    objc_msgSend(v5, "addObjectsFromArray:", v9);
    if (-[PSUIPearlPasscodeController isEnrolled](self, "isEnrolled")
      && -[PSUIPearlPasscodeController numberOfAppsUsingPearl](self, "numberOfAppsUsingPearl"))
    {
      v20 = (void *)MEMORY[0x24BE75590];
      PSLocalizablePearlStringForKey();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, sel_numberOfAppsUsingPearlDescription_, objc_opt_class(), 2, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setIdentifier:", *MEMORY[0x24BE75E38]);
      objc_msgSend(v5, "addObject:", v22);

    }
    if (_os_feature_enabled_impl()
      && (+[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24 = objc_msgSend(v23, "isPeriocularEnrollmentSupported"),
          v23,
          v24))
    {
      -[PSUIPearlPasscodeController faceIDSpecifiersWithPeriocular](self, "faceIDSpecifiersWithPeriocular");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PSUIPearlPasscodeController faceIDSpecifiers](self, "faceIDSpecifiers");
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v26 = (void *)v25;
    objc_msgSend(v5, "addObjectsFromArray:", v25);

    -[PSUIPearlPasscodeController attentionGroupController](self, "attentionGroupController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v28 = -[PSUIPearlAttentionGroupController initWithListController:groupSpecifier:]([PSUIPearlAttentionGroupController alloc], "initWithListController:groupSpecifier:", self, 0);
      -[PSUIPearlPasscodeController setAttentionGroupController:](self, "setAttentionGroupController:", v28);

    }
    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      PSUILogForCategory(1uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[PSUIPearlPasscodeController specifiers].cold.2();

    }
    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = *MEMORY[0x24BE75CC0];
    objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      PSUILogForCategory(1uLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[PSUIPearlPasscodeController specifiers].cold.1();

    }
    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPearlPasscodeController attentionGroupController](self, "attentionGroupController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPinCode:", v36);

    -[PSUIPearlPasscodeController attentionGroupController](self, "attentionGroupController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "specifiers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v39);

    objc_msgSend(v5, "addObjectsFromArray:", v44);
    v40 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PSUIPearlPasscodeController;
  v6 = a4;
  -[PSUIPasscodeLockController tableView:cellForRowAtIndexPath:](&v17, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIPearlPasscodeController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("PEARL_REMOVE_FACE")))
  {

  }
  else
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("REMOVE_GLASSES"));

    if (!v11)
    {
LABEL_8:
      v15 = v7;
      goto LABEL_9;
    }
  }
  v12 = v7;
  if (objc_msgSend(v12, "type") != 13)
  {

    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

LABEL_9:
  return v7;
}

- (id)passcodeController
{
  return objc_alloc_init(PSPearlPINController);
}

- (void)pushPasscodePane
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;
  _QWORD v20[5];

  if (-[PSUIPasscodeLockController shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests](self, "shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests"))
  {
    -[PSUIPearlPasscodeController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "navigationBar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBarStyle:", 0);

    objc_msgSend(v3, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setShadowImage:", v6);

    objc_msgSend(v3, "navigationBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setHidesShadow:", 0);

    -[PSUIPearlPasscodeController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(CFSTR("PMSET"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PSUI_LocalizedStringForPasscodeLock(CFSTR("ENTER_PASSCODE_PROMPT_FACE_ID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__PSUIPearlPasscodeController_pushPasscodePane__block_invoke;
    v20[3] = &unk_24F9E3BA8;
    v20[4] = self;
    -[PSUIPasscodeLockController showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:](self, "showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:", v8, v9, v10, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "sf_isiPad");

    if (v12)
    {
      v18 = objc_alloc_init(MEMORY[0x24BE858F0]);
      objc_msgSend(v18, "setPasscodeCreationDelegate:", self);
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBackgroundColor:", v13);

      -[PSUIPearlPasscodeController presentedViewController](self, "presentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelModalFlow);
      objc_msgSend(v18, "navigationItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLeftBarButtonItem:animated:", v16, 0);

      objc_msgSend(v15, "pushViewController:animated:", v18, 1);
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)PSUIPearlPasscodeController;
      -[PSUIBiometricController pushPasscodePane](&v19, sel_pushPasscodePane);
    }
  }
}

uint64_t __47__PSUIPearlPasscodeController_pushPasscodePane__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "cancelModalFlowWithCompletion:", 0);
  else
    return objc_msgSend(v2, "completeModalFlow");
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
    objc_msgSend(a4, "objectForKey:", &unk_24F9EBAA8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      -[PSUIPearlPasscodeController specifier](self, "specifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        PSUILogForCategory(1uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[PSUIPearlPasscodeController event:params:reply:].cold.2();

      }
      -[PSUIPearlPasscodeController specifier](self, "specifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x24BE75CC0];
      objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE75CC0]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        PSUILogForCategory(1uLL);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[PSUIPearlPasscodeController event:params:reply:].cold.1();

      }
      -[PSUIPearlPasscodeController authContext](self, "authContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIPearlPasscodeController specifier](self, "specifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __50__PSUIPearlPasscodeController_event_params_reply___block_invoke;
      v21[3] = &unk_24F9E40F0;
      v22 = v8;
      objc_msgSend(v17, "setCredential:forProcessedEvent:credentialType:reply:", v20, 2, -1, v21);

    }
  }

}

uint64_t __50__PSUIPearlPasscodeController_event_params_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)passcodeViewControllerAllowSkip:(id)a3
{
  return 0;
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFingerprintUnlockAllowed:passcode:completion:", 1, v5, 0);

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forSetting:", &unk_24F9EBA90, *MEMORY[0x24BE63A40]);

  -[PSUIPasscodeLockController updateGracePeriodSpecifier](self, "updateGracePeriodSpecifier");
  -[PSUIPearlPasscodeController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    PSUILogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController passcodeViewController:didFinishWithPasscodeCreation:].cold.2();

  }
  PSUILogForCategory(1uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22E0C8000, v11, OS_LOG_TYPE_DEFAULT, "passcodeViewController:didFinishWithPasscodeCreation: Saving passcode for specifier", v15, 2u);
    }

    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v5, *MEMORY[0x24BE75CC0]);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController passcodeViewController:didFinishWithPasscodeCreation:].cold.1();

    -[PSUIPearlPasscodeController specifier](self, "specifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removePropertyForKey:", *MEMORY[0x24BE75CC0]);
  }

  -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator](self, "faceIDEnrollmentCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator:finishedEnrollmentWithError:](self, "faceIDEnrollmentCoordinator:finishedEnrollmentWithError:", v14, 0);

  }
}

- (id)passcodeViewControllerCustomFirstEntryInstructions:(id)a3
{
  return (id)PSLocalizablePearlStringForKey();
}

- (void)cancelModalFlow
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSUIPearlPasscodeController;
  -[PSUIBiometricController cancelModalFlowWithCompletion:](&v2, sel_cancelModalFlowWithCompletion_, 0);
}

- (BOOL)isEnrollmentAvailable
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumIdentityCountForIdentityType:", 2);

  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identitiesForIdentityType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7 < v4 && -[PSUIBiometricController isBiometricEditingAllowed](self, "isBiometricEditingAllowed");
}

- (void)deleteFaceIDIdentitiesCheckWithSpecifier:(id)a3
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
    _os_log_impl(&dword_22E0C8000, v5, OS_LOG_TYPE_DEFAULT, "Face ID: User pressed Reset", (uint8_t *)buf, 2u);
  }

  -[PSUIPearlPasscodeController dtoController](self, "dtoController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRatchetEnabled");

  if (v7)
  {
    objc_initWeak(buf, self);
    -[PSUIPearlPasscodeController dtoController](self, "dtoController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke;
    v9[3] = &unk_24F9E3F70;
    objc_copyWeak(&v11, buf);
    v10 = v4;
    objc_msgSend(v8, "gateWithRatchetForOperation:forPresentingVC:completion:", 0, self, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }
  else
  {
    -[PSUIPearlPasscodeController proceedWithChecksToDeleteFaceIDWithSpecifier:](self, "proceedWithChecksToDeleteFaceIDWithSpecifier:", v4);
  }

}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
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
      __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_cold_1();

  }
  else
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_213;
    v4[3] = &unk_24F9E3E90;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

    objc_destroyWeak(&v6);
  }
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_213(uint64_t a1)
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
      _os_log_impl(&dword_22E0C8000, v4, OS_LOG_TYPE_DEFAULT, "Face ID: Resetting", v5, 2u);
    }

    objc_msgSend(WeakRetained, "proceedWithChecksToDeleteFaceIDWithSpecifier:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_213_cold_1();

  }
}

- (void)proceedWithChecksToDeleteFaceIDWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __76__PSUIPearlPasscodeController_proceedWithChecksToDeleteFaceIDWithSpecifier___block_invoke;
  v9 = &unk_24F9E3978;
  objc_copyWeak(&v10, &location);
  v5 = _Block_copy(&v6);
  -[PSUIPearlPasscodeController validateBiometricTemplateUUIDWithSpecifier:action:](self, "validateBiometricTemplateUUIDWithSpecifier:action:", v4, v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __76__PSUIPearlPasscodeController_proceedWithChecksToDeleteFaceIDWithSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentAlertForDeletingPearlIdentities");

}

- (void)presentAlertForDeletingPearlIdentities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  if (-[PSUIPearlPasscodeController hasMatchingBiometricTemplate](self, "hasMatchingBiometricTemplate")
    && -[PSUIBiometricController currentBiometricTemplateFetchStatus](self, "currentBiometricTemplateFetchStatus") != 4)
  {
    v3 = (void *)MEMORY[0x24BEBD3B0];
    PSLocalizablePearlStringForKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PSLocalizablePearlStringForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BEBD3A8];
    PSLocalizablePearlStringForKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __69__PSUIPearlPasscodeController_presentAlertForDeletingPearlIdentities__block_invoke;
    v13[3] = &unk_24F9E3EB8;
    v13[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v9);

    v10 = (void *)MEMORY[0x24BEBD3A8];
    PSLocalizablePearlStringForKey();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v12);

    -[PSUIPearlPasscodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    -[PSUIPearlPasscodeController deleteAllIdentities](self, "deleteAllIdentities");
  }
}

uint64_t __69__PSUIPearlPasscodeController_presentAlertForDeletingPearlIdentities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentSecondAlertForDeletingMatchedBiometricTemplate");
}

- (void)presentSecondAlertForDeletingMatchedBiometricTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  PSLocalizablePearlStringForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PSLocalizablePearlStringForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizablePearlStringForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __84__PSUIPearlPasscodeController_presentSecondAlertForDeletingMatchedBiometricTemplate__block_invoke;
  v13[3] = &unk_24F9E3EB8;
  v13[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  v10 = (void *)MEMORY[0x24BEBD3A8];
  PSLocalizablePearlStringForKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v12);

  -[PSUIPearlPasscodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

uint64_t __84__PSUIPearlPasscodeController_presentSecondAlertForDeletingMatchedBiometricTemplate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteAllIdentities");
}

- (void)deleteAllIdentities
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)PSUIPearlPasscodeController;
  -[PSUIBiometricController deleteGlobalAuthACL](&v16, sel_deleteGlobalAuthACL);
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForIdentityType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeIdentity:completion:", v10, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  if (_os_feature_enabled_impl())
    -[PSUIPearlPasscodeController configurePeriocularEnabled:](self, "configurePeriocularEnabled:", 0);

}

- (BOOL)faceIDEnrollmentCoordinatorShouldPresentInModalSheet:(id)a3
{
  return objc_msgSend((id)objc_opt_class(), "shouldPresentInModalSheet");
}

- (void)faceIDEnrollmentCoordinator:(id)a3 finishedEnrollmentWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PSUILogForCategory(1uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PSUIPearlPasscodeController faceIDEnrollmentCoordinator:finishedEnrollmentWithError:].cold.1((uint64_t)v7, v8, v9);

    -[PSUIBiometricController cancelModalFlowWithCompletion:](self, "cancelModalFlowWithCompletion:", 0);
    objc_msgSend(v6, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

    -[PSUIPearlPasscodeController setFaceIDEnrollmentCoordinator:](self, "setFaceIDEnrollmentCoordinator:", 0);
  }
  else if (-[PSUIPearlPasscodeController isEnrolled](self, "isEnrolled")
         && !-[PSUIBiometricController isPasscodeSet](self, "isPasscodeSet"))
  {
    -[PSUIBiometricController setModalFlowCancelCompletion:](self, "setModalFlowCancelCompletion:", &__block_literal_global_228);
    -[PSUIPearlPasscodeController pushPasscodePane](self, "pushPasscodePane");
  }
  else
  {
    if (-[PSUIPearlPasscodeController isEnrolled](self, "isEnrolled"))
      -[PSUIBiometricController completeModalFlow](self, "completeModalFlow");
    else
      -[PSUIBiometricController cancelModalFlowWithCompletion:](self, "cancelModalFlowWithCompletion:", 0);
    -[PSUIPearlPasscodeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

void __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identitiesForIdentityType:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v5);
        +[PSUIBiometrics sharedInstance](PSUIBiometrics, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeIdentity:completion:", v6, &__block_literal_global_229);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

void __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PSUILogForCategory(1uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke_2_cold_1(v4, v5);

  }
}

- (void)faceIDEnrollmentCoordinatorDidDismiss:(id)a3
{
  -[PSUIPearlPasscodeController setFaceIDEnrollmentCoordinator:](self, "setFaceIDEnrollmentCoordinator:", 0);
}

- (PSUIFaceIDEnrollmentCoordinator)faceIDEnrollmentCoordinator
{
  return self->_faceIDEnrollmentCoordinator;
}

- (void)setFaceIDEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_faceIDEnrollmentCoordinator, a3);
}

- (PSSpecifier)enrollFaceSpecifier
{
  return self->_enrollFaceSpecifier;
}

- (void)setEnrollFaceSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_enrollFaceSpecifier, a3);
}

- (PSUIPearlAttentionGroupController)attentionGroupController
{
  return self->_attentionGroupController;
}

- (void)setAttentionGroupController:(id)a3
{
  objc_storeStrong((id *)&self->_attentionGroupController, a3);
}

- (void)setAuthContext:(id)a3
{
  objc_storeStrong((id *)&self->_authContext, a3);
}

- (OBPrivacyPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_presenter, a3);
}

- (PSSpecifier)currentlyPresentingPearlEnrollSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1584, 1);
}

- (void)setCurrentlyPresentingPearlEnrollSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1584);
}

- (BOOL)isEnrollingInPeriocular
{
  return self->_isEnrollingInPeriocular;
}

- (void)setIsEnrollingInPeriocular:(BOOL)a3
{
  self->_isEnrollingInPeriocular = a3;
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
  objc_storeStrong((id *)&self->_currentlyPresentingPearlEnrollSpecifier, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_attentionGroupController, 0);
  objc_storeStrong((id *)&self->_enrollFaceSpecifier, 0);
  objc_storeStrong((id *)&self->_faceIDEnrollmentCoordinator, 0);
}

void __76__PSUIPearlPasscodeController_refetchBiometricTemplateWithSpecifier_action___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Failed to refetch biometric templates data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not enrolling as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __38__PSUIPearlPasscodeController_enroll___block_invoke_86_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not enrolling as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedToEnrollWithSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedToEnrollWithSpecifier: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedToEnrollWithSpecifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedToEnrollWithSpecifier: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not enrolling with Add Glasses as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__PSUIPearlPasscodeController_enrollGlassesForExistingAppearance___block_invoke_117_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not enrolling with Add Glasses as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedToEnrollGlassesForExistingAppearance:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedToEnrollGlassesForExistingAppearance: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedToEnrollGlassesForExistingAppearance:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedToEnrollGlassesForExistingAppearance: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not enrolling periocular for existing appearance as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__PSUIPearlPasscodeController_enrollPeriocularForExistingAppearance___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not enrolling periocular for existing appearance as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedToEnrollPeriocularForExistingAppearance:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedToEnrollPeriocularForExistingAppearance: No passcode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)proceedToEnrollPeriocularForExistingAppearance:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "proceedToEnrollPeriocularForExistingAppearance: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)numberOfAppsUsingPearlDescription:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v2;
  OUTLINED_FUNCTION_3(&dword_22E0C8000, a1, v3, "invalid number of apps: %@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)specifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Pearl specifiers setup: No specifier", v2, v3, v4, v5, v6);
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

- (void)passcodeViewController:didFinishWithPasscodeCreation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "passcodeViewController:didFinishWithPasscodeCreation: Removing passcode for specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)passcodeViewController:didFinishWithPasscodeCreation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "passcodeViewController:didFinishWithPasscodeCreation: No specifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not resetting as we are Ratcheted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __72__PSUIPearlPasscodeController_deleteFaceIDIdentitiesCheckWithSpecifier___block_invoke_213_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "Face ID: Not resetting as we are missing instance (self)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)faceIDEnrollmentCoordinator:(uint64_t)a3 finishedEnrollmentWithError:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_22E0C8000, a2, a3, "Enroll failed with error: %@", (uint8_t *)&v3);
}

void __87__PSUIPearlPasscodeController_faceIDEnrollmentCoordinator_finishedEnrollmentWithError___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_22E0C8000, a2, v4, "Unable to remove BKIdentity %@.", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2_0();
}

@end
