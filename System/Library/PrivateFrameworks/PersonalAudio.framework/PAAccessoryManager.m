@implementation PAAccessoryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_AccessoryManager;
}

void __36__PAAccessoryManager_sharedInstance__block_invoke()
{
  PAAccessoryManager *v0;
  void *v1;

  v0 = objc_alloc_init(PAAccessoryManager);
  v1 = (void *)sharedInstance_AccessoryManager;
  sharedInstance_AccessoryManager = (uint64_t)v0;

}

- (PAAccessoryManager)init
{
  PAAccessoryManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  PAAccessoryManager *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  PAAccessoryManager *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)PAAccessoryManager;
  v2 = -[PAAccessoryManager init](&v35, sel_init);
  if (v2)
  {
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShouldUpdateAccessory:", 1);

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_shouldSendUpdate = objc_msgSend(v4, "shouldUpdateAccessory");

    objc_initWeak(&location, v2);
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __26__PAAccessoryManager_init__block_invoke;
    v32[3] = &unk_1EA902190;
    objc_copyWeak(&v33, &location);
    objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", v32, sel_shouldUpdateAccessory, v2);

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __26__PAAccessoryManager_init__block_invoke_8;
    v30[3] = &unk_1EA902190;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v7, "registerUpdateBlock:forRetrieveSelector:withListener:", v30, sel_personalMediaConfigurationByRouteUID, v2);

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __26__PAAccessoryManager_init__block_invoke_13;
    v28[3] = &unk_1EA902190;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v8, "registerUpdateBlock:forRetrieveSelector:withListener:", v28, sel_personalMediaEnabledByRouteUID, v2);

    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __26__PAAccessoryManager_init__block_invoke_18;
    v26[3] = &unk_1EA902190;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", v26, sel_accommodationTypesByRouteUID, v2);

    objc_msgSend(getHUAccessoryManagerClass(), "sharedInstance");
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __26__PAAccessoryManager_init__block_invoke_23;
    v23[3] = &unk_1EA9021B8;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v10;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v10, "registerDiscoveryBlock:withListener:", v23, v2);
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __26__PAAccessoryManager_init__block_invoke_2;
    v20[3] = &unk_1EA902200;
    v11 = v2;
    v21 = v11;
    v12 = v10;
    v22 = v12;
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("d5621cc1-f7ab-45db-9403-9eaf744d5390"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerUpdateBlock:forCharacteristicUUIDs:withListener:", v20, v14, v11);

    objc_msgSend(v12, "registerLoggingBlock:withListener:", &__block_literal_global_38, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v16 = (id *)getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr;
    v39 = getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr;
    if (!getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr)
    {
      v17 = (void *)HearingUtilitiesLibrary();
      v16 = (id *)dlsym(v17, "AXHearingAidAudioRoutesChangedNotification");
      v37[3] = (uint64_t)v16;
      getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr = (uint64_t)v16;
    }
    _Block_object_dispose(&v36, 8);
    if (!v16)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v18 = *v16;
    objc_msgSend(v15, "addObserver:selector:name:object:", v11, sel_routesDidChange_, v18, 0);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__PAAccessoryManager_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUpdateAccessory");

  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Should send %d"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke", 62, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldSendUpdate:", v3);

}

void __26__PAAccessoryManager_init__block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Configuration updated. Attempting to send to accessory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke", 68, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendPMEConfigurationToAccessory");

}

void __26__PAAccessoryManager_init__block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PME updated. Attempting to send to accessory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke", 73, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendPMEConfigurationToAccessory");

}

void __26__PAAccessoryManager_init__block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PME types updated. Attempting to send to accessory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke", 78, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendPMEConfigurationToAccessory");

}

void __26__PAAccessoryManager_init__block_invoke_23(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("d5621cc1-f7ab-45db-9403-9eaf744d5390"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readValueForCharacteristicUUID:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sendPMEConfigurationToAccessory");

}

void __26__PAAccessoryManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  os_log_t *v15;
  void *v16;
  id v17;
  NSObject *v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  double v26;
  void *v27;
  void *v28;
  os_log_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  dispatch_time_t v40;
  NSObject *v41;
  uint8_t v42[4];
  uint64_t v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0C97778];
  v10 = a3;
  objc_msgSend(v9, "UUIDWithString:", CFSTR("d5621cc1-f7ab-45db-9403-9eaf744d5390"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (v12)
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found value for transparency %@ - %@"), v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke_2", 104, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (os_log_t *)MEMORY[0x1E0D2F9A8];
    v16 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v14);
      v18 = v16;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = objc_msgSend(v17, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (v8)
    {
      v50 = 0;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      *(_OWORD *)buf = 0u;
      v45 = 0u;
      objc_msgSend(v8, "getBytes:length:", buf, 100);
      v19 = *(float *)buf;
      v20 = fmaxf(fminf(*((float *)&v46 + 1), 2.0), -1.0);
      v21 = fmaxf(fminf(*((float *)&v49 + 1), 2.0), -1.0);
      v22 = fminf(*((float *)&v49 + 2), 1.0);
      v23 = (float)((float)(v21 - fmaxf(v21 - v20, 0.0)) + 1.0) * 0.5;
      v24 = (float)((float)(v21 - v20) + 1.0) * 0.5;
      if (v22 <= -1.0)
        v25 = 0.0;
      else
        v25 = (float)(v22 + 1.0) * 0.5;
      PAInitializeLogging();
      v26 = v25;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reading transparency settings %lf, %lf, %lf, %lf = %lf, %lf, %lf, %lf, %lf = %@"), *(float *)buf, v20, v21, *(_QWORD *)&v26, v23, v24, *(_QWORD *)&v26, *(float *)&v47, *((float *)&v46 + 3), v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke", 129, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_retainAutorelease(v28);
        v31 = v29;
        *(_DWORD *)v42 = 136446210;
        v43 = objc_msgSend(v30, "UTF8String");
        _os_log_impl(&dword_1DE3BE000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", v42, 0xCu);

      }
      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setShouldUpdateAccessory:", 0);

      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTransparencyTone:forAddress:", v7, v26);

      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTransparencyBalance:forAddress:", v7, v24);

      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTransparencyAmplification:forAddress:", v7, v23);

      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v37) = HIDWORD(v46);
      objc_msgSend(v36, "setTransparencyBeamforming:forAddress:", *((float *)&v46 + 3) != 0.0, v7, v37);

      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTransparencyNoiseSupressor:forAddress:", v7, *(float *)&v47);

      +[PASettings sharedInstance](PASettings, "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setTransparencyCustomized:forAddress:", v19 != 0.0, v7);

      v40 = dispatch_time(0, 100000000);
      objc_msgSend(*(id *)(a1 + 40), "sharedQueue");
      v41 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v40, v41, &__block_literal_global_33);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sendUpdateToAccessory");
    }
  }

}

