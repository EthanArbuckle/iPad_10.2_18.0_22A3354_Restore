@implementation APContentDataInternal

+ (BOOL)isPlaceholderIdentifier:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("placeholder: "));
}

- (APContentDataPrivate)privateContent
{
  return (APContentDataPrivate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAdOriginalRequesterId:(id)a3
{
  objc_storeStrong((id *)&self->_adOriginalRequesterId, a3);
}

- (APContentData)content
{
  return (APContentData *)objc_getProperty(self, a2, 8, 1);
}

- (APContentDataTransient)transientContent
{
  return (APContentDataTransient *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)journeyStartRelayValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)adOriginalRequesterId
{
  return self->_adOriginalRequesterId;
}

- (APContentDataInternal)initWithAdData:(id)a3 identifier:(id)a4 contextIdentifier:(id)a5 placementType:(int64_t)a6 maxSize:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  id v15;
  APContentDataInternal *v16;
  APContentData *v17;
  APContentData *content;
  APContentDataPrivate *v19;
  APContentDataPrivate *privateContent;
  APContentDataTransient *v21;
  APContentDataTransient *transientContent;
  uint64_t v23;
  NSDictionary *journeyStartRelayValues;
  objc_super v26;

  var1 = a7.var1;
  var0 = a7.var0;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v26.receiver = self;
  v26.super_class = (Class)APContentDataInternal;
  v16 = -[APContentDataInternal init](&v26, "init");
  if (v16)
  {
    v17 = (APContentData *)objc_msgSend(objc_alloc((Class)APContentData), "initWithAdData:identifier:contextIdentifier:placementType:maxSize:", v13, v14, v15, a6, var0, var1);
    content = v16->_content;
    v16->_content = v17;

    v19 = -[APContentDataPrivate initWithAdData:forPlacementType:]([APContentDataPrivate alloc], "initWithAdData:forPlacementType:", v13, a6);
    privateContent = v16->_privateContent;
    v16->_privateContent = v19;

    v21 = objc_alloc_init(APContentDataTransient);
    transientContent = v16->_transientContent;
    v16->_transientContent = v21;

    v23 = objc_claimAutoreleasedReturnValue(-[APContentDataInternal _loadJourneyStartRelayValuesFromAdData:](v16, "_loadJourneyStartRelayValuesFromAdData:", v13));
    journeyStartRelayValues = v16->_journeyStartRelayValues;
    v16->_journeyStartRelayValues = (NSDictionary *)v23;

  }
  return v16;
}

- (id)_loadJourneyStartRelayValuesFromAdData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];

  v3 = a3;
  v4 = objc_alloc((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "journeyStartRelayValues"));
  v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "journeyStartRelayValues"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11);
        if (!objc_msgSend(v12, "hasKey")
          || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "key")),
              v14 = objc_msgSend(v13, "length"),
              v13,
              !v14))
        {
          v16 = APLogForCategory(21);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Journey start relay value does not have a key.", buf, 2u);
          }
          goto LABEL_21;
        }
        if (objc_msgSend(v12, "hasValueInt"))
        {
          v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v12, "valueInt")));
LABEL_18:
          v17 = v15;
          if (!v15)
            goto LABEL_22;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "key"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v18);
          goto LABEL_20;
        }
        if (objc_msgSend(v12, "hasValueBool"))
        {
          v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "valueBool")));
          goto LABEL_18;
        }
        if (objc_msgSend(v12, "hasValueDouble"))
        {
          objc_msgSend(v12, "valueDouble");
          v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          goto LABEL_18;
        }
        if (objc_msgSend(v12, "hasValueString"))
        {
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueString"));
          goto LABEL_18;
        }
        v19 = APLogForCategory(21);
        v17 = objc_claimAutoreleasedReturnValue(v19);
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "key"));
        *(_DWORD *)buf = 138543362;
        v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No Journey start relay value set for key %{public}@.", buf, 0xCu);
LABEL_20:

LABEL_21:
LABEL_22:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v20 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v9 = v20;
    }
    while (v20);
  }

  v21 = objc_msgSend(v6, "copy");
  return v21;
}

- (APContentDataInternal)init
{
  APContentDataInternal *v2;
  APContentData *v3;
  APContentData *content;
  APContentDataPrivate *v5;
  APContentDataPrivate *privateContent;
  APContentDataTransient *v7;
  APContentDataTransient *transientContent;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APContentDataInternal;
  v2 = -[APContentDataInternal init](&v10, "init");
  if (v2)
  {
    v3 = (APContentData *)objc_alloc_init((Class)APContentData);
    content = v2->_content;
    v2->_content = v3;

    v5 = objc_alloc_init(APContentDataPrivate);
    privateContent = v2->_privateContent;
    v2->_privateContent = v5;

    v7 = objc_alloc_init(APContentDataTransient);
    transientContent = v2->_transientContent;
    v2->_transientContent = v7;

  }
  return v2;
}

- (APContentDataInternal)initWithContent:(id)a3 privateContent:(id)a4 andTransientContent:(id)a5
{
  id v9;
  id v10;
  id v11;
  APContentDataInternal *v12;
  APContentDataInternal *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[APContentDataInternal init](self, "init");
  v13 = v12;
  if (v12)
  {
    if (v9)
      objc_storeStrong((id *)&v12->_content, a3);
    if (v10)
      objc_storeStrong((id *)&v13->_privateContent, a4);
    if (v11)
      objc_storeStrong((id *)&v13->_transientContent, a5);
  }

  return v13;
}

