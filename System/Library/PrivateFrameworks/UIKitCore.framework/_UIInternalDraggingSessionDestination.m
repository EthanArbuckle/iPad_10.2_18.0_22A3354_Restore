@implementation _UIInternalDraggingSessionDestination

- (_UIInternalDraggingSessionDestination)initWithDragManager:(id)a3 dragEvent:(id)a4
{
  id v6;
  id v7;
  _UIInternalDraggingSessionDestination *v8;
  uint64_t v9;
  NSPointerArray *dragEvents;
  void *v11;
  uint64_t v12;
  _UIInternalDraggingSessionSource *sessionSource;
  double v14;
  double v15;
  uint64_t v16;
  UIWindow *centroidWindow;
  _UIDataTransferMonitor *v18;
  _UIDataTransferMonitor *dataTransferMonitor;
  uint64_t v20;
  NSProgress *progress;
  _UIDropSessionImpl *v22;
  _UIDropSessionImpl *dropSession;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("dragEvent must be non-nil"));
  v25.receiver = self;
  v25.super_class = (Class)_UIInternalDraggingSessionDestination;
  v8 = -[_UIDraggingImageSlotOwner initWithDragManager:](&v25, sel_initWithDragManager_, v6);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v9 = objc_claimAutoreleasedReturnValue();
    dragEvents = v8->_dragEvents;
    v8->_dragEvents = (NSPointerArray *)v9;

    v8->_sessionIdentifier = objc_msgSend(v7, "dragSessionID");
    v8->_touchRoutingPolicyContextID = objc_msgSend(v7, "_touchRoutingPolicyContextID");
    -[_UIDraggingImageSlotOwner dragManager](v8, "dragManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionSourceWithIdentifier:", v8->_sessionIdentifier);
    v12 = objc_claimAutoreleasedReturnValue();
    sessionSource = v8->_sessionSource;
    v8->_sessionSource = (_UIInternalDraggingSessionSource *)v12;

    v8->_isPolicyDriven = objc_msgSend(v7, "isPolicyDriven");
    objc_msgSend(v7, "locationInView:", 0);
    v8->_centroid.x = v14;
    v8->_centroid.y = v15;
    v8->_centroid.z = 0.0;
    objc_msgSend(v7, "eventWindow");
    v16 = objc_claimAutoreleasedReturnValue();
    centroidWindow = v8->_centroidWindow;
    v8->_centroidWindow = (UIWindow *)v16;

    v18 = objc_alloc_init(_UIDataTransferMonitor);
    dataTransferMonitor = v8->_dataTransferMonitor;
    v8->_dataTransferMonitor = v18;

    -[_UIDataTransferMonitor setDelegate:](v8->_dataTransferMonitor, "setDelegate:", v8);
    -[_UIDataTransferMonitor setSuppressEventsUntilRequested:](v8->_dataTransferMonitor, "setSuppressEventsUntilRequested:", 1);
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v20 = objc_claimAutoreleasedReturnValue();
    progress = v8->_progress;
    v8->_progress = (NSProgress *)v20;

    v8->_progressIndicatorStyle = 1;
    v22 = -[_UIDropSessionImpl initWithSessionDestination:]([_UIDropSessionImpl alloc], "initWithSessionDestination:", v8);
    dropSession = v8->_dropSession;
    v8->_dropSession = v22;

    -[_UIInternalDraggingSessionDestination addDragEvent:](v8, "addDragEvent:", v7);
  }

  return v8;
}

- (_UIInternalDraggingSessionSource)inAppSessionSource
{
  return self->_sessionSource;
}

- (BOOL)canBeDrivenByDragEvent:(id)a3
{
  id v4;
  int v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "dragSessionID");
  v6 = v5 == -[_UIInternalDraggingSessionDestination sessionIdentifier](self, "sessionIdentifier")
    && objc_msgSend(v4, "_touchRoutingPolicyContextID") == self->_touchRoutingPolicyContextID
    && self->_isPolicyDriven == objc_msgSend(v4, "isPolicyDriven");

  return v6;
}

- (void)addDragEvent:(id)a3
{
  -[NSPointerArray addPointer:](self->_dragEvents, "addPointer:", a3);
}

- (NSArray)dragEvents
{
  return -[NSPointerArray allObjects](self->_dragEvents, "allObjects");
}

