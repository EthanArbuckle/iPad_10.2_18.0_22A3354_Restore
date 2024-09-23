@implementation SBVPPAppRequiresHealingAlertItem

- (SBVPPAppRequiresHealingAlertItem)initWithApplication:(id)a3
{
  id v5;
  SBVPPAppRequiresHealingAlertItem *v6;
  SBVPPAppRequiresHealingAlertItem *v7;

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
  void *v17;
  _QWORD v18[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APP_REPAIR_REQUIRES_NETWORK_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  -[SBApplication displayName](self->_application, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("APP_REPAIR_REQUIRES_NETWORK_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", v10, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMessage:", v14);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("APP_REPAIR_REQUIRES_NETWORK_OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __72__SBVPPAppRequiresHealingAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E8E9DCB0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v17);

}

uint64_t __72__SBVPPAppRequiresHealingAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
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
