@implementation DBSExternalDisplayManager

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_3);
  return (id)defaultManager_defaultManager_0;
}

void __43__DBSExternalDisplayManager_defaultManager__block_invoke()
{
  DBSExternalDisplayManager *v0;
  void *v1;

  v0 = objc_alloc_init(DBSExternalDisplayManager);
  v1 = (void *)defaultManager_defaultManager_0;
  defaultManager_defaultManager_0 = (uint64_t)v0;

}

- (DBSExternalDisplayManager)init
{
  DBSExternalDisplayManager *v2;
  void *v3;
  void *v4;
  void *v5;
  BrightnessSystemClient *v6;
  BrightnessSystemClient *brightnessSystemClient;
  uint64_t v8;
  SBSExternalDisplayService *displayService;
  void *v10;
  uint64_t v11;
  FBSDisplayLayoutMonitor *layoutMonitor;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DBSExternalDisplayManager;
  v2 = -[DBSExternalDisplayManager init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      NSStringFromSelector(sel_preferences);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, v4, 1, PKDisplayPreferencesContext);

      if (!-[DBSExternalDisplayManager deviceSupportsChamoisExternalDisplay](v2, "deviceSupportsChamoisExternalDisplay"))
      {
        NSStringFromSelector(sel_currentMode);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, v5, 1, PKDisplayCurrentModeContext);

      }
    }
    v6 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x24BE1A2D0]);
    brightnessSystemClient = v2->_brightnessSystemClient;
    v2->_brightnessSystemClient = v6;

    -[BrightnessSystemClient registerNotificationBlock:forProperties:](v2->_brightnessSystemClient, "registerNotificationBlock:forProperties:", &__block_literal_global_19, &unk_24F02FB28);
    if (-[DBSExternalDisplayManager deviceSupportsChamoisExternalDisplay](v2, "deviceSupportsChamoisExternalDisplay"))
    {
      v8 = objc_opt_new();
      displayService = v2->_displayService;
      v2->_displayService = (SBSExternalDisplayService *)v8;

      -[SBSExternalDisplayService addObserver:](v2->_displayService, "addObserver:", v2);
    }
    objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v2);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __33__DBSExternalDisplayManager_init__block_invoke_2;
    v17 = &unk_24F025FF8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v10, "setTransitionHandler:", &v14);
    objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v10, v14, v15, v16, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v11;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __33__DBSExternalDisplayManager_init__block_invoke(uint64_t a1, void *a2)
{
  __CFString **v2;
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DisplayBrightness2Available")) & 1) != 0)
  {
    v2 = DBSExternalDisplayManagerExternalBrightnessAvailablityDidChange;
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", *v2, 0);

    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DisplayBrightness2")) & 1) != 0)
  {
    v2 = DBSExternalDisplayManagerExternalBrightnessValueDidChange;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DisplayBrightnessAuto2Available")) & 1) != 0)
  {
    v2 = DBSExternalDisplayManagerExternalAutoBrightnessAvailablityDidChange;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DisplayBrightnessAuto2")))
  {
    v2 = DBSExternalDisplayManagerExternalAutoBrightnessValueDidChange;
    goto LABEL_9;
  }
LABEL_10:

}

void __33__DBSExternalDisplayManager_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __33__DBSExternalDisplayManager_init__block_invoke_3;
  v6[3] = &unk_24F025F38;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v8);
}

void __33__DBSExternalDisplayManager_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", DBSExternalDisplayManagerDisplayLayoutMonitorDidChange, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "bounds");
    objc_msgSend(WeakRetained, "updateNativeDisplaySize:", v3, v4);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    NSStringFromSelector(sel_preferences);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v4, PKDisplayPreferencesContext);

    if (!-[DBSExternalDisplayManager deviceSupportsChamoisExternalDisplay](self, "deviceSupportsChamoisExternalDisplay"))
    {
      NSStringFromSelector(sel_currentMode);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, v5, PKDisplayCurrentModeContext);

    }
  }

  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterNotificationForKeys:", &unk_24F02FB40);

  if (-[DBSExternalDisplayManager deviceSupportsChamoisExternalDisplay](self, "deviceSupportsChamoisExternalDisplay"))
    -[SBSExternalDisplayService removeObserver:](self->_displayService, "removeObserver:", self);
  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)DBSExternalDisplayManager;
  -[DBSExternalDisplayManager dealloc](&v7, sel_dealloc);
}

