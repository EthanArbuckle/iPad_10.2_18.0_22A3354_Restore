@implementation SLHighlightCenter

uint64_t __63__SLHighlightCenter__initWithAppIdentifier_apiAdapterDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerNotifications");
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SLFrameworkLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "Fetching highlights as a result of a legacy client calling with limit: %lu", (uint8_t *)&v8, 0xCu);
  }

  -[SLHighlightCenter fetchHighlightsWithLimit:reason:completionBlock:](self, "fetchHighlightsWithLimit:reason:completionBlock:", a3, 0, v6);
}

void __41__SLHighlightCenter_highlightCenterQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SocialLayer.HighlightCenterQueue", v2);
  v1 = (void *)highlightCenterQueue_queue;
  highlightCenterQueue_queue = (uint64_t)v0;

}

- (void)_registerNotifications
{
  OUTLINED_FUNCTION_2();
}

+ (id)highlightCenterQueue
{
  if (highlightCenterQueue_onceToken != -1)
    dispatch_once(&highlightCenterQueue_onceToken, &__block_literal_global_91);
  return (id)highlightCenterQueue_queue;
}

+ (BOOL)isAutomaticSharingEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend((id)objc_opt_class(), "isEnabled")
    && objc_msgSend((id)objc_opt_class(), "_isShareWithYouEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "_bundleIDExistsInPreferences:", v3))
    {
      v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
      objc_msgSend(v4, "objectForKey:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "BOOLValue");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  SLFrameworkLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[SLHighlightCenter isAutomaticSharingEnabled].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  return v6;
}

+ (BOOL)isEnabled
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((objc_msgSend(a1, "isMessagesLocked") & 1) != 0)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = objc_msgSend((id)objc_opt_class(), "_isShareWithYouOnboarded");
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      +[SLHighlightCenter isEnabled].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  return v2;
}

+ (BOOL)_isShareWithYouOnboarded
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("SharedWithYouEnabled"), CFSTR("com.apple.SocialLayer"), &keyExistsAndHasValidFormat);
  SLFrameworkLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    +[SLHighlightCenter _isShareWithYouOnboarded].cold.1((uint64_t)&keyExistsAndHasValidFormat, v2, v3, v4, v5, v6, v7, v8);

  return keyExistsAndHasValidFormat != 0;
}

- (id)appIdentifierForHighlightsCache
{
  void *v2;
  void *v3;

  -[SLHighlightCenter interactionHandler](self, "interactionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SLInteractionHandler)interactionHandler
{
  return self->_interactionHandler;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SLHighlightCenter highlights](self, "highlights");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      -[SLHighlightCenter _legacyNotifyDelegateDidAddHighlights](self, "_legacyNotifyDelegateDidAddHighlights");
    else
      -[SLHighlightCenter updateHighlights](self, "updateHighlights");
    v5 = obj;
  }

}

