@implementation PUILocationSystemServicesListController

- (PUILocationSystemServicesListController)init
{
  PUILocationSystemServicesListController *v2;
  RTRoutineManager *v3;
  RTRoutineManager *routineManager;
  id v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *coalescedLocationBasedAlertsSystemServices;
  id v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *coalescedHomeKitSystemServices;
  id v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *coalescedRoutingAndTrafficSystemServices;
  id v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *coalescedWirelessSystemServices;
  uint64_t v21;
  NSMutableArray *coalescedSystemCutomizationSystemServices;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PUILocationSystemServicesListController;
  v2 = -[PUILocationServicesListController init](&v26, sel_init);
  if (v2)
  {
    v3 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x1E0D18460]);
    routineManager = v2->_routineManager;
    v2->_routineManager = v3;

    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[PUILocationSystemServicesListController _locationBasedAlertBundles](v2, "_locationBasedAlertBundles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
    coalescedLocationBasedAlertsSystemServices = v2->super._coalescedLocationBasedAlertsSystemServices;
    v2->super._coalescedLocationBasedAlertsSystemServices = (NSMutableArray *)v7;

    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[PUILocationSystemServicesListController _homeKitBundles](v2, "_homeKitBundles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));
    coalescedHomeKitSystemServices = v2->super._coalescedHomeKitSystemServices;
    v2->super._coalescedHomeKitSystemServices = (NSMutableArray *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[PUILocationSystemServicesListController _routingAndTrafficBundles](v2, "_routingAndTrafficBundles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));
    coalescedRoutingAndTrafficSystemServices = v2->super._coalescedRoutingAndTrafficSystemServices;
    v2->super._coalescedRoutingAndTrafficSystemServices = (NSMutableArray *)v15;

    v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)objc_opt_class(), "wirelessBundles");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));
    coalescedWirelessSystemServices = v2->super._coalescedWirelessSystemServices;
    v2->super._coalescedWirelessSystemServices = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    coalescedSystemCutomizationSystemServices = v2->super._coalescedSystemCutomizationSystemServices;
    v2->super._coalescedSystemCutomizationSystemServices = (NSMutableArray *)v21;

    v23 = (void *)objc_opt_new();
    -[PUILocationServicesListController setCoalescedImproveMapsServices:](v2, "setCoalescedImproveMapsServices:", v23);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v2, sel_updateCoreRoutineSigLocationSpecifier, CFSTR("PreferencesRoutineStateChanged"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUILocationSystemServicesListController;
  -[PUILocationServicesListController dealloc](&v4, sel_dealloc);
}

+ (int)systemServicesLocationUsage
{
  PUILocationSystemServicesListController *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PUILocationSystemServicesListController);
  -[PUILocationSystemServicesListController specifiers](v2, "specifiers");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "identifier", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PUILocationServicesListController locationUsageForEntity:](v2, "locationUsageForEntity:", v9);

        if (v10 == 4)
        {
          v6 = 4;
        }
        else
        {
          if (v10 == 3)
          {
            v6 = 3;
            goto LABEL_20;
          }
          if (v6 != 4 && v10 == 2)
            v6 = 2;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_20:

  return v6;
}

- (BOOL)hasUltraWideBand
{
  return MGGetBoolAnswer();
}

- (id)isStatusEnabled:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(getCLLocationManagerClass_1(), "isStatusBarIconEnabledForLocationEntityClass:", 4));
}

- (void)setStatusEnabled:(id)a3 specifier:(id)a4
{
  id v4;
  id CLLocationManagerClass_1;
  uint64_t v6;
  id v7;

  v4 = a3;
  CLLocationManagerClass_1 = getCLLocationManagerClass_1();
  v6 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(CLLocationManagerClass_1, "setStatusBarIconEnabled:forLocationEntityClass:", v6, 4);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.LocationServicesStateChanged"), 0);

}

- (void)updateCoreRoutineSigLocationSpecifier
{
  -[PUILocationSystemServicesListController updateCoreRoutineEnabledStatusAndInsertSpecifier:](self, "updateCoreRoutineEnabledStatusAndInsertSpecifier:", 0);
}

- (void)updateCoreRoutineEnabledStatusAndInsertSpecifier:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke;
  v6[3] = &unk_1EA26C920;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  char v10;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "routineManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_2;
  v11[3] = &unk_1EA26CC60;
  v13 = &v14;
  v5 = v2;
  v12 = v5;
  objc_msgSend(v3, "fetchRoutineStateWithHandler:", v11);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v15 + 24))
    v6 = CFSTR("On");
  else
    v6 = CFSTR("Off");
  PUI_LocalizedStringForPrivacy(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentCoreRoutineStatus:", v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.PrivacySettingsUI.LocationServicesStateChanged"), 0);

  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_3;
  v9[3] = &unk_1EA26C920;
  v10 = *(_BYTE *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  _Block_object_dispose(&v14, 8);
}

intptr_t __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __92__PUILocationSystemServicesListController_updateCoreRoutineEnabledStatusAndInsertSpecifier___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "insertCoreRoutineSpecifier");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "coreRoutineAppKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "specifierForID:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", v4);
  }
}

