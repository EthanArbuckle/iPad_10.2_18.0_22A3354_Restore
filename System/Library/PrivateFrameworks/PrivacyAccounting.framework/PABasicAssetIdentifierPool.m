@implementation PABasicAssetIdentifierPool

- (PABasicAssetIdentifierPool)initWithMaxPoolSize:(unint64_t)a3 autoDrainInterval:(double)a4 onQueue:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  PABasicAssetIdentifierPool *v13;
  PABasicAssetIdentifierPool *v14;
  PABasicAssetIdentifierPool *v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PABasicAssetIdentifierPool;
  v13 = -[PABasicAssetIdentifierPool init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    v14->_maxPoolSize = a3;
    v14->_autoDrainInterval = a4;
    objc_storeStrong((id *)&v14->_queue, a5);
    v15 = v14;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[PABasicAssetIdentifierPool invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PABasicAssetIdentifierPool;
  -[PABasicAssetIdentifierPool dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *drainTimer;
  OS_dispatch_source *v4;
  NSMutableSet *assetIdentifiers;

  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_source_cancel(drainTimer);
    v4 = self->_drainTimer;
    self->_drainTimer = 0;

  }
  assetIdentifiers = self->_assetIdentifiers;
  self->_assetIdentifiers = 0;

}

- (void)addAssetIdentifiers:(id)a3
{
  -[PABasicAssetIdentifierPool addAssetIdentifiers:accessEventCount:](self, "addAssetIdentifiers:accessEventCount:", a3, 1);
}

- (void)addAssetIdentifiers:(id)a3 accessEventCount:(unint64_t)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableSet *assetIdentifiers;
  NSMutableSet *v13;
  NSMutableSet *v14;
  double autoDrainInterval;
  OS_dispatch_source *v16;
  OS_dispatch_source *drainTimer;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_eventCount += a4;
  if (objc_msgSend(v6, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
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
          self->_assetIdentifierPoolSize += objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11++), "length");
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v9);
    }

    assetIdentifiers = self->_assetIdentifiers;
    if (assetIdentifiers)
    {
      -[NSMutableSet unionSet:](assetIdentifiers, "unionSet:", v7);
    }
    else
    {
      v13 = (NSMutableSet *)objc_msgSend(v7, "mutableCopy");
      v14 = self->_assetIdentifiers;
      self->_assetIdentifiers = v13;

    }
    if (self->_assetIdentifierPoolSize <= self->_maxPoolSize)
    {
      if (!self->_drainTimer)
      {
        autoDrainInterval = self->_autoDrainInterval;
        if (fabs(autoDrainInterval) != INFINITY)
        {
          objc_initWeak(&location, self);
          v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
          drainTimer = self->_drainTimer;
          self->_drainTimer = v16;

          v18 = self->_drainTimer;
          v19 = dispatch_time(0, (unint64_t)(autoDrainInterval * 1000000000.0));
          dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(autoDrainInterval * 1000000000.0) >> 2);
          v20 = self->_drainTimer;
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __67__PABasicAssetIdentifierPool_addAssetIdentifiers_accessEventCount___block_invoke;
          v21[3] = &unk_1E4FA4C50;
          objc_copyWeak(&v22, &location);
          dispatch_source_set_event_handler(v20, v21);
          dispatch_activate((dispatch_object_t)self->_drainTimer);
          objc_destroyWeak(&v22);
          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      -[PABasicAssetIdentifierPool drainPool](self, "drainPool");
    }
  }

}

void __67__PABasicAssetIdentifierPool_addAssetIdentifiers_accessEventCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "drainPool");

}

- (void)drainPool
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  NSMutableSet *assetIdentifiers;
  NSObject *drainTimer;

  if (-[NSMutableSet count](self->_assetIdentifiers, "count") || self->_eventCount)
  {
    v3 = (void *)-[NSMutableSet copy](self->_assetIdentifiers, "copy");
    v4 = v3;
    if (v3)
      v5 = v3;
    else
      v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    v6 = v5;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "recordAccessToAssetIdentifiers:withVisibilityState:accessEventCount:", v6, self->_visibilityState, self->_eventCount);

  }
  assetIdentifiers = self->_assetIdentifiers;
  self->_assetIdentifiers = 0;

  self->_assetIdentifierPoolSize = 0;
  self->_eventCount = 0;
  drainTimer = self->_drainTimer;
  if (drainTimer)
  {
    dispatch_source_cancel(drainTimer);
    drainTimer = self->_drainTimer;
  }
  self->_drainTimer = 0;

}

- (void)setVisibilityState:(int64_t)a3
{
  if (self->_stateMonitoringEstablished)
    -[PABasicAssetIdentifierPool drainPool](self, "drainPool");
  else
    self->_stateMonitoringEstablished = 1;
  self->_visibilityState = a3;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_drainTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
