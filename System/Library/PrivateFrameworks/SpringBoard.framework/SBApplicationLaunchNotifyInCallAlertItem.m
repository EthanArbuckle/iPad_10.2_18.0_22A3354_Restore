@implementation SBApplicationLaunchNotifyInCallAlertItem

- (SBApplicationLaunchNotifyInCallAlertItem)initWithApplication:(id)a3
{
  SBApplicationLaunchNotifyInCallAlertItem *v3;
  SBApplicationLaunchNotifyInCallAlertItem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationLaunchNotifyInCallAlertItem;
  v3 = -[SBApplicationLaunchNotifyAlertItem initWithApplication:](&v6, sel_initWithApplication_, a3);
  v4 = v3;
  if (v3)
    -[SBAlertItem setAllowInCar:](v3, "setAllowInCar:", 1);
  return v4;
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
  _QWORD v12[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IN_CALL_LAUNCH_ALERT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("IN_CALL_LAUNCH_OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__SBApplicationLaunchNotifyInCallAlertItem_configure_requirePasscodeForActions___block_invoke;
  v12[3] = &unk_1E8E9DCB0;
  v12[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v11);

}

uint64_t __80__SBApplicationLaunchNotifyInCallAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

@end
