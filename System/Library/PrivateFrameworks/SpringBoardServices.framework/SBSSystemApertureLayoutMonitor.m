@implementation SBSSystemApertureLayoutMonitor

- (SBSSystemApertureLayoutMonitor)init
{
  SBSSystemApertureLayoutMonitor *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  NSPointerArray *observers;
  void *v9;
  uint64_t v10;
  OS_dispatch_queue *connectionQueue;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BSServiceConnection *connection;
  BSServiceConnection *v18;
  void *v20;
  _QWORD v21[4];
  SBSSystemApertureLayoutMonitor *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SBSSystemApertureLayoutMonitor;
  v3 = -[SBSSystemApertureLayoutMonitor init](&v23, sel_init);
  if (v3)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.springboard"));

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SBSSystemApertureLayoutMonitor.m"), 42, CFSTR("Within SpringBoard, use SBSystemApertureLayoutDidChangeNotification."));

    }
    v3->_isValid = 1;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSPointerArray *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v10;

    v12 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSSystemApertureLayoutMonitorServiceSpecification identifier](SBSSystemApertureLayoutMonitorServiceSpecification, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endpointForMachName:service:instance:", v13, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v16;

    v18 = v3->_connection;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __38__SBSSystemApertureLayoutMonitor_init__block_invoke;
    v21[3] = &unk_1E288CF30;
    v22 = v3;
    -[BSServiceConnection configureConnection:](v18, "configureConnection:", v21);
    -[BSServiceConnection activate](v3->_connection, "activate");

  }
  return v3;
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSSystemApertureLayoutMonitorServiceSpecification interface](SBSSystemApertureLayoutMonitorServiceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v3);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  +[SBSSystemApertureLayoutMonitorServiceSpecification serviceQuality](SBSSystemApertureLayoutMonitorServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_47);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_13_1);

}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SBLogSystemApertureHosting();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __38__SBSSystemApertureLayoutMonitor_init__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  SBLogSystemApertureHosting();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__SBSSystemApertureLayoutMonitor_init__block_invoke_12_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(v2, "activate");
}

- (void)invalidate
{
  BSServiceConnection *connection;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  -[NSPointerArray compact](self->_observers, "compact");
  while (-[NSPointerArray count](self->_observers, "count"))
    -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", -[NSPointerArray count](self->_observers, "count") - 1);
  self->_isValid = 0;
}

- (void)addObserver:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSPointerArray compact](self->_observers, "compact");
  v4 = -[NSPointerArray count](self->_observers, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v6) != v7)
    {
      if (v5 == ++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    -[NSPointerArray addPointer:](self->_observers, "addPointer:", v7);
    if (-[NSArray count](self->_frames, "count"))
      objc_msgSend(v7, "systemApertureLayoutDidChange:", self->_frames);
  }

}

- (void)removeObserver:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[NSPointerArray compact](self->_observers, "compact");
  v4 = -[NSPointerArray count](self->_observers, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v6) != v7)
    {
      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v6);
  }
LABEL_7:

}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBSSystemApertureLayoutMonitor_systemApertureLayoutDidChange___block_invoke;
  v6[3] = &unk_1E288D940;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __64__SBSSystemApertureLayoutMonitor_systemApertureLayoutDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqualToArray:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "compact");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "systemApertureLayoutDidChange:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "SBSSystemApertureLayoutMonitor connection invalidated remotely; Layout monitoring terminated. (Do you have the requi"
    "red entitlement?)",
    a5,
    a6,
    a7,
    a8,
    0);
}

void __38__SBSSystemApertureLayoutMonitor_init__block_invoke_12_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "SBSSystemApertureLayoutMonitor connection interrupted. Reactivating connection.", a5, a6, a7, a8, 0);
}

@end
