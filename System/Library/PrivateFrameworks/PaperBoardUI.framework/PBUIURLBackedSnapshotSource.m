@implementation PBUIURLBackedSnapshotSource

- (PUIColorStatistics)contentColorStatistics
{
  return self->_contentColorStatistics;
}

- (void)currentSnapshotInterfaceOrientation:(int64_t *)a3 outDeviceOrientation:(int64_t *)a4
{
  void *v6;
  PBUIURLBackedSnapshotSource *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PBUIURLBackedSnapshotSource encoderForSnapshot](obj, "encoderForSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSnapshotInterfaceOrientation:outDeviceOrientation:", a3, a4);

  objc_sync_exit(obj);
}

- (id)encoderForSnapshot
{
  PBUIURLBackedSnapshotSource *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[PBUIURLBackedSnapshotSource snapshotURL](v2, "snapshotURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc((Class)getPUIImageEncoderClass());
    -[PBUIURLBackedSnapshotSource snapshotURL](v2, "snapshotURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIURLBackedSnapshotSource format](v2, "format");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithURL:format:", v5, v6);

  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (NSURL)snapshotURL
{
  return self->_snapshotURL;
}

- (PUIImageOnDiskFormat)format
{
  return self->_format;
}

- (id)registerSnapshotSourceObserver:(id)a3
{
  return -[PBUIReplicaSourceObserverBox registerSourceObserver:](self->_observers, "registerSourceObserver:", a3);
}

- (PBUIURLBackedSnapshotSource)initWithSnapshotURL:(id)a3 colorStatisticsURL:(id)a4 metadataURL:(id)a5 format:(id)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PBUIURLBackedSnapshotSource *v17;
  uint64_t v18;
  BSAtomicFlag *isFrozen;
  uint64_t v20;
  BSAtomicFlag *isDirty;
  uint64_t v22;
  BSAtomicFlag *needsColorSettingsUpdate;
  uint64_t v24;
  PUIColorStatistics *contentColorStatistics;
  PBUIReplicaSourceObserverBox *v26;
  PBUIReplicaSourceObserverBox *observers;
  uint64_t v28;
  NSString *cacheIdentifier;
  id v31;
  objc_super v32;

  v31 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PBUIURLBackedSnapshotSource;
  v17 = -[PBUIURLBackedSnapshotSource init](&v32, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    isFrozen = v17->_isFrozen;
    v17->_isFrozen = (BSAtomicFlag *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    isDirty = v17->_isDirty;
    v17->_isDirty = (BSAtomicFlag *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    needsColorSettingsUpdate = v17->_needsColorSettingsUpdate;
    v17->_needsColorSettingsUpdate = (BSAtomicFlag *)v22;

    objc_storeStrong((id *)&v17->_snapshotURL, a3);
    objc_storeStrong((id *)&v17->_snapshotColorStatisticsURL, a4);
    objc_storeStrong((id *)&v17->_snapshotMetadataURL, a5);
    objc_storeStrong((id *)&v17->_format, a6);
    objc_storeWeak((id *)&v17->_delegate, v16);
    v24 = objc_msgSend(objc_alloc((Class)getPUIColorStatisticsClass()), "initWithDelegate:", v17);
    contentColorStatistics = v17->_contentColorStatistics;
    v17->_contentColorStatistics = (PUIColorStatistics *)v24;

    v26 = -[PBUIReplicaSourceObserverBox initWithIdentifier:]([PBUIReplicaSourceObserverBox alloc], "initWithIdentifier:", CFSTR("SnapshotSource"));
    observers = v17->_observers;
    v17->_observers = v26;

    -[PBUIURLBackedSnapshotSource buildCacheIdentifier](v17, "buildCacheIdentifier");
    v28 = objc_claimAutoreleasedReturnValue();
    cacheIdentifier = v17->_cacheIdentifier;
    v17->_cacheIdentifier = (NSString *)v28;

    -[PBUIURLBackedSnapshotSource updateFromDisk](v17, "updateFromDisk");
  }

  return v17;
}

- (PBUIURLBackedSnapshotSource)initWithPathProvider:(id)a3 format:(id)a4
{
  return -[PBUIURLBackedSnapshotSource initWithPathProvider:format:delegate:](self, "initWithPathProvider:format:delegate:", a3, a4, 0);
}

- (PBUIURLBackedSnapshotSource)initWithPathProvider:(id)a3 format:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PBUIURLBackedSnapshotSource *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "snapshotURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotColorStatisticsURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotMetadataURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[PBUIURLBackedSnapshotSource initWithSnapshotURL:colorStatisticsURL:metadataURL:format:delegate:](self, "initWithSnapshotURL:colorStatisticsURL:metadataURL:format:delegate:", v11, v12, v13, v9, v8);
  return v14;
}

- (void)updateFromPathProvider:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  uint64_t v5;
  NSURL *snapshotURL;
  uint64_t v7;
  NSURL *snapshotColorStatisticsURL;
  uint64_t v9;
  NSURL *snapshotMetadataURL;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v11, "snapshotURL");
  v5 = objc_claimAutoreleasedReturnValue();
  snapshotURL = v4->_snapshotURL;
  v4->_snapshotURL = (NSURL *)v5;

  objc_msgSend(v11, "snapshotColorStatisticsURL");
  v7 = objc_claimAutoreleasedReturnValue();
  snapshotColorStatisticsURL = v4->_snapshotColorStatisticsURL;
  v4->_snapshotColorStatisticsURL = (NSURL *)v7;

  objc_msgSend(v11, "snapshotMetadataURL");
  v9 = objc_claimAutoreleasedReturnValue();
  snapshotMetadataURL = v4->_snapshotMetadataURL;
  v4->_snapshotMetadataURL = (NSURL *)v9;

  -[PBUIURLBackedSnapshotSource updateFromDisk](v4, "updateFromDisk");
  objc_sync_exit(v4);

}

