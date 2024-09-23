@implementation RegionalResourceObserver

void __53__RegionalResourceObserver_initWithResourceProvider___block_invoke(uint64_t a1)
{
  char *WeakRetained;
  std::mutex *v2;
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  char *v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (std::mutex *)(WeakRetained + 16);
    v11 = WeakRetained;
    std::mutex::lock((std::mutex *)(WeakRetained + 16));
    v3 = *((_QWORD *)v11 + 1);
    if (v3)
    {
      std::mutex::lock((std::mutex *)(v3 + 112));
      if (GEOGetVectorKitVKGeoResourceProviderLog(void)::onceToken != -1)
        dispatch_once(&GEOGetVectorKitVKGeoResourceProviderLog(void)::onceToken, &__block_literal_global_78);
      v4 = GEOGetVectorKitVKGeoResourceProviderLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKGeoResourceProviderLog(void)::log, OS_LOG_TYPE_INFO))
      {
        v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v3 + 328) - *(_QWORD *)(v3 + 320)) >> 3);
        *(_DWORD *)buf = 134217984;
        v13 = v5;
        _os_log_impl(&dword_19F029000, v4, OS_LOG_TYPE_INFO, "Received onRegionalResourceUpdate - clearing cached resource names (count:%lu)", buf, 0xCu);
      }
      v6 = *(_QWORD *)(v3 + 320);
      for (i = *(_QWORD *)(v3 + 328); i != v6; i -= 24)
      {
        v8 = *(std::__shared_weak_count **)(i - 8);
        if (v8)
        {
          p_shared_owners = (unint64_t *)&v8->__shared_owners_;
          do
            v10 = __ldaxr(p_shared_owners);
          while (__stlxr(v10 - 1, p_shared_owners));
          if (!v10)
          {
            ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
            std::__shared_weak_count::__release_weak(v8);
          }
        }
      }
      *(_QWORD *)(v3 + 328) = v6;
      grl::ResourceProvider::clearResourceNamesCache((grl::ResourceProvider *)v3);
      std::mutex::unlock((std::mutex *)(v3 + 112));
    }
    std::mutex::unlock(v2);
    WeakRetained = v11;
  }

}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  return self;
}

- (RegionalResourceObserver)initWithResourceProvider:(void *)a3
{
  RegionalResourceObserver *v4;
  RegionalResourceObserver *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RegionalResourceObserver;
  v4 = -[RegionalResourceObserver init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 1) = a3;
    objc_initWeak(&location, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__RegionalResourceObserver_initWithResourceProvider___block_invoke;
    v10[3] = &unk_1E42F4408;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("GEOTileLoaderDidUpdateRegionalResourcesNotification"), 0, 0, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)clearProvider
{
  std::mutex *v3;
  id v4;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  *((_QWORD *)self + 1) = 0;
  std::mutex::unlock(v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", *((_QWORD *)self + 10));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 10, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
}

@end
