@implementation WLKFetchNowPlayingEnabledReturningError

void __WLKFetchNowPlayingEnabledReturningError_block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "Fetch now playing enabled: %@", (uint8_t *)&v8, 0xCu);
  }

  v5 = objc_msgSend(v3, "BOOLValue");
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBool:forKey:", v5, CFSTR("lastKnownTVAppEnabledValue"));

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, v5, 0);

}

@end
