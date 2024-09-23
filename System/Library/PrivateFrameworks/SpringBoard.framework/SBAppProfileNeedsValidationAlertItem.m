@implementation SBAppProfileNeedsValidationAlertItem

- (SBAppProfileNeedsValidationAlertItem)initWithApp:(id)a3
{
  id v5;
  SBAppProfileNeedsValidationAlertItem *v6;
  SBAppProfileNeedsValidationAlertItem *v7;

  v5 = a3;
  v6 = -[SBAlertItem init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_application, a3);

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
  _QWORD v17[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APP_PROFILE_NEEDS_VALIDATION_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[SBApplication info](self->_application, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signerIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("APP_PROFILE_NEEDS_VALIDATION_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMessage:", v13);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("APP_PROFILE_NEEDS_VALIDATION_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__SBAppProfileNeedsValidationAlertItem_configure_requirePasscodeForActions___block_invoke;
  v17[3] = &unk_1E8E9DCB0;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v15, 1, v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v16);

}

uint64_t __76__SBAppProfileNeedsValidationAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_application, 0);
}

@end
