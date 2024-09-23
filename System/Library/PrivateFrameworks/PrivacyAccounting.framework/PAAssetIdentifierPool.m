@implementation PAAssetIdentifierPool

- (PAAssetIdentifierPool)initWithMaxPoolSize:(unint64_t)a3 autoDrainInterval:(double)a4 bundleRecord:(id)a5 aggregateVisibilityStateMonitor:(id)a6 onQueue:(id)a7 delegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PAAssetIdentifierPool *v18;
  PABasicAssetIdentifierPool *v19;
  PABasicAssetIdentifierPool *assetIdentifierPool;
  void *v21;
  void *v22;
  uint64_t v23;
  PAProcessStateMonitoringEnding *stateMonitorHandle;
  PAAssetIdentifierPool *v25;
  objc_super v27;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PAAssetIdentifierPool;
  v18 = -[PAAssetIdentifierPool init](&v27, sel_init);
  if (v18)
  {
    v19 = -[PABasicAssetIdentifierPool initWithMaxPoolSize:autoDrainInterval:onQueue:delegate:]([PABasicAssetIdentifierPool alloc], "initWithMaxPoolSize:autoDrainInterval:onQueue:delegate:", a3, v16, v17, a4);
    assetIdentifierPool = v18->_assetIdentifierPool;
    v18->_assetIdentifierPool = v19;

    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EE80EFB0))
      v21 = v14;
    else
      v21 = 0;
    PAAssociatedBundleIdentifiersForApplication(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startMonitoringAggregateVisibilityStateForBundleIdentifiers:onQueue:withDelegate:", v22, v16, v18->_assetIdentifierPool);
    v23 = objc_claimAutoreleasedReturnValue();
    stateMonitorHandle = v18->_stateMonitorHandle;
    v18->_stateMonitorHandle = (PAProcessStateMonitoringEnding *)v23;

    v25 = v18;
  }

  return v18;
}

- (void)drainPool
{
  -[PABasicAssetIdentifierPool drainPool](self->_assetIdentifierPool, "drainPool");
}

- (void)addAssetIdentifiers:(id)a3
{
  -[PABasicAssetIdentifierPool addAssetIdentifiers:](self->_assetIdentifierPool, "addAssetIdentifiers:", a3);
}

- (void)addAssetIdentifiers:(id)a3 accessEventCount:(unint64_t)a4
{
  -[PABasicAssetIdentifierPool addAssetIdentifiers:accessEventCount:](self->_assetIdentifierPool, "addAssetIdentifiers:accessEventCount:", a3, a4);
}

- (void)invalidate
{
  -[PAProcessStateMonitoringEnding invalidate](self->_stateMonitorHandle, "invalidate");
  -[PABasicAssetIdentifierPool invalidate](self->_assetIdentifierPool, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitorHandle, 0);
  objc_storeStrong((id *)&self->_assetIdentifierPool, 0);
}

@end
