@implementation PKIconImageCache

void __32__PKIconImageCache_imageForKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "iconCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSDictionary)iconCache
{
  return self->_iconCache;
}

void __39__PKIconImageCache_initWithPath_scale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_cacheKeyToApplicationBundleIdentifierLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithApplicationBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 48);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 48), "na_safeSetObject:forKey:", v5, v7);
  objc_sync_exit(v6);

}

id __58__PKIconImageCache__cacheKeyToGraphicIconIdentifierLookup__block_invoke()
{
  if (_block_invoke_na_once_token_4 != -1)
    dispatch_once(&_block_invoke_na_once_token_4, &__block_literal_global_20_0);
  return (id)_block_invoke_na_once_object_4;
}

id __64__PKIconImageCache__cacheKeyToApplicationBundleIdentifierLookup__block_invoke()
{
  if (_block_invoke_2_na_once_token_5 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_5, &__block_literal_global_47);
  return (id)_block_invoke_2_na_once_object_5;
}

+ (id)settingsIconCache
{
  if (settingsIconCache_onceToken != -1)
    dispatch_once(&settingsIconCache_onceToken, &__block_literal_global_25);
  return (id)settingsIconCache_settingsIconCache;
}

void __37__PKIconImageCache_settingsIconCache__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  +[PKIconImageCache settingsIconCacheWithScale:](PKIconImageCache, "settingsIconCacheWithScale:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)settingsIconCache_settingsIconCache;
  settingsIconCache_settingsIconCache = v3;

}

+ (id)settingsIconCacheWithScale:(double)a3
{
  void *v4;
  void *v5;
  void *v7;
  PKIconImageCache *v8;

  if (a3 >= 3.0)
  {
    PSPreferencesFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("iconCache@3x"), CFSTR("artwork"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (a3 >= 2.0 && v4 == 0)
  {
    PSPreferencesFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:", CFSTR("iconCache@2x"), CFSTR("artwork"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = -[PKIconImageCache initWithPath:scale:]([PKIconImageCache alloc], "initWithPath:scale:", v4, a3);

  return v8;
}

- (PKIconImageCache)initWithPath:(id)a3 scale:(double)a4
{
  id v5;
  PKIconImageCache *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *cacheAccessQueue;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  PKIconImageCache *v22;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKIconImageCache;
  v6 = -[PKIconImageCache init](&v23, sel_init);
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("com.apple.preferences-framework.%@.cacheAccessQueue"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4), 0);
    cacheAccessQueue = v6->_cacheAccessQueue;
    v6->_cacheAccessQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A890]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDrawBorder:", 1);
    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppearance:", objc_msgSend(v15, "userInterfaceStyle") != 1);

    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "layoutDirection"))
      v17 = 2;
    else
      v17 = 1;
    objc_msgSend(v14, "setLanguageDirection:", v17);

    objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContrast:", objc_msgSend(v18, "accessibilityContrast") == 1);

    -[PKIconImageCache cacheAccessQueue](v6, "cacheAccessQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PKIconImageCache_initWithPath_scale___block_invoke;
    block[3] = &unk_1E4A654F0;
    v22 = v6;
    dispatch_async(v19, block);

  }
  return v6;
}

- (id)imageForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  id location;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend((id)objc_opt_class(), "_cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ps_synchronousIconWithApplicationBundleIdentifier:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__7;
    v22 = __Block_byref_object_dispose__7;
    v23 = 0;
    objc_initWeak(&location, self);
    -[PKIconImageCache cacheAccessQueue](self, "cacheAccessQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__PKIconImageCache_imageForKey___block_invoke;
    v13[3] = &unk_1E4A67E98;
    objc_copyWeak(&v16, &location);
    v15 = &v18;
    v14 = v4;
    dispatch_sync(v11, v13);

    v10 = (id)v19[5];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v18, 8);

  }
  return v10;
}

- (OS_dispatch_queue)cacheAccessQueue
{
  return self->_cacheAccessQueue;
}

void __39__PKIconImageCache_initWithPath_scale___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  size_t v11;
  uint64_t v12;
  id v13;
  id v14;
  size_t v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[16];

  PKLogForCategory(6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_make_with_pointer(v2, "PKIconImageCache.loadIconImageCache");

  PKLogForCategory(6);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PKIconImageCache.loadIconImageCache", (const char *)&unk_1A38FDA81, buf, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "_cacheKeyToGraphicIconIdentifierLookup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_cacheKeyToApplicationBundleIdentifierLookup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count") + objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "count");
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PKIconImageCache_initWithPath_scale___block_invoke_14;
  block[3] = &unk_1E4A67E70;
  v13 = v7;
  v29 = v13;
  v30 = *(id *)(a1 + 32);
  v14 = v10;
  v31 = v14;
  dispatch_apply(v11, 0, block);
  v15 = objc_msgSend(v9, "count");
  v21 = v12;
  v22 = 3221225472;
  v23 = __39__PKIconImageCache_initWithPath_scale___block_invoke_2;
  v24 = &unk_1E4A67E70;
  v16 = v9;
  v25 = v16;
  v26 = *(id *)(a1 + 32);
  v17 = v14;
  v27 = v17;
  dispatch_apply(v15, 0, &v21);
  v18 = (void *)objc_msgSend(v17, "copy", v21, v22, v23, v24);
  objc_msgSend(*(id *)(a1 + 32), "setIconCache:", v18);

  PKLogForCategory(6);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A3819000, v20, OS_SIGNPOST_INTERVAL_END, v3, "PKIconImageCache.loadIconImageCache", (const char *)&unk_1A38FDA81, buf, 2u);
  }

}

