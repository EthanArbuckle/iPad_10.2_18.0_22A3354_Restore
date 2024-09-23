@implementation PXAssetsDataSourceCountsController

- (PXAssetsDataSourceCountsController)initWithAssetsDataSourceManager:(id)a3
{
  id v6;
  char *v7;
  PXAssetsDataSourceCountsController *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *prepareCountsQueue;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSourceCountsController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsDataSourceManager"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXAssetsDataSourceCountsController;
  v7 = -[PXObservable init](&v15, sel_init);
  v8 = (PXAssetsDataSourceCountsController *)v7;
  if (v7)
  {
    *((_QWORD *)v7 + 17) = 0x7FFFFFFFFFFFFFFFLL;
    *(_OWORD *)(v7 + 120) = PXDisplayAssetDetailedCountsUndefined;
    *((_QWORD *)v7 + 20) = 0x7FFFFFFFFFFFFFFFLL;
    *((_OWORD *)v7 + 9) = PXDisplayAssetDetailedCountsUndefined;
    objc_storeStrong((id *)v7 + 14, a3);
    -[PXAssetsDataSourceManager registerChangeObserver:context:](v8->_assetsDataSourceManager, "registerChangeObserver:context:", v8, AssetsDataSourceManagerObserverContext);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.photos.datasourcecountscontroller", v10);
    prepareCountsQueue = v8->_prepareCountsQueue;
    v8->_prepareCountsQueue = (OS_dispatch_queue *)v11;

  }
  return v8;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)counts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = ($C8986E5AD9146E03F7E851F39E835596)self[5];
  return self;
}

- (PXAssetsDataSourceCountsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSourceCountsController.m"), 41, CFSTR("%s is not available as initializer"), "-[PXAssetsDataSourceCountsController init]");

  abort();
}

- (void)setCounts:(id *)a3
{
  $C8986E5AD9146E03F7E851F39E835596 *p_counts;
  NSObject *v8;
  uint64_t v9;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  __int128 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  PXAssetsDataSourceCountsController *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  p_counts = &self->_counts;
  if (a3->var0 != self->_counts.photosCount
    || a3->var1 != self->_counts.videosCount
    || a3->var2 != self->_counts.othersCount)
  {
    PFAssetsDataSourceCountsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      v14 = 138544386;
      v15 = v9;
      v16 = 2048;
      v17 = self;
      v18 = 2048;
      v19 = var0;
      v20 = 2048;
      v21 = var1;
      v22 = 2048;
      v23 = var2;
      _os_log_impl(&dword_24430E000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> >>> Counts (photos:%lu, videos:%lu, others:%lu)", (uint8_t *)&v14, 0x34u);
    }

    v13 = *(_OWORD *)&a3->var0;
    p_counts->othersCount = a3->var2;
    *(_OWORD *)&p_counts->photosCount = v13;
    -[PXObservable signalChange:](self, "signalChange:", 1);
  }
}

- (void)setGuestCounts:(id *)a3
{
  $C8986E5AD9146E03F7E851F39E835596 *p_guestCounts;
  NSObject *v8;
  uint64_t v9;
  unint64_t var0;
  unint64_t var1;
  unint64_t var2;
  __int128 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  PXAssetsDataSourceCountsController *v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  p_guestCounts = &self->_guestCounts;
  if (a3->var0 != self->_guestCounts.photosCount
    || a3->var1 != self->_guestCounts.videosCount
    || a3->var2 != self->_guestCounts.othersCount)
  {
    PFAssetsDataSourceCountsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      v14 = 138544386;
      v15 = v9;
      v16 = 2048;
      v17 = self;
      v18 = 2048;
      v19 = var0;
      v20 = 2048;
      v21 = var1;
      v22 = 2048;
      v23 = var2;
      _os_log_impl(&dword_24430E000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> >>> Guest Counts (photos:%lu, videos:%lu, others:%lu)", (uint8_t *)&v14, 0x34u);
    }

    v13 = *(_OWORD *)&a3->var0;
    p_guestCounts->othersCount = a3->var2;
    *(_OWORD *)&p_guestCounts->photosCount = v13;
    -[PXObservable signalChange:](self, "signalChange:", 1);
  }
}

- (void)prepareCountsIfNeeded
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PXAssetsDataSourceCountsController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PFAssetsDataSourceCountsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_24430E000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Prepare Counts If Needed", (uint8_t *)&v4, 0x16u);
  }

  -[PXAssetsDataSourceCountsController _prepareCounts](self, "_prepareCounts");
}