- (void)insertCoreRoutineSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PUILocationSystemServicesListController specifiers](self, "specifiers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[PUILocationSystemServicesListController specifierIDBeforeCoreRoutine](self, "specifierIDBeforeCoreRoutine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      return;
    v4 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("CORE_ROUTINE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel_coreRoutineEnabledStatus_, 0, 2, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PUILocationSystemServicesListController coreRoutineAppKey](self, "coreRoutineAppKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProperty:forKey:", v6, *MEMORY[0x1E0D80868]);

    objc_msgSend(v10, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
    objc_msgSend(v10, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v10, "setButtonAction:", sel_coreRoutinePressed_);
    -[PUILocationSystemServicesListController specifierIDBeforeCoreRoutine](self, "specifierIDBeforeCoreRoutine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationSystemServicesListController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationSystemServicesListController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v10, v7, v9 != 0);

  }
}

- (void)coreRoutinePressed:(id)a3
{
  id v4;
  int AppBooleanValue;
  void *v6;
  BOOL v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[5];
  id v20;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("FrequentLocationsDisableAuthentication"), CFSTR("com.apple.routined"), &keyExistsAndHasValidFormat);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "sf_isInternalInstall"))
    v7 = keyExistsAndHasValidFormat == 0;
  else
    v7 = 1;
  if (v7)
  {

    goto LABEL_8;
  }

  if (!AppBooleanValue)
  {
LABEL_8:
    v8 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v20 = 0;
    v9 = objc_msgSend(v8, "canEvaluatePolicy:error:", 2, &v20);
    v10 = v20;
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      PUI_LocalizedStringForLocationServices(CFSTR("VIEW_CORE_ROUTINE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_43;
      v17[3] = &unk_1EA26CCB0;
      v17[4] = self;
      v18 = v4;
      objc_msgSend(v8, "evaluatePolicy:localizedReason:reply:", 2, v12, v17);

LABEL_19:
      goto LABEL_20;
    }
    objc_msgSend(v10, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CC1280]))
    {
      v14 = objc_msgSend(v11, "code");

      if (v14 == -5)
      {
        _PUILoggingFacility();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB1FB000, v15, OS_LOG_TYPE_DEFAULT, "Cannot evaluate authentication policy for significant locations, no passcode set, allowing access.", buf, 2u);
        }

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke;
        block[3] = &unk_1EA26B358;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
        goto LABEL_19;
      }
    }
    else
    {

    }
    _PUILoggingFacility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1DB1FB000, v16, OS_LOG_TYPE_DEFAULT, "Cannot evaluate authentication policy for significant locations, error %@, returning.", buf, 0xCu);
    }

    goto LABEL_19;
  }
LABEL_20:

}

uint64_t __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushCoreRoutineViewController");
}

void __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_43(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_2;
  v8[3] = &unk_1EA26CC88;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __62__PUILocationSystemServicesListController_coreRoutinePressed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthenticationForSpecifier:success:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)_handleAuthenticationForSpecifier:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v7 || !a4)
  {
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        objc_msgSend(v7, "description");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = &stru_1EA26D430;
      }
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "Autentication policy did not evaluate successfully, returning, %@", (uint8_t *)&v10, 0xCu);
      if (v7)

    }
  }
  else
  {
    -[PUILocationSystemServicesListController _pushCoreRoutineViewController](self, "_pushCoreRoutineViewController");
  }

}

- (void)_pushCoreRoutineViewController
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("PreferenceBundles/CoreRoutineSettings.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "load");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3CF8], "storyboardWithName:bundle:", CFSTR("Main"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "instantiateInitialViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[PUILocationSystemServicesListController showController:animate:](self, "showController:animate:", v9, 1);

  }
}

- (id)coreRoutineEnabledStatus:(id)a3
{
  __CFString *currentCoreRoutineStatus;

  if (-[NSString length](self->_currentCoreRoutineStatus, "length", a3))
    currentCoreRoutineStatus = (__CFString *)self->_currentCoreRoutineStatus;
  else
    currentCoreRoutineStatus = &stru_1EA26D430;
  return currentCoreRoutineStatus;
}

+ (id)locationBasedAlertBundles
{
  return &unk_1EA27EB28;
}

+ (id)routingAndTrafficBundles
{
  return &unk_1EA27EB40;
}

+ (id)homeKitBundles
{
  return &unk_1EA27EB58;
}

+ (id)wirelessBundles
{
  return &unk_1EA27EB70;
}

- (id)_locationBasedAlertBundles
{
  return (id)objc_msgSend((id)objc_opt_class(), "locationBasedAlertBundles");
}

- (id)_homeKitBundles
{
  return (id)objc_msgSend((id)objc_opt_class(), "homeKitBundles");
}

- (id)_routingAndTrafficBundles
{
  return (id)objc_msgSend((id)objc_opt_class(), "routingAndTrafficBundles");
}

- (id)_productImprovementByBundlePath
{
  return &unk_1EA27EB88;
}

+ (id)systemCustomizationBundles
{
  return &unk_1EA27EBA0;
}

+ (id)improveMapsBundles
{
  return &unk_1EA27EBB8;
}

