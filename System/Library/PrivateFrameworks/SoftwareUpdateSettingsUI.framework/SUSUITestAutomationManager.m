@implementation SUSUITestAutomationManager

+ (id)sharedManager
{
  uint64_t obj;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;
  id v10;
  id location;
  dispatch_once_t *v12;

  v10 = a1;
  v9 = a2;
  obj = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __43__SUSUITestAutomationManager_sharedManager__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  v12 = (dispatch_once_t *)&sharedManager_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  return (id)sharedManager_sharedManager;
}

void __43__SUSUITestAutomationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (SUSUITestAutomationManager)init
{
  SUSUITestAutomationManager *v3;
  objc_super v4;
  SEL v5;
  SUSUITestAutomationManager *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUITestAutomationManager;
  v6 = -[SUSUITestAutomationManager init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentSession, 0);
    -[SUSUITestAutomationManager startObserving](v6, "startObserving");
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)initialize
{
  objc_class *v2;
  NSObject *log;
  os_log_type_t type;
  NSString *v5;
  NSString *v6;
  os_log_type_t v7;
  id v8[3];
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = _SUSUILoggingFacility();
  v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v8[0];
    type = v7;
    v2 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v2);
    v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v9, (uint64_t)"-[SUSUITestAutomationManager initialize]", (uint64_t)v6);
    _os_log_impl(&dword_21BF33000, log, type, "%s: Initializing %@", v9, 0x16u);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  SUSUITestAutomationManager *v4;

  v4 = self;
  v3 = a2;
  if (self->_observing)
    -[SUSUITestAutomationManager stopObserving](v4, "stopObserving");
  v2.receiver = v4;
  v2.super_class = (Class)SUSUITestAutomationManager;
  -[SUSUITestAutomationManager dealloc](&v2, sel_dealloc);
}

- (id)description
{
  objc_class *v2;
  NSString *v3;
  const __CFString *v4;
  void *v6;
  NSString *v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v7 = v3;
  v4 = CFSTR("YES");
  if (!self->_currentSession)
    v4 = CFSTR("NO");
  v8 = (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p, automationEnabled: %@>"), v3, self, v4);

  return v8;
}

- (void)startObserving
{
  const __CFString *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  SUSUITestAutomationManager *obj;
  id v8;
  os_log_type_t v9;
  id location[4];
  SUSUITestAutomationManager *v11;
  uint8_t v12[16];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  location[3] = (id)a2;
  if (self->_observing)
    -[SUSUITestAutomationManager stopObserving](v11, "stopObserving");
  obj = v11;
  objc_sync_enter(obj);
  v11->_observing = 1;
  if ((os_variant_has_internal_content() & 1) != 0 && SoftwareUpdateSettingsMockingKitLibraryCore_0())
  {
    v6 = objc_alloc(MEMORY[0x24BDBCF50]);
    v4 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass_0(), "SoftwareUpdateSettingsSuiteName");
    v5 = (id)objc_msgSend(v6, "initWithSuiteName:");
    v3 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass_0(), "UIUnitTestingCurrentSession");
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v11);

    location[0] = _SUSUILoggingFacility();
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      if (-[SUSUITestAutomationManager enabled](v11, "enabled"))
        v2 = CFSTR("YES");
      else
        v2 = CFSTR("NO");
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v13, (uint64_t)"-[SUSUITestAutomationManager startObserving]", (uint64_t)v2);
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], v9, "%s: Start to observe for Unit Testing requests.\nNSUserDefaults Automation enabled? %@", v13, 0x16u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    v8 = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v12, (uint64_t)"-[SUSUITestAutomationManager startObserving]");
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "%s: SUSUITestAutomationManager exists in Production. Auto-disables.", v12, 0xCu);
    }
    objc_storeStrong(&v8, 0);
  }
  objc_sync_exit(obj);

}

