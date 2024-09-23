@implementation PXGHostingController

- (PXGHostingController)initWithClientQueue:(id)a3 layoutQueue:(id)a4
{
  return -[PXGHostingController initWithClientQueue:layoutQueue:initialConfiguration:](self, "initWithClientQueue:layoutQueue:initialConfiguration:", a3, a4, &__block_literal_global_3_285764);
}

- (PXGHostingController)initWithClientQueue:(id)a3 layoutQueue:(id)a4 initialConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXGHostingController *v12;
  PXGHostingController *v13;
  PXGConcreteEngineControllerConfiguration *v14;
  PXGConcreteEngineControllerConfiguration *clientQueue_configuration;
  uint64_t v16;
  NSHashTable *clientQueue_activePresenters;
  uint64_t v18;
  PXGConcreteEngineControllerConfiguration *layoutQueue_configuration;
  uint64_t v20;
  NSHashTable *lock_observers;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PXGHostingController;
  v12 = -[PXGHostingController init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientQueue, a3);
    objc_storeStrong((id *)&v13->_layoutQueue, a4);
    v14 = objc_alloc_init(PXGConcreteEngineControllerConfiguration);
    clientQueue_configuration = v13->_clientQueue_configuration;
    v13->_clientQueue_configuration = v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    clientQueue_activePresenters = v13->_clientQueue_activePresenters;
    v13->_clientQueue_activePresenters = (NSHashTable *)v16;

    v18 = -[PXGConcreteEngineControllerConfiguration copy](v13->_clientQueue_configuration, "copy");
    layoutQueue_configuration = v13->_layoutQueue_configuration;
    v13->_layoutQueue_configuration = (PXGConcreteEngineControllerConfiguration *)v18;

    v13->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    lock_observers = v13->_lock_observers;
    v13->_lock_observers = (NSHashTable *)v20;

    -[PXGHostingController performChanges:](v13, "performChanges:", v11);
    objc_initWeak(&location, v13);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __77__PXGHostingController_initWithClientQueue_layoutQueue_initialConfiguration___block_invoke;
    v23[3] = &unk_1E5148D30;
    objc_copyWeak(&v24, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (PXGHostingController)init
{
  void *v3;
  PXGHostingController *v4;

  +[PXGHostingController sharedQueue](PXGHostingController, "sharedQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGHostingController initWithClientQueue:layoutQueue:](self, "initWithClientQueue:layoutQueue:", MEMORY[0x1E0C80D38], v3);

  return v4;
}

- (void)_mainQueue_initialize
{
  PXApplicationState *v3;
  PXApplicationState *mainQueue_applicationState;

  +[PXApplicationState sharedState](PXApplicationState, "sharedState");
  v3 = (PXApplicationState *)objc_claimAutoreleasedReturnValue();
  mainQueue_applicationState = self->_mainQueue_applicationState;
  self->_mainQueue_applicationState = v3;

  -[PXApplicationState registerChangeObserver:context:](self->_mainQueue_applicationState, "registerChangeObserver:context:", self, ApplicationStateObservationContext_285662);
  -[PXGHostingController _mainQueue_updateIsAppInactive](self, "_mainQueue_updateIsAppInactive");
}

- (void)_mainQueue_updateIsAppInactive
{
  void *v3;
  BOOL v4;
  NSObject *layoutQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  -[PXGHostingController mainQueue_applicationState](self, "mainQueue_applicationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "visibilityState") != 1;

  objc_initWeak(&location, self);
  layoutQueue = self->_layoutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PXGHostingController__mainQueue_updateIsAppInactive__block_invoke;
  block[3] = &unk_1E5145760;
  objc_copyWeak(&v7, &location);
  v8 = v4;
  dispatch_async(layoutQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  PXGEngine *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[4];
  OS_dispatch_queue *v8;
  PXGEngine *v9;

  v3 = self->_layoutQueue_engine;
  v4 = self->_layoutQueue;
  v5 = v4;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__PXGHostingController_dealloc__block_invoke;
    block[3] = &unk_1E5148D08;
    v8 = v4;
    v9 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PXGHostingController;
  -[PXGHostingController dealloc](&v6, sel_dealloc);
}

- (id)addPresenter
{
  PXGConcreteHostingControllerPresenter *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = objc_alloc_init(PXGConcreteHostingControllerPresenter);
  -[NSHashTable addObject:](self->_clientQueue_activePresenters, "addObject:", v3);
  -[PXGConcreteHostingControllerPresenter setHostingController:](v3, "setHostingController:", self);
  -[PXGHostingController _notePresentersDidChange](self, "_notePresentersDidChange");
  return v3;
}

- (NSArray)presenters
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[NSHashTable allObjects](self->_clientQueue_activePresenters, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)clientQueue_presenterDidChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  -[PXGHostingController _notePresentersDidChange](self, "_notePresentersDidChange");
}

- (void)_notePresentersDidChange
{
  void (**v2)(void);
  void (**v3)(void);

  -[PXGHostingController onPresentersDidChange](self, "onPresentersDidChange");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)performChanges:(id)a3
{
  NSObject *clientQueue;
  void (**v5)(id, PXGConcreteEngineControllerConfiguration *);
  _BOOL4 clientQueue_isPerformingChanges;
  int64_t v7;
  int64_t v8;

  clientQueue = self->_clientQueue;
  v5 = (void (**)(id, PXGConcreteEngineControllerConfiguration *))a3;
  dispatch_assert_queue_V2(clientQueue);
  clientQueue_isPerformingChanges = self->_clientQueue_isPerformingChanges;
  self->_clientQueue_isPerformingChanges = 1;
  v7 = -[PXGConcreteEngineControllerConfiguration version](self->_clientQueue_configuration, "version");
  v5[2](v5, self->_clientQueue_configuration);

  v8 = -[PXGConcreteEngineControllerConfiguration version](self->_clientQueue_configuration, "version");
  self->_clientQueue_isPerformingChanges = clientQueue_isPerformingChanges;
  if (!clientQueue_isPerformingChanges && v7 != v8)
    -[PXGHostingController _clientQueue_propagateConfigurationToEngine](self, "_clientQueue_propagateConfigurationToEngine");
}

- (PXGRenderFrame)lastFrame
{
  os_unfair_lock_s *p_lock;
  PXGRenderFrame *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_lastFrame;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)registerFrameObserver:(id)a3
{
  PXGRenderFrame *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v7);
  v4 = self->_lock_lastFrame;
  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v7, "hostingControllerObservationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != (void *)MEMORY[0x1E0C80D38];

  }
  else
  {
    v6 = 1;
  }
  -[PXGHostingController _dispatchFrame:async:toObserver:](self, "_dispatchFrame:async:toObserver:", v4, v6, v7);

}

- (void)unregisterFrameObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_distributeFrame:(id)a3
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_lastFrame, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_lock_observers;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[PXGHostingController _dispatchFrame:async:toObserver:](self, "_dispatchFrame:async:toObserver:", v5, 1, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_dispatchFrame:(id)a3 async:(BOOL)a4 toObserver:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD aBlock[4];
  id v16;
  PXGHostingController *v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXGHostingController__dispatchFrame_async_toObserver___block_invoke;
    aBlock[3] = &unk_1E51457C8;
    v11 = v9;
    v16 = v11;
    v17 = self;
    v18 = v8;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v6)
    {
      objc_msgSend(v11, "hostingControllerObservationQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v14, v13);

    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }

  }
}

