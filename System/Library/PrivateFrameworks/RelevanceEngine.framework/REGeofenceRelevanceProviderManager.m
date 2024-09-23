@implementation REGeofenceRelevanceProviderManager

+ (id)_features
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (id)_dependencyClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (int)_queryRevokableStatusForProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[RESingleton sharedInstance](RELocationAuthorizationStatusCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceProviderManager _manager_queue](self, "_manager_queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__REGeofenceRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke;
  v11[3] = &unk_24CF8C2D0;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v12 = v8;
  v9 = objc_msgSend(v5, "cachedAuthorizationStatusForBundleIdentifier:invalidationUpdateQueue:withCallback:", v6, v7, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __71__REGeofenceRelevanceProviderManager__queryRevokableStatusForProvider___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:](RERelevanceProviderManagerUpdate, "immediateUpdateForProvider:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_scheduleUpdate:", v2);

}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  return -[REGeofenceRelevanceProviderManager _valueForProvider:context:feature:](self, "_valueForProvider:context:feature:", a3, 0, a4);
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  int v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a4, "attributeForKey:", CFSTR("RETrainingContextLocationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    -[RESharedLocationRelevanceProviderManager currentLocation](self, "currentLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v8)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || -[REGeofenceRelevanceProviderManager _queryRevokableStatusForProvider:](self, "_queryRevokableStatusForProvider:", v7)- 3 < 2)
  {
    objc_msgSend(v7, "region");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "radius");
    v12 = v11;
    v13 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(v10, "center");
    v15 = v14;
    objc_msgSend(v10, "center");
    v16 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v15);
    objc_msgSend(v8, "distanceFromLocation:", v16);
    v18 = v17;
    if (v17 < v12 + v12)
    {
      if (objc_msgSend(v10, "notifyOnEntry"))
      {
        if (v18 > v12)
        {
LABEL_11:
          v19 = 0.300000012;
LABEL_22:
          +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }
LABEL_17:
        v19 = 1.0;
        goto LABEL_22;
      }
      if (objc_msgSend(v10, "notifyOnExit"))
      {
        if (v18 < v12)
          goto LABEL_11;
        goto LABEL_17;
      }
      RELogForDomain(5);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_2132F7000, v23, OS_LOG_TYPE_DEFAULT, "Invalid region in REGeofenceRelevanceProvider. Region must be either notifyOnExit or notifyOnEntry.", (uint8_t *)&v25, 2u);
      }

    }
    v19 = 0.0;
    goto LABEL_22;
  }
  RELogForDomain(5);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "bundleIdentifier");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = 136315138;
    v26 = objc_msgSend(v21, "UTF8String");
    _os_log_impl(&dword_2132F7000, v20, OS_LOG_TYPE_INFO, "Bundle identifier (%s) lacks geofence permission. Skipping relevance.", (uint8_t *)&v25, 0xCu);

  }
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v22;
}

@end
