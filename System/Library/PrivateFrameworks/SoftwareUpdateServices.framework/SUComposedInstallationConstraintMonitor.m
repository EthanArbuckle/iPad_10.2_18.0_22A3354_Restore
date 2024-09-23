@implementation SUComposedInstallationConstraintMonitor

- (SUComposedInstallationConstraintMonitor)initWithInternalQueue:(id)a3 withInstallationConstraintMonitors:(id)a4
{
  NSObject *v7;
  id v8;
  SUComposedInstallationConstraintMonitor *v9;
  SUComposedInstallationConstraintMonitor *v10;
  uint64_t v11;
  NSSet *queue_installationConstraintMonitors;
  _QWORD block[4];
  SUComposedInstallationConstraintMonitor *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUComposedInstallationConstraintMonitor;
  v9 = -[SUComposedInstallationConstraintMonitor init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = objc_msgSend(v8, "copy");
    queue_installationConstraintMonitors = v10->_queue_installationConstraintMonitors;
    v10->_queue_installationConstraintMonitors = (NSSet *)v11;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __100__SUComposedInstallationConstraintMonitor_initWithInternalQueue_withInstallationConstraintMonitors___block_invoke;
    block[3] = &unk_24CE3B5C0;
    v15 = v10;
    dispatch_sync(v7, block);

  }
  return v10;
}

void __100__SUComposedInstallationConstraintMonitor_initWithInternalQueue_withInstallationConstraintMonitors___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) |= objc_msgSend(v7, "representedConstraints", (_QWORD)v8);
        objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)dealloc
{
  NSSet *v3;
  OS_dispatch_queue *queue;
  NSSet *v5;
  NSObject *v6;
  NSSet *queue_installationConstraintMonitors;
  OS_dispatch_queue *v8;
  objc_super v9;
  _QWORD block[4];
  NSSet *v11;

  objc_storeWeak((id *)&self->_queue_delegate, 0);
  v3 = self->_queue_installationConstraintMonitors;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUComposedInstallationConstraintMonitor_dealloc__block_invoke;
  block[3] = &unk_24CE3B5C0;
  v11 = v3;
  v5 = v3;
  v6 = queue;
  dispatch_async(v6, block);
  queue_installationConstraintMonitors = self->_queue_installationConstraintMonitors;
  self->_queue_installationConstraintMonitors = 0;

  v8 = self->_queue;
  self->_queue = 0;

  v9.receiver = self;
  v9.super_class = (Class)SUComposedInstallationConstraintMonitor;
  -[SUComposedInstallationConstraintMonitor dealloc](&v9, sel_dealloc);
}

void __50__SUComposedInstallationConstraintMonitor_dealloc__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setDelegate:", 0, (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (SUInstallationConstraintMonitorDelegate)delegate
{
  NSObject *queue;
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
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__SUComposedInstallationConstraintMonitor_delegate__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUInstallationConstraintMonitorDelegate *)v4;
}

void __51__SUComposedInstallationConstraintMonitor_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUComposedInstallationConstraintMonitor_setDelegate___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __55__SUComposedInstallationConstraintMonitor_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setDelegate:", *(_QWORD *)(a1 + 40));
}

- (unint64_t)representedConstraints
{
  return self->_queue_representedConstraints;
}

- (unint64_t)unsatisfiedConstraints
{
  NSObject *queue;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__SUComposedInstallationConstraintMonitor_unsatisfiedConstraints__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __65__SUComposedInstallationConstraintMonitor_unsatisfiedConstraints__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_unsatisfiedConstraints");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3
{
  NSObject *queue;
  unint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__SUComposedInstallationConstraintMonitor_unsatisfiedConstraintsWithIgnorableConstraints___block_invoke;
  block[3] = &unk_24CE3B638;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(queue, block);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __90__SUComposedInstallationConstraintMonitor_unsatisfiedConstraintsWithIgnorableConstraints___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_unsatisfiedConstraintsWithIgnorableConstraints:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSatisfied
{
  return -[SUComposedInstallationConstraintMonitor unsatisfiedConstraints](self, "unsatisfiedConstraints") == 0;
}

- (void)_queue_noteInstallationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4
{
  id WeakRetained;

  BSDispatchQueueAssert();
  WeakRetained = objc_loadWeakRetained((id *)&self->_queue_delegate);
  objc_msgSend(WeakRetained, "installationConstraintMonitor:constraintsDidChange:", self, a4);

}

- (id)_queue_delegate
{
  BSDispatchQueueAssert();
  return objc_loadWeakRetained((id *)&self->_queue_delegate);
}

- (void)_queue_clearDelegate
{
  BSDispatchQueueAssert();
  -[SUComposedInstallationConstraintMonitor _queue_setDelegate:](self, "_queue_setDelegate:", 0);
}

- (unint64_t)_queue_representedConstraints
{
  BSDispatchQueueAssert();
  return self->_queue_representedConstraints;
}

- (unint64_t)_queue_unsatisfiedConstraints
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_queue_installationConstraintMonitors;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "unsatisfiedConstraints", (_QWORD)v10);
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_queue_unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  if (+[SUUtility currentReleaseTypeIsInternal](SUUtility, "currentReleaseTypeIsInternal")
    && (+[SUPreferences sharedInstance](SUPreferences, "sharedInstance"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "unmetConstraints"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    -[NSSet unmetConstraints](v7, "unmetConstraints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = self->_queue_installationConstraintMonitors;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v9 = 0;
      v12 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v7);
          v9 |= objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "unsatisfiedConstraints");
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }
    else
    {
      v9 = 0;
    }
  }

  SULogInfo(CFSTR("unsatisfiedConstraints = %lu, ignorableConstraints = %lu, realUnsatisfiedConstraints = %lu"), v14, v15, v16, v17, v18, v19, v20, v9);
  return v9 & ~a3;
}

- (void)_queue_invalidateChildConstraintMonitors
{
  NSSet *v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_queue_installationConstraintMonitors;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setDelegate:", 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)installationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__SUComposedInstallationConstraintMonitor_installationConstraintMonitor_constraintsDidChange___block_invoke;
  block[3] = &unk_24CE3B660;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __94__SUComposedInstallationConstraintMonitor_installationConstraintMonitor_constraintsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteInstallationConstraintMonitor:constraintsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_setDelegate:(id)a3
{
  SUInstallationConstraintMonitorDelegate **p_queue_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  BSDispatchQueueAssert();
  p_queue_delegate = &self->_queue_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_queue_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_queue_delegate, obj);
    v6 = obj;
  }

}

- (NSSet)constraintMonitors
{
  return self->_queue_installationConstraintMonitors;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue_delegate);
  objc_storeStrong((id *)&self->_queue_installationConstraintMonitors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