- (void)_clientQueue_propagateConfigurationToEngine
{
  void *v3;
  void *v4;
  NSObject *layoutQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v3 = (void *)-[PXGConcreteEngineControllerConfiguration copy](self->_clientQueue_configuration, "copy");
  -[PXGConcreteEngineControllerConfiguration rootLayoutPromise](self->_clientQueue_configuration, "rootLayoutPromise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PXGConcreteEngineControllerConfiguration setRootLayoutPromise:](self->_clientQueue_configuration, "setRootLayoutPromise:", 0);
  objc_initWeak(&location, self);
  layoutQueue = self->_layoutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXGHostingController__clientQueue_propagateConfigurationToEngine__block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v9, &location);
  v8 = v3;
  v6 = v3;
  dispatch_async(layoutQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setLayoutQueue_configuration:(id)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  id layoutQueue_pendingRootLayoutPromise;
  id v9;

  v9 = a3;
  v5 = -[PXGConcreteEngineControllerConfiguration version](self->_layoutQueue_configuration, "version");
  if (v5 != objc_msgSend(v9, "version"))
  {
    objc_msgSend(v9, "rootLayoutPromise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v9, "rootLayoutPromise");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      layoutQueue_pendingRootLayoutPromise = self->_layoutQueue_pendingRootLayoutPromise;
      self->_layoutQueue_pendingRootLayoutPromise = v7;

      objc_msgSend(v9, "setRootLayoutPromise:", 0);
    }
    objc_storeStrong((id *)&self->_layoutQueue_configuration, a3);
    -[PXGHostingController _layoutQueue_applyConfiguration](self, "_layoutQueue_applyConfiguration");
  }

}

- (void)setLayoutQueue_isAppInactive:(BOOL)a3
{
  if (self->_layoutQueue_isAppInactive != a3)
  {
    self->_layoutQueue_isAppInactive = a3;
    -[PXGHostingController _layoutQueue_applyConfiguration](self, "_layoutQueue_applyConfiguration");
  }
}

- (void)_layoutQueue_applyConfiguration
{
  PXGConcreteEngineControllerConfiguration *v3;
  PXGEngine *v4;
  void (**layoutQueue_pendingRootLayoutPromise)(void);
  PXGLayout *v6;
  PXGLayout *layoutQueue_placeholderLayout;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  PXGAsyncScrollController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  PXGHostingControllerProposedSize *v28;
  PXGHostingControllerProposedSize *v29;
  PXGHostingControllerProposedSize *layoutQueue_pendingProposedSize;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  PXGHostingControllerProposedSize *v34;
  PXGHostingControllerProposedSize *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  uint64_t v44;
  int v45;
  PXGHostingController *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;
  CGSize v52;

  v51 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  -[PXGHostingController _layoutQueue_performInitialEngineSetupIfNeeded](self, "_layoutQueue_performInitialEngineSetupIfNeeded");
  v3 = self->_layoutQueue_configuration;
  v4 = self->_layoutQueue_engine;
  if (v4)
  {
    layoutQueue_pendingRootLayoutPromise = (void (**)(void))self->_layoutQueue_pendingRootLayoutPromise;
    if (layoutQueue_pendingRootLayoutPromise)
    {
      layoutQueue_pendingRootLayoutPromise[2]();
      v6 = (PXGLayout *)objc_claimAutoreleasedReturnValue();
      layoutQueue_placeholderLayout = v6;
      if (!v6)
        layoutQueue_placeholderLayout = self->_layoutQueue_placeholderLayout;
      -[PXGEngine setLayout:](v4, "setLayout:", layoutQueue_placeholderLayout);

      v8 = self->_layoutQueue_pendingRootLayoutPromise;
      self->_layoutQueue_pendingRootLayoutPromise = 0;

      -[PXGEngine layout](v4, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
      objc_msgSend(v9, "hostingControllerDidChangeReferenceSize:");

    }
    -[PXGConcreteEngineControllerConfiguration viewEnvironment](v3, "viewEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGEngine setViewEnvironment:](v4, "setViewEnvironment:", v10);

    -[PXGEngine setVisible:](v4, "setVisible:", -[PXGConcreteEngineControllerConfiguration isVisible](v3, "isVisible"));
    -[PXGConcreteEngineControllerConfiguration backgroundColor](v3, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGPixelBufferMetalRenderDestination setBackgroundColor:](self->_layoutQueue_renderDestination, "setBackgroundColor:", v11);

    -[PXGConcreteEngineControllerConfiguration displayScale](v3, "displayScale");
    if (v12 == 0.0)
      v12 = 1.0;
    -[PXGPixelBufferMetalRenderDestination setScale:](self->_layoutQueue_renderDestination, "setScale:", v12);
    -[PXGEngine layout](v4, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGConcreteEngineControllerConfiguration displayScale](v3, "displayScale");
    objc_msgSend(v13, "setDisplayScale:");
    v14 = self->_layoutQueue_scrollController;
    -[PXGAsyncScrollController referenceSize](v14, "referenceSize");
    v16 = v15;
    v18 = v17;
    -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
    v21 = v18 == v20 && v16 == v19;
    if (v21
      && (-[PXGPixelBufferMetalRenderDestination renderSize](self->_layoutQueue_renderDestination, "renderSize"),
          v23 = v22,
          v25 = v24,
          -[PXGConcreteEngineControllerConfiguration pixelSize](v3, "pixelSize"),
          v23 == v27)
      && v25 == v26)
    {
      objc_msgSend(v13, "hostingControllerCanceledPreviouslyProposedReferenceSize");
    }
    else
    {
      v28 = [PXGHostingControllerProposedSize alloc];
      -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
      v29 = -[PXGHostingControllerProposedSize initWithReferenceSize:hostingController:](v28, "initWithReferenceSize:hostingController:", self);
      layoutQueue_pendingProposedSize = self->_layoutQueue_pendingProposedSize;
      self->_layoutQueue_pendingProposedSize = v29;

      PXGTungstenGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
        NSStringFromCGSize(v52);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGConcreteEngineControllerConfiguration displayScale](v3, "displayScale");
        v45 = 138412802;
        v46 = self;
        v47 = 2112;
        v48 = v32;
        v49 = 2048;
        v50 = v33;
        _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEBUG, "PXGHostingController:%@ proposeSize:%@ displayScale:%.2f", (uint8_t *)&v45, 0x20u);

      }
      -[PXGAsyncScrollController referenceSize](v14, "referenceSize");
      if ((v21 | PXSizeIsEmpty()) == 1)
      {
        -[PXGHostingControllerProposedSize accept](self->_layoutQueue_pendingProposedSize, "accept");
        objc_msgSend(v13, "hostingControllerCanceledPreviouslyProposedReferenceSize");
        v34 = self->_layoutQueue_pendingProposedSize;
        self->_layoutQueue_pendingProposedSize = 0;

      }
      else
      {
        objc_msgSend(v13, "hostingControllerProposedReferenceSize:", self->_layoutQueue_pendingProposedSize);
      }
      v35 = self->_layoutQueue_pendingProposedSize;
      self->_layoutQueue_pendingProposedSizeWasDelayed = v35 != 0;
      -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
      v37 = v36;
      -[PXGAsyncScrollController referenceSize](v14, "referenceSize");
      if (v35 && v37 > v38 * 3.0)
      {
        -[PXGAsyncScrollController referenceSize](v14, "referenceSize");
        PXSizeGetAspectRatio();
        v40 = v39;
        v41 = -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
        MEMORY[0x1A85CD660](v41, v40, v42, v43);
        -[PXGHostingController layoutQueue_applySize:](self, "layoutQueue_applySize:");
      }
    }
    v44 = !-[PXGHostingController layoutQueue_isAppInactive](self, "layoutQueue_isAppInactive")
       && -[PXGConcreteEngineControllerConfiguration isVisible](v3, "isVisible");
    -[PXGAsyncScrollController setIsActive:](v14, "setIsActive:", v44);

  }
}