- (APContentDataInternal)initWithContent:(id)a3
{
  return -[APContentDataInternal initWithContent:privateContent:andTransientContent:](self, "initWithContent:privateContent:andTransientContent:", a3, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataProvider, 0);
  objc_storeStrong((id *)&self->_adOriginalRequesterId, 0);
  objc_storeStrong((id *)&self->_journeyStartRelayValues, 0);
  objc_storeStrong((id *)&self->_transientContent, 0);
  objc_storeStrong((id *)&self->_privateContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APContentDataInternal)initWithUnfilledReason:(int64_t)a3 error:(id)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 containerSize:(id)a7 placementType:(int64_t)a8 journeyStartRelayValues:(id)a9
{
  double var1;
  double var0;
  id v17;
  id v18;
  id v19;
  id v20;
  APContentDataInternal *v21;
  APContentData *v22;
  APContentData *content;
  APContentDataPrivate *v24;
  APContentDataPrivate *privateContent;

  var1 = a7.var1;
  var0 = a7.var0;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = -[APContentDataInternal init](self, "init");
  if (v21)
  {
    v22 = (APContentData *)objc_msgSend(objc_alloc((Class)APContentData), "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:", a3, v17, v18, v19, a8, var0, var1);
    content = v21->_content;
    v21->_content = v22;

    v24 = objc_alloc_init(APContentDataPrivate);
    privateContent = v21->_privateContent;
    v21->_privateContent = v24;

    objc_storeStrong((id *)&v21->_journeyStartRelayValues, a9);
  }

  return v21;
}

- (APContentDataInternal)initWithContentDataProvider:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  APContentDataInternal *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentDataPrivate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentDataTransient"));
  v9 = -[APContentDataInternal initWithContent:privateContent:andTransientContent:](self, "initWithContent:privateContent:andTransientContent:", v6, v7, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_contentDataProvider, a3);

  return v9;
}

- (id)initRateLimitedForContextId:(id)a3 containerSize:(id)a4 placementType:(int64_t)a5
{
  double var1;
  double var0;
  id v9;
  APContentDataInternal *v10;
  APContentData *v11;
  APContentData *content;
  APContentDataPrivate *v13;
  APContentDataPrivate *privateContent;
  APContentDataTransient *v15;
  APContentDataTransient *transientContent;
  objc_super v18;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)APContentDataInternal;
  v10 = -[APContentDataInternal init](&v18, "init");
  if (v10)
  {
    v11 = (APContentData *)objc_msgSend(objc_alloc((Class)APContentData), "initRateLimitedForContextId:containerSize:placementType:", v9, a5, var0, var1);
    content = v10->_content;
    v10->_content = v11;

    v13 = objc_alloc_init(APContentDataPrivate);
    privateContent = v10->_privateContent;
    v10->_privateContent = v13;

    v15 = objc_alloc_init(APContentDataTransient);
    transientContent = v10->_transientContent;
    v10->_transientContent = v15;

  }
  return v10;
}

- (void)resetTransientData
{
  APContentDataTransient *v3;
  APContentDataTransient *transientContent;

  v3 = objc_alloc_init(APContentDataTransient);
  transientContent = self->_transientContent;
  self->_transientContent = v3;

}

- (void)accumulateVisibilityTime:(double)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  v6 = objc_msgSend(v5, "isCarouselAd");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v7, "carouselVisibleTime");
    objc_msgSend(v7, "setCarouselVisibleTime:", v8 + a3);

  }
  if (!-[APContentDataInternal hasConfirmedImpression](self, "hasConfirmedImpression"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v9, "accumulatedVisibilityTime");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    objc_msgSend(v12, "impressionThreshold");
    v14 = v13;

    if (v11 <= v14)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v16, "accumulatedVisibilityTime");
      objc_msgSend(v16, "setAccumulatedVisibilityTime:", v15 + a3);

    }
  }
}

- (void)accumulate50PercentVisibilityTime:(double)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  v6 = objc_msgSend(v5, "isCarouselAd");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v7, "carousel50PercentVisibleTime");
    objc_msgSend(v7, "setCarousel50PercentVisibleTime:", v8 + a3);

  }
  if (!-[APContentDataInternal hasConfirmed50PercentImpression](self, "hasConfirmed50PercentImpression"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v9, "accumulated50PercentVisibilityTime");
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    objc_msgSend(v12, "impressionThreshold");
    v14 = v13;

    if (v11 <= v14)
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v16, "accumulated50PercentVisibilityTime");
      objc_msgSend(v16, "setAccumulated50PercentVisibilityTime:", v15 + a3);

    }
  }
}

- (void)appearedOnScreenWithStatus:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  __CFString *v20;

  v3 = *(_QWORD *)&a3;
  v5 = APLogForCategory(21);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = CFSTR("ADStatusCodeUnknown");
    switch((int)v3)
    {
      case 0:
        break;
      case 1:
        v11 = CFSTR("ADStatusCodeServerFailure");
        break;
      case 2:
        v11 = CFSTR("ADStatusCodeLoadingThrottled");
        break;
      case 3:
        v11 = CFSTR("ADStatusCodeInventoryUnavailable");
        break;
      case 4:
        v11 = CFSTR("ADStatusCodeConfigurationError");
        break;
      case 5:
        v11 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
        break;
      case 6:
        v11 = CFSTR("ADStatusCodeApplicationInactive");
        break;
      case 7:
        v11 = CFSTR("ADStatusCodeAdUnloaded");
        break;
      case 8:
        v11 = CFSTR("ADStatusCodeAssetLoadFailure");
        break;
      case 9:
        v11 = CFSTR("ADStatusCodeAdResponseValidateFailure");
        break;
      case 10:
        v11 = CFSTR("ADStatusCodeAdAssetLoadPending");
        break;
      case 11:
        v11 = CFSTR("ADStatusCodeWaitingForResponse");
        break;
      case 12:
        v11 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
        break;
      case 13:
        v11 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
        break;
      case 14:
        v11 = CFSTR("ADStatusCodeBatchLimitExceeded");
        break;
      case 15:
        v11 = CFSTR("ADStatusCodeAdsDisabledInIssue");
        break;
      default:
        switch((int)v3)
        {
          case 3000:
            v11 = CFSTR("ADStatusCodeNoError");
            break;
          case 3001:
            v11 = CFSTR("ADStatusCodeAdNotAvailable");
            break;
          case 3002:
            v11 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
            break;
          case 3003:
            v11 = CFSTR("ADStatusCodePlacedInFirstScreenful");
            break;
          case 3004:
            v11 = CFSTR("ADStatusCodeAdLoadedTooLate");
            break;
          case 3005:
            v11 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
            break;
          case 3006:
            v11 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
            break;
          case 3007:
            v11 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
            break;
          case 3008:
            v11 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
            break;
          case 3009:
            v11 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
            break;
          case 3010:
            v11 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
            break;
          case 3011:
            v11 = CFSTR("ADStatusCodeAdMetadataError");
            break;
          case 3012:
            v11 = CFSTR("ADStatusCodeAdArticleLoadError");
            break;
          case 3013:
            v11 = CFSTR("ADStatusCodeAdVideoLoadError");
            break;
          default:
            if ((_DWORD)v3 == 360)
              v11 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
            else
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v3));
            break;
        }
        break;
    }
    *(_DWORD *)buf = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content for context %{public}@ with ID %{public}@ appeared on screen with status %{public}@.", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v12, "setHasBeenOnScreen:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v13, "setLastStatusCode:", v3);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v14, "save");

}

