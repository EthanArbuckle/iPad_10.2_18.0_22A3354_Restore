@implementation ICQCloudStorageSummaryCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  return (id)sharedInstance_cache_1;
}

void __45__ICQCloudStorageSummaryCache_sharedInstance__block_invoke()
{
  ICQCloudStorageSummaryCache *v0;
  void *v1;

  v0 = objc_alloc_init(ICQCloudStorageSummaryCache);
  v1 = (void *)sharedInstance_cache_1;
  sharedInstance_cache_1 = (uint64_t)v0;

}

- (ICQCloudStorageSummaryCache)init
{
  ICQCloudStorageSummaryCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *summaryCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQCloudStorageSummaryCache;
  v2 = -[ICQCloudStorageSummaryCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    summaryCache = v2->_summaryCache;
    v2->_summaryCache = v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    -[ICQCloudStorageSummaryCache _startObservingQuotaChangeNotifications](v2, "_startObservingQuotaChangeNotifications");
    -[ICQCloudStorageSummaryCache _startObservingCloudSubscriptionFeaturesNotifications](v2, "_startObservingCloudSubscriptionFeaturesNotifications");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ICQCloudStorageSummaryCache _stopObservingQuotaChangeNotifications](self, "_stopObservingQuotaChangeNotifications");
  -[ICQCloudStorageSummaryCache _stopObservingCloudSubscriptionFeaturesNotifications](self, "_stopObservingCloudSubscriptionFeaturesNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICQCloudStorageSummaryCache;
  -[ICQCloudStorageSummaryCache dealloc](&v3, sel_dealloc);
}

- (BOOL)hasDisplayedDetailsPage
{
  ICQCloudStorageSummaryCache *v2;
  os_unfair_lock_s *p_cacheLock;

  v2 = self;
  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  LOBYTE(v2) = v2->_hasDisplayedDetailsPage;
  os_unfair_lock_unlock(p_cacheLock);
  return (char)v2;
}

- (void)setHasDisplayedDetailsPage:(BOOL)a3
{
  os_unfair_lock_s *p_cacheLock;

  p_cacheLock = &self->_cacheLock;
  os_unfair_lock_lock(&self->_cacheLock);
  self->_hasDisplayedDetailsPage = a3;
  os_unfair_lock_unlock(p_cacheLock);
}

- (void)setStorageSummary:(id)a3 forAltDSID:(id)a4
{
  os_unfair_lock_s *p_cacheLock;
  id v7;
  id v8;

  p_cacheLock = &self->_cacheLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_summaryCache, "setObject:forKeyedSubscript:", v8, v7);

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)storageSummaryForAltDSID:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  id v5;
  void *v6;

  p_cacheLock = &self->_cacheLock;
  v5 = a3;
  os_unfair_lock_lock(p_cacheLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryCache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cacheLock);
  return v6;
}

- (void)_startObservingQuotaChangeNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id quotaChangeNotificationObserver;
  void *v8;
  void *v9;
  void *v10;
  id quotaInfoChangeNotificationObserver;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke;
    v14[3] = &unk_1E8B39F48;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("QuotaDidChange"), 0, v4, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = v6;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke_8;
    v12[3] = &unk_1E8B39F48;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("QuotaInformationChanged"), 0, v9, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    quotaInfoChangeNotificationObserver = self->_quotaInfoChangeNotificationObserver;
    self->_quotaInfoChangeNotificationObserver = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("QuotaDidChange");
    _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupCacheForPrimaryAccount");

}

void __70__ICQCloudStorageSummaryCache__startObservingQuotaChangeNotifications__block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("QuotaInformationChanged");
    _os_log_impl(&dword_1CDEBD000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupCacheForPrimaryAccount");

}

- (void)_startObservingCloudSubscriptionFeaturesNotifications
{
  void *v3;
  id cloudSubscriptionFeaturesObserver;

  if (!self->_cloudSubscriptionFeaturesObserver)
  {
    objc_msgSend(MEMORY[0x1E0D116A0], "registerForFeatureChangeNotificationsUsingBlock:", &__block_literal_global_10_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    cloudSubscriptionFeaturesObserver = self->_cloudSubscriptionFeaturesObserver;
    self->_cloudSubscriptionFeaturesObserver = v3;

  }
}

void __84__ICQCloudStorageSummaryCache__startObservingCloudSubscriptionFeaturesNotifications__block_invoke()
{
  NSObject *v0;
  void *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 138412290;
    v3 = CFSTR("QuotaDidChange");
    _os_log_impl(&dword_1CDEBD000, v0, OS_LOG_TYPE_DEFAULT, "Received CSF notification, posting QuotaDidChange notification named: %@", (uint8_t *)&v2, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);

}

- (void)_stopObservingQuotaChangeNotifications
{
  void *v3;
  void *v4;
  id quotaChangeNotificationObserver;
  id quotaInfoChangeNotificationObserver;

  if (self->_quotaChangeNotificationObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_quotaChangeNotificationObserver);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_quotaInfoChangeNotificationObserver);

    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = 0;

    quotaInfoChangeNotificationObserver = self->_quotaInfoChangeNotificationObserver;
    self->_quotaInfoChangeNotificationObserver = 0;

  }
}

- (void)_stopObservingCloudSubscriptionFeaturesNotifications
{
  id cloudSubscriptionFeaturesObserver;

  if (self->_cloudSubscriptionFeaturesObserver)
  {
    objc_msgSend(MEMORY[0x1E0D116A0], "unregisterForFeatureChangeNotificationsUsingObserver:");
    cloudSubscriptionFeaturesObserver = self->_cloudSubscriptionFeaturesObserver;
    self->_cloudSubscriptionFeaturesObserver = 0;

  }
}

- (void)_cleanupCacheForPrimaryAccount
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    os_unfair_lock_lock(&self->_cacheLock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_summaryCache, "setObject:forKeyedSubscript:", 0, v4);
    os_unfair_lock_unlock(&self->_cacheLock);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cloudSubscriptionFeaturesObserver, 0);
  objc_storeStrong(&self->_quotaInfoChangeNotificationObserver, 0);
  objc_storeStrong(&self->_quotaChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_summaryCache, 0);
}

@end