- (void)_layoutQueue_performInitialEngineSetupIfNeeded
{
  PXGConcreteEngineControllerConfiguration *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  OS_dispatch_queue *v8;
  PXGAsyncScrollController *v9;
  void *v10;
  PXGPixelBufferMetalRenderDestination *v11;
  PXGPixelBufferMetalRenderDestination *v12;
  PXGLayout *v13;
  PXGLayout *layoutQueue_placeholderLayout;
  PXGEngine *v15;
  PXGEngine *v16;
  PXGEngine *layoutQueue_engine;
  PXGEngine *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  void *v23;
  id v24;
  id location;

  if (!self->_layoutQueue_engine)
  {
    v3 = self->_layoutQueue_configuration;
    -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
    -[PXGConcreteEngineControllerConfiguration displayScale](v3, "displayScale");
    PXSizeScale();
    v5 = v4;
    v7 = v6;
    if ((PXSizeIsEmpty() & 1) == 0)
    {
      v8 = self->_layoutQueue;
      v9 = -[PXGAsyncScrollController initWithQueue:]([PXGAsyncScrollController alloc], "initWithQueue:", v8);
      -[PXGConcreteEngineControllerConfiguration referenceSize](v3, "referenceSize");
      -[PXGAsyncScrollController setReferenceSize:](v9, "setReferenceSize:");
      objc_storeStrong((id *)&self->_layoutQueue_scrollController, v9);
      +[PXGPixelBufferPool pixelBufferPoolWithSize:format:](PXGPixelBufferPool, "pixelBufferPoolWithSize:format:", 1111970369, v5, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = [PXGPixelBufferMetalRenderDestination alloc];
      -[PXGConcreteEngineControllerConfiguration displayScale](v3, "displayScale");
      v12 = -[PXGPixelBufferMetalRenderDestination initWithLayoutQueue:pixelBufferPool:scale:enablePoolRelease:](v11, "initWithLayoutQueue:pixelBufferPool:scale:enablePoolRelease:", v8, v10, 1);
      objc_storeStrong((id *)&self->_layoutQueue_renderDestination, v12);
      objc_initWeak(&location, self);
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __70__PXGHostingController__layoutQueue_performInitialEngineSetupIfNeeded__block_invoke;
      v23 = &unk_1E51457F0;
      objc_copyWeak(&v24, &location);
      -[PXGPixelBufferMetalRenderDestination setRenderCompletionBlock:](v12, "setRenderCompletionBlock:", &v20);
      v13 = objc_alloc_init(PXGLayout);
      layoutQueue_placeholderLayout = self->_layoutQueue_placeholderLayout;
      self->_layoutQueue_placeholderLayout = v13;

      v15 = [PXGEngine alloc];
      v16 = -[PXGEngine initWithPixelBufferDestination:layoutQueue:displayLinkClass:](v15, "initWithPixelBufferDestination:layoutQueue:displayLinkClass:", v12, v8, objc_opt_class(), v20, v21, v22, v23);
      layoutQueue_engine = self->_layoutQueue_engine;
      self->_layoutQueue_engine = v16;

      -[PXGEngine setScrollController:](self->_layoutQueue_engine, "setScrollController:", v9);
      -[PXGEngine setDelegate:](self->_layoutQueue_engine, "setDelegate:", self);
      -[PXGEngine setLayout:](self->_layoutQueue_engine, "setLayout:", self->_layoutQueue_placeholderLayout);
      v18 = self->_layoutQueue_engine;
      -[PXGConcreteEngineControllerConfiguration mediaProvider](v3, "mediaProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGEngine registerAllTextureProvidersWithMediaProvider:](v18, "registerAllTextureProvidersWithMediaProvider:", v19);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);

    }
  }
}

- (void)layoutQueue_skipFrameCount:(int64_t)a3 forProposedSize:(id)a4
{
  NSObject *layoutQueue;
  PXGHostingControllerProposedSize *v6;
  PXGHostingControllerProposedSize *layoutQueue_pendingProposedSize;

  layoutQueue = self->_layoutQueue;
  v6 = (PXGHostingControllerProposedSize *)a4;
  dispatch_assert_queue_V2(layoutQueue);
  layoutQueue_pendingProposedSize = self->_layoutQueue_pendingProposedSize;

  if (layoutQueue_pendingProposedSize == v6)
    ++self->_layoutQueue_skipFramesCount;
}

- (BOOL)layoutQueue_acceptSize:(id)a3
{
  PXGHostingControllerProposedSize *v4;
  PXGHostingControllerProposedSize *layoutQueue_pendingProposedSize;
  NSObject *v6;
  void *v7;
  int v9;
  PXGHostingController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  CGSize v14;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (PXGHostingControllerProposedSize *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  layoutQueue_pendingProposedSize = self->_layoutQueue_pendingProposedSize;
  if (layoutQueue_pendingProposedSize == v4)
  {
    self->_layoutQueue_pendingProposedSize = 0;

    PXGTungstenGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[PXGHostingControllerProposedSize referenceSize](v4, "referenceSize");
      NSStringFromCGSize(v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "PXGHostingController:%@ layoutQueue_acceptSize:%@", (uint8_t *)&v9, 0x16u);

    }
    -[PXGHostingControllerProposedSize referenceSize](v4, "referenceSize");
    -[PXGHostingController layoutQueue_applySize:](self, "layoutQueue_applySize:");
  }

  return layoutQueue_pendingProposedSize == v4;
}

- (void)layoutQueue_applySize:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  PXGHostingController *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  PXGPixelBufferMetalRenderDestination *layoutQueue_renderDestination;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  PXGHostingController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  CGSize v34;
  CGSize v35;
  CGSize v36;
  CGSize v37;

  height = a3.height;
  width = a3.width;
  v33 = *MEMORY[0x1E0C80C00];
  if (PXSizeIsEmpty())
  {
    PXGTungstenGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v34.width = width;
      v34.height = height;
      NSStringFromCGSize(v34);
      v7 = (PXGHostingController *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "unexpected reference size %@", (uint8_t *)&v25, 0xCu);

    }
    width = 1.0;
    height = 1.0;
  }
  -[PXGConcreteEngineControllerConfiguration displayScale](self->_layoutQueue_configuration, "displayScale");
  v9 = v8;
  PXSizeScale();
  v11 = v10;
  v13 = v12;
  -[PXGPixelBufferMetalRenderDestination renderSize](self->_layoutQueue_renderDestination, "renderSize");
  v16 = v15 == v11 && v14 == v13;
  if (!v16 && (PXSizeIsEmpty() & 1) == 0)
  {
    PXGTungstenGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v35.width = v11;
      v35.height = v13;
      NSStringFromCGSize(v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = self;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, "PXGHostingController:%@ pixelBufferPool = %@", (uint8_t *)&v25, 0x16u);

    }
    layoutQueue_renderDestination = self->_layoutQueue_renderDestination;
    +[PXGPixelBufferPool pixelBufferPoolWithSize:format:](PXGPixelBufferPool, "pixelBufferPoolWithSize:format:", 1111970369, v11, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGPixelBufferMetalRenderDestination setPixelBufferPool:](layoutQueue_renderDestination, "setPixelBufferPool:", v20);

    if (self->_layoutQueue_pendingProposedSizeWasDelayed)
      *(_OWORD *)&self->_layoutQueue_skipFramesCount = xmmword_1A7C0C920;
  }
  -[PXGAsyncScrollController setReferenceSize:](self->_layoutQueue_scrollController, "setReferenceSize:", width, height);
  -[PXGEngine layout](self->_layoutQueue_engine, "layout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hostingControllerDidChangeReferenceSize:", width, height);

  PXGTungstenGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v36.width = width;
    v36.height = height;
    NSStringFromCGSize(v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37.width = v11;
    v37.height = v13;
    NSStringFromCGSize(v37);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138413058;
    v26 = self;
    v27 = 2112;
    v28 = v23;
    v29 = 2048;
    v30 = v9;
    v31 = 2112;
    v32 = v24;
    _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEBUG, "PXGHostingController:%@ hostingControllerDidChangeReferenceSize:%@ displayScale:%.2f pixelSize:%@", (uint8_t *)&v25, 0x2Au);

  }
}