- (BOOL)canSendImpression:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  uint64_t v46;

  v3 = a3;
  if (-[APContentDataInternal hasConfirmedImpression](self, "hasConfirmedImpression"))
  {
    v5 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_53:
      v12 = 0;
      goto LABEL_54;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138543362;
    v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send viewable impression - it has already impressed.", buf, 0xCu);
LABEL_4:

    goto LABEL_53;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v10 = objc_msgSend(v9, "lastStatusCode");

  if (v10 != 3000)
  {
    v15 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      v19 = objc_msgSend(v18, "lastStatusCode");
      v20 = CFSTR("ADStatusCodeUnknown");
      switch((int)v19)
      {
        case 0:
          break;
        case 1:
          v20 = CFSTR("ADStatusCodeServerFailure");
          break;
        case 2:
          v20 = CFSTR("ADStatusCodeLoadingThrottled");
          break;
        case 3:
          v20 = CFSTR("ADStatusCodeInventoryUnavailable");
          break;
        case 4:
          v20 = CFSTR("ADStatusCodeConfigurationError");
          break;
        case 5:
          v20 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
          break;
        case 6:
          v20 = CFSTR("ADStatusCodeApplicationInactive");
          break;
        case 7:
          v20 = CFSTR("ADStatusCodeAdUnloaded");
          break;
        case 8:
          v20 = CFSTR("ADStatusCodeAssetLoadFailure");
          break;
        case 9:
          v20 = CFSTR("ADStatusCodeAdResponseValidateFailure");
          break;
        case 10:
          v20 = CFSTR("ADStatusCodeAdAssetLoadPending");
          break;
        case 11:
          v20 = CFSTR("ADStatusCodeWaitingForResponse");
          break;
        case 12:
          v20 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
          break;
        case 13:
          v20 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
          break;
        case 14:
          v20 = CFSTR("ADStatusCodeBatchLimitExceeded");
          break;
        case 15:
          v20 = CFSTR("ADStatusCodeAdsDisabledInIssue");
          break;
        default:
          switch((int)v19)
          {
            case 3000:
              v20 = CFSTR("ADStatusCodeNoError");
              break;
            case 3001:
              v20 = CFSTR("ADStatusCodeAdNotAvailable");
              break;
            case 3002:
              v20 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
              break;
            case 3003:
              v20 = CFSTR("ADStatusCodePlacedInFirstScreenful");
              break;
            case 3004:
              v20 = CFSTR("ADStatusCodeAdLoadedTooLate");
              break;
            case 3005:
              v20 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
              break;
            case 3006:
              v20 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
              break;
            case 3007:
              v20 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
              break;
            case 3008:
              v20 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
              break;
            case 3009:
              v20 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
              break;
            case 3010:
              v20 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
              break;
            case 3011:
              v20 = CFSTR("ADStatusCodeAdMetadataError");
              break;
            case 3012:
              v20 = CFSTR("ADStatusCodeAdArticleLoadError");
              break;
            case 3013:
              v20 = CFSTR("ADStatusCodeAdVideoLoadError");
              break;
            default:
              if ((_DWORD)v19 == 360)
                v20 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
              else
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v19));
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v42 = v17;
      v43 = 2112;
      v44 = v20;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send viewable impression - current ASE code is %@.", buf, 0x16u);

    }
    goto LABEL_53;
  }
  if (!v3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v21, "accumulatedVisibilityTime");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    objc_msgSend(v24, "impressionThreshold");
    v26 = v25;

    v27 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v27);
    v28 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v23 < v26)
    {
      if (!v28)
        goto LABEL_53;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v29, "accumulatedVisibilityTime");
      v31 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      objc_msgSend(v32, "impressionThreshold");
      *(_DWORD *)buf = 138543874;
      v42 = v8;
      v43 = 2048;
      v44 = v31;
      v45 = 2048;
      v46 = v33;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send viewable impression - at visible threshold for only %.2f of %.2f seconds", buf, 0x20u);

      goto LABEL_4;
    }
    if (!v28)
    {
      v12 = 1;
      goto LABEL_54;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    objc_msgSend(v35, "impressionThreshold");
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v38, "accumulatedVisibilityTime");
    *(_DWORD *)buf = 138543874;
    v42 = v34;
    v43 = 2048;
    v44 = v37;
    v45 = 2048;
    v46 = v39;
    v12 = 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send viewable impression - at visible threshold more than %.2f seconds (%.2f)", buf, 0x20u);

    goto LABEL_20;
  }
  v11 = APLogForCategory(21);
  v6 = objc_claimAutoreleasedReturnValue(v11);
  v12 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    *(_DWORD *)buf = 138543362;
    v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send viewable impression due to interaction", buf, 0xCu);

LABEL_20:
  }
LABEL_54:

  return v12;
}

