@implementation PSGDateTimeController

- (void)_setSpecifier:(id)a3 valueEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);

  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCellEnabled:", v4);
  objc_msgSend(v9, "setNeedsDisplay");
  -[PSGDateTimeController reloadSpecifier:](self, "reloadSpecifier:", v7);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  -[PSGDateTimeController minuteTimer](self, "minuteTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  CFRelease(self->_timeFormatter);
  CFRelease(self->_dateFormatter);
  v6.receiver = self;
  v6.super_class = (Class)PSGDateTimeController;
  -[PSGDateTimeController dealloc](&v6, sel_dealloc);
}

- (PSGDateTimeController)init
{
  PSGDateTimeController *v2;
  CoreTelephonyClient *v3;
  CoreTelephonyClient *client;
  void *v5;
  void *v6;
  void *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  PSGWallClockMinuteTimer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSGDateTimeController;
  v2 = -[PSGDateTimeController init](&v11, sel_init);
  if (v2)
  {
    v3 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x24BDC2810]);
    client = v2->__client;
    v2->__client = v3;

    -[CoreTelephonyClient setDelegate:](v2->__client, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_significantTimeChange_, CFSTR("SignificantTimeChange"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_localeChanged_, *MEMORY[0x24BDBCA70], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_effectiveSettingsChanged_, *MEMORY[0x24BE63740], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)TimeZoneConfirmed, (CFStringRef)*MEMORY[0x24BE289E0], 0, CFNotificationSuspensionBehaviorCoalesce);
    -[PSGDateTimeController _createDateTimeFormatters](v2, "_createDateTimeFormatters");
    v9 = -[PSGWallClockMinuteTimer initWithTarget:selector:]([PSGWallClockMinuteTimer alloc], "initWithTarget:selector:", v2, sel__updateCurrentTime);
    -[PSGDateTimeController setMinuteTimer:](v2, "setMinuteTimer:", v9);

  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)PSGDateTimeController;
  -[PSGDateTimeController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/DATE_AND_TIME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_BundleForGeneralSettingsUIFramework();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("DATE_AND_TIME"), CFSTR("General"), v6, v8);

  objc_msgSend(MEMORY[0x24BDD19B8], "general_rootPaneComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.date-and-time"), v9, v11, v4);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CFTimeZoneRef v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  CFLocaleRef v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD block[5];

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  -[PSGDateTimeController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("Date & Time"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("TIME_ZONE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController setTimeZoneSpecifier:](self, "setTimeZoneSpecifier:", v6);

  -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);

  v8 = CFTimeZoneCopySystem();
  if (v8)
  {
    PSCityForTimeZone();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), (CFStringRef)*MEMORY[0x24BDBD568]);
  if (v10)
  {
    v11 = v10;
    v12 = CFLocaleCreate(0, v10);
    CFRelease(v11);
    if (!v12)
      goto LABEL_8;
    goto LABEL_7;
  }
  v12 = CFLocaleCopyCurrent();
  if (v12)
  {
LABEL_7:
    self->_localeForces24HourTime = PSLocaleUses24HourClock();
    CFRelease(v12);
  }
LABEL_8:
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "sf_isiPad");

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v5, "specifierForID:", CFSTR("SHOW_DATE_IN_STATUS_BAR"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierForID:", CFSTR("SHOW_AMPM_IN_STATUS_BAR"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v16);
    goto LABEL_12;
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("SHOW_AMPM_IN_STATUS_BAR"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController setAmpmToggleSpecifier:](self, "setAmpmToggleSpecifier:", v15);

  objc_msgSend(v5, "specifierForID:", CFSTR("24_HOUR_TIME"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performGetter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
    -[PSGDateTimeController ampmToggleSpecifier](self, "ampmToggleSpecifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    objc_msgSend(v5, "removeObject:", v19);

  }
  -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v20, "setProperty:forKey:", PSLegacyCityFromCity(), *MEMORY[0x24BE759E0]);
  }
  else
  {
    -[__CFTimeZone name](v8, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProperty:forKey:", v21, *MEMORY[0x24BE759E0]);

  }
  objc_msgSend(v5, "specifierForID:", CFSTR("SET_AUTOMATICALLY"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController useAutomaticTime:](self, "useAutomaticTime:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "isAutomaticDateAndTimeEnforced") ^ 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "specifierForID:", CFSTR("SET_AUTOMATICALLY"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setProperty:forKey:", v27, *MEMORY[0x24BE75A18]);

    -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGDateTimeController _setSpecifier:valueEnabled:](self, "_setSpecifier:valueEnabled:", v29, 0);

    objc_msgSend(v5, "specifierForID:", CFSTR("SET_DATE_AND_TIME"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v30);

  }
  else
  {
    -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGDateTimeController _setSpecifier:valueEnabled:](self, "_setSpecifier:valueEnabled:", v31, 1);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "sf_inRetailKioskMode");

    if ((v33 & 1) == 0)
    {
      objc_msgSend(v5, "specifierForID:", CFSTR("TIME_ZONE"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v5, "indexOfObject:", v34);

      -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        -[PSGDateTimeController makeCurrentTimeSpecifier](self, "makeCurrentTimeSpecifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSGDateTimeController setCurrentTimeSpecifier:](self, "setCurrentTimeSpecifier:", v37);

      }
      -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertObject:atIndex:", v38, v35 + 1);

      -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertObject:atIndex:", v40, v35 + 2);

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__PSGDateTimeController_specifiers__block_invoke;
      block[3] = &unk_24F9C7C88;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  v41 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  -[PSGDateTimeController setAutomaticTimeFooter](self, "setAutomaticTimeFooter");
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v4;
}

void __35__PSGDateTimeController_specifiers__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "minuteTimer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startTimer");

}

