@implementation SBAirplaneModeController

+ (id)sharedInstance
{
  if (sharedInstance___sharedAirplaneToken != -1)
    dispatch_once(&sharedInstance___sharedAirplaneToken, &__block_literal_global_200);
  return (id)sharedInstance___airplaneModeController;
}

- (BOOL)isInAirplaneMode
{
  return self->_cachedInAirplaneMode;
}

void __42__SBAirplaneModeController_sharedInstance__block_invoke()
{
  SBAirplaneModeController *v0;
  void *v1;

  v0 = objc_alloc_init(SBAirplaneModeController);
  v1 = (void *)sharedInstance___airplaneModeController;
  sharedInstance___airplaneModeController = (uint64_t)v0;

}

- (SBAirplaneModeController)init
{
  SBAirplaneModeController *v2;
  uint64_t Serial;
  OS_dispatch_queue *radioQueue;
  uint64_t v5;
  RadiosPreferences *radioPrefs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAirplaneModeController;
  v2 = -[SBAirplaneModeController init](&v8, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    radioQueue = v2->_radioQueue;
    v2->_radioQueue = (OS_dispatch_queue *)Serial;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9B8]), "initWithQueue:", v2->_radioQueue);
    radioPrefs = v2->_radioPrefs;
    v2->_radioPrefs = (RadiosPreferences *)v5;

    -[RadiosPreferences setDelegate:](v2->_radioPrefs, "setDelegate:", v2);
    -[RadiosPreferences refresh](v2->_radioPrefs, "refresh");
    v2->_cachedInAirplaneMode = -[RadiosPreferences airplaneMode](v2->_radioPrefs, "airplaneMode");
  }
  return v2;
}

- (void)setInAirplaneMode:(BOOL)a3
{
  -[RadiosPreferences setAirplaneMode:](self->_radioPrefs, "setAirplaneMode:", a3);
}

- (void)airplaneModeChanged
{
  char v3;
  _QWORD v4[5];
  char v5;

  -[RadiosPreferences refresh](self->_radioPrefs, "refresh");
  v3 = -[RadiosPreferences airplaneMode](self->_radioPrefs, "airplaneMode");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SBAirplaneModeController_airplaneModeChanged__block_invoke;
  v4[3] = &unk_1E8E9F508;
  v5 = v3;
  v4[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

void __47__SBAirplaneModeController_airplaneModeChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC2C8], 0, 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = *(_BYTE *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "airplaneModeDidChange:", *(unsigned __int8 *)(a1 + 40));

    objc_msgSend(v2, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC2B8], 0, 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allApplications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHasDisplayedLaunchAlert:forType:", 0, 2);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    objc_msgSend(v2, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DAC2C0], 0, 0);
  }
}

- (SBAirplaneModeDelegate)delegate
{
  return (SBAirplaneModeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radioQueue, 0);
  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

@end