- (void)_prepareCounts
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *prepareCountsQueue;
  _BOOL4 v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  int64x2_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  _QWORD v25[2];
  int64x2_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  PXAssetsDataSourceCountsController *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = -[PXAssetsDataSourceCountsController isPreparingAssetTypeCounts](self, "isPreparingAssetTypeCounts");
  v4 = -[PXAssetsDataSourceCountsController hasUsableCounts](self, "hasUsableCounts");
  v5 = v4;
  if (v3 || v4)
  {
    PFAssetsDataSourceCountsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v28 = objc_opt_class();
      v29 = 2048;
      v30 = self;
      v31 = 1024;
      v32 = v3;
      v33 = 1024;
      v34 = v5;
      _os_log_impl(&dword_24430E000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Skipping Prepare (preparing:%d || usable:%d)", buf, 0x22u);
    }
  }
  else
  {
    -[PXAssetsDataSourceCountsController assetsDataSourceManager](self, "assetsDataSourceManager");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject dataSource](v6, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject isBackgroundFetching](v6, "isBackgroundFetching");
    v9 = objc_msgSend(v7, "areAllSectionsConsideredAccurate");
    PFAssetsDataSourceCountsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v8 & 1) != 0 || !v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138544130;
        v28 = objc_opt_class();
        v29 = 2048;
        v30 = self;
        v31 = 1024;
        v32 = v8;
        v33 = 1024;
        v34 = v9;
        _os_log_impl(&dword_24430E000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Skipping Prepare (fetching:%d || !accurate:%d)", buf, 0x22u);
      }
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        v28 = objc_opt_class();
        v29 = 2048;
        v30 = self;
        _os_log_impl(&dword_24430E000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ⎡ Will Prepare Asset Type Counts", buf, 0x16u);
      }

      -[PXAssetsDataSourceCountsController setIsPreparingAssetTypeCounts:](self, "setIsPreparingAssetTypeCounts:", 1);
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v12 = objc_msgSend(v7, "numberOfSections");
      if (v12 >= 1)
      {
        v13 = v12;
        v14 = 0;
        v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        do
        {
          v25[0] = objc_msgSend(v7, "identifier", *(_OWORD *)&v21);
          v25[1] = v14;
          v26 = v21;
          objc_msgSend(v7, "assetsInSectionIndexPath:", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[NSObject addObject:](v10, "addObject:", v15);

          ++v14;
        }
        while (v13 != v14);
      }
      objc_initWeak((id *)buf, self);
      prepareCountsQueue = self->_prepareCountsQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__PXAssetsDataSourceCountsController__prepareCounts__block_invoke;
      block[3] = &unk_2514D01E8;
      objc_copyWeak(&v24, (id *)buf);
      v23 = v7;
      dispatch_async(prepareCountsQueue, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }

    v17 = -[PXAssetsDataSourceCountsController isPreparingAssetTypeCounts](self, "isPreparingAssetTypeCounts");
    v18 = -[PXAssetsDataSourceCountsController hasUsableCounts](self, "hasUsableCounts");
    PFAssetsDataSourceCountsGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138544386;
      v28 = v20;
      v29 = 2048;
      v30 = self;
      v31 = 1024;
      v32 = v17 || v18;
      v33 = 1024;
      v34 = v17;
      v35 = 1024;
      v36 = v18;
      _os_log_impl(&dword_24430E000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Is Prepared:%d (preparing:%d || usable:%d)", buf, 0x28u);
    }

    -[PXAssetsDataSourceCountsController setWaitingToPrepare:](self, "setWaitingToPrepare:", !v17 && !v18);
  }

}

- (void)_prepareDataSource:(id)a3
{
  NSObject *prepareCountsQueue;
  id v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  PXAssetsDataSourceCountsController *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  prepareCountsQueue = self->_prepareCountsQueue;
  v5 = a3;
  dispatch_assert_queue_V2(prepareCountsQueue);
  v6 = objc_msgSend(v5, "getAssetCounts:guestAssetCounts:allowFetch:", 0, 0, 1);

  PFAssetsDataSourceCountsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_opt_class();
    v9 = CFSTR("NO");
    if (v6)
      v9 = CFSTR("YES");
    v10 = v9;
    *(_DWORD *)buf = 138543874;
    v14 = v8;
    v15 = 2048;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_24430E000, v7, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ⎜ Prepare Asset Type Counts success:%@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__PXAssetsDataSourceCountsController__prepareDataSource___block_invoke;
  block[3] = &unk_2514D1180;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)_handlePreparationCompletion
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PXAssetsDataSourceCountsController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  PFAssetsDataSourceCountsGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_24430E000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> ⎣ Did Prepare Asset Type Counts", (uint8_t *)&v4, 0x16u);
  }

  -[PXAssetsDataSourceCountsController setIsPreparingAssetTypeCounts:](self, "setIsPreparingAssetTypeCounts:", 0);
  -[PXAssetsDataSourceCountsController setHasUsableCounts:](self, "setHasUsableCounts:", 1);
  -[PXAssetsDataSourceCountsController _updateCounts](self, "_updateCounts");
}

