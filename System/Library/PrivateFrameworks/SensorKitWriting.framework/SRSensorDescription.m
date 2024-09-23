@implementation SRSensorDescription

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogDataStream = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogDataStream");
}

+ (id)sensorDescriptionForSensor:(id)a3
{
  uint64_t v4;

  v4 = +[SRSensorsCache defaultCache]();
  return -[SRSensorsCache descriptionForSensor:](v4, a3);
}

- (SRSensorDescription)initWithDictionary:(id)a3
{
  SRSensorDescription *v4;
  NSString *v5;
  NSObject *v6;
  NSString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SRSensorDescription;
  v4 = -[SRSensorDescription init](&v17, sel_init);
  if (v4)
  {
    v5 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Name"));
    v4->_name = v5;
    if (!v5)
    {
      v6 = SRLogDataStream;
      if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = a3;
        _os_log_fault_impl(&dword_245CD7000, v6, OS_LOG_TYPE_FAULT, "Data stream defined without a name: %{public}@", buf, 0xCu);
      }
    }
    v7 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AuthService"));
    v4->_authorizationService = v7;
    if (!v7)
    {
      v8 = SRLogDataStream;
      if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = a3;
        _os_log_fault_impl(&dword_245CD7000, v8, OS_LOG_TYPE_FAULT, "Data stream defined without an authorization service: %{public}@", buf, 0xCu);
      }
    }
    v4->_writerBundleIdentifier = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WriterBundleId"));
    v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RelatedSettingsCategories"));
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (v9)
      v10 = (void *)v9;
    v4->_relatedSettingsCategories = (NSArray *)v10;
    v4->_publicEntitlementValue = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PublicEntitlementValue"));
    v4->_sampleClass = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SampleClass"));
    v4->_exportingSampleClass = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ExportingSampleClass"));
    v4->_legacySampleClass = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LegacySampleClass"));
    v4->_legacySampleClassLinkedBefore = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LegacySampleClassLinkedBefore")), "unsignedIntValue");
    v11 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SRInfoPlistAuthCategory"));
    v4->_infoPlistAuthorizationCategory = v11;
    if (!v11)
    {
      v12 = SRLogDataStream;
      if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = a3;
        _os_log_fault_impl(&dword_245CD7000, v12, OS_LOG_TYPE_FAULT, "Data stream defined without an Info.plist authorization category: %{public}@", buf, 0xCu);
      }
    }
    v4->_authorizationVersion = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AuthorizationVersion")), "integerValue");
    v4->_onDemandWriterService = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OnDemandWriterService"));
    v4->_supportedPlatforms = (NSDictionary *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SupportedPlatforms"));
    v4->_writerAuthorizationService = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("WriterAuthorizationService"));
    v4->_authorizationStoreCohort = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AuthorizationStoreCohort"));
    v4->_legacyName = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("LegacyName"));
    v4->_filters = (NSArray *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Filters"));
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RoundingIntervalSecs")), "doubleValue");
    v4->_roundingInterval = v13;
    v14 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("EligibleDaemons"));
    if (v14)
      v4->_eligibleDaemons = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v14);
    v15 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Additions"));
    if (v15)
      v4->_additions = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v15);
    v4->_additionalSampleDataNoteKey = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdditionalDataNote"));
    v4->_datastoreBackend = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StorageBackend")), "integerValue");
  }
  return v4;
}

+ (id)sensorDescriptionForDeletionRecordFromDescription:(id)a3
{
  id v4;
  void *v5;
  SRSensorDescription *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  v8[0] = CFSTR("Name");
  v9[0] = objc_msgSend((id)objc_msgSend(a3, "name"), "sr_sensorForDeletionRecordsFromSensor");
  v8[1] = CFSTR("AuthService");
  v9[1] = objc_msgSend(a3, "authorizationService");
  v9[2] = CFSTR("SRDeletionRecord");
  v8[2] = CFSTR("SampleClass");
  v8[3] = CFSTR("StorageBackend");
  v9[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a3, "datastoreBackend"));
  v8[4] = CFSTR("SRInfoPlistAuthCategory");
  v9[4] = objc_msgSend(a3, "infoPlistAuthorizationCategory");
  v5 = (void *)objc_msgSend(v4, "initWithDictionary:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5));
  if (objc_msgSend(a3, "legacyName"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "legacyName"), "sr_sensorForDeletionRecordsFromSensor"), CFSTR("LegacyName"));
  v6 = -[SRSensorDescription initWithDictionary:]([SRSensorDescription alloc], "initWithDictionary:", v5);

  return v6;
}

