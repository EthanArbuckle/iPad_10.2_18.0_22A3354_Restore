@implementation SUInstallationConstraintMonitorRestoreFromITunes

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint64_t state64;
  _QWORD v18[5];
  _QWORD handler[5];
  _QWORD v20[5];
  id v21;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  v22.receiver = self;
  v22.super_class = (Class)SUInstallationConstraintMonitorRestoreFromITunes;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v22, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v6, 64, v7);
  v9 = v8;
  if (v8)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__3;
    v20[4] = __Block_byref_object_dispose__3;
    v10 = v8;
    v21 = v10;
    v11 = (const char *)objc_msgSend(CFSTR("com.apple.MobileSync.BackupAgent.RestoreStarted"), "UTF8String");
    v12 = *((_QWORD *)v10 + 1);
    v13 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke;
    handler[3] = &unk_24CE3C720;
    handler[4] = v20;
    notify_register_dispatch(v11, (int *)v10 + 13, v12, handler);
    v14 = (const char *)objc_msgSend(CFSTR("com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded"), "UTF8String");
    v15 = *((_QWORD *)v10 + 1);
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke_2;
    v18[3] = &unk_24CE3C720;
    v18[4] = v20;
    notify_register_dispatch(v14, (int *)v10 + 14, v15, v18);
    state64 = 0;
    notify_get_state(*((_DWORD *)v10 + 13), &state64);
    if (state64)
      objc_msgSend(v10, "_queue_beganRestoring");
    _Block_object_dispose(v20, 8);

  }
  return v9;
}

uint64_t __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_queue_beganRestoring");
}

uint64_t __77__SUInstallationConstraintMonitorRestoreFromITunes_initOnQueue_withDownload___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_queue_endedRestoring");
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_queue_startNotifyToken);
  self->_queue_startNotifyToken = -1;
  notify_cancel(self->_queue_endNotifyToken);
  self->_queue_endNotifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)SUInstallationConstraintMonitorRestoreFromITunes;
  -[SUInstallationConstraintMonitorRestoreFromITunes dealloc](&v3, sel_dealloc);
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_isRestoring)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

- (void)_queue_beganRestoring
{
  BSDispatchQueueAssert();
  -[SUInstallationConstraintMonitorRestoreFromITunes _queue_setRestoring:](self, "_queue_setRestoring:", 1);
}

- (void)_queue_endedRestoring
{
  BSDispatchQueueAssert();
  -[SUInstallationConstraintMonitorRestoreFromITunes _queue_setRestoring:](self, "_queue_setRestoring:", 0);
}

- (void)_queue_setRestoring:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  SUInstallationConstraintMonitorRestoreFromITunes *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  if (self->_queue_isRestoring != v3)
  {
    self->_queue_isRestoring = v3;
    SULogInstallConstraints();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isRestoring)
        v6 = CFSTR("NO");
      else
        v6 = CFSTR("YES");
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ - iTunes restore constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

@end
