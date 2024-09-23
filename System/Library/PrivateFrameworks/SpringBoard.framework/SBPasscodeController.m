@implementation SBPasscodeController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_140_1);
  return (id)__sharedInstance;
}

void __38__SBPasscodeController_sharedInstance__block_invoke()
{
  void *v0;
  char v1;
  SBPasscodeController *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isPasscodeNagDaemonEnabled");

  if ((v1 & 1) == 0)
  {
    v2 = objc_alloc_init(SBPasscodeController);
    v3 = (void *)__sharedInstance;
    __sharedInstance = (uint64_t)v2;

  }
}

- (SBPasscodeController)init
{
  SBPasscodeController *v2;
  SBPasscodeController *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *passcodeComplianceQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBPasscodeController;
  v2 = -[SBPasscodeController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_restoreCompletedAlertStateChangedToken = 0;
    v2->_simplePasscodeType = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(17, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.SpringBoard.PasscodeCompliance", v5, v6);
    passcodeComplianceQueue = v3->_passcodeComplianceQueue;
    v3->_passcodeComplianceQueue = (OS_dispatch_queue *)v7;

    -[SBPasscodeController _startListeningToManagedConfigurationNotification](v3, "_startListeningToManagedConfigurationNotification");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  id telephonyNotificationObserver;
  objc_super v5;

  if (self->_telephonyNotificationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_telephonyNotificationObserver);

    telephonyNotificationObserver = self->_telephonyNotificationObserver;
    self->_telephonyNotificationObserver = 0;

  }
  -[SBPasscodeController _stopListeningToManagedConfigurationNotification](self, "_stopListeningToManagedConfigurationNotification");
  v5.receiver = self;
  v5.super_class = (Class)SBPasscodeController;
  -[SBPasscodeController dealloc](&v5, sel_dealloc);
}

- (void)forceUserToChangePasscode
{
  void *v3;
  int v4;
  int v5;
  NSString *previousPasscode;

  if (!self->_passcodeAlertItem)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isPasscodeSet");

    if ((v4 & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      previousPasscode = self->_previousPasscode;
      self->_previousPasscode = 0;

      v5 = 1;
    }
    self->_mode = v5;
    -[SBPasscodeController _fetchAndSetUnlockScreenTypeForNewPasscode:](self, "_fetchAndSetUnlockScreenTypeForNewPasscode:", v4 ^ 1u);
    -[SBPasscodeController _presentPasscodeAlertItemWithMode:alertItemErrorString:unlockScreenType:](self, "_presentPasscodeAlertItemWithMode:alertItemErrorString:unlockScreenType:", self->_mode, 0, self->_unlockScreenType);
  }
}

- (void)_passwordEntered:(id)a3
{
  id v5;
  void *v6;
  int mode;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  id v13;
  NSString *previousPasscode;
  NSString *newPasscode;
  char v16;
  void *v17;
  NSString *v18;
  SBPasscodeAlertItem *v19;
  uint64_t v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SBPasscodeAlertItem *passcodeAlertItem;
  void *v37;
  void *v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  mode = self->_mode;
  if (mode == 2)
  {
    if (!objc_msgSend(v5, "length")
      || !-[NSString length](self->_newPasscode, "length")
      || !objc_msgSend(v5, "isEqualToString:", self->_newPasscode))
    {
LABEL_19:
      v13 = 0;
LABEL_20:
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v29 = self->_mode;
      if (v29 == 2)
      {
        self->_mode = 1;
        if (!objc_msgSend(v5, "isEqualToString:", self->_newPasscode))
        {
          v32 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CONFIRM_NEW_PASSCODE_MISMATCH"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizedDescriptionOfDefaultNewPasscodeConstraints");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", v33, v35);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
          goto LABEL_38;
        }
        objc_msgSend(v13, "localizedDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v29 != 1)
        {
          if (v29)
            goto LABEL_41;
          objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ALERT_INCORRECT_PASSCODE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
LABEL_39:
          -[SBPasscodeController _fetchAndSetUnlockScreenTypeForNewPasscode:](self, "_fetchAndSetUnlockScreenTypeForNewPasscode:", v31);
          if (v30)
          {
            -[SBAlertItem deactivate](self->_passcodeAlertItem, "deactivate");
            passcodeAlertItem = self->_passcodeAlertItem;
            self->_passcodeAlertItem = 0;

            -[SBPasscodeController _presentPasscodeAlertItemWithMode:alertItemErrorString:unlockScreenType:](self, "_presentPasscodeAlertItemWithMode:alertItemErrorString:unlockScreenType:", self->_mode, v30, self->_unlockScreenType);
LABEL_42:

            goto LABEL_43;
          }
LABEL_41:
          -[SBPasscodeAlertItem _setErrorString:](self->_passcodeAlertItem, "_setErrorString:", 0);
          goto LABEL_42;
        }
        if (!v13)
          goto LABEL_34;
        objc_msgSend(v13, "localizedDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", &stru_1E8EC7EC0))
        {

LABEL_34:
          if (!self->_unlockScreenType)
          {
            v30 = 0;
            goto LABEL_38;
          }
          objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedDescriptionOfDefaultNewPasscodeConstraints");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        if (!v30)
          goto LABEL_34;
      }
LABEL_38:
      v31 = 1;
      goto LABEL_39;
    }
    previousPasscode = self->_previousPasscode;
    newPasscode = self->_newPasscode;
    v37 = 0;
    v16 = objc_msgSend(v6, "changePasscodeFrom:to:outError:", previousPasscode, newPasscode, &v37);
    v17 = v37;
  }
  else
  {
    if (mode != 1)
    {
      if (!mode)
      {
        v40 = 0;
        v41 = &v40;
        v42 = 0x2020000000;
        v43 = 0;
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9DA0]), "initForPasscode:source:", v5, 0);
        objc_msgSend((id)SBApp, "authenticationController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __41__SBPasscodeController__passwordEntered___block_invoke;
        v39[3] = &unk_1E8E9ED40;
        v39[4] = &v40;
        objc_msgSend(MEMORY[0x1E0DA9F50], "responderWithSuccessHandler:failureHandler:invalidHandler:", v39, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "processAuthenticationRequest:responder:", v8, v10);

        if (*((_BYTE *)v41 + 24))
        {
          v11 = (NSString *)objc_msgSend(v5, "copy");
          v12 = self->_previousPasscode;
          self->_previousPasscode = v11;

          _Block_object_dispose(&v40, 8);
          v13 = 0;
          goto LABEL_13;
        }

        _Block_object_dispose(&v40, 8);
      }
      goto LABEL_19;
    }
    objc_storeStrong((id *)&self->_newPasscode, a3);
    if (!-[NSString length](self->_newPasscode, "length"))
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(v6, "localizedDescriptionOfDefaultNewPasscodeConstraints");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v25, *MEMORY[0x1E0CB2D50], 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("EmptyPasscode"), 0, v26);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    v18 = self->_newPasscode;
    v38 = 0;
    v16 = objc_msgSend(v6, "passcode:meetsCurrentConstraintsOutError:", v18, &v38);
    v17 = v38;
  }
  v13 = v17;
  if ((v16 & 1) == 0)
    goto LABEL_20;