- (id)externalDisplayName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (-[DBSExternalDisplayManager externalDisplayAvailable](self, "externalDisplayAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "productName");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      && (v4 = (void *)v3,
          objc_msgSend(v2, "productName"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "length"),
          v5,
          v4,
          v6))
    {
      objc_msgSend(v2, "productName");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      DBS_LocalizedStringForConnectedDisplays(CFSTR("EXTERNAL_DISPLAY"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGSize)externalDisplaySize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (-[DBSExternalDisplayManager externalDisplayAvailable](self, "externalDisplayAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "frame");
      v5 = v4;
      v7 = v6;
    }
    else
    {
      v5 = *MEMORY[0x24BDBF148];
      v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }

  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateNativeDisplaySize:(CGSize)a3
{
  if (self->_nativeDisplaySize.width != a3.width || self->_nativeDisplaySize.height != a3.height)
    self->_nativeDisplaySize = a3;
}

- (id)mainDisplayName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(v2, "productName"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    objc_msgSend(v2, "productName");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DBS_LocalizedStringForConnectedDisplays(CFSTR("MAIN_DISPLAY"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)mainDisplayImageWithWidth:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__DBSExternalDisplayManager_mainDisplayImageWithWidth___block_invoke;
  v9[3] = &unk_24F026020;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend((id)v11[5], "interfaceOrientation");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");

  SBSUIWallpaperGetPreview();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__DBSExternalDisplayManager_mainDisplayImageWithWidth___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v8, "activationState"))
  {
    objc_msgSend(v8, "_sceneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("sceneID:com.apple.Preferences-default"));

    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
    }
  }

}

- (id)supportedHDRModes
{
  void *v2;
  void *v3;

  if (-[DBSExternalDisplayManager externalDisplayAvailable](self, "externalDisplayAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "supportedHDRModes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (id)preferredHDRModes
{
  void *v2;
  void *v3;

  if (-[DBSExternalDisplayManager externalDisplayAvailable](self, "externalDisplayAvailable"))
  {
    objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredHDRModes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

- (BOOL)externalDisplayAvailable
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "height"))
      v5 = objc_msgSend(v4, "width") != 0;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)externalDisplayBrightnessAvailable
{
  void *v2;
  void *v3;

  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyPropertyForKey:", CFSTR("DisplayBrightness2Available"));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)externalDisplayAutoBrightnessAvailable
{
  void *v2;
  void *v3;

  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyPropertyForKey:", CFSTR("DisplayBrightnessAuto2Available"));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (NSString)currentHDRMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredHdrMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "preferences");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "preferredHdrMode");
    }
    else
    {
      objc_msgSend(v3, "currentMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hdrMode");
    }
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (id)*MEMORY[0x24BDE5908];
  }

  return (NSString *)v7;
}

- (void)setCurrentHDRMode:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    DBSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_227A37000, v5, OS_LOG_TYPE_DEFAULT, "External Display: Setting current HDR mode preference to value: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v4, "preferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setPreferredHdrMode:", v3);
    objc_msgSend(v4, "setPreferences:", v7);

  }
}

- (BOOL)matchContent
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "matchContent");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setMatchContent:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    DBSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_227A37000, v5, OS_LOG_TYPE_DEFAULT, "External Display: Setting match content preference to value: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v4, "preferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setMatchContent:", v3);
    objc_msgSend(v4, "setPreferences:", v8);

  }
}