- (UIDragEvent)activeDragEvent
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_UIInternalDraggingSessionDestination dragEvents](self, "dragEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasActiveGestureRecognizers", (_QWORD)v12))
        {
          v10 = v9;

          v3 = v10;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (UIDragEvent *)v3;
}

- (void)connect
{
  void *v3;
  _UIDruidDestinationConnection *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id location;

  -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[_UIDruidDestinationConnection initWithSessionIdentifier:systemPolicy:]([_UIDruidDestinationConnection alloc], "initWithSessionIdentifier:systemPolicy:", self->_sessionIdentifier, self->_isPolicyDriven);
    -[_UIInternalDraggingSessionDestination setDruidConnection:](self, "setDruidConnection:", v4);

    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke;
    v23[3] = &unk_1E16C4598;
    objc_copyWeak(&v24, &location);
    v23[4] = self;
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConnectionBlock:", v23);

    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_2;
    v21[3] = &unk_1E16C44D0;
    objc_copyWeak(&v22, &location);
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDragPreviewProviderBlock:", v21);

    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_4;
    v19[3] = &unk_1E16C45C0;
    objc_copyWeak(&v20, &location);
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItemsAddedBlock:", v19);

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_5;
    v17[3] = &unk_1E16C45E8;
    objc_copyWeak(&v18, &location);
    v17[4] = self;
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDropPerformBlock:", v17);

    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_6;
    v15[3] = &unk_1E16C4548;
    objc_copyWeak(&v16, &location);
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHandOffDroppedItemsBlock:", v15);

    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_7;
    v13[3] = &unk_1E16B44C0;
    objc_copyWeak(&v14, &location);
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDragEndBlock:", v13);

    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connect");

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)_sessionDidEndNormally:(BOOL)a3
{
  id dropPerformBlock;
  id dropCompletionBlock;
  _UIDragSetDownAnimation *setDownAnimation;
  void (**v8)(_QWORD);
  void *v9;
  id postDropAnimationCompletionBlock;
  _QWORD v11[5];
  BOOL v12;

  if (!a3)
  {
    dropPerformBlock = self->_dropPerformBlock;
    if (dropPerformBlock)
    {
      self->_dropPerformBlock = 0;

      dropCompletionBlock = self->_dropCompletionBlock;
      self->_dropCompletionBlock = 0;

    }
    setDownAnimation = self->_setDownAnimation;
    if (setDownAnimation)
      -[_UIDragSetDownAnimation begin](setDownAnimation, "begin");
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64___UIInternalDraggingSessionDestination__sessionDidEndNormally___block_invoke;
  v11[3] = &unk_1E16B1B78;
  v11[4] = self;
  v12 = a3;
  v8 = (void (**)(_QWORD))_Block_copy(v11);
  if (self->_setDownAnimation && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0)
  {
    v9 = _Block_copy(v8);
    postDropAnimationCompletionBlock = self->_postDropAnimationCompletionBlock;
    self->_postDropAnimationCompletionBlock = v9;

  }
  else
  {
    v8[2](v8);
  }

}

- (void)_removeFromDragManager
{
  void *v3;
  _UIDropSessionImpl *dropSession;

  -[_UIDraggingImageSlotOwner dragManager](self, "dragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionDestinationDidEnd:", self);

  dropSession = self->_dropSession;
  self->_dropSession = 0;

}

- (void)dataTransferMonitorBeganTransfers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[6];

  v8 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("outstandingItemsCount")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88___UIInternalDraggingSessionDestination_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v12[3] = &unk_1E16B1888;
    v12[4] = self;
    v12[5] = v10;
    objc_msgSend(v11, "performAsync:", v12);

  }
}

- (void)dataTransferMonitorFinishedTransfers:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _UIInternalDraggingSessionDestination *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = dataTransferMonitorFinishedTransfers____s_category;
  if (!dataTransferMonitorFinishedTransfers____s_category)
  {
    v4 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&dataTransferMonitorFinishedTransfers____s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Data transfer finished for dragging session destination %p", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78___UIInternalDraggingSessionDestination_dataTransferMonitorFinishedTransfers___block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  objc_msgSend(v6, "performAsync:", v7);

}

