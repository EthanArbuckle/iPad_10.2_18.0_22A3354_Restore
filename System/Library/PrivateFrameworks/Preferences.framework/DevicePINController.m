@implementation DevicePINController

+ (BOOL)settingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (void)willUnlock
{
  if (-[DevicePINController useProgressiveDelays](self, "useProgressiveDelays"))
  {
    -[DevicePINController _rereadBlockedState](self, "_rereadBlockedState");
    -[DevicePINController _updateUI](self, "_updateUI");
  }
}

- (DevicePINController)init
{
  DevicePINController *v2;
  DevicePINController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DevicePINController;
  v2 = -[PSViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[DevicePINController useProgressiveDelays](v2, "useProgressiveDelays"))
      CFPreferencesAppSynchronize(-[DevicePINController defaultsID](v3, "defaultsID"));
    v3->_mode = 1000;
    v3->_shouldDismissWhenDone = 1;
  }
  return v3;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DevicePINController;
  -[PSViewController setSpecifier:](&v7, sel_setSpecifier_, v4);
  WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);

  if (!WeakRetained)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("PINControllerDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&self->_pinDelegate, v6);

    objc_msgSend(v4, "removePropertyForKey:", CFSTR("PINControllerDelegate"));
  }
  -[DevicePINController overallContentSizeForViewInPopover](self, "overallContentSizeForViewInPopover");
  -[DevicePINController setPreferredContentSize:](self, "setPreferredContentSize:");

}

- (void)setMode:(int)a3
{
  NSNumber *pinLength;
  NSNumber *numericPIN;
  NSNumber *requiresKeyboard;
  NSNumber *simplePIN;

  self->_mode = a3;
  pinLength = self->_pinLength;
  self->_pinLength = 0;

  numericPIN = self->_numericPIN;
  self->_numericPIN = 0;

  requiresKeyboard = self->_requiresKeyboard;
  self->_requiresKeyboard = 0;

  simplePIN = self->_simplePIN;
  self->_simplePIN = 0;

}

- (int)mode
{
  return self->_mode;
}

- (CGSize)overallContentSizeForViewInPopover
{
  _BOOL4 v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[DevicePINController requiresKeyboard](self, "requiresKeyboard");
  v3 = 264.0;
  if (!v2)
    v3 = 480.0;
  v4 = 320.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)_dismiss
{
  void *v3;
  id WeakRetained;
  _QWORD v5[5];

  self->_hasBeenDismissed = 1;
  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  -[PSEditingPane dismissKeypad](self->super._pane, "dismissKeypad");
  if (self->_shouldDismissWhenDone)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._parentController);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __31__DevicePINController__dismiss__block_invoke;
    v5[3] = &unk_1E4A654F0;
    v5[4] = self;
    objc_msgSend(WeakRetained, "dismissWithCompletion:", v5);

  }
}

void __31__DevicePINController__dismiss__block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
    objc_msgSend(v4, "devicePINControllerDidDismissPINPane:", *(_QWORD *)(a1 + 32));

  }
}

- (id)stringsTable
{
  return CFSTR("PIN Entry");
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (id)localizedPINStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DevicePINController stringsBundle](self, "stringsBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicePINController stringsTable](self, "stringsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E4A69238, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    PS_LocalizedStringForPINEntry(v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PSEditingPane dismissKeypad](self->super._pane, "dismissKeypad");
  v3.receiver = self;
  v3.super_class = (Class)DevicePINController;
  -[PSDetailController dealloc](&v3, sel_dealloc);
}

- (void)setOldPassword:(id)a3
{
  objc_storeStrong((id *)&self->_oldPassword, a3);
}

- (void)setLastEntry:(id)a3
{
  objc_storeStrong((id *)&self->_lastEntry, a3);
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v6 = a3;
  if (a4)
    *a4 = 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "passcode:meetsCurrentConstraintsOutError:", v6, a4);

  if (!v8)
  {
    LOBYTE(v16) = 0;
    goto LABEL_10;
  }
  -[DevicePINController pinDelegate](self, "pinDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE6E3CA8) & 1) == 0)
  {

    goto LABEL_9;
  }
  -[DevicePINController pinDelegate](self, "pinDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("passcode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    v16 = !-[DevicePINController validatePIN:](self, "validatePIN:", v6);
    goto LABEL_10;
  }
  -[DevicePINController pinDelegate](self, "pinDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "specifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("passcode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v6) ^ 1;

LABEL_10:
  return v16;
}

- (void)setPIN:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  NSString *v16;
  _QWORD block[4];
  NSString *v18;
  id v19;
  id v20;
  DevicePINController *v21;
  id v22;
  uint64_t v23;
  int v24;

  v6 = a3;
  v7 = a4;
  -[DevicePINController _createAndShowAnimatedNavBarSpinner](self, "_createAndShowAnimatedNavBarSpinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_showingSpinner = 1;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.Preferences.passcode"), 0);

  LODWORD(v9) = -[DevicePINController mode](self, "mode");
  v11 = self->_oldPassword;
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DevicePINController_setPIN_completion___block_invoke;
  block[3] = &unk_1E4A675B8;
  v24 = (int)v9;
  v18 = v11;
  v19 = v6;
  v20 = v8;
  v21 = self;
  v22 = v7;
  v23 = v10;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v16 = v11;
  dispatch_async(v12, block);

}

void __41__DevicePINController_setPIN_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  uint64_t *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_DWORD *)(a1 + 80);
  if (v3 == 1)
  {
    _PSLoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v10, OS_LOG_TYPE_DEFAULT, "Removing passcode...", buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v28 = 0;
    v7 = (id *)&v28;
    v8 = &v28;
    v9 = v2;
    v6 = 0;
  }
  else if (v3 == 2)
  {
    _PSLoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v4, OS_LOG_TYPE_DEFAULT, "Changing passcode...", buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v29 = 0;
    v7 = (id *)&v29;
    v8 = &v29;
    v9 = v2;
  }
  else
  {
    _PSLoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_DEFAULT, "Setting passcode...", buf, 2u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    v27 = 0;
    v7 = (id *)&v27;
    v8 = &v27;
    v9 = v2;
    v5 = 0;
  }
  v12 = objc_msgSend(v9, "changePasscodeFrom:to:outError:", v5, v6, v8);
  v13 = *v7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__DevicePINController_setPIN_completion___block_invoke_115;
  v18[3] = &unk_1E4A67590;
  v26 = v12;
  v24 = *(_QWORD *)(a1 + 72);
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(void **)(a1 + 64);
  v19 = v14;
  v20 = v15;
  v23 = v16;
  v21 = v13;
  v25 = *(_DWORD *)(a1 + 80);
  v22 = *(id *)(a1 + 40);
  v17 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

