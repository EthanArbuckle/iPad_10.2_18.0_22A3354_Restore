@implementation SUInstallationConstraintMonitorDriving

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  BSDispatchQueueAssert();
  v11.receiver = self;
  v11.super_class = (Class)SUInstallationConstraintMonitorDriving;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v11, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v7, 2048, v6);

  if (v8)
  {
    v8[48] = 0;
    if (objc_msgSend(MEMORY[0x24BDC1438], "isAvailable"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__handleVehicularStateChangeNotification_, *MEMORY[0x24BDC1468], 0);

      objc_msgSend(v8, "_queue_pollSatisfied");
    }
  }
  return v8;
}

- (void)_queue_pollSatisfied
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  SUInstallationConstraintMonitorDriving *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v3 = objc_msgSend(MEMORY[0x24BDC1438], "vehicularState") == 2
    && objc_msgSend(MEMORY[0x24BDC1438], "vehicularOperatorState") != 1;
  if (self->_queue_isDriving != v3)
  {
    self->_queue_isDriving = v3;
    SULogInstallConstraints();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isDriving)
        v5 = CFSTR("NO");
      else
        v5 = CFSTR("YES");
      v7 = 138412546;
      v8 = self;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_2128D9000, v4, OS_LOG_TYPE_DEFAULT, "%@ - is driving constraint changed (satisfied? %@)", (uint8_t *)&v7, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

- (void)_handleVehicularStateChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__SUInstallationConstraintMonitorDriving__handleVehicularStateChangeNotification___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __82__SUInstallationConstraintMonitorDriving__handleVehicularStateChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_isDriving)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

@end
