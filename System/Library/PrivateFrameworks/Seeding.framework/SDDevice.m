@implementation SDDevice

- (SDDevice)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SDDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SDSeedingConfiguration *v12;
  void *v13;
  SDSeedingConfiguration *v14;
  SDSeedingConfiguration *v15;
  void *v16;
  SDSeedingConfiguration *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDDevice;
  v5 = -[SDDevice init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setName:](v5, "setName:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setPlatform:](v5, "setPlatform:", objc_msgSend(v8, "integerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setDeviceClass:](v5, "setDeviceClass:", v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setBuild:](v5, "setBuild:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("updatedAt"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setUpdatedAt:](v5, "setUpdatedAt:", v11);

    v12 = [SDSeedingConfiguration alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentConfiguration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SDSeedingConfiguration initWithDictionaryRepresentation:](v12, "initWithDictionaryRepresentation:", v13);
    -[SDDevice setCurrentConfiguration:](v5, "setCurrentConfiguration:", v14);

    v15 = [SDSeedingConfiguration alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expectedConfiguration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SDSeedingConfiguration initWithDictionaryRepresentation:](v15, "initWithDictionaryRepresentation:", v16);
    -[SDDevice setExpectedConfiguration:](v5, "setExpectedConfiguration:", v17);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFeedbackAssistantAvailable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setIsFeedbackAssistantAvailable:](v5, "setIsFeedbackAssistantAvailable:", objc_msgSend(v18, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRunningSeedBuild"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setIsRunningSeedBuild:](v5, "setIsRunningSeedBuild:", objc_msgSend(v19, "BOOLValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasDeviceManagementRestriction"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setHasDeviceManagementRestriction:](v5, "setHasDeviceManagementRestriction:", objc_msgSend(v20, "BOOLValue"));

  }
  return v5;
}

- (SDDevice)initWithCoder:(id)a3
{
  id v4;
  SDDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SDDevice;
  v5 = -[SDDevice init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setPlatform:](v5, "setPlatform:", objc_msgSend(v8, "integerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1E98D0E68;
    -[SDDevice setDeviceClass:](v5, "setDeviceClass:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setBuild:](v5, "setBuild:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatedAt"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setUpdatedAt:](v5, "setUpdatedAt:", v13);

    -[SDDevice setIsFeedbackAssistantAvailable:](v5, "setIsFeedbackAssistantAvailable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFeedbackAssistantAvailable")));
    -[SDDevice setIsRunningSeedBuild:](v5, "setIsRunningSeedBuild:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRunningSeedBuild")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentConfiguration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setCurrentConfiguration:](v5, "setCurrentConfiguration:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedConfiguration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDDevice setExpectedConfiguration:](v5, "setExpectedConfiguration:", v15);

    -[SDDevice setHasDeviceManagementRestriction:](v5, "setHasDeviceManagementRestriction:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDeviceManagementRestriction")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[SDDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("name"));

  -[SDDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SDDevice platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("platform"));

  -[SDDevice deviceClass](self, "deviceClass");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SDDevice deviceClass](self, "deviceClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SDDevice deviceClass](self, "deviceClass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("deviceClass"));

    }
  }
  -[SDDevice build](self, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("build"));

  -[SDDevice updatedAt](self, "updatedAt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("updatedAt"));

  -[SDDevice currentConfiguration](self, "currentConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("currentConfiguration"));

  -[SDDevice expectedConfiguration](self, "expectedConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("expectedConfiguration"));

  objc_msgSend(v16, "encodeBool:forKey:", -[SDDevice isFeedbackAssistantAvailable](self, "isFeedbackAssistantAvailable"), CFSTR("isFeedbackAssistantAvailable"));
  objc_msgSend(v16, "encodeBool:forKey:", -[SDDevice isRunningSeedBuild](self, "isRunningSeedBuild"), CFSTR("isRunningSeedBuild"));
  objc_msgSend(v16, "encodeBool:forKey:", -[SDDevice hasDeviceManagementRestriction](self, "hasDeviceManagementRestriction"), CFSTR("hasDeviceManagementRestriction"));

}

+ (void)getCurrentDevice:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SDDevice_getCurrentDevice___block_invoke;
  v6[3] = &unk_1E98CF708;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "getCurrentDevice:", v6);

}

