@implementation SBActivationFailedAlertItem

- (SBActivationFailedAlertItem)initWithFailureCount:(int)a3 slot:(int64_t)a4
{
  SBActivationFailedAlertItem *v6;
  SBActivationFailedAlertItem *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBActivationFailedAlertItem;
  v6 = -[SBAlertItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_slot = a4;
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "carrierBundleInfoForSlot:", v7->_slot);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isReinitiatingActivationDisabled") & 1) != 0)
    {
      v7->_showSupportNumber = 1;
    }
    else
    {
      v7->_showRetryButton = 1;
      if (a3 >= 2)
      {
        v7->_showSupportNumber = 1;
        if (a3 != 2)
          v7->_showRetryButton = 0;
      }
    }

  }
  return v7;
}

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
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 showRetryButton;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_FAILED_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_FAILED_BODY"), CFSTR("Contact your carrier if this problem continues to occur."), CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_showSupportNumber)
  {
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "carrierBundleInfoForSlot:", self->_slot);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "customerServicePhoneNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_FAILED_BODY_SUPPORT"), CFSTR("Contact your carrier at %@ from another phone if this problem continues to occur."), CFSTR("SpringBoard"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      UIFormattedPhoneNumberFromString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v15, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = v9;
    }

  }
  else
  {
    v17 = v9;
  }
  objc_msgSend(v5, "setMessage:", v17);
  showRetryButton = self->_showRetryButton;
  v19 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (showRetryButton)
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_FAILED_IGNORE_BUTTON"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke;
    v32[3] = &unk_1E8E9DCB0;
    v32[4] = self;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v22, 1, v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v23);

    v24 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_FAILED_RETRY_BUTTON"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v31[3] = &unk_1E8E9DCB0;
    v31[4] = self;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v27);

  }
  else
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DISMISS_ALERT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_3;
    v30[3] = &unk_1E8E9DCB0;
    v30[4] = self;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v28, 1, v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v29);

  }
}

uint64_t __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  CTStartOTASP();
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __67__SBActivationFailedAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)suppressForKeynote
{
  return 1;
}

@end
