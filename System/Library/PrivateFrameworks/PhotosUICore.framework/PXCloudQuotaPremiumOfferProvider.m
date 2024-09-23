@implementation PXCloudQuotaPremiumOfferProvider

- (PXCloudQuotaPremiumOfferProvider)init
{
  NSObject *v3;
  id v4;
  PXCloudQuotaPremiumOfferProvider *v5;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  PXCloudQuotaPremiumOfferProvider *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2048;
    v12 = self;
    v4 = v10;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> init", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)PXCloudQuotaPremiumOfferProvider;
  v5 = -[PXCloudQuotaPremiumOfferProvider init](&v8, sel_init);
  if (v5)
  {
    objc_initWeak((id *)buf, v5);
    objc_copyWeak(&v7, (id *)buf);
    px_dispatch_on_main_queue_when_idle_after_delay();
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[4];
  id v7;
  __int16 v8;
  PXCloudQuotaPremiumOfferProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v7 = (id)objc_opt_class();
    v8 = 2048;
    v9 = self;
    v4 = v7;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> dealloc", buf, 0x16u);

  }
  v5.receiver = self;
  v5.super_class = (Class)PXCloudQuotaPremiumOfferProvider;
  -[PXCloudQuotaPremiumOfferProvider dealloc](&v5, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCloudQuotaPremiumOfferProvider;
  -[PXCloudQuotaPremiumOfferProvider performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setPremiumOffer:(id)a3
{
  ICQPremiumOffer *v5;
  ICQPremiumOffer **p_premiumOffer;
  ICQPremiumOffer *premiumOffer;
  _BOOL4 v8;
  objc_class *v9;
  void *v10;
  ICQPremiumOffer *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  ICQPremiumOffer *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  PXCloudQuotaPremiumOfferProvider *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (ICQPremiumOffer *)a3;
  p_premiumOffer = &self->_premiumOffer;
  premiumOffer = self->_premiumOffer;
  if (premiumOffer != v5)
  {
    v8 = premiumOffer != 0;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXCloudQuotaSendAnalyticsForOfferChange(v5 != 0, v8, v10);

    objc_storeStrong((id *)&self->_premiumOffer, a3);
    v11 = *p_premiumOffer;
    PLUserStatusGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = (void *)objc_opt_class();
        v15 = *p_premiumOffer;
        v16 = v14;
        PXCloudQuotaOfferDebugDescription(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v14;
        v21 = 2048;
        v22 = self;
        v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did set premium offer:%{public}@", (uint8_t *)&v19, 0x20u);

      }
    }
    else if (v13)
    {
      v19 = 138543618;
      v20 = (id)objc_opt_class();
      v21 = 2048;
      v22 = self;
      v18 = v20;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did clear premium offer", (uint8_t *)&v19, 0x16u);

    }
    -[PXCloudQuotaPremiumOfferProvider signalChange:](self, "signalChange:", 1);
  }

}

- (void)_updateCurrentPremiumOffer:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PXCloudQuotaPremiumOfferProvider *v11;
  SEL v12;

  v5 = a3;
  if (objc_msgSend(getICQTileViewClass(), "shouldShowForPremiumOffer:", v5))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PXCloudQuotaPremiumOfferProvider__updateCurrentPremiumOffer___block_invoke;
  v9[3] = &unk_1E513B0C8;
  v11 = self;
  v12 = a2;
  v10 = v7;
  v8 = v7;
  -[PXCloudQuotaPremiumOfferProvider performChanges:](self, "performChanges:", v9);

}

- (void)_queue_getCurrentPremiumOffer
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  PXCloudQuotaPremiumOfferProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLUserStatusGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2048;
    v11 = self;
    v4 = v9;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Will get current cloud premium offer", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(getICQOfferManagerClass_235365(), "sharedOfferManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke;
  v6[3] = &unk_1E513B0F0;
  v6[4] = self;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v5, "getPremiumOfferWithCompletion:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_queue_initialSetup
{
  void *v3;
  void *v4;

  if (_queue_initialSetup_predicate_235350 != -1)
    dispatch_once(&_queue_initialSetup_predicate_235350, &__block_literal_global_235351);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getICQCurrentPremiumOfferChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__currentPremiumOfferChangedNotification_, v4, 0);

  -[PXCloudQuotaPremiumOfferProvider _queue_getCurrentPremiumOffer](self, "_queue_getCurrentPremiumOffer");
}

- (void)_currentPremiumOfferChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  PXCloudQuotaPremiumOfferProvider *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUserStatusGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2048;
    v13 = self;
    v6 = v11;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Current premium offer did change notification", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  PXCloudQuotaOfferSerialQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXCloudQuotaPremiumOfferProvider__currentPremiumOfferChangedNotification___block_invoke;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

- (ICQPremiumOffer)premiumOffer
{
  return self->_premiumOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_premiumOffer, 0);
}

void __76__PXCloudQuotaPremiumOfferProvider__currentPremiumOfferChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_getCurrentPremiumOffer");

}

id __55__PXCloudQuotaPremiumOfferProvider__queue_initialSetup__block_invoke()
{
  id v0;

  getICQTileViewClass();
  getICQOfferManagerClass_235365();
  getICQCurrentPremiumOfferChangedNotification();
  return v0;
}

void __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLUserStatusGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = v5;
    PXCloudQuotaOfferDebugDescription(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 2048;
    v16 = v6;
    v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did get current cloud premium offer:%{public}@", buf, 0x20u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke_25;
  v10[3] = &unk_1E5147280;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v11 = v3;
  v9 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v12);
}

void __65__PXCloudQuotaPremiumOfferProvider__queue_getCurrentPremiumOffer__block_invoke_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCurrentPremiumOffer:", *(_QWORD *)(a1 + 32));

}

uint64_t __63__PXCloudQuotaPremiumOfferProvider__updateCurrentPremiumOffer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPremiumOffer:", *(_QWORD *)(a1 + 32));
}

void __40__PXCloudQuotaPremiumOfferProvider_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  PXCloudQuotaOfferSerialQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PXCloudQuotaPremiumOfferProvider_init__block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __40__PXCloudQuotaPremiumOfferProvider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_initialSetup");

}

+ (PXCloudQuotaPremiumOfferProvider)currentPremiumOfferProvider
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&currentPremiumOfferProvider__lock);
  WeakRetained = objc_loadWeakRetained(&currentPremiumOfferProvider__sharedPremiumOfferProvider);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    PLUserStatusGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412546;
      v11 = a1;
      v12 = 2048;
      v13 = v4;
      v6 = "%@ Reusing existing premium offer provider: %p";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v7, v8, v6, (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    v4 = objc_alloc_init((Class)a1);
    objc_storeWeak(&currentPremiumOfferProvider__sharedPremiumOfferProvider, v4);
    PLUserStatusGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = a1;
      v12 = 2048;
      v13 = v4;
      v6 = "%@ Creating new premium offer provider: %p";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&currentPremiumOfferProvider__lock);
  return (PXCloudQuotaPremiumOfferProvider *)v4;
}

@end