void __41__DevicePINController_setPIN_completion___block_invoke_115(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  if (!*(_BYTE *)(a1 + 84))
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveDeviceUnlockPasscodeInputModes");

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(a1 + 72));

  if (!*(_BYTE *)(a1 + 84))
    goto LABEL_4;
  if (*(_DWORD *)(a1 + 80) != 1)
  {
    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 56);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__DevicePINController_setPIN_completion___block_invoke_2;
    v12[3] = &unk_1E4A67568;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v13 = v7;
    v14 = v8;
    v9 = *(id *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    v15 = v9;
    v16 = v10;
    objc_msgSend(v4, "promptForDevicePasscodeChangeToPasscode:overController:completion:", v5, v6, v12);

  }
  else
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1129) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endBackgroundTask:", *(_QWORD *)(a1 + 72));

  }
}

void __41__DevicePINController_setPIN_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__DevicePINController_setPIN_completion___block_invoke_3;
  v10[3] = &unk_1E4A67540;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v16 = a2;
  v13 = v5;
  v14 = v8;
  v15 = *(_QWORD *)(a1 + 56);
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __41__DevicePINController_setPIN_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1129) = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 64));

}

- (id)_createAndShowAnimatedNavBarSpinner
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v3);
  -[DevicePINController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  objc_msgSend(v3, "startAnimating");
  return v3;
}

- (BOOL)validatePIN:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v8;

  v3 = (void *)MEMORY[0x1E0D47230];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isPasscodeSet"))
  {
    v8 = 0;
    v6 = objc_msgSend(v5, "unlockDeviceWithPasscode:outError:", v4, &v8);

    v4 = v8;
  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", &stru_1E4A69238);
  }

  return v6;
}

- (BOOL)useProgressiveDelays
{
  return 1;
}

- (__CFString)defaultsID
{
  return CFSTR("com.apple.springboard");
}

- (__CFString)failedAttemptsKey
{
  return CFSTR("SBDeviceLockFailedAttempts");
}

- (__CFString)blockTimeIntervalKey
{
  return CFSTR("SBDeviceLockBlockTimeIntervalSinceReferenceDate");
}

- (__CFString)blockedStateKey
{
  return CFSTR("SBDeviceLockBlocked");
}

- (int)_getScreenType
{
  void *v2;
  int v3;
  int v4;
  int v6;

  if (-[DevicePINController isCreatingPasscode](self, "isCreatingPasscode"))
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unlockScreenType");
  }
  v4 = v3;

  return v4;
}

- (int)_simplePasscodeType
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  int v6;

  v6 = 0;
  v2 = -[DevicePINController isCreatingPasscode](self, "isCreatingPasscode");
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v6);
  else
    objc_msgSend(v3, "unlockScreenTypeWithOutSimplePasscodeType:", &v6);

  return v6;
}

- (void)setRequiresKeyboard:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *requiresKeyboard;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  requiresKeyboard = self->_requiresKeyboard;
  self->_requiresKeyboard = v4;

}

- (void)setPinLength:(int)a3
{
  NSNumber *v4;
  NSNumber *pinLength;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pinLength = self->_pinLength;
  self->_pinLength = v4;

}

- (void)setSimplePIN:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *simplePIN;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  simplePIN = self->_simplePIN;
  self->_simplePIN = v4;

}

- (void)setNumericPIN:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *numericPIN;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  numericPIN = self->_numericPIN;
  self->_numericPIN = v4;

}

- (BOOL)requiresKeyboard
{
  NSNumber *requiresKeyboard;
  void *v5;
  void *v6;

  requiresKeyboard = self->_requiresKeyboard;
  if (requiresKeyboard)
    return -[NSNumber BOOLValue](requiresKeyboard, "BOOLValue");
  if (!PSUsePadStylePIN())
    return 1;
  if (self->_mode == 1000)
  {
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("mode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("mode"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      self->_mode = objc_msgSend(v6, "intValue");

    }
  }
  return !-[DevicePINController isNumericPIN](self, "isNumericPIN");
}

- (BOOL)simplePIN
{
  if (self->_simplePIN)
    return -[NSNumber BOOLValue](self->_simplePIN, "BOOLValue");
  else
    return -[DevicePINController _getScreenType](self, "_getScreenType") == 0;
}

- (int)defaultPinLength
{
  int v2;

  v2 = 6;
  if ((PSSupportsMesa() & 1) == 0)
  {
    if (PSIsPearlAvailable())
      return 6;
    else
      return 4;
  }
  return v2;
}

- (int)pinLength
{
  NSNumber *pinLength;

  pinLength = self->_pinLength;
  if (pinLength)
    return -[NSNumber intValue](pinLength, "intValue");
  if (-[DevicePINController _simplePasscodeType](self, "_simplePasscodeType") == 1)
    return 6;
  if (-[DevicePINController isCreatingPasscode](self, "isCreatingPasscode"))
    return -[DevicePINController defaultPinLength](self, "defaultPinLength");
  return 4;
}

- (BOOL)isCreatingPasscode
{
  int mode;

  mode = self->_mode;
  if (!mode)
    return 1;
  if (mode == 2)
    return self->_substate > 1;
  return 0;
}

- (BOOL)isNumericPIN
{
  if (self->_numericPIN)
    return -[NSNumber BOOLValue](self->_numericPIN, "BOOLValue");
  else
    return -[DevicePINController _getScreenType](self, "_getScreenType") != 2;
}

- (BOOL)_useSEPLockInfo
{
  int64_t *p_sepOnceToken;
  _QWORD block[5];

  p_sepOnceToken = &self->_sepOnceToken;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DevicePINController__useSEPLockInfo__block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  if (*p_sepOnceToken != -1)
    dispatch_once(p_sepOnceToken, block);
  return self->_useSEPLockInfo;
}

void __38__DevicePINController__useSEPLockInfo__block_invoke(uint64_t a1)
{
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "useProgressiveDelays")
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "defaultsID"), "isEqualToString:", CFSTR("com.apple.springboard"))&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "failedAttemptsKey"), "isEqualToString:", CFSTR("SBDeviceLockFailedAttempts"))&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "blockTimeIntervalKey"), "isEqualToString:", CFSTR("SBDeviceLockBlockTimeIntervalSinceReferenceDate"))&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "blockedStateKey"), "isEqualToString:", CFSTR("SBDeviceLockBlocked"))&& MGGetBoolAnswer())
  {
    objc_msgSend(*(id *)(a1 + 32), "_sepLockInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1128) = 1;
  }
}

