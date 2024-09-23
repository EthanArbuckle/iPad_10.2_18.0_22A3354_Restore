@implementation SBPasscodeAlertItem

- (SBPasscodeAlertItem)initWithPasscodeMode:(int)a3 unlockScreenType:(int)a4 simplePasscodeType:(int)a5
{
  SBPasscodeAlertItem *v8;
  SBPasscodeAlertItem *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBPasscodeAlertItem;
  v8 = -[SBAlertItem init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    v8->_unlockScreenType = a4;
    v8->_simplePasscodeType = a5;
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_hasEmergencyCall = objc_msgSend(v10, "hasCellularTelephony");

    v9->_alreadySubmittedPassword = 0;
  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[SBAlertItem alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setDelegate:", 0);
    objc_msgSend(v5, "removeTarget:action:forControlEvents:", self, sel_submitPassword, 0x80000);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBPasscodeAlertItem;
  -[SBPasscodeAlertItem dealloc](&v6, sel_dealloc);
}

- (void)submitPassword
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_alreadySubmittedPassword)
  {
    self->_alreadySubmittedPassword = 1;
    -[SBAlertItem alertController](self, "alertController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_passwordEntered:", v6);

  }
}

- (void)makeEmergencyCall
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inCall");

  if (v3)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inCallPresentationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reactivateInCallForReason:", 3);

  }
  else
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasPasscodeSet"))
      objc_msgSend(v4, "revokeAuthenticationImmediatelyForPublicReason:", CFSTR("PasscodeController - makeEmergencyCall"));
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_100);
  }

  +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_abort");

}

void __40__SBPasscodeAlertItem_makeEmergencyCall__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v1;
  v9[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v2;
  v9[2] = CFSTR("SBUILockOptionsForceLockKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lockUIFromSource:withOptions:", 9, v4);

  v5 = dispatch_walltime(0, 250000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SBPasscodeAlertItem_makeEmergencyCall__block_invoke_2;
  v7[3] = &unk_1E8E9DED8;
  v8 = v0;
  v6 = v0;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v7);

}

void __40__SBPasscodeAlertItem_makeEmergencyCall__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "lockScreenEnvironment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "launchEmergencyDialer");

}

- (void)_clearAlertController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBAlertItem alertController](self, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setDelegate:", 0);
        objc_msgSend(v9, "removeTarget:action:forControlEvents:", self, sel_submitPassword, 0x80000);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)SBPasscodeAlertItem;
  -[SBAlertItem _clearAlertController](&v10, sel__clearAlertController);
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int mode;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  __CFString *v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem alertController](self, "alertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(v6, "textFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPasscodeAlertItem configureTextField:](self, "configureTextField:", v11);

  }
  else
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke;
    v36[3] = &unk_1E8EA8DE8;
    v36[4] = self;
    objc_msgSend(v6, "addTextFieldWithConfigurationHandler:", v36);
  }
  mode = self->_mode;
  v13 = CFSTR("PASSCODE_ALERT_NEXT");
  if (mode == 2)
  {
    v15 = CFSTR("CONFIRM_NEW_PASSCODE");
    v16 = v5;
LABEL_9:
    objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v17);
LABEL_10:

    goto LABEL_13;
  }
  if (mode != 1)
  {
    if (mode)
      goto LABEL_15;
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ENTER_CURRENT_PASSCODE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v14);

    v15 = CFSTR("PASSCODE_ALERT_TITLE");
    v16 = v5;
    goto LABEL_9;
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ENTER_NEW_PASSCODE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v18);

  if (!self->_errorString)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedDescriptionOfDefaultNewPasscodeConstraints");
    v32 = v9;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMessage:", v33);

    v9 = v32;
    goto LABEL_10;
  }
  objc_msgSend(v6, "setMessage:");
LABEL_13:
  if (self->_mode == 2)
    v13 = CFSTR("PASSCODE_ALERT_DONE");
LABEL_15:
  objc_msgSend(v5, "localizedStringForKey:value:table:", v13, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0x1E0CEA000uLL;
  if (self->_hasEmergencyCall)
  {
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "inCall");
    v23 = CFSTR("PASSCODE_ALERT_EMERGENCY");
    if (v22)
      v23 = CFSTR("PASSCODE_ALERT_CANCEL");
    v24 = v9;
    v25 = v23;

    v26 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v5, "localizedStringForKey:value:table:", v25, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v24;
    v35[0] = v24;
    v35[1] = 3221225472;
    v35[2] = __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v35[3] = &unk_1E8E9DCB0;
    v35[4] = self;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 1, v35);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v28);

    v20 = 0x1E0CEA000;
    v29 = 0;
  }
  else
  {
    v29 = 1;
  }
  v30 = *(void **)(v20 + 736);
  v34[0] = v9;
  v34[1] = 3221225472;
  v34[2] = __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  v34[3] = &unk_1E8E9DCB0;
  v34[4] = self;
  objc_msgSend(v30, "actionWithTitle:style:handler:", v19, v29, v34);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v31);

}

uint64_t __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureTextField:", a2);
}

uint64_t __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeEmergencyCall");
}

uint64_t __59__SBPasscodeAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "submitPassword");
}

- (void)configureTextField:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setSecureTextEntry:", 1);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_submitPassword, 0x80000);
  objc_msgSend(v4, "setKeyboardAppearance:", 1);
  objc_msgSend(v4, "setKeyboardType:", 4 * (self->_unlockScreenType != 2));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  int simplePasscodeType;
  void *v13;
  unint64_t v14;
  BOOL v15;

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  if (self->_unlockScreenType)
    goto LABEL_8;
  simplePasscodeType = self->_simplePasscodeType;
  if (simplePasscodeType == 1)
  {
    v14 = 6;
  }
  else
  {
    if (simplePasscodeType == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPasscodeController.m"), 191, CFSTR("Illegal condition: unlock type is simple, but no simple passcode type detected."));

    }
    v14 = 4;
  }
  if (location + length < v14)
LABEL_8:
    v15 = 1;
  else
    v15 = objc_msgSend(v11, "length") == 0;

  return v15;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (void)_setErrorString:(id)a3
{
  objc_storeStrong((id *)&self->_errorString, a3);
}

- (void)didEndCall
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  if (self->_hasEmergencyCall)
  {
    -[SBAlertItem alertController](self, "alertController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ALERT_EMERGENCY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C99DE8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __33__SBPasscodeAlertItem_didEndCall__block_invoke;
    v13[3] = &unk_1E8E9DCB0;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v6, 1, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      v10 = 1;
      do
      {
        objc_msgSend(v4, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

        ++v10;
      }
      while (v10 < objc_msgSend(v4, "count"));
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setActions:", v12);

  }
}

uint64_t __33__SBPasscodeAlertItem_didEndCall__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeEmergencyCall");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
}

@end