- (NSArray)highlights
{
  void *v2;
  void *v3;

  -[SLHighlightCenter highlightsCache](self, "highlightsCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_initWithAppIdentifier:(id)a3 apiAdapterDelegate:(id)a4
{
  id v6;
  id v7;
  SLHighlightCenter *v8;
  SLInteractionHandler *v9;
  SLInteractionHandler *interactionHandler;
  NSArray *highlights;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  SLHighlightCenter *v21;
  void *v22;
  id v23;
  _QWORD block[4];
  SLHighlightCenter *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SLHighlightCenter;
  v8 = -[SLHighlightCenter init](&v27, sel_init);
  if (v8)
  {
    v9 = -[SLInteractionHandler initWithAppIdentifier:]([SLInteractionHandler alloc], "initWithAppIdentifier:", v6);
    interactionHandler = v8->_interactionHandler;
    v8->_interactionHandler = v9;

    *(_QWORD *)&v8->_notificationTokenSettingsChanges = -1;
    highlights = v8->_highlights;
    v8->_highlights = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.SLTester")) & 1) != 0
      || objc_msgSend(v13, "containsString:", CFSTR("com.apple.sociallayer.GelatoTester")))
    {
      +[SLHighlightCenter _checkAndInitializeBundleIDToAppPreferences:](SLHighlightCenter, "_checkAndInitializeBundleIDToAppPreferences:", v13);
    }
    +[SLHighlightCenter SLVariantDefault](SLHighlightCenter, "SLVariantDefault");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightCenter setVariant:](v8, "setVariant:", v14);

    +[SLHighlightsCache sharedCache](SLHighlightsCache, "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightCenter setHighlightsCache:](v8, "setHighlightsCache:", v15);

    -[SLHighlightCenter highlightsCache](v8, "highlightsCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addDelegate:", v8);

    -[SLHighlightCenter highlightsCache](v8, "highlightsCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "highlights");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (!v19)
    {
      -[SLHighlightCenter highlightsCache](v8, "highlightsCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateHighlights");

    }
    objc_storeWeak((id *)&v8->_apiAdapterDelegate, v7);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SLHighlightCenter__initWithAppIdentifier_apiAdapterDelegate___block_invoke;
    block[3] = &unk_1E3794360;
    v21 = v8;
    v26 = v21;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v22, "addMonitor:subjectMask:", v21, 1);

    }
  }

  return v8;
}

- (SLHighlightsCache)highlightsCache
{
  return self->_highlightsCache;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong((id *)&self->_variant, a3);
}

- (void)setHighlightsCache:(id)a3
{
  objc_storeStrong((id *)&self->_highlightsCache, a3);
}

+ (id)SLVariantDefault
{
  return (id)*MEMORY[0x1E0D70F10];
}

- (void)updateHighlights
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (NSString)variant
{
  return self->_variant;
}

- (SLHighlightCenter)init
{
  return (SLHighlightCenter *)-[SLHighlightCenter _initWithAppIdentifier:apiAdapterDelegate:](self, "_initWithAppIdentifier:apiAdapterDelegate:", 0, 0);
}

- (void)fetchHighlights:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  SLFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "Fetching highlights as a result of a legacy client calling", v6, 2u);
  }

  -[SLHighlightCenter _fetchHighlightsWithLimit:reason:completionBlock:](self, "_fetchHighlightsWithLimit:reason:completionBlock:", 0x7FFFFFFFFFFFFFFFLL, 0, v4);
}