- (void)_updateCounts
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint8_t v14[4];
  uint64_t v15;
  __int16 v16;
  PXAssetsDataSourceCountsController *v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[PXAssetsDataSourceCountsController hasUsableCounts](self, "hasUsableCounts"))
  {
    -[PXAssetsDataSourceCountsController assetsDataSourceManager](self, "assetsDataSourceManager");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject dataSource](v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = PXDisplayAssetDetailedCountsUndefined;
    *(_QWORD *)&buf[16] = 0x7FFFFFFFFFFFFFFFLL;
    v12 = PXDisplayAssetDetailedCountsUndefined;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (objc_msgSend(v4, "getAssetCounts:guestAssetCounts:allowFetch:", buf, &v12, 0))
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __51__PXAssetsDataSourceCountsController__updateCounts__block_invoke;
      v7[3] = &__block_descriptor_80_e53_v16__0___PXMutableAssetsDataSourceCountsController__8l;
      v8 = *(_OWORD *)buf;
      v9 = *(_QWORD *)&buf[16];
      v10 = v12;
      v11 = v13;
      -[PXObservable performChanges:](self, "performChanges:", v7);
    }
    else
    {
      PFAssetsDataSourceCountsGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_opt_class();
        *(_DWORD *)v14 = 138543618;
        v15 = v6;
        v16 = 2048;
        v17 = self;
        _os_log_impl(&dword_24430E000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Re-Prepare Counts", v14, 0x16u);
      }

      -[PXAssetsDataSourceCountsController setHasUsableCounts:](self, "setHasUsableCounts:", 0);
      -[PXAssetsDataSourceCountsController _prepareCounts](self, "_prepareCounts");
    }

  }
  else
  {
    PFAssetsDataSourceCountsGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      _os_log_impl(&dword_24430E000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Skipping Update", buf, 0x16u);
    }
  }

}

- (void)_dataSourceManagerDidChange
{
  if (-[PXAssetsDataSourceCountsController waitingToPrepare](self, "waitingToPrepare"))
    -[PXAssetsDataSourceCountsController _prepareCounts](self, "_prepareCounts");
  else
    -[PXAssetsDataSourceCountsController _updateCounts](self, "_updateCounts");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  PXAssetsDataSourceCountsController *v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if ((void *)AssetsDataSourceManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsDataSourceCountsController.m"), 195, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    PFAssetsDataSourceCountsGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = objc_opt_class();
      v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_24430E000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Received PXDataSourceManagerChangedDataSource", (uint8_t *)&v13, 0x16u);
    }

    -[PXAssetsDataSourceCountsController _dataSourceManagerDidChange](self, "_dataSourceManagerDidChange");
  }

}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  PXAssetsDataSourceCountsController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PFAssetsDataSourceCountsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_24430E000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Received assetsDataSourceManagerDidFinishBackgroundFetching", (uint8_t *)&v5, 0x16u);
  }

  -[PXAssetsDataSourceCountsController _dataSourceManagerDidChange](self, "_dataSourceManagerDidChange");
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)guestCounts
{
  *($C8986E5AD9146E03F7E851F39E835596 *)retstr = ($C8986E5AD9146E03F7E851F39E835596)self[6];
  return self;
}

- (BOOL)isPreparingAssetTypeCounts
{
  return self->_isPreparingAssetTypeCounts;
}

- (void)setIsPreparingAssetTypeCounts:(BOOL)a3
{
  self->_isPreparingAssetTypeCounts = a3;
}

- (BOOL)hasUsableCounts
{
  return self->_hasUsableCounts;
}

- (void)setHasUsableCounts:(BOOL)a3
{
  self->_hasUsableCounts = a3;
}

- (BOOL)waitingToPrepare
{
  return self->_waitingToPrepare;
}

- (void)setWaitingToPrepare:(BOOL)a3
{
  self->_waitingToPrepare = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_prepareCountsQueue, 0);
}

void __51__PXAssetsDataSourceCountsController__updateCounts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v3 = a2;
  objc_msgSend(v3, "setCounts:", &v6);
  v4 = *(_OWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "setGuestCounts:", &v4);

}

void __57__PXAssetsDataSourceCountsController__prepareDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePreparationCompletion");

}

void __52__PXAssetsDataSourceCountsController__prepareCounts__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_prepareDataSource:", *(_QWORD *)(a1 + 32));

}

@end
