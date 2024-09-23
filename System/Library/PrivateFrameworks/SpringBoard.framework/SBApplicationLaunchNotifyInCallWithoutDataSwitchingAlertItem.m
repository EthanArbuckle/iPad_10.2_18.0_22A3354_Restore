@implementation SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem *v41;

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DB0A80]);
  objc_msgSend((id)SBApp, "systemStatusServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v7, "initWithServerHandle:", v8);

  objc_msgSend(v37, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "invalidate");
  v36 = v9;
  objc_msgSend(v9, "primarySIMInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "secondarySIMInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isProvidingDataConnection");
  v13 = v11;
  v35 = v11;
  if (v12)
    v11 = v10;
  else
    v13 = v10;
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (void *)MEMORY[0x1E0CB34D0];
  v16 = v13;
  v17 = v11;
  objc_msgSend(v15, "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_BODY_FORMAT"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "label");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringWithFormat:", v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v22);

  v23 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_ENABLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke;
  v39[3] = &unk_1E8E9DC88;
  v40 = v33;
  v41 = self;
  v27 = v33;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v28);

  v29 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("IN_CALL_NO_DATA_SWITCHING_LAUNCH_ALERT_CANCEL"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v26;
  v38[1] = 3221225472;
  v38[2] = __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v38[3] = &unk_1E8E9DCB0;
  v38[4] = self;
  objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 1, v38);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v32);

}

uint64_t __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCellDataSwitchingEnabled:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "deactivateForButton");
}

uint64_t __100__SBApplicationLaunchNotifyInCallWithoutDataSwitchingAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

@end
