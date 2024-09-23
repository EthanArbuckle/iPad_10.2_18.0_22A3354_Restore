@implementation SUSUIUserDefaultsBasedTestSession

- (SUSUIUserDefaultsBasedTestSession)init
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  id v6;
  char v7;
  id v8[2];
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8[1] = (id)a2;
  v8[0] = _SUSUIInternalLoggingFacility();
  v7 = 16;
  if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_ERROR))
  {
    log = v8[0];
    type = v7;
    v5 = (id)objc_msgSend(v9, "correlationId");
    v6 = v5;
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v6);
    _os_log_error_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] [SUSUIUserDefaultsBasedTestSession init] shouldn't be invoked directly.", v10, 0xCu);

    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v9, 0);
  return 0;
}

- (SUSUIUserDefaultsBasedTestSession)initWithStoredSession:(id)a3
{
  SUSUIUserDefaultsBasedTestSession *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *services;
  NSMutableDictionary *v6;
  NSMutableDictionary *servicesClasses;
  SUSUIUserDefaultsBasedTestSession *v9;
  id v10;
  SUSUIUserDefaultsBasedTestSession *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SUSUIUserDefaultsBasedTestSession *v17;
  objc_super v18;
  id location[2];
  SUSUIUserDefaultsBasedTestSession *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v20;
  v20 = 0;
  v18.receiver = v3;
  v18.super_class = (Class)SUSUIUserDefaultsBasedTestSession;
  v17 = -[SUSUIUserDefaultsBasedTestSession init](&v18, sel_init);
  v20 = v17;
  objc_storeStrong((id *)&v20, v17);
  if (v17)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    services = v20->_services;
    v20->_services = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    servicesClasses = v20->_servicesClasses;
    v20->_servicesClasses = v6;

    objc_storeStrong((id *)&v20->_session, location[0]);
    if (-[SUSUIUserDefaultsBasedTestSession currentPhase](v20, "currentPhase") > 2)
    {
      v16 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
      v15 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass(), "UIUnitTestingCurrentPhase");
      objc_msgSend(v16, "setObject:forKey:", &unk_24E0116B8);

    }
    v10 = objc_alloc(MEMORY[0x24BDBCF50]);
    v14 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass(), "SoftwareUpdateSettingsSuiteName");
    v13 = (id)objc_msgSend(v10, "initWithSuiteName:");
    v11 = v20;
    v12 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass(), "UIUnitTestingCurrentPhase");
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v11);

  }
  v9 = v20;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v9;
}

