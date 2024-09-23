@implementation SASCallRouteObserver

- (SASCallRouteObserver)init
{
  SASCallRouteObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SASCallRouteObserver;
  v2 = -[SASCallRouteObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SASCallRouteObserverQueue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isCallAudioRouteAllowed = objc_msgSend(MEMORY[0x1E0CFE8B8], "isBlushingPhantomEnabled") ^ 1;
  }
  return v2;
}

- (void)startObserving
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SASCallRouteObserver startObserving]";
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ((objc_msgSend(MEMORY[0x1E0CFE8B8], "isBlushingPhantomEnabled") & 1) != 0)
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0DBD1C8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__SASCallRouteObserver_startObserving__block_invoke;
    block[3] = &unk_1E91FBE70;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v7 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SASCallRouteObserver startObserving]";
      _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s SIC not enabled, not observing call route", buf, 0xCu);
    }
  }
}

void __38__SASCallRouteObserver_startObserving__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C8], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "routeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "addDelegate:", WeakRetained);
    objc_msgSend(v2, "pickedRoute");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateCallAudioRouteAllowedForRoute:", v3);

  }
}

- (void)stopObserving
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SASCallRouteObserver stopObserving]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x1E0CFE8B8], "isBlushingPhantomEnabled"))
  {
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0DBD1C8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SASCallRouteObserver_stopObserving__block_invoke;
    block[3] = &unk_1E91FBE70;
    objc_copyWeak(&v7, (id *)buf);
    dispatch_async(v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __37__SASCallRouteObserver_stopObserving__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DBD1C8], "sharedInstance");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "routeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "removeDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "_updateCallAudioRouteAllowedForRoute:", 0);

  }
}

- (void)routesChangedForRouteController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0DBD1C8];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "pickedRoute");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:](self, "_updateCallAudioRouteAllowedForRoute:", v8);
}

- (void)_updateCallAudioRouteAllowedForRoute:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SASCallRouteObserver__updateCallAudioRouteAllowedForRoute___block_invoke;
  block[3] = &unk_1E91FBF68;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__SASCallRouteObserver__updateCallAudioRouteAllowedForRoute___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (((objc_msgSend(*(id *)(a1 + 32), "isSpeaker") & 1) != 0
       || objc_msgSend(*(id *)(a1 + 32), "isReceiver"))
      && MEMORY[0x1D17E66FC]())
    {
      v3 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:]_block_invoke";
        _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_DEFAULT, "%s built-in route in-call with echo cancellation", buf, 0xCu);
      }
      v4 = 1;
      v5 = 1;
      if ((objc_msgSend(WeakRetained, "isCallAudioRouteAllowed") & 1) != 0)
        goto LABEL_28;
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "isBluetooth")
           && objc_msgSend(*(id *)(a1 + 32), "bluetoothEndpointType") == 1)
    {
      objc_msgSend(MEMORY[0x1E0D48558], "sharedAVSystemController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pickableRoutesForCategory:andMode:", *MEMORY[0x1E0CFEB78], CFSTR("SpeechRecognition"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = v7;
      v5 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v5)
      {
        v9 = *(_QWORD *)v20;
        v10 = (_QWORD *)MEMORY[0x1E0D481C0];
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKeyedSubscript:", *v10, (_QWORD)v19);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "BOOLValue");

            if (v14)
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D48150]);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v5 = v15 != 0;

              goto LABEL_23;
            }
          }
          v5 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_23:

      v16 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:]_block_invoke";
        v25 = 1024;
        v26 = v5;
        _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s bluetooth route in-call, supportsDoAP=%i", buf, 0x12u);
      }
      v4 = v5;

      if ((_DWORD)v5 == objc_msgSend(WeakRetained, "isCallAudioRouteAllowed"))
        goto LABEL_28;
    }
    else
    {
      v4 = 0;
      v5 = 0;
      if ((objc_msgSend(WeakRetained, "isCallAudioRouteAllowed") & 1) == 0)
      {
LABEL_28:
        objc_msgSend(WeakRetained, "setIsCallAudioRouteAllowed:", v5, (_QWORD)v19);
        goto LABEL_29;
      }
    }
    v17 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v24 = "-[SASCallRouteObserver _updateCallAudioRouteAllowedForRoute:]_block_invoke";
      v25 = 1024;
      v26 = v4;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1D132F000, v17, OS_LOG_TYPE_DEFAULT, "%s Updating isCallAudioRouteAllowed: %i for route %@", buf, 0x1Cu);
    }
    goto LABEL_28;
  }
LABEL_29:

}

- (BOOL)isCallAudioRouteAllowed
{
  return self->_isCallAudioRouteAllowed;
}

- (void)setIsCallAudioRouteAllowed:(BOOL)a3
{
  self->_isCallAudioRouteAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
