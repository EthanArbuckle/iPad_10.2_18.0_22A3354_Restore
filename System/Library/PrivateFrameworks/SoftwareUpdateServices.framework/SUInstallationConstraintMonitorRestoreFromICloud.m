@implementation SUInstallationConstraintMonitorRestoreFromICloud

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  NSObject *v6;
  id v7;
  _DWORD *v8;
  int *v9;
  _DWORD *v10;
  const char *v11;
  _QWORD handler[5];
  _QWORD v14[5];
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  v16.receiver = self;
  v16.super_class = (Class)SUInstallationConstraintMonitorRestoreFromICloud;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v16, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v6, 8, v7);
  v9 = v8;
  if (v8)
  {
    v8[13] = -1;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__5;
    v14[4] = __Block_byref_object_dispose__5;
    v10 = v8;
    v15 = v10;
    v11 = (const char *)objc_msgSend((id)*MEMORY[0x24BE66C78], "UTF8String");
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __77__SUInstallationConstraintMonitorRestoreFromICloud_initOnQueue_withDownload___block_invoke;
    handler[3] = &unk_24CE3C720;
    handler[4] = v14;
    notify_register_dispatch(v11, v9 + 13, v6, handler);
    objc_msgSend(v10, "_queue_restoreStateChanged");
    _Block_object_dispose(v14, 8);

  }
  return v9;
}

uint64_t __77__SUInstallationConstraintMonitorRestoreFromICloud_initOnQueue_withDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_queue_restoreStateChanged");
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_queue_restoreToken);
  self->_queue_restoreToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)SUInstallationConstraintMonitorRestoreFromICloud;
  -[SUInstallationConstraintMonitorRestoreFromICloud dealloc](&v3, sel_dealloc);
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_isRestoring)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

- (void)_queue_restoreStateChanged
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  uint64_t state64;
  uint8_t buf[4];
  SUInstallationConstraintMonitorRestoreFromICloud *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  state64 = 0;
  notify_get_state(self->_queue_restoreToken, &state64);
  v3 = state64 - 1 < 2;
  if (self->_queue_isRestoring != v3)
  {
    self->_queue_isRestoring = v3;
    SULogInstallConstraints();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_isRestoring)
        v5 = CFSTR("NO");
      else
        v5 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_2128D9000, v4, OS_LOG_TYPE_DEFAULT, "%@ - iCloud restore constraint changed (satisfied? %@)", buf, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

@end
