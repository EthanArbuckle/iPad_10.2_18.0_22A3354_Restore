@implementation VUINowPlayingObserver

void __49__VUINowPlayingObserver__updateLatestObservation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    MRNowPlayingClientGetBundleIdentifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(id *)(a1 + 40);
    v4 = v3;
    MRMediaRemoteGetPlaybackStateForClient();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __49__VUINowPlayingObserver__updateLatestObservation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7 == objc_msgSend(WeakRetained, "updateObservationContext"))
      objc_msgSend(v6, "_updateLatestObservationWithBundleIdentifier:playbackState:", v8, a3);
  }

}

void __39__VUINowPlayingObserver_startObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isObserving");
    v2 = v4;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "setObserving:", 1);
      objc_msgSend(v4, "_startObserving");
      v2 = v4;
    }
  }

}

- (unint64_t)updateObservationContext
{
  return self->_updateObservationContext;
}

- (void)startObserving
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[VUINowPlayingObserver serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__VUINowPlayingObserver_startObserving__block_invoke;
  v4[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setUpdateObservationContext:(unint64_t)a3
{
  self->_updateObservationContext = a3;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void)setLatestObservation:(id)a3
{
  id v5;
  VUINowPlayingObservation *v6;
  VUINowPlayingObservation *v7;
  BOOL v8;
  VUINowPlayingObservation *v9;

  v5 = a3;
  v6 = self->_latestObservation;
  v7 = (VUINowPlayingObservation *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[VUINowPlayingObservation isEqual:](v6, "isEqual:", v7);

      if (v8)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_latestObservation, a3);
    -[VUINowPlayingObserver _notifyDelegateLatestObservationDidChange:](self, "_notifyDelegateLatestObservationDidChange:", v9);
  }
LABEL_9:

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)serialProcessingDispatchQueue
{
  return self->_serialProcessingDispatchQueue;
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (VUINowPlayingObserver)init
{
  VUINowPlayingObserver *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialProcessingDispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUINowPlayingObserver;
  v2 = -[VUINowPlayingObserver init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.videosui.VUINowPlayingObserver.serialProcessingQueue", 0);
    serialProcessingDispatchQueue = v2->_serialProcessingDispatchQueue;
    v2->_serialProcessingDispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)_updateLatestObservation
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD aBlock[4];
  id v8[2];
  id location;

  v3 = (void *)(-[VUINowPlayingObserver updateObservationContext](self, "updateObservationContext") + 1);
  -[VUINowPlayingObserver setUpdateObservationContext:](self, "setUpdateObservationContext:", v3);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__VUINowPlayingObserver__updateLatestObservation__block_invoke;
  aBlock[3] = &unk_1E9FA1DA0;
  objc_copyWeak(v8, &location);
  v8[1] = v3;
  v4 = _Block_copy(aBlock);
  -[VUINowPlayingObserver serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  MRMediaRemoteGetNowPlayingClient();

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (void)_updateLatestObservationWithBundleIdentifier:(id)a3 playbackState:(unsigned int)a4
{
  uint64_t v5;
  id v6;
  VUINowPlayingObservation *v7;

  if (a3)
  {
    v5 = (a4 < 6) & (0x26u >> a4);
    v6 = a3;
    v7 = -[VUINowPlayingObservation initWithBundleIdentifier:isPlaying:]([VUINowPlayingObservation alloc], "initWithBundleIdentifier:isPlaying:", v6, v5);

  }
  else
  {
    v7 = 0;
  }
  -[VUINowPlayingObserver setLatestObservation:](self, "setLatestObservation:", v7);

}

- (void)_startObserving
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNowPlayingAppDidChangeNotification_, *MEMORY[0x1E0D4C918], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleNowPlayingAppIsPlayingDidChangeNotification_, *MEMORY[0x1E0D4C920], 0);
  MRMediaRemoteSetWantsNowPlayingNotifications();
  -[VUINowPlayingObserver _updateLatestObservation](self, "_updateLatestObservation");

}

- (void)dealloc
{
  objc_super v3;

  -[VUINowPlayingObserver stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)VUINowPlayingObserver;
  -[VUINowPlayingObserver dealloc](&v3, sel_dealloc);
}

- (void)stopObserving
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[VUINowPlayingObserver serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__VUINowPlayingObserver_stopObserving__block_invoke;
  v4[3] = &unk_1E9F99C98;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __38__VUINowPlayingObserver_stopObserving__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isObserving");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "setObserving:", 0);
      objc_msgSend(v4, "_stopObserving");
      v2 = v4;
    }
  }

}

- (VUINowPlayingObservation)latestObservation
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__25;
  v11 = __Block_byref_object_dispose__25;
  v12 = 0;
  -[VUINowPlayingObserver serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__VUINowPlayingObserver_latestObservation__block_invoke;
  v6[3] = &unk_1E9F99D88;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (VUINowPlayingObservation *)v4;
}

void __42__VUINowPlayingObserver_latestObservation__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_handleNowPlayingAppDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUINowPlayingObserver serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__VUINowPlayingObserver__handleNowPlayingAppDidChangeNotification___block_invoke;
  v6[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __67__VUINowPlayingObserver__handleNowPlayingAppDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLatestObservation");

}

- (void)_handleNowPlayingAppIsPlayingDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VUINowPlayingObserver serialProcessingDispatchQueue](self, "serialProcessingDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__VUINowPlayingObserver__handleNowPlayingAppIsPlayingDidChangeNotification___block_invoke;
  v6[3] = &unk_1E9F99C98;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __76__VUINowPlayingObserver__handleNowPlayingAppIsPlayingDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLatestObservation");

}

- (void)_stopObserving
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  MRMediaRemoteSetWantsNowPlayingNotifications();
  -[VUINowPlayingObserver setLatestObservation:](self, "setLatestObservation:", 0);
}

uint64_t __49__VUINowPlayingObserver__updateLatestObservation__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

- (void)_notifyDelegateLatestObservationDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[VUINowPlayingObserver delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__VUINowPlayingObserver__notifyDelegateLatestObservationDidChange___block_invoke;
    v7[3] = &unk_1E9F9C058;
    v8 = v5;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(v6, v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __67__VUINowPlayingObserver__notifyDelegateLatestObservationDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "nowPlayingObserver:latestObservationDidChange:", WeakRetained, *(_QWORD *)(a1 + 40));

}

- (VUINowPlayingObserverDelegate)delegate
{
  return (VUINowPlayingObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSerialProcessingDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialProcessingDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestObservation, 0);
}

@end
