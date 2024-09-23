@implementation WGWidgetEventTracker

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__WGWidgetEventTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance___sharedInstance;
}

void __38__WGWidgetEventTracker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;

}

- (WGWidgetEventTracker)init
{
  WGWidgetEventTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *previousWidgetAppearanceDateByIdentifier;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WGWidgetEventTracker;
  v2 = -[WGWidgetEventTracker init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    previousWidgetAppearanceDateByIdentifier = v2->_previousWidgetAppearanceDateByIdentifier;
    v2->_previousWidgetAppearanceDateByIdentifier = v3;

    -[WGWidgetEventTracker _lockedStateDidChange](v2, "_lockedStateDidChange");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_HandleKeybagLockStatusChanged, CFSTR("com.apple.mobile.keybagd.lock_status"), 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetEventTracker;
  -[WGWidgetEventTracker dealloc](&v4, sel_dealloc);
}

- (void)_lockedStateDidChange
{
  self->_authenticated = MKBGetDeviceLockState() != 1;
}

- (void)widgetListDidAppearAtLocation:(unint64_t)a3 withEnabledWidgets:(id)a4 disabledWidgets:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  self->_location = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "components:fromDate:", 28, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSDateComponents isEqual:](self->_previousTodayViewAppearDateComponents, "isEqual:", v12) & 1) == 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = v8;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          -[WGWidgetEventTracker _trackWidgetStatusEventForWidget:withStatus:](self, "_trackWidgetStatusEventForWidget:withStatus:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 1);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v15);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          -[WGWidgetEventTracker _trackWidgetStatusEventForWidget:withStatus:](self, "_trackWidgetStatusEventForWidget:withStatus:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), 0);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v20);
    }

    objc_storeStrong((id *)&self->_previousTodayViewAppearDateComponents, v12);
    v8 = v23;
  }
  if (!self->_previousTodayViewAppearanceDate)
  {
    objc_storeStrong((id *)&self->_previousTodayViewAppearanceDate, v10);
    -[WGWidgetEventTracker _trackWidgetListShownEventWithLocation:authenticated:](self, "_trackWidgetListShownEventWithLocation:authenticated:", self->_location, self->_authenticated);
  }

}

- (void)widgetListDidDisappearAtLocation:(unint64_t)a3
{
  NSDate *previousTodayViewAppearanceDate;
  double v5;
  NSDate *v6;

  previousTodayViewAppearanceDate = self->_previousTodayViewAppearanceDate;
  if (previousTodayViewAppearanceDate)
  {
    -[NSDate timeIntervalSinceNow](previousTodayViewAppearanceDate, "timeIntervalSinceNow", a3);
    -[WGWidgetEventTracker _trackWidgetListLingerEventWithLocation:authenticated:duration:](self, "_trackWidgetListLingerEventWithLocation:authenticated:duration:", self->_location, self->_authenticated, -v5);
    v6 = self->_previousTodayViewAppearanceDate;
    self->_previousTodayViewAppearanceDate = 0;

    self->_location = 0;
  }
}

- (void)widgetViewDidAppearWithWidget:(id)a3
{
  self->_location = 4;
  -[WGWidgetEventTracker widget:didAppearInMode:](self, "widget:didAppearInMode:", a3, 0);
}

- (void)widgetViewDidDisappearWithWidget:(id)a3
{
  -[WGWidgetEventTracker widget:didDisappearInMode:](self, "widget:didDisappearInMode:", a3, 0);
  self->_location = 0;
}

- (void)widget:(id)a3 didAppearInMode:(int64_t)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *previousWidgetAppearanceDateByIdentifier;
  void *v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    -[NSMutableDictionary objectForKey:](self->_previousWidgetAppearanceDateByIdentifier, "objectForKey:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[WGWidgetEventTracker _trackWidgetShownEventForWidget:withLocation:authenticated:mode:](self, "_trackWidgetShownEventForWidget:withLocation:authenticated:mode:", v10, self->_location, self->_authenticated, a4);
      previousWidgetAppearanceDateByIdentifier = self->_previousWidgetAppearanceDateByIdentifier;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](previousWidgetAppearanceDateByIdentifier, "setObject:forKey:", v9, v10);

    }
    v6 = v10;
  }

}