- (void)stopObserving
{
  id v2;
  id v3;
  SUSUITestAutomationManager *v4;
  SUSUITestAutomationManager *v5;
  id location;
  int v7;
  SEL v8;
  SUSUITestAutomationManager *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8 = a2;
  v5 = self;
  objc_sync_enter(v5);
  if (v9->_observing)
  {
    location = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[SUSUITestAutomationManager stopObserving]");
      _os_log_impl(&dword_21BF33000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "%s: Stops observing for Unit Testing requests.", v10, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v9->_observing = 0;
    if ((os_variant_has_internal_content() & 1) != 0 && SoftwareUpdateSettingsMockingKitLibraryCore_0())
    {
      v3 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
      v4 = v9;
      v2 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass_0(), "UIUnitTestingCurrentSession");
      objc_msgSend(v3, "removeObserver:forKeyPath:", v4);

    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  objc_sync_exit(v5);

}

- (BOOL)enabled
{
  BOOL v3;

  v3 = 0;
  if (self->_currentSession)
    return SoftwareUpdateSettingsMockingKitLibraryCore_0() != 0;
  return v3;
}

- (void)addResponderDelegate:(id)a3 forServiceType:(int64_t)a4
{
  objc_class *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  NSString *v9;
  id v10;
  id v11;
  id v12;
  NSString *v13;
  NSString *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSString *v17;
  Protocol *v18;
  NSString *v19;
  NSString *v20;
  id v21;
  id v22;
  char v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  SUSUIUserDefaultsBasedTestSession *v27;
  NSObject *log;
  os_log_type_t type;
  id v30;
  SUSUIUserDefaultsBasedTestSession *v31;
  id v33;
  char v34;
  NSString *v35;
  id v36;
  os_log_type_t v37;
  os_log_t oslog;
  NSString *v39;
  NSString *v40;
  NSString *v41;
  char v42;
  id v43;
  id v44;
  char v45;
  id v46;
  Class v47;
  id v48;
  os_log_type_t v49;
  id v50;
  id v51;
  int v52;
  int64_t v53;
  id location[2];
  SUSUITestAutomationManager *v55;
  uint8_t v56[32];
  uint8_t v57[32];
  uint8_t v58[16];
  uint8_t v59[24];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v53 = a4;
  v33 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
  v34 = objc_msgSend(v33, "enabled");

  if ((v34 & 1) != 0)
  {
    v31 = -[SUSUITestAutomationManager currentSession](v55, "currentSession");
    v51 = -[SUSUIUserDefaultsBasedTestSession strategyForServiceType:](v31, "strategyForServiceType:", v53);

    if (v51)
    {
      v27 = -[SUSUITestAutomationManager currentSession](v55, "currentSession");
      v47 = -[SUSUIUserDefaultsBasedTestSession strategyClassForServiceType:](v27, "strategyClassForServiceType:", v53);

      if (v47)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (v21 = location[0],
              v22 = (id)-[objc_class responderDelegateProtocol](v47, "responderDelegateProtocol"), v23 = objc_msgSend(v21, "conformsToProtocol:"), v22, (v23 & 1) != 0))
        {
          oslog = (os_log_t)_SUSUIInternalLoggingFacility();
          v37 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            v7 = oslog;
            v8 = v37;
            v12 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
            v11 = (id)objc_msgSend(v12, "currentSession");
            v10 = (id)objc_msgSend(v11, "correlationId");
            v5 = v10;
            v36 = v5;
            v6 = location[0];
            v9 = NSStringFromClass(v47);
            v35 = v9;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v56, (uint64_t)v5, (uint64_t)v6, (uint64_t)v35);
            _os_log_impl(&dword_21BF33000, v7, v8, "[XCUI correlationId: %@] Adding a XCUI responder delegate '%@' as a listener to strategy: %@", v56, 0x20u);

            objc_storeStrong((id *)&v35, 0);
            objc_storeStrong(&v36, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
          objc_msgSend(v51, "addResponderDelegate:", location[0]);
          v52 = 0;
        }
        else
        {
          v43 = _SUSUILoggingFacility();
          v42 = 16;
          if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
          {
            v15 = v43;
            v16 = v42;
            v4 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v4);
            v13 = v20;
            v41 = v13;
            v19 = NSStringFromClass(v47);
            v14 = v19;
            v40 = v14;
            v18 = (Protocol *)(id)-[objc_class responderDelegateProtocol](v47, "responderDelegateProtocol");
            v17 = NSStringFromProtocol(v18);
            v39 = v17;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v57, (uint64_t)v13, (uint64_t)v14, (uint64_t)v39);
            _os_log_error_impl(&dword_21BF33000, v15, v16, "Could not register a new responder, of type '%@', for the strategy class '%@'. The responder class does not implement the required protocol '%@.", v57, 0x20u);

            objc_storeStrong((id *)&v39, 0);
            objc_storeStrong((id *)&v40, 0);
            objc_storeStrong((id *)&v41, 0);
          }
          objc_storeStrong(&v43, 0);
          v52 = 1;
        }
      }
      else
      {
        v46 = _SUSUILoggingFacility();
        v45 = 16;
        if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
        {
          v24 = v46;
          v25 = v45;
          v26 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass_0(), "descriptionForType:", v53);
          v44 = v26;
          __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v44);
          _os_log_error_impl(&dword_21BF33000, v24, v25, "Could not find any registered strategy class for service type: %@", v58, 0xCu);

          objc_storeStrong(&v44, 0);
        }
        objc_storeStrong(&v46, 0);
        v52 = 1;
      }
    }
    else
    {
      v50 = _SUSUILoggingFacility();
      v49 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
      {
        log = v50;
        type = v49;
        v30 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass_0(), "descriptionForType:", v53);
        v48 = v30;
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v48);
        _os_log_impl(&dword_21BF33000, log, type, "The service type '%@' was not included in the test plan and thus no strategy was assigned.", v59, 0xCu);

        objc_storeStrong(&v48, 0);
      }
      objc_storeStrong(&v50, 0);
      v52 = 1;
    }
    objc_storeStrong(&v51, 0);
  }
  else
  {
    v52 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  SUSUITestAutomationManager *v6;
  id v7;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id location[2];
  SUSUITestAutomationManager *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  NSLog(CFSTR("%s: '%@' changed property '%@ into '%@'"), "-[SUSUITestAutomationManager observeValueForKeyPath:ofObject:change:context:]", v14, location[0], v13);
  v10 = location[0];
  v11 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass_0(), "UIUnitTestingCurrentSession");
  v12 = objc_msgSend(v10, "isEqualToString:");

  if ((v12 & 1) != 0)
  {
    v6 = v16;
    v7 = (id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    -[SUSUITestAutomationManager resolveStoredXCUISession:](v6, "resolveStoredXCUISession:");

  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)resolveStoredXCUISession:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  os_log_t v19;
  os_log_type_t v20;
  os_log_t v21;
  uint64_t v22;
  os_log_type_t v23;
  os_log_t v24;
  os_log_type_t v25;
  os_log_t v26;
  os_log_type_t type;
  os_log_t oslog;
  id obj;
  id v30;
  id v31;
  int v32;
  char v33;
  id v34;
  id location[2];
  SUSUITestAutomationManager *v36;
  uint8_t v37[48];
  uint8_t v38[48];
  uint8_t v39[32];
  uint8_t v40[32];
  uint8_t v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  v18 = 1;
  if (location[0])
  {
    v17 = location[0];
    v34 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v33 = 1;
    v18 = objc_msgSend(v17, "isEqual:");
  }
  if ((v33 & 1) != 0)

  if ((v18 & 1) == 0)
  {
    v31 = 0;
    v15 = (void *)MEMORY[0x24BDD1620];
    getSUSMKUserDefaultsCodedTestCaseSessionClass();
    v3 = objc_opt_class();
    obj = v31;
    v16 = (id)objc_msgSend(v15, "unarchivedObjectOfClass:fromData:error:", v3, location[0], &obj);
    objc_storeStrong(&v31, obj);
    v30 = v16;
    if (!v16 || v31)
    {
      oslog = (os_log_t)_SUSUILoggingFacility();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
        _os_log_impl(&dword_21BF33000, oslog, type, "Could not decode the saved UT session into an SUSMKUserDefaultsCodedTestCaseSession object. Error: %@", v41, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:](v36, "setupAutomaticTestingForStoredSession:", 0);
      v32 = 1;
LABEL_32:
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      goto LABEL_33;
    }
    v13 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
    v14 = objc_msgSend(v13, "shouldKeepPreviousMockingKitSession");

    if ((v14 & 1) == 0)
    {
      if ((objc_msgSend(MEMORY[0x24BDD1760], "isRunning:", objc_msgSend(v30, "processId")) & 1) == 0)
      {
        v11 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
        v12 = objc_msgSend(v11, "shouldSkipMockingKitPIDValidation");

        if ((v12 & 1) == 0)
        {
          v26 = (os_log_t)_SUSUILoggingFacility();
          v25 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_2_8_32_4_0((uint64_t)v40, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", objc_msgSend(v30, "processId"));
            _os_log_impl(&dword_21BF33000, v26, v25, "%s: Found a UTs session stored in NSUserDefaults. However, the process '%d' isn't running anymore. Killing the session.", v40, 0x12u);
          }
          objc_storeStrong((id *)&v26, 0);
          -[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:](v36, "setupAutomaticTestingForStoredSession:", 0);
          v32 = 1;
          goto LABEL_32;
        }
        v24 = (os_log_t)_SUSUILoggingFacility();
        v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_32_4_0((uint64_t)v39, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", objc_msgSend(v30, "processId"));
          _os_log_impl(&dword_21BF33000, v24, v23, "%s: Found a UTs session stored in NSUserDefaults. However, the process '%d' isn't running anymore. As SUSkipMockingKitPIDValidation is on - we will continue to use the test plan with this, incorrect, PID.", v39, 0x12u);
        }
        objc_storeStrong((id *)&v24, 0);
      }
      v22 = objc_msgSend(MEMORY[0x24BDD1760], "processStartTime:", objc_msgSend(v30, "processId"));
      if (v22 != objc_msgSend(v30, "processStartTime"))
      {
        v9 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
        v10 = objc_msgSend(v9, "shouldSkipMockingKitPIDValidation");

        if ((v10 & 1) == 0)
        {
          v21 = (os_log_t)_SUSUILoggingFacility();
          v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v8 = objc_msgSend(v30, "processId");
            __os_log_helper_16_2_4_8_32_8_0_8_0_8_0((uint64_t)v38, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", v8, objc_msgSend(v30, "processStartTime"), v22);
            _os_log_impl(&dword_21BF33000, v21, v20, "%s: Found a UTs session stored in NSUserDefaults. However, the session stored process start time for pid %ld, %ld, different than the start time of the current process with this pid, %ld. Killing the session.", v38, 0x2Au);
          }
          objc_storeStrong((id *)&v21, 0);
          -[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:](v36, "setupAutomaticTestingForStoredSession:", 0);
          v32 = 1;
          goto LABEL_32;
        }
        v19 = (os_log_t)_SUSUILoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v7 = objc_msgSend(v30, "processId");
          __os_log_helper_16_2_4_8_32_8_0_8_0_8_0((uint64_t)v37, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", v7, objc_msgSend(v30, "processStartTime"), v22);
          _os_log_impl(&dword_21BF33000, v19, OS_LOG_TYPE_DEFAULT, "%s: Found a UTs session stored in NSUserDefaults. However, the session stored process start time for pid %ld, %ld, different than the start time of the current process with this pid, %ld. As SUSkipMockingKitPIDValidation is on - we will continue to use the test plan with this, corrupted, PID.", v37, 0x2Au);
        }
        objc_storeStrong((id *)&v19, 0);
      }
    }
    v5 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
    v6 = objc_msgSend(v5, "shouldSkipMockingKitPIDValidation");

    if ((v6 & 1) != 0)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
      objc_msgSend(v4, "shouldSkipMockingKitPIDValidation:", 0);

    }
    -[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:](v36, "setupAutomaticTestingForStoredSession:", v30);
    v32 = 0;
    goto LABEL_32;
  }
  -[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:](v36, "setupAutomaticTestingForStoredSession:", 0);
  v32 = 1;