- (void)engineSetNeedsUpdate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  -[PXGAsyncScrollController setNeedsUpdate](self->_layoutQueue_scrollController, "setNeedsUpdate");
}

- (BOOL)engine:(id)a3 shouldRenderLayout:(id)a4 sprites:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t layoutQueue_skipDegradedFramesCount;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  _QWORD v20[6];
  uint8_t buf[4];
  PXGHostingController *v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  layoutQueue_skipDegradedFramesCount = self->_layoutQueue_skipDegradedFramesCount;
  if (self->_layoutQueue_skipFramesCount <= 0)
  {
    if (layoutQueue_skipDegradedFramesCount < 1)
      goto LABEL_13;
  }
  else if (layoutQueue_skipDegradedFramesCount < 1)
  {
    goto LABEL_10;
  }
  *(_QWORD *)&v23 = 0;
  *((_QWORD *)&v23 + 1) = &v23;
  v24 = 0x2020000000;
  v25 = 0;
  -[PXGEngine entityManager](self->_layoutQueue_engine, "entityManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loadingStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v13);
  v15 = objc_msgSend(v14, "states");
  objc_msgSend(v9, "visibleRect");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __58__PXGHostingController_engine_shouldRenderLayout_sprites___block_invoke;
  v20[3] = &unk_1E5145818;
  v20[4] = &v23;
  v20[5] = v15;
  objc_msgSend(v10, "enumerateSpritesInRect:usingBlock:", v20);
  if (!*(_BYTE *)(*((_QWORD *)&v23 + 1) + 24))
  {
    self->_layoutQueue_skipDegradedFramesCount = 0;

    _Block_object_dispose(&v23, 8);
    if (self->_layoutQueue_skipFramesCount >= 1)
    {
LABEL_10:
      PXGTungstenGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v23) = 138412290;
        *(_QWORD *)((char *)&v23 + 4) = self;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEBUG, "PXGHostingController:%@ skip frame", (uint8_t *)&v23, 0xCu);
      }

      v17 = 0;
      --self->_layoutQueue_skipFramesCount;
      goto LABEL_14;
    }
