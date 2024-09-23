@implementation WLKURLBagUtilities

void __55__WLKURLBagUtilities_isFullTVAppEnabledWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedBooleanForKey:", kBagKeyUVSearchNowPlayingEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "Fetch full tv app enabled: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = objc_msgSend(v3, "BOOLValue");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("lastKnownTVAppEnabledValue"));

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, v5, 0);

}

uint64_t __55__WLKURLBagUtilities_isFullTVAppEnabledwithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)isFullTVAppEnabledwithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__WLKURLBagUtilities_isFullTVAppEnabledwithCompletion___block_invoke;
  v6[3] = &unk_1E68A7DB8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "isFullTVAppEnabledWithCompletion:", v6);

}

+ (void)isFullTVAppEnabledWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  void (**v9)(id, uint64_t, _QWORD);

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  WLKTVAppEnabledOverride();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    NSLog(CFSTR("isFullTVAppEnabledWithCompletion - TV app enabled *override*: %d"), objc_msgSend(v4, "BOOLValue"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", objc_msgSend(v5, "BOOLValue"), CFSTR("lastKnownTVAppEnabledValue"));

    if (v3)
      v3[2](v3, objc_msgSend(v5, "BOOLValue"), 0);
  }
  else
  {
    dispatch_get_global_queue(25, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__WLKURLBagUtilities_isFullTVAppEnabledWithCompletion___block_invoke;
    block[3] = &unk_1E68A7DE0;
    v9 = v3;
    dispatch_async(v7, block);

  }
}

+ (id)isFullTVAppEnabledCachedValue
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastKnownTVAppEnabledValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isFullTVAppEnabled
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v6[4];
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_opt_class();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__WLKURLBagUtilities_isFullTVAppEnabled__block_invoke;
  v6[3] = &unk_1E68A7D90;
  v8 = &v9;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "isFullTVAppEnabledwithCompletion:", v6);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

intptr_t __40__WLKURLBagUtilities_isFullTVAppEnabled__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
