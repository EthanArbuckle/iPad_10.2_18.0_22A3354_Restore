@implementation SBBluetoothAccessoryLowPowerAlertItem

- (SBBluetoothAccessoryLowPowerAlertItem)initWithAccessory:(id)a3 batteryLevel:(int64_t)a4
{
  id v6;
  SBBluetoothAccessoryLowPowerAlertItem *v7;
  SBBluetoothAccessoryLowPowerAlertItem *v8;
  uint64_t v9;
  NSString *accessoryName;

  v6 = a3;
  v7 = -[SBAlertItem init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_batteryLevel = a4;
    v9 = objc_msgSend(v6, "copy");
    accessoryName = v8->_accessoryName;
    v8->_accessoryName = (NSString *)v9;

  }
  return v8;
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
  _QWORD v22[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)SBApp;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_batteryLevel / 100.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formattedPercentStringForNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_LOW_POWER_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, self->_accessoryName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_LOW_POWER_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:", v12);
  objc_msgSend(v5, "setMessage:", v16);
  if (!a3)
  {
    v17 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CLOSE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__SBBluetoothAccessoryLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke;
    v22[3] = &unk_1E8E9DCB0;
    v22[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v20);

  }
}

uint64_t __77__SBBluetoothAccessoryLowPowerAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)wakeDisplay
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryName, 0);
}

@end
