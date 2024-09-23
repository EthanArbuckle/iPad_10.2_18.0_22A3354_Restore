@implementation PXCloudQuotaOfferProvider

- (PXCloudQuotaOfferProvider)init
{
  NSObject *v3;
  id v4;
  PXCloudQuotaOfferProvider *v5;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  PXCloudQuotaOfferProvider *v12;
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
  v8.super_class = (Class)PXCloudQuotaOfferProvider;
  v5 = -[PXCloudQuotaOfferProvider init](&v8, sel_init);
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
  PXCloudQuotaOfferProvider *v9;
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
  v5.super_class = (Class)PXCloudQuotaOfferProvider;
  -[PXCloudQuotaOfferProvider dealloc](&v5, sel_dealloc);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCloudQuotaOfferProvider;
  -[PXCloudQuotaOfferProvider performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setOffer:(id)a3
{
  ICQOffer *v5;
  ICQOffer **p_offer;
  ICQOffer *offer;
  _BOOL4 v8;
  objc_class *v9;
  void *v10;
  ICQOffer *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  ICQOffer *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  PXCloudQuotaOfferProvider *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (ICQOffer *)a3;
  p_offer = &self->_offer;
  offer = self->_offer;
  if (offer != v5)
  {
    v8 = offer != 0;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXCloudQuotaSendAnalyticsForOfferChange(v5 != 0, v8, v10);

    objc_storeStrong((id *)&self->_offer, a3);
    v11 = *p_offer;
    PLUserStatusGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = (void *)objc_opt_class();
        v15 = *p_offer;
        v16 = v14;
        PXCloudQuotaOfferDebugDescription(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v14;
        v21 = 2048;
        v22 = self;
        v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did set offer:%{public}@", (uint8_t *)&v19, 0x20u);

      }
    }
    else if (v13)
    {
      v19 = 138543618;
      v20 = (id)objc_opt_class();
      v21 = 2048;
      v22 = self;
      v18 = v20;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did clear offer", (uint8_t *)&v19, 0x16u);

    }
    -[PXCloudQuotaOfferProvider signalChange:](self, "signalChange:", 1);
  }

}

- (void)setDismissibleOffer:(id)a3
{
  ICQOffer *v5;
  ICQOffer *dismissibleOffer;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  ICQOffer *offer;
  id v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  PXCloudQuotaOfferProvider *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (ICQOffer *)a3;
  if (self->_dismissibleOffer != v5)
  {
    objc_storeStrong((id *)&self->_dismissibleOffer, a3);
    dismissibleOffer = self->_dismissibleOffer;
    PLUserStatusGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (dismissibleOffer)
    {
      if (v8)
      {
        v9 = (void *)objc_opt_class();
        offer = self->_offer;
        v11 = v9;
        PXCloudQuotaOfferDebugDescription(offer);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v9;
        v16 = 2048;
        v17 = self;
        v18 = 2114;
        v19 = v12;
        _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did set dismissible offer:%{public}@", (uint8_t *)&v14, 0x20u);

      }
    }
    else if (v8)
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2048;
      v17 = self;
      v13 = v15;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did clear dismissible offer", (uint8_t *)&v14, 0x16u);

    }
    -[PXCloudQuotaOfferProvider signalChange:](self, "signalChange:", 2);
  }

}

- (void)_updateCurrentOffer:(id)a3
{
  id v4;
  id ICQBannerViewClass;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  ICQBannerViewClass = getICQBannerViewClass();
  if (objc_msgSend(ICQBannerViewClass, "shouldShowForOffer:", v4))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  if (objc_msgSend(ICQBannerViewClass, "shouldShowForDismissibleOffer:", v4))
    v8 = v4;
  else
    v8 = 0;
  v9 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__PXCloudQuotaOfferProvider__updateCurrentOffer___block_invoke;
  v12[3] = &unk_1E5123EE8;
  v13 = v7;
  v14 = v9;
  v10 = v9;
  v11 = v7;
  -[PXCloudQuotaOfferProvider performChanges:](self, "performChanges:", v12);

}

- (void)_queue_getCurrentOffer
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  PXCloudQuotaOfferProvider *v11;
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
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Will get current cloud offer", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend(getICQOfferManagerClass(), "sharedOfferManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke;
  v6[3] = &unk_1E5123F10;
  v6[4] = self;
  objc_copyWeak(&v7, (id *)buf);
  objc_msgSend(v5, "getOfferWithCompletion:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_queue_initialSetup
{
  void *v3;
  void *v4;

  if (_queue_initialSetup_predicate != -1)
    dispatch_once(&_queue_initialSetup_predicate, &__block_literal_global_86627);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getICQCurrentOfferChangedNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__currentOfferChangedNotification_, v4, 0);

  -[PXCloudQuotaOfferProvider _queue_getCurrentOffer](self, "_queue_getCurrentOffer");
}

- (void)_currentOfferChangedNotification:(id)a3
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
  PXCloudQuotaOfferProvider *v13;
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
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Current offer did change notification", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  PXCloudQuotaOfferSerialQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PXCloudQuotaOfferProvider__currentOfferChangedNotification___block_invoke;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

- (ICQOffer)offer
{
  return self->_offer;
}

- (ICQOffer)dismissibleOffer
{
  return self->_dismissibleOffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissibleOffer, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

void __62__PXCloudQuotaOfferProvider__currentOfferChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_getCurrentOffer");

}

id __48__PXCloudQuotaOfferProvider__queue_initialSetup__block_invoke()
{
  id v0;

  getICQBannerViewClass();
  getICQOfferManagerClass();
  getICQCurrentOfferChangedNotification();
  return v0;
}

void __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did get current cloud offer:%{public}@", buf, 0x20u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke_25;
  v10[3] = &unk_1E5147280;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v11 = v3;
  v9 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v12);
}

void __51__PXCloudQuotaOfferProvider__queue_getCurrentOffer__block_invoke_25(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateCurrentOffer:", *(_QWORD *)(a1 + 32));

}

void __49__PXCloudQuotaOfferProvider__updateCurrentOffer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setOffer:", v3);
  objc_msgSend(v4, "setDismissibleOffer:", *(_QWORD *)(a1 + 40));

}

void __33__PXCloudQuotaOfferProvider_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  PXCloudQuotaOfferSerialQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXCloudQuotaOfferProvider_init__block_invoke_2;
  block[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __33__PXCloudQuotaOfferProvider_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_initialSetup");

}

+ (PXCloudQuotaOfferProvider)currentOfferProvider
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
  os_unfair_lock_lock((os_unfair_lock_t)&currentOfferProvider__lock);
  WeakRetained = objc_loadWeakRetained(&currentOfferProvider__sharedOfferProvider);
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
      v6 = "%@ Reusing existing offer provider: %p";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v7, v8, v6, (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    v4 = objc_alloc_init((Class)a1);
    objc_storeWeak(&currentOfferProvider__sharedOfferProvider, v4);
    PLUserStatusGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = a1;
      v12 = 2048;
      v13 = v4;
      v6 = "%@ Creating new offer provider: %p";
      v7 = v5;
      v8 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&currentOfferProvider__lock);
  return (PXCloudQuotaOfferProvider *)v4;
}

@end
