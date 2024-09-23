@implementation VUIJSSettingsInterface

- (id)userPreferences
{
  void *v2;
  void *v3;

  +[VUISettingsManager sharedInstance](VUISettingsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesJSONData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VUIJSSettingsInterface)initWithAppContext:(id)a3
{
  VUIJSSettingsInterface *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIJSSettingsInterface;
  v3 = -[VUIJSObject initWithAppContext:](&v6, sel_initWithAppContext_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__handleSettingsDidChange_, *MEMORY[0x1E0DC89D8], 0);

  }
  return v3;
}

void __54__VUIJSSettingsInterface_updateFeaturesConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  VUISignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Update", ", buf, 2u);
  }

  +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithDictionary:", *(_QWORD *)(a1 + 32));

  VUISignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D96EE000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FeaturesConfiguration.Update", ", v5, 2u);
  }

}

- (void)updateFeaturesConfiguration:(id)a3
{
  id v3;
  _QWORD block[2];
  void (*v5)(uint64_t);
  void *v6;
  id v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v5 = __54__VUIJSSettingsInterface_updateFeaturesConfiguration___block_invoke;
    v6 = &unk_1E9F98DF0;
    v7 = v3;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v5((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIJSSettingsInterface;
  -[VUIJSSettingsInterface dealloc](&v4, sel_dealloc);
}

- (unint64_t)privacyFlowContentVersion
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0D65148], "bundleWithIdentifier:", CFSTR("com.apple.onboarding.tvapp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D65188], "flowWithBundle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contentVersion");

  return v4;
}

- (BOOL)privateModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "privateModeEnabled");

  return v3;
}

- (BOOL)sportsScoreSpoilersAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC8860], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sportsScoreSpoilersAllowed");

  return v3;
}

- (void)forceUpdateWithCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIJSObject setJSValue:forProperty:](self, "setJSValue:forProperty:", v4, v6);
  -[VUIJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v7);

  objc_initWeak(&from, self);
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__VUIJSSettingsInterface_forceUpdateWithCallback___block_invoke;
  v10[3] = &unk_1E9F9E318;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "forceUpdateWithCompletion:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __50__VUIJSSettingsInterface_forceUpdateWithCallback___block_invoke(id *a1, char a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = a1 + 5;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__VUIJSSettingsInterface_forceUpdateWithCallback___block_invoke_2;
  v9[3] = &unk_1E9F9E2F0;
  objc_copyWeak(&v12, a1 + 6);
  v10 = a1[4];
  v8 = v5;
  v11 = v8;
  objc_copyWeak(&v13, v6);
  v14 = a2;
  objc_msgSend(WeakRetained, "evaluate:", v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);

}

void __50__VUIJSSettingsInterface_forceUpdateWithCallback___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  VUIJSError *v4;
  uint64_t v5;
  id v6;
  VUIJSError *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "jsValueForProperty:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = [VUIJSError alloc];
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_loadWeakRetained((id *)(a1 + 56));
    v7 = -[VUIJSError initWithError:appContext:](v4, "initWithError:appContext:", v5, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (VUIJSError *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "callWithArguments:", v9);

  objc_msgSend(WeakRetained, "setJSValue:forProperty:", 0, *(_QWORD *)(a1 + 32));
}

- (id)appSettingsByChannelID
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "watchListApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "JSONDictionary", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "channelID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v2;
}

- (id)consentedBrands
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "consentedBrands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)deniedBrands
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC8840], "sharedSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deniedBrands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wlkOverrides
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  WLKProtocolVersionOverride();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("protocolVersion"));
  WLKBaseURLOverride();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("baseURL"));
  if (objc_msgSend(v2, "count"))
    v5 = v2;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)_handleSettingsDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id from;
  id location;

  v4 = a3;
  NSLog(CFSTR("VUIJSSettingsInterface: _handleSettingsDidChange"));
  -[VUIJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  objc_initWeak(&from, self);
  v6 = objc_loadWeakRetained(&location);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__VUIJSSettingsInterface__handleSettingsDidChange___block_invoke;
  v7[3] = &unk_1E9F9E340;
  objc_copyWeak(&v8, &from);
  objc_msgSend(v6, "evaluate:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __51__VUIJSSettingsInterface__handleSettingsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasProperty:", CFSTR("onSettingsChange")))
  {
    NSLog(CFSTR("VUIJSSettingsInterface: firing onSettingsChange callback"));
    v5 = (id)objc_msgSend(v4, "invokeMethod:withArguments:", CFSTR("onSettingsChange"), 0);
  }

}

@end
