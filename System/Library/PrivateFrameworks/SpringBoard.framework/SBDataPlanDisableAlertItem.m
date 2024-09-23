@implementation SBDataPlanDisableAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAlertItem alertController](self, "alertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_DISABLE_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_DISABLE_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v9);

  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke;
    v18[3] = &unk_1E8E9DCB0;
    v18[4] = self;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v13);

    v14 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v17[3] = &unk_1E8E9DCB0;
    v17[4] = self;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v16);

  }
}

uint64_t __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __66__SBDataPlanDisableAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_showSettings");
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (void)_showSettings
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);

}

@end