- (void)widget:(id)a3 didDisappearInMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    -[NSMutableDictionary objectForKey:](self->_previousWidgetAppearanceDateByIdentifier, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "timeIntervalSinceNow");
      -[WGWidgetEventTracker _trackWidgetLingerEventForWidget:withLocation:authenticated:mode:duration:](self, "_trackWidgetLingerEventForWidget:withLocation:authenticated:mode:duration:", v10, self->_location, self->_authenticated, a4, -v9);
      -[NSMutableDictionary removeObjectForKey:](self->_previousWidgetAppearanceDateByIdentifier, "removeObjectForKey:", v10);
    }

    v6 = v10;
  }

}

- (void)widget:(id)a3 didChangeUserSpecifiedDisplayMode:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    if (a4 == 1)
    {
      v7 = v6;
      -[WGWidgetEventTracker _trackWidgetExpandEventForWidget:](self, "_trackWidgetExpandEventForWidget:", v6);
      goto LABEL_6;
    }
    if (!a4)
    {
      v7 = v6;
      -[WGWidgetEventTracker _trackWidgetContractEventForWidget:](self, "_trackWidgetContractEventForWidget:", v6);
LABEL_6:
      v6 = v7;
    }
  }

}

- (id)_authenticationProperty
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE799E0];
  v6[0] = MEMORY[0x24BDBD1C8];
  v6[1] = MEMORY[0x24BDBD1C0];
  v7[0] = CFSTR("true");
  v7[1] = CFSTR("false");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyWithName:enumMapping:", CFSTR("auth"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_locationProperty
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE799E0];
  v6[0] = &unk_24D744490;
  v6[1] = &unk_24D7444A8;
  v7[0] = CFSTR("Unknown");
  v7[1] = CFSTR("lock_screen_list");
  v6[2] = &unk_24D7444C0;
  v6[3] = &unk_24D7444D8;
  v7[2] = CFSTR("notification_center_list");
  v7[3] = CFSTR("home_screen_list");
  v6[4] = &unk_24D7444F0;
  v7[4] = CFSTR("home_screen_icon");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyWithName:enumMapping:", CFSTR("location"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_modeProperty
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE799E0];
  v6[0] = &unk_24D744508;
  v6[1] = &unk_24D744520;
  v7[0] = CFSTR("compact");
  v7[1] = CFSTR("expanded");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyWithName:enumMapping:", CFSTR("mode"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_statusProperty
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE799E0];
  v6[0] = MEMORY[0x24BDBD1C8];
  v6[1] = MEMORY[0x24BDBD1C0];
  v7[0] = CFSTR("enabled");
  v7[1] = CFSTR("disabled");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyWithName:enumMapping:", CFSTR("status"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_widgetProperty
{
  return (id)objc_msgSend(MEMORY[0x24BE799E0], "freeValuedPropertyWithName:", CFSTR("widget"));
}

