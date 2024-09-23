@implementation ICQMLBiomePublisher

+ (id)_createEventWithMlServerScore:(id)a3 totalQuota:(id)a4 totalUsed:(id)a5 totalAvailable:(id)a6 bundleQuotaInBytes:(id)a7 commerceQuotaInBytes:(id)a8 iCloudSubscriptionEventType:(int)a9 displayEntry:(int)a10
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint8_t v30[16];
  uint8_t buf[16];

  v15 = (objc_class *)MEMORY[0x1E0D02358];
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = [v15 alloc];
  v23 = objc_opt_respondsToSelector();

  _ICQGetLogSystem();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if ((v23 & 1) != 0)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CDEBD000, v24, OS_LOG_TYPE_DEFAULT, "[SUBD] New BiomeLibrary detected. Adding displayEntry parameter.", buf, 2u);
    }

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02358]), "initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", v21, v20, v19, v18, v17, v16, __PAIR64__(a10, a9));
  }
  else
  {
    if (v25)
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1CDEBD000, v24, OS_LOG_TYPE_DEFAULT, "[SUBD] Old BiomeLibrary detected. Using the deprecated init function.", v30, 2u);
    }

    LODWORD(v29) = a9;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02358]), "initWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:", v21, v20, v19, v18, v17, v16, v29);
  }
  v27 = (void *)v26;

  return v27;
}

+ (id)_createEventWithQuotaInfoFrom:(id)a3 withType:(int)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  +[_ICQHelperFunctions dictionaryForKey:from:](_ICQHelperFunctions, "dictionaryForKey:from:", CFSTR("quotaInfo"), a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (void *)v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA70];
  +[_ICQHelperFunctions numberForKey:from:](_ICQHelperFunctions, "numberForKey:from:", CFSTR("totalQuota"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions numberForKey:from:](_ICQHelperFunctions, "numberForKey:from:", CFSTR("totalUsed"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions numberForKey:from:](_ICQHelperFunctions, "numberForKey:from:", CFSTR("totalAvailable"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions numberForKey:from:](_ICQHelperFunctions, "numberForKey:from:", CFSTR("bundleQuotaInBytes"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQHelperFunctions numberForKey:from:](_ICQHelperFunctions, "numberForKey:from:", CFSTR("commerceQuotaInBytes"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, v8, v9, v10, v11, v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (void)_publishEvent:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] About to publish Biome event=[%@].", (uint8_t *)&v10, 0xCu);
  }

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iCloud");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Subscription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:", v3);
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "[SUBD] Successfully published Biome event=[%@].", (uint8_t *)&v10, 0xCu);
  }

}

+ (void)publishEventWithFetchOffersResponse:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing Fetch Offers response event.", v6, 2u);
  }

  +[ICQMLBiomePublisher _createEventWithQuotaInfoFrom:withType:](ICQMLBiomePublisher, "_createEventWithQuotaInfoFrom:withType:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICQMLBiomePublisher _publishEvent:](ICQMLBiomePublisher, "_publishEvent:", v5);
}

+ (void)publishEventWithRefreshOfferDetailsResponse:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a3;
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing Refresh Offer Details response event.", v6, 2u);
  }

  +[ICQMLBiomePublisher _createEventWithQuotaInfoFrom:withType:](ICQMLBiomePublisher, "_createEventWithQuotaInfoFrom:withType:", v3, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICQMLBiomePublisher _publishEvent:](ICQMLBiomePublisher, "_publishEvent:", v5);
}

+ (void)publishEventWithPushNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t buf[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing Push Notification event.", buf, 2u);
  }

  +[_ICQHelperFunctions numberForKey:from:](_ICQHelperFunctions, "numberForKey:from:", CFSTR("mlServerScore"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", v6, 0, 0, 0, 0, 0, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICQMLBiomePublisher _publishEvent:](ICQMLBiomePublisher, "_publishEvent:", v7);
}

+ (void)publishOfferDisplayActionEvent
{
  NSObject *v3;
  void *v4;
  uint8_t buf[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing offer displayed to user.", buf, 2u);
  }

  objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, 0, 0, 0, 0, 0, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQMLBiomePublisher _publishEvent:](ICQMLBiomePublisher, "_publishEvent:", v4);

}

+ (void)publishOfferDisplayActionEventWithBundleId:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.iCloudQuota.ICQFollowup")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v5 = 3;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.DocumentsApp")))
  {
    v5 = 4;
  }
  else
  {
    v5 = 0;
  }
  LODWORD(v8) = 3;
  HIDWORD(v8) = v5;
  objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, 0, 0, 0, 0, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing offer displayed to user. BundleID=[%@] event=[%@]", buf, 0x16u);
  }

  +[ICQMLBiomePublisher _publishEvent:](ICQMLBiomePublisher, "_publishEvent:", v6);
}

+ (void)publishOfferBuyActionEvent
{
  NSObject *v3;
  void *v4;
  uint8_t buf[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CDEBD000, v3, OS_LOG_TYPE_DEFAULT, "[SUBD] Biome publishing user clicked 'buy offer'.", buf, 2u);
  }

  objc_msgSend(a1, "_createEventWithMlServerScore:totalQuota:totalUsed:totalAvailable:bundleQuotaInBytes:commerceQuotaInBytes:iCloudSubscriptionEventType:displayEntry:", 0, 0, 0, 0, 0, 0, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQMLBiomePublisher _publishEvent:](ICQMLBiomePublisher, "_publishEvent:", v4);

}

@end