- (void)dealloc
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  SUSUIUserDefaultsBasedTestSession *v6;

  v6 = self;
  v5 = a2;
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
  v2 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass(), "UIUnitTestingCurrentPhase");
  objc_msgSend(v3, "removeObserver:forKeyPath:", v6);

  v4.receiver = v6;
  v4.super_class = (Class)SUSUIUserDefaultsBasedTestSession;
  -[SUSUIUserDefaultsBasedTestSession dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSString *v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  NSString *v10;
  char v11;
  id v15;
  id v16;
  char v17;
  objc_super v18;
  int v19;
  NSString *v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id location[2];
  SUSUIUserDefaultsBasedTestSession *v30;
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = a6;
  v15 = location[0];
  v16 = (id)objc_msgSend(getSUSUIUserDefaultsKeysClass(), "UIUnitTestingCurrentPhase");
  v17 = objc_msgSend(v15, "isEqualToString:");

  if ((v17 & 1) != 0)
  {
    v25 = (id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v23 = 0;
    v11 = 1;
    if (v25)
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = 1;
      v11 = objc_msgSend(v25, "isEqual:");
    }
    if ((v23 & 1) != 0)

    if ((v11 & 1) != 0)
    {
      v22 = _SUSUIInternalLoggingFacility();
      v21 = 16;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        log = v22;
        type = v21;
        v10 = -[SUSUIUserDefaultsBasedTestSession correlationId](v30, "correlationId");
        v6 = v10;
        v20 = v6;
        v9 = (id)objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v31, (uint64_t)v6, (uint64_t)v9);
        _os_log_error_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] Failed to decode the changed phase into an NSNumber. Got: %@", v31, 0x16u);

        objc_storeStrong((id *)&v20, 0);
      }
      objc_storeStrong(&v22, 0);
      v19 = 1;
    }
    else
    {
      -[SUSUIUserDefaultsBasedTestSession handleChangedPhase:](v30, "handleChangedPhase:", objc_msgSend(v25, "integerValue"));
      v19 = 1;
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v18.receiver = v30;
    v18.super_class = (Class)SUSUIUserDefaultsBasedTestSession;
    -[SUSUIUserDefaultsBasedTestSession observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, location[0], v28, v27, v26);
    v19 = 0;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (id)strategyForServiceType:(int64_t)a3
{
  NSMutableDictionary *services;
  id v5;
  id v6;

  services = self->_services;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v6 = (id)-[NSMutableDictionary objectForKey:](services, "objectForKey:");

  return v6;
}

- (Class)strategyClassForServiceType:(int64_t)a3
{
  NSMutableDictionary *servicesClasses;
  id v5;
  id v6;

  servicesClasses = self->_servicesClasses;
  v5 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v6 = (id)-[NSMutableDictionary objectForKey:](servicesClasses, "objectForKey:");

  return (Class)v6;
}

- (int64_t)currentExecutionResult
{
  id v3;
  int64_t v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
  v4 = objc_msgSend(v3, "unitTestingCurrentTestResult");

  return v4;
}

- (NSString)correlationId
{
  __CFString *v2;
  char v4;
  id v5;
  __CFString *v6;

  v4 = 0;
  if (self->_session)
  {
    v5 = (id)-[SUSMKUserDefaultsCodedTestCaseSession correlationId](self->_session, "correlationId");
    v4 = 1;
    v2 = (__CFString *)v5;
  }
  else
  {
    v2 = CFSTR("N/A");
  }
  v6 = v2;
  if ((v4 & 1) != 0)

  return (NSString *)v6;
}

- (int64_t)currentPhase
{
  id v3;
  int64_t v4;

  v3 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
  v4 = objc_msgSend(v3, "unitTestingCurrentPhase");

  return v4;
}

- (BOOL)beginTestAndReturnError:(id *)a3
{
  return 0;
}

+ (id)current
{
  id v3;
  id v4;

  v3 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
  v4 = (id)objc_msgSend(v3, "currentSession");

  return v4;
}

- (BOOL)endTestWithResult:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (void)handleChangedPhase:(int64_t)a3
{
  id v3;
  char v4;
  NSString *v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  NSString *v9;
  id v10;
  NSString *v11;
  os_log_type_t v12;
  id v13;
  int64_t v14;
  SEL v15;
  SUSUIUserDefaultsBasedTestSession *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v9 = -[SUSUIUserDefaultsBasedTestSession correlationId](v16, "correlationId");
    v5 = v9;
    v11 = v5;
    v8 = (id)objc_msgSend(getSUSMKTestCaseSessionPhaseUtilityClass(), "descriptionForPhase:", v14);
    v10 = v8;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v5, (uint64_t)v10);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] Changed XCUI testing session phase into: %@", v17, 0x16u);

    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  switch(v14)
  {
    case 2:
      -[SUSUIUserDefaultsBasedTestSession handlePhaseConfigurationSealed](v16, "handlePhaseConfigurationSealed");
      -[SUSUIUserDefaultsBasedTestSession handlePhaseRunning](v16, "handlePhaseRunning");
      break;
    case 3:
      v3 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
      v4 = objc_msgSend(v3, "shouldKeepPreviousMockingKitSession");

      if ((v4 & 1) != 0)
        -[SUSUIUserDefaultsBasedTestSession handlePhaseConfigurationSealed](v16, "handlePhaseConfigurationSealed");
      -[SUSUIUserDefaultsBasedTestSession handlePhaseRunning](v16, "handlePhaseRunning");
      break;
    case 4:
      -[SUSUIUserDefaultsBasedTestSession handlePhaseFinished](v16, "handlePhaseFinished");
      break;
  }
}

