@implementation WLKUpNextWidgetCacheManager

+ (void)requestReload
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)requestReload__sTimelineController, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1B515A000, a2, OS_LOG_TYPE_ERROR, "WLKUpNextWidgetCacheManager - An error occured reloading timeline: [%@] %@", (uint8_t *)&v5, 0x16u);

}

+ (void)requestInvalidation
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = a1;
  objc_sync_enter(v2);
  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKUpNextWidgetCacheManager - Processed invalidation request", v6, 2u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("UpNextWidgetPendingInvalidation"));

  objc_sync_exit(v2);
}

+ (BOOL)consumePendingInvalidation
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.WatchListKit"));
  objc_msgSend(v3, "objectForKey:", CFSTR("UpNextWidgetPendingInvalidation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WLKNetworkingLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKUpNextWidgetCacheManager - Found pending invalidation. Consuming: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("UpNextWidgetPendingInvalidation"));
  }

  objc_sync_exit(v2);
  return v4 != 0;
}

void __44__WLKUpNextWidgetCacheManager_requestReload__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D10110]);
  WLKTVAppBundleID();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.tv.TVWidgetExtension"), v3);
  v2 = (void *)requestReload__sTimelineController;
  requestReload__sTimelineController = v1;

}

@end
