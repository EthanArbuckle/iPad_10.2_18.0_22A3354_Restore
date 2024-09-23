@implementation SUInstallationConstraintMonitorForBatteryDiskAndKeybag

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  return -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:andInstallOptions:](self, "initOnQueue:withDownload:andInstallOptions:", a3, a4, 0);
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 andInstallOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:installOptions:pollDuration:keybag:](self, "initOnQueue:withDownload:installOptions:pollDuration:keybag:", v10, v9, v8, v11, 300.0);

  return v12;
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 pollDuration:(double)a5 keybag:(id)a6
{
  return -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:installOptions:pollDuration:keybag:](self, "initOnQueue:withDownload:installOptions:pollDuration:keybag:", a3, a4, 0, a6, a5);
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 installOptions:(id)a5 pollDuration:(double)a6 keybag:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[4];
  id v29[2];
  id location;
  objc_super v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  BSDispatchQueueAssert();
  v31.receiver = self;
  v31.super_class = (Class)SUInstallationConstraintMonitorForBatteryDiskAndKeybag;
  v16 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:andInstallOptions:](&v31, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_andInstallOptions_, v12, 53, v13, v14);
  v17 = (uint64_t)v16;
  if (v16)
  {
    v18 = (void *)v16[6];
    v16[6] = 0;

    *(_QWORD *)(v17 + 64) = 0;
    *(_BYTE *)(v17 + 72) = 0;
    *(_BYTE *)(v17 + 73) = 0;
    *(_BYTE *)(v17 + 74) = 0;
    *(_BYTE *)(v17 + 75) = 0;
    if (v15)
    {
      v19 = v15;
    }
    else
    {
      SULogInstallConstraints();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:installOptions:pollDuration:keybag:].cold.2(v20);

      +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = *(void **)(v17 + 48);
    *(_QWORD *)(v17 + 48) = v19;

    objc_msgSend(*(id *)(v17 + 48), "addObserver:", v17);
    objc_initWeak(&location, (id)v17);
    SULogInstallConstraints();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag initOnQueue:withDownload:installOptions:pollDuration:keybag:].cold.1(v17, v22, v23, a6);

    v24 = objc_alloc(MEMORY[0x24BE0BEB0]);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke;
    v28[3] = &unk_24CE3CCA8;
    objc_copyWeak(v29, &location);
    v29[1] = *(id *)&a6;
    v25 = objc_msgSend(v24, "initWithFireInterval:repeatInterval:leewayInterval:queue:handler:", v12, v28, a6, a6, 0.0);
    v26 = *(void **)(v17 + 56);
    *(_QWORD *)(v17 + 56) = v25;

    objc_msgSend(*(id *)(v17 + 56), "schedule");
    objc_msgSend((id)v17, "_queue_pollSatisfied");
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
  }

  return (id)v17;
}

void __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  SULogInstallConstraints();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_pollSatisfied");

}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2128D9000, a2, OS_LOG_TYPE_DEBUG, "%@ - timer invalidated", (uint8_t *)&v2, 0xCu);
}

uint64_t __65__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (unint64_t)deltaSpaceNeeded
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_deltaSpaceNeeded__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __74__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_deltaSpaceNeeded__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (unint64_t)unsatisfiedConstraints
{
  unint64_t v3;

  BSDispatchQueueAssert();
  v3 = !self->_queue_batterySatisfied;
  if (!self->_queue_diskSatisfied)
    v3 |= 4uLL;
  if (!self->_queue_keybagSatisfied)
    v3 |= 0x10uLL;
  if (self->_queue_passcodeSatisfied)
    return v3;
  else
    return v3 | 0x20;
}

