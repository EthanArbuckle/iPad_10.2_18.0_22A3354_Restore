@implementation SUSUIServiceManager

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance_sharedInstance;
}

void __37__SUSUIServiceManager_sharedInstance__block_invoke()
{
  SUSUIServiceManager *v0;
  void *v1;

  v0 = objc_alloc_init(SUSUIServiceManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (SUSUIServiceManager)init
{
  NSMutableDictionary *v2;
  NSMutableDictionary *registeredServices;
  SUSUIServiceManager *v5;
  SUSUIServiceManager *v6;
  objc_super v7;
  SEL v8;
  SUSUIServiceManager *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUIServiceManager;
  v6 = -[SUSUIServiceManager init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = (NSMutableDictionary *)(id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    registeredServices = v9->_registeredServices;
    v9->_registeredServices = v2;

  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)initialize
{
  objc_class *v2;
  id v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  os_log_t oslog;
  NSString *v8;
  os_log_type_t v9;
  id v10[2];
  SUSUIServiceManager *v11;
  uint8_t v12[16];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  v10[1] = (id)a2;
  if (!-[SUSUIServiceManager initialized](self, "initialized"))
  {
    -[SUSUIServiceManager setInitialized:](v11, "setInitialized:", 1);
    -[SUSUIServiceManager reset](v11, "reset");
    v10[0] = _SUSUILoggingFacility();
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v10[0];
      type = v9;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSUIServiceManager initialize]", (uint64_t)v8);
      _os_log_impl(&dword_21BF33000, log, type, "%s: Initializing %{public}@", v13, 0x16u);

      objc_storeStrong((id *)&v8, 0);
    }
    objc_storeStrong(v10, 0);
    if (NSClassFromString(CFSTR("SUSUITestAutomationManager")))
    {
      v3 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
      objc_msgSend(v3, "initialize");

    }
    else
    {
      oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v12, (uint64_t)"-[SUSUIServiceManager initialize]");
        _os_log_error_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_ERROR, "%s: __HAS_SUSUI_MOCKING_KIT is true but SUSUITestAutomationManager doesn't exists.", v12, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)registerServiceWithName:(id)a3 forServiceClass:(Class)a4
{
  os_log_t v5;
  os_log_type_t v6;
  os_log_t v7;
  int v8;
  os_log_type_t type;
  os_log_t oslog;
  Class v11;
  id location[2];
  SUSUIServiceManager *v13;
  uint8_t v14[32];
  uint8_t v15[32];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = a4;
  if (location[0] && v11)
  {
    if (-[NSMutableDictionary objectForKey:](v13->_registeredServices, "objectForKey:", location[0]))
    {
      v7 = (os_log_t)_SUSUILoggingFacility();
      v6 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)location[0], (uint64_t)v11);
        _os_log_error_impl(&dword_21BF33000, v7, v6, "Failed to register service with name '%@' for class '%@'. Service with this name is already registered.", v15, 0x16u);
      }
      objc_storeStrong((id *)&v7, 0);
      v8 = 1;
    }
    else
    {
      v5 = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, (uint64_t)location[0], (uint64_t)v11);
        _os_log_impl(&dword_21BF33000, v5, OS_LOG_TYPE_DEFAULT, "Registering service with name '%@' for class '%@'.", v14, 0x16u);
      }
      objc_storeStrong((id *)&v5, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13->_registeredServices, "setObject:forKeyedSubscript:", v11, location[0]);
      v8 = 0;
    }
  }
  else
  {
    oslog = (os_log_t)_SUSUILoggingFacility();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v16, (uint64_t)location[0], (uint64_t)v11);
      _os_log_error_impl(&dword_21BF33000, oslog, type, "Failed to register service with name '%@' for class '%@'. Service name and class must not be nil.", v16, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isServiceRegistered:(id)a3
{
  BOOL v4;
  id location[2];
  SUSUIServiceManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[NSMutableDictionary objectForKey:](v6->_registeredServices, "objectForKey:", location[0]) != 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (Class)classForService:(Class)a3
{
  NSMutableDictionary *registeredServices;
  NSString *v5;
  void *v6;

  registeredServices = self->_registeredServices;
  v5 = NSStringFromClass(a3);
  v6 = (void *)-[NSMutableDictionary objectForKey:](registeredServices, "objectForKey:");

  if (v6)
    return (Class)v6;
  else
    return a3;
}

- (Class)classForServiceName:(id)a3
{
  id v4;
  id location[2];
  SUSUIServiceManager *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_registeredServices, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_registeredServices, "removeAllObjects", a2, self);
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredServices, 0);
}

