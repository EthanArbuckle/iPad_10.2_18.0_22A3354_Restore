@implementation SBLowPowerFindMyAlertItem

+ (void)showFindMyAlert
{
  +[SBLowPowerFindMyAlertItem _readSupportsFindMy:](SBLowPowerFindMyAlertItem, "_readSupportsFindMy:", &__block_literal_global_262);
}

void __44__SBLowPowerFindMyAlertItem_showFindMyAlert__block_invoke(uint64_t a1, int a2)
{
  void *v2;
  SBLowPowerFindMyAlertItem *v3;

  if (a2)
  {
    v3 = objc_alloc_init(SBLowPowerFindMyAlertItem);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "activateAlertItem:", v3);

  }
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
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
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("LOW_BATT_FIND_MY_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA508], "modelSpecificLocalizedStringKeyForKey:", CFSTR("LOW_BATT_FIND_MY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTitle:", v9);
  objc_msgSend(v6, "setMessage:", v12);
  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke;
    v17[3] = &unk_1E8E9DCB0;
    v17[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v16);

  }
}

void __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];

  v2 = objc_alloc_init(MEMORY[0x1E0D898D8]);
  objc_msgSend(*(id *)(a1 + 32), "setBeaconManager:", v2);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_2;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setUserHasAcknowledgedFindMy:completion:", 1, v3);

}

void __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_3;
  block[3] = &unk_1E8E9DED8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__SBLowPowerFindMyAlertItem_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBeaconManager:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)shouldShowInLockScreen
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarDestinationActive");

  return v3;
}

+ (void)_readSupportsFindMy:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D898D8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke;
  v7[3] = &unk_1E8EAAA98;
  v8 = v4;
  v9 = v3;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v5, "isLPEMModeSupported:", v7);

}

void __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke(uint64_t a1, char a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke_2;
  v4[3] = &unk_1E8EA0D88;
  v5 = *(id *)(a1 + 40);
  v6 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  v3 = (id)objc_opt_self();

}

uint64_t __49__SBLowPowerFindMyAlertItem__readSupportsFindMy___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beaconManager, 0);
}

@end
