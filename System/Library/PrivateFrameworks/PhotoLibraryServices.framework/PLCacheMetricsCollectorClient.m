@implementation PLCacheMetricsCollectorClient

- (PLCacheMetricsCollectorClient)initWithAssetsdClient:(id)a3
{
  id v4;
  PLCacheMetricsCollectorClient *v5;
  BOOL v6;
  void *v7;
  xpc_object_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLCacheMetricsCollectorClient *v12;
  NSObject *v14;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLCacheMetricsCollectorClient;
  v5 = -[PLCacheMetricsCollectorClient init](&v16, sel_init);
  if (v5)
    v6 = _sharedRegion == 0;
  else
    v6 = 0;
  if (!v6)
  {
LABEL_12:
    v12 = v5;
    goto LABEL_13;
  }
  v7 = mmap(0, 0x1000uLL, 3, 4097, 1207959552, 0);
  _sharedRegion = (uint64_t)v7;
  if (v7 != (void *)-1)
  {
    v8 = xpc_shmem_create(v7, 0x1000uLL);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73340]), "initWithXPCObject:", v8);
    if (v4)
    {
      objc_msgSend(v4, "resourceAvailabilityClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSharedMemoryForCacheMetricsCollector:", v9);

    }
    PLCacheMetricsCollectorGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "PLCacheMetricsCollectorClient initialized for system Library", v15, 2u);
    }

    goto LABEL_12;
  }
  PLCacheMetricsCollectorGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Unable to allocate shared memory in PLCacheMetricsCollectorClient", v15, 2u);
  }

  v12 = 0;
LABEL_13:

  return v12;
}

- (void)incrementImageCacheHitCount
{
  unsigned int *v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)_sharedRegion;
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  PLCacheMetricsCollectorGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = atomic_load(v2);
    v6 = atomic_load(v2 + 1);
    v7 = atomic_load(v2 + 2);
    v8 = atomic_load(v2 + 3);
    v9 = 134218752;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2048;
    v14 = v7;
    v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "incrementImageCacheHitCount, current stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v9, 0x2Au);
  }

}

- (void)incrementImageCacheMissCount
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)_sharedRegion;
  v3 = (unsigned int *)(_sharedRegion + 4);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + 1, v3));
  PLCacheMetricsCollectorGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = atomic_load(v2);
    v7 = atomic_load(v2 + 1);
    v8 = atomic_load(v2 + 2);
    v9 = atomic_load(v2 + 3);
    v10 = 134218752;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "incrementImageCacheMissCount, current stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v10, 0x2Au);
  }

}

- (void)incrementVideoComplementCacheHitCount
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)_sharedRegion;
  v3 = (unsigned int *)(_sharedRegion + 8);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + 1, v3));
  PLCacheMetricsCollectorGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = atomic_load(v2);
    v7 = atomic_load(v2 + 1);
    v8 = atomic_load(v2 + 2);
    v9 = atomic_load(v2 + 3);
    v10 = 134218752;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "incrementVideoComplementHitCount, current stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v10, 0x2Au);
  }

}

- (void)incrementVideoComplementCacheMissCount
{
  unsigned int *v2;
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)_sharedRegion;
  v3 = (unsigned int *)(_sharedRegion + 12);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + 1, v3));
  PLCacheMetricsCollectorGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = atomic_load(v2);
    v7 = atomic_load(v2 + 1);
    v8 = atomic_load(v2 + 2);
    v9 = atomic_load(v2 + 3);
    v10 = 134218752;
    v11 = v6;
    v12 = 2048;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "incrementVideoComplementMissCount, updated stats: [%ld, %ld, %ld, %ld]", (uint8_t *)&v10, 0x2Au);
  }

}

@end
