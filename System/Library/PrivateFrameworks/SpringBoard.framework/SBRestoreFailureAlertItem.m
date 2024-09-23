@implementation SBRestoreFailureAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem alertController](self, "alertController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESTORE_FAILURE_ALERT_BODY_TEXT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedPlatformName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setMessage:", v11);
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESTORE_FAILURE_ALERT_RESTART_BUTTON_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SBRestoreFailureAlertItem_configure_requirePasscodeForActions___block_invoke;
  v14[3] = &unk_1E8E9DCB0;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v13);

}

uint64_t __65__SBRestoreFailureAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "restartSystemEvent");
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (void)_rebootNow
{
  id v2;

  objc_msgSend((id)SBApp, "restartManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebootForReason:", CFSTR("SBRestoreFailureAlertItem"));

}

- (void)restartSystemEvent
{
  -[SBRestoreFailureAlertItem performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__rebootNow, 0, 1.0);
}

- (void)performUnlockAction
{
  -[SBRestoreFailureAlertItem restartSystemEvent](self, "restartSystemEvent");
  -[SBAlertItem deactivate](self, "deactivate");
}

- (BOOL)allowMenuButtonDismissal
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)allowInSetup
{
  return 1;
}

- (BOOL)suppressForKeynote
{
  return 1;
}

@end
