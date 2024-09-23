@implementation PLCacheMetricsCollectorServer

- (PLCacheMetricsCollectorServer)initWithXPCObject:(id)a3
{
  id v4;
  PLCacheMetricsCollectorServer *v5;
  PLCacheMetricsCollectorServer *v6;
  size_t v7;
  NSObject *v8;
  NSObject *v9;
  PLCacheMetricsCollectorServer *v10;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLCacheMetricsCollectorServer;
  v5 = -[PLCacheMetricsCollectorServer init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = xpc_shmem_map(v4, &v5->_sharedRegion);
      v6->_bufferSize = v7;
      PLCacheMetricsCollectorGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Successfully mapped server-side buffer", v12, 2u);
        }

        goto LABEL_7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Shmem_map failed in PLCacheMetricsCollectorServer initialization", v12, 2u);
      }

    }
    v10 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v10 = v6;
LABEL_12:

  return v10;
}

- ($5E5F304956FB491AF6F034FDF0808287)getSharedImageRequestCacheMetrics
{
  uint64_t *sharedRegion;
  uint64_t v3;
  uint64_t v4;
  $5E5F304956FB491AF6F034FDF0808287 result;

  sharedRegion = (uint64_t *)self->_sharedRegion;
  v3 = *sharedRegion;
  v4 = sharedRegion[1];
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  PLCacheMetricsCollectorGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCacheMetricsCollectorServer Deallocated on assetsd", buf, 2u);
  }

  munmap(self->_sharedRegion, self->_bufferSize);
  v4.receiver = self;
  v4.super_class = (Class)PLCacheMetricsCollectorServer;
  -[PLCacheMetricsCollectorServer dealloc](&v4, sel_dealloc);
}

@end