- (BOOL)canSend50PercentImpression:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  uint64_t v46;

  v3 = a3;
  if (-[APContentDataInternal hasConfirmed50PercentImpression](self, "hasConfirmed50PercentImpression"))
  {
    v5 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_53:
      v12 = 0;
      goto LABEL_54;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138543362;
    v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send 50 percent viewable impression - it has already impressed.", buf, 0xCu);
LABEL_4:

    goto LABEL_53;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v10 = objc_msgSend(v9, "lastStatusCode");

  if (v10 != 3000)
  {
    v15 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      v19 = objc_msgSend(v18, "lastStatusCode");
      v20 = CFSTR("ADStatusCodeUnknown");
      switch((int)v19)
      {
        case 0:
          break;
        case 1:
          v20 = CFSTR("ADStatusCodeServerFailure");
          break;
        case 2:
          v20 = CFSTR("ADStatusCodeLoadingThrottled");
          break;
        case 3:
          v20 = CFSTR("ADStatusCodeInventoryUnavailable");
          break;
        case 4:
          v20 = CFSTR("ADStatusCodeConfigurationError");
          break;
        case 5:
          v20 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
          break;
        case 6:
          v20 = CFSTR("ADStatusCodeApplicationInactive");
          break;
        case 7:
          v20 = CFSTR("ADStatusCodeAdUnloaded");
          break;
        case 8:
          v20 = CFSTR("ADStatusCodeAssetLoadFailure");
          break;
        case 9:
          v20 = CFSTR("ADStatusCodeAdResponseValidateFailure");
          break;
        case 10:
          v20 = CFSTR("ADStatusCodeAdAssetLoadPending");
          break;
        case 11:
          v20 = CFSTR("ADStatusCodeWaitingForResponse");
          break;
        case 12:
          v20 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
          break;
        case 13:
          v20 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
          break;
        case 14:
          v20 = CFSTR("ADStatusCodeBatchLimitExceeded");
          break;
        case 15:
          v20 = CFSTR("ADStatusCodeAdsDisabledInIssue");
          break;
        default:
          switch((int)v19)
          {
            case 3000:
              v20 = CFSTR("ADStatusCodeNoError");
              break;
            case 3001:
              v20 = CFSTR("ADStatusCodeAdNotAvailable");
              break;
            case 3002:
              v20 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
              break;
            case 3003:
              v20 = CFSTR("ADStatusCodePlacedInFirstScreenful");
              break;
            case 3004:
              v20 = CFSTR("ADStatusCodeAdLoadedTooLate");
              break;
            case 3005:
              v20 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
              break;
            case 3006:
              v20 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
              break;
            case 3007:
              v20 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
              break;
            case 3008:
              v20 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
              break;
            case 3009:
              v20 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
              break;
            case 3010:
              v20 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
              break;
            case 3011:
              v20 = CFSTR("ADStatusCodeAdMetadataError");
              break;
            case 3012:
              v20 = CFSTR("ADStatusCodeAdArticleLoadError");
              break;
            case 3013:
              v20 = CFSTR("ADStatusCodeAdVideoLoadError");
              break;
            default:
              if ((_DWORD)v19 == 360)
                v20 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
              else
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v19));
              break;
          }
          break;
      }
      *(_DWORD *)buf = 138543618;
      v42 = v17;
      v43 = 2112;
      v44 = v20;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send 50 percent viewable impression - current ASE code is %@.", buf, 0x16u);

    }
    goto LABEL_53;
  }
  if (!v3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v21, "accumulated50PercentVisibilityTime");
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    objc_msgSend(v24, "impressionThreshold");
    v26 = v25;

    v27 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v27);
    v28 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v23 < v26)
    {
      if (!v28)
        goto LABEL_53;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v29, "accumulatedVisibilityTime");
      v31 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      objc_msgSend(v32, "impressionThreshold");
      *(_DWORD *)buf = 138543874;
      v42 = v8;
      v43 = 2048;
      v44 = v31;
      v45 = 2048;
      v46 = v33;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can NOT send 50 percent viewable impression - at visible threshold for only %.2f of %.2f seconds", buf, 0x20u);

      goto LABEL_4;
    }
    if (!v28)
    {
      v12 = 1;
      goto LABEL_54;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    objc_msgSend(v35, "impressionThreshold");
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v38, "accumulated50PercentVisibilityTime");
    *(_DWORD *)buf = 138543874;
    v42 = v34;
    v43 = 2048;
    v44 = v37;
    v45 = 2048;
    v46 = v39;
    v12 = 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send 50 percent viewable impression - at visible threshold more than %.2f seconds (%.2f)", buf, 0x20u);

    goto LABEL_20;
  }
  v11 = APLogForCategory(21);
  v6 = objc_claimAutoreleasedReturnValue(v11);
  v12 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    *(_DWORD *)buf = 138543362;
    v42 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Content with ID %{public}@ can send 50 percent viewable impression due to interaction", buf, 0xCu);

LABEL_20:
  }
LABEL_54:

  return v12;
}

- (void)confirmImpression
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setHasConfirmedImpression:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  objc_msgSend(v4, "setConsumedImpressions:", objc_msgSend(v4, "consumedImpressions") + 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "save");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  objc_msgSend(v6, "save");

}

- (void)confirm50PercentImpression
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setHasConfirmed50PercentImpression:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  objc_msgSend(v4, "setConsumed50PercentImpressions:", objc_msgSend(v4, "consumed50PercentImpressions") + 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "save");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  objc_msgSend(v6, "save");

}

- (void)discarded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setDiscarded:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)eventSent
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v6, "setLastSentEventTime:", v5);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v7, "save");

}

- (void)interfaceReady
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setInterfaceReady:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)carouselElementClicked:(id)a3 element:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  -[APContentDataInternal _clicked:](self, "_clicked:", a3.var0, a3.var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v6, "setClickedCarouselElement:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v7, "save");

}

- (void)carouselFinishedSent
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setCarouselFinishedSent:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)_clicked:(id)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v6, "setClickLocation:", var0, var1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v10, "setClickTime:", v9);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v11, "setClickCount:", objc_msgSend(v11, "clickCount") + 1);

}