- (void)setAutomaticTimeFooter
{
  int v3;
  void *v4;
  int v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  intptr_t (*v29)(uint64_t, char);
  void *v30;
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v3 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/TimeZone.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x24BDBFA88], "authorizationStatusForBundle:", v4);
  v6 = objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled");
  if (v5 == 3)
    v7 = v6;
  else
    v7 = 0;
  if (v3)
  {
    if ((v7 & 1) == 0)
      goto LABEL_9;
LABEL_8:
    v8 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(MEMORY[0x24BE755D8], "wifiEnabled") & v7 & 1) != 0)
    goto LABEL_8;
LABEL_9:
  SFLocalizableWAPIStringKeyForKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForDateAndTime(v9);
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(MEMORY[0x24BEDE4E8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __47__PSGDateTimeController_setAutomaticTimeFooter__block_invoke;
  v30 = &unk_24F9C8560;
  v32 = &v33;
  v12 = v11;
  v31 = v12;
  objc_msgSend(v10, "isUpdateWaitingWithCompletion:", &v27);
  v13 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v12, v13);
  if (*((_BYTE *)v34 + 24))
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    PSG_LocalizedStringForDateAndTime(CFSTR("%@_TZUPDATE_WAITING"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v8, v18, v27, v28, v29, v30);
      v19 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v19;
    }
    else
    {
      v8 = v18;
    }

  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isAutomaticDateAndTimeEnforced");

  if (v21)
  {
    PSG_LocalizedStringForDateAndTime(CFSTR("AUTO_TIME_RESTRICTED_FOOTER"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v8, v22);
      v24 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v24;
    }
    else
    {
      v8 = v22;
    }

  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "specifierForID:", CFSTR("AUTOMATIC_GROUP"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v8)
    objc_msgSend(v25, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);
  else
    objc_msgSend(v25, "removePropertyForKey:", *MEMORY[0x24BE75A68]);

  _Block_object_dispose(&v33, 8);
}

intptr_t __47__PSGDateTimeController_setAutomaticTimeFooter__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)reloadTimezone
{
  -[PSGDateTimeController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("TIME_ZONE"));
}

- (id)makeTimePickerSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F9C95C8, self, 0, 0, 0, 3, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", CFSTR("TIME_PICKER"));
  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE754D8], "preferredHeight");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v4, *MEMORY[0x24BE75D10]);

  objc_msgSend(v2, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v2;
}