+ (NSString)displayName
{
  void *v2;
  void *v3;

  SLFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARED_WITH_YOU"), &stru_1E3797070, CFSTR("SocialLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)_bundleIDExistsInPreferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v6 != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)_checkAndInitializeBundleIDToAppPreferences:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    SLFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[SLHighlightCenter _checkAndInitializeBundleIDToAppPreferences:].cold.1();
    goto LABEL_14;
  }
  if ((objc_msgSend(a1, "_isShareWithYouOnboarded") & 1) == 0)
  {
    SLFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[SLHighlightCenter _checkAndInitializeBundleIDToAppPreferences:].cold.2();
    goto LABEL_14;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_bundleIDExistsInPreferences:", v4) & 1) == 0)
  {
    v5 = CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
    v6 = v5;
    if (v5)
    {
      v7 = -[NSObject mutableCopy](v5, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v7;
    SLFrameworkLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_199EFF000, v9, OS_LOG_TYPE_INFO, "Adding bundleID:%@ to the Shared With You Preferences", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isShareWithYouEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v4);

    CFPreferencesSetAppValue(CFSTR("SharedWithYouApps"), v8, CFSTR("com.apple.SocialLayer"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.SocialLayer"));

LABEL_14:
  }

}

+ (BOOL)_isShareWithYouEnabled
{
  void *v3;
  char v4;
  NSObject *v6;

  if ((objc_msgSend(a1, "isMessagesLocked") & 1) == 0)
  {
    if (objc_msgSend(a1, "_isShareWithYouOnboarded"))
    {
      v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouEnabled"), CFSTR("com.apple.SocialLayer"));
      v4 = objc_msgSend(v3, "BOOLValue");
      CFRelease(v3);
      return v4;
    }
    SLFrameworkLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[SLHighlightCenter _isShareWithYouEnabled].cold.1();

  }
  return 0;
}

+ (BOOL)isPhotosProcess
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"));

  return v4;
}

+ (BOOL)isMessagesLocked
{
  void *v3;
  char v4;

  if (!_os_feature_enabled_impl() || !objc_msgSend(a1, "isPhotosProcess"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  return v4;
}

+ (id)rapportClient
{
  if (rapportClient_onceToken != -1)
    dispatch_once(&rapportClient_onceToken, &__block_literal_global);
  return (id)rapportClient_client;
}

uint64_t __34__SLHighlightCenter_rapportClient__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = objc_alloc_init(MEMORY[0x1E0D83900]);
  v1 = (void *)rapportClient_client;
  rapportClient_client = (uint64_t)v0;

  v2 = objc_msgSend((id)rapportClient_client, "controlFlags");
  return objc_msgSend((id)rapportClient_client, "setControlFlags:", v2 | 6);
}

+ (BOOL)shouldShowOnboardingShieldView
{
  void *v3;
  char v4;

  if ((objc_msgSend(a1, "isMessagesLocked") & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("com.apple.SocialLayer.OnboardingVersionSeen"));

  return v4 ^ 1;
}

+ (void)shouldShowOnboardingShieldViewForNearbyDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  v4 = a3;
  if (objc_msgSend(a1, "shouldShowOnboardingShieldView"))
  {
    objc_msgSend(a1, "rapportClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke;
    v7[3] = &unk_1E37943B0;
    v10 = 1;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    objc_msgSend(v6, "activateWithCompletion:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  SLFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_2(v3, v4);
  }
  else if (v5)
  {
    __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_1();
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "sl_phoneAndPadDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, objc_msgSend(v7, "count") != 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 40), 0);
  }

}

+ (id)SLVariantNewsToday
{
  return (id)*MEMORY[0x1E0D70F18];
}

- (SLHighlightCenter)initWithAppIdentifier:(id)a3
{
  return (SLHighlightCenter *)-[SLHighlightCenter _initWithAppIdentifier:apiAdapterDelegate:](self, "_initWithAppIdentifier:apiAdapterDelegate:", a3, 0);
}

- (double)decay
{
  double result;

  objc_msgSend(MEMORY[0x1E0D70C68], "decayInterval");
  return result;
}

- (NSDate)latestHighlightDate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SLHighlightCenter highlights](self, "highlights");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6), "timestamp");

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }
  SLFrameworkLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SLHighlightCenter latestHighlightDate].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v15;
}

- (double)highlightsRankingScore
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SLHighlightCenter highlights](self, "highlights");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    v6 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "score");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "doubleValue");
        v10 = v9;

        if (v10 >= v6)
          v6 = v10;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 2.22507386e-308;
  }
  SLFrameworkLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SLHighlightCenter highlightsRankingScore].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  return v6;
}

- (NSString)displayName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "displayName");
}

void __43__SLHighlightCenter__registerNotifications__block_invoke(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "enablementStateChanged");

  objc_destroyWeak(&to);
}

void __43__SLHighlightCenter__registerNotifications__block_invoke_105(uint64_t a1)
{
  id v1;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = objc_loadWeakRetained(&to);
  objc_msgSend(v1, "appEnablementStateChanged");

  objc_destroyWeak(&to);
}

- (void)enablementStateChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "Informing the delegate that the enablement has changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)appEnablementStateChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "Skipping informing the delegate that the enablement for %@ has changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_notifyAPIAdapterDelegateHighlightsChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "apiAdapterDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    SLFrameworkLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "apiAdapterDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "apiAdapterHighlightsDidChange:", *(_QWORD *)(a1 + 32));

  }
}

