@implementation PGManagerWorkingContext

- (PGManagerWorkingContext)initWithManager:(id)a3 loggingConnection:(id)a4
{
  id v6;
  id v7;
  PGManagerWorkingContext *v8;
  PGManagerWorkingContext *v9;
  uint64_t v10;
  CPAnalytics *analytics;
  uint64_t v12;
  CLSLocationCache *locationCache;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGManagerWorkingContext;
  v8 = -[PGManagerWorkingContext init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    objc_storeStrong((id *)&v9->_loggingConnection, a4);
    objc_msgSend(v6, "analytics");
    v10 = objc_claimAutoreleasedReturnValue();
    analytics = v9->_analytics;
    v9->_analytics = (CPAnalytics *)v10;

    objc_msgSend(v6, "locationCache");
    v12 = objc_claimAutoreleasedReturnValue();
    locationCache = v9->_locationCache;
    v9->_locationCache = (CLSLocationCache *)v12;

  }
  return v9;
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHPhotoLibrary *)v3;
}

- (PGCurationManager)curationManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "curationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGCurationManager *)v3;
}

- (CLSServiceManager)serviceManager
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "serviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSServiceManager *)v3;
}

- (BOOL)isGraphReady
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  v3 = objc_msgSend(WeakRetained, "isReady");

  return v3;
}

- (void)performSynchronousConcurrentGraphReadUsingBlock:(id)a3
{
  PGManager **p_manager;
  id v4;
  id WeakRetained;

  p_manager = &self->_manager;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manager);
  objc_msgSend(WeakRetained, "performSynchronousConcurrentGraphReadUsingBlock:", v4);

}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (CPAnalytics)analytics
{
  return (CPAnalytics *)objc_getProperty(self, a2, 24, 1);
}

- (CLSLocationCache)locationCache
{
  return (CLSLocationCache *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_manager);
}

- (id)musicCuratorContextWithRecentlyUsedSongAdamIDs:(id)a3 error:(id *)a4
{
  PGManager **p_manager;
  id v6;
  id WeakRetained;
  void *v8;

  p_manager = &self->_manager;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manager);
  objc_msgSend(WeakRetained, "musicCuratorContextWithRecentlyUsedSongAdamIDs:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)musicCuratorContextWithCurationOptions:(id)a3 error:(id *)a4
{
  PGManager **p_manager;
  id v6;
  id WeakRetained;
  void *v8;

  p_manager = &self->_manager;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manager);
  objc_msgSend(WeakRetained, "musicCuratorContextWithCurationOptions:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
