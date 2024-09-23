@implementation SBDefaultIconModelStore

+ (SBDefaultIconModelStore)sharedInstance
{
  if (sharedInstance___once_9 != -1)
    dispatch_once(&sharedInstance___once_9, &__block_literal_global_235);
  return (SBDefaultIconModelStore *)(id)sharedInstance___instance_8;
}

uint64_t __41__SBDefaultIconModelStore_sharedInstance__block_invoke()
{
  SBDefaultIconModelStore *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBDefaultIconModelStore);
  v1 = (void *)sharedInstance___instance_8;
  sharedInstance___instance_8 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBDefaultIconModelStore)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBDefaultIconModelStore *v9;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/SpringBoard/IconState.plist"), "stringByExpandingTildeInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(CFSTR("~/Library/SpringBoard/DesiredIconState.plist"), "stringByExpandingTildeInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconModelPropertyListFileStore initWithIconStateURL:desiredIconStateURL:](self, "initWithIconStateURL:desiredIconStateURL:", v5, v8);

  return v9;
}

- (id)loadCurrentIconState:(id *)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDefaultIconModelStore;
  -[SBIconModelPropertyListFileStore loadCurrentIconState:](&v7, sel_loadCurrentIconState_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Read current icon state from disk.", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDefaultIconModelStore;
  v5 = -[SBIconModelPropertyListFileStore deleteDesiredIconStateWithOptions:error:](&v7, sel_deleteDesiredIconStateWithOptions_error_, a3, a4);
  if (v5)
    -[SBDefaultIconModelStore _deleteLegacyState](self, "_deleteLegacyState");
  return v5;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDefaultIconModelStore;
  v5 = -[SBIconModelPropertyListFileStore saveDesiredIconState:error:](&v7, sel_saveDesiredIconState_error_, a3, a4);
  if (v5)
    -[SBDefaultIconModelStore _deleteLegacyState](self, "_deleteLegacyState");
  return v5;
}

- (id)loadDesiredIconState:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[16];

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "legacyIconState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Read desired icon state from legacy user-defaults [1].";
LABEL_10:
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyIconState2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Read desired icon state from legacy user-defaults [2].";
      goto LABEL_10;
    }
LABEL_11:

    return v7;
  }
  v13.receiver = self;
  v13.super_class = (Class)SBDefaultIconModelStore;
  -[SBIconModelPropertyListFileStore loadDesiredIconState:](&v13, sel_loadDesiredIconState_, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Read desired icon state from disk.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  return v7;
}

- (void)_deleteLegacyState
{
  void *v2;
  id v3;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearLegacyDefaults");

}

@end
