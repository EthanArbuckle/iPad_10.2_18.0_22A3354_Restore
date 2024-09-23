@implementation VKFrameProvider

- (VKFrameProvider)init
{
  VKFrameProvider *v2;
  VKFrameProvider *v3;
  VKFrameProviderConfiguration *v4;
  VKFrameProviderConfiguration *configuration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKFrameProvider;
  v2 = -[VKFrameProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VKFrameProvider _commonInit]((uint64_t)v2);
    v4 = objc_alloc_init(VKFrameProviderConfiguration);
    configuration = v3->_configuration;
    v3->_configuration = v4;

  }
  return v3;
}

- (void)_commonInit
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    *(_DWORD *)(a1 + 8) = 0;
    objc_storeStrong((id *)(a1 + 24), MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v2;

  }
}

- (VKFrameProvider)initWithConfiguration:(id)a3
{
  id v4;
  VKFrameProvider *v5;
  VKFrameProvider *v6;
  VKFrameProviderConfiguration *v7;
  VKFrameProviderConfiguration *configuration;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKFrameProvider;
  v5 = -[VKFrameProvider init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VKFrameProvider _commonInit]((uint64_t)v5);
    if (v4)
      v7 = (VKFrameProviderConfiguration *)objc_msgSend(v4, "copy");
    else
      v7 = objc_alloc_init(VKFrameProviderConfiguration);
    configuration = v6->_configuration;
    v6->_configuration = v7;

  }
  return v6;
}

- (VKFrameProviderConfiguration)configuration
{
  void *v3;

  -[VKFrameProvider lock](self, "lock");
  v3 = (void *)-[VKFrameProviderConfiguration copy](self->_configuration, "copy");
  -[VKFrameProvider unlock](self, "unlock");
  return (VKFrameProviderConfiguration *)v3;
}

- (VKFrameProviderDelegate)delegate
{
  id WeakRetained;

  -[VKFrameProvider lock](self, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[VKFrameProvider unlock](self, "unlock");
  return (VKFrameProviderDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  OS_dispatch_queue *v3;

  -[VKFrameProvider lock](self, "lock");
  v3 = self->_delegateQueue;
  -[VKFrameProvider unlock](self, "unlock");
  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "delegate != ((void *)0)", "-[VKFrameProvider setDelegate:queue:]", 0, 0, CFSTR("Illegal argument. Delegate must not be nil."));
    if (v8)
      goto LABEL_3;
LABEL_5:
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "queue != ((void *)0)", "-[VKFrameProvider setDelegate:queue:]", 0, 0, CFSTR("Illegal argument. Queue must not be nil."));
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__VKFrameProvider_setDelegate_queue___block_invoke;
  v11[3] = &unk_1E9462B08;
  v11[4] = self;
  v12 = v6;
  v13 = v8;
  v9 = v8;
  v10 = v6;
  vk_performWhileLocked(self, v11);

}

uint64_t __37__VKFrameProvider_setDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = objc_opt_respondsToSelector() & 1;
  result = objc_opt_respondsToSelector();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = result & 1;
  return result;
}

- (void)registerProcessor:(id)a3
{
  VKFrameProvider *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v5 && (-[NSMutableArray containsObject:](v4->_processors, "containsObject:", v5) & 1) == 0)
    -[NSMutableArray addObject:](v4->_processors, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterProcessor:(id)a3
{
  VKFrameProvider *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v5 && -[NSMutableArray containsObject:](v4->_processors, "containsObject:", v5))
  {
    -[NSMutableArray removeObject:](v4->_processors, "removeObject:", v5);
    objc_msgSend(v5, "reset");
  }
  objc_sync_exit(v4);

}

- (BOOL)isRunning
{
  return 0;
}

- (BOOL)isProcessing
{
  BOOL processing;

  -[VKFrameProvider lock](self, "lock");
  processing = self->_processing;
  -[VKFrameProvider unlock](self, "unlock");
  return processing;
}

- (void)startProcessing
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__VKFrameProvider_startProcessing__block_invoke;
  v2[3] = &unk_1E94625B8;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __34__VKFrameProvider_startProcessing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 1;
  return result;
}