- (id)_sepLockInfo
{
  NSDictionary *sepLockInfo;
  NSDictionary *v4;
  NSDictionary *v5;

  sepLockInfo = self->_sepLockInfo;
  if (!sepLockInfo)
  {
    v4 = (NSDictionary *)MKBGetDeviceLockStateInfo();
    v5 = self->_sepLockInfo;
    self->_sepLockInfo = v4;

    sepLockInfo = self->_sepLockInfo;
  }
  return sepLockInfo;
}

- (void)_invalidateSEPLockInfo
{
  NSDictionary *sepLockInfo;

  sepLockInfo = self->_sepLockInfo;
  self->_sepLockInfo = 0;

}

- (void)_rereadBlockedState
{
  if (-[DevicePINController _useSEPLockInfo](self, "_useSEPLockInfo"))
    -[DevicePINController _invalidateSEPLockInfo](self, "_invalidateSEPLockInfo");
  else
    CFPreferencesAppSynchronize(-[DevicePINController defaultsID](self, "defaultsID"));
}

- (int64_t)numberOfFailedAttempts
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!-[DevicePINController _useSEPLockInfo](self, "_useSEPLockInfo"))
    return CFPreferencesGetAppIntegerValue(-[DevicePINController failedAttemptsKey](self, "failedAttemptsKey"), -[DevicePINController defaultsID](self, "defaultsID"), 0);
  -[DevicePINController _sepLockInfo](self, "_sepLockInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "longValue");
  return v5;
}

- (void)_setNumberOfFailedAttempts:(int64_t)a3
{
  __CFString *v5;
  void *value;

  if (-[DevicePINController _useSEPLockInfo](self, "_useSEPLockInfo"))
  {
    -[DevicePINController _invalidateSEPLockInfo](self, "_invalidateSEPLockInfo");
  }
  else
  {
    v5 = -[DevicePINController defaultsID](self, "defaultsID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
    value = (void *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(-[DevicePINController failedAttemptsKey](self, "failedAttemptsKey"), value, v5);
    CFPreferencesAppSynchronize(v5);

  }
}

- (void)_clearBlockedState
{
  __CFString *v3;
  __CFString *v4;

  if (-[DevicePINController _useSEPLockInfo](self, "_useSEPLockInfo"))
  {
    -[DevicePINController _invalidateSEPLockInfo](self, "_invalidateSEPLockInfo");
  }
  else
  {
    v3 = -[DevicePINController defaultsID](self, "defaultsID");
    CFPreferencesSetAppValue(-[DevicePINController failedAttemptsKey](self, "failedAttemptsKey"), 0, v3);
    CFPreferencesSetAppValue(-[DevicePINController blockTimeIntervalKey](self, "blockTimeIntervalKey"), 0, v3);
    v4 = -[DevicePINController blockedStateKey](self, "blockedStateKey");
    CFPreferencesSetAppValue(v4, (CFPropertyListRef)*MEMORY[0x1E0C9AE40], v3);
    CFPreferencesAppSynchronize(v3);
  }
}

- (double)unblockTime
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  if (self->_useSEPLockInfo)
  {
    -[DevicePINController blockedTimeRemaining](self, "blockedTimeRemaining");
    if (v6 > 0.0)
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      return v7 + v8;
    }
  }
  else
  {
    v9 = (void *)CFPreferencesCopyAppValue(-[DevicePINController blockTimeIntervalKey](self, "blockTimeIntervalKey"), -[DevicePINController defaultsID](self, "defaultsID"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v5 = v11;
    }

  }
  return v5;
}

- (double)blockedTimeRemaining
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  if (-[DevicePINController _useSEPLockInfo](self, "_useSEPLockInfo"))
  {
    -[DevicePINController _invalidateSEPLockInfo](self, "_invalidateSEPLockInfo");
    -[DevicePINController _sepLockInfo](self, "_sepLockInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D4E5B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    return v6;
  }
  else
  {
    v8 = -[DevicePINController useProgressiveDelays](self, "useProgressiveDelays");
    result = 0.0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0.0);
      v10 = v9;
      -[DevicePINController unblockTime](self, "unblockTime");
      v12 = v11 - v10;
      v13 = v10 < v11;
      result = 0.0;
      if (v13)
        return v12;
    }
  }
  return result;
}

- (BOOL)isBlocked
{
  double v2;

  -[DevicePINController blockedTimeRemaining](self, "blockedTimeRemaining");
  return v2 > 0.0;
}

- (void)_setUnblockTime:(double)a3
{
  __CFString *v5;
  void *value;

  v5 = -[DevicePINController defaultsID](self, "defaultsID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  value = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(-[DevicePINController blockTimeIntervalKey](self, "blockTimeIntervalKey"), value, v5);
  CFPreferencesAppSynchronize(v5);

}

- (double)_secondsToBlockForFailedAttempts:(int64_t)a3
{
  double result;
  unint64_t v4;

  result = 0.0;
  v4 = a3 - 6;
  if (a3 >= 6)
  {
    if (v4 > 2)
      return 3600.0;
    else
      return dbl_1A38ECE58[v4];
  }
  return result;
}

- (void)_adjustUnblockTime
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueRestrictionForFeature:", *MEMORY[0x1E0D470B8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
    v4 = objc_msgSend(v9, "longValue");
  else
    v4 = -1;
  v5 = -[DevicePINController numberOfFailedAttempts](self, "numberOfFailedAttempts");
  -[DevicePINController _setNumberOfFailedAttempts:](self, "_setNumberOfFailedAttempts:", v5 + 1);
  if ((v4 & 0x8000000000000000) == 0 && v5 >= v4)
  {
    v6 = 3600.0;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[DevicePINController _setUnblockTime:](self, "_setUnblockTime:", v6 + v8);
    goto LABEL_9;
  }
  -[DevicePINController _secondsToBlockForFailedAttempts:](self, "_secondsToBlockForFailedAttempts:", v5 + 1);
  v6 = v7;
  if (v7 != 0.0)
    goto LABEL_8;
LABEL_9:

}

- (BOOL)attemptValidationWithPIN:(id)a3
{
  _BOOL4 v4;

  v4 = -[DevicePINController validatePIN:](self, "validatePIN:", a3);
  if (v4)
  {
    -[DevicePINController _clearBlockedState](self, "_clearBlockedState");
  }
  else if (!-[DevicePINController _useSEPLockInfo](self, "_useSEPLockInfo")
         && -[DevicePINController useProgressiveDelays](self, "useProgressiveDelays"))
  {
    -[DevicePINController _adjustUnblockTime](self, "_adjustUnblockTime");
  }
  return v4;
}