- (id)_readAddressCorrectionAuthorizationStatus:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = GEOGetDefaultInteger();
  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v4 == 2)
      v6 = CFSTR("YES");
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "read GEOAddressCorrectionAuthorizationStatus enabled: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sf_isInternalInstall");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 == 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationServicesListController coalescedImproveMapsServices](self, "coalescedImproveMapsServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationSystemServicesListController _performConsistencyCheckValue:bundles:name:](self, "_performConsistencyCheckValue:bundles:name:", v9, v10, CFSTR("Improve Maps"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4 == 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setAddressCorrectionAuthorizationStatus:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GEOSetDefault();

  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v6;
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "set GEOAddressCorrectionAuthorizationStatus: %ld", (uint8_t *)&v10, 0xCu);
  }

  -[PUILocationServicesListController coalescedImproveMapsServices](self, "coalescedImproveMapsServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationSystemServicesListController _setCoalescedBundlesAuthorized:bundles:](self, "_setCoalescedBundlesAuthorized:bundles:", v5, v9);

}

- (void)_showAddressCorrectionPage
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.improvemaps"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (void)_setCoalescedBundlesAuthorized:(id)a3 bundles:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    v11 = *MEMORY[0x1E0D80868];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setProperty:forKey:", v13, v11);
        -[PUILocationServicesListController setEntityAuthorized:specifier:](self, "setEntityAuthorized:specifier:", v6, v14);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)_setLocationBasedAlertsAuthorized:(id)a3
{
  void *v4;
  int v5;

  -[PUILocationSystemServicesListController _setCoalescedBundlesAuthorized:bundles:](self, "_setCoalescedBundlesAuthorized:bundles:", a3, self->super._coalescedLocationBasedAlertsSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performLocationBasedAlertsConsistencyCheck](self, "_performLocationBasedAlertsConsistencyCheck");
}

- (void)_setHomeKitAuthorized:(id)a3
{
  void *v4;
  int v5;

  -[PUILocationSystemServicesListController _setCoalescedBundlesAuthorized:bundles:](self, "_setCoalescedBundlesAuthorized:bundles:", a3, self->super._coalescedHomeKitSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performHomeKitConsistencyCheck](self, "_performHomeKitConsistencyCheck");
}

- (void)_setRoutingAndTrafficAuthorized:(id)a3
{
  void *v4;
  int v5;

  -[PUILocationSystemServicesListController _setCoalescedBundlesAuthorized:bundles:](self, "_setCoalescedBundlesAuthorized:bundles:", a3, self->super._coalescedRoutingAndTrafficSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performRoutingAndTrafficConsistencyCheck](self, "_performRoutingAndTrafficConsistencyCheck");
}

- (void)_setSystemCutomizationAuthorized:(id)a3
{
  void *v4;
  int v5;

  -[PUILocationSystemServicesListController _setCoalescedBundlesAuthorized:bundles:](self, "_setCoalescedBundlesAuthorized:bundles:", a3, self->super._coalescedSystemCutomizationSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performSystemCustomizationConsistencyCheck](self, "_performSystemCustomizationConsistencyCheck");
}

- (void)_setWirelessAuthorized:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  NSMutableArray *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  _QWORD v28[6];

  v4 = a3;
  v5 = self->super._coalescedWirelessSystemServices;
  v6 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke;
  v28[3] = &unk_1EA26CCD8;
  v28[4] = self;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1DF0AB308](v28);
  if (objc_msgSend(v4, "BOOLValue"))
  {
    ((void (**)(_QWORD, id, NSMutableArray *))v7)[2](v7, v4, v5);
  }
  else
  {
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("WIRELESS_DISABLE_TITLE"));
    v8 = objc_claimAutoreleasedReturnValue();
    -[PUILocationSystemServicesListController hasUltraWideBand](self, "hasUltraWideBand");
    SFLocalizableWAPIStringKeyForKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLocationServicesPrivacy(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "sf_isiPad");

    v20 = (void *)v8;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("WIRELESS_DISABLE_CONFIRM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_2;
    v24[3] = &unk_1EA26CD00;
    v27 = v7;
    v25 = v4;
    v26 = v5;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);

    objc_initWeak(&location, self);
    v17 = (void *)MEMORY[0x1E0DC3448];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("WIRELESS_DISABLE_CANCEL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_3;
    v21[3] = &unk_1EA26CD28;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v19);

    -[PUILocationSystemServicesListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

void __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "_setCoalescedBundlesAuthorized:bundles:", a2, a3);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_performWirelessConsistencyCheck");
}

uint64_t __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __66__PUILocationSystemServicesListController__setWirelessAuthorized___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifierID:", CFSTR("NETWORKING_WIRELESS"));

}