- (id)_widgetLingerTracker
{
  PETDistributionEventTracker *widgetLingerTracker;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  PETDistributionEventTracker *v10;
  PETDistributionEventTracker *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  widgetLingerTracker = self->_widgetLingerTracker;
  if (!widgetLingerTracker)
  {
    -[WGWidgetEventTracker _widgetProperty](self, "_widgetProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _locationProperty](self, "_locationProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _authenticationProperty](self, "_authenticationProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _modeProperty](self, "_modeProperty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE799D8]);
    v13[0] = v4;
    v13[1] = v5;
    v13[2] = v6;
    v13[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (PETDistributionEventTracker *)objc_msgSend(v8, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetLinger"), v9);
    v11 = self->_widgetLingerTracker;
    self->_widgetLingerTracker = v10;

    widgetLingerTracker = self->_widgetLingerTracker;
  }
  return widgetLingerTracker;
}

- (void)_trackWidgetLingerEventForWidget:(id)a3 withLocation:(unint64_t)a4 authenticated:(BOOL)a5 mode:(int64_t)a6 duration:(double)a7
{
  _BOOL8 v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (a4)
    {
      v10 = a5;
      v12 = a3;
      -[WGWidgetEventTracker _widgetLingerTracker](self, "_widgetLingerTracker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v14;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v15;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "trackEventWithPropertyValues:value:", v17, a7);
    }
  }
}

- (id)_widgetShownTracker
{
  PETScalarEventTracker *widgetShownTracker;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  PETScalarEventTracker *v10;
  PETScalarEventTracker *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  widgetShownTracker = self->_widgetShownTracker;
  if (!widgetShownTracker)
  {
    -[WGWidgetEventTracker _widgetProperty](self, "_widgetProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _locationProperty](self, "_locationProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _authenticationProperty](self, "_authenticationProperty");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _modeProperty](self, "_modeProperty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE799F0]);
    v13[0] = v4;
    v13[1] = v5;
    v13[2] = v6;
    v13[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (PETScalarEventTracker *)objc_msgSend(v8, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetShown"), v9);
    v11 = self->_widgetShownTracker;
    self->_widgetShownTracker = v10;

    widgetShownTracker = self->_widgetShownTracker;
  }
  return widgetShownTracker;
}

- (void)_trackWidgetShownEventForWidget:(id)a3 withLocation:(unint64_t)a4 authenticated:(BOOL)a5 mode:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = a5;
    v10 = a3;
    -[WGWidgetEventTracker _widgetShownTracker](self, "_widgetShownTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v12;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v13;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "trackEventWithPropertyValues:", v15);
  }
}

- (id)_widgetStatusTracker
{
  PETScalarEventTracker *widgetStatusTracker;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  PETScalarEventTracker *v8;
  PETScalarEventTracker *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  widgetStatusTracker = self->_widgetStatusTracker;
  if (!widgetStatusTracker)
  {
    -[WGWidgetEventTracker _widgetProperty](self, "_widgetProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _statusProperty](self, "_statusProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BE799F0]);
    v11[0] = v4;
    v11[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PETScalarEventTracker *)objc_msgSend(v6, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetStatus"), v7);
    v9 = self->_widgetStatusTracker;
    self->_widgetStatusTracker = v8;

    widgetStatusTracker = self->_widgetStatusTracker;
  }
  return widgetStatusTracker;
}

- (void)_trackWidgetStatusEventForWidget:(id)a3 withStatus:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a4;
    v6 = a3;
    -[WGWidgetEventTracker _widgetStatusTracker](self, "_widgetStatusTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "trackEventWithPropertyValues:", v9);
  }
}

- (id)_widgetToggleContractTracker
{
  PETScalarEventTracker *widgetToggleContractTracker;
  void *v4;
  id v5;
  void *v6;
  PETScalarEventTracker *v7;
  PETScalarEventTracker *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  widgetToggleContractTracker = self->_widgetToggleContractTracker;
  if (!widgetToggleContractTracker)
  {
    -[WGWidgetEventTracker _widgetProperty](self, "_widgetProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE799F0]);
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PETScalarEventTracker *)objc_msgSend(v5, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetToggleContract"), v6);
    v8 = self->_widgetToggleContractTracker;
    self->_widgetToggleContractTracker = v7;

    widgetToggleContractTracker = self->_widgetToggleContractTracker;
  }
  return widgetToggleContractTracker;
}

- (void)_trackWidgetContractEventForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    -[WGWidgetEventTracker _widgetToggleContractTracker](self, "_widgetToggleContractTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "trackEventWithPropertyValues:", v6);
  }
}

- (id)widgetToggleExpandTracker
{
  PETScalarEventTracker *widgetToggleExpandTracker;
  void *v4;
  id v5;
  void *v6;
  PETScalarEventTracker *v7;
  PETScalarEventTracker *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  widgetToggleExpandTracker = self->_widgetToggleExpandTracker;
  if (!widgetToggleExpandTracker)
  {
    -[WGWidgetEventTracker _widgetProperty](self, "_widgetProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE799F0]);
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PETScalarEventTracker *)objc_msgSend(v5, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetToggleExpand"), v6);
    v8 = self->_widgetToggleExpandTracker;
    self->_widgetToggleExpandTracker = v7;

    widgetToggleExpandTracker = self->_widgetToggleExpandTracker;
  }
  return widgetToggleExpandTracker;
}

- (void)_trackWidgetExpandEventForWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    -[WGWidgetEventTracker widgetToggleExpandTracker](self, "widgetToggleExpandTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "trackEventWithPropertyValues:", v6);
  }
}

- (id)_widgetListLingerTracker
{
  PETDistributionEventTracker *widgetListLingerTracker;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  PETDistributionEventTracker *v8;
  PETDistributionEventTracker *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  widgetListLingerTracker = self->_widgetListLingerTracker;
  if (!widgetListLingerTracker)
  {
    -[WGWidgetEventTracker _locationProperty](self, "_locationProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _authenticationProperty](self, "_authenticationProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BE799D8]);
    v11[0] = v4;
    v11[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PETDistributionEventTracker *)objc_msgSend(v6, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetListLinger"), v7);
    v9 = self->_widgetListLingerTracker;
    self->_widgetListLingerTracker = v8;

    widgetListLingerTracker = self->_widgetListLingerTracker;
  }
  return widgetListLingerTracker;
}

- (void)_trackWidgetListLingerEventWithLocation:(unint64_t)a3 authenticated:(BOOL)a4 duration:(double)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v6 = a4;
  v12[2] = *MEMORY[0x24BDAC8D0];
  -[WGWidgetEventTracker _widgetListLingerTracker](self, "_widgetListLingerTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackEventWithPropertyValues:value:", v11, a5);

}

