@implementation SBTripleClickSOSMigrationAlertItem

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
  _QWORD v13[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SOS_TRIPLE_CLICK_MIGRATION_TITLE"), &stru_1E8EC7EC0, CFSTR("Late_Fall_2017_iOS_Strings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:", v7);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SOS_TRIPLE_CLICK_MIGRATION_BODY"), &stru_1E8EC7EC0, CFSTR("Late_Fall_2017_iOS_Strings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMessage:", v9);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SOS_TRIPLE_CLICK_MIGRATION_BUTTON_OK"), &stru_1E8EC7EC0, CFSTR("Late_Fall_2017_iOS_Strings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SBTripleClickSOSMigrationAlertItem_configure_requirePasscodeForActions___block_invoke;
  v13[3] = &unk_1E8E9DCB0;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v11, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12);

}

uint64_t __74__SBTripleClickSOSMigrationAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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

- (BOOL)allowInSetup
{
  return 1;
}

@end