- (BOOL)_areCoalescedBundlesAuthorized:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x1E0D80868];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setProperty:forKey:", v10, v8);
        -[PUILocationServicesListController isEntityAuthorized:](self, "isEntityAuthorized:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "BOOLValue");

        if ((v13 & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)_areLocationBasedAlertsAuthorized
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = -[PUILocationSystemServicesListController _areCoalescedBundlesAuthorized:](self, "_areCoalescedBundlesAuthorized:", self->super._coalescedLocationBasedAlertsSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performLocationBasedAlertsConsistencyCheck](self, "_performLocationBasedAlertsConsistencyCheck");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

- (id)_isWirelessAuthorized
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = -[PUILocationSystemServicesListController _areCoalescedBundlesAuthorized:](self, "_areCoalescedBundlesAuthorized:", self->super._coalescedWirelessSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performWirelessConsistencyCheck](self, "_performWirelessConsistencyCheck");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

- (id)_isHomeKitAuthorized
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = -[PUILocationSystemServicesListController _areCoalescedBundlesAuthorized:](self, "_areCoalescedBundlesAuthorized:", self->super._coalescedHomeKitSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performHomeKitConsistencyCheck](self, "_performHomeKitConsistencyCheck");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

- (id)_isRoutingAndTrafficAuthorized
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = -[PUILocationSystemServicesListController _areCoalescedBundlesAuthorized:](self, "_areCoalescedBundlesAuthorized:", self->super._coalescedRoutingAndTrafficSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performRoutingAndTrafficConsistencyCheck](self, "_performRoutingAndTrafficConsistencyCheck");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

- (id)_isSystemCustomizationAuthorized
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = -[PUILocationSystemServicesListController _areCoalescedBundlesAuthorized:](self, "_areCoalescedBundlesAuthorized:", self->super._coalescedSystemCutomizationSystemServices);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isInternalInstall");

  if (v5)
    -[PUILocationSystemServicesListController _performSystemCustomizationConsistencyCheck](self, "_performSystemCustomizationConsistencyCheck");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

- (void)_performConsistencyCheckValue:(id)a3 bundles:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v10)
  {
    v11 = v10;
    v28 = v9;
    v29 = v7;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v33;
    v16 = *MEMORY[0x1E0D80868];
    do
    {
      v17 = 0;
      v18 = v12;
      do
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v17);
        objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setProperty:forKey:", v19, v16);
        -[PUILocationServicesListController isEntityAuthorized:](self, "isEntityAuthorized:", v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v12, "BOOLValue");
        v13 |= v21;
        v14 |= v21 ^ 1;

        ++v17;
        v18 = v12;
      }
      while (v11 != v17);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v11);
    v9 = v28;
    v7 = v29;
    if ((v13 & v14 & 1) != 0
      || v29 && v12 && (v27 = objc_msgSend(v29, "BOOLValue"), v27 != objc_msgSend(v12, "BOOLValue")))
    {
      _PUILoggingFacility();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138544131;
        v37 = v28;
        v38 = 2113;
        v39 = obj;
        v40 = 2113;
        v41 = v12;
        v42 = 2113;
        v43 = v29;
        _os_log_fault_impl(&dword_1DB1FB000, v22, OS_LOG_TYPE_FAULT, "Muxed '%{public}@' values were not consistent. Please file a radar with a sysdiagnose to \"Settings - Privacy | iOS\". bundles: %{private}@, authorized: %{private}@, value: %{private}@", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Inconsistent Values For '%@'"), v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The muxed values for '%@' were inconsistent. Please file a radar with a sysdiagnose to \"Settings - Privacy | iOS\"."), v28);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v23, v24, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAction:", v26);

      -[PUILocationSystemServicesListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v25, 1, 0);
    }
  }
  else
  {
    v12 = 0;
  }

}

- (void)_performConsistencyCheckForBundles:(id)a3 name:(id)a4
{
  -[PUILocationSystemServicesListController _performConsistencyCheckValue:bundles:name:](self, "_performConsistencyCheckValue:bundles:name:", 0, a3, a4);
}

- (void)_performLocationBasedAlertsConsistencyCheck
{
  -[PUILocationSystemServicesListController _performConsistencyCheckForBundles:name:](self, "_performConsistencyCheckForBundles:name:", self->super._coalescedLocationBasedAlertsSystemServices, CFSTR("Alerts & Shortcuts Automations"));
}

- (void)_performHomeKitConsistencyCheck
{
  -[PUILocationSystemServicesListController _performConsistencyCheckForBundles:name:](self, "_performConsistencyCheckForBundles:name:", self->super._coalescedHomeKitSystemServices, CFSTR("HomeKit"));
}

- (void)_performRoutingAndTrafficConsistencyCheck
{
  -[PUILocationSystemServicesListController _performConsistencyCheckForBundles:name:](self, "_performConsistencyCheckForBundles:name:", self->super._coalescedRoutingAndTrafficSystemServices, CFSTR("Routing & Traffic"));
}

- (void)_performWirelessConsistencyCheck
{
  -[PUILocationSystemServicesListController _performConsistencyCheckForBundles:name:](self, "_performConsistencyCheckForBundles:name:", self->super._coalescedWirelessSystemServices, CFSTR("Networking & Wireless"));
}