- (void)suspend
{
  +[DevicePINController cancelPreviousPerformRequestsWithTarget:](DevicePINController, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)_showFailedAttempts
{
  int mode;
  BOOL v4;
  _BOOL4 v5;

  mode = self->_mode;
  if (mode == 2)
  {
    v4 = self->_substate == 3;
  }
  else
  {
    if (!mode)
    {
      -[DevicePINController useProgressiveDelays](self, "useProgressiveDelays");
      goto LABEL_9;
    }
    v4 = 0;
  }
  v5 = -[DevicePINController useProgressiveDelays](self, "useProgressiveDelays");
  if (!v4 && v5)
    -[PSEditingPane showFailedAttempts:](self->super._pane, "showFailedAttempts:", -[DevicePINController numberOfFailedAttempts](self, "numberOfFailedAttempts"));
LABEL_9:
  if (-[DevicePINController isBlocked](self, "isBlocked"))
    -[DevicePINController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateUI, 0, 30.0);
}

- (void)_updateErrorTextAndFailureCount:(BOOL)a3
{
  _BOOL4 v4;
  NSString *v5;
  NSString *error1;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *error2;
  NSString *v23;

  v4 = -[DevicePINController isBlocked](self, "isBlocked");
  if (!self->_error1)
  {
    -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", CFSTR("WRONG_1"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    error1 = self->_error1;
    self->_error1 = v5;

  }
  HIDWORD(v7) = 0;
  if (!self->_error2)
  {
    -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", CFSTR("WRONG_2"));
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    error2 = self->_error2;
    self->_error2 = v21;

    if (v4)
      goto LABEL_5;
LABEL_13:
    v23 = self->_error2;
    +[DevicePINController cancelPreviousPerformRequestsWithTarget:](DevicePINController, "cancelPreviousPerformRequestsWithTarget:", self);
    goto LABEL_14;
  }
  if (!v4)
    goto LABEL_13;
LABEL_5:
  -[DevicePINController unblockTime](self, "unblockTime");
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v11 = (v9 - v10) / 60.0;
  v12 = v11;
  LODWORD(v7) = vcvtps_s32_f32(v12);
  v13 = (v11 - (double)((int)v7 - 1)) * 60.0;
  v14 = CFSTR("MULTIPLE_MINUTES_TO_UNBLOCK");
  if ((int)v7 <= 1)
    v14 = 0;
  if ((_DWORD)v7 == 1)
    v15 = CFSTR("ONE_MINUTE_TO_UNBLOCK");
  else
    v15 = v14;
  v16 = (void *)MEMORY[0x1E0CB3940];
  -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringFromNumber:numberStyle:", v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v17, v20);
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();

  +[DevicePINController cancelPreviousPerformRequestsWithTarget:](DevicePINController, "cancelPreviousPerformRequestsWithTarget:", self);
  if (v13 > 0.0)
    -[DevicePINController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateUI, 0, v13);
LABEL_14:
  -[PSEditingPane showError:error:isBlocked:animate:](self->super._pane, "showError:error:isBlocked:animate:", self->_error1);
  if (-[DevicePINController numberOfFailedAttempts](self, "numberOfFailedAttempts") < 1)
    -[PSEditingPane hideFailedAttempts](self->super._pane, "hideFailedAttempts");
  else
    -[DevicePINController _showFailedAttempts](self, "_showFailedAttempts");

}

- (void)_updateUI
{
  -[DevicePINController _updateErrorTextAndFailureCount:](self, "_updateErrorTextAndFailureCount:", 1);
  if (!-[DevicePINController isBlocked](self, "isBlocked"))
    -[PSEditingPane hideError](self->super._pane, "hideError");
}

- (void)_showUnacceptablePINError:(id)a3 password:(id)a4
{
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[DevicePINController validatePIN:](self, "validatePIN:", a4))
  {
    -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", CFSTR("CANNOT_REUSE_PASSCODE"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D471E0]);

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedDescriptionOfCurrentPasscodeConstraints");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v11, "localizedDescription");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
LABEL_7:
  -[PSEditingPane setPINPolicyString:visible:](self->super._pane, "setPINPolicyString:visible:", v9, 1);

}

- (void)_showPINConfirmationError
{
  id v3;

  -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", CFSTR("CONFIRMATION_FAILURE"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PSEditingPane setPINPolicyString:visible:](self->super._pane, "setPINPolicyString:visible:", v3, 1);

}

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return 0;
}

- (void)optionsTapped
{
  id v2;

  -[PSEditingPane pinView](self->super._pane, "pinView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionsButtonTapped");

}

- (void)setPinBlocked:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PSEditingPane pinView](self->super._pane, "pinView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlocked:", v3);

}

- (void)deactivateKeypad
{
  -[PSEditingPane resignFirstResponder](self->super._pane, "resignFirstResponder");
  -[PSEditingPane dismissKeypad](self->super._pane, "dismissKeypad");
  -[DevicePINController setPinBlocked:](self, "setPinBlocked:", 1);
}

- (void)_updatePINButtons
{
  void *v3;
  uint64_t v4;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *cancelButton;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem **p_doneButton;
  UIBarButtonItem *doneButton;
  id v12;
  NSString *v13;
  PSEditingPane *pane;
  id v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  UIBarButtonItem *v19;
  _BOOL8 v20;
  PSEditingPane *v21;

  if (!self->_hidesNavigationButtons)
  {
    v21 = self->super._pane;
    -[PSEditingPane password](v21, "password");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    -[DevicePINController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_cancelButton && !self->_hidesCancelButton)
    {
      v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped);
      cancelButton = self->_cancelButton;
      self->_cancelButton = v6;

    }
    if (-[DevicePINController simplePIN](self, "simplePIN"))
    {
      if (-[DevicePINController showSimplePINCancelButtonOnLeft](self, "showSimplePINCancelButtonOnLeft"))
      {
        objc_msgSend(v5, "setLeftBarButtonItem:", self->_cancelButton);
        v8 = v5;
        v9 = 0;
      }
      else
      {
        objc_msgSend(v5, "setLeftBarButtonItem:", 0);
        v9 = self->_cancelButton;
        v8 = v5;
      }
      objc_msgSend(v8, "setRightBarButtonItem:", v9);
    }
    else
    {
      switch(self->_mode)
      {
        case 0:
          if (self->_substate == 2)
            goto LABEL_15;
          goto LABEL_10;
        case 1:
        case 3:
          goto LABEL_15;
        case 2:
          if (self->_substate != 3)
            goto LABEL_10;
LABEL_15:
          p_doneButton = &self->_doneButton;
          doneButton = self->_doneButton;
          if (doneButton)
            goto LABEL_20;
          v13 = self->_doneButtonTitle;
          if (!v13)
          {
            PS_LocalizedStringForPINEntry(CFSTR("DONE"));
            v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          }
          v15 = objc_alloc(MEMORY[0x1E0CEA380]);
          pane = self->super._pane;
          v16 = v13;
          v17 = 2;
          break;
        default:
LABEL_10:
          p_doneButton = &self->_nextButton;
          doneButton = self->_nextButton;
          if (doneButton)
            goto LABEL_20;
          v12 = objc_alloc(MEMORY[0x1E0CEA380]);
          PS_LocalizedStringForPINEntry(CFSTR("NEXT"));
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          pane = self->super._pane;
          v15 = v12;
          v16 = v13;
          v17 = 0;
          break;
      }
      v18 = objc_msgSend(v15, "initWithTitle:style:target:action:", v16, v17, pane, sel_okButtonPressed);
      v19 = *p_doneButton;
      *p_doneButton = (UIBarButtonItem *)v18;

      doneButton = *p_doneButton;
LABEL_20:
      objc_msgSend(v5, "setRightBarButtonItem:", doneButton);
      objc_msgSend(v5, "setLeftBarButtonItem:", self->_cancelButton);
      v20 = v4 != 0;
      -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", v20);
      -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", v20);
    }

  }
}

