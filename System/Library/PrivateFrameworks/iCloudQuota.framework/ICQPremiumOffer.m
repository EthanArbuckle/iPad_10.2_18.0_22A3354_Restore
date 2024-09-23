@implementation ICQPremiumOffer

- (void)setShouldStartOnDeviceJourney:(BOOL)a3
{
  self->_shouldStartOnDeviceJourney = a3;
}

- (void)setOpportunityBubble:(id)a3
{
  objc_storeStrong((id *)&self->_opportunityBubble, a3);
}

- (void)setIsBadgeApp:(BOOL)a3
{
  self->_isBadgeApp = a3;
}

- (void)setCommerceQuotaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_commerceQuotaInfo, a3);
}

- (void)setBundleQuotaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bundleQuotaInfo, a3);
}

- (ICQPremiumOffer)initWithServerDictionary:(id)a3 accountAltDSID:(id)a4 notificationID:(id)a5 retrievalDate:(id)a6 callbackInterval:(double)a7 appLaunchLink:(id)a8 bundleIdentifier:(id)a9
{
  ICQPremiumOffer *v16;
  id v17;
  ICQPremiumOffer *v18;
  ICQPremiumOffer *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  ICQPremiumOffer *v24;
  NSObject *v25;
  objc_super v27;
  uint8_t buf[4];
  ICQPremiumOffer *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = (ICQPremiumOffer *)a3;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ICQPremiumOffer;
  v18 = -[ICQOffer initWithServerDictionary:accountAltDSID:notificationID:retrievalDate:callbackInterval:appLaunchLink:bundleIdentifier:](&v27, sel_initWithServerDictionary_accountAltDSID_notificationID_retrievalDate_callbackInterval_appLaunchLink_bundleIdentifier_, v16, a4, a5, a6, a8, v17, a7);
  v19 = v18;
  if (!v18)
  {
LABEL_6:
    v24 = v19;
    goto LABEL_10;
  }
  if (-[ICQOffer offerType](v18, "offerType") == 8)
  {
    v19->_dismissed = 0;
    -[ICQPremiumOffer setIsBadgeApp:](v19, "setIsBadgeApp:", -[ICQPremiumOffer getBadgeAppFromServerDict:](v19, "getBadgeAppFromServerDict:", v16));
    -[ICQPremiumOffer _ICQOpportunityBubbleSpecificationForServerDict:bundleId:](v19, "_ICQOpportunityBubbleSpecificationForServerDict:bundleId:", v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPremiumOffer setOpportunityBubble:](v19, "setOpportunityBubble:", v20);

    -[ICQPremiumOffer _bundleStorageLevelFromServerDict:](v19, "_bundleStorageLevelFromServerDict:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPremiumOffer setBundleQuotaInfo:](v19, "setBundleQuotaInfo:", v21);

    -[ICQPremiumOffer _commerceStorageLevelFromServerDict:](v19, "_commerceStorageLevelFromServerDict:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPremiumOffer setCommerceQuotaInfo:](v19, "setCommerceQuotaInfo:", v22);

    -[ICQPremiumOffer setShouldStartOnDeviceJourney:](v19, "setShouldStartOnDeviceJourney:", -[ICQPremiumOffer _hasFollowupEnabledFromServerDict:](v19, "_hasFollowupEnabledFromServerDict:", v16));
    _ICQGetLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v19;
      _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "Successfully initialized premium offer from server response: %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
  _ICQGetLogSystem();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v16;
    _os_log_impl(&dword_1CDEBD000, v25, OS_LOG_TYPE_DEFAULT, "Cannot initialize premium offer from server dict due to invalid type: %@", buf, 0xCu);
  }

  v24 = 0;
LABEL_10:

  return v24;
}

- (BOOL)getBadgeAppFromServerDict:(id)a3
{
  void *v3;
  char v4;
  NSObject *v5;
  objc_class *v6;
  int v8;
  const char *Name;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("badgeApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    if (v3)
    {
      _ICQGetLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        v8 = 136315394;
        Name = class_getName(v6);
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v8, 0x16u);
      }

    }
    v4 = 0;
  }

  return v4;
}

