@implementation SUInstallationConstraintMonitorCarplay

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Class Class;
  objc_class *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  objc_super v41;

  v6 = a4;
  v7 = a3;
  BSDispatchQueueAssert();
  v41.receiver = self;
  v41.super_class = (Class)SUInstallationConstraintMonitorCarplay;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v41, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v7, 512, v6);

  if (v8)
  {
    if (dlopen("/System/Library/PrivateFrameworks/CarKit.framework/CarKit", 261))
    {
      Class = objc_getClass("CARSessionStatus");
      if (Class)
      {
        v17 = Class;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18 = [v17 alloc];
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v26 = v18;
            v27 = objc_msgSend(v26, "initAndWaitUntilSessionUpdated");
            v28 = (void *)*((_QWORD *)v8 + 7);
            *((_QWORD *)v8 + 7) = v27;

            v29 = (void *)*((_QWORD *)v8 + 7);
            if (v29)
            {
              objc_msgSend(v29, "setSessionObserver:", v8);
              objc_msgSend(*((id *)v8 + 7), "currentSession");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *((_BYTE *)v8 + 48) = v30 != 0;

              return v8;
            }
          }
          else
          {
            SULogInfo(CFSTR("dynamically loaded CARSessionStatus class does not respond to selector initAndWaitUntilSessionUpdated"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v41.receiver);
          }

LABEL_12:
          SULogInfo(CFSTR("Failed to dynamically load CARSessionStatus. Setting carplay enabled to NO"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)v41.receiver);
          v39 = (void *)*((_QWORD *)v8 + 7);
          *((_QWORD *)v8 + 7) = 0;

          *((_BYTE *)v8 + 48) = 0;
          return v8;
        }
        v31 = CFSTR("dynamically loaded CARSessionStatus class does not respond to selector alloc");
      }
      else
      {
        v31 = CFSTR("Failed to get class CARSessionStatus");
      }
    }
    else
    {
      v31 = CFSTR("Failed to open CarKit dylib");
    }
    SULogInfo(v31, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v41.receiver);
    goto LABEL_12;
  }
  return v8;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_CarplayConnected)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

- (void)_queue_carplayDidChange
{
  CARSessionStatus *queue_carSessionStatus;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  SUInstallationConstraintMonitorCarplay *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  queue_carSessionStatus = self->_queue_carSessionStatus;
  if (queue_carSessionStatus)
  {
    -[CARSessionStatus currentSession](queue_carSessionStatus, "currentSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  if (self->_queue_CarplayConnected != v5)
  {
    self->_queue_CarplayConnected = v5;
    SULogInstallConstraints();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_CarplayConnected)
        v7 = CFSTR("NO");
      else
        v7 = CFSTR("YES");
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_2128D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ - carplay constraint changed (satisfied? %@)", (uint8_t *)&v9, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SUInstallationConstraintMonitorCarplay_sessionDidConnect___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__SUInstallationConstraintMonitorCarplay_sessionDidConnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_carplayDidChange");
}

- (void)sessionDidDisconnect:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SUInstallationConstraintMonitorCarplay_sessionDidDisconnect___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __63__SUInstallationConstraintMonitorCarplay_sessionDidDisconnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_carplayDidChange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_carSessionStatus, 0);
}

@end