- (void)adjustButtonsForPasswordLength:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DevicePINController_adjustButtonsForPasswordLength___block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__DevicePINController_adjustButtonsForPasswordLength___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePINButtons");
}

- (BOOL)completedInputIsValid:(id)a3
{
  return 1;
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DevicePINController;
  -[PSDetailController loadView](&v4, sel_loadView);
  -[DevicePINController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[PSViewController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DevicePINController overallContentSizeForViewInPopover](self, "overallContentSizeForViewInPopover");
    -[PSEditingPane setFrame:](self->super._pane, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v5, v6);
  }
}

- (void)_slidePasscodeFieldLeft:(BOOL)a3
{
  int v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;

  v3 = a3;
  -[PSViewController parentController](self, "parentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    -[DevicePINController overallContentSizeForViewInPopover](self, "overallContentSizeForViewInPopover");
    v10 = v9;
    v12 = v11;
    -[PSEditingPane setFrame:](self->super._pane, "setFrame:", v7, v8, v9, v11);
    -[DevicePINController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
    -[DevicePINController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreferredContentSize:", v10, v12);

  }
  -[DevicePINController pinPane](self, "pinPane");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPINLength:", -[DevicePINController pinLength](self, "pinLength"));

  -[DevicePINController pinPane](self, "pinPane");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_shouldReverseLayoutDirection");

  if (v16 != v3)
    v17 = 1;
  else
    v17 = 2;
  -[DevicePINController pinPane](self, "pinPane");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", -[DevicePINController simplePIN](self, "simplePIN"), -[DevicePINController requiresKeyboard](self, "requiresKeyboard"), -[DevicePINController isNumericPIN](self, "isNumericPIN"), v17, -[DevicePINController _shouldShowOptionsButton](self, "_shouldShowOptionsButton"));

  -[DevicePINController _updatePINButtons](self, "_updatePINButtons");
}

- (BOOL)_asyncSetPinCompatible
{
  return 0;
}

- (void)pinEntered:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!-[DevicePINController isBlocked](self, "isBlocked"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__DevicePINController_pinEntered___block_invoke;
    v6[3] = &unk_1E4A655B8;
    v6[4] = self;
    v4 = v5;
    v7 = v4;
    -[DevicePINController _preflightPasswordForWeakness:withCompletion:](self, "_preflightPasswordForWeakness:withCompletion:", v4, v6);

  }
}

void __34__DevicePINController_pinEntered___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  _DWORD *v10;
  NSObject *v11;
  id WeakRetained;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  NSObject *v21;
  int v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  id v32;
  void *v33;
  uint64_t v34;
  int v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, void *);
  void *v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id buf;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  switch(*(_DWORD *)(v2 + 1024))
  {
    case 0:
      v3 = *(_DWORD *)(v2 + 1028);
      if (v3 == 2)
      {
        if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(v2 + 1040))
          || !objc_msgSend(*(id *)(a1 + 32), "completedInputIsValid:", *(_QWORD *)(a1 + 40)))
        {
          objc_msgSend(*(id *)(a1 + 32), "setLastEntry:", 0);
          v34 = *(_QWORD *)(a1 + 32);
          v35 = 1;
          goto LABEL_42;
        }
        objc_initWeak(&buf, *(id *)(a1 + 32));
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __34__DevicePINController_pinEntered___block_invoke_2;
        v44[3] = &unk_1E4A675E0;
        objc_copyWeak(&v46, &buf);
        v45 = *(id *)(a1 + 40);
        v23 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8594D10](v44);
        if ((objc_msgSend(*(id *)(a1 + 32), "isMemberOfClass:", objc_opt_class()) & 1) != 0
          || objc_msgSend(*(id *)(a1 + 32), "_asyncSetPinCompatible"))
        {
          objc_msgSend(*(id *)(a1 + 32), "setPIN:completion:", *(_QWORD *)(a1 + 40), v23);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "setPIN:", *(_QWORD *)(a1 + 40));
          v23[2](v23, 1, 0);
        }

        objc_destroyWeak(&v46);
        objc_destroyWeak(&buf);
      }
      else if (v3 == 1)
      {
        v4 = *(_QWORD *)(a1 + 40);
        v47 = 0;
        v5 = objc_msgSend((id)v2, "pinIsAcceptable:outError:", v4, &v47);
        v6 = v47;
        v7 = *(void **)(a1 + 32);
        if (v5)
        {
          objc_msgSend(v7, "setLastEntry:", *(_QWORD *)(a1 + 40));
          ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1028);
          objc_msgSend(*(id *)(a1 + 32), "_slidePasscodeFieldLeft:", 1);
        }
        else
        {
          objc_msgSend(v7, "_showUnacceptablePINError:password:", v6, *(_QWORD *)(a1 + 40));
        }

      }
      return;
    case 1:
      if (!objc_msgSend((id)v2, "attemptValidationWithPIN:", *(_QWORD *)(a1 + 40))
        || !objc_msgSend(*(id *)(a1 + 32), "completedInputIsValid:", *(_QWORD *)(a1 + 40)))
      {
        goto LABEL_45;
      }
      objc_msgSend(*(id *)(a1 + 32), "_removePinWithOldPassword:", *(_QWORD *)(a1 + 40));
      return;
    case 2:
      v8 = *(_DWORD *)(v2 + 1028);
      switch(v8)
      {
        case 3:
          if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(_QWORD *)(v2 + 1040))
            && objc_msgSend(*(id *)(a1 + 32), "completedInputIsValid:", *(_QWORD *)(a1 + 40)))
          {
            objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", *(_QWORD *)(a1 + 32));
            v37 = MEMORY[0x1E0C809B0];
            v38 = 3221225472;
            v39 = __34__DevicePINController_pinEntered___block_invoke_167;
            v40 = &unk_1E4A65AA0;
            v25 = v24;
            v41 = v25;
            v42 = *(id *)(a1 + 40);
            v26 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8594D10](&v37);
            v27 = objc_msgSend(*(id *)(a1 + 32), "isMemberOfClass:", objc_opt_class(), v37, v38, v39, v40);
            v28 = *(void **)(a1 + 32);
            v29 = *(_QWORD *)(a1 + 40);
            if (v27)
            {
              objc_msgSend(v28, "setPIN:completion:", v29, v26);
            }
            else
            {
              objc_msgSend(v28, "setPIN:", v29);
              v26[2](v26, 1, 0);
            }

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "setLastEntry:", 0);
            v34 = *(_QWORD *)(a1 + 32);
            v35 = 2;
