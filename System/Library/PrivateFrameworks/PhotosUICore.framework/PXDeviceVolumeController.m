@implementation PXDeviceVolumeController

- (PXDeviceVolumeController)initWithIsInSilentMode:(BOOL)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDeviceVolumeController.m"), 48, CFSTR("%s is not available as initializer"), "-[PXDeviceVolumeController initWithIsInSilentMode:]");

  abort();
}

- (id)_initAsSharedInstance
{
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  float v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t (**v19)(_QWORD);
  NSObject *v20;
  PXDeviceVolumeController *v21;
  PXDeviceVolumeController *v22;
  NSObject *log;
  void *v24;
  objc_super v26;
  _QWORD handler[4];
  NSObject *v28;
  id v29;
  id v30;
  id location;
  _QWORD aBlock[4];
  NSObject *v33;
  _BYTE *v34;
  id v35;
  float v36;
  uint8_t v37[4];
  int v38;
  _BYTE buf[24];
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  v6 = os_log_create((const char *)*MEMORY[0x1E0D744D8], v5);
  objc_msgSend(MEMORY[0x1E0D48560], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0.0;
  v35 = 0;
  v8 = objc_msgSend(v7, "getActiveCategoryVolume:andName:", &v36, &v35);
  v9 = v35;
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(double *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "active category volume %f name %{public}@", buf, 0x16u);
    }
    v10 = v36;
  }
  else
  {
    v10 = 0.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "failed to get active category volume", buf, 2u);
    }
  }
  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "honorSilentMode") & 1) == 0)
  {
    v12 = 0;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v13 = "ignoring silent mode";
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "simulateSilentMode"))
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "simulated silent mode", buf, 2u);
    }
    v12 = 1;
    goto LABEL_21;
  }
  if ((PLPhysicalDeviceIsIPad() & 1) != 0)
  {
    v12 = 0;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v13 = "device has no physical ringer switch";
LABEL_14:
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    v12 = 0;
    goto LABEL_21;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = MEMORY[0x1E0C809B0];
  v40 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke;
  aBlock[3] = &unk_1E513BDC8;
  v34 = buf;
  v15 = v6;
  v33 = v15;
  v16 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v17 = *(_QWORD *)&buf[8];
  v18 = MEMORY[0x1E0C80D38];
  handler[0] = v14;
  handler[1] = 3221225472;
  handler[2] = __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_9;
  handler[3] = &unk_1E513BE10;
  v19 = v16;
  v29 = v19;
  v20 = v15;
  v28 = v20;
  objc_copyWeak(&v30, &location);
  notify_register_dispatch("com.apple.springboard.ringerstate", (int *)(v17 + 24), MEMORY[0x1E0C80D38], handler);

  v12 = v19[2](v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 67109120;
    v38 = v12;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "ringer muted %i", v37, 8u);
  }
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);
LABEL_21:
  v26.receiver = self;
  v26.super_class = (Class)PXDeviceVolumeController;
  v21 = -[PXVolumeController initWithIsInSilentMode:](&v26, sel_initWithIsInSilentMode_, v12);
  v22 = v21;
  if (v21)
  {
    log = v21->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v12;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = v10;
      _os_log_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEFAULT, "initialized muted %i volume %f", buf, 0x12u);
    }
    objc_storeStrong((id *)&v22->_log, v6);
    v22->_lastKnownVolume = v10;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v22, sel__handleSystemVolumeChange_, *MEMORY[0x1E0D482B0], v7);

    objc_msgSend(v11, "addDeferredKeyObserver:", v22);
  }

  return v22;
}

- (void)_handleSystemVolumeChange:(id)a3
{
  void *v4;
  NSObject *log;
  void *v6;
  float v7;
  float v8;
  void *v9;
  char v10;
  NSObject *v11;
  float lastKnownVolume;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_debug_impl(&dword_1A6789000, log, OS_LOG_TYPE_DEBUG, "volume changed %@", (uint8_t *)&v16, 0xCu);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D47EC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("ExplicitVolumeChange"));

  if ((v10 & 1) != 0)
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "explicit volume change %@", (uint8_t *)&v16, 0xCu);
    }
    lastKnownVolume = self->_lastKnownVolume;
    if (v8 == 1.0 || v8 > lastKnownVolume)
    {
      v14 = &__block_literal_global_18_237935;
LABEL_18:
      -[PXVolumeController performChanges:](self, "performChanges:", v14);
      goto LABEL_19;
    }
    if (v8 == 0.0 || v8 < lastKnownVolume)
    {
      v14 = &__block_literal_global_19_237936;
      goto LABEL_18;
    }
  }
LABEL_19:
  self->_lastKnownVolume = v8;

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[4];
  id v12;
  PXDeviceVolumeController *v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  NSStringFromSelector(sel_simulateSilentMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PXDeviceVolumeController_settings_changedValueForKey___block_invoke;
    v11[3] = &unk_1E513BE98;
    v13 = self;
    v14 = a2;
    v12 = v7;
    -[PXVolumeController performChanges:](self, "performChanges:", v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

void __56__PXDeviceVolumeController_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setIsInSilentMode:", objc_msgSend(v4, "simulateSilentMode"));

}

uint64_t __54__PXDeviceVolumeController__handleSystemVolumeChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "decreaseVolume");
}

uint64_t __54__PXDeviceVolumeController__handleSystemVolumeChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "increaseVolume");
}

BOOL __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke(uint64_t a1)
{
  uint32_t state;
  uint32_t v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t state64;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), &state64);
  if (state)
  {
    v3 = state;
    v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v3;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "failed to get ringer state %i", buf, 8u);
    }
    return 0;
  }
  else
  {
    v6 = state64;
    v5 = state64 == 0;
    v7 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v6 == 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "ringer state is on mute %i", buf, 8u);
    }
  }
  return v5;
}

void __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_9(uint64_t a1)
{
  int v2;
  NSObject *v3;
  id WeakRetained;
  _QWORD v5[4];
  char v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v2;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "ringer changed to muted %i", buf, 8u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_10;
  v5[3] = &__block_descriptor_33_e37_v16__0___PXMutableVolumeController__8l;
  v6 = v2;
  objc_msgSend(WeakRetained, "performChanges:", v5);

}

uint64_t __49__PXDeviceVolumeController__initAsSharedInstance__block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsInSilentMode:", *(unsigned __int8 *)(a1 + 32));
}

+ (PXDeviceVolumeController)sharedInstance
{
  if (sharedInstance_onceToken_237966 != -1)
    dispatch_once(&sharedInstance_onceToken_237966, &__block_literal_global_237967);
  return (PXDeviceVolumeController *)(id)sharedInstance_sharedInstance_237968;
}

void __42__PXDeviceVolumeController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PXDeviceVolumeController _initAsSharedInstance]([PXDeviceVolumeController alloc], "_initAsSharedInstance");
  v1 = (void *)sharedInstance_sharedInstance_237968;
  sharedInstance_sharedInstance_237968 = (uint64_t)v0;

}

@end