- (void)invalidateCurrentSnapshot
{
  OUTLINED_FUNCTION_0_2(&dword_1B71C0000, a2, a3, "Could not delete on-disk snapshot for reasons: %@", a5, a6, a7, a8, 2u);
}

- (BOOL)effectsAreBakedIn
{
  return 0;
}

- (BOOL)isValid
{
  void *v2;

  -[PBUIURLBackedSnapshotSource snapshot](self, "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (NSDictionary)snapshotMetadata
{
  PBUIURLBackedSnapshotSource *v2;
  NSDictionary *snapshotMetadata;
  NSDictionary *v4;

  v2 = self;
  objc_sync_enter(v2);
  snapshotMetadata = v2->_snapshotMetadata;
  if (!snapshotMetadata)
  {
    -[PBUIURLBackedSnapshotSource readMetadataFromDisk](v2, "readMetadataFromDisk");
    snapshotMetadata = v2->_snapshotMetadata;
  }
  v4 = snapshotMetadata;
  objc_sync_exit(v2);

  return v4;
}

- (void)clearDerivedProminentColor
{
  OUTLINED_FUNCTION_0_2(&dword_1B71C0000, a2, a3, "clearDerivedProminentColor failed for error: %{public}@", a5, a6, a7, a8, 2u);
}

- (UIColor)derivedProminentPosterColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PBUIURLBackedSnapshotSource snapshotMetadata](self, "snapshotMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kDerivedProminentPosterColorMetadataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "UIColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (UIColor *)v7;
}

- (UIColor)posterPreferredProminentColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PBUIURLBackedSnapshotSource snapshotMetadata](self, "snapshotMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kPosterPreferredProminentPosterColorMetadataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "UIColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (UIColor *)v7;
}

- (BOOL)updatePosterPreferredProminentColor:(id)a3 error:(id *)a4
{
  id v6;
  PBUIURLBackedSnapshotSource *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[PBUIURLBackedSnapshotSource snapshotMetadata](v7, "snapshotMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_opt_new();
  v12 = v11;

  if (v6)
  {
    objc_msgSend(v6, "BSColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("kPosterPreferredProminentPosterColorMetadataKey"));

  }
  else
  {
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("kPosterPreferredProminentPosterColorMetadataKey"));
  }
  v14 = -[PBUIURLBackedSnapshotSource updateMetadataWith:error:](v7, "updateMetadataWith:error:", v12, a4);

  objc_sync_exit(v7);
  return v14;
}

- (void)setSnapshotURL:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  uint64_t v5;
  NSURL *snapshotURL;
  uint64_t v7;
  NSString *cacheIdentifier;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualObjects() & 1) == 0)
  {
    v5 = objc_msgSend(v9, "copy");
    snapshotURL = v4->_snapshotURL;
    v4->_snapshotURL = (NSURL *)v5;

    -[PBUIURLBackedSnapshotSource buildCacheIdentifier](v4, "buildCacheIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    cacheIdentifier = v4->_cacheIdentifier;
    v4->_cacheIdentifier = (NSString *)v7;

    -[PBUIURLBackedSnapshotSource updateFromDisk](v4, "updateFromDisk");
  }
  objc_sync_exit(v4);

}

