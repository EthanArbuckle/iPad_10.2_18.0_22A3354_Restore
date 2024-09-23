@implementation KeychainSyncDevicePINController

- (KeychainSyncDevicePINController)init
{
  KeychainSyncDevicePINController *v2;
  uint64_t v3;
  DevicePINController *v4;
  DevicePINController *devicePINController;
  BOOL v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncDevicePINController;
  v2 = -[PSKeychainSyncTextEntryController init](&v8, sel_init);
  if (v2)
  {
    v7 = 0;
    PSIsUsingPasscode(&v7);
    if (v7)
      v3 = 1;
    else
      v3 = 2;
    -[PSKeychainSyncTextEntryController setTextEntryType:](v2, "setTextEntryType:", v3);
    -[PSKeychainSyncTextEntryController setSecureTextEntry:](v2, "setSecureTextEntry:", 1);
    v4 = objc_alloc_init(DevicePINController);
    devicePINController = v2->_devicePINController;
    v2->_devicePINController = v4;

    -[DevicePINController setMode:](v2->_devicePINController, "setMode:", 3);
    -[PSKeychainSyncTextEntryController setNumberOfPasscodeFields:](v2, "setNumberOfPasscodeFields:", -[DevicePINController pinLength](v2->_devicePINController, "pinLength"));
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[KeychainSyncDevicePINController cancelPreviousPerformRequestsWithTarget:](KeychainSyncDevicePINController, "cancelPreviousPerformRequestsWithTarget:", self);
  v4.receiver = self;
  v4.super_class = (Class)KeychainSyncDevicePINController;
  -[PSKeychainSyncTextEntryController dealloc](&v4, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_updateBlockedState_, *MEMORY[0x1E0CEB828], 0);

  v6.receiver = self;
  v6.super_class = (Class)KeychainSyncDevicePINController;
  -[PSKeychainSyncTextEntryController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[UIKeyboard setUserInteractionEnabled:](self->_disabledKeyboard, "setUserInteractionEnabled:", 1);
  -[KeychainSyncDevicePINController setDisabledKeyboard:](self, "setDisabledKeyboard:", 0);
  +[KeychainSyncDevicePINController cancelPreviousPerformRequestsWithTarget:](KeychainSyncDevicePINController, "cancelPreviousPerformRequestsWithTarget:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB828], 0);

  v6.receiver = self;
  v6.super_class = (Class)KeychainSyncDevicePINController;
  -[PSKeychainSyncTextEntryController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)updateBlockedState:(id)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;

  v4 = -[DevicePINController isBlocked](self->_devicePINController, "isBlocked", a3);
  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", !v4);
  if (v4)
    v5 = v7;
  else
    v5 = 0;
  -[KeychainSyncDevicePINController setDisabledKeyboard:](self, "setDisabledKeyboard:", v5);
  if (!v4 && self->_showingBlockedMessage)
  {
    UIKeyboardDisableAutomaticAppearance();
    -[PSListController reloadSpecifiers](self, "reloadSpecifiers");
    UIKeyboardEnableAutomaticAppearance();
    -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  DevicePINController *devicePINController;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  -[KeychainSyncDevicePINController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PS_LocalizedStringForKeychainSync(CFSTR("ENTER_PASSCODE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  v30.receiver = self;
  v30.super_class = (Class)KeychainSyncDevicePINController;
  -[PSKeychainSyncTextEntryController specifiers](&v30, sel_specifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncDevicePINController enterPasscodeTitle](self, "enterPasscodeTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetailText:", v7);

  self->_showingBlockedMessage = 0;
  v8 = -[DevicePINController isBlocked](self->_devicePINController, "isBlocked");
  devicePINController = self->_devicePINController;
  if (v8)
  {
    -[DevicePINController unblockTime](devicePINController, "unblockTime");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v13 = (v11 - v12) / 60.0;
    *(float *)&v12 = v13;
    LODWORD(v6) = vcvtps_s32_f32(*(float *)&v12);
    v14 = (_DWORD)v6 - 1;
    if ((_DWORD)v6 == 1)
      v15 = CFSTR("UNBLOCK_MINUTES_SINGLE");
    else
      v15 = CFSTR("UNBLOCK_MINUTES_PLURAL");
    PS_LocalizedStringForKeychainSync(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringFromNumber:numberStyle:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v16, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    self->_showingBlockedMessage = 1;
    v22 = (v13 - (double)v14) * 60.0;
    if (v22 > 0.0)
      -[KeychainSyncDevicePINController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateBlockedState_, 0, v22);
  }
  else
  {
    if (-[DevicePINController numberOfFailedAttempts](devicePINController, "numberOfFailedAttempts") < 1)
    {
      -[KeychainSyncDevicePINController enterPasscodeReason](self, "enterPasscodeReason");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if (-[DevicePINController numberOfFailedAttempts](self->_devicePINController, "numberOfFailedAttempts") == 1)
      v23 = CFSTR("PASSCODE_INCORRECT_SINGLE");
    else
      v23 = CFSTR("PASSCODE_INCORRECT_PLURAL");
    PS_LocalizedStringForKeychainSync(v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[DevicePINController numberOfFailedAttempts](self->_devicePINController, "numberOfFailedAttempts"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringFromNumber:numberStyle:", v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v16, v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:
  -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v21, CFSTR("footerText"));

  return v5;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  return 1;
}

- (void)didFinishEnteringText:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (-[DevicePINController isBlocked](self->_devicePINController, "isBlocked")
    || !-[DevicePINController attemptValidationWithPIN:](self->_devicePINController, "attemptValidationWithPIN:", v4))
  {
    UIKeyboardDisableAutomaticAppearance();
    -[PSListController reloadSpecifiers](self, "reloadSpecifiers");
    UIKeyboardEnableAutomaticAppearance();
    -[PSKeychainSyncTextEntryController textEntryView](self, "textEntryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

    -[KeychainSyncDevicePINController updateBlockedState:](self, "updateBlockedState:", 0);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)KeychainSyncDevicePINController;
    -[PSKeychainSyncTextEntryController didFinishEnteringText:](&v6, sel_didFinishEnteringText_, v4);
  }

}

- (NSString)enterPasscodeTitle
{
  return self->_enterPasscodeTitle;
}

- (void)setEnterPasscodeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_enterPasscodeTitle, a3);
}

- (NSString)enterPasscodeReason
{
  return self->_enterPasscodeReason;
}

- (void)setEnterPasscodeReason:(id)a3
{
  objc_storeStrong((id *)&self->_enterPasscodeReason, a3);
}

- (UIKeyboard)disabledKeyboard
{
  return self->_disabledKeyboard;
}

- (void)setDisabledKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_disabledKeyboard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledKeyboard, 0);
  objc_storeStrong((id *)&self->_enterPasscodeReason, 0);
  objc_storeStrong((id *)&self->_enterPasscodeTitle, 0);
  objc_storeStrong((id *)&self->_devicePINController, 0);
}

@end
