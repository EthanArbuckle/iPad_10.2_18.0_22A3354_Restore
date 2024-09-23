@implementation _ICQAppLaunchLink

- (_ICQAppLaunchLink)initWithServerDictionary:(id)a3
{
  id v4;
  _ICQAppLaunchLink *v5;
  uint64_t v6;
  NSString *appId;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ICQLink *v12;
  ICQLink *link;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ICQAppLaunchLink;
  v5 = -[_ICQAppLaunchLink init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appId"));
    v6 = objc_claimAutoreleasedReturnValue();
    appId = v5->_appId;
    v5->_appId = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _ICQActionForServerActionString(v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actParams"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQActionParametersForServerActionParameters(v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[ICQLink initWithText:action:parameters:]([ICQLink alloc], "initWithText:action:parameters:", 0, v9, v11);
    link = v5->_link;
    v5->_link = v12;

    v5->_minDisplayIntervalDays = (NSNumber *)(id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minDisplayIntervalDays"));
  }

  return v5;
}

- (BOOL)isEligible
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSInteger v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[_ICQAppLaunchLink isEligible].cold.5();

  +[ICQAppLaunchLinkTracker shared](ICQAppLaunchLinkTracker, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "daysSinceLastShownForBundleID:", self->_appId);

  if (v5 == +[ICQAppLaunchLinkTracker neverShown](ICQAppLaunchLinkTracker, "neverShown"))
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_ICQAppLaunchLink isEligible].cold.3();
    v7 = 1;
  }
  else
  {
    v8 = -[NSNumber integerValue](self->_minDisplayIntervalDays, "integerValue");
    v7 = v5 >= v8;
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_ICQAppLaunchLink isEligible].cold.4(v5 >= v8, v5, v6);
  }

  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = v7;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "App launch time eligible: %d", (uint8_t *)v14, 8u);
  }

  if (!v7 || !+[_ICQPhotosInfo isPhotosSyncOverQuota](_ICQPhotosInfo, "isPhotosSyncOverQuota"))
    goto LABEL_20;
  _ICQGetLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_ICQAppLaunchLink isEligible].cold.2();

  if (v5 == +[ICQAppLaunchLinkTracker neverShown](ICQAppLaunchLinkTracker, "neverShown")
    || +[_ICQPhotosInfo hasPhotoBulkCreation](_ICQPhotosInfo, "hasPhotoBulkCreation"))
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "App launch link is valid", (uint8_t *)v14, 2u);
    }
    v12 = 1;
  }
  else
  {
LABEL_20:
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_ICQAppLaunchLink isEligible].cold.1();
    v12 = 0;
  }

  return v12;
}

- (void)cacheLiftUIContentIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[_ICQAppLaunchLink link](self, "link");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "action") == 121)
  {

  }
  else
  {
    -[_ICQAppLaunchLink link](self, "link");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "action");

    if (v5 != 115)
      return;
  }
  +[ICQLiftUICache sharedCache](ICQLiftUICache, "sharedCache");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_ICQAppLaunchLink link](self, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverUIURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cacheResponseFromURL:", v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_ICQAppLaunchLink appId](self, "appId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appId"));

  -[_ICQAppLaunchLink link](self, "link");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("link"));

  -[_ICQAppLaunchLink minDisplayIntervalDays](self, "minDisplayIntervalDays");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("minDisplayIntervalDays"));

}

- (_ICQAppLaunchLink)initWithCoder:(id)a3
{
  id v4;
  _ICQAppLaunchLink *v5;
  uint64_t v6;
  NSString *appId;
  uint64_t v8;
  ICQLink *link;

  v4 = a3;
  v5 = -[_ICQAppLaunchLink init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appId"));
    v6 = objc_claimAutoreleasedReturnValue();
    appId = v5->_appId;
    v5->_appId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("link"));
    v8 = objc_claimAutoreleasedReturnValue();
    link = v5->_link;
    v5->_link = (ICQLink *)v8;

    v5->_minDisplayIntervalDays = (NSNumber *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minDisplayIntervalDays"));
  }

  return v5;
}

- (NSString)appId
{
  return self->_appId;
}

- (ICQLink)link
{
  return self->_link;
}

- (NSNumber)minDisplayIntervalDays
{
  return self->_minDisplayIntervalDays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

- (void)isEligible
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1CDEBD000, v0, v1, "Checking AppLaunchLink eligibility", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
