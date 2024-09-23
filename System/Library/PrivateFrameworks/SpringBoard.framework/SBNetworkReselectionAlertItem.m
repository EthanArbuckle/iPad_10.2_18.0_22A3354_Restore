@implementation SBNetworkReselectionAlertItem

- (SBNetworkReselectionAlertItem)initWithSlot:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBNetworkReselectionAlertItem *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NETWORK_LOST"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NETWORK_LOST_TEXT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBPhoneAlertItem initWithTitle:bodyText:slot:](self, "initWithTitle:bodyText:slot:", v6, v8, a3);

  return v9;
}

- (void)_showPrefs
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Carrier"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);

}

- (id)lockLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NETWORK_LOST_LOCK_LABEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shortLockLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NETWORK_LOST_LOCK_LABEL_SHORT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performUnlockAction
{
  -[SBNetworkReselectionAlertItem _showPrefs](self, "_showPrefs");
  -[SBAlertItem deactivate](self, "deactivate");
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "telephonyStateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBPhoneAlertItem slot](self, "slot");
  objc_msgSend(v6, "subscriptionInfoForSlot:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "registrationRejectionCauseCode") - 2;
  if (v7 && objc_msgSend(v6, "isDualSIMEnabled"))
  {
    if (v7 == 1)
      v10 = 2;
    else
      v10 = 1;
    v11 = objc_msgSend(v6, "isSIMPresentForSlot:", v10);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v31 = v8;
  if (v9 > 4)
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NETWORK_LOST"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = CFSTR("NETWORK_LOST_TEXT_FORMAT");
      goto LABEL_13;
    }
    v21 = CFSTR("NETWORK_LOST_TEXT");
  }
  else
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("NETWORK_RESTRICTED"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = CFSTR("NETWORK_RESTRICTED_TEXT_FORMAT");
LABEL_13:
      objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_1E8EC7EC0, CFSTR("SpringBoard-gemini"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "SIMLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    v21 = CFSTR("NETWORK_RESTRICTED_TEXT");
  }
  objc_msgSend(v16, "localizedStringForKey:value:table:", v21, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  objc_msgSend(v5, "setTitle:", v14);
  objc_msgSend(v5, "setMessage:", v20);
  if (!a3)
  {
    v22 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("DISMISS_ALERT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke;
    v33[3] = &unk_1E8E9DCB0;
    v33[4] = self;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v25);

    v26 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v32[3] = &unk_1E8E9DCB0;
    v32[4] = self;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 0, v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addAction:", v29);
    objc_msgSend(v5, "setPreferredAction:", v29);

  }
}

uint64_t __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __69__SBNetworkReselectionAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_showPrefs");
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

@end
