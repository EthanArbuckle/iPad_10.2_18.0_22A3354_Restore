@implementation PKCoarseLocationMonitor

+ (id)sharedInstance
{
  if (_MergedGlobals_296 != -1)
    dispatch_once(&_MergedGlobals_296, &__block_literal_global_233);
  return (id)qword_1ECF22D40;
}

void __41__PKCoarseLocationMonitor_sharedInstance__block_invoke()
{
  PKCoarseLocationMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PKCoarseLocationMonitor);
  v1 = (void *)qword_1ECF22D40;
  qword_1ECF22D40 = (uint64_t)v0;

}

- (PKCoarseLocationMonitor)init
{
  PKCoarseLocationMonitor *v2;
  PKCoarseLocationMonitor *v3;
  _QWORD block[4];
  PKCoarseLocationMonitor *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKCoarseLocationMonitor;
  v2 = -[PKCoarseLocationMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__PKCoarseLocationMonitor_init__block_invoke;
    block[3] = &unk_1E2ABE120;
    v6 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v3;
}

void __31__PKCoarseLocationMonitor_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  PKPassKitCoreBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v3, *(_QWORD *)(a1 + 32), MEMORY[0x1E0C80D38]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PKCoarseLocationMonitor *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PKCoarseLocationMonitor_locationManagerDidChangeAuthorization___block_invoke;
  v6[3] = &unk_1E2ABE0D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __65__PKCoarseLocationMonitor_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_limitsPrecision");
  v3 = *(_QWORD *)(a1 + 40);
  if (*(unsigned __int8 *)(v3 + 16) != v2)
  {
    *(_BYTE *)(v3 + 16) = v2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("PKCoarseLocationMonitorEnabledStateChangedNotification"), *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)coarseLocationEnabled
{
  return self->_coarseLocationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