- (void)setSnapshotMetadataURL:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  uint64_t v5;
  NSURL *snapshotMetadataURL;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualObjects() & 1) == 0)
  {
    v5 = objc_msgSend(v7, "copy");
    snapshotMetadataURL = v4->_snapshotMetadataURL;
    v4->_snapshotMetadataURL = (NSURL *)v5;

    -[PBUIURLBackedSnapshotSource readMetadataFromDisk](v4, "readMetadataFromDisk");
    -[PBUIURLBackedSnapshotSource notifyObservers](v4, "notifyObservers");
  }
  objc_sync_exit(v4);

}

- (void)setLegibilitySettings:(id)a3
{
  PBUIURLBackedSnapshotSource *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_legibilitySettings, a3);
    -[PBUIURLBackedSnapshotSource notifyObservers](v5, "notifyObservers");
  }
  objc_sync_exit(v5);

}

- (void)setSnapshot:(id)a3
{
  PBUIURLBackedSnapshotSource *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_snapshot, a3);
    -[PBUIURLBackedSnapshotSource notifyObservers](v5, "notifyObservers");
  }
  objc_sync_exit(v5);

}

- (void)setupSnapshotSourceForSnapshotURL:(id)a3 snapshotColorStatisticsURL:(id)a4 snapshotMetadataURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __112__PBUIURLBackedSnapshotSource_setupSnapshotSourceForSnapshotURL_snapshotColorStatisticsURL_snapshotMetadataURL___block_invoke;
  v14[3] = &unk_1E6B94ED8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PBUIURLBackedSnapshotSource performBatchUpdates:](self, "performBatchUpdates:", v14);

}

uint64_t __112__PBUIURLBackedSnapshotSource_setupSnapshotSourceForSnapshotURL_snapshotColorStatisticsURL_snapshotMetadataURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSnapshotURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSnapshotColorStatisticsURL:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setSnapshotMetadataURL:", *(_QWORD *)(a1 + 56));
}

- (BOOL)updateMetadataWith:(id)a3 error:(id *)a4
{
  id v6;
  PBUIURLBackedSnapshotSource *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *snapshotMetadata;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v6, 100, 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a4) = objc_msgSend(v8, "writeToURL:options:error:", v7->_snapshotMetadataURL, 268435457, a4);
    if ((_DWORD)a4)
    {
      -[NSURL setResourceValue:forKey:error:](v7->_snapshotMetadataURL, "setResourceValue:forKey:error:", *MEMORY[0x1E0C99940], *MEMORY[0x1E0C99938], 0);
      -[NSURL setResourceValue:forKey:error:](v7->_snapshotMetadataURL, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C999D8], 0);
      v9 = objc_msgSend(v6, "copy");
      snapshotMetadata = v7->_snapshotMetadata;
      v7->_snapshotMetadata = (NSDictionary *)v9;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a4) = objc_msgSend(v8, "removeItemAtURL:error:", v7->_snapshotMetadataURL, a4);
  }

  objc_sync_exit(v7);
  return (char)a4;
}

- (void)setSnapshotColorStatisticsURL:(id)a3
{
  PBUIURLBackedSnapshotSource *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&v5->_snapshotColorStatisticsURL, a3);
    -[PBUIURLBackedSnapshotSource readColorStatisticsFromDisk](v5, "readColorStatisticsFromDisk");
  }
  objc_sync_exit(v5);

}

- (void)performBatchUpdates:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = self;
  objc_sync_enter(v4);
  -[BSAtomicFlag setFlag:](v4->_isFrozen, "setFlag:", 1);
  v5[2]();
  -[BSAtomicFlag setFlag:](v4->_isFrozen, "setFlag:", 0);
  -[PBUIURLBackedSnapshotSource notifyObserversIfNeeded](v4, "notifyObserversIfNeeded");
  objc_sync_exit(v4);

}

