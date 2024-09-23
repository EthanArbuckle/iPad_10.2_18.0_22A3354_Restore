@implementation PXAnalyticsMemoriesUsageDestination

- (PXAnalyticsMemoriesUsageDestination)init
{
  PXAnalyticsMemoriesUsageDestination *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAnalyticsMemoriesUsageDestination;
  result = -[PXAnalyticsMemoriesUsageDestination init](&v3, sel_init);
  if (result)
    result->_defaultNavigationKind = 1;
  return result;
}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD);
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.URLNavigationDidStart")))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("URLNavigationKind"));
    v6 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    self->_currentURLNavigationKind = objc_msgSend(v6, "integerValue");
  }
  else
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.URLNavigationDidFinish")))
    {
      self->_currentURLNavigationKind = 0;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D096A8]))
    {
      self->_defaultNavigationKind = 2;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D096B0]))
    {
      self->_sessionInitialNavigationKind = 0;
      goto LABEL_10;
    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__PXAnalyticsMemoriesUsageDestination_processEvent___block_invoke;
    v16[3] = &unk_1E51413D0;
    v16[4] = self;
    v6 = (uint64_t (**)(_QWORD))_Block_copy(v16);
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.mediaAppeared")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionMoviePlayed")) & 1) == 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D09740]))
      {
        objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D09860]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqual:", CFSTR("PXTabIdentifierForYou"));

        if (v8)
        {
          v9 = v6[2](v6);
          PXAnalyticsNavigationKindDescription(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0D09910];
          objc_msgSend((id)objc_opt_class(), "forYouTabOpenedEventName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "payloadSessionStartTypeKey");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v13;
          v18[0] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sendEvent:withPayload:", v12, v14);

          objc_msgSend((id)objc_opt_class(), "forYouTabOpenedAppEventNameWithNavigationKind:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v15, MEMORY[0x1E0C9AA70]);

        }
      }
    }
  }

LABEL_10:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppearedAssetCollection, 0);
}

uint64_t __52__PXAnalyticsMemoriesUsageDestination_processEvent___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v1 + 16);
  if (!result)
    return *(_QWORD *)(v1 + 8);
  return result;
}

+ (NSString)forYouTabOpenedEventName
{
  return (NSString *)CFSTR("com.apple.photos.CPAnalytics.forYouTabOpened");
}

+ (id)forYouTabOpenedAppEventNameWithNavigationKind:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  PXAnalyticsNavigationKindDescription(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.forYouTabOpenedFrom%@"), v5);

  return v6;
}

+ (NSString)payloadLaunchTypeKey
{
  return (NSString *)CFSTR("launchType");
}

+ (NSString)payloadSessionStartTypeKey
{
  return (NSString *)CFSTR("sessionStartType");
}

@end