- (void)clicked:(id)a3
{
  id v4;

  -[APContentDataInternal _clicked:](self, "_clicked:", a3.var0, a3.var1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)confirmClick
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setHasConfirmedClick:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (BOOL)hasConfirmedImpression
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v3 = objc_msgSend(v2, "hasConfirmedImpression");

  return v3;
}

- (BOOL)hasConfirmed50PercentImpression
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v3 = objc_msgSend(v2, "hasConfirmed50PercentImpression");

  return v3;
}

- (void)incrementVideoEventSequence
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setVideoEventSequence:", objc_msgSend(v3, "videoEventSequence") + 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)pendingConfirmedClick:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "setPendingConfirmedClick:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v6, "save");

}

- (BOOL)isFirstMessage:(int)a3
{
  BOOL v3;
  int v4;
  void *v5;
  void *v6;

  v3 = 1;
  if (a3 <= 0xD)
  {
    if (((1 << a3) & 0x361E) != 0)
      return v3;
    if (a3 == 8)
    {
LABEL_8:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sentStatusCodes"));
      v3 = objc_msgSend(v6, "count") == 0;

      return v3;
    }
  }
  if ((a3 - 3000) > 0xC)
    return a3 == 360;
  v4 = 1 << (a3 + 72);
  if ((v4 & 0x1782) == 0)
  {
    if ((v4 & 0x11) != 0)
      goto LABEL_8;
    return a3 == 360;
  }
  return v3;
}

+ (BOOL)isFinalMessage:(int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if (a3 > 0xF)
  {
LABEL_2:
    if ((a3 - 3000) > 0xD)
      return a3 == 360;
    v4 = 1 << (a3 + 72);
    if ((v4 & 0x37A0) != 0)
      return result;
    if ((v4 & 0x13) == 0)
      return a3 == 360;
    return 0;
  }
  if (((1 << a3) & 0xF31E) == 0)
  {
    if (a3 == 10)
      return 0;
    goto LABEL_2;
  }
  return result;
}

- (BOOL)isPlaceholder
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v4 = +[APContentDataInternal isPlaceholderIdentifier:](APContentDataInternal, "isPlaceholderIdentifier:", v3);

  return v4;
}

- (void)loadFailed
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setLastStatusCode:", 8);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (BOOL)hasSentStatusEvent:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sentStatusCodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (void)interfaceReplaced
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setInterfaceReplaced:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)wasFullyVisible
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setWasFullyVisible:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (BOOL)_hasSentFinalEvent
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sentStatusCodes"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (+[APContentDataInternal isFinalMessage:](APContentDataInternal, "isFinalMessage:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "intValue")))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)shouldSendAdSpaceStatusEvent:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  const char *v15;
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  unsigned int v46;
  const __CFString *v47;
  uint64_t v49;
  void *v50;
  __CFString *v51;
  int v52;
  uint64_t v53;
  const char *v54;
  unsigned int v55;
  const __CFString *v56;
  const __CFString *v57;
  void *v58;
  uint8_t buf[4];
  __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  double v64;
  __int16 v65;
  int v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  const __CFString *v72;

  v3 = *(_QWORD *)&a3;
  if (a3 <= 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v10 = objc_msgSend(v9, "serverUnfilledReason");

    v11 = APLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v6 = v12;
    if (v10 != (id)1020)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v60) = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Attempting to send invalid ASE %d", buf, 8u);
      }

      v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to send invalid ASE %d"), v3));
      APSimulateCrash(5, v6, 0);
      goto LABEL_158;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_158;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    *(_DWORD *)buf = 138412290;
    v60 = v14;
    v15 = "Not sending ASE due to status condition discard for content %@";
    goto LABEL_10;
  }
  if (-[APContentDataInternal _hasSentFinalEvent](self, "_hasSentFinalEvent"))
  {
    v5 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v3 - 1;
      v8 = CFSTR("ADStatusCodeServerFailure");
      switch(v7)
      {
        case 0:
          break;
        case 1:
          v8 = CFSTR("ADStatusCodeLoadingThrottled");
          break;
        case 2:
          v8 = CFSTR("ADStatusCodeInventoryUnavailable");
          break;
        case 3:
          v8 = CFSTR("ADStatusCodeConfigurationError");
          break;
        case 4:
          v8 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
          break;
        case 5:
          v8 = CFSTR("ADStatusCodeApplicationInactive");
          break;
        case 6:
          v8 = CFSTR("ADStatusCodeAdUnloaded");
          break;
        case 7:
          v8 = CFSTR("ADStatusCodeAssetLoadFailure");
          break;
        case 8:
          v8 = CFSTR("ADStatusCodeAdResponseValidateFailure");
          break;
        case 9:
          v8 = CFSTR("ADStatusCodeAdAssetLoadPending");
          break;
        case 10:
          v8 = CFSTR("ADStatusCodeWaitingForResponse");
          break;
        case 11:
          v8 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
          break;
        case 12:
          v8 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
          break;
        case 13:
          v8 = CFSTR("ADStatusCodeBatchLimitExceeded");
          break;
        case 14:
          v8 = CFSTR("ADStatusCodeAdsDisabledInIssue");
          break;
        default:
          switch(CFSTR("ADStatusCodeServerFailure"))
          {
            case 0xBB8u:
              v8 = CFSTR("ADStatusCodeNoError");
              break;
            case 0xBB9u:
              v8 = CFSTR("ADStatusCodeAdNotAvailable");
              break;
            case 0xBBAu:
              v8 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
              break;
            case 0xBBBu:
              v8 = CFSTR("ADStatusCodePlacedInFirstScreenful");
              break;
            case 0xBBCu:
              v8 = CFSTR("ADStatusCodeAdLoadedTooLate");
              break;
            case 0xBBDu:
              v8 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
              break;
            case 0xBBEu:
              v8 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
              break;
            case 0xBBFu:
              v8 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
              break;
            case 0xBC0u:
              v8 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
              break;
            case 0xBC1u:
              v8 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
              break;
            case 0xBC2u:
              v8 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
              break;
            case 0xBC3u:
              v8 = CFSTR("ADStatusCodeAdMetadataError");
              break;
            case 0xBC4u:
              v8 = CFSTR("ADStatusCodeAdArticleLoadError");
              break;
            case 0xBC5u:
              v8 = CFSTR("ADStatusCodeAdVideoLoadError");
              break;
            default:
              if (CFSTR("ADStatusCodeServerFailure") == 360)
                v8 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
              else
                v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), CFSTR("ADStatusCodeServerFailure")));
              break;
          }
          break;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
      *(_DWORD *)buf = 138543618;
      v60 = v8;
      v61 = 2114;
      v62 = v51;
      v54 = "shouldSendAdSpaceStatusEvent: NOT sending ASE %{public}@ for content %{public}@ - a final ASE was previously sent.";