- (void)refreshConstraints
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_refreshConstraints__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __76__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_refreshConstraints__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)keybagInterface:(id)a3 hasPasscodeSetDidChange:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_hasPasscodeSetDidChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __98__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_hasPasscodeSetDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __103__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_passcodeLockedStateDidChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __103__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterface_passcodeLockedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)keybagInterfacePasscodeDidChange:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterfacePasscodeDidChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __91__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_keybagInterfacePasscodeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (void)_queue_pollSatisfied
{
  NSObject *v3;
  SUKeybagInterface *v4;
  SUKeybagInterface *queue_keybag;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  SUInstallationConstraintMonitorForBatteryDiskAndKeybag *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  SULogInstallConstraints();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_2128D9000, v3, OS_LOG_TYPE_DEFAULT, "%@ - evaluating constraints for disk/battery/passcode/keybag", (uint8_t *)&v13, 0xCu);
  }

  if (!self->_queue_keybag)
  {
    +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
    v4 = (SUKeybagInterface *)objc_claimAutoreleasedReturnValue();
    queue_keybag = self->_queue_keybag;
    self->_queue_keybag = v4;

    -[SUKeybagInterface addObserver:](self->_queue_keybag, "addObserver:", self);
  }
  v6 = -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag _queue_evaluateBattery](self, "_queue_evaluateBattery");
  v7 = -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag _queue_evaluateDisk](self, "_queue_evaluateDisk");
  v8 = -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag _queue_evaluateKeybag](self, "_queue_evaluateKeybag");
  v9 = -[SUInstallationConstraintMonitorForBatteryDiskAndKeybag _queue_evaluatePasscodeLocked](self, "_queue_evaluatePasscodeLocked");
  v10 = v6;
  if (v7)
    v10 = v6 | 4;
  if (v8)
    v10 |= 0x10uLL;
  if (v9)
    v11 = v10 | 0x20;
  else
    v11 = v10;
  if (v11)
  {
    -[SUInstallationConstraintMonitorBase delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "installationConstraintMonitor:constraintsDidChange:", self, v11);

  }
}

- (BOOL)_queue_evaluateBattery
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int queue_batterySatisfied;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  SUInstallationConstraintMonitorForBatteryDiskAndKeybag *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  -[SUInstallationConstraintMonitorBase download](self, "download");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUInstallationConstraintMonitorBase installOptions](self, "installOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SUHasEnoughBatteryForInstallation(v4, v5);

  queue_batterySatisfied = self->_queue_batterySatisfied;
  if (queue_batterySatisfied != v6)
  {
    self->_queue_batterySatisfied = v6;
    SULogInstallConstraints();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_batterySatisfied)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ - battery constraint changed (satisfied? %@)", (uint8_t *)&v11, 0x16u);
    }

  }
  return queue_batterySatisfied != v6;
}

- (BOOL)_queue_evaluateDisk
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  BOOL v17;
  void *v19;
  void *v20;
  SUSpacePurgeOptions *v21;
  void *v22;
  void *v23;
  int v24;
  int queue_diskSatisfied;
  NSObject *v26;
  const __CFString *v27;
  _BYTE v28[12];
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  SULogInstallConstraints();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SUInstallationConstraintMonitorBase download](self, "download");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 134217984;
    *(_QWORD *)&v28[4] = v4;
    _os_log_impl(&dword_2128D9000, v3, OS_LOG_TYPE_DEFAULT, "evaluateDisk: download: (%p)", v28, 0xCu);

  }
  -[SUInstallationConstraintMonitorBase download](self, "download");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v16 = CFSTR("Download instance is nil");