- (id)makeCurrentTimeSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  -[PSGDateTimeController currentDateString](self, "currentDateString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, sel_valueForTime_, 0, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("CURRENT_TIME"));
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[PSGDateTimeController specifierAtIndex:](self, "specifierAtIndex:", -[PSGDateTimeController indexForIndexPath:](self, "indexForIndexPath:", a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("TIME_ZONE"));

  if (v9)
  {
    if (-[PSGDateTimeController shouldDisplayTimezoneSpinner](self, "shouldDisplayTimezoneSpinner"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v10, "startAnimating");
      objc_msgSend(v12, "setAccessoryView:", v10);
      objc_msgSend(v12, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", &stru_24F9C95C8);

    }
    else if ((objc_msgSend(v12, "cellEnabled") & 1) == 0)
    {
      objc_msgSend(v12, "setAccessoryType:", 0);
    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)PSGDateTimeController;
    -[PSGDateTimeController tableView:didSelectRowAtIndexPath:](&v14, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
    goto LABEL_6;
  }
  -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController indexPathForIndex:](self, "indexPathForIndex:", -[PSGDateTimeController indexOfSpecifier:](self, "indexOfSpecifier:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (!v11)
    goto LABEL_5;
  -[PSGDateTimeController makeTimePickerSpecifier](self, "makeTimePickerSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController setTimePickerSpecifier:](self, "setTimePickerSpecifier:", v12);

  -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v13, CFSTR("CURRENT_TIME"), 1);

LABEL_6:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  BOOL v10;

  v5 = a4;
  -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController indexPathForIndex:](self, "indexPathForIndex:", -[PSGDateTimeController indexOfSpecifier:](self, "indexOfSpecifier:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if (!v8)
    return 1;
  -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  return v10;
}

- (void)datePickerChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  PSGDateTimeController *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "beginBackgroundTaskWithExpirationHandler:", &__block_literal_global_3);

  objc_msgSend(v4, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSGDateTimeController_datePickerChanged___block_invoke_2;
  block[3] = &unk_24F9C85A8;
  v12 = self;
  v13 = v6;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, block);

}

void __43__PSGDateTimeController_datePickerChanged___block_invoke()
{
  NSLog(CFSTR("Failed to set manual time"));
}

void __43__PSGDateTimeController_datePickerChanged___block_invoke_2(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v3;
  _QWORD block[5];

  TMSetAutomaticTimeEnabled();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  TMSetManualTime();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 1u);
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(a1 + 48));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PSGDateTimeController_datePickerChanged___block_invoke_3;
  block[3] = &unk_24F9C7C88;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __43__PSGDateTimeController_datePickerChanged___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "significantTimeChange:", 0);
}

- (void)significantTimeChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[PSGDateTimeController specifierForID:](self, "specifierForID:", CFSTR("24_HOUR_TIME"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController is24HourTime:](self, "is24HourTime:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE759A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v5 != objc_msgSend(v6, "isOn"))
    objc_msgSend(v6, "setOn:animated:", v5, 1);
  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone");
  -[PSGDateTimeController reloadTimezone](self, "reloadTimezone");
  -[PSGDateTimeController _createDateTimeFormatters](self, "_createDateTimeFormatters");
  -[PSGDateTimeController _updateCurrentTime](self, "_updateCurrentTime");
  -[PSGDateTimeController minuteTimer](self, "minuteTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startTimer");

}

- (void)localeChanged:(id)a3
{
  -[PSGDateTimeController _createDateTimeFormatters](self, "_createDateTimeFormatters", a3);
  -[PSGDateTimeController _updateCurrentTime](self, "_updateCurrentTime");
}

- (void)effectiveSettingsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PSGDateTimeController_effectiveSettingsChanged___block_invoke;
  block[3] = &unk_24F9C7C88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __50__PSGDateTimeController_effectiveSettingsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (BOOL)shouldDisplayTimezoneSpinner
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PSGDateTimeController specifierForID:](self, "specifierForID:", CFSTR("SET_AUTOMATICALLY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController useAutomaticTime:](self, "useAutomaticTime:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = TMIsTimeZoneConfirmed() == 0;
  else
    v5 = 0;

  return v5;
}

- (id)useAutomaticTime:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", TMIsAutomaticTimeZoneEnabled() != 0);
}