- (void)_performSystemCustomizationConsistencyCheck
{
  -[PUILocationSystemServicesListController _performConsistencyCheckForBundles:name:](self, "_performConsistencyCheckForBundles:name:", self->super._coalescedSystemCutomizationSystemServices, CFSTR("System Customization"));
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  objc_class *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSArray *ignoredLocationEntities;
  NSArray *v86;
  void *v87;
  uint64_t v89;
  void *v90;
  void *v91;
  char v92;
  id obj;
  id v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  id v101;
  id v102;
  uint64_t v103;
  NSArray *v104;
  uint64_t v105;
  void *v106;
  PUILocationSystemServicesListController *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t v112[128];
  _BYTE buf[24];
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (v3)
    return v3;
  v89 = (int)*MEMORY[0x1E0D80590];
  v107 = self;
  v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationSystemServicesListController productImprovementGroup](v107, "productImprovementGroup");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v4 = getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  v114 = getCLCopyAppsUsingLocationSymbolLoc_ptr_1;
  if (!getCLCopyAppsUsingLocationSymbolLoc_ptr_1)
  {
    v5 = (void *)CoreLocationLibrary_0();
    v4 = dlsym(v5, "CLCopyAppsUsingLocation");
    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v4;
    getCLCopyAppsUsingLocationSymbolLoc_ptr_1 = v4;
  }
  _Block_object_dispose(buf, 8);
  if (!v4)
  {
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    __break(1u);
  }
  obj = (id)((uint64_t (*)(void))v4)();
  _PUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = obj;
    _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "specifiers -- CLCopyAppsUsingLocation:\n%@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v107->super._locationEntitiesDetails, obj);
  v104 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v102 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUILocationSystemServicesListController setCoreRoutineAppKey:](v107, "setCoreRoutineAppKey:", 0);
  -[PUILocationSystemServicesListController setSpecifierIDBeforeCoreRoutine:](v107, "setSpecifierIDBeforeCoreRoutine:", 0);
  if (!objc_msgSend(obj, "count"))
  {
    v45 = *MEMORY[0x1E0D80780];
    goto LABEL_84;
  }
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[PUILocationServicesListController hiddenBundleIdentifiers](v107, "hiddenBundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithSet:", v8);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v9 = obj;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v108, v112, 16);
  if (!v10)
  {
    v92 = 0;
    v95 = 0;
    v100 = 0;
    v103 = 0;
    goto LABEL_70;
  }
  v92 = 0;
  v95 = 0;
  v100 = 0;
  v103 = 0;
  v105 = *(_QWORD *)v109;
  v96 = *MEMORY[0x1E0C9AAC8];
  v98 = *MEMORY[0x1E0D807F0];
  v99 = *MEMORY[0x1E0D80868];
  v97 = *MEMORY[0x1E0D80780];
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v109 != v105)
        objc_enumerationMutation(v9);
      v12 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v11);
      objc_msgSend(v9, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v106, "containsObject:", v12))
      {
        -[NSArray addObject:](v104, "addObject:", v12);
        v14 = 0;
        v15 = 0;
        goto LABEL_65;
      }
      objc_msgSend(v13, "objectForKey:", CFSTR("BundlePath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[PUILocationSystemServicesListController _locationBasedAlertBundles](v107, "_locationBasedAlertBundles");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsString:", v15);

        if (v17)
        {
          -[NSArray addObject:](v104, "addObject:", v12);
          -[NSMutableArray addObject:](v107->super._coalescedLocationBasedAlertsSystemServices, "addObject:", v12);
          v14 = 0;
          BYTE4(v103) = 1;
          goto LABEL_65;
        }
        -[PUILocationSystemServicesListController _homeKitBundles](v107, "_homeKitBundles");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsString:", v15);

        if (v19)
        {
          -[NSArray addObject:](v104, "addObject:", v12);
          -[NSMutableArray addObject:](v107->super._coalescedHomeKitSystemServices, "addObject:", v12);
          v14 = 0;
          LOBYTE(v103) = 1;
          goto LABEL_65;
        }
        -[PUILocationSystemServicesListController _routingAndTrafficBundles](v107, "_routingAndTrafficBundles");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsString:", v15);

        if (v21)
        {
          -[NSArray addObject:](v104, "addObject:", v12);
          -[NSMutableArray addObject:](v107->super._coalescedRoutingAndTrafficSystemServices, "addObject:", v12);
          v14 = 0;
          v100 = 1;
          goto LABEL_65;
        }
        objc_msgSend((id)objc_opt_class(), "wirelessBundles");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsString:", v15);

        if (v23)
        {
          -[NSArray addObject:](v104, "addObject:", v12);
          -[NSMutableArray addObject:](v107->super._coalescedWirelessSystemServices, "addObject:", v12);
          v14 = 0;
          v95 = 1;
          goto LABEL_65;
        }
        objc_msgSend((id)objc_opt_class(), "systemCustomizationBundles");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsString:", v15);

        if (v25)
        {
          -[NSArray addObject:](v104, "addObject:", v12);
          -[NSMutableArray addObject:](v107->super._coalescedSystemCutomizationSystemServices, "addObject:", v12);
          v14 = 0;
          v92 = 1;
          goto LABEL_65;
        }
        objc_msgSend((id)objc_opt_class(), "improveMapsBundles");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "containsString:", v15);

        if (v27)
        {
          -[NSArray addObject:](v104, "addObject:", v12);
          -[PUILocationServicesListController coalescedImproveMapsServices](v107, "coalescedImproveMapsServices");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v12);

          goto LABEL_43;
        }
      }
      v29 = objc_msgSend(getCLLocationManagerClass_1(), "primaryEntityClassForLocationDictionary:", v13);
      v30 = v29;
      v14 = 0;
      if (v29 <= 3)
      {
        if ((unint64_t)(v29 - 1) < 2)
          goto LABEL_42;
        if (!v29)
        {
          _PUILoggingFacility();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v13;
            _os_log_impl(&dword_1DB1FB000, v31, OS_LOG_TYPE_DEFAULT, "EntityClassUnknown:\n%@\n%@", buf, 0x16u);
          }

LABEL_42:
          -[NSArray addObject:](v104, "addObject:", v12);
LABEL_43:
          v14 = 0;
          goto LABEL_65;
        }
        goto LABEL_45;
      }
      if (v29 == 32)
        goto LABEL_42;
      if (v29 == 16)
      {
        -[PUILocationSystemServicesListController setCoreRoutineAppKey:](v107, "setCoreRoutineAppKey:", v12);
        v14 = 0;
LABEL_45:
        v32 = v15;
        goto LABEL_46;
      }
      if (v29 != 4)
        goto LABEL_45;
      objc_msgSend(v13, "objectForKey:", CFSTR("BundlePath"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v32);
      objc_msgSend(v33, "objectForInfoDictionaryKey:", v96);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "length"))
      {
        objc_msgSend(v32, "lastPathComponent");
        v34 = objc_claimAutoreleasedReturnValue();

        _PUILoggingFacility();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v32;
          _os_log_impl(&dword_1DB1FB000, v35, OS_LOG_TYPE_DEFAULT, "No display name found for system service: %@", buf, 0xCu);
        }

        v14 = (void *)v34;
      }

