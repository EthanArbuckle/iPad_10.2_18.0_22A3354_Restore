@implementation SBApplicationSignatureVersionUnsupportedAlertItem

- (SBApplicationSignatureVersionUnsupportedAlertItem)initWithApplication:(id)a3
{
  id v5;
  SBApplicationSignatureVersionUnsupportedAlertItem *v6;
  SBApplicationSignatureVersionUnsupportedAlertItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSignatureVersionUnsupportedAlertItem;
  v6 = -[SBAlertItem init](&v9, sel_init);
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_ERROR_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication displayName](self->_application, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_ERROR_BODY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v16);

  v17 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SIGNATURE_VERSION_UNSUPPORTED_ERROR_ACKNOWLEDGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__SBApplicationSignatureVersionUnsupportedAlertItem_configure_requirePasscodeForActions___block_invoke;
  v21[3] = &unk_1E8E9DCB0;
  v21[4] = self;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v20);
  objc_msgSend(v5, "setPreferredAction:", v20);

}

uint64_t __89__SBApplicationSignatureVersionUnsupportedAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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
