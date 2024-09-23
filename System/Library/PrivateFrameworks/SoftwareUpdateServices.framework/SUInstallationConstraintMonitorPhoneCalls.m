@implementation SUInstallationConstraintMonitorPhoneCalls

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x24BEB4938];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "callCenterWithQueue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUInstallationConstraintMonitorPhoneCalls initOnQueue:withDownload:callCenter:inSpringBoard:onExistingPhoneCall:](self, "initOnQueue:withDownload:callCenter:inSpringBoard:onExistingPhoneCall:", v8, v7, v9, 0, objc_msgSend(v9, "currentAudioAndVideoCallCount") != 0);

  return v10;
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 callCenter:(id)a5 inSpringBoard:(BOOL)a6 onExistingPhoneCall:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  id *v16;
  void *v17;
  objc_super v19;

  v7 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  BSDispatchQueueAssert();
  v19.receiver = self;
  v19.super_class = (Class)SUInstallationConstraintMonitorPhoneCalls;
  v16 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v19, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v15, 256, v14);

  if (v16)
  {
    objc_storeStrong(v16 + 6, a5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__callStatusChanged, *MEMORY[0x24BEB4AB8], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__callStatusChanged, *MEMORY[0x24BEB4AD0], 0);
    *((_BYTE *)v16 + 57) = a6;
    objc_msgSend(v16, "_queue_noteOnExistingPhoneCallDidChange:", v7);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUInstallationConstraintMonitorPhoneCalls;
  -[SUInstallationConstraintMonitorPhoneCalls dealloc](&v4, sel_dealloc);
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  if (self->_queue_satisfied)
    return 0;
  else
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
}

- (void)_callStatusChanged
{
  BOOL v3;
  NSObject *queue;
  _QWORD *v5;
  _QWORD block[5];
  _QWORD v7[5];
  BOOL v8;

  if (self->_inSpringBoard)
  {
    BSDispatchQueueAssertMain();
    v3 = -[TUCallCenter currentAudioAndVideoCallCount](self->_queue_callCenter, "currentAudioAndVideoCallCount") != 0;
    queue = self->super._queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke;
    v7[3] = &unk_24CE3BB60;
    v7[4] = self;
    v8 = v3;
    v5 = v7;
  }
  else
  {
    queue = self->super._queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke_2;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    v5 = block;
  }
  dispatch_async(queue, v5);
}

uint64_t __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteOnExistingPhoneCallDidChange:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63__SUInstallationConstraintMonitorPhoneCalls__callStatusChanged__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteOnExistingPhoneCallDidChange:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentAudioAndVideoCallCount") != 0);
}

- (void)_queue_noteOnExistingPhoneCallDidChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  SUInstallationConstraintMonitorPhoneCalls *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  if (self->_queue_satisfied != !v3)
  {
    self->_queue_satisfied = !v3;
    SULogInstallConstraints();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_satisfied)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ - phone call constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_callCenter, 0);
}

@end