LABEL_11:
    SULogInfo(v16, v5, v6, v7, v8, v9, v10, v11, *(uint64_t *)v28);
    v17 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = CFSTR("download not class SUDownload");
    goto LABEL_11;
  }
  objc_msgSend(v12, "descriptor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v16 = CFSTR("descriptor instance is nil");
    goto LABEL_11;
  }
  objc_msgSend(v12, "downloadOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v12, "downloadOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v20 = v15;
    objc_msgSend(v15, "isAutoDownload");

    goto LABEL_16;
  }
  objc_msgSend(v12, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v12, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:
  v21 = objc_alloc_init(SUSpacePurgeOptions);
  objc_msgSend(v12, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUSpacePurgeOptions setNeededBytes:](v21, "setNeededBytes:", objc_msgSend(v22, "installationSize"));

  -[SUSpacePurgeOptions setEnableCacheDelete:](v21, "setEnableCacheDelete:", 1);
  -[SUSpacePurgeOptions setEnableAppOffload:](v21, "setEnableAppOffload:", 0);
  -[SUSpacePurgeOptions setCacheDeleteUrgency:](v21, "setCacheDeleteUrgency:", 4);
  +[SUSpace hasSufficientSpaceWithOptions:error:](SUSpace, "hasSufficientSpaceWithOptions:error:", v21, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hasSufficientFreeSpace");
  self->_queue_deltaSpaceNeeded = objc_msgSend(v23, "additionalBytesRequired");
  queue_diskSatisfied = self->_queue_diskSatisfied;
  v17 = queue_diskSatisfied != v24;
  if (queue_diskSatisfied != v24)
  {
    self->_queue_diskSatisfied = v24;
    SULogInstallConstraints();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_diskSatisfied)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      *(_DWORD *)v28 = 138412546;
      *(_QWORD *)&v28[4] = self;
      v29 = 2112;
      v30 = v27;
      _os_log_impl(&dword_2128D9000, v26, OS_LOG_TYPE_DEFAULT, "%@ - disk constraint changed (satisfied? %@)", v28, 0x16u);
    }

  }
LABEL_12:

  return v17;
}

- (BOOL)_queue_evaluatePasscodeLocked
{
  int queue_keybagSatisfied;
  int queue_passcodeSatisfied;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  SUInstallationConstraintMonitorForBatteryDiskAndKeybag *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  if (-[SUKeybagInterface isPasscodeLocked](self->_queue_keybag, "isPasscodeLocked"))
    queue_keybagSatisfied = self->_queue_keybagSatisfied;
  else
    queue_keybagSatisfied = 1;
  queue_passcodeSatisfied = self->_queue_passcodeSatisfied;
  if (queue_passcodeSatisfied != queue_keybagSatisfied)
  {
    self->_queue_passcodeSatisfied = queue_keybagSatisfied;
    SULogInstallConstraints();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_passcodeSatisfied)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_2128D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ - passcode constraint changed (satisfied? %@)", (uint8_t *)&v8, 0x16u);
    }

  }
  return queue_passcodeSatisfied != queue_keybagSatisfied;
}

- (BOOL)_queue_evaluateKeybag
{
  SUKeybagInterface *queue_keybag;
  void *v4;
  void *v5;
  int v6;
  int queue_keybagSatisfied;
  NSObject *v8;
  const __CFString *v9;
  int v11;
  SUInstallationConstraintMonitorForBatteryDiskAndKeybag *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  queue_keybag = self->_queue_keybag;
  -[SUInstallationConstraintMonitorBase download](self, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUKeybagInterface installationKeybagStateForDescriptor:](queue_keybag, "installationKeybagStateForDescriptor:", v5) != 1;

  queue_keybagSatisfied = self->_queue_keybagSatisfied;
  if (queue_keybagSatisfied != v6)
  {
    self->_queue_keybagSatisfied = v6;
    SULogInstallConstraints();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_keybagSatisfied)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v11 = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2128D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ - keybag constraint changed (satisfied? %@)", (uint8_t *)&v11, 0x16u);
    }

  }
  return queue_keybagSatisfied != v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_timer, 0);
  objc_storeStrong((id *)&self->_queue_keybag, 0);
}

- (void)initOnQueue:(uint64_t)a3 withDownload:(double)a4 installOptions:pollDuration:keybag:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_0_1(&dword_2128D9000, a2, a3, "%@ - timer scheduled for interval @ %f s", (uint8_t *)&v4);
}

- (void)initOnQueue:(os_log_t)log withDownload:installOptions:pollDuration:keybag:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2128D9000, log, OS_LOG_TYPE_DEBUG, "No KeybagInterface instance provided to SUInstallationConstraintMonitorForBatteryDiskAndKeybag initializer", v1, 2u);
}

void __118__SUInstallationConstraintMonitorForBatteryDiskAndKeybag_initOnQueue_withDownload_installOptions_pollDuration_keybag___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  v7 = 138412546;
  v8 = WeakRetained;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_0_1(&dword_2128D9000, a2, v6, "%@ - timer fired @ %f s", (uint8_t *)&v7);

}

@end
