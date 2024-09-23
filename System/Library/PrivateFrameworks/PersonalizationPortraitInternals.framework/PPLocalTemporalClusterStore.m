@implementation PPLocalTemporalClusterStore

- (PPLocalTemporalClusterStore)initWithStorage:(id)a3
{
  id v5;
  PPLocalTemporalClusterStore *v6;
  PPLocalTemporalClusterStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPLocalTemporalClusterStore;
  v6 = -[PPLocalTemporalClusterStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storage, a3);

  return v7;
}

- (PPLocalTemporalClusterStore)init
{
  void *v3;
  PPLocalTemporalClusterStore *v4;

  +[PPTemporalClusterStorage defaultStorage](PPTemporalClusterStorage, "defaultStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[PPLocalTemporalClusterStore initWithStorage:](self, "initWithStorage:", v3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)rankedTemporalClusterForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  return -[PPTemporalClusterStorage rankedTemporalClusterForStartDate:endDate:error:](self->_storage, "rankedTemporalClusterForStartDate:endDate:error:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

+ (id)defaultStore
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  pthread_mutex_lock(&defaultStore_lock_18711);
  if (!defaultStore_instance_18712)
  {
    v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_18712;
    defaultStore_instance_18712 = v2;

    if (!defaultStore_instance_18712)
    {
      pp_temporal_clusters_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPLocalTemporalClusterStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }

    }
  }
  v5 = (id)defaultStore_instance_18712;
  pthread_mutex_unlock(&defaultStore_lock_18711);
  return v5;
}

@end
