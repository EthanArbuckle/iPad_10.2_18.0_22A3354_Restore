@implementation PVThermalMonitor

- (PVThermalMonitor)init
{
  PVThermalMonitor *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  NSObject *v8;
  uint64_t v9;
  PVThermalMonitor *v10;
  uint32_t v11;
  PVThermalMonitor *v12;
  NSObject *v13;
  PVThermalMonitor *v14;
  _QWORD block[4];
  PVThermalMonitor *v17;
  _QWORD handler[4];
  PVThermalMonitor *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PVThermalMonitor;
  v2 = -[PVThermalMonitor init](&v20, sel_init);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.PVThermalMonitor"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVThermalMonitor setHighestThermalLevel:](v2, "setHighestThermalLevel:", 0);
  -[PVThermalMonitor setCurrentThermalLevel:](v2, "setCurrentThermalLevel:", 0);
  v6 = objc_retainAutorelease(v5);
  v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
  -[PVThermalMonitor setQueue:](v2, "setQueue:", v7);

  v2->_enabled = 1;
  -[PVThermalMonitor queue](v2, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __24__PVThermalMonitor_init__block_invoke;
  handler[3] = &unk_1E64D5448;
  v10 = v2;
  v19 = v10;
  v11 = notify_register_dispatch("com.apple.system.thermalpressurelevel", &-[PVThermalMonitor init]::s_token, v8, handler);

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    -[PVThermalMonitor queue](v10, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __24__PVThermalMonitor_init__block_invoke_2;
    block[3] = &unk_1E64D47C0;
    v14 = v10;
    v17 = v14;
    dispatch_async(v13, block);

    v12 = v14;
  }

  return v12;
}

uint64_t __24__PVThermalMonitor_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  result = objc_msgSend(*(id *)(a1 + 32), "_updateThermalLevelsWithToken:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_postNotificationPrevious:new:", v4, objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel"));
  return result;
}

uint64_t __24__PVThermalMonitor_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateThermalLevelsWithToken:", -[PVThermalMonitor init]::s_token);
}

+ (id)sharedInstance
{
  if (+[PVThermalMonitor sharedInstance]::onceToken != -1)
    dispatch_once(&+[PVThermalMonitor sharedInstance]::onceToken, &__block_literal_global_6);
  return (id)+[PVThermalMonitor sharedInstance]::s_sharedInstance;
}

void __34__PVThermalMonitor_sharedInstance__block_invoke()
{
  PVThermalMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PVThermalMonitor);
  v1 = (void *)+[PVThermalMonitor sharedInstance]::s_sharedInstance;
  +[PVThermalMonitor sharedInstance]::s_sharedInstance = (uint64_t)v0;

}

- (BOOL)thermalLevelExceededNominal
{
  BOOL v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (-[PVThermalMonitor _disabledThermalTracking](self, "_disabledThermalTracking"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PVThermalMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PVThermalMonitor_thermalLevelExceededNominal__block_invoke;
  v6[3] = &unk_1E64D5490;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __47__PVThermalMonitor_thermalLevelExceededNominal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "highestThermalLevel");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

- (int)thermalLevel
{
  int v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  if (-[PVThermalMonitor _disabledThermalTracking](self, "_disabledThermalTracking"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PVThermalMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PVThermalMonitor_thermalLevel__block_invoke;
  v6[3] = &unk_1E64D5490;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __32__PVThermalMonitor_thermalLevel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)highestThermalLevelReached
{
  int v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  if (-[PVThermalMonitor _disabledThermalTracking](self, "_disabledThermalTracking"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PVThermalMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PVThermalMonitor_highestThermalLevelReached__block_invoke;
  v6[3] = &unk_1E64D5490;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __46__PVThermalMonitor_highestThermalLevelReached__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "highestThermalLevel");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)thermalLevelLabel
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[PVThermalMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PVThermalMonitor_thermalLevelLabel__block_invoke;
  v6[3] = &unk_1E64D5490;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__PVThermalMonitor_thermalLevelLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_msgSend(*(id *)(a1 + 32), "currentThermalLevel");
  v4 = objc_msgSend(*(id *)(a1 + 32), "_disabledThermalTracking");
  v5 = &stru_1E65EDDA0;
  if (v4)
    v5 = CFSTR("*");
  objc_msgSend(v2, "stringWithFormat:", CFSTR("T %d%@"), v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)_updateThermalLevelsWithToken:(int)a3
{
  uint32_t state;
  uint64_t state64;

  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (!state)
    -[PVThermalMonitor _setCurrentThermalLevel:](self, "_setCurrentThermalLevel:", state64);
  return state == 0;
}

- (void)_setCurrentThermalLevel:(int)a3
{
  int v4;

  -[PVThermalMonitor setCurrentThermalLevel:](self, "setCurrentThermalLevel:", *(_QWORD *)&a3);
  v4 = -[PVThermalMonitor currentThermalLevel](self, "currentThermalLevel");
  if (v4 > -[PVThermalMonitor highestThermalLevel](self, "highestThermalLevel"))
    -[PVThermalMonitor setHighestThermalLevel:](self, "setHighestThermalLevel:", -[PVThermalMonitor currentThermalLevel](self, "currentThermalLevel"));
}

- (void)_postNotificationPrevious:(int)a3 new:(int)a4
{
  _QWORD block[4];
  int v5;
  int v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PVThermalMonitor__postNotificationPrevious_new___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  v5 = a3;
  v6 = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __50__PVThermalMonitor__postNotificationPrevious_new___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("PVThermalMonitorLevelChangedPreviousLevelKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("PVThermalMonitorLevelChangedNewLevelKey");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PVThermalMonitorLevelChangedNotification"), 0, v4);

}

- (BOOL)_disabledThermalTracking
{
  return !-[PVThermalMonitor enabled](self, "enabled");
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)hasGoneAboveNominal
{
  return self->_hasGoneAboveNominal;
}

- (void)setHasGoneAboveNominal:(BOOL)a3
{
  self->_hasGoneAboveNominal = a3;
}

- (int)currentThermalLevel
{
  return self->_currentThermalLevel;
}

- (void)setCurrentThermalLevel:(int)a3
{
  self->_currentThermalLevel = a3;
}

- (int)highestThermalLevel
{
  return self->_highestThermalLevel;
}

- (void)setHighestThermalLevel:(int)a3
{
  self->_highestThermalLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