- (BOOL)shouldDragEventBeSentToGestureRecognizers
{
  _UIInternalDraggingSessionSource *sessionSource;

  if (!self->_connectedToDruid)
    return 0;
  sessionSource = self->_sessionSource;
  return !sessionSource || -[_UIInternalDraggingSessionSource didHandOffDragImage](sessionSource, "didHandOffDragImage");
}

- (BOOL)didRequestDropToBePerformed
{
  return self->_dropPerformBlock != 0;
}

- (void)dragInteractionEnding
{
  self->_dragInteractionDidEnd = 1;
}

- (void)sawDragEndEvent
{
  id v2;

  -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sawDragEndEvent");

}

- (void)updateCentroidFromDragEvent
{
  void *v3;
  double v4;
  double v5;
  UIWindow *v6;
  UIWindow *centroidWindow;
  id v8;

  if (self->_centroidWindow)
  {
    -[_UIInternalDraggingSessionDestination activeDragEvent](self, "activeDragEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      objc_msgSend(v3, "locationInView:", 0);
      self->_centroid.x = v4;
      self->_centroid.y = v5;
      self->_centroid.z = 0.0;
      objc_msgSend(v8, "eventWindow");
      v6 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      centroidWindow = self->_centroidWindow;
      self->_centroidWindow = v6;

      v3 = v8;
    }

  }
}

- (void)dragDidExitApp
{
  _DUIPotentialDrop *lastPotentialDrop;

  lastPotentialDrop = self->_lastPotentialDrop;
  self->_lastPotentialDrop = 0;

}

- (void)enteredDestination:(id)a3
{
  id v4;
  NSMutableSet *enteredDestinations;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  enteredDestinations = self->_enteredDestinations;
  v8 = v4;
  if (!enteredDestinations)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_enteredDestinations;
    self->_enteredDestinations = v6;

    v4 = v8;
    enteredDestinations = self->_enteredDestinations;
  }
  -[NSMutableSet addObject:](enteredDestinations, "addObject:", v4);

}

- (void)itemsBecameDirty:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count") && self->_connectedToDruid && !self->_dragInteractionDidEnd)
  {
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dirtyItems:", v5);

  }
}

- (void)takePotentialDrop:(id)a3
{
  _DUIPotentialDrop **p_lastPotentialDrop;
  void *v6;
  id v7;

  p_lastPotentialDrop = &self->_lastPotentialDrop;
  v7 = a3;
  if (!-[_DUIPotentialDrop isEqual:](*p_lastPotentialDrop, "isEqual:"))
  {
    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "takePotentialDrop:", v7);

    objc_storeStrong((id *)p_lastPotentialDrop, a3);
  }

}

- (void)requestDropOnOwner:(id)a3 withOperation:(unint64_t)a4 perform:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  _DUITargetLayerDescriptor *v15;
  id WeakRetained;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id dropPerformBlock;
  void *v25;
  id dropCompletionBlock;
  void *v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id location;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4)
  {
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_dropDestinationOwner, a3);
    if (_IsKindOfUIView((uint64_t)self->_dropDestinationOwner))
    {
      objc_msgSend(v11, "_window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_dropDestinationWindow, v14);

      v15 = objc_alloc_init(_DUITargetLayerDescriptor);
      WeakRetained = objc_loadWeakRetained((id *)&self->_dropDestinationWindow);
      -[_DUITargetLayerDescriptor setContextID:](v15, "setContextID:", objc_msgSend(WeakRetained, "_contextId"));

      v17 = objc_loadWeakRetained((id *)&self->_dropDestinationWindow);
      objc_msgSend(v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DUITargetLayerDescriptor setRenderID:](v15, "setRenderID:", CALayerGetRenderId());

      v19 = objc_loadWeakRetained((id *)&self->_dropDestinationWindow);
      objc_msgSend(v19, "windowScene");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "systemShellHostingEnvironment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "systemShellHostingSpaceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DUITargetLayerDescriptor setSystemShellHostingSpaceIdentifier:](v15, "setSystemShellHostingSpaceIdentifier:", v22);

    }
    else
    {
      v15 = 0;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93___UIInternalDraggingSessionDestination_requestDropOnOwner_withOperation_perform_completion___block_invoke;
    aBlock[3] = &unk_1E16C14D0;
    objc_copyWeak(&v30, &location);
    v29 = v12;
    v23 = _Block_copy(aBlock);
    dropPerformBlock = self->_dropPerformBlock;
    self->_dropPerformBlock = v23;

    v25 = _Block_copy(v13);
    dropCompletionBlock = self->_dropCompletionBlock;
    self->_dropCompletionBlock = v25;

    -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "requestDropWithOperation:layerContext:", a4, v15);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

}

