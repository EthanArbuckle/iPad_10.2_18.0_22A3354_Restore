@implementation CACSystemStatusManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_35);
  return (id)sharedManager_sSharedManager;
}

void __39__CACSystemStatusManager_sharedManager__block_invoke()
{
  CACSystemStatusManager *v0;
  void *v1;

  v0 = objc_alloc_init(CACSystemStatusManager);
  v1 = (void *)sharedManager_sSharedManager;
  sharedManager_sSharedManager = (uint64_t)v0;

}

- (CACSystemStatusManager)init
{
  CACSystemStatusManager *v2;
  const char *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CACSystemStatusManager;
  v2 = -[CACSystemStatusManager init](&v14, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = (const char *)*MEMORY[0x24BEBE430];
    v4 = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC9B8];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = (uint64_t)__30__CACSystemStatusManager_init__block_invoke;
    v11[3] = (uint64_t)&unk_24F2ACF30;
    objc_copyWeak(&v12, &location);
    LODWORD(v3) = notify_register_dispatch(v3, &_notificationToken, v4, v11);

    if ((_DWORD)v3)
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _CACAssertionFailed((uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCommandAndControl/CommandAndControlFramework/SpokenCommandManager/CACSystemStatusManager.m", 52, (uint64_t)"-[CACSystemStatusManager init]", v6, CFSTR("Could not register for dictation notifications"), v7, v8, v9, v11[0]);

    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__CACSystemStatusManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id WeakRetained;
  uint64_t state64;

  CACLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __30__CACSystemStatusManager_init__block_invoke_cold_2(v2);

  state64 = 0;
  notify_get_state(_notificationToken, &state64);
  CACLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __30__CACSystemStatusManager_init__block_invoke_cold_1((uint64_t *)&state64, v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_systemDictationStatusDidChange:", state64 == 1);

}

- (BOOL)isDictationRunning
{
  return self->_isDictationRunning;
}

- (void)setIsDictationRunning:(BOOL)a3
{
  self->_isDictationRunning = a3;
}

void __30__CACSystemStatusManager_init__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "notifyd Keyboard Dictation GETSTATE %llu", (uint8_t *)&v3, 0xCu);
}

void __30__CACSystemStatusManager_init__block_invoke_cold_2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = _notificationToken;
  _os_log_debug_impl(&dword_229A40000, log, OS_LOG_TYPE_DEBUG, "notifyd Keyboard Dictation TOKEN %i", (uint8_t *)v1, 8u);
}

@end