LABEL_46:
      if (specifiers_onceToken != -1)
        dispatch_once(&specifiers_onceToken, &__block_literal_global_21);
      objc_msgSend(v32, "rangeOfString:options:", CFSTR("WifiCalling.bundle"), 1);
      if (!v36)
        goto LABEL_53;
      if ((objc_msgSend(getTUCallCapabilitiesClass(), "isWiFiCallingEnabled") & 1) != 0
        || (objc_msgSend(getTUCallCapabilitiesClass(), "isThumperCallingEnabled") & 1) != 0)
      {
        if (specifiers___hasWAPI)
        {
          PUI_LocalizedStringForLocationServices(CFSTR("WLAN_CALLING"));
          v37 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v37;
        }
LABEL_53:
        objc_msgSend(v32, "rangeOfString:", CFSTR("WirelessDiagnostics.framework"));
        if (v38)
        {
          PUI_LocalizedStringForLocationServices(CFSTR("WIRELESS_DIAGNOSTICS"));
          v39 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v39;
        }
        if (v30 != 16)
        {
          if (objc_msgSend(v32, "hasSuffix:", CFSTR("Emergency SOS.bundle")))
            objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, v107, sel_setSOSEntityAuthorized_specifier_, sel_isEntityAuthorized_, 0, 6, 0);
          else
            objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, v107, sel_setEntityAuthorized_specifier_, sel_isEntityAuthorized_, 0, 6, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setProperty:forKey:", v12, v99);
          -[PUILocationServicesListController isEntityAuthorized:](v107, "isEntityAuthorized:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setProperty:forKey:", v41, v98);

          objc_msgSend(v40, "setProperty:forKey:", objc_opt_class(), v97);
          -[PUILocationSystemServicesListController _productImprovementByBundlePath](v107, "_productImprovementByBundlePath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "containsString:", v32);

          if (v43)
            v44 = v102;
          else
            v44 = v101;
          objc_msgSend(v44, "addObject:", v40);

        }
        goto LABEL_64;
      }
      -[NSArray addObject:](v104, "addObject:", v12);
LABEL_64:
      v15 = v32;
LABEL_65:

      ++v11;
    }
    while (v10 != v11);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v108, v112, 16);
  }
  while (v10);
