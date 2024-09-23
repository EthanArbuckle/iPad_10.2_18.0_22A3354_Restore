@implementation SBPlatformController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1)
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_67);
  return (id)sharedInstance___sharedInstance_5;
}

- (BOOL)isInternalInstall
{
  return self->_internalInstall;
}

- (BOOL)isHomeGestureEnabled
{
  void *v2;
  char v3;

  +[SBHomeGestureDomain rootSettings](SBHomeGestureDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomeGestureEnabled");

  return v3;
}

- (BOOL)isRoundCornerPhone
{
  BOOL v2;
  uint64_t v3;

  v2 = 1;
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2621)
  {
    if (v3 <= 2777)
    {
      if (v3 != 2622 && v3 != 2688)
        return 0;
    }
    else if (v3 != 2778 && v3 != 2796 && v3 != 2868)
    {
      return 0;
    }
  }
  else if (v3 <= 2435)
  {
    if (v3 != 1792 && v3 != 2340)
      return 0;
  }
  else if (v3 != 2436 && v3 != 2532 && v3 != 2556)
  {
    return 0;
  }
  return v2;
}

- (BOOL)isRoundCornerPad
{
  BOOL v2;
  uint64_t v3;

  if (SBFEffectiveHomeButtonType() != 2)
    return 0;
  v2 = 1;
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2731)
  {
    if (v3 == 2732 || v3 == 2752)
      return v2;
    return 0;
  }
  if (((unint64_t)(v3 - 2360) > 0x3C || ((1 << (v3 - 56)) & 0x1000000010000001) == 0)
    && v3 != 2266)
  {
    return 0;
  }
  return v2;
}

- (BOOL)isMedusaCapable
{
  return self->_medusaCapabilities != 0;
}

uint64_t __38__SBPlatformController_sharedInstance__block_invoke()
{
  SBPlatformController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBPlatformController);
  v1 = (void *)sharedInstance___sharedInstance_5;
  sharedInstance___sharedInstance_5 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBPlatformController)init
{
  SBPlatformController *v2;
  uint64_t v3;
  NSString *localizedDeviceName;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBPlatformController;
  v2 = -[SBPlatformController init](&v13, sel_init);
  if (v2)
  {
    v3 = MGCopyAnswer();
    localizedDeviceName = v2->_localizedDeviceName;
    v2->_localizedDeviceName = (NSString *)v3;

    v2->_internalInstall = MGGetBoolAnswer();
    v2->_carrierInstall = MGGetBoolAnswer();
    if (_os_feature_enabled_impl() && (MGGetBoolAnswer() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_supportsHWButtonBezelEffects = objc_msgSend(v5, "deviceClass") == 0;

    }
    else
    {
      v2->_supportsHWButtonBezelEffects = 0;
    }
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workspaceDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "medusaDeviceSimulation");

    if ((unint64_t)(v8 - 2) < 2)
    {
      v11 = 1;
    }
    else if (v8 == 4)
    {
      v11 = 2;
    }
    else if (v8)
    {
      v11 = 0;
    }
    else
    {
      v9 = MGGetBoolAnswer();
      v10 = MGGetBoolAnswer();
      v11 = 2;
      if (!v10)
        v11 = v9;
    }
    v2->_medusaCapabilities = v11;
    -[SBPlatformController _loadDefaultIconInfo](v2, "_loadDefaultIconInfo");
  }
  return v2;
}

- (id)systemBuildVersion
{
  return (id)MGCopyAnswer();
}

- (id)hardwareModel
{
  return (id)MGCopyAnswer();
}

- (id)productType
{
  return (id)MGCopyAnswer();
}

- (id)deviceClass
{
  return (id)MGCopyAnswer();
}

- (id)uniqueDeviceIdentifier
{
  return (id)MGCopyAnswer();
}

- (id)defaultIconState
{
  return self->_defaultIconState;
}

- (id)defaultIconStateDisplayIdentifiers
{
  return self->_defaultIconStateDisplayIdentifiers;
}

- (id)localizedPlatformName
{
  return self->_localizedDeviceName;
}

- (BOOL)isCarrierInstall
{
  return self->_carrierInstall;
}

- (int64_t)medusaCapabilities
{
  return self->_medusaCapabilities;
}

- (BOOL)isiPadMini
{
  int v2;

  v2 = isiPadMini_sScreenClass;
  if (isiPadMini_sScreenClass == -1)
  {
    v2 = MGGetSInt32Answer();
    isiPadMini_sScreenClass = v2;
  }
  return v2 == 7;
}

- (BOOL)prefersAlwaysOnOrientation
{
  if (prefersAlwaysOnOrientation_onceToken != -1)
    dispatch_once(&prefersAlwaysOnOrientation_onceToken, &__block_literal_global_29_2);
  return prefersAlwaysOnOrientation_sPrefersAlwaysOnOrientation;
}

uint64_t __50__SBPlatformController_prefersAlwaysOnOrientation__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CA5628], "isAlwaysOn");
  prefersAlwaysOnOrientation_sPrefersAlwaysOnOrientation = result;
  return result;
}

- (BOOL)deviceSupportsHWButtonBezelEffects
{
  return self->_supportsHWButtonBezelEffects;
}

- (void)_loadDefaultIconInfo
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *defaultIconState;
  void *v34;
  NSOrderedSet *v35;
  NSOrderedSet *defaultIconStateDisplayIdentifiers;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (self->_defaultIconState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPlatformController.m"), 230, CFSTR("already loaded defaultIconState : %@"), self->_defaultIconState);

  }
  if (self->_defaultIconStateDisplayIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPlatformController.m"), 231, CFSTR("already loaded defaultIconStateDisplayIdentifiers : %@"), self->_defaultIconStateDisplayIdentifiers);

  }
  v4 = (void *)MEMORY[0x1D17E5334]();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SBPlatformController deviceClass](self, "deviceClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("~%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%.0fw-%.0fh"), CFSTR("DefaultIconState"), v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingString:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForResource:withExtension:", v17, CFSTR("plist"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    v43 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%.0fw"), CFSTR("DefaultIconState"), v13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringByAppendingString:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLForResource:withExtension:", v21, CFSTR("plist"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v20 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%.0fh"), CFSTR("DefaultIconState"), v15);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringByAppendingString:", v8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLForResource:withExtension:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = v24;
        v20 = v24;
      }
      else
      {
        objc_msgSend(CFSTR("DefaultIconState"), "stringByAppendingString:", v8);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "URLForResource:withExtension:");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          objc_msgSend(v9, "URLForResource:withExtension:", CFSTR("DefaultIconState"), CFSTR("plist"));
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        v20 = v28;

        v25 = 0;
      }

    }
    v4 = v43;
  }

  SBLogCommon();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v45 = v20;
    _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_INFO, "Loading default icon state from: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v20);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBIconStateArchiver modernizeRootArchive:](SBIconStateArchiver, "modernizeRootArchive:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (NSDictionary *)objc_msgSend(v31, "copy");
  defaultIconState = self->_defaultIconState;
  self->_defaultIconState = v32;

  +[SBHIconStateArchiver leafIdentifiersFromArchive:](SBIconStateArchiver, "leafIdentifiersFromArchive:", self->_defaultIconState);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (NSOrderedSet *)objc_msgSend(v34, "copy");
  defaultIconStateDisplayIdentifiers = self->_defaultIconStateDisplayIdentifiers;
  self->_defaultIconStateDisplayIdentifiers = v35;

  objc_autoreleasePoolPop(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceName, 0);
  objc_storeStrong((id *)&self->_defaultIconStateDisplayIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultIconState, 0);
}

@end
