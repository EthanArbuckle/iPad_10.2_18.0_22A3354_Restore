@implementation MDARSessionObserver

- (MDARSessionObserver)initWithObserver:(ARSessionObserver *)a3 onQueue:(id)a4
{
  id v7;
  MDARSessionObserver *v8;
  MDARSessionObserver *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MDARSessionObserver;
  v8 = -[MDARSessionObserver init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_observer = a3;
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
  }

  return v9;
}

- (void)setSession:(id)a3
{
  id v4;
  ARSession **p_session;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  OS_dispatch_queue *delegateQueue;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_session = &self->_session;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained != v4)
  {
    v7 = objc_loadWeakRetained((id *)&self->_session);

    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)&self->_session);
      objc_msgSend(v8, "setDelegate:", 0);

      v9 = objc_loadWeakRetained((id *)&self->_session);
      objc_msgSend(v9, "setDelegateQueue:", 0);

      if (GEOGetVectorKitARSessionObserverLog(void)::onceToken[0] != -1)
        dispatch_once(GEOGetVectorKitARSessionObserverLog(void)::onceToken, &__block_literal_global_35893);
      v10 = (void *)GEOGetVectorKitARSessionObserverLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitARSessionObserverLog(void)::log, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        v12 = objc_loadWeakRetained((id *)&self->_session);
        v20 = 134217984;
        v21 = v12;
        _os_log_impl(&dword_19F029000, v11, OS_LOG_TYPE_INFO, "Did stop observing session:%p", (uint8_t *)&v20, 0xCu);

      }
    }
    v13 = objc_storeWeak((id *)&self->_session, v4);

    if (v4)
    {
      v14 = objc_loadWeakRetained((id *)&self->_session);
      objc_msgSend(v14, "setDelegate:", self);

      delegateQueue = self->_delegateQueue;
      v16 = objc_loadWeakRetained((id *)&self->_session);
      objc_msgSend(v16, "setDelegateQueue:", delegateQueue);

      if (GEOGetVectorKitARSessionObserverLog(void)::onceToken[0] != -1)
        dispatch_once(GEOGetVectorKitARSessionObserverLog(void)::onceToken, &__block_literal_global_35893);
      v17 = (void *)GEOGetVectorKitARSessionObserverLog(void)::log;
      if (os_log_type_enabled((os_log_t)GEOGetVectorKitARSessionObserverLog(void)::log, OS_LOG_TYPE_INFO))
      {
        v18 = v17;
        v19 = objc_loadWeakRetained((id *)p_session);
        v20 = 134217984;
        v21 = v19;
        _os_log_impl(&dword_19F029000, v18, OS_LOG_TYPE_INFO, "Did start observing session:%p", (uint8_t *)&v20, 0xCu);

      }
    }
  }

}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
  id v6;
  ARSessionObserver *observer;
  id v8;

  v8 = a3;
  v6 = a4;
  observer = self->_observer;
  if (observer)
    (*((void (**)(ARSessionObserver *, id, id))observer->var0 + 2))(observer, v8, v6);

}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  ARSessionObserver *observer;
  id v6;

  v6 = a3;
  observer = self->_observer;
  if (observer)
    (*(void (**)(ARSessionObserver *, id))observer->var0)(observer, v6);

}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  ARSessionObserver *observer;
  id WeakRetained;

  observer = self->_observer;
  if (observer)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    (*((void (**)(ARSessionObserver *))observer->var0 + 1))(observer);

  }
}

- (ARSessionObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(ARSessionObserver *)a3
{
  self->_observer = a3;
}

- (ARSession)session
{
  return (ARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end