- (BOOL)updateWithImage:(id)a3 contentColorStatistics:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  PBUIURLBackedSnapshotSource *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  objc_sync_enter(v13);
  -[PBUIURLBackedSnapshotSource encoderForSnapshot](v13, "encoderForSnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v25 = 0;
    objc_msgSend(v14, "writeThenReadBackImage:error:", v10, &v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25;
    v18 = v17;
    v19 = v16 != 0;
    if (v16)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __85__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_error___block_invoke;
      v21[3] = &unk_1E6B94ED8;
      v21[4] = v13;
      v22 = v16;
      v23 = v11;
      v24 = v12;
      -[PBUIURLBackedSnapshotSource performBatchUpdates:](v13, "performBatchUpdates:", v21);

    }
    else if (a6 && v17)
    {
      *a6 = objc_retainAutorelease(v17);
    }

  }
  else
  {
    v19 = 0;
  }

  objc_sync_exit(v13);
  return v19;
}

uint64_t __85__PBUIURLBackedSnapshotSource_updateWithImage_contentColorStatistics_metadata_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSnapshot:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateColorStatisticsWith:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "updateMetadataWith:error:", *(_QWORD *)(a1 + 56), 0);
}

- (void)updateColorStatisticsWith:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  PUIColorStatistics *contentColorStatistics;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  contentColorStatistics = v4->_contentColorStatistics;
  objc_msgSend(v7, "averageColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "averageContrast");
  -[PUIColorStatistics updateWithAverageColor:contrast:](contentColorStatistics, "updateWithAverageColor:contrast:", v6);

  objc_sync_exit(v4);
}

- (void)colorStatisticsDidChange:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[BSAtomicFlag setFlag:](v4->_needsColorSettingsUpdate, "setFlag:", 1);
  -[PBUIURLBackedSnapshotSource notifyObserversIfNeeded](v4, "notifyObserversIfNeeded");
  -[PBUIURLBackedSnapshotSource saveColorStatistics](v4, "saveColorStatistics");
  objc_sync_exit(v4);

}

- (void)updateFromDisk
{
  PBUIURLBackedSnapshotSource *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = self;
  objc_sync_enter(v2);
  v6 = 0;
  -[PBUIURLBackedSnapshotSource readFromDiskWithError:](v2, "readFromDiskWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (v4)
  {
    -[PBUIURLBackedSnapshotSource delegate](v2, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "snapshotSource:failedToReadSnapshotAtURL:error:", v2, v2->_snapshotURL, v4);

  }
  -[PBUIURLBackedSnapshotSource setSnapshot:](v2, "setSnapshot:", v3);

  objc_sync_exit(v2);
}

- (id)readFromDiskWithError:(id *)a3
{
  PBUIURLBackedSnapshotSource *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = self;
  objc_sync_enter(v4);
  -[PBUIURLBackedSnapshotSource encoderForSnapshot](v4, "encoderForSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "createUIImageWithError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  objc_sync_exit(v4);
  return v7;
}

- (BOOL)saveColorStatistics
{
  PBUIURLBackedSnapshotSource *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v2 = self;
  objc_sync_enter(v2);
  -[PBUIURLBackedSnapshotSource snapshotColorStatisticsURL](v2, "snapshotColorStatisticsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2->_contentColorStatistics, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  soft_PFFileProtectionNoneAttributes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v6, v4, v7);

  objc_sync_exit(v2);
  return v8;
}

- (void)readColorStatisticsFromDisk
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUIColorStatistics *contentColorStatistics;
  void *v9;
  PBUIURLBackedSnapshotSource *obj;

  obj = self;
  objc_sync_enter(obj);
  -[PBUIURLBackedSnapshotSource snapshotColorStatisticsURL](obj, "snapshotColorStatisticsURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    objc_msgSend(v3, "setResourceValue:forKey:error:", *MEMORY[0x1E0C99940], *MEMORY[0x1E0C99938], 0);
    objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C999D8], 0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v3, 1, 0);
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)MEMORY[0x1E0CB3710];
      getPUIColorStatisticsClass();
      objc_opt_self();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v4, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        contentColorStatistics = obj->_contentColorStatistics;
        objc_msgSend(v7, "averageColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "averageContrast");
        -[PUIColorStatistics updateWithAverageColor:contrast:](contentColorStatistics, "updateWithAverageColor:contrast:", v9);

      }
    }

  }
  objc_sync_exit(obj);

}