LABEL_70:

  if ((v103 & 0x100000000) != 0)
  {
    v48 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("LOCATION_BASED_ALERTS"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, v107, sel__setLocationBasedAlertsAuthorized_, sel__areLocationBasedAlertsAuthorized, 0, 6, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = *MEMORY[0x1E0D80868];
    objc_msgSend(v50, "setProperty:forKey:", CFSTR("LOCATION_BASED_ALERTS"), *MEMORY[0x1E0D80868]);
    -[PUILocationSystemServicesListController _areLocationBasedAlertsAuthorized](v107, "_areLocationBasedAlertsAuthorized");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0D807F0];
    objc_msgSend(v50, "setProperty:forKey:", v51, *MEMORY[0x1E0D807F0]);

    v52 = objc_opt_class();
    v45 = *MEMORY[0x1E0D80780];
    objc_msgSend(v50, "setProperty:forKey:", v52, *MEMORY[0x1E0D80780]);
    objc_msgSend(v50, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(v101, "addObject:", v50);

    if ((v103 & 1) == 0)
      goto LABEL_74;
LABEL_76:
    v53 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("HOMEKIT"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v54, v107, sel__setHomeKitAuthorized_, sel__isHomeKitAuthorized, 0, 6, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "setProperty:forKey:", CFSTR("HOMEKIT"), v46);
    -[PUILocationSystemServicesListController _isHomeKitAuthorized](v107, "_isHomeKitAuthorized");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setProperty:forKey:", v56, v47);

    objc_msgSend(v55, "setProperty:forKey:", objc_opt_class(), v45);
    objc_msgSend(v101, "addObject:", v55);

    if ((v95 & 1) == 0)
      goto LABEL_77;
LABEL_79:
    v58 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("NETWORKING_WIRELESS"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v59, v107, sel__setWirelessAuthorized_, sel__isWirelessAuthorized, 0, 6, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "setProperty:forKey:", CFSTR("NETWORKING_WIRELESS"), v46);
    -[PUILocationSystemServicesListController _isWirelessAuthorized](v107, "_isWirelessAuthorized");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setProperty:forKey:", v61, v47);

    objc_msgSend(v60, "setProperty:forKey:", objc_opt_class(), v45);
    objc_msgSend(v101, "addObject:", v60);

    v57 = v92;
    if ((v100 & 1) == 0)
      goto LABEL_80;
LABEL_82:
    v62 = (v57 & 1) == 0;
    v63 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("ROUTING_AND_TRAFFIC"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v64, v107, sel__setRoutingAndTrafficAuthorized_, sel__isRoutingAndTrafficAuthorized, 0, 6, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "setProperty:forKey:", CFSTR("ROUTING_AND_TRAFFIC"), v46);
    -[PUILocationSystemServicesListController _isRoutingAndTrafficAuthorized](v107, "_isRoutingAndTrafficAuthorized");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setProperty:forKey:", v66, v47);

    objc_msgSend(v65, "setProperty:forKey:", objc_opt_class(), v45);
    objc_msgSend(v102, "addObject:", v65);

    if (!v62)
    {
LABEL_83:
      v67 = (void *)MEMORY[0x1E0D804E8];
      PUI_LocalizedStringForLocationServicesPrivacy(CFSTR("SYSTEM_CUSTOMIZATION"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v68, v107, sel__setSystemCutomizationAuthorized_, sel__isSystemCustomizationAuthorized, 0, 6, 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v69, "setProperty:forKey:", CFSTR("SYSTEM_CUSTOMIZATION"), v46);
      -[PUILocationSystemServicesListController _isSystemCustomizationAuthorized](v107, "_isSystemCustomizationAuthorized");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setProperty:forKey:", v70, v47);

      objc_msgSend(v69, "setProperty:forKey:", objc_opt_class(), v45);
      objc_msgSend(v101, "addObject:", v69);

    }
  }
  else
  {
    v45 = *MEMORY[0x1E0D80780];
    if ((v103 & 1) != 0)
    {
      v46 = *MEMORY[0x1E0D80868];
      v47 = *MEMORY[0x1E0D807F0];
      goto LABEL_76;
    }
LABEL_74:
    if ((v95 & 1) != 0)
    {
      v46 = *MEMORY[0x1E0D80868];
      v47 = *MEMORY[0x1E0D807F0];
      goto LABEL_79;
    }
LABEL_77:
    v57 = v92;
    if ((v100 & 1) != 0)
    {
      v46 = *MEMORY[0x1E0D80868];
      v47 = *MEMORY[0x1E0D807F0];
      goto LABEL_82;
    }
LABEL_80:
    if ((v57 & 1) != 0)
    {
      v46 = *MEMORY[0x1E0D80868];
      v47 = *MEMORY[0x1E0D807F0];
      goto LABEL_83;
    }
  }
LABEL_84:
  objc_msgSend(v101, "sortUsingFunction:context:", PUICompareSpecifiersByName, 0);
  objc_msgSend(v102, "sortUsingFunction:context:", PUICompareSpecifiersByName, 0);
  v71 = (void *)MEMORY[0x1E0D804E8];
  PUI_LocalizedStringForLocationServices(CFSTR("POLARIS_TITLE"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v72, v107, sel__setAddressCorrectionAuthorizationStatus_specifier_, sel__readAddressCorrectionAuthorizationStatus_, 0, 6, 0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "setIdentifier:", CFSTR("POLARIS"));
  objc_msgSend(v73, "setObject:forKeyedSubscript:", objc_opt_class(), v45);
  objc_msgSend(v102, "addObject:", v73);
  -[PUILocationSystemServicesListController coreRoutineAppKey](v107, "coreRoutineAppKey");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v101, "lastObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "identifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILocationSystemServicesListController setSpecifierIDBeforeCoreRoutine:](v107, "setSpecifierIDBeforeCoreRoutine:", v76);

    -[PUILocationSystemServicesListController updateCoreRoutineEnabledStatusAndInsertSpecifier:](v107, "updateCoreRoutineEnabledStatusAndInsertSpecifier:", 1);
  }
  if (objc_msgSend(v101, "count"))
  {
    objc_msgSend(v94, "addObject:", v91);
    objc_msgSend(v94, "addObjectsFromArray:", v101);
  }
  if (objc_msgSend(v102, "count"))
  {
    objc_msgSend(v94, "addObject:", v90);
    objc_msgSend(v94, "addObjectsFromArray:", v102);
  }
  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("INDICATOR_EXPLANATION"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (objc_class *)objc_opt_class();
  NSStringFromClass(v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setProperty:forKey:", v79, *MEMORY[0x1E0D80818]);

  objc_msgSend(v77, "setProperty:forKey:", CFSTR("SERVICE"), CFSTR("_ExplanationIdSuffix_"));
  objc_msgSend(v94, "addObject:", v77);
  if (objc_msgSend(v102, "count") || objc_msgSend(v101, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("STATUS_BAR_GROUP"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLocationServices(CFSTR("SYSTEM_SERVICES_STATUS_BAR_ICON_EXPLANATION"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setProperty:forKey:", v81, *MEMORY[0x1E0D80848]);

    objc_msgSend(v94, "addObject:", v80);
    v82 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("STATUS_BAR_ICON"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v83, v107, sel_setStatusEnabled_specifier_, sel_isStatusEnabled_, 0, 6, 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "addObject:", v84);

  }
  ignoredLocationEntities = v107->super._ignoredLocationEntities;
  v107->super._ignoredLocationEntities = v104;
  v86 = v104;

  v87 = *(Class *)((char *)&v107->super.super.super.super.super.super.isa + v89);
  *(Class *)((char *)&v107->super.super.super.super.super.super.isa + v89) = (Class)v94;

  -[PUILocationServicesListController updateSpecifiersForImposedSettingsWithReload:](v107, "updateSpecifiersForImposedSettingsWithReload:", 0);
  -[PUILocationSystemServicesListController updateImproveMapsSpecifierWithCompletion:](v107, "updateImproveMapsSpecifierWithCompletion:", 0);

  v3 = *(Class *)((char *)&v107->super.super.super.super.super.super.isa + v89);
  return v3;
}

uint64_t __53__PUILocationSystemServicesListController_specifiers__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  specifiers___hasWAPI = result;
  return result;
}

- (void)updateImproveMapsSpecifierWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD);
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = SFIsAppWithBundleIDInstalled();
  _PUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PUILocationSystemServicesListController updateImproveMapsSpecifierWithCompletion:]";
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "%s: fetching routine state", buf, 0xCu);
    }

    -[PUILocationSystemServicesListController routineManager](self, "routineManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke;
    v9[3] = &unk_1EA26CD70;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "fetchRoutineStateWithHandler:", v9);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PUILocationSystemServicesListController updateImproveMapsSpecifierWithCompletion:]";
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "%s: Maps is not installed", buf, 0xCu);
    }

    -[PUILocationSystemServicesListController _setAddressCorrectionAuthorizationStatus:specifier:](self, "_setAddressCorrectionAuthorizationStatus:specifier:", MEMORY[0x1E0C9AAA0], 0);
    if (v4)
      v4[2](v4);
  }

}