- (NSNumber)externalDisplayBrightness
{
  void *v2;
  void *v3;

  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyPropertyForKey:", CFSTR("DisplayBrightness2"));

  return (NSNumber *)v3;
}

- (BOOL)autoBrightnessEnabled
{
  void *v2;
  void *v3;

  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copyPropertyForKey:", CFSTR("DisplayBrightnessAuto2"));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)setAutoBrightnessEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  DBSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_227A37000, v5, OS_LOG_TYPE_DEFAULT, "External Display: Setting external display auto brightness setting to to %@.", (uint8_t *)&v13, 0xCu);

  }
  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "setProperty:forKey:", v8, CFSTR("DisplayBrightnessAuto2"));

  DBSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      LOWORD(v13) = 0;
      v12 = "External Display: Set external display auto brightness setting successfully.";
LABEL_8:
      _os_log_impl(&dword_227A37000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 2u);
    }
  }
  else if (v11)
  {
    LOWORD(v13) = 0;
    v12 = "External Display: Failed to set external display auto brightness setting.";
    goto LABEL_8;
  }

}

- (void)setExternalDisplayBrightness:(id)a3 shouldCommit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  _QWORD v16[2];
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  DBSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_227A37000, v7, OS_LOG_TYPE_DEFAULT, "External Display: Setting external display brightness to %@ with hint %@.", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, CFSTR("Brightness"), CFSTR("Commit"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSExternalDisplayManager brightnessSystemClient](self, "brightnessSystemClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "setProperty:forKey:", v10, CFSTR("DisplayBrightness2"));

  DBSLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      v14 = "External Display: Set external display brightness successfully.";
LABEL_8:
      _os_log_impl(&dword_227A37000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
    }
  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    v14 = "External Display: Failed to set external display brightness.";
    goto LABEL_8;
  }

}

- (void)setMirroringEnabled:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[DBSExternalDisplayManager displayService](self, "displayService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__DBSExternalDisplayManager_setMirroringEnabled___block_invoke;
  v6[3] = &unk_24F026048;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "getConnectedDisplayInfoWithCompletionHandler:", v6);

}

void __49__DBSExternalDisplayManager_setMirroringEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMirroringEnabled:forDisplay:", v5, v6);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDE5660], "TVOutDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((void *)PKDisplayPreferencesContext == a6 && objc_msgSend(v13, "isEqual:", v11))
  {
    DBSLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "preferences");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_227A37000, v15, OS_LOG_TYPE_DEFAULT, "External Display: Display preference did change: %@", buf, 0xCu);

    }
  }
  else
  {
    if ((void *)PKDisplayCurrentModeContext != a6 || !objc_msgSend(v14, "isEqual:", v11))
    {
      v21.receiver = self;
      v21.super_class = (Class)DBSExternalDisplayManager;
      -[DBSExternalDisplayManager observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
      goto LABEL_12;
    }
    DBSLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "currentMode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v20;
      _os_log_impl(&dword_227A37000, v18, OS_LOG_TYPE_DEFAULT, "External Display: Display current mode did change %@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v15, "postNotificationName:object:", DBSExternalDisplayManagerCurrentModeDidChange[0], 0);
  }

LABEL_12:
}

- (void)externalDisplayDidConnect:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", DBSExternalDisplayManagerCurrentModeDidChange[0], 0);

}

- (void)externalDisplayWillDisconnect:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", DBSExternalDisplayManagerCurrentModeDidChange[0], 0);

}

- (BOOL)deviceSupportsChamoisExternalDisplay
{
  int v2;

  v2 = MGGetBoolAnswer();
  if (v2)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
      LOBYTE(v2) = 1;
    else
      LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (CGSize)nativeDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_nativeDisplaySize.width;
  height = self->_nativeDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return self->_brightnessSystemClient;
}

- (void)setBrightnessSystemClient:(id)a3
{
  objc_storeStrong((id *)&self->_brightnessSystemClient, a3);
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (void)setDisplayService:(id)a3
{
  objc_storeStrong((id *)&self->_displayService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

@end