- (void)handlePhaseConfigurationSealed
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  NSString *v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  NSString *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  NSString *v21;
  Class v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  NSString *v26;
  SUSUIUserDefaultsBasedTestSession *v27;
  id v28;
  id v29;
  id v30;
  NSMutableDictionary *services;
  id v32;
  Class v33;
  NSMutableDictionary *servicesClasses;
  id v35;
  NSString *v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  id v40;
  id v41;
  NSString *v42;
  NSString *v43;
  NSString *v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  id v48;
  id v49;
  NSString *v50;
  id SUSMKMockedServiceTypeUtilityClass;
  id v52;
  char v53;
  NSString *v54;
  NSObject *log;
  os_log_type_t v56;
  id v57;
  NSString *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  id obj;
  uint64_t v70;
  id v71;
  NSString *v72;
  os_log_type_t v73;
  os_log_t v74;
  _QWORD v75[8];
  id v76;
  id v77;
  NSString *v78;
  os_log_type_t v79;
  os_log_t v80;
  id v81;
  id v82;
  id v83;
  NSString *v84;
  os_log_type_t v85;
  os_log_t v86;
  Class v87;
  id v88;
  id v89;
  NSString *v90;
  os_log_type_t v91;
  os_log_t v92;
  int v93;
  id v94;
  NSString *v95;
  os_log_type_t type;
  os_log_t oslog;
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD __b[8];
  id v103;
  id v104;
  id v105[2];
  SUSUIUserDefaultsBasedTestSession *v106;
  uint8_t v107[32];
  _BYTE v108[128];
  uint8_t v109[32];
  uint8_t v110[32];
  uint8_t v111[32];
  uint8_t v112[40];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v106 = self;
  v105[1] = (id)a2;
  v105[0] = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "allOptionClasses");
  v68 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
  v104 = (id)objc_msgSend(v68, "unitTestingRegisteredServicesDictionary");

  memset(__b, 0, sizeof(__b));
  obj = v104;
  v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
  if (v70)
  {
    v65 = *(_QWORD *)__b[2];
    v66 = 0;
    v67 = v70;
    while (1)
    {
      v64 = v66;
      if (*(_QWORD *)__b[2] != v65)
        objc_enumerationMutation(obj);
      v103 = *(id *)(__b[1] + 8 * v66);
      v101 = 0;
      v2 = objc_alloc(MEMORY[0x24BDBCEF0]);
      v100 = (id)objc_msgSend(v2, "initWithSet:", v105[0]);
      v59 = v100;
      getSUSMKUserDefaultsCodedMockedStrategyClass();
      objc_msgSend(v59, "addObject:", objc_opt_class());
      v61 = (void *)MEMORY[0x24BDD1620];
      v60 = v100;
      v63 = (id)objc_msgSend(v104, "objectForKeyedSubscript:", v103);
      v98 = v101;
      v62 = (id)objc_msgSend(v61, "unarchivedObjectOfClasses:fromData:error:", v60);
      objc_storeStrong(&v101, v98);
      v99 = v62;

      if (v99 && !v101)
      {
        SUSMKMockedServiceTypeUtilityClass = getSUSMKMockedServiceTypeUtilityClass();
        v52 = (id)objc_msgSend(v99, "mockedStrategyClassName");
        v53 = objc_msgSend(SUSMKMockedServiceTypeUtilityClass, "acceptibleStrategyClassName:forType:", v52, objc_msgSend(v99, "mockedService"));

        if ((v53 & 1) != 0)
        {
          v87 = 0;
          v43 = (NSString *)(id)objc_msgSend(v99, "mockedStrategyClassName");
          v87 = NSClassFromString(v43);

          if (!v87)
          {
            v86 = (os_log_t)_SUSUIInternalLoggingFacility();
            v85 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              v38 = v86;
              v39 = v85;
              v42 = -[SUSUIUserDefaultsBasedTestSession correlationId](v106, "correlationId");
              v36 = v42;
              v84 = v36;
              v41 = (id)objc_msgSend(v99, "mockedStrategyClassName");
              v37 = v41;
              v83 = v37;
              v40 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v103, "integerValue"));
              v82 = v40;
              __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v110, (uint64_t)v36, (uint64_t)v37, (uint64_t)v82);
              _os_log_error_impl(&dword_21BF33000, v38, v39, "[XCUI correlationId: %@] Could not fetch an NSClass instance from the class name string: '%@' for type: '%@'", v110, 0x20u);

              objc_storeStrong(&v82, 0);
              objc_storeStrong(&v83, 0);
              objc_storeStrong((id *)&v84, 0);
            }
            objc_storeStrong((id *)&v86, 0);
          }
          v28 = [v87 alloc];
          v27 = v106;
          v29 = (id)objc_msgSend(v99, "mockedStrategyOptions");
          v81 = (id)objc_msgSend(v28, "initForSession:usingOptions:", v27);

          v30 = v81;
          services = v106->_services;
          v32 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v99, "mockedService"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](services, "setObject:forKeyedSubscript:", v30);

          v33 = v87;
          servicesClasses = v106->_servicesClasses;
          v35 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v99, "mockedService"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](servicesClasses, "setObject:forKeyedSubscript:", v33);

          v80 = (os_log_t)_SUSUIInternalLoggingFacility();
          v79 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v80;
            v24 = v79;
            v26 = -[SUSUIUserDefaultsBasedTestSession correlationId](v106, "correlationId");
            v21 = v26;
            v78 = v21;
            v22 = v87;
            v25 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v99, "mockedService"));
            v77 = v25;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v109, (uint64_t)v21, (uint64_t)v22, (uint64_t)v77);
            _os_log_impl(&dword_21BF33000, v23, v24, "[XCUI correlationId: %@] Creating mocked service class: %@ for service '%@'", v109, 0x20u);

            objc_storeStrong(&v77, 0);
            objc_storeStrong((id *)&v78, 0);
          }
          objc_storeStrong((id *)&v80, 0);
          objc_storeStrong(&v81, 0);
          v93 = 0;
        }
        else
        {
          v92 = (os_log_t)_SUSUIInternalLoggingFacility();
          v91 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            v46 = v92;
            v47 = v91;
            v50 = -[SUSUIUserDefaultsBasedTestSession correlationId](v106, "correlationId");
            v44 = v50;
            v90 = v44;
            v49 = (id)objc_msgSend(v99, "mockedStrategyClassName");
            v45 = v49;
            v89 = v45;
            v48 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v99, "mockedService"));
            v88 = v48;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v111, (uint64_t)v44, (uint64_t)v45, (uint64_t)v88);
            _os_log_error_impl(&dword_21BF33000, v46, v47, "[XCUI correlationId: %@] The supplied strategy class name '%@' for type '%@' is not acceptible. Each strategy must be manually registered in the Service Type class.", v111, 0x20u);

            objc_storeStrong(&v88, 0);
            objc_storeStrong(&v89, 0);
            objc_storeStrong((id *)&v90, 0);
          }
          objc_storeStrong((id *)&v92, 0);
          v93 = 3;
        }
      }
      else
      {
        oslog = (os_log_t)_SUSUIInternalLoggingFacility();
        type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          v56 = type;
          v58 = -[SUSUIUserDefaultsBasedTestSession correlationId](v106, "correlationId");
          v54 = v58;
          v95 = v54;
          v57 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v103, "integerValue"));
          v94 = v57;
          __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v112, (uint64_t)v54, (uint64_t)v94, (uint64_t)v101);
          _os_log_error_impl(&dword_21BF33000, log, v56, "[XCUI correlationId: %@] Could not instantiate SUSMKUserDefaultsCodedMockedStrategy for type: '%@'.\nError: %@", v112, 0x20u);

          objc_storeStrong(&v94, 0);
          objc_storeStrong((id *)&v95, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        v93 = 3;
      }
      objc_storeStrong(&v99, 0);
      objc_storeStrong(&v100, 0);
      objc_storeStrong(&v101, 0);
      ++v66;
      if (v64 + 1 >= v67)
      {
        v66 = 0;
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
        if (!v67)
          break;
      }
    }
  }

  memset(v75, 0, sizeof(v75));
  v19 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "allCases");
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v75, v108, 16);
  if (v20)
  {
    v16 = *(_QWORD *)v75[2];
    v17 = 0;
    v18 = v20;
    while (1)
    {
      v15 = v17;
      if (*(_QWORD *)v75[2] != v16)
        objc_enumerationMutation(v19);
      v76 = *(id *)(v75[1] + 8 * v17);
      v3 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v106->_services, "objectForKeyedSubscript:", v76);
      v14 = v3 != 0;

      if (v14)
      {
        v74 = (os_log_t)_SUSUIInternalLoggingFacility();
        v73 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v74;
          v11 = v73;
          v13 = -[SUSUIUserDefaultsBasedTestSession correlationId](v106, "correlationId");
          v9 = v13;
          v72 = v9;
          v12 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v76, "integerValue"));
          v71 = v12;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v107, (uint64_t)v9, (uint64_t)v71);
          _os_log_impl(&dword_21BF33000, v10, v11, "[XCUI correlationId: %@] Registering the default implementation for service type: %@", v107, 0x16u);

          objc_storeStrong(&v71, 0);
          objc_storeStrong((id *)&v72, 0);
        }
        objc_storeStrong((id *)&v74, 0);
        v7 = getSUSMKMockedServiceTypeUtilityClass();
        v4 = objc_msgSend(v76, "integerValue");
        v8 = (id)objc_msgSend(v7, "instantiateDefaultStrategyHandlerForType:withSession:", v4, v106);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v106->_services, "setObject:forKeyedSubscript:");

        v5 = objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "defaultStrategyClassHandlerForType:", objc_msgSend(v76, "integerValue"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v106->_servicesClasses, "setObject:forKeyedSubscript:", v5, v76);
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        v17 = 0;
        v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v75, v108, 16);
        if (!v18)
          break;
      }
    }
  }

  v6 = (id)objc_msgSend(MEMORY[0x24BDBCF50], "softwareUpdateShared");
  objc_msgSend(v6, "setUnitTestingCurrentPhase:", 3);

  objc_storeStrong(&v104, 0);
  objc_storeStrong(v105, 0);
}