- (void)_legacyNotifyDelegateDidAddHighlights
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      SLFrameworkLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "highlightCenterDidAddHighlights:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_legacyNotifyDelegateDidRemoveHighlights:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke;
  v6[3] = &unk_1E37942C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      SLFrameworkLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke_cold_1(a1, v6);

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "highlightCenter:didRemoveHighlights:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = a3;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "Fetching highlights as a result of a legacy client calling with limit: %lu", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SLHighlightCenter_fetchHighlightsWithLimit_reason_completionBlock___block_invoke;
  v12[3] = &unk_1E3794420;
  v13 = v8;
  v11 = v8;
  -[SLHighlightCenter _fetchHighlightsWithLimit:reason:completionBlock:](self, "_fetchHighlightsWithLimit:reason:completionBlock:", a3, v9, v12);

}

void __69__SLHighlightCenter_fetchHighlightsWithLimit_reason_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "count");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchHighlightsWithLimit:(unint64_t)a3 reason:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_DEFAULT, "Fetch highlights with limit from SLHighlightCenter", buf, 2u);
  }

  -[SLHighlightCenter highlightsCache](self, "highlightsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightCenter variant](self, "variant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__SLHighlightCenter__fetchHighlightsWithLimit_reason_completionBlock___block_invoke;
  v14[3] = &unk_1E3794448;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "fetchHighlightsWithLimit:reason:variant:completionBlock:", a3, v9, v12, v14);

}

void __70__SLHighlightCenter__fetchHighlightsWithLimit_reason_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "highlights");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v5, v4);

}

- (void)runAfterInitialFetch:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SLHighlightCenter highlightsCache](self, "highlightsCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "runAfterInitialFetch:onQueue:", v7, v6);

}

- (id)fetchAttributionsForHighlight:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "attributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v4, "attributions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "attributions", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
          -[SLHighlightCenter interactionHandler](self, "interactionHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "fetchAttributionForAttributionIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            -[NSObject addObject:](v9, "addObject:", v18);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    SLFrameworkLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SLHighlightCenter fetchAttributionsForHighlight:].cold.2(v9, v4, v19);

    v20 = -[NSObject copy](v9, "copy");
    objc_msgSend(v4, "setAttributions:", v20);

  }
  else
  {
    SLFrameworkLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SLHighlightCenter fetchAttributionsForHighlight:].cold.1(v4, v9);
  }

  return v4;
}

- (id)fetchAttributionForAttributionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  SLGeneralTelemetryLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  SLGeneralTelemetryLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SLHighlightCenterFetchAttributionWithIdentifier", ", buf, 2u);
  }

  -[SLHighlightCenter interactionHandler](self, "interactionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAttributionForAttributionIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SLFrameworkLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SLHighlightCenter fetchAttributionForAttributionIdentifier:].cold.1();

  SLGeneralTelemetryLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v13, OS_SIGNPOST_INTERVAL_END, v6, "SLHighlightCenterFetchAttributionWithIdentifier", ", v15, 2u);
  }

  return v10;
}

- (void)feedbackForHighlight:(id)a3 withType:(unint64_t)a4
{
  -[SLHighlightCenter feedbackForHighlight:withType:completionBlock:](self, "feedbackForHighlight:withType:completionBlock:", a3, a4, 0);
}

- (void)feedbackForHighlight:(id)a3 withType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  SLHighlightCenter *v18;
  id v19;
  unint64_t v20;

  v8 = a3;
  v9 = a5;
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SLHighlightCenter feedbackForHighlight:withType:completionBlock:].cold.1();

  -[SLHighlightCenter interactionHandler](self, "interactionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightCenter variant](self, "variant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__SLHighlightCenter_feedbackForHighlight_withType_completionBlock___block_invoke;
  v16[3] = &unk_1E3794470;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v20 = a4;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v11, "feedbackForHighlightIdentifier:withType:variant:completionBlock:", v12, a4, v13, v16);

}