LABEL_13:
  -[SBAlertItem deactivate](self->_passcodeAlertItem, "deactivate");
  v19 = self->_passcodeAlertItem;
  self->_passcodeAlertItem = 0;

  v20 = self->_mode;
  if (!(_DWORD)v20)
  {
    self->_mode = 1;
    -[SBPasscodeController _fetchAndSetUnlockScreenTypeForNewPasscode:](self, "_fetchAndSetUnlockScreenTypeForNewPasscode:", 1);
    v20 = self->_mode;
    goto LABEL_32;
  }
  if ((_DWORD)v20 == 1)
  {
    v20 = 2;
    self->_mode = 2;
    goto LABEL_32;
  }
  if ((_DWORD)v20 != 2)
  {
LABEL_32:
    -[SBPasscodeController _presentPasscodeAlertItemWithMode:alertItemErrorString:unlockScreenType:](self, "_presentPasscodeAlertItemWithMode:alertItemErrorString:unlockScreenType:", v20, 0, self->_unlockScreenType);
    goto LABEL_43;
  }
  -[SBPasscodeController _stopListeningToRestoreCompletedAlertStateChangedNotifications](self, "_stopListeningToRestoreCompletedAlertStateChangedNotifications");
  v21 = self->_previousPasscode;
  self->_previousPasscode = 0;

  v22 = self->_newPasscode;
  self->_newPasscode = 0;

