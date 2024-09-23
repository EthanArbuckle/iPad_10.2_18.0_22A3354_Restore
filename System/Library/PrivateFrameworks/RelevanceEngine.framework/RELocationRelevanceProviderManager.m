@implementation RELocationRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature locationFeature](REFeature, "locationFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_locationOfProvider:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "type"))
  {
    v5 = objc_msgSend(v4, "type");

    if (v5 >= 5)
      v6 = 0;
    else
      v6 = v5 - 1;
    -[RERelevanceProviderManager environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "relevanceEngine");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationForEngine:userLocation:", v4, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)_dependencyClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return -[RELocationRelevanceProviderManager _valueForProvider:context:feature:](self, "_valueForProvider:context:feature:", a3, 0, a4);
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  NSObject *v18;
  double v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a4, "attributeForKey:", CFSTR("RETrainingContextLocationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
    {
LABEL_6:
      objc_msgSend(v7, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = -[RELocationRelevanceProviderManager _queryRevokableStatusForProvider:](self, "_queryRevokableStatusForProvider:", v7);
        v11 = objc_msgSend(v7, "type");
        v12 = (v10 - 3) < 2;
        if (v11)
          v12 = v10 == 3;
        if (!v12)
        {
          RELogForDomain(5);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v7, "bundleIdentifier");
            v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v31 = 136315138;
            v32 = objc_msgSend(v23, "UTF8String");
            _os_log_impl(&dword_2132F7000, v22, OS_LOG_TYPE_INFO, "Bundle identifier (%s) lacks location permission. Skipping relevance.", (uint8_t *)&v31, 0xCu);

          }
          +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        }
      }
      -[RELocationRelevanceProviderManager _locationOfProvider:](self, "_locationOfProvider:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "distanceFromLocation:", v8);
        v16 = v15;
        RELogForDomain(5);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v31 = 134218242;
          v32 = *(_QWORD *)&v16;
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_2132F7000, v17, OS_LOG_TYPE_DEFAULT, "%f distance to %@", (uint8_t *)&v31, 0x16u);
        }

        if (v16 >= 0.0)
        {
          objc_msgSend(v7, "accuracy");
          if (v16 >= v24)
          {
            objc_msgSend(v7, "accuracy");
            v26 = v16 - v25;
            objc_msgSend(v7, "radius");
            v28 = v27;
            objc_msgSend(v7, "accuracy");
            v19 = 1.0 - REPercentThroughRange(v26, 0.0, v28 - v29);
          }
          else
          {
            v19 = 1.0;
          }
          goto LABEL_27;
        }
        RELogForDomain(5);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_2132F7000, v18, OS_LOG_TYPE_DEFAULT, "Distance is negative", (uint8_t *)&v31, 2u);
        }

      }
      v19 = 0.0;
LABEL_27:
      +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
      goto LABEL_29;
    }
  }
  else
  {

  }
  -[RESharedLocationRelevanceProviderManager currentLocation](self, "currentLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_6;
  RELogForDomain(5);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_2132F7000, v20, OS_LOG_TYPE_DEFAULT, "Device location is unknown", (uint8_t *)&v31, 2u);
  }

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v21;
}

- (int)_queryRevokableStatusForProvider:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REWatchKitExtensionForApplicationIdentifier(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  +[RESingleton sharedInstance](RELocationAuthorizationStatusCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _manager_queue](self, "_manager_queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__RELocationRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke;
  v15[3] = &unk_24CF8C2D0;
  objc_copyWeak(&v17, &location);
  v12 = v4;
  v16 = v12;
  v13 = objc_msgSend(v10, "cachedAuthorizationStatusForBundleIdentifier:invalidationUpdateQueue:withCallback:", v9, v11, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __71__RELocationRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:](RERelevanceProviderManagerUpdate, "immediateUpdateForProvider:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_scheduleUpdate:", v2);

}

- (void)resume
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RELocationRelevanceProviderManager;
  -[RESharedLocationRelevanceProviderManager resume](&v4, sel_resume);
  +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)pause
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RELocationRelevanceProviderManager;
  -[RESharedLocationRelevanceProviderManager pause](&v4, sel_pause);
  +[RESingleton sharedInstance](RELocationPredictor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)predictorDidUpdate:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__RELocationRelevanceProviderManager_predictorDidUpdate___block_invoke;
  v3[3] = &unk_24CF8ACE8;
  v3[4] = self;
  -[RERelevanceProviderManager _enumerateProviders:](self, "_enumerateProviders:", v3);
}

void __57__RELocationRelevanceProviderManager_predictorDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "type"))
  {
    v3 = *(void **)(a1 + 32);
    +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:](RERelevanceProviderManagerUpdate, "immediateUpdateForProvider:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scheduleUpdate:", v4);

  }
}

@end