LABEL_157:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v54, buf, 0x16u);

      goto LABEL_158;
    }
    goto LABEL_158;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v17 = objc_msgSend(v16, "discarded");

  if (!(_DWORD)v17)
  {
    v20 = -[APContentDataInternal hasSentStatusEvent:](self, "hasSentStatusEvent:", v3);
    if ((v20 & 1) != 0
      || (v17 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent")),
          objc_msgSend(v17, "lastStatusCode") == (_DWORD)v3))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      v22 = objc_msgSend(v21, "hasBeenOnScreen");

      if ((v20 & 1) != 0)
      {
        if ((v22 & 1) == 0)
        {
LABEL_29:
          if (-[APContentDataInternal isPlaceholder](self, "isPlaceholder"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
            v23 = objc_msgSend(v24, "interfaceReplaced") ^ 1;

          }
          else
          {
            v23 = 1;
          }
          if ((_DWORD)v3 == 8 && v23)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
            v26 = objc_msgSend(v25, "hasBeenOnScreen");

            if ((v26 & 1) != 0)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              objc_msgSend(v27, "timeIntervalSince1970");
              v29 = v28;
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
              objc_msgSend(v30, "lastSentEventTime");
              v32 = v29 - v31;

              v33 = APLogForCategory(21);
              v34 = objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
                v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifier"));
                v37 = CFSTR(" NOT");
                *(_DWORD *)buf = 138543874;
                v60 = v36;
                if (v32 <= 180.0)
                  v37 = &stru_100219118;
                v61 = 2114;
                v62 = v37;
                v63 = 2048;
                v64 = v32;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "shouldSendAdSpaceStatusEvent: AssetLoadFailure will%{public}@ be sent because content %{public}@ last event was %.0f seconds ago.", buf, 0x20u);

              }
              if (v32 > 180.0)
                return 0;
              v23 = 1;
              goto LABEL_41;
            }
            v53 = APLogForCategory(21);
            v6 = objc_claimAutoreleasedReturnValue(v53);
            if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
              goto LABEL_158;
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
            *(_DWORD *)buf = 138543362;
            v60 = v14;
            v15 = "shouldSendAdSpaceStatusEvent: NOT sending AssetLoadFailure for content %{public}@ because the WebView "
                  "never appeared on screen.";
LABEL_10:
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v15, buf, 0xCu);

            goto LABEL_158;
          }
