@implementation SearchUIImageCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1)
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_28);
  return (id)sharedCache_imageCache;
}

void __33__SearchUIImageCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_imageCache;
  sharedCache_imageCache = v0;

}

- (SearchUIImageCache)init
{
  SearchUIImageCache *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUIImageCache;
  v2 = -[SearchUIImageCache init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[SearchUIImageCache setImageCache:](v2, "setImageCache:", v3);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)appDatabaseChanged, CFSTR("com.apple.LaunchServices.DatabaseChange"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_clearImagesWithNotification_, CFSTR("SearchUIClearImageCacheNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_dateDidChange, *MEMORY[0x1E0DC4838], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_appIconImageDidChange_, *MEMORY[0x1E0DC59B0], 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_appIconImageDidChange_, CFSTR("com.apple.LaunchServices.applicationIconChanged"), 0);

    +[SearchUIAppIconImage homeScreenService](SearchUIAppIconImage, "homeScreenService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addHomeScreenIconStyleObserver:", v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIImageCache setHomeScreenIconStyleObserver:](v2, "setHomeScreenIconStyleObserver:", v10);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchUIImageCache homeScreenIconStyleObserver](self, "homeScreenIconStyleObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SearchUIImageCache;
  -[SearchUIImageCache dealloc](&v4, sel_dealloc);
}

- (void)clearImagesWithNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x1DF0A856C]();
  -[SearchUIImageCache imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  objc_autoreleasePoolPop(v4);
}

- (void)clearCacheAndPostNotificationForChangedIconForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__SearchUIImageCache_clearCacheAndPostNotificationForChangedIconForBundleIdentifier___block_invoke;
  v6[3] = &unk_1EA1F6210;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v6);

}

void __85__SearchUIImageCache_clearCacheAndPostNotificationForChangedIconForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "imageCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SearchUIAppIconImageDidChangeNotification"), *(_QWORD *)(a1 + 40));

}

- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4
{
  -[SearchUIImageCache appIconImageDidChange:](self, "appIconImageDidChange:", 0, a4);
}

- (void)appIconImageDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIImageCache clearCacheAndPostNotificationForChangedIconForBundleIdentifier:](self, "clearCacheAndPostNotificationForChangedIconForBundleIdentifier:", v4);

}

- (void)dateDidChange
{
  id v3;

  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIImageCache clearCacheAndPostNotificationForChangedIconForBundleIdentifier:](self, "clearCacheAndPostNotificationForChangedIconForBundleIdentifier:", v3);

}

+ (id)cachedTlkImageForSFImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "sharedCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)cacheTLKImage:(id)a3 forSFImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "sharedCache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (NSCache)imageCache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BSInvalidatable)homeScreenIconStyleObserver
{
  return self->_homeScreenIconStyleObserver;
}

- (void)setHomeScreenIconStyleObserver:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenIconStyleObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenIconStyleObserver, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