LABEL_42:
            *(_DWORD *)(v34 + 1028) = v35;
            objc_msgSend(*(id *)(a1 + 32), "_slidePasscodeFieldLeft:", 0);
            objc_msgSend(*(id *)(a1 + 32), "_showPINConfirmationError");
          }
          break;
        case 2:
          v30 = *(_QWORD *)(a1 + 40);
          v43 = 0;
          v31 = objc_msgSend((id)v2, "pinIsAcceptable:outError:", v30, &v43);
          v32 = v43;
          v33 = *(void **)(a1 + 32);
          if (v31)
          {
            objc_msgSend(v33, "setLastEntry:", *(_QWORD *)(a1 + 40));
            ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1028);
            objc_msgSend(*(id *)(a1 + 32), "_slidePasscodeFieldLeft:", 1);
          }
          else
          {
            objc_msgSend(v33, "_showUnacceptablePINError:password:", v32, *(_QWORD *)(a1 + 40));
          }

          break;
        case 1:
          v9 = objc_msgSend((id)v2, "attemptValidationWithPIN:", *(_QWORD *)(a1 + 40));
          v10 = *(_DWORD **)(a1 + 32);
          if (v9)
          {
            ++v10[257];
            objc_msgSend(*(id *)(a1 + 32), "setOldPassword:", *(_QWORD *)(a1 + 40));
            objc_msgSend(*(id *)(a1 + 32), "_slidePasscodeFieldLeft:", 1);
          }
          else
          {
            objc_msgSend(v10, "setLastEntry:", 0);
LABEL_45:
            objc_msgSend(*(id *)(a1 + 32), "_updateErrorTextAndFailureCount:", 1);
          }
          break;
      }
      return;
    case 3:
      if (objc_msgSend((id)v2, "attemptValidationWithPIN:", *(_QWORD *)(a1 + 40))
        && objc_msgSend(*(id *)(a1 + 32), "completedInputIsValid:", *(_QWORD *)(a1 + 40)))
      {
        _PSLoggingFacility();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A3819000, v11, OS_LOG_TYPE_DEFAULT, "Succeeded passcode entry", (uint8_t *)&buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "hideFailedAttempts");
        objc_msgSend(*(id *)(a1 + 32), "setSuccess:", 1);
        objc_msgSend(*(id *)(a1 + 32), "setOldPassword:", *(_QWORD *)(a1 + 40));
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
        if (WeakRetained)
        {
          v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
          v14 = objc_opt_respondsToSelector();

          if ((v14 & 1) != 0)
          {
            v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
            objc_msgSend(v15, "willAcceptEnteredPIN");

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "performActionAfterPINEntry");
        v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));

        if (!v16)
          goto LABEL_50;
        v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
        v18 = objc_opt_respondsToSelector();

        v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
        v20 = v19;
        if ((v18 & 1) != 0)
        {
          objc_msgSend(v19, "didAcceptEnteredPIN:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032));
        }
        else
        {
          v36 = objc_opt_respondsToSelector();

          if ((v36 & 1) == 0)
          {
LABEL_50:
            objc_msgSend(*(id *)(a1 + 32), "_dismiss");
            return;
          }
          v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1056));
          objc_msgSend(v20, "didAcceptEnteredPIN");
        }

        goto LABEL_50;
      }
      objc_msgSend(*(id *)(a1 + 32), "_updateErrorTextAndFailureCount:", 1);
      _PSLoggingFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "numberOfFailedAttempts");
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = v22;
        _os_log_impl(&dword_1A3819000, v21, OS_LOG_TYPE_DEFAULT, "Failed passcode entry, attempts = %i", (uint8_t *)&buf, 8u);
      }

      return;
    default:
      return;
  }
}

void __34__DevicePINController_pinEntered___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setSuccess:", 1);
    objc_msgSend(v7, "pane");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hideFailedAttempts");

    objc_msgSend(v7, "_dismiss");
    objc_msgSend(v7, "performActionAfterPINSet");
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "pinDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      objc_msgSend(v7, "pinDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v10 & 1) != 0)
      {
        objc_msgSend(v11, "devicePINController:didAcceptSetPIN:", v7, *(_QWORD *)(a1 + 32));

        goto LABEL_12;
      }
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0)
        goto LABEL_12;
      objc_msgSend(v7, "pinDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "didAcceptSetPIN");
LABEL_11:

      goto LABEL_12;
    }
    _PSLoggingFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v5;
      _os_log_impl(&dword_1A3819000, v13, OS_LOG_TYPE_DEFAULT, "Failed to set passcode with error: %@", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v7, "pinDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      objc_msgSend(v7, "pinDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "devicePINController:didFailToSetPinWithError:", v7, v5);
      goto LABEL_11;
    }
  }
LABEL_12:

}

void __34__DevicePINController_pinEntered___block_invoke_167(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOldPassword:", 0);
  objc_msgSend(v4, "setSuccess:", 1);
  objc_msgSend(v4, "pane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideFailedAttempts");

  if (v13)
  {
    objc_msgSend(v4, "pinDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v4, "pinDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "devicePINController:didFailToChangePinWithError:", v4, v13);
LABEL_8:

      goto LABEL_9;
    }
  }
  objc_msgSend(v4, "pinDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  objc_msgSend(v4, "pinDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "devicePINController:didAcceptChangedPIN:", v4, *(_QWORD *)(a1 + 40));
    goto LABEL_8;
  }
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v4, "pinDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didAcceptChangedPIN");
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v4, "_dismiss");

}

- (void)_removePinWithOldPassword:(id)a3
{
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  _QWORD v7[4];
  id v8;

  -[DevicePINController setOldPassword:](self, "setOldPassword:", a3);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__DevicePINController__removePinWithOldPassword___block_invoke;
  v7[3] = &unk_1E4A66DC0;
  v5 = v4;
  v8 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8594D10](v7);
  if (-[DevicePINController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    -[DevicePINController setPIN:completion:](self, "setPIN:completion:", 0, v6);
  }
  else
  {
    -[DevicePINController setPIN:](self, "setPIN:", 0);
    v6[2](v6, 1, 0);
  }

}

