@implementation WFAirQualityProviderAttribution

+ (WFAirQualityProviderAttribution)defaultProviderAttribution
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  WFAirQualityProviderAttribution *v6;
  _QWORD v8[4];
  __CFString *v9;
  id v10;

  +[WFAttribution sharedAttribution](WFAttribution, "sharedAttribution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceAttributionImageForStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__WFAirQualityProviderAttribution_defaultProviderAttribution__block_invoke;
  v8[3] = &unk_24CCA17B0;
  v9 = CFSTR("The Weather Channel");
  v10 = v3;
  v4 = defaultProviderAttribution_onceToken;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&defaultProviderAttribution_onceToken, v8);
  v6 = (WFAirQualityProviderAttribution *)(id)defaultProviderAttribution_attribution;

  return v6;
}

void __61__WFAirQualityProviderAttribution_defaultProviderAttribution__block_invoke(uint64_t a1)
{
  WFAirQualityProviderAttribution *v1;
  void *v2;

  v1 = -[WFAirQualityProviderAttribution initWithName:logoImage:dataOrigination:station:]([WFAirQualityProviderAttribution alloc], "initWithName:logoImage:dataOrigination:station:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
  v2 = (void *)defaultProviderAttribution_attribution;
  defaultProviderAttribution_attribution = (uint64_t)v1;

}

- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoImage:(id)a4 dataOrigination:(int64_t)a5 station:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFAirQualityProviderAttribution *v14;
  WFAirQualityProviderAttribution *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFAirQualityProviderAttribution;
  v14 = -[WFAirQualityProviderAttribution init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_cachedLogoImage, a4);
    v15->_dataOrigination = a5;
    objc_storeStrong((id *)&v15->_station, a6);
    -[WFAirQualityProviderAttribution _initInternal](v15, "_initInternal");
  }

  return v15;
}

- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoURL:(id)a4 dataOrigination:(int64_t)a5
{
  return -[WFAirQualityProviderAttribution initWithName:logoURL:dataOrigination:station:](self, "initWithName:logoURL:dataOrigination:station:", a3, a4, a5, 0);
}

- (WFAirQualityProviderAttribution)initWithName:(id)a3 logoURL:(id)a4 dataOrigination:(int64_t)a5 station:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFAirQualityProviderAttribution *v14;
  WFAirQualityProviderAttribution *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WFAirQualityProviderAttribution;
  v14 = -[WFAirQualityProviderAttribution init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_logoURL, a4);
    v15->_dataOrigination = a5;
    objc_storeStrong((id *)&v15->_station, a6);
    -[WFAirQualityProviderAttribution _initInternal](v15, "_initInternal");
  }

  return v15;
}

- (void)_initInternal
{
  NSMutableArray *v3;
  NSMutableArray *outstandingRequestsCompletionBlocks;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *logoImageLoadingQueue;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  outstandingRequestsCompletionBlocks = self->_outstandingRequestsCompletionBlocks;
  self->_outstandingRequestsCompletionBlocks = v3;

  self->_logoRequestInFlight = 0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.weatherfoundation.airquality.attribution.logo.image.loading", v5);
  logoImageLoadingQueue = self->_logoImageLoadingQueue;
  self->_logoImageLoadingQueue = v6;

  self->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
}

- (void)loadLogoImageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFAirQualityProviderAttribution logoImageLoadingQueue](self, "logoImageLoadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__WFAirQualityProviderAttribution_loadLogoImageWithCompletion___block_invoke;
  v7[3] = &unk_24CCA24B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __63__WFAirQualityProviderAttribution_loadLogoImageWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "cachedLogoImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "cachedLogoImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "p_loadRemoteLogoImageForProvider:completion:");
  }

}

- (void)p_loadRemoteLogoImageForProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[WFAirQualityProviderAttribution logoImageLoadingQueue](self, "logoImageLoadingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[WFAirQualityProviderAttribution logoURL](self, "logoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (-[WFAirQualityProviderAttribution p_checkRequestInFlight](self, "p_checkRequestInFlight"))
    {
      -[WFAirQualityProviderAttribution p_queueCompletionBlock:](self, "p_queueCompletionBlock:", v7);
    }
    else
    {
      -[WFAirQualityProviderAttribution p_setRequestInFlight](self, "p_setRequestInFlight");
      -[WFAirQualityProviderAttribution p_queueCompletionBlock:](self, "p_queueCompletionBlock:", v7);
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BDD1850], "sharedSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAirQualityProviderAttribution logoURL](self, "logoURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke;
      v14[3] = &unk_24CCA24E0;
      objc_copyWeak(&v15, &location);
      v14[4] = self;
      objc_msgSend(v11, "dataTaskWithURL:completionHandler:", v12, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "resume");
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.foundation.airQuality.provider.attribution.errorDomain"), 7001, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAirQualityProviderAttribution p_invokeAndClearCompletionBlocksWithImage:error:](self, "p_invokeAndClearCompletionBlocksWithImage:error:", 0, v10);

  }
}

void __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke_2;
  v11[3] = &unk_24CCA2278;
  v12 = v6;
  v13 = v7;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = WeakRetained;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __79__WFAirQualityProviderAttribution_p_loadRemoteLogoImageForProvider_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "p_imageWithData:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setCachedLogoImage:", v2);
    v3 = *(void **)(a1 + 56);
    v4 = v2;
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.foundation.airQuality.provider.attribution.errorDomain"), 7000, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 56);
    v4 = 0;
    v5 = v2;
  }
  objc_msgSend(v3, "p_invokeAndClearCompletionBlocksWithImage:error:", v4, v5);

  return objc_msgSend(*(id *)(a1 + 56), "p_clearRequestInFlight");
}