LABEL_43:
}

uint64_t __41__SBPasscodeController__passwordEntered___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)_fetchAndSetUnlockScreenTypeForNewPasscode:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  int *p_simplePasscodeType;
  int v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  p_simplePasscodeType = &self->_simplePasscodeType;
  if (v3)
    v9 = objc_msgSend(v6, "defaultNewPasscodeEntryScreenTypeWithOutSimplePasscodeType:", p_simplePasscodeType);
  else
    v9 = objc_msgSend(v6, "unlockScreenTypeWithOutSimplePasscodeType:", p_simplePasscodeType);
  self->_unlockScreenType = v9;

  if (!self->_unlockScreenType && self->_simplePasscodeType == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPasscodeController.m"), 467, CFSTR("Cannot be simple and have a non-simple passcode type."));

  }
}

- (void)_presentPasscodeAlertItemWithMode:(int)a3 alertItemErrorString:(id)a4 unlockScreenType:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  SBPasscodeAlertItem *passcodeAlertItem;
  void *v11;
  int v12;
  SBPasscodeAlertItem *v13;
  SBPasscodeAlertItem *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (self->_passcodeAlertItem)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "WARNING: Activating passcode compliance alert before existing compliance alert was dismissed", buf, 2u);
    }

    -[SBAlertItem deactivate](self->_passcodeAlertItem, "deactivate");
    passcodeAlertItem = self->_passcodeAlertItem;
    self->_passcodeAlertItem = 0;

  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isPasscodeModificationAllowed");

  if (v12)
  {
    v13 = -[SBPasscodeAlertItem initWithPasscodeMode:unlockScreenType:simplePasscodeType:]([SBPasscodeAlertItem alloc], "initWithPasscodeMode:unlockScreenType:simplePasscodeType:", v6, v5, self->_simplePasscodeType);
    v14 = self->_passcodeAlertItem;
    self->_passcodeAlertItem = v13;

    -[SBPasscodeAlertItem _setErrorString:](self->_passcodeAlertItem, "_setErrorString:", v8);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject activateAlertItem:](v15, "activateAlertItem:", self->_passcodeAlertItem);
  }
  else
  {
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "NOTE: Skipping presentation of passcode alert item (passcode modification not allowed by MC)", v16, 2u);
    }
  }

}

- (void)_startListeningToManagedConfigurationNotification
{
  uint64_t v3;
  void *v4;
  void *v5;
  id manageConfigurationEffectiveSettingsObserver;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D46EC8];
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserverForName:object:queue:usingBlock:", v3, 0, v4, &__block_literal_global_160);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  manageConfigurationEffectiveSettingsObserver = self->_manageConfigurationEffectiveSettingsObserver;
  self->_manageConfigurationEffectiveSettingsObserver = v5;

}

void __73__SBPasscodeController__startListeningToManagedConfigurationNotification__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isPasscodeModificationAllowed");

  +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((v1 & 1) != 0)
    objc_msgSend(v2, "checkPasscodeCompliance");
  else
    objc_msgSend(v2, "_abort");

}

- (void)_stopListeningToManagedConfigurationNotification
{
  void *v3;
  id manageConfigurationEffectiveSettingsObserver;

  if (self->_manageConfigurationEffectiveSettingsObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_manageConfigurationEffectiveSettingsObserver);

    manageConfigurationEffectiveSettingsObserver = self->_manageConfigurationEffectiveSettingsObserver;
    self->_manageConfigurationEffectiveSettingsObserver = 0;

  }
}

- (void)_userWantsToComplyNow:(BOOL)a3
{
  _BOOL4 v3;
  SBPasscodeComplianceAlertItem *complianceAlertItem;

  v3 = a3;
  complianceAlertItem = self->_complianceAlertItem;
  self->_complianceAlertItem = 0;

  if (v3)
    -[SBPasscodeController forceUserToChangePasscode](self, "forceUserToChangePasscode");
}

