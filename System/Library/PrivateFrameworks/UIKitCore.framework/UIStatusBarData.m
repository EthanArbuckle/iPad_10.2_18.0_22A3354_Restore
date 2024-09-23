@implementation UIStatusBarData

void __37___UIStatusBarData_staticDisplayData__block_invoke()
{
  _UIStatusBarData *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIStatusBarDataCellularEntry *v11;
  _UIStatusBarDataWifiEntry *v12;
  _UIStatusBarDataBatteryEntry *v13;
  void *v14;
  id v15;

  v0 = objc_alloc_init(_UIStatusBarData);
  v1 = (void *)_MergedGlobals_1_20;
  _MergedGlobals_1_20 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextDateAfterDate:matchingHour:minute:second:options:", v3, 9, 41, 0, 512);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setAMSymbol:", &stru_1E16EDF20);
  objc_msgSend(v4, "setPMSymbol:", &stru_1E16EDF20);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setTimeStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v15, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDataStringEntry entryWithStringValue:](_UIStatusBarDataStringEntry, "entryWithStringValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_20, "setTimeEntry:", v6);

  objc_msgSend(v4, "stringForObjectValue:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDataStringEntry entryWithStringValue:](_UIStatusBarDataStringEntry, "entryWithStringValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_20, "setShortTimeEntry:", v8);

  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v15, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIStatusBarDataStringEntry entryWithStringValue:](_UIStatusBarDataStringEntry, "entryWithStringValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1_20, "setDateEntry:", v10);

  v11 = objc_alloc_init(_UIStatusBarDataCellularEntry);
  -[_UIStatusBarDataNetworkEntry setStatus:](v11, "setStatus:", 5);
  -[_UIStatusBarDataCellularEntry setType:](v11, "setType:", 5);
  -[_UIStatusBarDataCellularEntry setString:](v11, "setString:", CFSTR("Carrier"));
  -[_UIStatusBarDataIntegerEntry setDisplayValue:](v11, "setDisplayValue:", 4);
  objc_msgSend((id)_MergedGlobals_1_20, "setCellularEntry:", v11);
  v12 = objc_alloc_init(_UIStatusBarDataWifiEntry);
  -[_UIStatusBarDataNetworkEntry setStatus:](v12, "setStatus:", 5);
  -[_UIStatusBarDataWifiEntry setType:](v12, "setType:", 0);
  -[_UIStatusBarDataIntegerEntry setDisplayValue:](v12, "setDisplayValue:", 3);
  objc_msgSend((id)_MergedGlobals_1_20, "setWifiEntry:", v12);
  v13 = objc_alloc_init(_UIStatusBarDataBatteryEntry);
  -[_UIStatusBarDataBatteryEntry setCapacity:](v13, "setCapacity:", 100);
  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E1A96080, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIStatusBarDataBatteryEntry setDetailString:](v13, "setDetailString:", v14);

  -[_UIStatusBarDataBatteryEntry setState:](v13, "setState:", 0);
  objc_msgSend((id)_MergedGlobals_1_20, "setMainBatteryEntry:", v13);

}

void __29___UIStatusBarData_entryKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("timeEntry"), CFSTR("shortTimeEntry"), CFSTR("dateEntry"), CFSTR("personNameEntry"), CFSTR("deviceNameEntry"), CFSTR("cellularEntry"), CFSTR("secondaryCellularEntry"), CFSTR("wifiEntry"), CFSTR("mainBatteryEntry"), CFSTR("bluetoothEntry"), CFSTR("thermalEntry"), CFSTR("activityEntry"), CFSTR("tetheringEntry"), CFSTR("lockEntry"), CFSTR("quietModeEntry"), CFSTR("electronicTollCollectionEntry"), CFSTR("rotationLockEntry"),
    CFSTR("locationEntry"),
    CFSTR("airplaneModeEntry"),
    CFSTR("ttyEntry"),
    CFSTR("assistantEntry"),
    CFSTR("studentEntry"),
    CFSTR("vpnEntry"),
    CFSTR("liquidDetectionEntry"),
    CFSTR("displayWarningEntry"),
    CFSTR("voiceControlEntry"),
    CFSTR("airPlayEntry"),
    CFSTR("carPlayEntry"),
    CFSTR("alarmEntry"),
    CFSTR("satelliteEntry"),
    CFSTR("sensorActivityEntry"),
    CFSTR("radarEntry"),
    CFSTR("announceNotificationsEntry"),
    CFSTR("volumeEntry"),
    CFSTR("backgroundActivityEntry"),
    CFSTR("backNavigationEntry"),
    CFSTR("forwardNavigationEntry"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79EF8;
  qword_1ECD79EF8 = v0;

}

@end