void __49__DevicePINController__removePinWithOldPassword___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "anyObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuccess:", 1);
  objc_msgSend(v7, "performActionAfterPINRemove");
  objc_msgSend(v7, "pinDelegate");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    objc_msgSend(v7, "pinDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(v7, "pinDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didAcceptRemovePIN");

    }
  }
  objc_msgSend(v7, "pane");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hideFailedAttempts");

  objc_msgSend(v7, "_dismiss");
}

- (void)_preflightPasswordForWeakness:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char v9;
  BOOL v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[DevicePINController _shouldCheckForWeakness](self, "_shouldCheckForWeakness")
    && (-[DevicePINController pinDelegate](self, "pinDelegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    v19 = 0;
    v10 = -[DevicePINController pinIsAcceptable:outError:](self, "pinIsAcceptable:outError:", v6, &v19);
    v11 = v19;
    if (v10
      || (-[DevicePINController pinDelegate](self, "pinDelegate"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_opt_respondsToSelector(),
          v12,
          (v13 & 1) == 0))
    {
      -[DevicePINController pinDelegate](self, "pinDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke_2;
      v16[3] = &unk_1E4A67630;
      v16[4] = self;
      v17 = v7;
      objc_msgSend(v15, "devicePINController:shouldAcceptPIN:withCompletion:", self, v6, v16);

    }
    else
    {
      -[DevicePINController pinDelegate](self, "pinDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke;
      v18[3] = &unk_1E4A67608;
      v18[4] = self;
      objc_msgSend(v14, "showWeakWarningAlertForController:offerUseAnyway:withCompletion:", self, 0, v18);

    }
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

uint64_t __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "clearPassword");
}

uint64_t __68__DevicePINController__preflightPasswordForWeakness_withCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;

  if (!a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "clearPassword");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_shouldCheckForWeakness
{
  int mode;

  mode = self->_mode;
  if (mode == 2)
    return self->_substate == mode;
  if (!mode)
  {
    mode = 1;
    return self->_substate == mode;
  }
  return 0;
}

- (void)cancelButtonTapped
{
  id *p_pinDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;

  -[DevicePINController setOldPassword:](self, "setOldPassword:", 0);
  p_pinDelegate = &self->_pinDelegate;
  WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained(&self->_pinDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&self->_pinDelegate);
      objc_msgSend(v8, "willCancelEnteringPIN");

    }
  }
  -[DevicePINController setSuccess:](self, "setSuccess:", 0);
  -[DevicePINController _dismiss](self, "_dismiss");
  v9 = objc_loadWeakRetained(&self->_pinDelegate);
  if (v9)
  {
    v10 = v9;
    v11 = objc_loadWeakRetained(p_pinDelegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained(p_pinDelegate);
      objc_msgSend(v13, "didCancelEnteringPIN");

    }
  }
}

- (id)pinInstructionsPrompt
{
  uint64_t mode;
  __CFString *v4;
  void *v5;

  mode = self->_mode;
  if (mode > 3)
  {
    v4 = &stru_1E4A69238;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E4A67678[mode], self->_substate);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pinInstructionsPromptFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DevicePINController;
  -[PSDetailController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "sf_isiPhone") & 1) != 0)
  {

LABEL_4:
    -[PSEditingPane becomeFirstResponder](self->super._pane, "becomeFirstResponder");
    goto LABEL_5;
  }
  v5 = -[DevicePINController simplePIN](self, "simplePIN");

  if (v5)
    goto LABEL_4;