- (void)_abort
{
  SBPasscodeComplianceAlertItem *complianceAlertItem;
  SBPasscodeAlertItem *passcodeAlertItem;

  -[SBAlertItem deactivate](self->_complianceAlertItem, "deactivate");
  complianceAlertItem = self->_complianceAlertItem;
  self->_complianceAlertItem = 0;

  -[SBAlertItem deactivate](self->_passcodeAlertItem, "deactivate");
  passcodeAlertItem = self->_passcodeAlertItem;
  self->_passcodeAlertItem = 0;

  -[SBPasscodeController _stopListeningToTelephonyNotifications](self, "_stopListeningToTelephonyNotifications");
  -[SBPasscodeController _stopListeningToRestoreCompletedAlertStateChangedNotifications](self, "_stopListeningToRestoreCompletedAlertStateChangedNotifications");
  self->_delayedComplianceAlertUntilAfterRestoreCompletedAlert = 0;
}

- (void)_didEndCall
{
  -[SBPasscodeAlertItem didEndCall](self->_passcodeAlertItem, "didEndCall");
}

- (void)_startListeningToTelephonyNotifications
{
  id telephonyNotificationObserver;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasCellularTelephony"))
  {
    telephonyNotificationObserver = self->_telephonyNotificationObserver;

    if (telephonyNotificationObserver)
      return;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0DAC2B0];
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, &__block_literal_global_161);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_telephonyNotificationObserver;
    self->_telephonyNotificationObserver = v6;

  }
}

void __63__SBPasscodeController__startListeningToTelephonyNotifications__block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  id v3;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "inCall");

  +[SBPasscodeController sharedInstance](SBPasscodeController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    objc_msgSend(v2, "_abort");
  else
    objc_msgSend(v2, "_didEndCall");

}

- (void)_stopListeningToTelephonyNotifications
{
  void *v3;
  id telephonyNotificationObserver;

  if (self->_telephonyNotificationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_telephonyNotificationObserver);

    telephonyNotificationObserver = self->_telephonyNotificationObserver;
    self->_telephonyNotificationObserver = 0;

  }
}

- (BOOL)_isRestoreCompletedAlertActive
{
  uint64_t state64;

  state64 = 0;
  return !notify_get_state(self->_restoreCompletedAlertStateChangedToken, &state64) && state64 == 1;
}

- (void)_startListeningToRestoreCompletedAlertStateChangedNotifications
{
  int *p_restoreCompletedAlertStateChangedToken;
  const char *v4;
  _QWORD handler[5];

  p_restoreCompletedAlertStateChangedToken = &self->_restoreCompletedAlertStateChangedToken;
  if (!self->_restoreCompletedAlertStateChangedToken)
  {
    v4 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4E0D0], "UTF8String");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __87__SBPasscodeController__startListeningToRestoreCompletedAlertStateChangedNotifications__block_invoke;
    handler[3] = &unk_1E8E9EBA8;
    handler[4] = self;
    notify_register_dispatch(v4, p_restoreCompletedAlertStateChangedToken, MEMORY[0x1E0C80D38], handler);
  }
}

uint64_t __87__SBPasscodeController__startListeningToRestoreCompletedAlertStateChangedNotifications__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 84))
  {
    result = objc_msgSend((id)result, "_isRestoreCompletedAlertActive");
    if ((result & 1) == 0)
    {
      SBLogCommon();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Activating passcode compliance alert now that the restore completed alert is inactive", v4, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 84) = 0;
      return objc_msgSend(*(id *)(a1 + 32), "_activateComplianceAlert");
    }
  }
  return result;
}

- (void)_stopListeningToRestoreCompletedAlertStateChangedNotifications
{
  int restoreCompletedAlertStateChangedToken;

  restoreCompletedAlertStateChangedToken = self->_restoreCompletedAlertStateChangedToken;
  if (restoreCompletedAlertStateChangedToken)
  {
    notify_cancel(restoreCompletedAlertStateChangedToken);
    self->_restoreCompletedAlertStateChangedToken = 0;
  }
}

- (void)_activateComplianceAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateAlertItem:", self->_complianceAlertItem);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "authenticationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastRevokedAuthenticationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyUserHasSeenComplianceMessageWithLastLockDate:", v6);

  -[SBPasscodeController _stopListeningToRestoreCompletedAlertStateChangedNotifications](self, "_stopListeningToRestoreCompletedAlertStateChangedNotifications");
}