uint64_t __29__SDDevice_getCurrentDevice___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)currentDevice
{
  void *v2;
  void *v3;

  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentDeviceSynchronously");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)blankDeviceWithErrorMessage:(id)a3
{
  id v3;
  SDDevice *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(SDDevice);
  -[SDDevice setName:](v4, "setName:", &stru_1E98D0E68);
  -[SDDevice setIdentifier:](v4, "setIdentifier:", CFSTR("__BLANK_ERROR_DEVICE__"));
  -[SDDevice setPlatform:](v4, "setPlatform:", 1);
  -[SDDevice setDeviceClass:](v4, "setDeviceClass:", v3);
  -[SDDevice setBuild:](v4, "setBuild:", v3);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice setUpdatedAt:](v4, "setUpdatedAt:", v5);

  -[SDDevice setIsFeedbackAssistantAvailable:](v4, "setIsFeedbackAssistantAvailable:", 0);
  -[SDDevice setIsRunningSeedBuild:](v4, "setIsRunningSeedBuild:", 0);
  -[SDDevice setHasDeviceManagementRestriction:](v4, "setHasDeviceManagementRestriction:", 0);
  +[SDSeedingConfiguration nullConfiguration](SDSeedingConfiguration, "nullConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice setCurrentConfiguration:](v4, "setCurrentConfiguration:", v6);

  +[SDSeedingConfiguration nullConfiguration](SDSeedingConfiguration, "nullConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice setExpectedConfiguration:](v4, "setExpectedConfiguration:", v7);

  return v4;
}

- (BOOL)isErrorDevice
{
  void *v2;
  char v3;

  -[SDDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("__BLANK_ERROR_DEVICE__"));

  return v3;
}

+ (id)_currentDevice
{
  void *v2;
  int v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SDDevice__currentDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_currentDevice_onceToken != -1)
    dispatch_once(&_currentDevice_onceToken, block);
  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isEnrollmentAllowedByDeviceManagement_legacy");
  objc_msgSend((id)_currentDevice_currentDevice, "setHasDeviceManagementRestriction:", v3 ^ 1u);

  objc_msgSend((id)_currentDevice_currentDevice, "checkIn");
  return (id)_currentDevice_currentDevice;
}

void __26__SDDevice__currentDevice__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  SDDevice *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[SDKeyValueStore deviceDictionaryForDeviceIdentifier:](SDKeyValueStore, "deviceDictionaryForDeviceIdentifier:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (v3)
    v4 = -[SDDevice initWithDictionaryRepresentation:]([SDDevice alloc], "initWithDictionaryRepresentation:", v3);
  else
    v4 = (SDDevice *)objc_opt_new();
  v5 = (void *)_currentDevice_currentDevice;
  _currentDevice_currentDevice = (uint64_t)v4;

  objc_msgSend((id)_currentDevice_currentDevice, "setIdentifier:", v13);
  v6 = objc_msgSend(*(id *)(a1 + 32), "devicePlatform");
  objc_msgSend((id)_currentDevice_currentDevice, "setPlatform:", v6);
  objc_msgSend(*(id *)(a1 + 32), "deviceClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_currentDevice_currentDevice, "setDeviceClass:", v7);

  objc_msgSend(*(id *)(a1 + 32), "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_currentDevice_currentDevice, "setName:", v8);

  objc_msgSend(*(id *)(a1 + 32), "osBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_currentDevice_currentDevice, "setBuild:", v9);

  +[SDSeedingConfiguration currentConfiguration](SDSeedingConfiguration, "currentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_currentDevice_currentDevice, "setCurrentConfiguration:", v10);

  v11 = +[SDBuildInfo isFeedbackAssistantAvailable](SDBuildInfo, "isFeedbackAssistantAvailable");
  objc_msgSend((id)_currentDevice_currentDevice, "setIsFeedbackAssistantAvailable:", v11);
  v12 = +[SDBuildInfo currentBuildIsSeed](SDBuildInfo, "currentBuildIsSeed");
  objc_msgSend((id)_currentDevice_currentDevice, "setIsRunningSeedBuild:", v12);

}

- (void)updateCurrentConfiguration
{
  void *v3;

  +[SDSeedingConfiguration currentConfiguration](SDSeedingConfiguration, "currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice setCurrentConfiguration:](self, "setCurrentConfiguration:", v3);

  +[SDKeyValueStore insertOrUpdateDevice:](SDKeyValueStore, "insertOrUpdateDevice:", self);
}

+ (void)getDevicesMatchingPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  +[SDDaemonClient sharedInstance](SDDaemonClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SDDevice_getDevicesMatchingPlatforms_completion___block_invoke;
  v8[3] = &unk_1E98CF750;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "getDevicesForPlatforms:completion:", a3, v8);

}

uint64_t __51__SDDevice_getDevicesMatchingPlatforms_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_devicesMatchingPlatforms:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SDDevice *v12;
  SDDevice *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[SDKeyValueStore devicesDictionary](SDKeyValueStore, "devicesDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [SDDevice alloc];
        v13 = -[SDDevice initWithDictionaryRepresentation:](v12, "initWithDictionaryRepresentation:", v11, (_QWORD)v15);
        if ((-[SDDevice platform](v13, "platform") & a3) != 0)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)checkIn
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice setUpdatedAt:](self, "setUpdatedAt:", v3);

  -[SDDevice updateCurrentConfiguration](self, "updateCurrentConfiguration");
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[11];
  _QWORD v24[13];

  v24[11] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("name");
  -[SDDevice name](self, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("identifier");
  -[SDDevice identifier](self, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("platform");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SDDevice platform](self, "platform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("deviceClass");
  -[SDDevice deviceClass](self, "deviceClass");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("build");
  -[SDDevice build](self, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("updatedAt");
  -[SDDevice updatedAt](self, "updatedAt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v3;
  v23[6] = CFSTR("isFeedbackAssistantAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SDDevice isFeedbackAssistantAvailable](self, "isFeedbackAssistantAvailable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v4;
  v23[7] = CFSTR("hasDeviceManagementRestiction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SDDevice hasDeviceManagementRestriction](self, "hasDeviceManagementRestriction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v5;
  v23[8] = CFSTR("isRunningSeedBuild");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SDDevice isRunningSeedBuild](self, "isRunningSeedBuild"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v6;
  v23[9] = CFSTR("currentConfiguration");
  -[SDDevice currentConfiguration](self, "currentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x1E0C9AA70];
  if (v8)
    v11 = v8;
  else
    v11 = MEMORY[0x1E0C9AA70];
  v24[9] = v11;
  v23[10] = CFSTR("expectedConfiguration");
  -[SDDevice expectedConfiguration](self, "expectedConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = v10;
  v24[10] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v16;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SDDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SDDevice identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_enrollInBetaProgram:(id)a3
{
  -[SDDevice _enrollInBetaProgram:userIdentifier:](self, "_enrollInBetaProgram:userIdentifier:", a3, 0);
}

- (void)_enrollInBetaProgram:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  SDSeedingConfiguration *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    Log_1();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4F89000, v14, OS_LOG_TYPE_INFO, "Program was nil, no change will be made to the beta program.", buf, 2u);
    }
    goto LABEL_13;
  }
  v8 = -[SDDevice platform](self, "platform");
  if (v8 != objc_msgSend(v6, "platform"))
  {
    Log_1();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SDDevice _enrollInBetaProgram:userIdentifier:].cold.1(v14);
    goto LABEL_13;
  }
  v9 = -[SDSeedingConfiguration initWithBetaProgram:]([SDSeedingConfiguration alloc], "initWithBetaProgram:", v6);
  -[SDDevice setExpectedConfiguration:](self, "setExpectedConfiguration:", v9);

  -[SDDevice updateCurrentConfiguration](self, "updateCurrentConfiguration");
  -[SDDevice currentConfiguration](self, "currentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice expectedConfiguration](self, "expectedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if (!v12)
  {
    +[SDDevice _currentDevice](SDDevice, "_currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SDDevice isEqual:](self, "isEqual:", v15);

    if (!v16)
      goto LABEL_14;
    -[SDDevice _configureDeviceWithExpectedConfigurationWithUserIdentifier:](self, "_configureDeviceWithExpectedConfigurationWithUserIdentifier:", v7);
    +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject _saveBetaProgram:](v14, "_saveBetaProgram:", v6);
LABEL_13:

    goto LABEL_14;
  }
  Log_1();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1D4F89000, v13, OS_LOG_TYPE_DEFAULT, "Seeding configuration matches expected configuration.", v17, 2u);
  }

  -[SDDevice _configureDeviceWithExpectedConfigurationWithUserIdentifier:](self, "_configureDeviceWithExpectedConfigurationWithUserIdentifier:", v7);
LABEL_14:

}

- (void)_configureDeviceWithExpectedConfiguration
{
  -[SDDevice _configureDeviceWithExpectedConfigurationWithUserIdentifier:](self, "_configureDeviceWithExpectedConfigurationWithUserIdentifier:", 0);
}

- (void)_configureDeviceWithExpectedConfigurationWithUserIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  Log_1();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D4F89000, v5, OS_LOG_TYPE_DEFAULT, "Updating seeding configuration with expected configuration.", v8, 2u);
  }

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice expectedConfiguration](self, "expectedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_enrollUsingSeedingConfiguration:userIdentifier:", v7, v4);

  -[SDDevice updateCurrentConfiguration](self, "updateCurrentConfiguration");
}

- (BOOL)_unenrollWithUserIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  char v9;

  v4 = a3;
  +[SDSeedingConfiguration nullConfiguration](SDSeedingConfiguration, "nullConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDDevice setExpectedConfiguration:](self, "setExpectedConfiguration:", v5);

  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SDDevice isEqual:](self, "isEqual:", v6);

  if (v7)
  {
    +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_unenrollFromBetaProgramWithUserIdentifier:", v4);

    -[SDDevice updateCurrentConfiguration](self, "updateCurrentConfiguration");
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_isEnrolled
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  char v6;

  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SDDevice isEqual:](self, "isEqual:", v3);

  if (v4)
  {
    +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isEnrolledInBetaProgram");
  }
  else
  {
    -[SDDevice currentConfiguration](self, "currentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "seedProgram") != 0;
  }

  return v6;
}

- (id)_enrolledBetaProgram
{
  return +[SDBetaManager _currentBetaProgram](SDBetaManager, "_currentBetaProgram");
}

- (void)_verifyEnrollmentWithUserIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SDDevice isEqual:](self, "isEqual:", v8);

  if (v9)
  {
    -[SDDevice updateCurrentConfiguration](self, "updateCurrentConfiguration");
    -[SDDevice currentConfiguration](self, "currentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetAudience");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SDDevice currentConfiguration](self, "currentConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "seedProgramID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    -[SDDevice currentConfiguration](self, "currentConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    Log_1();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2048;
      v25 = v14;
      v26 = 2114;
      v27 = v16;
      _os_log_impl(&dword_1D4F89000, v17, OS_LOG_TYPE_DEFAULT, "Verifying with assetAudience [%{public}@], programID [%lu], accountID [%{public}@]", buf, 0x20u);
    }

    +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__SDDevice__verifyEnrollmentWithUserIdentifier_completion___block_invoke;
    v19[3] = &unk_1E98CF778;
    v19[4] = self;
    v20 = v6;
    v21 = v7;
    objc_msgSend(v18, "verifyAssetAudience:programID:accountID:withCompletion:", v11, v14, v16, v19);

  }
}