LABEL_5:
  self->_hasBeenDismissed = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DevicePINController;
  -[PSDetailController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (PSUsePadStylePIN())
    -[PSEditingPane becomeFirstResponder](self->super._pane, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DevicePINController;
  -[PSDetailController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[PSEditingPane resignFirstResponder](self->super._pane, "resignFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  char v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DevicePINController;
  -[PSViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (!self->_hasBeenDismissed)
  {
    WeakRetained = objc_loadWeakRetained(&self->_pinDelegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained(&self->_pinDelegate);
      objc_msgSend(v6, "devicePINControllerDidDismissPINPane:", self);

    }
  }
}

- (BOOL)_shouldShowOptionsButton
{
  int mode;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;

  mode = self->_mode;
  if (mode == 2)
  {
    if (!self->_allowOptionsButton || self->_substate != 2)
      goto LABEL_13;
  }
  else if (mode || self->_substate != 1 || !self->_allowOptionsButton)
  {
    goto LABEL_13;
  }
  -[DevicePINController passcodeOptionsAlertController](self, "passcodeOptionsAlertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > 1)
    return 1;
LABEL_13:
  -[DevicePINController passcodeOptionsTitle](self, "passcodeOptionsTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[DevicePINController passcodeOptionsHandler](self, "passcodeOptionsHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setPINPaneToSimple:(BOOL)a3 simpleLength:(int)a4 numeric:(BOOL)a5 requiresKeyboard:(int)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;

  v6 = a5;
  v7 = a3;
  -[DevicePINController setPinLength:](self, "setPinLength:", *(_QWORD *)&a4);
  -[DevicePINController pinPane](self, "pinPane");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPINLength:", -[DevicePINController pinLength](self, "pinLength"));

  -[DevicePINController setSimplePIN:](self, "setSimplePIN:", v7);
  -[DevicePINController setNumericPIN:](self, "setNumericPIN:", v6);
  -[DevicePINController pinPane](self, "pinPane");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", -[DevicePINController simplePIN](self, "simplePIN"), -[DevicePINController requiresKeyboard](self, "requiresKeyboard"), -[DevicePINController isNumericPIN](self, "isNumericPIN"), 6, -[DevicePINController _shouldShowOptionsButton](self, "_shouldShowOptionsButton"));

  -[DevicePINController _updatePINButtons](self, "_updatePINButtons");
}

- (id)passcodeOptionsAlertController
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  int v28;

  v28 = 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "minimumNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", &v28);

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DevicePINController isNumericPIN](self, "isNumericPIN");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForPINEntry(CFSTR("CUSTOM_ALPHANUMERIC_CODE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke;
    v27[3] = &unk_1E4A65BF8;
    v27[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v10);

  }
  if (v4 != 2)
  {
    if (!-[DevicePINController isNumericPIN](self, "isNumericPIN")
      || -[DevicePINController simplePIN](self, "simplePIN"))
    {
      v11 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForPINEntry(CFSTR("CUSTOM_NUMERIC_CODE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v7;
      v26[1] = 3221225472;
      v26[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke_2;
      v26[3] = &unk_1E4A65BF8;
      v26[4] = self;
      objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v13);

    }
    if (!v4)
    {
      if (!-[DevicePINController simplePIN](self, "simplePIN")
        || -[DevicePINController pinLength](self, "pinLength") != 6)
      {
        v14 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForPINEntry(CFSTR("6_DIGIT_CODE"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v7;
        v25[1] = 3221225472;
        v25[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke_3;
        v25[3] = &unk_1E4A65BF8;
        v25[4] = self;
        objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addAction:", v16);

      }
      if (v28 != 1
        && (!-[DevicePINController simplePIN](self, "simplePIN")
         || -[DevicePINController pinLength](self, "pinLength") != 4))
      {
        v17 = (void *)MEMORY[0x1E0CEA2E0];
        PS_LocalizedStringForPINEntry(CFSTR("4_DIGIT_CODE"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v7;
        v24[1] = 3221225472;
        v24[2] = __53__DevicePINController_passcodeOptionsAlertController__block_invoke_4;
        v24[3] = &unk_1E4A65BF8;
        v24[4] = self;
        objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addAction:", v19);

      }
    }
  }
  v20 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForPINEntry(CFSTR("CANCEL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v22);

  return v5;
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPINPaneToSimple:simpleLength:numeric:requiresKeyboard:", 0, 0, 0, objc_msgSend(*(id *)(a1 + 32), "requiresKeyboard"));
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPINPaneToSimple:simpleLength:numeric:requiresKeyboard:", 0, 0, 1, objc_msgSend(*(id *)(a1 + 32), "requiresKeyboard"));
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPINPaneToSimple:simpleLength:numeric:requiresKeyboard:", 1, 6, 1, objc_msgSend(*(id *)(a1 + 32), "requiresKeyboard"));
}

uint64_t __53__DevicePINController_passcodeOptionsAlertController__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPINPaneToSimple:simpleLength:numeric:requiresKeyboard:", 1, 4, 1, objc_msgSend(*(id *)(a1 + 32), "requiresKeyboard"));
}

- (void)showPasscodeOptions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DevicePINController passcodeOptionsAlertController](self, "passcodeOptionsAlertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (PSUsePadStylePIN())
  {
    objc_msgSend(v4, "setModalPresentationStyle:", 7);
    objc_msgSend(v4, "popoverPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceView:", v6);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "setSourceRect:");

  }
  -[DevicePINController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)pinPane
{
  return self->super._pane;
}

- (void)setPane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DevicePINController;
  -[PSDetailController setPane:](&v14, sel_setPane_, v4);
  self->_substate = 1;
  -[DevicePINController setSuccess:](self, "setSuccess:", 0);
  if (self->_mode == 1000)
  {
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("mode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_mode = objc_msgSend(v5, "intValue");

  }
  -[DevicePINController passcodeOptionsHandler](self, "passcodeOptionsHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "setPasscodeOptionsHandler:", v6);
  }
  else if (self->_allowOptionsButton)
  {
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __31__DevicePINController_setPane___block_invoke;
    v11 = &unk_1E4A67658;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "setPasscodeOptionsHandler:", &v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  -[DevicePINController passcodeOptionsTitle](self, "passcodeOptionsTitle", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPasscodeOptionsTitle:", v7);

  objc_msgSend(v4, "setPINLength:", -[DevicePINController pinLength](self, "pinLength"));
  objc_msgSend(v4, "setSimplePIN:requiresKeyboard:numericOnly:showsOptions:", -[DevicePINController simplePIN](self, "simplePIN"), -[DevicePINController requiresKeyboard](self, "requiresKeyboard"), -[DevicePINController isNumericPIN](self, "isNumericPIN"), -[DevicePINController _shouldShowOptionsButton](self, "_shouldShowOptionsButton"));
  if (-[DevicePINController isBlocked](self, "isBlocked"))
  {
    -[DevicePINController _updateErrorTextAndFailureCount:](self, "_updateErrorTextAndFailureCount:", 0);
  }
  else if (-[DevicePINController numberOfFailedAttempts](self, "numberOfFailedAttempts"))
  {
    -[DevicePINController _showFailedAttempts](self, "_showFailedAttempts");
  }
  -[DevicePINController _updatePINButtons](self, "_updatePINButtons");

}

void __31__DevicePINController_setPane___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "showPasscodeOptions:", v3);

}

- (id)title
{
  uint64_t mode;
  void *v3;

  mode = self->_mode;
  if (mode > 3)
  {
    v3 = 0;
  }
  else
  {
    -[DevicePINController localizedPINStringForKey:](self, "localizedPINStringForKey:", off_1E4A67698[mode]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (DevicePINControllerDelegate)pinDelegate
{
  return (DevicePINControllerDelegate *)objc_loadWeakRetained(&self->_pinDelegate);
}

- (void)setPinDelegate:(id)a3
{
  objc_storeWeak(&self->_pinDelegate, a3);
}

- (BOOL)hidesNavigationButtons
{
  return self->_hidesNavigationButtons;
}

- (void)setHidesNavigationButtons:(BOOL)a3
{
  self->_hidesNavigationButtons = a3;
}

- (BOOL)hidesCancelButton
{
  return self->_hidesCancelButton;
}

- (void)setHidesCancelButton:(BOOL)a3
{
  self->_hidesCancelButton = a3;
}

- (BOOL)shouldDismissWhenDone
{
  return self->_shouldDismissWhenDone;
}

- (void)setShouldDismissWhenDone:(BOOL)a3
{
  self->_shouldDismissWhenDone = a3;
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (BOOL)allowOptionsButton
{
  return self->_allowOptionsButton;
}

- (void)setAllowOptionsButton:(BOOL)a3
{
  self->_allowOptionsButton = a3;
}

- (NSString)passcodeOptionsTitle
{
  return self->_passcodeOptionsTitle;
}

- (void)setPasscodeOptionsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (id)passcodeOptionsHandler
{
  return self->_passcodeOptionsHandler;
}

- (void)setPasscodeOptionsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passcodeOptionsHandler, 0);
  objc_storeStrong((id *)&self->_passcodeOptionsTitle, 0);
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_numericPIN, 0);
  objc_storeStrong((id *)&self->_simplePIN, 0);
  objc_storeStrong((id *)&self->_pinLength, 0);
  objc_storeStrong((id *)&self->_requiresKeyboard, 0);
  objc_storeStrong((id *)&self->_sepLockInfo, 0);
  objc_storeStrong((id *)&self->_error2, 0);
  objc_storeStrong((id *)&self->_error1, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak(&self->_pinDelegate);
  objc_storeStrong((id *)&self->_lastEntry, 0);
  objc_storeStrong((id *)&self->_oldPassword, 0);
}

@end