- (void)handlePhaseRunning
{
  dispatch_time_t when;
  NSObject *queue;
  id v4;
  char v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11[2];
  SUSUIUserDefaultsBasedTestSession *v12;

  v12 = self;
  v11[1] = (id)a2;
  v4 = (id)objc_msgSend(MEMORY[0x24BEAEF48], "sharedDefaults");
  v5 = objc_msgSend(v4, "shouldKeepPreviousMockingKitSession");

  if ((v5 & 1) != 0 && !-[NSMutableDictionary count](v12->_services, "count"))
    -[SUSUIUserDefaultsBasedTestSession handlePhaseConfigurationSealed](v12, "handlePhaseConfigurationSealed");
  when = dispatch_time(0, 100000000);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __55__SUSUIUserDefaultsBasedTestSession_handlePhaseRunning__block_invoke;
  v10 = &unk_24DFF7B58;
  v11[0] = v12;
  dispatch_after(when, queue, &v6);

  objc_storeStrong(v11, 0);
}

void __55__SUSUIUserDefaultsBasedTestSession_handlePhaseRunning__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  NSObject *log;
  os_log_type_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v13;
  id v14;
  id v15;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t v22[24];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = a1;
  v20 = a1;
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v13)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v13;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v9);
      oslog = (os_log_t)_SUSUIInternalLoggingFacility();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        v4 = type;
        v6 = (id)objc_msgSend(*(id *)(a1 + 32), "correlationId");
        v2 = v6;
        v15 = v2;
        v5 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v19, "integerValue"));
        v14 = v5;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)v2, (uint64_t)v14);
        _os_log_impl(&dword_21BF33000, log, v4, "[XCUI correlationId: %@] Sending the willBegin event to service type: %@", v22, 0x16u);

        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v1 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v19);
      objc_msgSend(v1, "willBegin");

      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
        if (!v10)
          break;
      }
    }
  }

}

