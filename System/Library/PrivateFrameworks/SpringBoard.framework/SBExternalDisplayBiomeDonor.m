@implementation SBExternalDisplayBiomeDonor

- (SBExternalDisplayBiomeDonor)init
{
  SBExternalDisplayBiomeDonor *v2;
  SBSExternalDisplayService *v3;
  SBSExternalDisplayService *externalDisplayService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBExternalDisplayBiomeDonor;
  v2 = -[SBExternalDisplayBiomeDonor init](&v6, sel_init);
  if (v2)
  {
    v3 = (SBSExternalDisplayService *)objc_alloc_init(MEMORY[0x1E0DAAE48]);
    externalDisplayService = v2->_externalDisplayService;
    v2->_externalDisplayService = v3;

    -[SBSExternalDisplayService addObserver:](v2->_externalDisplayService, "addObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSExternalDisplayService removeObserver:](self->_externalDisplayService, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayBiomeDonor;
  -[SBExternalDisplayBiomeDonor dealloc](&v3, sel_dealloc);
}

- (void)externalDisplayDidConnect:(id)a3
{
  -[SBExternalDisplayBiomeDonor _donateToBiomeIfNecessaryForDisplayInfo:connect:](self, "_donateToBiomeIfNecessaryForDisplayInfo:connect:", a3, 1);
}

- (void)externalDisplayWillDisconnect:(id)a3
{
  -[SBExternalDisplayBiomeDonor _donateToBiomeIfNecessaryForDisplayInfo:connect:](self, "_donateToBiomeIfNecessaryForDisplayInfo:connect:", a3, 0);
}

- (void)_donateToBiomeIfNecessaryForDisplayInfo:(id)a3 connect:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSMutableDictionary *biomeDonationTimers;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  _SBDisplayConnectionDonationTimer *v11;
  _SBDisplayConnectionDonationTimer *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *, char, char);
  void *v21;
  SBExternalDisplayBiomeDonor *v22;
  id v23;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    biomeDonationTimers = self->_biomeDonationTimers;
    if (!biomeDonationTimers)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = self->_biomeDonationTimers;
      self->_biomeDonationTimers = v9;

      biomeDonationTimers = self->_biomeDonationTimers;
    }
    -[NSMutableDictionary objectForKey:](biomeDonationTimers, "objectForKey:", v7);
    v11 = (_SBDisplayConnectionDonationTimer *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = [_SBDisplayConnectionDonationTimer alloc];
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v6, "isMirrored");
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke;
      v21 = &unk_1E8EBAAD0;
      v22 = self;
      v17 = v7;
      v23 = v17;
      v11 = -[_SBDisplayConnectionDonationTimer initWithUniqueId:deviceName:productName:connect:mirroring:handler:](v12, "initWithUniqueId:deviceName:productName:connect:mirroring:handler:", v13, v14, v15, v4, v16, &v18);

      -[NSMutableDictionary setObject:forKey:](self->_biomeDonationTimers, "setObject:forKey:", v11, v17, v18, v19, v20, v21, v22);
    }
    -[_SBDisplayConnectionDonationTimer resetTimerOnConnect:](v11, "resetTimerOnConnect:", v4);

  }
}

void __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5, char a6)
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  char v25;
  char v26;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  dispatch_get_global_queue(-32768, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke_2;
  v21 = &unk_1E8EBAAA8;
  v25 = a5;
  v22 = v12;
  v23 = v11;
  v24 = v13;
  v26 = a6;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  dispatch_async(v14, &v18);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40), v18, v19, v20, v21);
}

void __79__SBExternalDisplayBiomeDonor__donateToBiomeIfNecessaryForDisplayInfo_connect___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D02300]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithStarting:deviceName:uniqueId:productName:mirroringMode:", v3, v4, v5, v6, v7);

  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SpringBoard");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ExternalDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "DisplayConnected");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:", v8);
  SBLogBiome();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    NSStringFromBOOL();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413314;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 2114;
    v25 = v17;
    v26 = 2114;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Donate display connected: %@ uuid: %{public}@ deviceName: %{public}@ productname: %{public}@ mirroring: %@", (uint8_t *)&v20, 0x34u);

  }
}

- (SBSExternalDisplayService)externalDisplayService
{
  return self->_externalDisplayService;
}

- (NSMutableDictionary)biomeDonationTimers
{
  return self->_biomeDonationTimers;
}

- (void)setBiomeDonationTimers:(id)a3
{
  objc_storeStrong((id *)&self->_biomeDonationTimers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeDonationTimers, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
}

@end