- (id)_parseQuotaInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)_hasFollowupEnabledFromServerDict:(id)a3
{
  void *v3;
  int v4;
  NSObject *v5;
  objc_class *v6;
  int v8;
  const char *Name;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("followUpEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "BOOLValue") ^ 1;
  }
  else
  {
    if (v3)
    {
      _ICQGetLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        v8 = 136315394;
        Name = class_getName(v6);
        v10 = 2112;
        v11 = v3;
        _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v8, 0x16u);
      }

    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_commerceStorageLevelFromServerDict:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("quotaInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("commerceQuotaInBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQPremiumOffer _parseQuotaInfo:](self, "_parseQuotaInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Current commerce storage level from Premium offer: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_bundleStorageLevelFromServerDict:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("quotaInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleQuotaInBytes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQPremiumOffer _parseQuotaInfo:](self, "_parseQuotaInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Current bundle storage level from Premium offer: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (id)_ICQOpportunityBubbleSpecificationForServerDict:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  NSObject *v12;
  objc_class *v13;
  ICQOpportunityBubbleSpecification *v14;
  int v16;
  const char *Name;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("opportunityBubble"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _ICQServerDictionaryForBundleIdentifier(v7, v6, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("opportunitySheet"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        _ICQServerDictionaryForBundleIdentifier(v9, v6, 0, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      v14 = -[ICQOpportunityBubbleSpecification initWithOpportunityBubble:andOpportunitySheet:]([ICQOpportunityBubbleSpecification alloc], "initWithOpportunityBubble:andOpportunitySheet:", v8, v10);

      goto LABEL_17;
    }
    if (v8)
    {
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v16 = 136315394;
        Name = class_getName(v13);
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v16, 0x16u);
      }

    }
LABEL_13:
    v14 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (v7)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v16 = 136315394;
      Name = class_getName(v11);
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_13;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

- (id)serverUIURL
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  -[ICQOffer requestedServerUIURL](self, "requestedServerUIURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICQOffer requestedServerUIURL](self, "requestedServerUIURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      return v4;
  }
  else
  {
    -[ICQPremiumOffer _serverUIURLFromOfferContents](self, "_serverUIURLFromOfferContents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICQPremiumOffer _serverUIURLFromOfferContents](self, "_serverUIURLFromOfferContents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        return v4;
    }
  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICQPremiumOffer serverUIURL].cold.1(v6);

  v4 = 0;
  return v4;
}

- (id)_serverUIURLFromOfferContents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICQOffer followupSpecification](self, "followupSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICQOffer followupSpecification](self, "followupSpecification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    objc_msgSend(v4, "serverUIURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  -[ICQPremiumOffer opportunityBubble](self, "opportunityBubble");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICQPremiumOffer opportunityBubble](self, "opportunityBubble");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return v5;
}

- (void)shouldShowOpportunityBubbleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ICQPremiumOffer opportunityBubble](self, "opportunityBubble");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportingDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "displayRuleType") == 2)
  {
    -[ICQPremiumOffer shouldShowOpportunityBubbleWithDisplayRuleResult:completion:](self, "shouldShowOpportunityBubbleWithDisplayRuleResult:completion:", objc_msgSend(v6, "displayRuleServerAlwaysShow"), v4);
  }
  else
  {
    -[ICQOffer bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__ICQPremiumOffer_shouldShowOpportunityBubbleWithCompletion___block_invoke;
    v8[3] = &unk_1E8B39F90;
    v8[4] = self;
    v9 = v4;
    +[ICQEngagementReporter shouldShowOpportunityBubbleWithBundleID:completion:](ICQEngagementReporter, "shouldShowOpportunityBubbleWithBundleID:completion:", v7, v8);

  }
}

uint64_t __61__ICQPremiumOffer_shouldShowOpportunityBubbleWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldShowOpportunityBubbleWithDisplayRuleResult:completion:", a2, *(_QWORD *)(a1 + 40));
}

- (void)shouldShowOpportunityBubbleWithDisplayRuleResult:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[ICQPremiumOffer opportunityBubble](self, "opportunityBubble");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v7)
      v10 = CFSTR("YES");
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "bubble not nil: %@", (uint8_t *)&v14, 0xCu);
  }

  v11 = +[ICQPreferences shouldEnableUnifiedMessaging](ICQPreferences, "shouldEnableUnifiedMessaging");
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Using Unified Messaging based on Internal Settings", (uint8_t *)&v14, 2u);
    }

    if (v7)
      v8 = v4;
    else
      v8 = 0;
  }
  else
  {
    if (v13)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1CDEBD000, v12, OS_LOG_TYPE_DEFAULT, "Not using Unified Messaging based on Internal Settings", (uint8_t *)&v14, 2u);
    }

  }
  v6[2](v6, v8);

}

- (BOOL)isBadgeApp
{
  return self->_isBadgeApp;
}

- (BOOL)shouldStartOnDeviceJourney
{
  return self->_shouldStartOnDeviceJourney;
}

- (ICQOpportunityBubbleSpecification)opportunityBubble
{
  return self->_opportunityBubble;
}

- (NSNumber)bundleQuotaInfo
{
  return self->_bundleQuotaInfo;
}

- (NSNumber)commerceQuotaInfo
{
  return self->_commerceQuotaInfo;
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commerceQuotaInfo, 0);
  objc_storeStrong((id *)&self->_bundleQuotaInfo, 0);
  objc_storeStrong((id *)&self->_opportunityBubble, 0);
}

- (void)serverUIURL
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CDEBD000, log, OS_LOG_TYPE_ERROR, "The requested RemoteUI URL is nil! We won't be able to present a remoteUI flow", v1, 2u);
}

@end
