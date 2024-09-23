@implementation WFPlugInTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForPluginStatus");
}

- (id)contextStorePredicate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "onEnable") && objc_msgSend(a1, "onDisable"))
  {
    objc_msgSend(v2, "addObject:", MEMORY[0x1E0C9AAB0]);
    goto LABEL_7;
  }
  if (objc_msgSend(a1, "onEnable"))
  {
    v3 = MEMORY[0x1E0C9AAB0];
LABEL_8:
    objc_msgSend(v2, "addObject:", v3);
    goto LABEL_9;
  }
  if (objc_msgSend(a1, "onDisable"))
  {
LABEL_7:
    v3 = MEMORY[0x1E0C9AAA0];
    goto LABEL_8;
  }
  getWFTriggersLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[WFPlugInTrigger(CoreDuetContext) contextStorePredicate]";
    v10 = 2114;
    v11 = a1;
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

LABEL_9:
  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v4, CFSTR("SELF.%@.value IN %@"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