LABEL_33:
  objc_storeStrong(location, 0);
}

- (void)setupAutomaticTestingForStoredSession:(id)a3
{
  SUSUIUserDefaultsBasedTestSession *v3;
  uint64_t v4;
  SUSUIUserDefaultsBasedTestSession *currentSession;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  SUSUIServiceManager *v17;
  SUSUIServiceManager *v18;
  _QWORD __b[8];
  uint64_t v20;
  id v21;
  id v22;
  os_log_type_t v23;
  id v24;
  os_log_type_t v25;
  id v26;
  id location[2];
  SUSUITestAutomationManager *v28;
  _BYTE v29[128];
  uint8_t v30[32];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
  -[SUSUIServiceManager reset](v18, "reset");

  if (location[0])
  {
    v26 = _SUSUILoggingFacility();
    v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:]");
      _os_log_impl(&dword_21BF33000, (os_log_t)v26, v25, "%s: In unit testing mode, registering mocks third-party services", v31, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    v17 = +[SUSUIServiceManager sharedInstance](SUSUIServiceManager, "sharedInstance");
    -[SUSUIServiceManager registerMockClasses](v17, "registerMockClasses");

    v24 = _SUSUILoggingFacility();
    v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v24;
      v15 = v23;
      v13 = (id)objc_opt_class();
      v22 = v13;
      v16 = (id)objc_msgSend(location[0], "correlationId");
      v21 = v16;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v30, (uint64_t)"-[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:]", (uint64_t)v13, (uint64_t)v21);
      _os_log_impl(&dword_21BF33000, v14, v15, "%s: XCUI Automation is enabled. Setting up the XCUI communication client using: %@ for test session: %@", v30, 0x20u);

      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v24, 0);
    v3 = [SUSUIUserDefaultsBasedTestSession alloc];
    v4 = -[SUSUIUserDefaultsBasedTestSession initWithStoredSession:](v3, "initWithStoredSession:", location[0]);
    currentSession = v28->_currentSession;
    v28->_currentSession = (SUSUIUserDefaultsBasedTestSession *)v4;

  }
  else
  {
    memset(__b, 0, sizeof(__b));
    v11 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass_0(), "UIUnitTestingKeys");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(v11);
        v20 = *(_QWORD *)(__b[1] + 8 * v9);
        v6 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
        objc_msgSend(v6, "removeObjectForKey:", v20);

        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
          if (!v10)
            break;
        }
      }
    }

  }
  objc_storeStrong(location, 0);
}

- (SUSUIUserDefaultsBasedTestSession)currentSession
{
  return self->_currentSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
}

@end
