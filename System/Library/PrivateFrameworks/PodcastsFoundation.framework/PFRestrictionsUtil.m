@implementation PFRestrictionsUtil

- (void)beginListeningForChanges
{
  void *v2;
  PFRestrictionsUtil *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:", obj);

  obj->_isListening = 1;
  objc_sync_exit(obj);

}

+ (BOOL)isExplicitContentAllowed
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  char v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)_explicitContentAllowed;
  if (!_explicitContentAllowed)
  {
    v4 = objc_msgSend(v2, "_fetchIsExplicitContentAllowed");
    _MTLogCategoryRestrictions();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("Clean Only");
      if ((_DWORD)v4)
        v6 = CFSTR("Explicit Allowed");
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1A904E000, v5, OS_LOG_TYPE_DEFAULT, "Initial Setting load: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)_explicitContentAllowed;
    _explicitContentAllowed = v7;

    v3 = (void *)_explicitContentAllowed;
  }
  v9 = objc_msgSend(v3, "BOOLValue");
  objc_sync_exit(v2);

  return v9;
}

+ (BOOL)_fetchIsExplicitContentAllowed
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExplicitContentAllowedOutAsk:", 0);

  return v3;
}

+ (void)reloadSettings
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryRestrictions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1A904E000, v3, OS_LOG_TYPE_DEFAULT, "Reloading Settings", (uint8_t *)&v12, 2u);
  }

  v4 = a1;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v4, "_fetchIsExplicitContentAllowed");
  _MTLogCategoryRestrictions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("Clean Only");
    if ((_DWORD)v5)
      v7 = CFSTR("Explicit Allowed");
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_DEFAULT, "Fetching Setting: %@", (uint8_t *)&v12, 0xCu);
  }

  if (_explicitContentAllowed && (_DWORD)v5 == objc_msgSend((id)_explicitContentAllowed, "BOOLValue"))
  {
    objc_sync_exit(v4);

  }
  else
  {
    _MTLogCategoryRestrictions();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("Clean Only");
      if ((_DWORD)v5)
        v9 = CFSTR("Explicit Allowed");
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_DEFAULT, "Setting did change: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_explicitContentAllowed;
    _explicitContentAllowed = v10;

    objc_sync_exit(v4);
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_21);
  }
}

void __36__PFRestrictionsUtil_sharedInstance__block_invoke()
{
  PFRestrictionsUtil *v0;
  void *v1;

  v0 = objc_alloc_init(PFRestrictionsUtil);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

+ (PFRestrictionsUtil)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_8_0);
  return (PFRestrictionsUtil *)(id)sharedInstance_sharedInstance_0;
}

void __36__PFRestrictionsUtil_reloadSettings__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PFExplicitContentAllowedDidChangeNotification"), 0);

}

- (void)endListeningForChanges
{
  PFRestrictionsUtil *v2;
  void *v3;
  PFRestrictionsUtil *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (obj->_isListening)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", obj);

    v2 = obj;
    obj->_isListening = 0;
  }
  objc_sync_exit(v2);

}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  +[PFRestrictionsUtil reloadSettings](PFRestrictionsUtil, "reloadSettings", a3, a4);
}

- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4
{
  +[PFRestrictionsUtil reloadSettings](PFRestrictionsUtil, "reloadSettings", a3, a4);
}

@end
