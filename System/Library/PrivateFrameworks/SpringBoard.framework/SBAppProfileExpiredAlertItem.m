@implementation SBAppProfileExpiredAlertItem

- (SBAppProfileExpiredAlertItem)initWithApp:(id)a3
{
  id v5;
  SBAppProfileExpiredAlertItem *v6;
  SBAppProfileExpiredAlertItem *v7;

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
  int v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication displayName](self->_app, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplication info](self->_app, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBeta");

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    v12 = CFSTR("APP_BETA_EXPIRED_TITLE_WITH_NAME_FORMAT");
  else
    v12 = CFSTR("APP_PROFILE_EXPIRED_TITLE_WITH_NAME_FORMAT");
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v13, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:", v14);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("APP_PROFILE_EXPIRED_OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__SBAppProfileExpiredAlertItem_configure_requirePasscodeForActions___block_invoke;
  v18[3] = &unk_1E8E9DCB0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v17);

}

uint64_t __68__SBAppProfileExpiredAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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