- (void)readMetadataFromDisk
{
  NSURL *snapshotMetadataURL;
  void *v3;
  uint64_t v4;
  NSDictionary *snapshotMetadata;
  PBUIURLBackedSnapshotSource *obj;

  obj = self;
  objc_sync_enter(obj);
  snapshotMetadataURL = obj->_snapshotMetadataURL;
  if (snapshotMetadataURL
    && -[NSURL checkResourceIsReachableAndReturnError:](snapshotMetadataURL, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", obj->_snapshotMetadataURL);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      snapshotMetadata = obj->_snapshotMetadata;
      obj->_snapshotMetadata = (NSDictionary *)v4;

    }
  }
  objc_sync_exit(obj);

}

- (void)notifyObservers
{
  PBUIURLBackedSnapshotSource *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BSAtomicFlag setFlag:](obj->_isDirty, "setFlag:", 1);
  -[PBUIURLBackedSnapshotSource notifyObserversIfNeeded](obj, "notifyObserversIfNeeded");
  objc_sync_exit(obj);

}

- (void)notifyObserversIfNeeded
{
  PBUIURLBackedSnapshotSource *v2;
  int v3;

  v2 = self;
  objc_sync_enter(v2);
  if ((-[BSAtomicFlag getFlag](v2->_isFrozen, "getFlag") & 1) == 0)
  {
    v3 = -[BSAtomicFlag setFlag:](v2->_needsColorSettingsUpdate, "setFlag:", 0);
    if ((v3 | -[BSAtomicFlag setFlag:](v2->_isDirty, "setFlag:", 0)) == 1)
      BSDispatchMain();
  }
  objc_sync_exit(v2);

}

void __54__PBUIURLBackedSnapshotSource_notifyObserversIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setNeedsSourceUpdate");
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentColorStatistics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorStatisticsDidChange:", v2);

  }
}

- (id)buildCacheIdentifier
{
  PBUIURLBackedSnapshotSource *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v2 = self;
  objc_sync_enter(v2);
  -[PBUIURLBackedSnapshotSource snapshotURL](v2, "snapshotURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v10 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v10, *MEMORY[0x1E0C99908], 0);
    v5 = v10;
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%@)"), v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_sync_exit(v2);
  return v8;
}

- (BOOL)removeOnDiskSnapshotWithError:(id *)a3
{
  PBUIURLBackedSnapshotSource *v4;
  void *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIURLBackedSnapshotSource snapshotURL](v4, "snapshotURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "removeItemAtURL:error:", v6, a3);

  objc_sync_exit(v4);
  return (char)a3;
}

- (NSString)description
{
  return (NSString *)-[PBUIURLBackedSnapshotSource descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PBUIURLBackedSnapshotSource descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  PBUIURLBackedSnapshotSource *v22;
  _QWORD v23[4];
  id v24;
  PBUIURLBackedSnapshotSource *v25;
  _QWORD v26[4];
  id v27;
  PBUIURLBackedSnapshotSource *v28;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIURLBackedSnapshotSource cacheIdentifier](self, "cacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("cacheIdentifier"));

  objc_msgSend(v4, "activeMultilinePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke;
  v26[3] = &unk_1E6B94BC8;
  v8 = v4;
  v27 = v8;
  v28 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("snapshot"), v6, v26);

  objc_msgSend(v8, "activeMultilinePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v23[3] = &unk_1E6B94BC8;
  v10 = v8;
  v24 = v10;
  v25 = self;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("colorStatistics"), v9, v23);

  objc_msgSend(v10, "activeMultilinePrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = 3221225472;
  v19 = __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v20 = &unk_1E6B94BC8;
  v12 = v10;
  v21 = v12;
  v22 = self;
  objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("metadata"), v11, &v17);

  v13 = (id)objc_msgSend(v12, "appendBool:withName:", -[PBUIURLBackedSnapshotSource effectsAreBakedIn](self, "effectsAreBakedIn", v17, v18, v19, v20), CFSTR("effectsAreBakedIn"));
  v14 = (id)objc_msgSend(v12, "appendObject:withName:", self->_observers, CFSTR("observers"));
  v15 = v12;

  return v15;
}

void __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("image"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snapshotURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("snapshotURL"));

}