- (unint64_t)sourceOperationMask
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[_UIInternalDraggingSessionDestination inAppSessionSource](self, "inAppSessionSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[_UIInternalDraggingSessionDestination outsideAppSourceOperationMask](self, "outsideAppSourceOperationMask");
  -[_UIInternalDraggingSessionDestination inAppSessionSource](self, "inAppSessionSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "withinAppSourceOperationMask");

  return v5;
}

- (NSArray)preDropItemProviders
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UIInternalDraggingSessionDestination internalItems](self, "internalItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "itemProvider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)takeVisibleDroppedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "itemIndex");
        -[_UIInternalDraggingSessionDestination internalItems](self, "internalItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v10 < v12)
        {
          -[_UIInternalDraggingSessionDestination internalItems](self, "internalItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "_setVisibleDropItemSize:", visibleDroppedItemSize(v9));
          objc_msgSend(v9, "center");
          objc_msgSend(v14, "_setVisibleDropItemCenter:");
          if (v9)
          {
            objc_msgSend(v9, "appliedTransform");
          }
          else
          {
            v17 = 0u;
            v18 = 0u;
            v16 = 0u;
          }
          v15[0] = v16;
          v15[1] = v17;
          v15[2] = v18;
          objc_msgSend(v14, "set_suggestedTransform:", v15);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

}

- (void)setUpDropAnimation:(id)a3 layerContext:(id *)a4
{
  id v6;
  void (**v7)(_QWORD);
  _UIDragSetDownAnimation *v8;
  void *v9;
  _UIDragSetDownAnimation *v10;
  _UIDragSetDownAnimation *setDownAnimation;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD aBlock[5];

  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73___UIInternalDraggingSessionDestination_setUpDropAnimation_layerContext___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v6, "count"))
  {
    v8 = [_UIDragSetDownAnimation alloc];
    -[_UIInternalDraggingSessionDestination internalItems](self, "internalItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_UIDragSetDownAnimation initWithVisibleDroppedItems:items:forSource:policyDriven:completion:](v8, "initWithVisibleDroppedItems:items:forSource:policyDriven:completion:", v6, v9, 0, self->_isPolicyDriven, v7);
    setDownAnimation = self->_setDownAnimation;
    self->_setDownAnimation = v10;

    -[_UIDragSetDownAnimation coordinateContainerWindow](self->_setDownAnimation, "coordinateContainerWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIDragSetDownAnimation coordinateContainerWindow](self->_setDownAnimation, "coordinateContainerWindow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v16 = (void *)objc_opt_new();
      objc_msgSend(v13, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContextID:", objc_msgSend(v17, "contextId"));

      objc_msgSend(v16, "setRenderID:", CALayerGetRenderId());
      objc_msgSend(v15, "systemShellHostingEnvironment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "systemShellHostingSpaceIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setSystemShellHostingSpaceIdentifier:", v19);
      v20 = objc_retainAutorelease(v16);
      *a4 = v20;

    }
  }
  else
  {
    v7[2](v7);
  }

}

- (void)handOffDroppedItems:(id)a3
{
  -[_UIDragSetDownAnimation updateVisibleDroppedItems:](self->_setDownAnimation, "updateVisibleDroppedItems:", a3);
  -[_UIDragSetDownAnimation begin](self->_setDownAnimation, "begin");
}

- (NSProgress)progress
{
  return -[_UIDataTransferMonitor progress](self->_dataTransferMonitor, "progress");
}

- (unint64_t)actualDragOperationForProposedDragOperation:(unint64_t)a3 destinationDataOwner:(int64_t)a4 forbidden:(BOOL *)a5
{
  uint64_t v8;

  v8 = -[_UIInternalDraggingSessionDestination sourceDataOwner](self, "sourceDataOwner");
  if (_UIShouldEnforceOpenInRulesInAccountBasedApp())
  {
    if ((_UIDropAllowedWithinAccountBasedApp(v8, a4) & 1) == 0)
    {
      a3 = 0;
      if (a5)
        *a5 = 1;
    }
  }
  return a3;
}

- (void)requestVisibleItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIInternalDraggingSessionDestination druidConnection](self, "druidConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestVisibleItems:", v4);

}

- (CGPoint)previewCenterForVisibleItem:(id)a3 inCoordinateSpace:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_visibleDropItemSize");
  if (v9 == *MEMORY[0x1E0C9D820] && v8 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v13 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  }
  else
  {
    -[_UIDropInteractionOwning _window](self->_dropDestinationOwner, "_window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_visibleDropItemCenter");
    objc_msgSend(v7, "convertPoint:fromCoordinateSpace:", v11);
    v13 = v12;
    v15 = v14;

  }
  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIInternalDraggingSessionDestination internalItems](self, "internalItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  enumerateDraggingItems(v5, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIInternalDraggingSessionDestination itemsBecameDirty:](self, "itemsBecameDirty:", v6);
}