- (NSString)localizedAdditionalSampleDataNote
{
  NSString *result;
  void *v4;

  result = self->_localizedAdditionalSampleDataNote;
  if (!result)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", NSClassFromString(CFSTR("SRSensorReader")));
    if (v4)
    {
      result = (NSString *)(id)objc_msgSend(v4, "localizedStringForKey:value:table:", self->_additionalSampleDataNoteKey, &stru_2516F29D8, 0);
      self->_localizedAdditionalSampleDataNote = result;
    }
    else
    {
      return self->_localizedAdditionalSampleDataNote;
    }
  }
  return result;
}

- (NSString)sampleClass
{
  int v3;
  uint64_t v4;
  NSObject *v6;
  uint8_t v7[16];

  if (!self->_legacySampleClassLinkedBefore)
    return self->_sampleClass;
  if (self->_legacySampleClass)
  {
    v3 = dyld_program_sdk_at_least();
    v4 = 168;
    if (v3)
      v4 = 72;
    return *(NSString **)((char *)&self->super.isa + v4);
  }
  else
  {
    v6 = SRLogDataStream;
    if (os_log_type_enabled((os_log_t)SRLogDataStream, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_245CD7000, v6, OS_LOG_TYPE_FAULT, "Found a linked before version but no legacy sample class", v7, 2u);
    }
    return 0;
  }
}

- (NSString)exportingSampleClass
{
  return self->_exportingSampleClass;
}

- (BOOL)metadataEnabled
{
  return -[NSSet containsObject:](self->_additions, "containsObject:", CFSTR("Metadata"));
}

- (BOOL)sensorConfigurationEnabled
{
  return -[NSSet containsObject:](self->_additions, "containsObject:", CFSTR("SensorConfiguration"));
}

- (BOOL)supportsPlatform:(id)a3
{
  NSDictionary *supportedPlatforms;

  if (!a3)
    return 0;
  supportedPlatforms = self->_supportedPlatforms;
  if (supportedPlatforms)
    return objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](supportedPlatforms, "objectForKeyedSubscript:"), "objectForKeyedSubscript:", CFSTR("Enabled")), "BOOLValue");
  else
    return 1;
}

- (BOOL)supportsCurrentPlatform
{
  return -[SRSensorDescription supportsPlatform:](self, "supportsPlatform:", CFSTR("Phone"));
}

- (NSSet)eligibleDaemons
{
  NSSet *result;

  result = self->_eligibleDaemons;
  if (!result)
    return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_publicEntitlementValue = 0;
  self->_sampleClass = 0;

  self->_exportingSampleClass = 0;
  self->_localizedAdditionalSampleDataNote = 0;

  self->_onDemandWriterService = 0;
  self->_additionalSampleDataNoteKey = 0;

  v3.receiver = self;
  v3.super_class = (Class)SRSensorDescription;
  -[SRSensorDescription dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_class *v3;
  void *v5;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ (%p): name: %@, authService: %@, writer: %@, relatedSettings: %@, publicEntitlement: %@, sampleClass: %@, exportingSampleClass: %@, additions: %@, onDemandWriterId: %@, writerAuthService: %@, supportedPlatforms: %@, auth store cohort: %@, legacyName: %@, filters: %@, legacySampleClass: %@, legacySampleClassLinkedBefore: %u, roundingInterval: %f, eligibleDaemons: %@, storageBackend: %ld"), NSStringFromClass(v3), self, self->_name, self->_authorizationService, self->_writerBundleIdentifier, self->_relatedSettingsCategories, self->_publicEntitlementValue, self->_sampleClass, self->_exportingSampleClass, self->_additions, self->_onDemandWriterService, self->_writerAuthorizationService, self->_supportedPlatforms, self->_authorizationStoreCohort, self->_legacyName, self->_filters,
               self->_legacySampleClass,
               self->_legacySampleClassLinkedBefore,
               *(_QWORD *)&self->_roundingInterval,
               -[SRSensorDescription eligibleDaemons](self, "eligibleDaemons"),
               self->_datastoreBackend);
}

+ (id)sensorDescriptionsForAuthorizationService:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (_QWORD *)+[SRSensorsCache defaultCache]();
  v6 = -[SRSensorsCache allSensorDescriptions](v5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "authorizationService", (_QWORD)v13), "isEqualToString:", a3))objc_msgSend(v4, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4, (_QWORD)v13);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)authorizationService
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)writerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)relatedSettingsCategories
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)publicEntitlementValue
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)infoPlistAuthorizationCategory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)writerAuthorizationService
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)authorizationVersion
{
  return self->_authorizationVersion;
}

- (NSString)onDemandWriterService
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)authorizationStoreCohort
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)legacyName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)filters
{
  return self->_filters;
}

- (double)roundingInterval
{
  return self->_roundingInterval;
}

- (int64_t)datastoreBackend
{
  return self->_datastoreBackend;
}

@end