- (id)p_imageWithData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getUIImageClass_softClass;
  v12 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getUIImageClass_block_invoke;
    v8[3] = &unk_24CCA17D8;
    v8[4] = &v9;
    __getUIImageClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "imageWithData:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)p_checkRequestInFlight
{
  WFAirQualityProviderAttribution *v2;
  os_unfair_lock_s *p_dataSynchronizationLock;

  v2 = self;
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[WFAirQualityProviderAttribution logoRequestInFlight](v2, "logoRequestInFlight");
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  return (char)v2;
}

- (void)p_setRequestInFlight
{
  os_unfair_lock_s *p_dataSynchronizationLock;

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  -[WFAirQualityProviderAttribution setLogoRequestInFlight:](self, "setLogoRequestInFlight:", 1);
  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (void)p_clearRequestInFlight
{
  os_unfair_lock_s *p_dataSynchronizationLock;

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  -[WFAirQualityProviderAttribution setLogoRequestInFlight:](self, "setLogoRequestInFlight:", 0);
  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (void)p_queueCompletionBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v6;
  WFAirQualityProviderCompletionWrapper *v7;

  v4 = a3;
  v7 = objc_alloc_init(WFAirQualityProviderCompletionWrapper);
  -[WFAirQualityProviderCompletionWrapper setCompletion:](v7, "setCompletion:", v4);

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  -[WFAirQualityProviderAttribution outstandingRequestsCompletionBlocks](self, "outstandingRequestsCompletionBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  os_unfair_lock_unlock(p_dataSynchronizationLock);
}

- (void)p_invokeAndClearCompletionBlocksWithImage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  -[WFAirQualityProviderAttribution outstandingRequestsCompletionBlocks](self, "outstandingRequestsCompletionBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[WFAirQualityProviderAttribution outstandingRequestsCompletionBlocks](self, "outstandingRequestsCompletionBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16), "completion", (_QWORD)v18);
        v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, id))v17)[2](v17, v6, v7);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  WFAirQualityProviderAttribution *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(WFAirQualityProviderAttribution);
  -[WFAirQualityProviderAttribution name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityProviderAttribution setName:](v4, "setName:", v5);

  -[WFAirQualityProviderAttribution logoURL](self, "logoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityProviderAttribution setLogoURL:](v4, "setLogoURL:", v6);

  -[WFAirQualityProviderAttribution setDataOrigination:](v4, "setDataOrigination:", -[WFAirQualityProviderAttribution dataOrigination](self, "dataOrigination"));
  -[WFAirQualityProviderAttribution cachedLogoImage](self, "cachedLogoImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityProviderAttribution setCachedLogoImage:](v4, "setCachedLogoImage:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFAirQualityProviderAttribution name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("WFAirQualityProviderNameKey"));

  -[WFAirQualityProviderAttribution logoURL](self, "logoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("WFAirQualityProviderLogoURLKey"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[WFAirQualityProviderAttribution dataOrigination](self, "dataOrigination"), CFSTR("WFAirQualityProviderDataOriginationKey"));
}

- (WFAirQualityProviderAttribution)initWithCoder:(id)a3
{
  id v4;
  WFAirQualityProviderAttribution *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSURL *logoURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFAirQualityProviderAttribution;
  v5 = -[WFAirQualityProviderAttribution init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityProviderNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFAirQualityProviderLogoURLKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v8;

    v5->_dataOrigination = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFAirQualityProviderDataOriginationKey"));
    -[WFAirQualityProviderAttribution _initInternal](v5, "_initInternal");
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAirQualityProviderAttribution name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFAirQualityProviderAttribution dataOrigination](self, "dataOrigination");
  -[WFAirQualityProviderAttribution station](self, "station");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAirQualityProviderAttribution name: %@, dataOrigination: %ld, station: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)dataOrigination
{
  return self->_dataOrigination;
}

- (void)setDataOrigination:(int64_t)a3
{
  self->_dataOrigination = a3;
}

- (UIImage)cachedLogoImage
{
  return self->_cachedLogoImage;
}

- (void)setCachedLogoImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (WFAirQualityProviderStation)station
{
  return self->_station;
}

- (void)setStation:(id)a3
{
  objc_storeStrong((id *)&self->_station, a3);
}

- (OS_dispatch_queue)logoImageLoadingQueue
{
  return self->_logoImageLoadingQueue;
}

- (void)setLogoImageLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageLoadingQueue, a3);
}

- (NSMutableArray)outstandingRequestsCompletionBlocks
{
  return self->_outstandingRequestsCompletionBlocks;
}

- (void)setOutstandingRequestsCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequestsCompletionBlocks, a3);
}

- (BOOL)logoRequestInFlight
{
  return self->_logoRequestInFlight;
}

- (void)setLogoRequestInFlight:(BOOL)a3
{
  self->_logoRequestInFlight = a3;
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3
{
  self->_dataSynchronizationLock = a3;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_outstandingRequestsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_logoImageLoadingQueue, 0);
  objc_storeStrong((id *)&self->_station, 0);
  objc_storeStrong((id *)&self->_cachedLogoImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
