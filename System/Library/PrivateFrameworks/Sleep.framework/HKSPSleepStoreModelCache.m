@implementation HKSPSleepStoreModelCache

- (HKSPSleepStoreModelCache)init
{
  HKSPSleepStoreModelCache *v2;
  HKSPSleepStoreModelCache *v3;
  HKSPSleepStoreModelCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSPSleepStoreModelCache;
  v2 = -[HKSPSleepStoreModelCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cacheLock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v2->_sleepScheduleNeedsUpdate = 16843009;
    v2->_sleepModeNeedsUpdate = 1;
    v4 = v2;
  }

  return v3;
}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_cacheLock;
  void (**v4)(_QWORD);

  p_cacheLock = &self->_cacheLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_cacheLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_cacheLock);
}

- (id)cachedSleepSchedule
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HKSPSleepStoreModelCache_cachedSleepSchedule__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__HKSPSleepStoreModelCache_cachedSleepSchedule__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locked_cachedSleepSchedule");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_locked_cachedSleepSchedule
{
  if (self->_sleepScheduleNeedsUpdate)
    return 0;
  else
    return self->_sleepSchedule;
}

- (id)cachedSleepScheduleWithMissHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke;
  v11[3] = &unk_1E4E3B8A0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke_2;
    v10[3] = &unk_1E4E3C9A8;
    v10[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    HKSPNullify(*(void **)(v1 + 24));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __63__HKSPSleepStoreModelCache_cachedSleepScheduleWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepSchedule:", v3);

}

- (void)updateCachedSleepSchedule:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HKSPSleepStoreModelCache_updateCachedSleepSchedule___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v6);

}

uint64_t __54__HKSPSleepStoreModelCache_updateCachedSleepSchedule___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateCachedSleepSchedule:", *(_QWORD *)(a1 + 40));
}

- (void)_locked_updateCachedSleepSchedule:(id)a3
{
  HKSPSleepSchedule *v4;
  HKSPSleepSchedule *sleepSchedule;

  v4 = (HKSPSleepSchedule *)objc_msgSend(a3, "copy");
  sleepSchedule = self->_sleepSchedule;
  self->_sleepSchedule = v4;

  self->_sleepScheduleNeedsUpdate = 0;
}

- (void)purgeCachedSleepSchedule
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__HKSPSleepStoreModelCache_purgeCachedSleepSchedule__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v2);
}

uint64_t __52__HKSPSleepStoreModelCache_purgeCachedSleepSchedule__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSchedule");
}

- (void)_locked_purgeCachedSleepSchedule
{
  self->_sleepScheduleNeedsUpdate = 1;
}

- (id)cachedSleepSettings
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__HKSPSleepStoreModelCache_cachedSleepSettings__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__HKSPSleepStoreModelCache_cachedSleepSettings__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locked_cachedSleepSettings");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_locked_cachedSleepSettings
{
  if (self->_sleepSettingsNeedsUpdate)
    return 0;
  else
    return self->_sleepSettings;
}

- (id)cachedSleepSettingsWithMissHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke;
  v11[3] = &unk_1E4E3B8A0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke_2;
    v10[3] = &unk_1E4E3C9D0;
    v10[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    HKSPNullify(*(void **)(v1 + 32));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __63__HKSPSleepStoreModelCache_cachedSleepSettingsWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepSettings:", v3);

}

- (void)updateCachedSleepSettings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HKSPSleepStoreModelCache_updateCachedSleepSettings___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v6);

}

uint64_t __54__HKSPSleepStoreModelCache_updateCachedSleepSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateCachedSleepSettings:", *(_QWORD *)(a1 + 40));
}

- (void)_locked_updateCachedSleepSettings:(id)a3
{
  HKSPSleepSettings *v4;
  HKSPSleepSettings *sleepSettings;

  v4 = (HKSPSleepSettings *)objc_msgSend(a3, "copy");
  sleepSettings = self->_sleepSettings;
  self->_sleepSettings = v4;

  self->_sleepSettingsNeedsUpdate = 0;
}

- (void)purgeCachedSleepSettings
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__HKSPSleepStoreModelCache_purgeCachedSleepSettings__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v2);
}

uint64_t __52__HKSPSleepStoreModelCache_purgeCachedSleepSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSettings");
}

- (void)_locked_purgeCachedSleepSettings
{
  self->_sleepSettingsNeedsUpdate = 1;
}

- (id)cachedSleepEventRecord
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__HKSPSleepStoreModelCache_cachedSleepEventRecord__block_invoke;
  v4[3] = &unk_1E4E3AED0;
  v4[4] = self;
  v4[5] = &v5;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__HKSPSleepStoreModelCache_cachedSleepEventRecord__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locked_cachedSleepEventRecord");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_locked_cachedSleepEventRecord
{
  if (self->_sleepEventRecordNeedsUpdate)
    return 0;
  else
    return self->_sleepEventRecord;
}

- (id)cachedSleepEventRecordWithMissHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke;
  v11[3] = &unk_1E4E3B8A0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke_2;
    v10[3] = &unk_1E4E3C9F8;
    v10[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 10))
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    HKSPNullify(*(void **)(v1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __66__HKSPSleepStoreModelCache_cachedSleepEventRecordWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepEventRecord:", v3);

}

- (void)updateCachedSleepEventRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HKSPSleepStoreModelCache_updateCachedSleepEventRecord___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v6);

}

uint64_t __57__HKSPSleepStoreModelCache_updateCachedSleepEventRecord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_updateCachedSleepEventRecord:", *(_QWORD *)(a1 + 40));
}