void __26__PAAccessoryManager_init__block_invoke_32()
{
  id v0;

  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldUpdateAccessory:", 1);

}

void __26__PAAccessoryManager_init__block_invoke_2_36(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager init]_block_invoke_2", 147, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)routesDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Routes changes: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager routesDidChange:]", 158, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[PAAccessoryManager sendPMEConfigurationToAccessory](self, "sendPMEConfigurationToAccessory");
  -[PAAccessoryManager sendUpdateToAccessory](self, "sendUpdateToAccessory");
}

- (void)sendUpdateToAccessory
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_shouldSendUpdate)
  {
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("d5621cc1-f7ab-45db-9403-9eaf744d5390"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getHUAccessoryManagerClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke;
    v8[3] = &unk_1EA902270;
    v9 = v3;
    v10 = v2;
    v4 = v2;
    v5 = v3;
    objc_msgSend(v5, "getAvailableAddressesSupportingCharacteristic:withCompletion:", 0, v8);

  }
  else
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping update"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendUpdateToAccessory]", 203, v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_retainAutorelease(v4);
      v7 = v6;
      *(_DWORD *)buf = 136446210;
      v12 = objc_msgSend(v4, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

void __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke_2;
  v4[3] = &unk_1EA902248;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);

}

void __43__PAAccessoryManager_sendUpdateToAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personalMediaConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "transparencySettingsForAddress:", v3);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, 100);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending update to %@ - %@ - %@"), v3, v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendUpdateToAccessory]_block_invoke_2", 185, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v9);
      v12 = v10;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "writeValue:forCharacteristicUUID:andAddress:", v7, *(_QWORD *)(a1 + 40), v3);
    free(v6);
  }
  else
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not updating accessory. There is no configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendUpdateToAccessory]_block_invoke", 191, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (void)sendPMEConfigurationToAccessory
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  AXDispatchTimer *pmeHysteresisTimer;
  AXDispatchTimer *v11;
  AXDispatchTimer *v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUpdateAccessory");

  if ((v4 & 1) == 0)
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping update"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendPMEConfigurationToAccessory]", 214, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v14 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  pmeHysteresisTimer = self->_pmeHysteresisTimer;
  if (!pmeHysteresisTimer)
  {
    v11 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x1E0CF3978]);
    v12 = self->_pmeHysteresisTimer;
    self->_pmeHysteresisTimer = v11;

    pmeHysteresisTimer = self->_pmeHysteresisTimer;
  }
  if ((-[AXDispatchTimer isPending](pmeHysteresisTimer, "isPending") & 1) == 0)
    -[AXDispatchTimer afterDelay:processBlock:](self->_pmeHysteresisTimer, "afterDelay:processBlock:", &__block_literal_global_59, 0.5);
}

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke()
{
  void *v0;
  unsigned int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "getAACPCapabilityBit:", 17);
  objc_msgSend(v0, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1 && objc_msgSend(v2, "length"))
  {
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personalMediaConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v0, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onBudsMediaSettingsForRoute:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getHUAccessoryManagerClass(), "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_2;
    v14[3] = &unk_1EA902270;
    v15 = v7;
    v16 = v5;
    v10 = v5;
    v11 = v7;
    objc_msgSend(v8, "getIdentifiersFromAddresses:withCompletion:", v9, v14);

  }
  else
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device isn't supported [%d, %d] %@"), v1, 0, v0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendPMEConfigurationToAccessory]_block_invoke", 253, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v11);
      v13 = v12;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v11, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && *(_QWORD *)(a1 + 32))
  {
    +[PAHMSManager sharedInstance](PAHMSManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendConfigUpdate:forIdentifier:withCompletion:", *(_QWORD *)(a1 + 32), v3, &__block_literal_global_62);

  }
  else
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Media settings nil or identifier can't be found [%@]. Config is %@"), v3, *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendPMEConfigurationToAccessory]_block_invoke", 247, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_retainAutorelease(v6);
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      v11 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

void __53__PAAccessoryManager_sendPMEConfigurationToAccessory__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sent updates to buds with error %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAAccessoryManager sendPMEConfigurationToAccessory]_block_invoke_3", 242, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (BOOL)shouldSendUpdate
{
  return self->_shouldSendUpdate;
}

- (void)setShouldSendUpdate:(BOOL)a3
{
  self->_shouldSendUpdate = a3;
}

- (AXDispatchTimer)pmeHysteresisTimer
{
  return self->_pmeHysteresisTimer;
}

- (void)setPmeHysteresisTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pmeHysteresisTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pmeHysteresisTimer, 0);
}

@end
