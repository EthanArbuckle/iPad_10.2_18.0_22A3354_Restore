id PowerlogControlLog()
{
  if (PowerlogControlLog_onceToken != -1)
    dispatch_once(&PowerlogControlLog_onceToken, &__block_literal_global);
  return (id)PowerlogControlLog___logObj;
}

id containerPath()
{
  if (containerPath_onceToken != -1)
    dispatch_once(&containerPath_onceToken, &__block_literal_global_8);
  return (id)containerPath_containerPath;
}

void __containerPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;

    free(v1);
  }
  else
  {
    NSLog(CFSTR("Error fetching group container systemgroup.com.apple.powerlog : %llu"), 1);
  }
}

uint64_t allowModeTransition(int a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;

  containerPath();
  v2 = (void *)_CFPreferencesCopyValueWithContainer();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "intValue");
    v5 = 1;
    if (a1 == 2 && v4 == 1)
    {
      PowerlogControlLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        allowModeTransition_cold_1(v6);

      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

BOOL validValue(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_msgSend(v1, "intValue") & 0x80000000) == 0
    && (int)objc_msgSend(v1, "intValue") < 3;

  return v2;
}

id PowerlogControlReadMode()
{
  void *v0;

  containerPath();
  v0 = (void *)_CFPreferencesCopyValueWithContainer();
  if (!v0)
  {
    containerPath();
    v0 = (void *)_CFPreferencesCopyValueWithContainer();
  }
  return v0;
}

uint64_t PowerlogControlDefaultsChanged(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v8[16];

  v3 = a1;
  v4 = a2;
  PowerlogControlLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21A9EB000, v5, OS_LOG_TYPE_DEFAULT, "Mode defaults changed", v8, 2u);
  }

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mode")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("FullMode")))
  {
    v6 = PowerlogControlSwitchMode(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t PowerlogControlSwitchMode(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  passwd *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  PowerlogControlLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v1;
    _os_log_impl(&dword_21A9EB000, v2, OS_LOG_TYPE_DEFAULT, "Updating powerlog mode to '%@'", buf, 0xCu);
  }

  if (!validValue(v1))
  {
    PowerlogControlLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      PowerlogControlSwitchMode_cold_2((uint64_t)v1, v11);

    goto LABEL_12;
  }
  v3 = objc_msgSend(v1, "intValue");
  if ((allowModeTransition(v3) & 1) == 0)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_19;
  }
  PowerlogControlLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    PowerlogControlSwitchMode_cold_1((uint64_t)v1, v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  containerPath();
  _CFPreferencesSetAppValueWithContainer();
  containerPath();
  _CFPreferencesAppSynchronizeWithContainer();
  containerPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%s"), "/Library/Preferences/com.apple.powerlogd.plist");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  v8 = getpwnam("mobile");
  chown(v7, v8->pw_uid, v8->pw_gid);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/var/mobile/Library/Caches"), "stringByAppendingString:", CFSTR("/powerlogd.launchd"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v3 >= 1)
  {
    objc_msgSend(v9, "createFileAtPath:contents:attributes:", v10, 0, 0);
LABEL_15:

    goto LABEL_16;
  }
  v13 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("/var/mobile/Library/Caches"), "stringByAppendingString:", CFSTR("/powerlogd.launchd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v10, 0);
    goto LABEL_15;
  }
LABEL_16:
  PowerlogControlLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A9EB000, v14, OS_LOG_TYPE_DEFAULT, "Powerlog state changed", buf, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.powerlog.state_changed"), 0, 0, 0);
  v12 = 1;
LABEL_19:

  return v12;
}

void allowModeTransition_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A9EB000, log, OS_LOG_TYPE_ERROR, "Mode transition not permitted", v1, 2u);
}

void PowerlogControlSwitchMode_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21A9EB000, a2, OS_LOG_TYPE_DEBUG, "Allowing mode transition to %@", (uint8_t *)&v2, 0xCu);
}

void PowerlogControlSwitchMode_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21A9EB000, a2, OS_LOG_TYPE_ERROR, "Invalid powerlog mode '%@', stopping", (uint8_t *)&v2, 0xCu);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x24BDBD018]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x24BDBD028]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x24BDBD050]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

