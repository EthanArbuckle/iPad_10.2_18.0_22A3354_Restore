@implementation SBAppProfileNotTrustedAlertItem

- (SBAppProfileNotTrustedAlertItem)initWithApp:(id)a3
{
  id v5;
  SBAppProfileNotTrustedAlertItem *v6;
  SBAppProfileNotTrustedAlertItem *v7;

  v5 = a3;
  v6 = -[SBAlertItem init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_app, a3);

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
  void *v17;
  _QWORD v18[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APP_PROFILE_NOT_TRUSTED_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[SBApplication info](self->_app, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signerIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("APP_PROFILE_NOT_TRUSTED_BODY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMessage:", v14);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("APP_PROFILE_NOT_TRUSTED_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__SBAppProfileNotTrustedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E8E9DCB0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v17);

}

uint64_t __71__SBAppProfileNotTrustedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
}

@end
