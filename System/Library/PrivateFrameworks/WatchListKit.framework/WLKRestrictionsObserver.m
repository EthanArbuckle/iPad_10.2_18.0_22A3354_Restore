@implementation WLKRestrictionsObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_18);
  return (id)sharedObserver__observer;
}

void __41__WLKRestrictionsObserver_sharedObserver__block_invoke()
{
  WLKRestrictionsObserver *v0;
  void *v1;

  v0 = objc_alloc_init(WLKRestrictionsObserver);
  v1 = (void *)sharedObserver__observer;
  sharedObserver__observer = (uint64_t)v0;

}

- (WLKRestrictionsObserver)init
{
  WLKRestrictionsObserver *v2;
  uint64_t v3;
  NSNumber *TVRanking;
  uint64_t v5;
  NSNumber *movieRanking;
  WLKDebouncingQueue *v7;
  WLKDebouncingQueue *debounceQueue;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WLKRestrictionsObserver;
  v2 = -[WLKRestrictionsObserver init](&v11, sel_init);
  if (v2)
  {
    WLKRestrictionsMaximumEffectiveTVShowRanking();
    v3 = objc_claimAutoreleasedReturnValue();
    TVRanking = v2->_TVRanking;
    v2->_TVRanking = (NSNumber *)v3;

    WLKRestrictionsMaximumEffectiveMovieRanking();
    v5 = objc_claimAutoreleasedReturnValue();
    movieRanking = v2->_movieRanking;
    v2->_movieRanking = (NSNumber *)v5;

    v7 = objc_alloc_init(WLKDebouncingQueue);
    debounceQueue = v2->_debounceQueue;
    v2->_debounceQueue = v7;

    -[WLKDebouncingQueue setDelay:](v2->_debounceQueue, "setDelay:", 500000);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WLKRestrictionsObserver;
  -[WLKRestrictionsObserver dealloc](&v4, sel_dealloc);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  WLKDebouncingQueue *debounceQueue;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  debounceQueue = self->_debounceQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__WLKRestrictionsObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke;
  v9[3] = &unk_1E68A7FC0;
  objc_copyWeak(&v10, &location);
  -[WLKDebouncingQueue addOperationWithBlock:](debounceQueue, "addOperationWithBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __94__WLKRestrictionsObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateRestrictionsChange");

}

- (void)_evaluateRestrictionsChange
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSNumber *TVRanking;
  NSNumber *movieRanking;
  NSNumber *v8;
  NSNumber *v9;
  NSNumber *v10;
  NSNumber *v11;
  int v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  char v16;
  NSObject *v17;
  NSNumber *v18;
  NSNumber *v19;
  int v20;
  NSNumber *v21;
  __int16 v22;
  NSNumber *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WLKRestrictionsMaximumEffectiveTVShowRanking();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WLKRestrictionsMaximumEffectiveMovieRanking();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    TVRanking = self->_TVRanking;
    movieRanking = self->_movieRanking;
    v20 = 138412546;
    v21 = TVRanking;
    v22 = 2112;
    v23 = movieRanking;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKRestrictionsObserver - current: %@-%@", (uint8_t *)&v20, 0x16u);
  }

  v8 = self->_TVRanking;
  v9 = v3;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {
      v14 = v9;
LABEL_15:

LABEL_16:
      objc_storeStrong((id *)&self->_TVRanking, v3);
      objc_storeStrong((id *)&self->_movieRanking, v4);
      WLKSystemLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_TVRanking;
        v19 = self->_movieRanking;
        v20 = 138412546;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKRestrictionsObserver - new: %@-%@; posting notification",
          (uint8_t *)&v20,
          0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      -[NSNumber postNotificationName:object:userInfo:](v14, "postNotificationName:object:userInfo:", CFSTR("WLKRestrictionsDidChangeNotification"), self, 0);
      goto LABEL_20;
    }
    v12 = -[NSNumber isEqual:](v9, "isEqual:", v10);

    if (!v12)
      goto LABEL_16;
  }
  v13 = self->_movieRanking;
  v14 = v4;
  v15 = v13;
  if (v14 != v15)
  {
    v11 = v15;
    if (v14 && v15)
    {
      v16 = -[NSNumber isEqual:](v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
        goto LABEL_21;
      goto LABEL_16;
    }
    goto LABEL_15;
  }

LABEL_20:
LABEL_21:

}

- (NSNumber)TVRanking
{
  return self->_TVRanking;
}

- (void)setTVRanking:(id)a3
{
  objc_storeStrong((id *)&self->_TVRanking, a3);
}

- (NSNumber)movieRanking
{
  return self->_movieRanking;
}

- (void)setMovieRanking:(id)a3
{
  objc_storeStrong((id *)&self->_movieRanking, a3);
}

- (WLKDebouncingQueue)debounceQueue
{
  return self->_debounceQueue;
}

- (void)setDebounceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_debounceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debounceQueue, 0);
  objc_storeStrong((id *)&self->_movieRanking, 0);
  objc_storeStrong((id *)&self->_TVRanking, 0);
}

@end