- (void)_locked_updateCachedSleepEventRecord:(id)a3
{
  HKSPSleepEventRecord *v4;
  HKSPSleepEventRecord *sleepEventRecord;

  v4 = (HKSPSleepEventRecord *)objc_msgSend(a3, "copy");
  sleepEventRecord = self->_sleepEventRecord;
  self->_sleepEventRecord = v4;

  self->_sleepEventRecordNeedsUpdate = 0;
}

- (void)purgeCachedSleepEventRecord
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__HKSPSleepStoreModelCache_purgeCachedSleepEventRecord__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v2);
}

uint64_t __55__HKSPSleepStoreModelCache_purgeCachedSleepEventRecord__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepEventRecord");
}

- (void)_locked_purgeCachedSleepEventRecord
{
  self->_sleepEventRecordNeedsUpdate = 1;
}

- (id)cachedSleepScheduleModelWithMissHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke;
  v11[3] = &unk_1E4E3B8A0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke_2;
    v10[3] = &unk_1E4E3CA20;
    v10[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8) && !*(_BYTE *)(v1 + 9) && !*(_BYTE *)(v1 + 10))
  {
    +[HKSPSleepScheduleModel sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:](HKSPSleepScheduleModel, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D519C0];
    HKSPNullify(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleModelWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepScheduleModel:", v3);

}

- (void)updateCachedSleepScheduleModel:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleModel___block_invoke;
  v6[3] = &unk_1E4E3A760;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v6);

}

void __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sleepSchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_locked_updateCachedSleepSchedule:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sleepSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_locked_updateCachedSleepSettings:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sleepEventRecord");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_locked_updateCachedSleepEventRecord:", v7);

}

- (id)cachedSleepModeWithMissHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke;
  v11[3] = &unk_1E4E3B8A0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke_2;
    v10[3] = &unk_1E4E3ACE0;
    v10[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 12))
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v1 + 56));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    HKSPNullify(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __59__HKSPSleepStoreModelCache_cachedSleepModeWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepMode:", objc_msgSend(v3, "integerValue"));

}

- (void)updateCachedSleepMode:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__HKSPSleepStoreModelCache_updateCachedSleepMode___block_invoke;
  v3[3] = &unk_1E4E3ADA8;
  v3[4] = self;
  v3[5] = a3;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v3);
}

uint64_t __50__HKSPSleepStoreModelCache_updateCachedSleepMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 56) = *(_QWORD *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 12) = 0;
  return result;
}

- (void)purgeCachedSleepMode
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__HKSPSleepStoreModelCache_purgeCachedSleepMode__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v2);
}

uint64_t __48__HKSPSleepStoreModelCache_purgeCachedSleepMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepMode");
}

- (void)_locked_purgeCachedSleepMode
{
  self->_sleepModeNeedsUpdate = 1;
}

- (id)cachedSleepScheduleStateWithMissHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void (**)(_QWORD))a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke;
  v11[3] = &unk_1E4E3B8A0;
  v11[4] = self;
  v11[5] = &v12;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v11);
  v6 = (void *)v13[5];
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke_2;
    v10[3] = &unk_1E4E3ACE0;
    v10[4] = self;
    objc_msgSend(v8, "addSuccessBlock:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 11))
  {
    v3 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v1 + 48));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    HKSPNullify(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "futureWithResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __68__HKSPSleepStoreModelCache_cachedSleepScheduleStateWithMissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  HKSPNilify(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCachedSleepScheduleState:", objc_msgSend(v3, "integerValue"));

}

- (void)updateCachedSleepScheduleState:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleState___block_invoke;
  v3[3] = &unk_1E4E3ADA8;
  v3[4] = self;
  v3[5] = a3;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v3);
}

uint64_t __59__HKSPSleepStoreModelCache_updateCachedSleepScheduleState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 11) = 0;
  return result;
}

- (void)purgeCachedSleepScheduleState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__HKSPSleepStoreModelCache_purgeCachedSleepScheduleState__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v2);
}

uint64_t __57__HKSPSleepStoreModelCache_purgeCachedSleepScheduleState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepScheduleState");
}

- (void)_locked_purgeCachedSleepScheduleState
{
  self->_sleepScheduleStateNeedsUpdate = 1;
}

- (void)purgeCache
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__HKSPSleepStoreModelCache_purgeCache__block_invoke;
  v2[3] = &unk_1E4E3AF48;
  v2[4] = self;
  -[HKSPSleepStoreModelCache _withLock:](self, "_withLock:", v2);
}

uint64_t __38__HKSPSleepStoreModelCache_purgeCache__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSchedule");
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepSettings");
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepEventRecord");
  objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepMode");
  return objc_msgSend(*(id *)(a1 + 32), "_locked_purgeCachedSleepScheduleState");
}

- (os_unfair_lock_s)cacheLock
{
  return self->_cacheLock;
}

- (HKSPSleepSchedule)sleepSchedule
{
  return self->_sleepSchedule;
}

- (BOOL)sleepScheduleNeedsUpdate
{
  return self->_sleepScheduleNeedsUpdate;
}

- (HKSPSleepSettings)sleepSettings
{
  return self->_sleepSettings;
}

- (BOOL)sleepSettingsNeedsUpdate
{
  return self->_sleepSettingsNeedsUpdate;
}

- (HKSPSleepEventRecord)sleepEventRecord
{
  return self->_sleepEventRecord;
}

- (BOOL)sleepEventRecordNeedsUpdate
{
  return self->_sleepEventRecordNeedsUpdate;
}

- (unint64_t)sleepScheduleState
{
  return self->_sleepScheduleState;
}

- (BOOL)sleepScheduleStateNeedsUpdate
{
  return self->_sleepScheduleStateNeedsUpdate;
}

- (int64_t)sleepMode
{
  return self->_sleepMode;
}

- (BOOL)sleepModeNeedsUpdate
{
  return self->_sleepModeNeedsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepEventRecord, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepSchedule, 0);
}

@end