- (CGPoint)draggingLocationInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("coordinateSpace must be non-nil"));
  -[_UIInternalDraggingSessionDestination updateCentroidFromDragEvent](self, "updateCentroidFromDragEvent");
  -[_UIInternalDraggingSessionDestination centroid](self, "centroid");
  v6 = v5;
  v8 = v7;
  -[_UIInternalDraggingSessionDestination centroidWindow](self, "centroidWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[_UIInternalDraggingSessionDestination weakCentroidWindow](self, "weakCentroidWindow"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (_IsKindOfUIView((uint64_t)v4))
      objc_msgSend(v9, "convertPoint:toView:", v4, v6, v8);
    else
      objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v4, v6, v8);
    v12 = v10;
    v13 = v11;

  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v14 = v12;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (_UIDropSessionImpl)dropSession
{
  return self->_dropSession;
}

- (CAPoint3D)centroid
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_centroid.x;
  y = self->_centroid.y;
  z = self->_centroid.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (UIWindow)centroidWindow
{
  return self->_centroidWindow;
}

- (UIWindow)weakCentroidWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_weakCentroidWindow);
}

- (NSArray)dropItemProviders
{
  return self->_dropItemProviders;
}

- (int64_t)sourceDataOwner
{
  return self->_sourceDataOwner;
}

- (NSArray)internalItems
{
  return self->_internalItems;
}

- (void)setInternalItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unint64_t)outsideAppSourceOperationMask
{
  return self->_outsideAppSourceOperationMask;
}

- (BOOL)isAccessibilitySession
{
  return self->_isAccessibilitySession;
}

- (BOOL)drivenByPointer
{
  return self->_drivenByPointer;
}

- (unint64_t)progressIndicatorStyle
{
  return self->_progressIndicatorStyle;
}

- (void)setProgressIndicatorStyle:(unint64_t)a3
{
  self->_progressIndicatorStyle = a3;
}

- (_UIDruidDestinationConnection)druidConnection
{
  return self->_druidConnection;
}

- (void)setDruidConnection:(id)a3
{
  objc_storeStrong((id *)&self->_druidConnection, a3);
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_druidConnection, 0);
  objc_storeStrong((id *)&self->_internalItems, 0);
  objc_storeStrong((id *)&self->_dropItemProviders, 0);
  objc_destroyWeak((id *)&self->_weakCentroidWindow);
  objc_storeStrong((id *)&self->_centroidWindow, 0);
  objc_storeStrong((id *)&self->_dropSession, 0);
  objc_storeStrong((id *)&self->_dragEvents, 0);
  objc_storeStrong((id *)&self->_lastPotentialDrop, 0);
  objc_storeStrong((id *)&self->_modalProgressAlertController, 0);
  objc_storeStrong((id *)&self->_dataTransferMonitor, 0);
  objc_storeStrong((id *)&self->_droppedItemCollection, 0);
  objc_storeStrong((id *)&self->_setDownAnimation, 0);
  objc_storeStrong(&self->_postDropAnimationCompletionBlock, 0);
  objc_storeStrong(&self->_dropCompletionBlock, 0);
  objc_storeStrong(&self->_dropPerformBlock, 0);
  objc_destroyWeak((id *)&self->_dropDestinationWindow);
  objc_storeStrong((id *)&self->_dropDestinationOwner, 0);
  objc_storeStrong((id *)&self->_enteredDestinations, 0);
  objc_storeStrong((id *)&self->_sessionSource, 0);
}

@end
