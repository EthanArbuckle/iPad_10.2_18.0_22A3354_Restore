@implementation WPDPersistence

- (WPDPersistence)init
{
  WPDPersistence *v2;
  WPDPersistence *v3;
  uint64_t v4;
  NSString *bootUUID;
  NSObject *v6;
  NSString *v7;
  objc_super v9;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)WPDPersistence;
  v2 = -[WPDPersistence init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isRangingEnabled = 256;
    v2->_systemFirstUnlocked = 0;
    -[WPDPersistence currentBootSessionUUID](v2, "currentBootSessionUUID");
    v4 = objc_claimAutoreleasedReturnValue();
    bootUUID = v3->_bootUUID;
    v3->_bootUUID = (NSString *)v4;

    if (WPLogInitOnce != -1)
      dispatch_once(&WPLogInitOnce, &__block_literal_global_3);
    v6 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v3->_bootUUID;
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_2175D1000, v6, OS_LOG_TYPE_DEFAULT, "WPDPersistence initialized with BootUUID %{public}@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WPDPersistence synchronisePrefs](self, "synchronisePrefs");
  v3.receiver = self;
  v3.super_class = (Class)WPDPersistence;
  -[WPDPersistence dealloc](&v3, sel_dealloc);
}

- (BOOL)isRangingEnabled
{
  return self->_isRangingEnabled;
}

- (void)setIsRangingEnabled:(BOOL)a3
{
  self->_needsInit = 0;
  self->_isRangingEnabled = a3;
  if (self->_systemFirstUnlocked)
  {
    -[WPDPersistence writeBoolProperty:Value:](self, "writeBoolProperty:Value:", CFSTR("WPRangingEnabled"), a3);
    -[WPDPersistence writeStringProperty:Value:](self, "writeStringProperty:Value:", CFSTR("WPBootUUID"), self->_bootUUID);
  }
}

- (id)currentBootSessionUUID
{
  void *v2;
  __CFString *v3;
  char *v5;
  __CFString *v6;
  void *v7;
  size_t size;

  size = 0;
  if (sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
    goto LABEL_4;
  v2 = malloc_type_malloc(size, 0x593B2B58uLL);
  if (sysctlbyname("kern.bootsessionuuid", v2, &size, 0, 0))
  {
    free(v2);
LABEL_4:
    v3 = CFSTR("fake BootUUID");
    goto LABEL_5;
  }
  v5 = strdup((const char *)v2);
  currentBootSessionUUID_bootSessionUUIDStr = (uint64_t)v5;
  free(v2);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)currentBootSessionUUID_bootSessionUUIDStr;
  }
  else
  {
    v7 = 0;
    v6 = CFSTR("fake BootUUID");
  }
  free(v7);
  v3 = v6;
LABEL_5:

  return v3;
}

- (void)firstUnlockedWithEvent:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_9);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDPersistence firstUnlockedWithEvent:].cold.2(v3, v5, v6);
  -[WPDPersistence setSystemFirstUnlocked:](self, "setSystemFirstUnlocked:", 1);
  if (v3)
    -[WPDPersistence setNeedsInit:](self, "setNeedsInit:", 0);
  if (-[WPDPersistence needsInit](self, "needsInit"))
  {
    -[WPDPersistence readStringPropertyValue:](self, "readStringPropertyValue:", CFSTR("WPBootUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WPDPersistence bootUUID](self, "bootUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", v7);

      if (v9)
      {
        -[WPDPersistence setIsRangingEnabled:](self, "setIsRangingEnabled:", -[WPDPersistence readBoolPropertyValue:](self, "readBoolPropertyValue:", CFSTR("WPRangingEnabled")));
        if (WPLogInitOnce != -1)
          dispatch_once(&WPLogInitOnce, &__block_literal_global_11);
        v10 = (void *)WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
          -[WPDPersistence firstUnlockedWithEvent:].cold.1(v10, self);
      }
    }

  }
  -[WPDPersistence setIsRangingEnabled:](self, "setIsRangingEnabled:", self->_isRangingEnabled);
}

- (void)synchronisePrefs
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6[0] = 67109376;
  v6[1] = a3;
  v7 = 1024;
  v8 = objc_msgSend(a2, "systemFirstUnlocked");
  _os_log_debug_impl(&dword_2175D1000, v5, OS_LOG_TYPE_DEBUG, "WPDPersistence synchronised: %d (firstUnlocked: %d)", (uint8_t *)v6, 0xEu);

}

- (void)deletePropertyValue:(id)a3
{
  __CFString *v3;
  void *v4;
  NSObject *v5;

  v3 = (__CFString *)a3;
  v4 = (void *)MEMORY[0x219A0EE8C]();
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_15);
  v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDPersistence deletePropertyValue:].cold.1((uint64_t)v3, v5);
  CFPreferencesSetAppValue(v3, 0, CFSTR("com.apple.BTServer"));
  objc_autoreleasePoolPop(v4);

}

