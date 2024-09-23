@implementation SidecarService

void __37__SidecarService_Scanner_returnTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF84E0], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF85D0], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithObjects:", v5, v1, v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)returnTypes_types;
  returnTypes_types = v3;

}

void __45__SidecarService_LosslessScanner_returnTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("com.apple.DocumentCamera.scan-archive"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)returnTypes_types_296;
  returnTypes_types_296 = v0;

}

void __36__SidecarService_Camera_returnTypes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", CFSTR("ContinuityCameraImageType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "_typeWithIdentifier:allowUndeclared:", v1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "conformsToType:", *MEMORY[0x24BDF8410]))
      v8 = v1;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }
  v3 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend((id)*MEMORY[0x24BDF8438], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF85D0], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, v8, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)returnTypes_types_545;
  returnTypes_types_545 = v6;

}

- (SidecarService)init
{
  uint64_t v3;
  SidecarService *v4;
  objc_super v6;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    _NSRequestConcreteObject();
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SidecarService;
    self = -[SidecarService init](&v6, sel_init);
    v4 = self;
  }

  return v4;
}

- (SidecarService)initWithDevice:(id)a3
{
  id v5;
  uint64_t v6;
  SidecarService *v7;
  SidecarService *v8;
  SidecarService *v9;

  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "minimumRapportVersion");
  if (objc_msgSend(v5, "rapportVersion") >= v6)
  {
    v8 = -[SidecarService init](self, "init");
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_targetDevice, a3);
    self = v9;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)devices
{
  return (NSArray *)-[SidecarService _devicesByForcingFetchFromRelay:](self, "_devicesByForcingFetchFromRelay:", 0);
}

- (id)_devicesByForcingFetchFromRelay:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  objc_class *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (self->_targetDevice)
  {
    v15[0] = self->_targetDevice;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SidecarDevice allDevicesByForcingFetchFromRelay:](SidecarDevice, "allDevicesByForcingFetchFromRelay:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)objc_opt_class(), "minimumRapportVersion");
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __filterSupportedDevices_block_invoke;
    v12[3] = &__block_descriptor_40_e23_B16__0__SidecarDevice_8l;
    v12[4] = v5;
    v7 = v12;
    v8 = (objc_class *)MEMORY[0x24BDBCEB8];
    v9 = v4;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithCapacity:", objc_msgSend(v9, "count"));
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __filterDevices_block_invoke;
    v13[3] = &unk_24E5E1440;
    v13[4] = v10;
    v14 = v7;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    v3 = (void *)objc_msgSend(v10, "copy");
  }
  return v3;
}

- (NSString)name
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "name");
}

- (NSArray)returnTypes
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "returnTypes");
}

- (NSArray)sendTypes
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (BOOL)isEnabled
{
  void *v2;
  BOOL v3;

  -[SidecarService devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSString)serviceIdentifier
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (NSString)serviceExtension
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (id)mutableRequestMessage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  SidecarMessageSetType(v3, 1);
  -[SidecarService name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, &unk_24E5E6928);

  return v3;
}

- (NSString)localizedDescription
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_24E5E1A30;
}

- (NSString)localizedItemName
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSString *)&stru_24E5E1A30;
}

- (id)makeRequest
{
  return makeRequest(self, self->_targetDevice);
}

- (id)makeRequestWithResponder:(id)a3 sendTypes:(id)a4 returnTypes:(id)a5
{
  return makeRequest(self, self->_targetDevice);
}

- (id)makeRequestToDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  filterTargetDevice(self, v4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_4;
  SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_220044000, v7, OS_LOG_TYPE_DEFAULT, "While trying to make a request to device with IDS identifier [%@], the target device was not found. Forcing a fetch to SidecarRelay to find the device.", (uint8_t *)&v13, 0xCu);

  }
  filterTargetDevice(self, v4, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_4:
    makeRequest(self, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
    v10 = objc_claimAutoreleasedReturnValue();
    v5 = v10;
    if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_220044000, v5, OS_LOG_TYPE_DEFAULT, "Even after forcing a fetch to SidecarRelay, the device with identifier [%@] could not be found.  Will not be able to make a request to it.", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (id)copyWithDevice:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDevice:", v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
}

+ (id)services
{
  if (services_once != -1)
    dispatch_once(&services_once, &__block_literal_global_827);
  return (id)services_services;
}

+ (id)menuServices
{
  if (menuServices_once != -1)
    dispatch_once(&menuServices_once, &__block_literal_global_29);
  return (id)menuServices_services;
}

+ (id)serviceWithIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SidecarService allServices](SidecarService, "allServices");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "serviceIdentifier", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v3, "isEqualToString:", v9);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)serviceWithName:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SidecarService services](SidecarService, "services");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "name", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v3, "isEqualToString:", v8);

        if ((v9 & 1) != 0)
        {
          v5 = (void *)objc_opt_new();
          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (NSArray)allServices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[SidecarService services](SidecarService, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v3, "addObject:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (NSArray)allMenuServices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[SidecarService menuServices](SidecarService, "menuServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_opt_new();
        objc_msgSend(v3, "addObject:", v9, v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (id)extensionForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = extensionForIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&extensionForIdentifier__onceToken, &__block_literal_global_33);
  objc_msgSend((id)extensionForIdentifier__serviceToExtension, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)servicesForPasteboardSendTypes:(id)a3 returnTypes:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  +[SidecarService services](SidecarService, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "returnTypes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "intersectsSet:", v7))
        {
          v16 = (void *)objc_opt_new();
          objc_msgSend(v6, "addObject:", v16);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v6;
}

+ (id)servicesForPasteboardTypes:(id)a3
{
  return (id)objc_msgSend(a1, "servicesForPasteboardSendTypes:returnTypes:", 0, a3);
}

+ (id)name
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (NSArray)returnTypes
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (NSSet)allReturnTypes
{
  if (allReturnTypes_once != -1)
    dispatch_once(&allReturnTypes_once, &__block_literal_global_36);
  return (NSSet *)(id)allReturnTypes_allTypes;
}

+ (NSSet)allSendTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

+ (int64_t)minimumRapportVersion
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return -1;
}

void __32__SidecarService_allReturnTypes__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[SidecarService services](SidecarService, "services");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v0, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "returnTypes", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWithArray:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v1, "unionSet:", v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v10 = objc_msgSend(v1, "copy");
  v11 = (void *)allReturnTypes_allTypes;
  allReturnTypes_allTypes = v10;

}

void __41__SidecarService_extensionForIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[SidecarService allServices](SidecarService, "allServices");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v0, "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "serviceExtension", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serviceIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v8, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v10 = (void *)extensionForIdentifier__serviceToExtension;
  extensionForIdentifier__serviceToExtension = (uint64_t)v1;

}

void __30__SidecarService_menuServices__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)menuServices_services;
  menuServices_services = v3;

}

void __26__SidecarService_services__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[9];

  v10[8] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  objc_opt_self();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)services_services;
  services_services = v8;

}

void __36__SidecarService_Sketch_returnTypes__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithObjects:", v3, CFSTR("com.apple.drawing"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)returnTypes_types_935;
  returnTypes_types_935 = v1;

}

@end
