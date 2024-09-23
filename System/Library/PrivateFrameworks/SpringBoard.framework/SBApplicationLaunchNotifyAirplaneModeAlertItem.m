@implementation SBApplicationLaunchNotifyAirplaneModeAlertItem

- (SBApplicationLaunchNotifyAirplaneModeAlertItem)initWithApplication:(id)a3
{
  id v4;
  SBApplicationLaunchNotifyAirplaneModeAlertItem *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBApplicationLaunchNotifyAirplaneModeAlertItem;
  v5 = -[SBApplicationLaunchNotifyAlertItem initWithApplication:](&v7, sel_initWithApplication_, v4);
  if (v5)
    v5->_usesCellNetwork = (objc_msgSend(v4, "dataUsage") & 4) != 0;

  return v5;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  unsigned int v5;
  int v6;

  v5 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isOnCellular](self);
  v6 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isMessagesApplication](self);
  -[SBApplicationLaunchNotifyAirplaneModeAlertItem _configureForAirplaneModeDataAlertOnCellular:isMessagesApplication:](self, v5, v6);
}

- (BOOL)_isOnCellular
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "application");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "dataUsage") != 0;

  return v2;
}

- (void)_isMessagesApplication
{
  void *v1;
  void *v2;
  uint64_t v3;

  if (result)
  {
    objc_msgSend(result, "application");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

    return (void *)v3;
  }
  return result;
}

- (void)_configureForAirplaneModeDataAlertOnCellular:(int)a3 isMessagesApplication:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  char v20;

  if (a1)
  {
    objc_msgSend(a1, "alertController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationLaunchNotifyAirplaneModeAlertItem _alertTitleForOnCellular:isMessagesApplication:]((uint64_t)a1, a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
      v10 = CFSTR("AIRPLANE_DISABLE");
    else
      v10 = CFSTR("AIRPLANE_DATA_SETTINGS");
    if (a2)
      v11 = CFSTR("AIRPLANE_CANCEL");
    else
      v11 = CFSTR("AIRPLANE_DATA_OK");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke;
    v19[3] = &unk_1E8EBC2C0;
    v19[4] = a1;
    v20 = a2;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v12, 0, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v14);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v11, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke_2;
    v18[3] = &unk_1E8E9DCB0;
    v18[4] = a1;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v16, a2, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v17);

  }
}

- (id)_createSystemApertureElement
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  SBAlertProvidedContentElement *v16;
  _QWORD v18[4];
  id v19;
  BOOL v20;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0DAC6A8]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6B8]), "initWithSystemImageName:", CFSTR("airplane"));
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentColor:", v5);

  objc_msgSend(v3, "setLeadingContentViewProvider:", v4);
  v6 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isOnCellular](self);
  v7 = -[SBApplicationLaunchNotifyAirplaneModeAlertItem _isMessagesApplication](self);
  -[SBApplicationLaunchNotifyAirplaneModeAlertItem _alertTitleForOnCellular:isMessagesApplication:]((uint64_t)self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC6E8]), "initWithText:style:", v8, 0);
  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setPrimaryContentViewProvider:", v9);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_DISABLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  else
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_DATA_GO_TO_SETTINGS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0DAC690]);
  v13 = (void *)MEMORY[0x1E0CEA2A8];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__SBApplicationLaunchNotifyAirplaneModeAlertItem__createSystemApertureElement__block_invoke;
  v18[3] = &unk_1E8EA9FF0;
  objc_copyWeak(&v19, &location);
  v20 = v6;
  objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v11, 0, 0, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithDefaultTextActionConfigurationWithAction:", v14);

  objc_msgSend(v3, "setActionContentViewProvider:", v15);
  v16 = -[SBSystemApertureProvidedContentElement initWithIdentifier:contentProvider:]([SBAlertProvidedContentElement alloc], "initWithIdentifier:contentProvider:", self, v3);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v16;
}

- (id)_alertTitleForOnCellular:(int)a3 isMessagesApplication:
{
  void *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  void *v7;

  if (a1)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("AIRPLANE_CELL_PROMPT_SMS");
    }
    else if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("AIRPLANE_CELL_PROMPT");
    }
    else if (MGGetBoolAnswer())
    {
      v6 = MGGetBoolAnswer();
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v6)
        v5 = CFSTR("AIRPLANE_DATA_PROMPT_WLAN");
      else
        v5 = CFSTR("AIRPLANE_DATA_PROMPT");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("AIRPLANE_DATA_PROMPT_NO_WIFI");
    }
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __78__SBApplicationLaunchNotifyAirplaneModeAlertItem__createSystemApertureElement__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBApplicationLaunchNotifyAirplaneModeAlertItem _primaryActionTriggeredForOnCellular:]((uint64_t)WeakRetained, *(unsigned __int8 *)(a1 + 40));

}

- (uint64_t)_primaryActionTriggeredForOnCellular:(uint64_t)result
{
  void *v2;

  if (result)
  {
    v2 = (void *)result;
    if (a2)
      -[SBApplicationLaunchNotifyAirplaneModeAlertItem _turnOffAirplaneMode](result);
    else
      -[SBApplicationLaunchNotifyAirplaneModeAlertItem _sendUserToSettings](result);
    return objc_msgSend(v2, "deactivateForButton");
  }
  return result;
}

uint64_t __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke(uint64_t a1)
{
  return -[SBApplicationLaunchNotifyAirplaneModeAlertItem _primaryActionTriggeredForOnCellular:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __117__SBApplicationLaunchNotifyAirplaneModeAlertItem__configureForAirplaneModeDataAlertOnCellular_isMessagesApplication___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (void)_turnOffAirplaneMode
{
  id v1;

  if (a1)
  {
    +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setInAirplaneMode:", 0);

  }
}

- (void)_sendUserToSettings
{
  id v1;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ROOT#AIRPLANE_MODE"));
    v1 = (id)objc_claimAutoreleasedReturnValue();
    SBWorkspaceActivateApplicationFromURL(v1, 0, 0);

  }
}

@end