LABEL_13:
    v17 = 1;
    goto LABEL_14;
  }
  PXGTungstenGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = self;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEBUG, "PXGHostingController:%@ skip degraded frame", buf, 0xCu);
  }

  --self->_layoutQueue_skipDegradedFramesCount;
  _Block_object_dispose(&v23, 8);
  v17 = 0;
LABEL_14:

  return v17;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ApplicationStateObservationContext_285662 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGHostingController.m"), 508, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXGHostingController _mainQueue_updateIsAppInactive](self, "_mainQueue_updateIsAppInactive");
    v9 = v11;
  }

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (id)onPresentersDidChange
{
  return self->_onPresentersDidChange;
}

- (void)setOnPresentersDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)clientQueue_isPerformingChanges
{
  return self->_clientQueue_isPerformingChanges;
}

- (PXGConcreteEngineControllerConfiguration)clientQueue_configuration
{
  return self->_clientQueue_configuration;
}

- (NSHashTable)clientQueue_activePresenters
{
  return self->_clientQueue_activePresenters;
}

- (PXGConcreteEngineControllerConfiguration)layoutQueue_configuration
{
  return self->_layoutQueue_configuration;
}

- (BOOL)layoutQueue_isAppInactive
{
  return self->_layoutQueue_isAppInactive;
}

