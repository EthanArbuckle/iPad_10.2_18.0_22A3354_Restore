@implementation RESharedLocationRelevanceProviderManager

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (CLLocation)currentLocation
{
  return self->_lastLocationUpdate;
}

- (void)_queue_loadLocation:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_lastLocationUpdate, a3);
  v5 = a3;
  +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v6);
}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[RERelevanceProviderManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relevanceEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObserver:", self);
  objc_msgSend(v6, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RESharedLocationRelevanceProviderManager _queue_loadLocation:](self, "_queue_loadLocation:", v5);

}

- (void)pause
{
  void *v3;
  void *v4;
  id v5;

  -[RERelevanceProviderManager environment](self, "environment");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)locationManagerDidUpdateLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RERelevanceProviderManager _manager_queue](self, "_manager_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__RESharedLocationRelevanceProviderManager_locationManagerDidUpdateLocation___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __77__RESharedLocationRelevanceProviderManager_locationManagerDidUpdateLocation___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentLocation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_loadLocation:", v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationUpdate, 0);
}

@end