LABEL_41:
          v38 = APLogForCategory(21);
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "identifier"));
            if (v23)
              v41 = CFSTR("YES");
            else
              v41 = CFSTR("NO");
            if (v20)
              v42 = CFSTR("YES");
            else
              v42 = CFSTR("NO");
            v56 = v41;
            v57 = v42;
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
            v55 = objc_msgSend(v43, "lastStatusCode");
            if (-[APContentDataInternal isPlaceholder](self, "isPlaceholder"))
              v44 = CFSTR("YES");
            else
              v44 = CFSTR("NO");
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
            v46 = objc_msgSend(v45, "interfaceReplaced");
            *(_DWORD *)buf = 138544898;
            if (v46)
              v47 = CFSTR("YES");
            else
              v47 = CFSTR("NO");
            v60 = v40;
            v61 = 2112;
            v62 = v56;
            v63 = 2114;
            v64 = *(double *)&v57;
            v65 = 1024;
            v66 = v3;
            v67 = 1024;
            v68 = v55;
            v69 = 2114;
            v70 = v44;
            v71 = 2114;
            v72 = v47;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "shouldSendAdSpaceStatusEvent for %{public}@: %@ statusCodeSent: %{public}@ codeToSend: %d lastStatusCode: %d isPlaceholder: %{public}@ interfaceReplaced: %{public}@", buf, 0x40u);

          }
          if ((v23 & 1) != 0)
            return 1;
          v49 = APLogForCategory(21);
          v6 = objc_claimAutoreleasedReturnValue(v49);
          if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
            goto LABEL_158;
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
          v52 = v3 - 1;
          v8 = CFSTR("ADStatusCodeServerFailure");
          switch(v52)
          {
            case 0:
              break;
            case 1:
              v8 = CFSTR("ADStatusCodeLoadingThrottled");
              break;
            case 2:
              v8 = CFSTR("ADStatusCodeInventoryUnavailable");
              break;
            case 3:
              v8 = CFSTR("ADStatusCodeConfigurationError");
              break;
            case 4:
              v8 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
              break;
            case 5:
              v8 = CFSTR("ADStatusCodeApplicationInactive");
              break;
            case 6:
              v8 = CFSTR("ADStatusCodeAdUnloaded");
              break;
            case 7:
              v8 = CFSTR("ADStatusCodeAssetLoadFailure");
              break;
            case 8:
              v8 = CFSTR("ADStatusCodeAdResponseValidateFailure");
              break;
            case 9:
              v8 = CFSTR("ADStatusCodeAdAssetLoadPending");
              break;
            case 10:
              v8 = CFSTR("ADStatusCodeWaitingForResponse");
              break;
            case 11:
              v8 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
              break;
            case 12:
              v8 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
              break;
            case 13:
              v8 = CFSTR("ADStatusCodeBatchLimitExceeded");
              break;
            case 14:
              v8 = CFSTR("ADStatusCodeAdsDisabledInIssue");
              break;
            default:
              switch(CFSTR("ADStatusCodeServerFailure"))
              {
                case 0xBB8u:
                  v8 = CFSTR("ADStatusCodeNoError");
                  break;
                case 0xBB9u:
                  v8 = CFSTR("ADStatusCodeAdNotAvailable");
                  break;
                case 0xBBAu:
                  v8 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
                  break;
                case 0xBBBu:
                  v8 = CFSTR("ADStatusCodePlacedInFirstScreenful");
                  break;
                case 0xBBCu:
                  v8 = CFSTR("ADStatusCodeAdLoadedTooLate");
                  break;
                case 0xBBDu:
                  v8 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
                  break;
                case 0xBBEu:
                  v8 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
                  break;
                case 0xBBFu:
                  v8 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
                  break;
                case 0xBC0u:
                  v8 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
                  break;
                case 0xBC1u:
                  v8 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
                  break;
                case 0xBC2u:
                  v8 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
                  break;
                case 0xBC3u:
                  v8 = CFSTR("ADStatusCodeAdMetadataError");
                  break;
                case 0xBC4u:
                  v8 = CFSTR("ADStatusCodeAdArticleLoadError");
                  break;
                case 0xBC5u:
                  v8 = CFSTR("ADStatusCodeAdVideoLoadError");
                  break;
                default:
                  if (CFSTR("ADStatusCodeServerFailure") == 360)
                    v8 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
                  else
                    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), CFSTR("ADStatusCodeServerFailure")));
                  break;
              }
              break;
          }
          *(_DWORD *)buf = 138543618;
          v60 = v51;
          v61 = 2114;
          v62 = v8;
          v54 = "%{public}@ has already reported AdSpaceStatusEvent %{public}@. Ignoring.";
          goto LABEL_157;
        }
      }
      else
      {

        if ((v22 & 1) == 0)
          goto LABEL_29;
      }
      v23 = 0;
      goto LABEL_41;
    }

    goto LABEL_29;
  }
  v18 = APLogForCategory(21);
  v6 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v19 = v3 - 1;
    v8 = CFSTR("ADStatusCodeServerFailure");
    switch(v19)
    {
      case 0:
        break;
      case 1:
        v8 = CFSTR("ADStatusCodeLoadingThrottled");
        break;
      case 2:
        v8 = CFSTR("ADStatusCodeInventoryUnavailable");
        break;
      case 3:
        v8 = CFSTR("ADStatusCodeConfigurationError");
        break;
      case 4:
        v8 = CFSTR("ADStatusCodeBannerVisibleWithoutContent");
        break;
      case 5:
        v8 = CFSTR("ADStatusCodeApplicationInactive");
        break;
      case 6:
        v8 = CFSTR("ADStatusCodeAdUnloaded");
        break;
      case 7:
        v8 = CFSTR("ADStatusCodeAssetLoadFailure");
        break;
      case 8:
        v8 = CFSTR("ADStatusCodeAdResponseValidateFailure");
        break;
      case 9:
        v8 = CFSTR("ADStatusCodeAdAssetLoadPending");
        break;
      case 10:
        v8 = CFSTR("ADStatusCodeWaitingForResponse");
        break;
      case 11:
        v8 = CFSTR("ADStatusCodeNoAdDueToGlobalExclusion");
        break;
      case 12:
        v8 = CFSTR("ADStatusCodeNoAdDueToPolicyExclusion");
        break;
      case 13:
        v8 = CFSTR("ADStatusCodeBatchLimitExceeded");
        break;
      case 14:
        v8 = CFSTR("ADStatusCodeAdsDisabledInIssue");
        break;
      default:
        switch(CFSTR("ADStatusCodeServerFailure"))
        {
          case 0xBB8u:
            v8 = CFSTR("ADStatusCodeNoError");
            break;
          case 0xBB9u:
            v8 = CFSTR("ADStatusCodeAdNotAvailable");
            break;
          case 0xBBAu:
            v8 = CFSTR("ADStatusCodeSpacedTooCloseToAnAd");
            break;
          case 0xBBBu:
            v8 = CFSTR("ADStatusCodePlacedInFirstScreenful");
            break;
          case 0xBBCu:
            v8 = CFSTR("ADStatusCodeAdLoadedTooLate");
            break;
          case 0xBBDu:
            v8 = CFSTR("ADStatusCodeAdUnloadedExceedingContainer");
            break;
          case 0xBBEu:
            v8 = CFSTR("ADStatusCodeAdUnloadedMedusaResizing");
            break;
          case 0xBBFu:
            v8 = CFSTR("ADStatusCodeAdGlobalCategoryBlacklisted");
            break;
          case 0xBC0u:
            v8 = CFSTR("ADStatusCodeAdGlobalKeywordBlacklisted");
            break;
          case 0xBC1u:
            v8 = CFSTR("ADStatusCodeAdCampaignCategoryBlacklisted");
            break;
          case 0xBC2u:
            v8 = CFSTR("ADStatusCodeAdCampaignKeywordBlacklisted");
            break;
          case 0xBC3u:
            v8 = CFSTR("ADStatusCodeAdMetadataError");
            break;
          case 0xBC4u:
            v8 = CFSTR("ADStatusCodeAdArticleLoadError");
            break;
          case 0xBC5u:
            v8 = CFSTR("ADStatusCodeAdVideoLoadError");
            break;
          default:
            if (CFSTR("ADStatusCodeServerFailure") == 360)
              v8 = CFSTR("ADStatusCodeNoAdDueToSubscriptionStatus");
            else
              v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), CFSTR("ADStatusCodeServerFailure")));
            break;
        }
        break;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](self, "content"));
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
    *(_DWORD *)buf = 138543618;
    v60 = v8;
    v61 = 2114;
    v62 = v51;
    v54 = "shouldSendAdSpaceStatusEvent: NOT sending ASE %{public}@ for content %{public}@ - it has been discarded.";
    goto LABEL_157;
  }