- (PXGAsyncScrollController)layoutQueue_scrollController
{
  return self->_layoutQueue_scrollController;
}

- (PXGEngine)layoutQueue_engine
{
  return self->_layoutQueue_engine;
}

- (PXGPixelBufferMetalRenderDestination)layoutQueue_renderDestination
{
  return self->_layoutQueue_renderDestination;
}

- (PXGLayout)layoutQueue_placeholderLayout
{
  return self->_layoutQueue_placeholderLayout;
}

- (id)layoutQueue_pendingRootLayoutPromise
{
  return self->_layoutQueue_pendingRootLayoutPromise;
}

- (void)setLayoutQueue_pendingRootLayoutPromise:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PXGHostingControllerProposedSize)layoutQueue_pendingProposedSize
{
  return self->_layoutQueue_pendingProposedSize;
}

- (void)setLayoutQueue_pendingProposedSize:(id)a3
{
  objc_storeStrong((id *)&self->_layoutQueue_pendingProposedSize, a3);
}

- (BOOL)layoutQueue_pendingProposedSizeWasDelayed
{
  return self->_layoutQueue_pendingProposedSizeWasDelayed;
}

- (void)setLayoutQueue_pendingProposedSizeWasDelayed:(BOOL)a3
{
  self->_layoutQueue_pendingProposedSizeWasDelayed = a3;
}