- (void)setIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconCache, a3);
}

void __64__PKIconImageCache__cacheKeyToApplicationBundleIdentifierLookup__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[17];
  _QWORD v6[18];

  v6[17] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("Calendar");
  v5[1] = CFSTR("Fitness");
  v6[0] = CFSTR("com.apple.mobilecal");
  v6[1] = CFSTR("com.apple.Fitness");
  v5[2] = CFSTR("HomeData");
  v5[3] = CFSTR("iTunes");
  v6[2] = CFSTR("com.apple.Home");
  v6[3] = CFSTR("com.apple.MobileStore");
  v5[4] = CFSTR("Wallet");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");
  v2 = CFSTR("com.apple.PassbookStub");
  if (!v1)
    v2 = CFSTR("com.apple.Passbook");
  v6[4] = v2;
  v6[5] = CFSTR("com.apple.DocumentsApp");
  v5[5] = CFSTR("Files");
  v5[6] = CFSTR("Freeform");
  v6[6] = CFSTR("com.apple.freeform");
  v6[7] = CFSTR("com.apple.gamecenter.widgets");
  v5[7] = CFSTR("GameCenter");
  v5[8] = CFSTR("Health");
  v6[8] = CFSTR("com.apple.Health");
  v6[9] = CFSTR("com.apple.mobilemail");
  v5[9] = CFSTR("Mail");
  v5[10] = CFSTR("Messages");
  v6[10] = CFSTR("com.apple.MobileSMS");
  v6[11] = CFSTR("com.apple.news");
  v5[11] = CFSTR("News");
  v5[12] = CFSTR("Notes");
  v6[12] = CFSTR("com.apple.mobilenotes");
  v6[13] = CFSTR("com.apple.mobileslideshow");
  v5[13] = CFSTR("Photos");
  v5[14] = CFSTR("Siri");
  v6[14] = CFSTR("com.apple.siri");
  v6[15] = CFSTR("com.apple.mobilesafari");
  v5[15] = CFSTR("Safari");
  v5[16] = CFSTR("Stocks");
  v6[16] = CFSTR("com.apple.stocks");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 17);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_block_invoke_2_na_once_object_5;
  _block_invoke_2_na_once_object_5 = v3;

}

void __58__PKIconImageCache__cacheKeyToGraphicIconIdentifierLookup__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AppClips");
  v2[1] = CFSTR("CellularData");
  v3[0] = CFSTR("com.apple.graphic-icon.app-clips");
  v3[1] = CFSTR("com.apple.graphic-icon.cellular-settings");
  v2[2] = CFSTR("ControlCenter");
  v2[3] = CFSTR("General");
  v3[2] = CFSTR("com.apple.graphic-icon.control-center");
  v3[3] = CFSTR("com.apple.graphic-icon.gear");
  v2[4] = CFSTR("HealthData");
  v2[5] = CFSTR("HomeScreen");
  v3[4] = CFSTR("com.apple.graphic-icon.health-data");
  v3[5] = CFSTR("com.apple.graphic-icon.home-screen");
  v2[6] = CFSTR("KeychainSync");
  v2[7] = CFSTR("Location");
  v3[6] = CFSTR("com.apple.graphic-icon.passwords");
  v3[7] = CFSTR("com.apple.graphic-icon.location");
  v2[8] = CFSTR("PersonalHotspot");
  v2[9] = CFSTR("VPN");
  v3[8] = CFSTR("com.apple.graphic-icon.personal-hotspot");
  v3[9] = CFSTR("com.apple.graphic-icon.vpn");
  v2[10] = CFSTR("iCloud");
  v2[11] = CFSTR("iCloudBackup");
  v3[10] = CFSTR("com.apple.application-icon.icloud");
  v3[11] = CFSTR("com.apple.graphic-icon.icloud-backup");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_4;
  _block_invoke_na_once_object_4 = v0;

}

void __39__PKIconImageCache_initWithPath_scale___block_invoke_14(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_cacheKeyToGraphicIconIdentifierLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "ps_synchronousIconWithTypeIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 48);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 48), "na_safeSetObject:forKey:", v5, v7);
  objc_sync_exit(v6);

}

- (id)allImageIconKeys
{
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  objc_initWeak(&location, self);
  -[PKIconImageCache cacheAccessQueue](self, "cacheAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PKIconImageCache_allImageIconKeys__block_invoke;
  block[3] = &unk_1E4A67A20;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync(v3, block);

  v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void __36__PKIconImageCache_allImageIconKeys__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "iconCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id __77__PKIconImageCache__cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation__block_invoke()
{
  if (_block_invoke_3_na_once_token_6 != -1)
    dispatch_once(&_block_invoke_3_na_once_token_6, &__block_literal_global_86);
  return (id)_block_invoke_3_na_once_object_6;
}

void __77__PKIconImageCache__cacheKeysForApplicationIconsThatNeedJustInTimeEvaluation__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Contacts");
  v2[1] = CFSTR("Reminders");
  v3[0] = CFSTR("com.apple.MobileAddressBook");
  v3[1] = CFSTR("com.apple.reminders");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_3_na_once_object_6;
  _block_invoke_3_na_once_object_6 = v0;

}

- (void)setCacheAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheAccessQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_cacheAccessQueue, 0);
}

@end
