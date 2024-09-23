@implementation SBCarDoNotDisturbExitConfirmationAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SBCarDoNotDisturbExitConfirmationAlertItem;
  -[SBAlertItem configure:requirePasscodeForActions:](&v18, sel_configure_requirePasscodeForActions_, a3, a4);
  -[SBAlertItem alertController](self, "alertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredStyle:", 0);
  objc_msgSend(v5, "setTitle:", 0);
  objc_msgSend(v5, "setMessage:", 0);
  v6 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CARDND_EXIT_NOT_DRIVING"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke;
  v17[3] = &unk_1E8E9DCB0;
  v17[4] = self;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 0, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v10);
  if (-[SBCarDoNotDisturbExitConfirmationAlertItem showSiriHeaderViewController](self, "showSiriHeaderViewController"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DA7A00]);
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v5, "_setSeparatedHeaderContentViewController:", v11);

  }
  v12 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v16[3] = &unk_1E8E9DCB0;
  v16[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v15);

}

void __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  void (**v2)(void);

  objc_msgSend(*(id *)(a1 + 32), "notDrivingActionHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    v1[2]();
    v1 = v2;
  }

}

uint64_t __82__SBCarDoNotDisturbExitConfirmationAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (void)controllerDidProvideContext:(id)a3
{
  -[SBAlertItem deactivateForReason:](self, "deactivateForReason:", 4);
}

- (id)notDrivingActionHandler
{
  return self->_notDrivingActionHandler;
}

- (void)setNotDrivingActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)showSiriHeaderViewController
{
  return self->_showSiriHeaderViewController;
}

- (void)setShowSiriHeaderViewController:(BOOL)a3
{
  self->_showSiriHeaderViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notDrivingActionHandler, 0);
}

@end
