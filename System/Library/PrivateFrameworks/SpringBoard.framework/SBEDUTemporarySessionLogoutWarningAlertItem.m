@implementation SBEDUTemporarySessionLogoutWarningAlertItem

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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBEDUTemporarySessionLogoutWarningAlertItem;
  -[SBAlertItem configure:requirePasscodeForActions:](&v21, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBAlertItem alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOGOUT_TEMPORARY_SESSION_LOGOUT_ALERT_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LOGOUT_TEMPORARY_SESSION_LOGOUT_ALERT_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v9);

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LOGOUT_BUTTON_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__SBEDUTemporarySessionLogoutWarningAlertItem_configure_requirePasscodeForActions___block_invoke;
  v20[3] = &unk_1E8E9DCB0;
  v20[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 2, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __83__SBEDUTemporarySessionLogoutWarningAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  v19[3] = &unk_1E8E9DCB0;
  v19[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v14);
  objc_msgSend(v5, "addAction:", v18);

}

uint64_t __83__SBEDUTemporarySessionLogoutWarningAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD v4[5];

  result = objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 112))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __83__SBEDUTemporarySessionLogoutWarningAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v4[3] = &unk_1E8E9DED8;
    v4[4] = v3;
    return objc_msgSend(MEMORY[0x1E0CD28B0], "bs_performAfterSynchronizedCommit:", v4);
  }
  return result;
}

uint64_t __83__SBEDUTemporarySessionLogoutWarningAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
}

uint64_t __83__SBEDUTemporarySessionLogoutWarningAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivate");
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (id)logoutActionHandler
{
  return self->_logoutActionHandler;
}

- (void)setLogoutActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_logoutActionHandler, 0);
}

@end