- (void)checkPasscodeCompliance
{
  SBPasscodeAlertItem *passcodeAlertItem;
  SBPasscodeAlertItem *v4;
  SBPasscodeComplianceAlertItem *complianceAlertItem;
  SBPasscodeComplianceAlertItem *v6;
  void *v7;
  void *v8;
  NSObject *passcodeComplianceQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  SBPasscodeController *v13;

  passcodeAlertItem = self->_passcodeAlertItem;
  if (passcodeAlertItem)
  {
    -[SBAlertItem deactivate](passcodeAlertItem, "deactivate");
    v4 = self->_passcodeAlertItem;
    self->_passcodeAlertItem = 0;

  }
  complianceAlertItem = self->_complianceAlertItem;
  if (complianceAlertItem)
  {
    -[SBAlertItem deactivate](complianceAlertItem, "deactivate");
    v6 = self->_complianceAlertItem;
    self->_complianceAlertItem = 0;

  }
  -[SBPasscodeController _startListeningToTelephonyNotifications](self, "_startListeningToTelephonyNotifications");
  self->_delayedComplianceAlertUntilAfterRestoreCompletedAlert = 0;
  -[SBPasscodeController _startListeningToRestoreCompletedAlertStateChangedNotifications](self, "_startListeningToRestoreCompletedAlertStateChangedNotifications");
  objc_msgSend((id)SBApp, "authenticationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastRevokedAuthenticationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  passcodeComplianceQueue = self->_passcodeComplianceQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SBPasscodeController_checkPasscodeCompliance__block_invoke;
  v11[3] = &unk_1E8E9E820;
  v12 = v8;
  v13 = self;
  v10 = v8;
  dispatch_async(passcodeComplianceQueue, v11);

}

void __47__SBPasscodeController_checkPasscodeCompliance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_2;
  v4[3] = &unk_1E8EA8E70;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "getPasscodeComplianceWarningLastLockDate:completionBlock:", v3, v4);

}

void __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int v15;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_3;
  v12[3] = &unk_1E8EA0288;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = a2;
  v12[4] = v9;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __47__SBPasscodeController_checkPasscodeCompliance__block_invoke_3(uint64_t a1)
{
  int v2;
  SBPasscodeComplianceAlertItem *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SBPasscodeComplianceAlertItem *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  NSObject *v21;
  uint8_t v22[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    return;
  v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 3)
  {
    v11 = [SBPasscodeComplianceAlertItem alloc];
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSCODE_REMINDER_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v15 = CFSTR("PASSCODE_REMINDER_CANCEL");
LABEL_9:
    objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBPasscodeComplianceAlertItem initWithTitle:message:continueButtonTitle:cancelButtonTitle:](v11, "initWithTitle:message:continueButtonTitle:cancelButtonTitle:", v12, v13, v7, v16);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(v18 + 48);
    *(_QWORD *)(v18 + 48) = v17;

    goto LABEL_10;
  }
  if (v2 == 2)
  {
    v11 = [SBPasscodeComplianceAlertItem alloc];
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v15 = CFSTR("NON_COMPLIANT_PASSCODE_LATER");
    goto LABEL_9;
  }
  if (v2 != 1)
    goto LABEL_11;
  v3 = [SBPasscodeComplianceAlertItem alloc];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NON_COMPLIANT_PASSCODE_CONTINUE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBPasscodeComplianceAlertItem initWithTitle:message:continueButtonTitle:cancelButtonTitle:](v3, "initWithTitle:message:continueButtonTitle:cancelButtonTitle:", v4, v5, v7, 0);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = v8;
LABEL_10:

LABEL_11:
  v20 = *(_QWORD **)(a1 + 32);
  if (v20[6])
  {
    if (objc_msgSend(v20, "_isRestoreCompletedAlertActive"))
    {
      SBLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_INFO, "Dealying activating passcode compliance alert until after restore completed alert", v22, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 84) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_activateComplianceAlert");
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeComplianceQueue, 0);
  objc_storeStrong(&self->_telephonyNotificationObserver, 0);
  objc_storeStrong(&self->_manageConfigurationEffectiveSettingsObserver, 0);
  objc_storeStrong((id *)&self->_forcedComplianceDate, 0);
  objc_storeStrong((id *)&self->_complianceAlertItem, 0);
  objc_storeStrong((id *)&self->_newPasscode, 0);
  objc_storeStrong((id *)&self->_previousPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeAlertItem, 0);
}

@end