- (void)setUseAutomaticTime:(id)a3 specifier:(id)a4
{
  id v6;
  int v7;
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
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v6 = a4;
  v7 = objc_msgSend(a3, "BOOLValue");
  -[PSGDateTimeController useAutomaticTime:](self, "useAutomaticTime:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v8, "BOOLValue");
  if (v7 != (_DWORD)v6)
  {
    TMSetAutomaticTimeZoneEnabled();
    if (v7)
    {
      TMSetAutomaticTimeEnabled();
      -[PSGDateTimeController minuteTimer](self, "minuteTimer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGDateTimeController _setSpecifier:valueEnabled:](self, "_setSpecifier:valueEnabled:", v10, 0);

      -[PSGDateTimeController reloadTimezone](self, "reloadTimezone");
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v12);

        -[PSGDateTimeController setCurrentTimeSpecifier:](self, "setCurrentTimeSpecifier:", 0);
      }
      -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PSGDateTimeController timePickerSpecifier](self, "timePickerSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v14);

        -[PSGDateTimeController setTimePickerSpecifier:](self, "setTimePickerSpecifier:", 0);
      }
      -[PSGDateTimeController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v24, 1);
    }
    else
    {
      -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PSCityForSpecifier();
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSGDateTimeController setTimeZoneValue:specifier:](self, "setTimeZoneValue:specifier:", v24, v16);

      }
      -[PSGDateTimeController timeZoneSpecifier](self, "timeZoneSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGDateTimeController _setSpecifier:valueEnabled:](self, "_setSpecifier:valueEnabled:", v17, 1);

      objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "sf_inRetailKioskMode");

      if ((v19 & 1) == 0)
      {
        -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          -[PSGDateTimeController makeCurrentTimeSpecifier](self, "makeCurrentTimeSpecifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSGDateTimeController setCurrentTimeSpecifier:](self, "setCurrentTimeSpecifier:", v21);

        }
        -[PSGDateTimeController currentTimeSpecifier](self, "currentTimeSpecifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSGDateTimeController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v22, CFSTR("TIME_ZONE"), 1);

        -[PSGDateTimeController minuteTimer](self, "minuteTimer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "startTimer");

      }
    }

  }
}

- (id)isShowingDateInStatusBar:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", CFPreferencesGetAppBooleanValue(CFSTR("StatusBarHidesDate"), CFSTR("com.apple.UIKit"), 0) == 0);
}