void __59__SDDevice__verifyEnrollmentWithUserIdentifier_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = (void *)a1[4];
  v8 = v5;
  if ((_DWORD)a2)
    objc_msgSend(v6, "_enrollInBetaProgram:", v5);
  else
    objc_msgSend(v6, "_unenrollWithUserIdentifier:", a1[5]);
  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

- (BOOL)_canFileFeedback
{
  void *v3;
  _BOOL4 v4;
  BOOL v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  NSObject *v9;
  int v11;
  _BYTE v12[10];
  unint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  +[SDDevice _currentDevice](SDDevice, "_currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SDDevice isEqual:](self, "isEqual:", v3);

  if (v4)
    -[SDDevice updateCurrentConfiguration](self, "updateCurrentConfiguration");
  if (-[SDDevice platform](self, "platform") == 4)
    return 0;
  if (-[SDDevice platform](self, "platform") == 1
    || -[SDDevice platform](self, "platform") == 2
    || -[SDDevice platform](self, "platform") == 32)
  {
    v6 = -[SDDevice _isEnrolled](self, "_isEnrolled");
    v7 = -[SDDevice isRunningSeedBuild](self, "isRunningSeedBuild");
    v8 = -[SDDevice isFeedbackAssistantAvailable](self, "isFeedbackAssistantAvailable");
    v5 = (v6 || v7) && v8;
    Log_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109888;
      *(_DWORD *)v12 = v6;
      *(_WORD *)&v12[4] = 1024;
      *(_DWORD *)&v12[6] = v7;
      LOWORD(v13) = 1024;
      *(_DWORD *)((char *)&v13 + 2) = v8;
      HIWORD(v13) = 1024;
      v14 = (v6 || v7) && v8;
      _os_log_impl(&dword_1D4F89000, v9, OS_LOG_TYPE_DEFAULT, "canFileFeedback: enrolledInSeed: %d, onSeedBuild: %d, isFBAAvailable %d, -> result: %d", (uint8_t *)&v11, 0x1Au);
    }
  }
  else
  {
    Log_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      *(_QWORD *)v12 = "-[SDDevice _canFileFeedback]";
      *(_WORD *)&v12[8] = 2048;
      v13 = -[SDDevice platform](self, "platform");
      _os_log_impl(&dword_1D4F89000, v9, OS_LOG_TYPE_DEFAULT, "%s is not supported on platform [%lu]", (uint8_t *)&v11, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

+ (id)deviceIdentifier
{
  return (id)MGCopyAnswer();
}

+ (unint64_t)devicePlatform
{
  if (objc_msgSend(a1, "deviceIsHomePod"))
    return 16;
  else
    return 1;
}

+ (BOOL)deviceIsHomePod
{
  return MGGetSInt32Answer() == 7;
}

+ (id)deviceClass
{
  if ((objc_msgSend(a1, "deviceIsHomePod") & 1) != 0)
    return CFSTR("HomePod");
  else
    return (id)MGCopyAnswer();
}

+ (id)deviceProductType
{
  return (id)MGCopyAnswer();
}

+ (id)deviceClassForProductType:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = CFSTR("AppleTV");
    if ((objc_msgSend(v4, "containsString:", CFSTR("AppleTV")) & 1) == 0)
    {
      v6 = CFSTR("iPhone");
      if ((objc_msgSend(v5, "containsString:", CFSTR("iPhone")) & 1) == 0)
      {
        v6 = CFSTR("iPad");
        if ((objc_msgSend(v5, "containsString:", CFSTR("iPad")) & 1) == 0)
        {
          v6 = CFSTR("Watch");
          if ((objc_msgSend(v5, "containsString:", CFSTR("Watch")) & 1) == 0)
          {
            if ((objc_msgSend(v5, "containsString:", CFSTR("AudioAccessory")) & 1) != 0)
            {
              v6 = CFSTR("HomePod");
            }
            else if (objc_msgSend(v5, "containsString:", CFSTR("Mac")))
            {
              objc_msgSend(a1, "deriveMacDeviceClassForProductType:", v5);
              v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              Log_1();
              v8 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                +[SDDevice deviceClassForProductType:].cold.1((uint64_t)v5, v8);

              v6 = &stru_1E98D0E68;
            }
          }
        }
      }
    }
    v7 = v6;
  }
  else
  {
    v7 = &stru_1E98D0E68;
  }

  return v7;
}

+ (id)deriveMacDeviceClassForProductType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithDeviceModelCode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("com.apple."), &stru_1E98D0E68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "containsString:", CFSTR("macbookpro")) & 1) != 0)
  {
    v7 = CFSTR("MacBookPro");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macbookair")) & 1) != 0)
  {
    v7 = CFSTR("MacBookAir");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macbook")) & 1) != 0)
  {
    v7 = CFSTR("MacBook");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("imac")) & 1) != 0)
  {
    v7 = CFSTR("iMac");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macmini")) & 1) != 0)
  {
    v7 = CFSTR("Macmini");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macpro")) & 1) != 0)
  {
    v7 = CFSTR("MacPro");
  }
  else if ((objc_msgSend(v6, "containsString:", CFSTR("macstudio")) & 1) != 0)
  {
    v7 = CFSTR("MacStudio");
  }
  else
  {
    Log_1();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_1D4F89000, v8, OS_LOG_TYPE_DEFAULT, "No Mac product mapping for [%{public}@]", (uint8_t *)&v10, 0xCu);
    }

    v7 = &stru_1E98D0E68;
  }

  return (id)v7;
}

