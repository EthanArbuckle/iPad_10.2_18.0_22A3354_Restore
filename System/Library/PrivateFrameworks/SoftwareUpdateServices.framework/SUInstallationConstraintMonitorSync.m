@implementation SUInstallationConstraintMonitorSync

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id v9;
  id v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  BSDispatchQueueAssert();
  v12.receiver = self;
  v12.super_class = (Class)SUInstallationConstraintMonitorSync;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v12, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v7, 128, v6);

  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BE03978]);
    v10 = v8[7];
    v8[7] = v9;

    objc_msgSend(v8[7], "setDelegate:", v8);
    objc_msgSend(v8[7], "registerForStatus");
    objc_msgSend(v8, "_queue_initilizaSyncState");
  }
  return v8;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_isSyncing)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  SUInstallationConstraintMonitorSync *v10;

  v5 = a4;
  queue = self->super._queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__SUInstallationConstraintMonitorSync_connection_updatedProgress___block_invoke;
  v8[3] = &unk_24CE3B610;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __66__SUInstallationConstraintMonitorSync_connection_updatedProgress___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("Enabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 40), "_queue_setSyncing:", v3);
}

- (void)connectionWasInterrupted:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SUInstallationConstraintMonitorSync_connectionWasInterrupted___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__SUInstallationConstraintMonitorSync_connectionWasInterrupted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSyncing:", 0);
}

- (void)_queue_initilizaSyncState
{
  unsigned __int8 v3;

  BSDispatchQueueAssert();
  v3 = 0;
  if (-[ATConnection isSyncing:automatically:wirelessly:](self->_queue_airTrafficConnection, "isSyncing:automatically:wirelessly:", &v3, 0, 0))-[SUInstallationConstraintMonitorSync _queue_setSyncing:](self, "_queue_setSyncing:", v3);
}

- (void)_queue_setSyncing:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  SUInstallationConstraintMonitorSync *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  if (self->_queue_isSyncing != v3)
  {
    self->_queue_isSyncing = v3;
    SULogInstallConstraints();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isSyncing)
        v6 = CFSTR("NO");
      else
        v6 = CFSTR("YES");
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ - iTunes sync constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_airTrafficConnection, 0);
}

@end