- (void)setShowDateInStatusBar:(id)a3 specifier:(id)a4
{
  CFPropertyListRef *v4;
  int v5;
  CFPropertyListRef *v6;

  v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  v5 = objc_msgSend(a3, "BOOLValue");
  v6 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (v5)
    v6 = v4;
  CFPreferencesSetAppValue(CFSTR("StatusBarHidesDate"), *v6, CFSTR("com.apple.UIKit"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.UIKit"));
}

- (id)isShowingAMPMInStatusBar:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", CFPreferencesGetAppBooleanValue(CFSTR("StatusBarHidesAMPM"), CFSTR("com.apple.UIKit"), 0) == 0);
}

- (void)setShowAMPMInStatusBar:(id)a3 specifier:(id)a4
{
  CFPropertyListRef *v4;
  int v5;
  CFPropertyListRef *v6;

  v4 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  v5 = objc_msgSend(a3, "BOOLValue");
  v6 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (v5)
    v6 = v4;
  CFPreferencesSetAppValue(CFSTR("StatusBarHidesAMPM"), *v6, CFSTR("com.apple.UIKit"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.UIKit"));
}

- (id)is24HourTime:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", +[PSGDateTimeState is24HourTime](PSGDateTimeState, "is24HourTime", a3));
}

- (void)set24HourTime:(id)a3 specifier:(id)a4
{
  id v5;
  char v6;
  void *v7;

  v5 = a3;
  +[PSGDateTimeState set24HourTime:](PSGDateTimeState, "set24HourTime:", objc_msgSend(v5, "BOOLValue"));
  v6 = objc_msgSend(v5, "BOOLValue");

  -[PSGDateTimeController ampmToggleSpecifier](self, "ampmToggleSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
    -[PSGDateTimeController removeSpecifier:animated:](self, "removeSpecifier:animated:", v7, 1);
  else
    -[PSGDateTimeController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v7, CFSTR("24_HOUR_TIME"), 1);

  -[PSGDateTimeController _createDateTimeFormatters](self, "_createDateTimeFormatters");
  -[PSGDateTimeController _updateCurrentTime](self, "_updateCurrentTime");
}

- (id)timeZoneValue:(id)a3
{
  id v4;
  CFTimeZoneRef v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CFTimeZoneResetSystem();
  v5 = CFTimeZoneCopySystem();
  PSCityForSpecifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSGDateTimeController specifierForID:](self, "specifierForID:", CFSTR("SET_AUTOMATICALLY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController useAutomaticTime:](self, "useAutomaticTime:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
  {
    if (v6)
    {
      -[__CFTimeZone name](v5, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqualToString:", v16);

      if (v17)
      {
        objc_msgSend(v6, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_12;
      }
    }
    goto LABEL_9;
  }
  PSCityForTimeZone();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFTimeZone name](v5, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Asia/Shanghai"));

  if (v13)
  {
    PSG_LocalizedStringForDateAndTime(CFSTR("BEIJING"));
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  if (!v11)
  {
LABEL_9:
    -[__CFTimeZone name](v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _PSGLoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = v11;
      _os_log_impl(&dword_22E024000, v18, OS_LOG_TYPE_DEFAULT, "Timezone is not in ALCityManager: %{public}@", (uint8_t *)&v20, 0xCu);
    }

  }
LABEL_12:

  return v11;
}

- (void)setTimeZoneValue:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75DA0]);

  CFPreferencesSetAppValue(CFSTR("timezone"), (CFPropertyListRef)objc_msgSend(v10, "classicIdentifier"), CFSTR("com.apple.preferences.datetime"));
  CFPreferencesSetAppValue(CFSTR("timezoneset"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.preferences.datetime"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.preferences.datetime"));
  v8 = (void *)MEMORY[0x24BE75610];
  objc_msgSend(v10, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone");
  -[PSGDateTimeController _createDateTimeFormatters](self, "_createDateTimeFormatters");
  -[PSGDateTimeController _updateCurrentTime](self, "_updateCurrentTime");

}

- (void)loadTimeZoneController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setSpecifier:", v4);

  objc_msgSend(v6, "setParentController:", self);
  -[PSGDateTimeController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)_updateCurrentTime
{
  void *v3;
  id v4;

  -[PSGDateTimeController specifierForID:](self, "specifierForID:", CFSTR("CURRENT_TIME"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGDateTimeController currentDateString](self, "currentDateString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v3);

  -[PSGDateTimeController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 0);
}

- (void)_createDateTimeFormatters
{
  __CFDateFormatter *dateFormatter;
  __CFDateFormatter *timeFormatter;
  const __CFLocale *v5;

  dateFormatter = self->_dateFormatter;
  if (dateFormatter)
    CFRelease(dateFormatter);
  timeFormatter = self->_timeFormatter;
  if (timeFormatter)
    CFRelease(timeFormatter);
  v5 = CFLocaleCopyCurrent();
  self->_dateFormatter = CFDateFormatterCreate(0, v5, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  self->_timeFormatter = CFDateFormatterCreate(0, v5, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  CFRelease(v5);
}

- (id)currentTimeString
{
  CFAbsoluteTime Current;

  Current = CFAbsoluteTimeGetCurrent();
  return (id)(id)CFDateFormatterCreateStringWithAbsoluteTime(0, self->_timeFormatter, Current);
}

- (id)currentDateString
{
  CFAbsoluteTime Current;

  Current = CFAbsoluteTimeGetCurrent();
  return (id)(id)CFDateFormatterCreateStringWithAbsoluteTime(0, self->_dateFormatter, Current);
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PSGDateTimeController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __45__PSGDateTimeController_carrierBundleChange___block_invoke;
    v5[3] = &unk_24F9C7E70;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __45__PSGDateTimeController_carrierBundleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleChange:", *(_QWORD *)(a1 + 40));
}

- (PSSpecifier)timeZoneSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setTimeZoneSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (PSSpecifier)timePickerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setTimePickerSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (PSSpecifier)currentTimeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setCurrentTimeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (PSGWallClockMinuteTimer)minuteTimer
{
  return self->_minuteTimer;
}

- (void)setMinuteTimer:(id)a3
{
  objc_storeStrong((id *)&self->_minuteTimer, a3);
}

- (PSSpecifier)ampmToggleSpecifier
{
  return self->_ampmToggleSpecifier;
}

- (void)setAmpmToggleSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_ampmToggleSpecifier, a3);
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
  objc_storeStrong((id *)&self->__client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_ampmToggleSpecifier, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_currentTimeSpecifier, 0);
  objc_storeStrong((id *)&self->_timePickerSpecifier, 0);
  objc_storeStrong((id *)&self->_timeZoneSpecifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_setDateAndTimeIndexPath, 0);
}

@end