- (void)stopProcessing
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__VKFrameProvider_stopProcessing__block_invoke;
  v3[3] = &unk_1E94625B8;
  v3[4] = self;
  vk_performWhileLocked(self, v3);
  -[VKFrameProvider resetAllProcessors](self, "resetAllProcessors");
}

uint64_t __33__VKFrameProvider_stopProcessing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 0;
  return result;
}

- (void)resetAllProcessors
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[NSMutableArray copy](self->_processors, "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reset", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (CGRect)regionOfInterest
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[VKFrameProvider lock](self, "lock");
  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  -[VKFrameProvider unlock](self, "unlock");
  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)setRegionOfInterest:(CGRect)a3
{
  _QWORD v3[5];
  CGRect v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VKFrameProvider_setRegionOfInterest___block_invoke;
  v3[3] = &unk_1E9464170;
  v3[4] = self;
  v4 = a3;
  vk_performWhileLocked(self, v3);
}

__n128 __39__VKFrameProvider_setRegionOfInterest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(__n128 *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 56);
  *(__n128 *)(v1 + 80) = result;
  *(_OWORD *)(v1 + 96) = v3;
  return result;
}

- (void)sendFrame:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t sceneStabilityState;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sceneStability");

  sceneStabilityState = self->_sceneStabilityState;
  if (v6 != sceneStabilityState)
  {
    self->_sceneStabilityState = v6;
    -[VKFrameProvider _sendSceneStabilityStateChanged]((uint64_t)self);
  }
  objc_msgSend(v4, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "luminosity");
  v10 = v9;

  if (vabdd_f64(v10, self->_sceneLuminosity) >= 0.01)
  {
    self->_sceneLuminosity = v10;
    -[VKFrameProvider _sendSceneLuminosityChanged]((uint64_t)self);
  }
  if (-[VKFrameProvider isProcessing](self, "isProcessing"))
  {
    v11 = (void *)-[NSMutableArray copy](self->_processors, "copy");
    v12 = v11;
    if (v6 == 1)
    {
      if (sceneStabilityState == 1)
      {
LABEL_24:

        goto LABEL_25;
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "reset");
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v15);
      }
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "enqueueFrame:", v4, (_QWORD)v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v20);
      }
    }

    goto LABEL_24;
  }
LABEL_25:

}

- (void)_sendSceneStabilityStateChanged
{
  int v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6[2];
  id location;

  if (a1)
  {
    objc_msgSend((id)a1, "lock");
    v2 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend((id)a1, "unlock");
    if (v2)
    {
      v3 = *(void **)(a1 + 56);
      objc_initWeak(&location, (id)a1);
      objc_msgSend((id)a1, "delegateQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__VKFrameProvider__sendSceneStabilityStateChanged__block_invoke;
      block[3] = &unk_1E9463B88;
      objc_copyWeak(v6, &location);
      v6[1] = v3;
      dispatch_async(v4, block);

      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_sendSceneLuminosityChanged
{
  int v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6[2];
  id location;

  if (a1)
  {
    objc_msgSend((id)a1, "lock");
    v2 = *(unsigned __int8 *)(a1 + 49);
    objc_msgSend((id)a1, "unlock");
    if (v2)
    {
      v3 = *(void **)(a1 + 64);
      objc_initWeak(&location, (id)a1);
      objc_msgSend((id)a1, "delegateQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__VKFrameProvider__sendSceneLuminosityChanged__block_invoke;
      block[3] = &unk_1E9463B88;
      objc_copyWeak(v6, &location);
      v6[1] = v3;
      dispatch_async(v4, block);

      objc_destroyWeak(v6);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_delegateRespondsToStabilityChanges
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "lock");
  v2 = a1[48] != 0;
  objc_msgSend(a1, "unlock");
  return v2;
}

- (BOOL)_delegateRespondsToLuminosityChanges
{
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "lock");
  v2 = a1[49] != 0;
  objc_msgSend(a1, "unlock");
  return v2;
}

void __50__VKFrameProvider__sendSceneStabilityStateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frameProvider:didChangeSceneStabilityState:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __46__VKFrameProvider__sendSceneLuminosityChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frameProvider:didChangeSceneLuminosity:", v4, *(double *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_processors, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