- (void)registerMockClasses
{
  id v2;
  uint64_t v3;
  id v4;
  NSObject *log;
  os_log_type_t v6;
  NSString *v7;
  id v8;
  id v9;
  SUSUIServiceManager *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id obj;
  uint64_t v23;
  NSString *v24;
  id v25;
  id v26;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD v29[8];
  id v30;
  id v31;
  _QWORD __b[8];
  id v33;
  id v34[2];
  SUSUIServiceManager *v35;
  uint8_t v36[56];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v35 = self;
  v34[1] = (id)a2;
  v34[0] = -[SUSUIServiceManager mockedServicesMap](self, "mockedServicesMap");
  memset(__b, 0, sizeof(__b));
  obj = v34[0];
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
  if (v23)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v23;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(obj);
      v33 = *(id *)(__b[1] + 8 * v20);
      v31 = (id)objc_msgSend(v34[0], "objectForKeyedSubscript:", v33);
      memset(v29, 0, sizeof(v29));
      v16 = v31;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v29, v37, 16);
      if (v17)
      {
        v13 = *(_QWORD *)v29[2];
        v14 = 0;
        v15 = v17;
        while (1)
        {
          v12 = v14;
          if (*(_QWORD *)v29[2] != v13)
            objc_enumerationMutation(v16);
          v30 = *(id *)(v29[1] + 8 * v14);
          v10 = v35;
          v11 = (id)objc_msgSend(v30, "resolvedServiceClassName");
          -[SUSUIServiceManager registerServiceWithName:forServiceClass:](v10, "registerServiceWithName:forServiceClass:", v11, objc_msgSend(v30, "mockedServiceClass"));

          oslog = (os_log_t)_SUSUILoggingFacility();
          type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            v6 = type;
            v9 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass_1(), "descriptionForType:", objc_msgSend(v33, "integerValue"));
            v2 = v9;
            v26 = v2;
            v3 = (uint64_t)v33;
            v8 = (id)objc_msgSend(v30, "resolvedServiceClassName");
            v4 = v8;
            v25 = v4;
            v7 = NSStringFromClass((Class)objc_msgSend(v30, "mockedServiceClass"));
            v24 = v7;
            __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v36, (uint64_t)"-[SUSUIServiceManager(XCUI) registerMockClasses]", (uint64_t)v2, v3, (uint64_t)v4, (uint64_t)v24);
            _os_log_impl(&dword_21BF33000, log, v6, "%s: Registering mock mapping for service \"%@\" (%@): \"%@\" -> \"%@\", v36, 0x34u);

            objc_storeStrong((id *)&v24, 0);
            objc_storeStrong(&v25, 0);
            objc_storeStrong(&v26, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
          ++v14;
          if (v12 + 1 >= v15)
          {
            v14 = 0;
            v15 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v29, v37, 16);
            if (!v15)
              break;
          }
        }
      }

      objc_storeStrong(&v31, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v38, 16);
        if (!v21)
          break;
      }
    }
  }

  objc_storeStrong(v34, 0);
}

- (id)mockedServicesMap
{
  SUSMKockedServiceRecord *v3;
  SUSMKockedServiceRecord *v4;
  uint64_t v5;
  SUSMKockedServiceRecord *v6;
  uint64_t v7;
  SUSMKockedServiceRecord *v8;
  id v9;
  id v10;
  SUSMKockedServiceRecord *v11;
  SUSMKockedServiceRecord *v12;
  SUSMKockedServiceRecord *v13;
  id v14;
  SUSMKockedServiceRecord *v15;
  _QWORD v16[3];
  SUSMKockedServiceRecord *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v18[0] = &unk_24E011748;
  v3 = [SUSMKockedServiceRecord alloc];
  objc_opt_class();
  objc_opt_class();
  v15 = -[SUSMKockedServiceRecord initWithServiceType:resolvingService:usingMockedClass:](v3, "initWithServiceType:resolvingService:usingMockedClass:");
  v17 = v15;
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v19[0] = v14;
  v18[1] = &unk_24E011760;
  v4 = [SUSMKockedServiceRecord alloc];
  objc_opt_class();
  objc_opt_class();
  v13 = -[SUSMKockedServiceRecord initWithServiceType:resolvingService:usingMockedClass:](v4, "initWithServiceType:resolvingService:usingMockedClass:");
  v16[0] = v13;
  v6 = [SUSMKockedServiceRecord alloc];
  v5 = objc_opt_class();
  v12 = -[SUSMKockedServiceRecord initWithServiceType:resolvingService:usingMockedClass:](v6, "initWithServiceType:resolvingService:usingMockedClass:", 0, v5, objc_opt_class());
  v16[1] = v12;
  v8 = [SUSMKockedServiceRecord alloc];
  v7 = objc_opt_class();
  v11 = -[SUSMKockedServiceRecord initWithServiceType:resolvingService:usingMockedClass:](v8, "initWithServiceType:resolvingService:usingMockedClass:", 0, v7, objc_opt_class());
  v16[2] = v11;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v19[1] = v9;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);

  return v10;
}

@end