void __67__SLHighlightCenter_feedbackForHighlight_withType_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SLFrameworkLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!(_DWORD)a2)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_INFO, "Error registering feedback for Highlight: %@. Error: %@", (uint8_t *)&v11, 0x16u);

    }
    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_INFO, "Feedback for Highlight: %@ was successfully registered", (uint8_t *)&v11, 0xCu);

  }
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "highlightsCache");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject didDeleteHighlightsOrAttributions](v6, "didDeleteHighlightsOrAttributions");
LABEL_8:

  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v5, "In %@ dealloc", v6);

  OUTLINED_FUNCTION_6();
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", CFSTR("com.apple.MobileSMS"));

          if (v12)
            -[SLHighlightCenter enablementStateChanged](self, "enablementStateChanged");
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (SLHighlightCenterDelegate)delegate
{
  return (SLHighlightCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SLHighlightCenterAPIAdapting)apiAdapterDelegate
{
  return (SLHighlightCenterAPIAdapting *)objc_loadWeakRetained((id *)&self->_apiAdapterDelegate);
}

- (void)setInteractionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_interactionHandler, a3);
}

- (int)notificationTokenSettingsChanges
{
  return self->_notificationTokenSettingsChanges;
}

- (int)notificationTokenAppSettingsChanges
{
  return self->_notificationTokenAppSettingsChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_highlightsCache, 0);
  objc_storeStrong((id *)&self->_interactionHandler, 0);
  objc_destroyWeak((id *)&self->_apiAdapterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highlights, 0);
}

+ (void)isEnabled
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a2, a3, "isEnabled: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

+ (void)isAutomaticSharingEnabled
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a2, a3, "isAutomaticSharingEnabled: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

+ (void)_checkAndInitializeBundleIDToAppPreferences:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "Not adding bundleID: %@ to App Preferences since its invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_checkAndInitializeBundleIDToAppPreferences:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "Not adding bundleID: %@ to App Preferences since SharedWithYouEnabled key is not set up yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)_isShareWithYouEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "Did not find Shared With You Enabled Preference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_isShareWithYouOnboarded
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a2, a3, "SharedWithYouKeyExsits: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "RPCompanionLinkClient activated successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__SLHighlightCenter_shouldShowOnboardingShieldViewForNearbyDevice___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v4, "RPCompanionLinkClient activation failed. %@", v5);

  OUTLINED_FUNCTION_6();
}

- (void)latestHighlightDate
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a1, a3, "Returning latestHighlightDate: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)highlightsRankingScore
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a1, a3, "Returning highlightsRankingScore: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __63__SLHighlightCenter__notifyAPIAdapterDelegateHighlightsChanged__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "Informing API adapter delegate highlights did change.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__SLHighlightCenter__legacyNotifyDelegateDidAddHighlights__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "Informing the delegate didAddHighlights", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __62__SLHighlightCenter__legacyNotifyDelegateDidRemoveHighlights___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "count");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v3, "Informing the delegate that there are %lu deleted content", v4);
  OUTLINED_FUNCTION_6();
}

- (void)fetchAttributionsForHighlight:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "No attributions in highlight with identifier %@", v4, 0xCu);

  OUTLINED_FUNCTION_6();
}

- (void)fetchAttributionsForHighlight:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "count");
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_199EFF000, a3, OS_LOG_TYPE_DEBUG, "Got %lu updated attributions for highlight with identifier %@", (uint8_t *)&v7, 0x16u);

}

- (void)fetchAttributionForAttributionIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "Got attributions for identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)feedbackForHighlight:withType:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_199EFF000, v0, v1, "Sending highlight feedback of type %lu to PersonalizationPortrait", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