LABEL_158:

  return 0;
}

- (void)statusEventSent:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sentStatusCodes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  objc_msgSend(v6, "addObject:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v8, "save");

}

- (void)videoLoaded:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  id v7;

  v4 = fmax(a3, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "setDuration:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v6, "setPlaybackInProgress:", 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v7, "save");

}

- (void)_updateLastPlaybackTimestamp
{
  double v3;
  double v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "setLastPlaybackTimestamp:", v4);

}

- (void)_accumulatePlaybackTimeIfNoDuration
{
  void *v3;
  unsigned int v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  if ((objc_msgSend(v12, "hasDuration") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    v4 = objc_msgSend(v3, "playbackInProgress");

    if (!v4)
      return;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v8, "lastPlaybackTimestamp");
    v10 = v7 - v9;
    objc_msgSend(v12, "accumulatedPlaybackTime");
    objc_msgSend(v12, "setAccumulatedPlaybackTime:", v11 + v10);

  }
}

- (void)videoStateChanged:(double)a3 fromMetric:(int64_t)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v9;
  double v10;
  double v11;
  void *v12;
  unsigned int v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  _BOOL8 v27;
  void *v28;
  int v29;
  double v30;

  if (a3 >= 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v9, "lastPosition");
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    v13 = objc_msgSend(v12, "hasDuration");

    if (v13)
    {
      v14 = a3 - v11;
      if (a3 - v11 > 0.0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
        objc_msgSend(v16, "duration");
        v18 = v17;
        objc_msgSend(v15, "accumulatedPlaybackTime");
        objc_msgSend(v15, "setAccumulatedPlaybackTime:", v19 + v14 * v18);

      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    objc_msgSend(v20, "setLastPosition:", a3);

    switch(a4)
    {
      case 1600:
      case 1602:
        -[APContentDataInternal _updateLastPlaybackTimestamp](self, "_updateLastPlaybackTimestamp");
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
        v22 = objc_msgSend(v21, "playbackInProgress");

        if ((v22 & 1) == 0)
        {
          v25 = objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
          v24 = v25;
          v26 = 1;
          goto LABEL_17;
        }
        v23 = APLogForCategory(21);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v29) = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "MediaPlayed metric received but media is already thought to be in playback", (uint8_t *)&v29, 2u);
        }
        goto LABEL_18;
      case 1603:
      case 1604:
        -[APContentDataInternal _accumulatePlaybackTimeIfNoDuration](self, "_accumulatePlaybackTimeIfNoDuration");
        v25 = objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
        v24 = v25;
        v26 = 0;
LABEL_17:
        -[NSObject setPlaybackInProgress:](v25, "setPlaybackInProgress:", v26);
LABEL_18:

        break;
      case 1609:
        -[APContentDataInternal _accumulatePlaybackTimeIfNoDuration](self, "_accumulatePlaybackTimeIfNoDuration");
        -[APContentDataInternal _updateLastPlaybackTimestamp](self, "_updateLastPlaybackTimestamp");
        v27 = a3 < 1.0 && a3 >= 0.0;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
        objc_msgSend(v28, "setPlaybackInProgress:", v27);

        break;
      default:
        break;
    }
    v6 = objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
    -[NSObject save](v6, "save");
  }
  else
  {
    v5 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v29 = 134217984;
      v30 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "updateAccumulatedPlaybackTime: position cannot be negative (%.2f)", (uint8_t *)&v29, 0xCu);
    }
  }

}

- (void)videoUnloaded
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v3, "setVideoUnloadedSent:", 1);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v4, "save");

}

- (void)_visibleStateChanged:(int64_t)a3 duration:(double)a4
{
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
  v8 = objc_msgSend(v7, "isOutstreamVideo");

  if (a3 >= 50 && v8)
  {
    -[APContentDataInternal accumulateVisibilityTime:](self, "accumulateVisibilityTime:", a4);
  }
  else if (a3 < 100)
  {
    if (a3 < 50)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v12, "setAccumulatedVisibilityTime:", 0.0);

      v13 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v13, "setAccumulated50PercentVisibilityTime:", 0.0);

    }
    else
    {
      -[APContentDataInternal accumulate50PercentVisibilityTime:](self, "accumulate50PercentVisibilityTime:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
      objc_msgSend(v9, "setAccumulatedVisibilityTime:", 0.0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal privateContent](self, "privateContent"));
      v11 = objc_msgSend(v10, "isSponsorshipAd");

      if (v11)
        -[APContentDataInternal addTimeSpent:](self, "addTimeSpent:", a4);
    }
  }
  else
  {
    -[APContentDataInternal accumulateVisibilityTime:](self, "accumulateVisibilityTime:", a4);
    -[APContentDataInternal accumulate50PercentVisibilityTime:](self, "accumulate50PercentVisibilityTime:", a4);
  }
}

- (void)visibleStateChanged:(int64_t)a3 duration:(double)a4
{
  id v5;

  -[APContentDataInternal _visibleStateChanged:duration:](self, "_visibleStateChanged:duration:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "save");

}

- (void)carouselVisibleStateChanged:(int64_t)a3 duration:(double)a4 elements:(id)a5 partialElements:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  -[APContentDataInternal _visibleStateChanged:duration:](self, "_visibleStateChanged:duration:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v12, "setCarouselElementsVisible:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v13, "setCarouselElementsPartiallyVisible:", v10);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v14, "save");

}

- (void)volumeChanged:(double)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "setVolume:", a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v6, "save");

}

- (void)addTimeSpent:(double)a3
{
  void *v5;
  double v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v5, "timeSpent");
  objc_msgSend(v5, "setTimeSpent:", v6 + a3);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[APContentDataInternal transientContent](self, "transientContent"));
  objc_msgSend(v7, "save");

}

- (APContentDataProviderProtocol)contentDataProvider
{
  return self->_contentDataProvider;
}

@end