- (int64_t)layoutQueue_skipFramesCount
{
  return self->_layoutQueue_skipFramesCount;
}

- (void)setLayoutQueue_skipFramesCount:(int64_t)a3
{
  self->_layoutQueue_skipFramesCount = a3;
}

- (int64_t)layoutQueue_skipDegradedFramesCount
{
  return self->_layoutQueue_skipDegradedFramesCount;
}

- (void)setLayoutQueue_skipDegradedFramesCount:(int64_t)a3
{
  self->_layoutQueue_skipDegradedFramesCount = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSHashTable)lock_observers
{
  return self->_lock_observers;
}

- (PXGRenderFrame)lock_lastFrame
{
  return self->_lock_lastFrame;
}

- (PXApplicationState)mainQueue_applicationState
{
  return self->_mainQueue_applicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainQueue_applicationState, 0);
  objc_storeStrong((id *)&self->_lock_lastFrame, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_layoutQueue_pendingProposedSize, 0);
  objc_storeStrong(&self->_layoutQueue_pendingRootLayoutPromise, 0);
  objc_storeStrong((id *)&self->_layoutQueue_placeholderLayout, 0);
  objc_storeStrong((id *)&self->_layoutQueue_renderDestination, 0);
  objc_storeStrong((id *)&self->_layoutQueue_engine, 0);
  objc_storeStrong((id *)&self->_layoutQueue_scrollController, 0);
  objc_storeStrong((id *)&self->_layoutQueue_configuration, 0);
  objc_storeStrong((id *)&self->_clientQueue_activePresenters, 0);
  objc_storeStrong((id *)&self->_clientQueue_configuration, 0);
  objc_storeStrong(&self->_onPresentersDidChange, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

uint64_t __58__PXGHostingController_engine_shouldRenderLayout_sprites___block_invoke(uint64_t result, uint64_t a2, unsigned int **a3, _BYTE *a4)
{
  unsigned int v4;
  BOOL v5;
  int v6;

  if (*(_BYTE *)a3[3] != 1)
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(result + 40) + **a3);
    v5 = v4 > 4;
    v6 = (1 << v4) & 0x16;
    if (!v5 && v6 != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

void __70__PXGHostingController__layoutQueue_performInitialEngineSetupIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  PXGRenderFrame *v5;

  v5 = -[PXGRenderFrame initWithFrameID:pixelBuffer:]([PXGRenderFrame alloc], "initWithFrameID:pixelBuffer:", a3, a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_distributeFrame:", v5);

}

void __67__PXGHostingController__clientQueue_propagateConfigurationToEngine__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLayoutQueue_configuration:", v1);

}

uint64_t __56__PXGHostingController__dispatchFrame_async_toObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hostingController:didRenderFrame:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __34__PXGHostingController_presenters__block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

void __31__PXGHostingController_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PXGHostingController_dealloc__block_invoke_2;
  block[3] = &unk_1E5149198;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

uint64_t __31__PXGHostingController_dealloc__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keepAlive");
}

void __54__PXGHostingController__mainQueue_updateIsAppInactive__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(unsigned __int8 *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLayoutQueue_isAppInactive:", v1);

}

void __77__PXGHostingController_initWithClientQueue_layoutQueue_initialConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_mainQueue_initialize");

}

+ (OS_dispatch_queue)sharedQueue
{
  if (sharedQueue_onceToken_285769 != -1)
    dispatch_once(&sharedQueue_onceToken_285769, &__block_literal_global_285770);
  return (OS_dispatch_queue *)(id)sharedQueue_sharedQueue_285771;
}

void __35__PXGHostingController_sharedQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.hostingController.async-queue", attr);
  v2 = (void *)sharedQueue_sharedQueue_285771;
  sharedQueue_sharedQueue_285771 = (uint64_t)v1;

}

@end
