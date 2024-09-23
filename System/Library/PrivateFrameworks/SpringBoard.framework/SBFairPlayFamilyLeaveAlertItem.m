@implementation SBFairPlayFamilyLeaveAlertItem

- (SBFairPlayFamilyLeaveAlertItem)initWithAppInfo:(id)a3
{
  id v6;
  SBFairPlayFamilyLeaveAlertItem *v7;
  SBFairPlayFamilyLeaveAlertItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFairPlayFamilyLeaveAlertItem.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appInfo"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBFairPlayFamilyLeaveAlertItem;
  v7 = -[SBAlertItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_appInfo, a3);

  return v8;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FAIRPLAY_FAMILY_LEAVE_ALERT_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FAIRPLAY_FAMILY_LEAVE_ALERT_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v9);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FAIRPLAY_FAMILY_LEAVE_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke;
  v20[3] = &unk_1E8E9DCB0;
  v20[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v11, 1, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "restrictionController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v15, "isApplicationIdentifierRestricted:", CFSTR("com.apple.AppStore"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FAIRPLAY_FAMILY_LEAVE_APP_STORE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v19[3] = &unk_1E8E9DCB0;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v17, 0, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v18);

  }
}

uint64_t __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

void __70__SBFairPlayFamilyLeaveAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("itms-apps://?action=lookup&ids=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if ((SBWorkspaceActivateApplicationFromURL(v8, 0, 0) & 1) == 0)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", CFSTR("com.apple.AppStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      SBWorkspaceActivateApplication(v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");

}

- (FBSApplicationInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfo, 0);
}

@end
