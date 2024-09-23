@implementation SBPearlInterlockAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPearlInterlockAlertItem _title](self, "_title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  -[SBPearlInterlockAlertItem _message](self, "_message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v7);

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACE_ID_DISABLED_GO_TO_SETTINGS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E8E9DCB0;
  v18[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v12);
  v13 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACE_ID_DISABLED_CLOSE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v17[3] = &unk_1E8E9DCB0;
  v17[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v16);
  objc_msgSend(v5, "setPreferredAction:", v12);

}

uint64_t __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ROOT"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v2, 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

uint64_t __65__SBPearlInterlockAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)reappearsAfterLock
{
  return 1;
}

- (id)_title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACE_ID_DISABLED_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_message
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FACE_ID_DISABLED_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