- (BOOL)readBoolPropertyValue:(id)a3
{
  __CFString *v3;
  void *v4;
  int AppBooleanValue;
  int v6;
  BOOL v7;
  _BOOL4 v8;
  NSObject *v9;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = (void *)MEMORY[0x219A0EE8C]();
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, CFSTR("com.apple.BTServer"), &keyExistsAndHasValidFormat);
  v6 = AppBooleanValue;
  if (keyExistsAndHasValidFormat)
    v7 = AppBooleanValue == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_16);
  v9 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v13 = v3;
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = keyExistsAndHasValidFormat;
    v18 = 1024;
    v19 = v6;
    _os_log_debug_impl(&dword_2175D1000, v9, OS_LOG_TYPE_DEBUG, "WPDPersistence read %@ : %d (found:%d got:%d)", buf, 0x1Eu);
  }
  objc_autoreleasePoolPop(v4);

  return v8;
}

- (void)writeBoolProperty:(id)a3 Value:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  CFPropertyListRef *v9;

  v4 = a4;
  v6 = (__CFString *)a3;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_17);
  v7 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDPersistence writeBoolProperty:Value:].cold.1((uint64_t)v6, v4, v7);
  v8 = (void *)MEMORY[0x219A0EE8C]();
  v9 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!v4)
    v9 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(v6, *v9, CFSTR("com.apple.BTServer"));
  objc_autoreleasePoolPop(v8);
  -[WPDPersistence synchronisePrefs](self, "synchronisePrefs");

}

- (id)readStringPropertyValue:(id)a3
{
  __CFString *v3;
  void *v4;
  CFPropertyListRef v5;
  void *v6;
  CFTypeID v7;
  id v8;

  v3 = (__CFString *)a3;
  v4 = (void *)MEMORY[0x219A0EE8C]();
  v5 = CFPreferencesCopyAppValue(v3, CFSTR("com.apple.BTServer"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFStringGetTypeID())
      v8 = v6;
    else
      v8 = 0;
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  objc_autoreleasePoolPop(v4);
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_18);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDPersistence readStringPropertyValue:].cold.1();

  return v8;
}

- (void)writeStringProperty:(id)a3 Value:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (WPLogInitOnce != -1)
    dispatch_once(&WPLogInitOnce, &__block_literal_global_19);
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
    -[WPDPersistence writeStringProperty:Value:].cold.1();
  v8 = (void *)MEMORY[0x219A0EE8C]();
  CFPreferencesSetAppValue(v6, v7, CFSTR("com.apple.BTServer"));
  objc_autoreleasePoolPop(v8);
  -[WPDPersistence synchronisePrefs](self, "synchronisePrefs");

}

- (BOOL)needsInit
{
  return self->_needsInit;
}

- (void)setNeedsInit:(BOOL)a3
{
  self->_needsInit = a3;
}

- (BOOL)systemFirstUnlocked
{
  return self->_systemFirstUnlocked;
}

- (void)setSystemFirstUnlocked:(BOOL)a3
{
  self->_systemFirstUnlocked = a3;
}

- (NSString)bootUUID
{
  return self->_bootUUID;
}

- (void)setBootUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bootUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootUUID, 0);
}

- (void)firstUnlockedWithEvent:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v5[0] = 67109120;
  v5[1] = objc_msgSend(a2, "isRangingEnabled");
  OUTLINED_FUNCTION_3_0(&dword_2175D1000, v3, v4, "WPDPersistence restored isRangingEnabled: %d", (uint8_t *)v5);

  OUTLINED_FUNCTION_0();
}

- (void)firstUnlockedWithEvent:(uint64_t)a3 .cold.2(char a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1 & 1;
  OUTLINED_FUNCTION_3_0(&dword_2175D1000, a2, a3, "WPDPersistence firstUnlockedWithEvent: %d", (uint8_t *)v3);
}

- (void)deletePropertyValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2175D1000, a2, OS_LOG_TYPE_DEBUG, "WPDPersistence delete %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

- (void)writeBoolProperty:(os_log_t)log Value:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_2175D1000, log, OS_LOG_TYPE_DEBUG, "WPDPersistence write %@: %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

- (void)readStringPropertyValue:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2175D1000, v0, v1, "WPDPersistence read %@ : %@");
  OUTLINED_FUNCTION_0();
}

- (void)writeStringProperty:Value:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2175D1000, v0, v1, "WPDPersistence write %@: %@");
  OUTLINED_FUNCTION_0();
}

@end
