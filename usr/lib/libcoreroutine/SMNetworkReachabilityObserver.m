@implementation SMNetworkReachabilityObserver

- (SMNetworkReachabilityObserver)init
{
  SMNetworkReachabilityObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *observerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMNetworkReachabilityObserver;
  v2 = -[SMNetworkReachabilityObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.routined.SMNetworkReachabilityObserver", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    -[SMNetworkReachabilityObserver _startPathMonitor](v2, "_startPathMonitor");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SMNetworkReachabilityObserver _stopPathMonitor](self, "_stopPathMonitor");
  v3.receiver = self;
  v3.super_class = (Class)SMNetworkReachabilityObserver;
  -[SMNetworkReachabilityObserver dealloc](&v3, sel_dealloc);
}

+ (id)sharedNetworkReachabilityObserver
{
  if (qword_1ED9429A8 != -1)
    dispatch_once(&qword_1ED9429A8, &__block_literal_global_45);
  return (id)_MergedGlobals_98;
}

void __66__SMNetworkReachabilityObserver_sharedNetworkReachabilityObserver__block_invoke()
{
  SMNetworkReachabilityObserver *v0;
  void *v1;

  v0 = objc_alloc_init(SMNetworkReachabilityObserver);
  v1 = (void *)_MergedGlobals_98;
  _MergedGlobals_98 = (uint64_t)v0;

}

- (void)_startPathMonitor
{
  NSObject *pathMonitor;
  OS_nw_path_monitor *v4;
  OS_nw_path_monitor *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  pathMonitor = self->_pathMonitor;
  if (!pathMonitor)
  {
    v4 = (OS_nw_path_monitor *)nw_path_monitor_create();
    v5 = self->_pathMonitor;
    self->_pathMonitor = v4;

    pathMonitor = self->_pathMonitor;
  }
  nw_path_monitor_set_queue(pathMonitor, (dispatch_queue_t)self->_observerQueue);
  objc_initWeak(&location, self);
  v6 = self->_pathMonitor;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SMNetworkReachabilityObserver__startPathMonitor__block_invoke;
  v7[3] = &unk_1E929CEE0;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v6, v7);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__SMNetworkReachabilityObserver__startPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  unsigned __int8 *WeakRetained;
  int v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = (nw_path_get_status(v3) & 0xFFFFFFFD) == 1 && nw_path_has_dns(v3);
    v6 = WeakRetained[24];
    WeakRetained[24] = v5;
    if (v6 != v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v5)
          v8 = CFSTR("YES");
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Network reachability updated, reachable, %@", (uint8_t *)&v9, 0xCu);
      }

    }
  }

}

- (void)_stopPathMonitor
{
  NSObject *pathMonitor;
  OS_nw_path_monitor *v4;

  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    v4 = self->_pathMonitor;
    self->_pathMonitor = 0;

  }
}

- (BOOL)isNetworkReachable
{
  NSObject *observerQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SMNetworkReachabilityObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E929A690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SMNetworkReachabilityObserver_isNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end
