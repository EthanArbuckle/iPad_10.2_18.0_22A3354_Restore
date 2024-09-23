@implementation WFSystemSurfaceWorkflowStatusRegistry

- (WFSystemSurfaceWorkflowStatusRegistry)init
{
  WFSystemSurfaceWorkflowStatusRegistry *v2;
  uint64_t v3;
  NSUserDefaults *shortcutsUserDefaults;
  WFSystemSurfaceWorkflowStatusRegistry *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSystemSurfaceWorkflowStatusRegistry;
  v2 = -[WFSystemSurfaceWorkflowStatusRegistry init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.siri.shortcuts"));
    shortcutsUserDefaults = v2->_shortcutsUserDefaults;
    v2->_shortcutsUserDefaults = (NSUserDefaults *)v3;

    v5 = v2;
  }

  return v2;
}

- (unint64_t)statusForSystemSurface:(unint64_t)a3
{
  if (a3)
    return 0;
  else
    return -[WFSystemSurfaceWorkflowStatusRegistry statusForShareSheetWorkflows](self, "statusForShareSheetWorkflows");
}

- (BOOL)setStatus:(unint64_t)a3 forSystemSurface:(unint64_t)a4
{
  void *v9;

  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSystemSurfaceWorkflowStatusRegistry.m"), 75, CFSTR("Provide a concrete status"));

    if (a4)
      return 0;
  }
  else if (a4)
  {
    return 0;
  }
  return -[WFSystemSurfaceWorkflowStatusRegistry setStatusForShareSheetWorkflows:](self, "setStatusForShareSheetWorkflows:", a3);
}

- (unint64_t)statusForShareSheetWorkflows
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v3 = WFCanAccessUserDefaultsDomain(&v11);
  v4 = v11;
  v5 = v4;
  if (v3)
  {
    -[WFSystemSurfaceWorkflowStatusRegistry shortcutsUserDefaults](self, "shortcutsUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("ShareSheetShortcutsPresent"));

    if (v7)
      v8 = 2;
    else
      v8 = 1;
  }
  else
  {
    if (v4)
    {
      getWFVoiceShortcutClientLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v13 = "-[WFSystemSurfaceWorkflowStatusRegistry statusForShareSheetWorkflows]";
        v14 = 2114;
        v15 = CFSTR("com.apple.siri.shortcuts");
        v16 = 2114;
        v17 = v5;
        _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_ERROR, "%s Failed to check whether or not we have access to %{public}@: %{public}@", buf, 0x20u);
      }

    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)setStatusForShareSheetWorkflows:(unint64_t)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v5 = WFCanAccessUserDefaultsDomain(&v10);
  v6 = v10;
  v7 = v6;
  if (v5)
  {
    -[WFSystemSurfaceWorkflowStatusRegistry shortcutsUserDefaults](self, "shortcutsUserDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject setBool:forKey:](v8, "setBool:forKey:", a3 == 2, CFSTR("ShareSheetShortcutsPresent"));
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    getWFVoiceShortcutClientLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[WFSystemSurfaceWorkflowStatusRegistry setStatusForShareSheetWorkflows:]";
      v13 = 2114;
      v14 = CFSTR("com.apple.siri.shortcuts");
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_ERROR, "%s Failed to check whether or not we have access to %{public}@: %{public}@", buf, 0x20u);
    }
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (unint64_t)statusForServicesWorkflows
{
  return 0;
}

- (BOOL)setStatusForServicesWorkflows:(unint64_t)a3
{
  return 0;
}

- (NSUserDefaults)shortcutsUserDefaults
{
  return self->_shortcutsUserDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsUserDefaults, 0);
}

@end
