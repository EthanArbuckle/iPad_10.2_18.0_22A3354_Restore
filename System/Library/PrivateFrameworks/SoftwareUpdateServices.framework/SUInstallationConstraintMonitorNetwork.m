@implementation SUInstallationConstraintMonitorNetwork

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUInstallationConstraintMonitorNetwork initOnQueue:withDownload:networkMonitor:](self, "initOnQueue:withDownload:networkMonitor:", v7, v6, v8);

  return v9;
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 networkMonitor:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  objc_super v14;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  BSDispatchQueueAssert();
  v14.receiver = self;
  v14.super_class = (Class)SUInstallationConstraintMonitorNetwork;
  v12 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v14, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v11, 2, v10);

  if (v12)
  {
    objc_storeStrong(v12 + 6, a5);
    objc_msgSend(v12[6], "addObserver:", v12);
    objc_msgSend(v12, "_queue_networkDidChange");
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SUNetworkMonitor removeObserver:](self->_queue_networkMonitor, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUInstallationConstraintMonitorNetwork;
  -[SUInstallationConstraintMonitorNetwork dealloc](&v3, sel_dealloc);
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_hasNetwork)
    return 0;
  else
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__SUInstallationConstraintMonitorNetwork_networkChangedFromNetworkType_toNetworkType___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __86__SUInstallationConstraintMonitorNetwork_networkChangedFromNetworkType_toNetworkType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_networkDidChange");
}

- (void)_queue_networkDidChange
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  SUInstallationConstraintMonitorNetwork *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v3 = -[SUNetworkMonitor currentNetworkType](self->_queue_networkMonitor, "currentNetworkType") != 0;
  if (self->_queue_hasNetwork != v3)
  {
    self->_queue_hasNetwork = v3;
    SULogInstallConstraints();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_hasNetwork)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_2128D9000, v4, OS_LOG_TYPE_DEFAULT, "%@ - network constraint changed (satisfied? %@)", (uint8_t *)&v7, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_networkMonitor, 0);
}

@end