+ (id)deviceName
{
  return (id)MGCopyAnswer();
}

+ (id)osBuild
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

+ (id)marketingProductName
{
  return (id)MGCopyAnswer();
}

+ (id)productVersion
{
  return (id)MGCopyAnswer();
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBuild:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)updatedAt
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUpdatedAt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isFeedbackAssistantAvailable
{
  return self->_isFeedbackAssistantAvailable;
}

- (void)setIsFeedbackAssistantAvailable:(BOOL)a3
{
  self->_isFeedbackAssistantAvailable = a3;
}

- (BOOL)isRunningSeedBuild
{
  return self->_isRunningSeedBuild;
}

- (void)setIsRunningSeedBuild:(BOOL)a3
{
  self->_isRunningSeedBuild = a3;
}

- (BOOL)hasDeviceManagementRestriction
{
  return self->_hasDeviceManagementRestriction;
}

- (void)setHasDeviceManagementRestriction:(BOOL)a3
{
  self->_hasDeviceManagementRestriction = a3;
}

- (SDSeedingConfiguration)currentConfiguration
{
  return (SDSeedingConfiguration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCurrentConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (SDSeedingConfiguration)expectedConfiguration
{
  return (SDSeedingConfiguration *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExpectedConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_enrollInBetaProgram:(os_log_t)log userIdentifier:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D4F89000, log, OS_LOG_TYPE_ERROR, "Cannot enroll device in beta program: mismatching platforms.", v1, 2u);
}

+ (void)deviceClassForProductType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D4F89000, a2, OS_LOG_TYPE_ERROR, "No deviceClass for product [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end