void __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke_2;
  v2[3] = &unk_1EA26C488;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __84__PUILocationSystemServicesListController_updateImproveMapsSpecifierWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t result;

  GEOGetDefaultBOOL();
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
    GEOGetDefaultBOOL();
  objc_msgSend(*(id *)(a1 + 32), "updateSpecifiersForImposedSettingsWithReload:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (PSSpecifier)productImprovementGroup
{
  PSSpecifier *productImprovementGroup;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *v7;
  PSSpecifier *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PSSpecifier *v14;
  void *v15;
  PSSpecifier *v16;
  void *v17;
  NSRange v19;

  productImprovementGroup = self->_productImprovementGroup;
  if (!productImprovementGroup)
  {
    v4 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("PRODUCT_IMPROVEMENT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupSpecifierWithID:name:", CFSTR("PRODUCT_IMPROVEMENT"), v5);
    v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_productImprovementGroup;
    self->_productImprovementGroup = v6;

    v8 = self->_productImprovementGroup;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v8, "setProperty:forKey:", v10, *MEMORY[0x1E0D80818]);

    PUI_LocalizedStringForLocationServices(CFSTR("POLARIS_FOOTER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLocationServices(CFSTR("LEARN_MORE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpecifier setProperty:forKey:](self->_productImprovementGroup, "setProperty:forKey:", v13, *MEMORY[0x1E0D80838]);
    v14 = self->_productImprovementGroup;
    v19.location = objc_msgSend(v13, "rangeOfString:", v12);
    NSStringFromRange(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v14, "setProperty:forKey:", v15, *MEMORY[0x1E0D80828]);

    v16 = self->_productImprovementGroup;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v16, "setProperty:forKey:", v17, *MEMORY[0x1E0D80830]);

    -[PSSpecifier setProperty:forKey:](self->_productImprovementGroup, "setProperty:forKey:", CFSTR("_showAddressCorrectionPage"), *MEMORY[0x1E0D80820]);
    productImprovementGroup = self->_productImprovementGroup;
  }
  return productImprovementGroup;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void)setProductImprovementGroup:(id)a3
{
  objc_storeStrong((id *)&self->_productImprovementGroup, a3);
}

- (NSString)currentCoreRoutineStatus
{
  return self->_currentCoreRoutineStatus;
}

- (void)setCurrentCoreRoutineStatus:(id)a3
{
  objc_storeStrong((id *)&self->_currentCoreRoutineStatus, a3);
}

- (NSString)coreRoutineAppKey
{
  return self->_coreRoutineAppKey;
}

- (void)setCoreRoutineAppKey:(id)a3
{
  objc_storeStrong((id *)&self->_coreRoutineAppKey, a3);
}

- (NSString)specifierIDBeforeCoreRoutine
{
  return self->_specifierIDBeforeCoreRoutine;
}

- (void)setSpecifierIDBeforeCoreRoutine:(id)a3
{
  objc_storeStrong((id *)&self->_specifierIDBeforeCoreRoutine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierIDBeforeCoreRoutine, 0);
  objc_storeStrong((id *)&self->_coreRoutineAppKey, 0);
  objc_storeStrong((id *)&self->_currentCoreRoutineStatus, 0);
  objc_storeStrong((id *)&self->_productImprovementGroup, 0);
  objc_storeStrong((id *)&self->_routineManager, 0);
}

@end