void __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentColorStatistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("colorStatistics"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snapshotColorStatisticsURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("snapshotColorStatisticsURL"));

}

void __69__PBUIURLBackedSnapshotSource_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snapshotMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("metadata"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snapshotMetadataURL");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("snapshotMetadataURL"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PBUIURLBackedSnapshotSource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (BOOL)isEqual:(id)a3
{
  PBUIURLBackedSnapshotSource *v4;
  PBUIURLBackedSnapshotSource *v5;
  PBUIURLBackedSnapshotSource *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PBUIURLBackedSnapshotSource *v10;
  id v11;
  void *v12;
  PBUIURLBackedSnapshotSource *v13;
  id v14;
  void *v15;
  PBUIURLBackedSnapshotSource *v16;
  id v17;
  void *v18;
  PBUIURLBackedSnapshotSource *v19;
  id v20;
  BOOL v21;
  objc_super v23;
  _QWORD v24[4];
  PBUIURLBackedSnapshotSource *v25;
  _QWORD v26[4];
  PBUIURLBackedSnapshotSource *v27;
  _QWORD v28[4];
  PBUIURLBackedSnapshotSource *v29;
  _QWORD v30[4];
  PBUIURLBackedSnapshotSource *v31;

  v4 = (PBUIURLBackedSnapshotSource *)a3;
  v5 = v4;
  if (self == v4)
  {
    v21 = 1;
  }
  else if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIURLBackedSnapshotSource snapshotURL](v6, "snapshotURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke;
    v30[3] = &unk_1E6B94F28;
    v10 = v5;
    v31 = v10;
    v11 = (id)objc_msgSend(v7, "appendObject:counterpart:", v8, v30);

    -[PBUIURLBackedSnapshotSource snapshotColorStatisticsURL](v6, "snapshotColorStatisticsURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_2;
    v28[3] = &unk_1E6B94F28;
    v13 = v10;
    v29 = v13;
    v14 = (id)objc_msgSend(v7, "appendObject:counterpart:", v12, v28);

    -[PBUIURLBackedSnapshotSource snapshotMetadataURL](v6, "snapshotMetadataURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_3;
    v26[3] = &unk_1E6B94F28;
    v16 = v13;
    v27 = v16;
    v17 = (id)objc_msgSend(v7, "appendObject:counterpart:", v15, v26);

    -[PBUIURLBackedSnapshotSource snapshot](v6, "snapshot");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_4;
    v24[3] = &unk_1E6B94F28;
    v19 = v16;
    v25 = v19;
    v20 = (id)objc_msgSend(v7, "appendObject:counterpart:", v18, v24);

    if (objc_msgSend(v7, "isEqual"))
    {
      v23.receiver = v6;
      v23.super_class = (Class)PBUIURLBackedSnapshotSource;
      v21 = -[PBUIURLBackedSnapshotSource isEqual:](&v23, sel_isEqual_, v19);
    }
    else
    {
      v21 = 0;
    }

    objc_sync_exit(v6);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotURL");
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotColorStatisticsURL");
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotMetadataURL");
}

uint64_t __39__PBUIURLBackedSnapshotSource_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshot");
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (PBUIURLSourceDelegate)delegate
{
  return (PBUIURLSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)snapshotColorStatisticsURL
{
  return self->_snapshotColorStatisticsURL;
}

- (NSURL)snapshotMetadataURL
{
  return self->_snapshotMetadataURL;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_snapshotMetadataURL, 0);
  objc_storeStrong((id *)&self->_snapshotColorStatisticsURL, 0);
  objc_storeStrong((id *)&self->_snapshotURL, 0);
  objc_storeStrong((id *)&self->_contentColorStatistics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotMetadata, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_needsColorSettingsUpdate, 0);
  objc_storeStrong((id *)&self->_isDirty, 0);
  objc_storeStrong((id *)&self->_isFrozen, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