- (id)widgetListShownTracker
{
  PETScalarEventTracker *widgetListShownTracker;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  PETScalarEventTracker *v8;
  PETScalarEventTracker *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  widgetListShownTracker = self->_widgetListShownTracker;
  if (!widgetListShownTracker)
  {
    -[WGWidgetEventTracker _locationProperty](self, "_locationProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetEventTracker _authenticationProperty](self, "_authenticationProperty");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BE799F0]);
    v11[0] = v4;
    v11[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PETScalarEventTracker *)objc_msgSend(v6, "initWithFeatureId:event:registerProperties:", CFSTR("Widgets"), CFSTR("widgetListShown"), v7);
    v9 = self->_widgetListShownTracker;
    self->_widgetListShownTracker = v8;

    widgetListShownTracker = self->_widgetListShownTracker;
  }
  return widgetListShownTracker;
}

- (void)_trackWidgetListShownEventWithLocation:(unint64_t)a3 authenticated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v4 = a4;
  v10[2] = *MEMORY[0x24BDAC8D0];
  -[WGWidgetEventTracker widgetListShownTracker](self, "widgetListShownTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackEventWithPropertyValues:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetToggleExpand, 0);
  objc_storeStrong((id *)&self->_widgetToggleContract, 0);
  objc_storeStrong((id *)&self->_widgetListShownTracker, 0);
  objc_storeStrong((id *)&self->_widgetToggleExpandTracker, 0);
  objc_storeStrong((id *)&self->_widgetToggleContractTracker, 0);
  objc_storeStrong((id *)&self->_widgetListLingerTracker, 0);
  objc_storeStrong((id *)&self->_widgetStatusTracker, 0);
  objc_storeStrong((id *)&self->_widgetShownTracker, 0);
  objc_storeStrong((id *)&self->_widgetLingerTracker, 0);
  objc_storeStrong((id *)&self->_previousWidgetAppearanceDateByIdentifier, 0);
  objc_storeStrong((id *)&self->_previousTodayViewAppearanceDate, 0);
  objc_storeStrong((id *)&self->_previousTodayViewAppearDateComponents, 0);
}

@end