- (void)handlePhaseFinished
{
  dispatch_time_t when;
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  SUSUIUserDefaultsBasedTestSession *v10;

  v10 = self;
  v9[1] = (id)a2;
  when = dispatch_time(0, 100000000);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __56__SUSUIUserDefaultsBasedTestSession_handlePhaseFinished__block_invoke;
  v8 = &unk_24DFF7B58;
  v9[0] = v10;
  dispatch_after(when, queue, &v4);

  objc_storeStrong(v9, 0);
}

void __56__SUSUIUserDefaultsBasedTestSession_handlePhaseFinished__block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  NSObject *log;
  os_log_type_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v13;
  id v14;
  id v15;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __b[8];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[24];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = a1;
  v21 = a1;
  v20 = 0;
  v20 = objc_msgSend(*(id *)(a1 + 32), "currentExecutionResult");
  memset(__b, 0, sizeof(__b));
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v13)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v13;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v9);
      oslog = (os_log_t)_SUSUIInternalLoggingFacility();
      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        v4 = type;
        v6 = (id)objc_msgSend(*(id *)(a1 + 32), "correlationId");
        v2 = v6;
        v15 = v2;
        v5 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v19, "integerValue"));
        v14 = v5;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v23, (uint64_t)v2, (uint64_t)v14);
        _os_log_impl(&dword_21BF33000, log, v4, "[XCUI correlationId: %@] Sending the willBegin event to service type: %@", v23, 0x16u);

        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v1 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v19);
      objc_msgSend(v1, "didEndWithResult:", v20);

      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v10)
          break;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_servicesClasses, 0);
  objc_storeStrong((id *)&self->_services, 0);
}

@end
