@implementation RERelevanceEngineConfiguration

- (OS_dispatch_queue)observerQueue
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_observerQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, 0, MEMORY[0x24BDAC9B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v4;
}

- (REFeatureSet)primaryFeatures
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  NSStringFromSelector(sel_primaryFeatures);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[REFeatureSet featureSet](REFeatureSet, "featureSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (REFeatureSet *)v6;
}

- (NSString)preferenceDomain
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_preferenceDomain);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (RELocationManager)locationManager
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  NSStringFromSelector(sel_locationManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[RELocationManager simulatedLocationManager](RELocationManager, "simulatedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (RELocationManager *)v6;
}

- (OS_dispatch_queue)engineQueue
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_engineQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v4;
}

- (BOOL)allowsDiagnosticExtension
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_allowsDiagnosticExtension);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RERelevanceEngineConfiguration initWithDictionary:]([REMutableRelevanceEngineConfiguration alloc], "initWithDictionary:", self->_values);
}

+ (id)defaultConfiguration
{
  REInteractionDescriptor *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RERelevanceEngineConfiguration *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(REInteractionDescriptor);
  -[REInteractionDescriptor setName:](v2, "setName:", CFSTR("tap"));
  NSStringFromSelector(sel_sectionDescriptors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v4 = (void *)MEMORY[0x24BDBCEB8];
  +[RESectionDescriptor defaultSectionDescriptorForIdentifier:](RESectionDescriptor, "defaultSectionDescriptorForIdentifier:", CFSTR("defaultSectionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  NSStringFromSelector(sel_interactionDescriptors);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[RERelevanceEngineConfiguration initWithDictionary:]([RERelevanceEngineConfiguration alloc], "initWithDictionary:", v9);
  return v10;
}

- (NSURL)baseModelFileURL
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_baseModelFileURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

void __53__RERelevanceEngineConfiguration_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (objc_class *)MEMORY[0x24BDBCEB8];
LABEL_5:
    v7 = (id)objc_msgSend([v6 alloc], "initWithArray:copyItems:", v10, 1);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (objc_class *)MEMORY[0x24BDBCE30];
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x24BDBCED8];
LABEL_10:
    v7 = (id)objc_msgSend([v8 alloc], "initWithDictionary:copyItems:", v10, 1);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x24BDBCE70];
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "conformsToProtocol:", &unk_254B9C740))
    v7 = (id)objc_msgSend(v10, "copy");
  else
    v7 = v10;
LABEL_11:
  v9 = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v9, v5);
}

- (NSArray)interactionDescriptors
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  NSStringFromSelector(sel_interactionDescriptors);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v4, objc_opt_class(), MEMORY[0x24BDBD1A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:copyItems:", v5, 1);

  return (NSArray *)v6;
}

- (NSArray)sectionDescriptors
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  NSStringFromSelector(sel_sectionDescriptors);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v4, objc_opt_class(), MEMORY[0x24BDBD1A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:copyItems:", v5, 1);

  return (NSArray *)v6;
}

- (id)valueForKey:(id)a3 ofClass:(Class)a4 defaultValue:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
  }
  if (v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = v10;

  return v11;
}

- (RERelevanceProviderManagerLoader)relevanceProviderManagerLoader
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  NSStringFromSelector(sel_relevanceProviderManagerLoader);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[RERelevanceProviderManagerLoader disabledRelevanceProviderManagerLoader](RERelevanceProviderManagerLoader, "disabledRelevanceProviderManagerLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (RERelevanceProviderManagerLoader *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedDataSourceClassNames, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (BOOL)allowsRemoteTraining
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_allowsRemoteTraining);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)ignoresInstalledApplications
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_ignoresInstalledApplications);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)ignoreDeviceLockState
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_ignoreDeviceLockState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (unint64_t)modelVersion
{
  void *v3;
  void *v4;
  unint64_t v5;

  NSStringFromSelector(sel_modelVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), &unk_24CFC11E0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (unint64_t)trainingBehavior
{
  void *v3;
  void *v4;
  unint64_t v5;

  NSStringFromSelector(sel_trainingBehavior);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), &unk_24CFC11F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (NSURL)modelFileURL
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_modelFileURL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (RERelevanceEngineMetricsRecorder)metricsRecorder
{
  void *v3;
  void *v4;

  NSStringFromSelector(sel_metricsRecorder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (RERelevanceEngineMetricsRecorder *)v4;
}

- (unint64_t)modelStorageBehavior
{
  void *v3;
  void *v4;
  unint64_t v5;

  NSStringFromSelector(sel_modelStorageBehavior);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), &unk_24CFC1210);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (RERelevanceEngineConfiguration)initWithDictionary:(id)a3
{
  id v4;
  RERelevanceEngineConfiguration *v5;
  uint64_t v6;
  NSMutableDictionary *values;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  _QWORD v18[4];
  RERelevanceEngineConfiguration *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RERelevanceEngineConfiguration;
  v5 = -[RERelevanceEngineConfiguration init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5->_values;
    NSStringFromSelector(sel_sectionDescriptors);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, v10);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5->_values;
    NSStringFromSelector(sel_interactionDescriptors);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

    objc_msgSend((id)objc_opt_class(), "_defaultModelFileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5->_values;
    NSStringFromSelector(sel_baseModelFileURL);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __53__RERelevanceEngineConfiguration_initWithDictionary___block_invoke;
    v18[3] = &unk_24CF8A8B8;
    v19 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  return v5;
}

+ (id)_defaultModelFileURL
{
  void *v2;
  void *v3;
  void *v4;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/RelevanceEngine/Model/model.mdl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)disableAutomaticContentManagement
{
  void *v4;
  void *v5;
  char v6;

  if (disableAutomaticContentManagement_onceToken != -1)
    dispatch_once(&disableAutomaticContentManagement_onceToken, &__block_literal_global_217);
  if (disableAutomaticContentManagement_isHealthProcess)
    return 1;
  NSStringFromSelector(sel_disableAutomaticContentManagement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v4, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)wantsImmutableContent
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_wantsImmutableContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (REDataSourceLoader)dataSourceLoader
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  NSStringFromSelector(sel_dataSourceLoader);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[REDataSourceLoader defaultDataSourceLoader](REDataSourceLoader, "defaultDataSourceLoader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (REDataSourceLoader *)v6;
}

- (void)setValue:(id)a3 forKey:(id)a4 ofClass:(Class)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v13;

  v12 = a3;
  v8 = a4;
  if (a5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v12 = 0;
  }
  if (setValue_forKey_ofClass__onceToken != -1)
    dispatch_once(&setValue_forKey_ofClass__onceToken, &__block_literal_global_164);
  objc_msgSend((id)setValue_forKey_ofClass__EmptyConfig, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v12);

  if (v10)
  {

    v11 = 0;
  }
  else
  {
    v11 = v12;
  }
  v13 = v11;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:");

}

- (RERelevanceEngineConfiguration)init
{
  return -[RERelevanceEngineConfiguration initWithDictionary:](self, "initWithDictionary:", 0);
}

void __58__RERelevanceEngineConfiguration_setValue_forKey_ofClass___block_invoke()
{
  RERelevanceEngineConfiguration *v0;
  void *v1;

  v0 = -[RERelevanceEngineConfiguration initWithDictionary:]([RERelevanceEngineConfiguration alloc], "initWithDictionary:", 0);
  v1 = (void *)setValue_forKey_ofClass__EmptyConfig;
  setValue_forKey_ofClass__EmptyConfig = (uint64_t)v0;

}

- (BOOL)isEqual:(id)a3
{
  RERelevanceEngineConfiguration *v4;
  NSMutableDictionary *values;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  char v9;

  v4 = (RERelevanceEngineConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      values = self->_values;
      v6 = v4->_values;
      v7 = values;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSMutableDictionary isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_values, "hash");
}

- (id)description
{
  return -[RERelevanceEngineConfiguration descriptionWithIndent:](self, "descriptionWithIndent:", 0);
}

- (BOOL)allowsUpdatingModelFile
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_allowsUpdatingModelFile);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)wantsBackup
{
  void *v3;
  void *v4;
  char v5;

  NSStringFromSelector(sel_wantsBackup);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration valueForKey:ofClass:defaultValue:](self, "valueForKey:ofClass:defaultValue:", v3, objc_opt_class(), MEMORY[0x24BDBD1C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

void __67__RERelevanceEngineConfiguration_disableAutomaticContentManagement__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  disableAutomaticContentManagement_isHealthProcess = objc_msgSend(v0, "isEqual:", CFSTR("com.apple.healthappd"));

}

- (NSArray)whitelistedDataSourceClassNames
{
  return self->_whitelistedDataSourceClassNames;
}

+ (id)defaultUpNextConfiguration
{
  if (defaultUpNextConfiguration_onceToken != -1)
    dispatch_once(&defaultUpNextConfiguration_onceToken, &__block_literal_global_19);
  return (id)defaultUpNextConfiguration_defaultConfiguration;
}

void __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REInteractionDescriptor *v9;
  double v10;
  REInteractionDescriptor *v11;
  double v12;
  void *v13;
  REInteractionDescriptor *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  REFeatureSet *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t i;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t j;
  void *v206;
  uint64_t v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  REFeatureSet *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  REInteractionDescriptor *v234;
  REInteractionDescriptor *v235;
  REInteractionDescriptor *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  _BYTE v313[128];
  _BYTE v314[128];
  _QWORD v315[90];
  void *v316;
  void *v317;
  void *v318;
  _QWORD v319[2];
  void *v320;
  _QWORD v321[2];
  void *v322;
  void *v323;
  _QWORD v324[2];
  _QWORD v325[3];
  _QWORD v326[2];
  _QWORD v327[2];
  _QWORD v328[2];
  _QWORD v329[2];
  _QWORD v330[2];
  _QWORD v331[2];
  _QWORD v332[2];
  void *v333;
  _QWORD v334[2];
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  _QWORD v339[2];
  _QWORD v340[2];
  _QWORD v341[2];
  _QWORD v342[2];
  _QWORD v343[2];
  _QWORD v344[2];
  _QWORD v345[2];
  _QWORD v346[2];
  _QWORD v347[2];
  _QWORD v348[2];
  _QWORD v349[2];
  _QWORD v350[2];
  _QWORD v351[2];
  _QWORD v352[2];
  _QWORD v353[2];
  _QWORD v354[2];
  _QWORD v355[2];
  _QWORD v356[2];
  _QWORD v357[2];
  _QWORD v358[2];
  _QWORD v359[2];
  _QWORD v360[2];
  _QWORD v361[2];
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  uint64_t v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  _QWORD v375[2];
  void *v376;
  void *v377;
  _QWORD v378[3];

  v378[1] = *MEMORY[0x24BDAC8D0];
  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/RelevanceEngine/Model"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, 0);

  v237 = v1;
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("model.mdl"));
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:](RESectionDescriptor, "defaultUpNextSectionDescriptorForIdentifier:", CFSTR("allDaySectionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:](RESectionDescriptor, "defaultUpNextSectionDescriptorForIdentifier:", CFSTR("defaultSectionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:](RESectionDescriptor, "defaultUpNextSectionDescriptorForIdentifier:", CFSTR("tomorrowSectionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  +[RESectionDescriptor defaultUpNextSectionDescriptorForIdentifier:](RESectionDescriptor, "defaultUpNextSectionDescriptorForIdentifier:", CFSTR("upcomingSectionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = v3;
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(REInteractionDescriptor);
  -[REInteractionDescriptor setName:](v9, "setName:", CFSTR("tap"));
  LODWORD(v10) = 4.0;
  -[REInteractionDescriptor setWeight:](v9, "setWeight:", v10);
  v236 = v9;
  objc_msgSend(v8, "addObject:", v9);
  v11 = objc_alloc_init(REInteractionDescriptor);
  -[REInteractionDescriptor setName:](v11, "setName:", CFSTR("app-action"));
  LODWORD(v12) = 1.5;
  -[REInteractionDescriptor setWeight:](v11, "setWeight:", v12);
  -[REInteractionDescriptor setEnableExploreExploit:](v11, "setEnableExploreExploit:", 0);
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REInteractionDescriptor setIdentificationFeature:](v11, "setIdentificationFeature:", v13);

  v235 = v11;
  objc_msgSend(v8, "addObject:", v11);
  v14 = objc_alloc_init(REInteractionDescriptor);
  -[REInteractionDescriptor setName:](v14, "setName:", CFSTR("action"));
  LODWORD(v15) = 1.0;
  -[REInteractionDescriptor setWeight:](v14, "setWeight:", v15);
  -[REInteractionDescriptor setEnableExploreExploit:](v14, "setEnableExploreExploit:", 0);
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REInteractionDescriptor setIdentificationFeature:](v14, "setIdentificationFeature:", v16);

  v232 = v8;
  v234 = v14;
  objc_msgSend(v8, "addObject:", v14);
  +[REFeatureTransformer hashTransform](REFeatureTransformer, "hashTransform");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dataSourceFeature](REFeature, "dataSourceFeature");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v378[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v378, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v377 = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v377, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v21, v22);
  v304 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature itemIdentifierFeature](REFeature, "itemIdentifierFeature");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v376 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v376, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v375[0] = v304;
  v375[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v375, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v27);
  v303 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 10, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 25, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  +[REFeature dateFeature](REFeature, "dateFeature");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v374 = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v374, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = (void *)v33;
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v33, v35);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature locationFeature](REFeature, "locationFeature");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v373 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v373, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v30, v37);
  v300 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature geofenceFeature](REFeature, "geofenceFeature");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v372 = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v372, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v30, v39);
  v299 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature priorityFeature](REFeature, "priorityFeature");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v371 = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v371, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v302 = (void *)v30;
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v30, v41);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer hashTransform](REFeatureTransformer, "hashTransform");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature locationOfInterestFeature](REFeature, "locationOfInterestFeature");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v370 = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v370, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v42, v44);
  v45 = objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = (void *)v45;
  v369 = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v369, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v46, v47);
  v297 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature knownLocationOfInterestFeature](REFeature, "knownLocationOfInterestFeature");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v368 = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v368, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v48, v50);
  v296 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature appUsageFeature](REFeature, "appUsageFeature");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v367 = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v367, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v30, v52);
  v295 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 24, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature currentTimeFeature](REFeature, "currentTimeFeature");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v366 = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v366, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v55, v57);
  v294 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 8, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature currentTimeFeature](REFeature, "currentTimeFeature");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v365 = v61;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v365, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v60, v62);
  v293 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 2, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature currentTimeFeature](REFeature, "currentTimeFeature");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v364 = v66;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v364, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v65, v67);
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dayOfWeekFeature](REFeature, "dayOfWeekFeature");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v363 = v69;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v363, 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v68, v70);
  v291 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature isWeekendFeature](REFeature, "isWeekendFeature");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v362 = v72;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v362, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v71, v73);
  v290 = (void *)objc_claimAutoreleasedReturnValue();

  v361[0] = v304;
  v361[1] = v301;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v361, 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v74);
  v289 = (void *)objc_claimAutoreleasedReturnValue();

  v360[0] = v304;
  v360[1] = v300;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v360, 2);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v75);
  v288 = (void *)objc_claimAutoreleasedReturnValue();

  v359[0] = v304;
  v359[1] = v299;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v359, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v76);
  v287 = (void *)objc_claimAutoreleasedReturnValue();

  v358[0] = v304;
  v358[1] = v298;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v358, 2);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v77);
  v286 = (void *)objc_claimAutoreleasedReturnValue();

  v357[0] = v303;
  v357[1] = v301;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v357, 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v78);
  v285 = (void *)objc_claimAutoreleasedReturnValue();

  v356[0] = v303;
  v356[1] = v300;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v356, 2);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v79);
  v284 = (void *)objc_claimAutoreleasedReturnValue();

  v355[0] = v303;
  v355[1] = v299;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v355, 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v80);
  v283 = (void *)objc_claimAutoreleasedReturnValue();

  v354[0] = v303;
  v354[1] = v298;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v354, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v81);
  v282 = (void *)objc_claimAutoreleasedReturnValue();

  v353[0] = v304;
  v353[1] = v295;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v353, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v82);
  v281 = (void *)objc_claimAutoreleasedReturnValue();

  v352[0] = v304;
  v352[1] = v294;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v352, 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v83);
  v280 = (void *)objc_claimAutoreleasedReturnValue();

  v351[0] = v304;
  v351[1] = v293;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v351, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v84);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  v350[0] = v304;
  v350[1] = v292;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v350, 2);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v85);
  v278 = (void *)objc_claimAutoreleasedReturnValue();

  v349[0] = v304;
  v349[1] = v291;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v349, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v86);
  v277 = (void *)objc_claimAutoreleasedReturnValue();

  v348[0] = v304;
  v348[1] = v290;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v348, 2);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v87);
  v276 = (void *)objc_claimAutoreleasedReturnValue();

  v347[0] = v303;
  v347[1] = v294;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v347, 2);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v88);
  v275 = (void *)objc_claimAutoreleasedReturnValue();

  v346[0] = v303;
  v346[1] = v293;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v346, 2);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v89);
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  v345[0] = v303;
  v345[1] = v292;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v345, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v90);
  v273 = (void *)objc_claimAutoreleasedReturnValue();

  v344[0] = v303;
  v344[1] = v291;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v344, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v91);
  v272 = (void *)objc_claimAutoreleasedReturnValue();

  v343[0] = v303;
  v343[1] = v290;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v343, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v92);
  v271 = (void *)objc_claimAutoreleasedReturnValue();

  v342[0] = v304;
  v342[1] = v297;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v342, 2);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v93);
  v270 = (void *)objc_claimAutoreleasedReturnValue();

  v341[0] = v304;
  v341[1] = v296;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v341, 2);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v94);
  v269 = (void *)objc_claimAutoreleasedReturnValue();

  v340[0] = v303;
  v340[1] = v297;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v340, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v95);
  v268 = (void *)objc_claimAutoreleasedReturnValue();

  v339[0] = v303;
  v339[1] = v296;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v339, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v96);
  v267 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature recentSiriActionFeature](REFeature, "recentSiriActionFeature");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v338 = v97;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v338, 1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v302, v98);
  v266 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.5);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer binaryTransformerWithThreshold:](REFeatureTransformer, "binaryTransformerWithThreshold:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature siriActionDailyAveragePerformedCountFeature](REFeature, "siriActionDailyAveragePerformedCountFeature");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v337 = v101;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v337, 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v100, v102);
  v265 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer customCategoricalTransformerWithName:block:](REFeatureTransformer, "customCategoricalTransformerWithName:block:", CFSTR("multipleBy7"), &__block_literal_global_34_0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature siriActionDailyAveragePerformedCountFeature](REFeature, "siriActionDailyAveragePerformedCountFeature");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v336 = v104;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v336, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v103, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 5);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v335 = v106;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v335, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v107, v108);
  v264 = (void *)objc_claimAutoreleasedReturnValue();

  v334[0] = v264;
  v334[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v334, 2);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v109);
  v263 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer bucketTransformerWithBitWidth:](REFeatureTransformer, "bucketTransformerWithBitWidth:", 3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature siriActionPerformedCountFeature](REFeature, "siriActionPerformedCountFeature");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v333 = v111;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v333, 1);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v110, v112);
  v262 = (void *)objc_claimAutoreleasedReturnValue();

  v332[0] = v262;
  v332[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v332, 2);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v113);
  v261 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer customCategoricalTransformerWithName:featureCount:transformation:](REFeatureTransformer, "customCategoricalTransformerWithName:featureCount:transformation:", CFSTR("moreThanDailyAverage"), 2, &__block_literal_global_38_2);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature siriActionPerformedCountFeature](REFeature, "siriActionPerformedCountFeature");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v331[0] = v115;
  +[REFeature siriActionDailyAveragePerformedCountFeature](REFeature, "siriActionDailyAveragePerformedCountFeature");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v331[1] = v116;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v331, 2);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v114, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 1);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "featureByUsingTransformer:", v119);
  v260 = (void *)objc_claimAutoreleasedReturnValue();

  v330[0] = v260;
  v330[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v330, 2);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v120);
  v259 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature currentlyPlayingFromAppFeature](REFeature, "currentlyPlayingFromAppFeature");
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  v329[0] = v258;
  v329[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v329, 2);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v121);
  v257 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature activeWorkoutFeature](REFeature, "activeWorkoutFeature");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  v328[0] = v256;
  v328[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v328, 2);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v122);
  v255 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 3.0);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 18, v123, v124);
  v125 = objc_claimAutoreleasedReturnValue();

  +[REFeature activeEnergyCompletionFeature](REFeature, "activeEnergyCompletionFeature");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "featureByUsingTransformer:", v125);
  v254 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature exerciseTimeCompletionFeature](REFeature, "exerciseTimeCompletionFeature");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "featureByUsingTransformer:", v125);
  v253 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature standHourCompletionFeature](REFeature, "standHourCompletionFeature");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v228 = (void *)v125;
  objc_msgSend(v128, "featureByUsingTransformer:", v125);
  v252 = (void *)objc_claimAutoreleasedReturnValue();

  v327[0] = v254;
  v327[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v327, 2);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v129);
  v251 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer customCategoricalTransformerWithName:featureCount:transformation:](REFeatureTransformer, "customCategoricalTransformerWithName:featureCount:transformation:", CFSTR("ringClosed"), 1, &__block_literal_global_41_0);
  v130 = objc_claimAutoreleasedReturnValue();
  +[REFeature activeEnergyCompletionFeature](REFeature, "activeEnergyCompletionFeature");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "featureByUsingTransformer:", v130);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "featureByUsingTransformer:", v133);
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature exerciseTimeCompletionFeature](REFeature, "exerciseTimeCompletionFeature");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "featureByUsingTransformer:", v130);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 1);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "featureByUsingTransformer:", v136);
  v249 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature standHourCompletionFeature](REFeature, "standHourCompletionFeature");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = (void *)v130;
  objc_msgSend(v137, "featureByUsingTransformer:", v130);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 1);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "featureByUsingTransformer:", v139);
  v248 = (void *)objc_claimAutoreleasedReturnValue();

  v326[0] = v250;
  v326[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v326, 2);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v140);
  v247 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer customCategoricalTransformerWithName:featureCount:transformation:](REFeatureTransformer, "customCategoricalTransformerWithName:featureCount:transformation:", CFSTR("allRingsClosed"), 3, &__block_literal_global_44_2);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature activeEnergyCompletionFeature](REFeature, "activeEnergyCompletionFeature");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v325[0] = v142;
  +[REFeature exerciseTimeCompletionFeature](REFeature, "exerciseTimeCompletionFeature");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v325[1] = v143;
  +[REFeature standHourCompletionFeature](REFeature, "standHourCompletionFeature");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v325[2] = v144;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v325, 3);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v141, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 1);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "featureByUsingTransformer:", v147);
  v246 = (void *)objc_claimAutoreleasedReturnValue();

  v324[0] = v246;
  v324[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v324, 2);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v148);
  v245 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer customCategoricalTransformerWithName:block:](REFeatureTransformer, "customCategoricalTransformerWithName:block:", CFSTR("multipleBy7"), &__block_literal_global_45_1);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature dailyAverageWorkoutCountFeature](REFeature, "dailyAverageWorkoutCountFeature");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v323 = v150;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v323, 1);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v149, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer maskTransformWithWidth:](REFeatureTransformer, "maskTransformWithWidth:", 3);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = v152;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v322, 1);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v153, v154);
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  v321[0] = v244;
  v321[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v321, 2);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v155);
  v243 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureTransformer bucketTransformerWithBitWidth:](REFeatureTransformer, "bucketTransformerWithBitWidth:", 3);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature performedWorkoutCountFeature](REFeature, "performedWorkoutCountFeature");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v320 = v157;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v320, 1);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v156, v158);
  v242 = (void *)objc_claimAutoreleasedReturnValue();

  v319[0] = v242;
  v319[1] = v304;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v319, 2);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature crossedFeatureWithFeatures:](REFeature, "crossedFeatureWithFeatures:", v159);
  v241 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 0.0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", 1.0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureTransformer bucketTransformerWithCount:minValue:maxValue:](REFeatureTransformer, "bucketTransformerWithCount:minValue:maxValue:", 15, v160, v161);
  v162 = objc_claimAutoreleasedReturnValue();

  +[REFeature sentimentAnalysisFeature](REFeature, "sentimentAnalysisFeature");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v318 = v163;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v318, 1);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v162, v164);
  v165 = objc_claimAutoreleasedReturnValue();

  +[REFeature negativeSentimentAnalysisFeature](REFeature, "negativeSentimentAnalysisFeature");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v317 = v166;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v317, 1);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v162, v167);
  v168 = objc_claimAutoreleasedReturnValue();

  +[REFeature sentimentAnalysisCertaintyFeature](REFeature, "sentimentAnalysisCertaintyFeature");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v316 = v169;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v316, 1);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  v226 = (void *)v162;
  +[REFeature transformedFeatureWithTransformer:features:](REFeature, "transformedFeatureWithTransformer:features:", v162, v170);
  v171 = objc_claimAutoreleasedReturnValue();

  +[REFeature coreBehaviorTimePredictionFeature](REFeature, "coreBehaviorTimePredictionFeature");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v172, "featureByUsingTransformer:", v302);
  v240 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature coreBehaviorTimeCoarsePredictionFeature](REFeature, "coreBehaviorTimeCoarsePredictionFeature");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "featureByUsingTransformer:", v302);
  v239 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature coreBehaviorDayPredictionFeature](REFeature, "coreBehaviorDayPredictionFeature");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "featureByUsingTransformer:", v302);
  v238 = (void *)objc_claimAutoreleasedReturnValue();

  +[REFeature coreBehaviorDayCoarsePredictionFeature](REFeature, "coreBehaviorDayCoarsePredictionFeature");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "featureByUsingTransformer:", v302);
  v176 = objc_claimAutoreleasedReturnValue();

  +[REFeature coreBehaviorLocationPredictionFeature](REFeature, "coreBehaviorLocationPredictionFeature");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v177, "featureByUsingTransformer:", v302);
  v178 = objc_claimAutoreleasedReturnValue();

  +[REFeature coreBehaviorLocationCoarsePredictionFeature](REFeature, "coreBehaviorLocationCoarsePredictionFeature");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v179, "featureByUsingTransformer:", v302);
  v180 = objc_claimAutoreleasedReturnValue();

  v216 = [REFeatureSet alloc];
  v315[0] = v304;
  v315[1] = v303;
  v315[2] = v301;
  v315[3] = v300;
  v315[4] = v299;
  v315[5] = v298;
  v315[6] = v297;
  v315[7] = v296;
  v315[8] = v289;
  v315[9] = v288;
  v315[10] = v287;
  v315[11] = v286;
  v315[12] = v285;
  v315[13] = v284;
  v315[14] = v283;
  v315[15] = v282;
  +[REFeature interactionFeature](REFeature, "interactionFeature");
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v315[16] = v219;
  +[REFeature noContentFeature](REFeature, "noContentFeature");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v315[17] = v218;
  +[REFeature conditionalFeature](REFeature, "conditionalFeature");
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v315[18] = v217;
  v315[19] = v294;
  v315[20] = v293;
  v315[21] = v292;
  v315[22] = v291;
  v315[23] = v290;
  v315[24] = v280;
  v315[25] = v279;
  v315[26] = v278;
  v315[27] = v277;
  v315[28] = v276;
  v315[29] = v275;
  v315[30] = v274;
  v315[31] = v273;
  v315[32] = v272;
  v315[33] = v271;
  v315[34] = v270;
  v315[35] = v269;
  v315[36] = v268;
  v315[37] = v267;
  v315[38] = v295;
  v315[39] = v281;
  +[REFeature siriDomainFeature](REFeature, "siriDomainFeature");
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v315[40] = v215;
  +[REFeature dailyRoutineFeature](REFeature, "dailyRoutineFeature");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v315[41] = v214;
  +[REFeature isInDailyRoutineFeature](REFeature, "isInDailyRoutineFeature");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v315[42] = v213;
  +[REFeature sessionFeature](REFeature, "sessionFeature");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  v315[43] = v212;
  v315[44] = v266;
  v315[45] = v265;
  v315[46] = v264;
  v315[47] = v262;
  v315[48] = v260;
  v315[49] = v263;
  v315[50] = v261;
  v315[51] = v259;
  v224 = (void *)v168;
  v225 = (void *)v165;
  v315[52] = v165;
  v315[53] = v168;
  v223 = (void *)v171;
  v315[54] = v171;
  +[REFeature isSiriActionFeature](REFeature, "isSiriActionFeature");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v315[55] = v211;
  +[REFeature isDeveloperDonationFeature](REFeature, "isDeveloperDonationFeature");
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  v315[56] = v210;
  +[REFeature nowPlayingStateFeature](REFeature, "nowPlayingStateFeature");
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  v315[57] = v209;
  v315[58] = v258;
  v315[59] = v257;
  v315[60] = v256;
  v315[61] = v255;
  +[REFeature workoutStateFeature](REFeature, "workoutStateFeature");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v315[62] = v181;
  v315[63] = v244;
  v315[64] = v243;
  v315[65] = v242;
  v315[66] = v241;
  +[REFeature deviceMotionFeature](REFeature, "deviceMotionFeature");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v315[67] = v182;
  +[REFeature motionFeature](REFeature, "motionFeature");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v315[68] = v183;
  +[REFeature isConnectedToCarFeature](REFeature, "isConnectedToCarFeature");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v315[69] = v184;
  +[REFeature isConnectedToBluetoothSpeakerFeature](REFeature, "isConnectedToBluetoothSpeakerFeature");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v315[70] = v185;
  v315[71] = v254;
  v315[72] = v253;
  v315[73] = v252;
  v315[74] = v251;
  v315[75] = v250;
  v315[76] = v249;
  v315[77] = v248;
  v315[78] = v247;
  v315[79] = v246;
  v315[80] = v245;
  v315[81] = v240;
  v315[82] = v239;
  v315[83] = v238;
  v221 = (void *)v178;
  v222 = (void *)v176;
  v315[84] = v176;
  v315[85] = v178;
  v220 = (void *)v180;
  v315[86] = v180;
  +[REFeature coreBehaviorShortcutTypeFeature](REFeature, "coreBehaviorShortcutTypeFeature");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v315[87] = v186;
  +[REFeature coreBehaviorEventIdentifierHashFeature](REFeature, "coreBehaviorEventIdentifierHashFeature");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v315[88] = v187;
  +[REFeature coreBehaviorAppIdentifierHashFeature](REFeature, "coreBehaviorAppIdentifierHashFeature");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v315[89] = v188;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v315, 90);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = -[REFeatureSet initWithFeatures:](v216, "initWithFeatures:", v189);

  v191 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v229);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v191, "setModelFileURL:", v192);

  objc_msgSend(v191, "setPrimaryFeatures:", v190);
  objc_msgSend(v191, "setModelVersion:", 9);
  objc_msgSend(v191, "setAllowsDiagnosticExtension:", 1);
  objc_msgSend(v191, "setAllowsRemoteTraining:", 1);
  REBundle();
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v193, "pathForResource:ofType:", CFSTR("upnext_model"), CFSTR("mdl"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();

  if (v194)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "setBaseModelFileURL:", v195);

  }
  objc_msgSend(v191, "setWantsBackup:", 1);
  v311 = 0u;
  v312 = 0u;
  v309 = 0u;
  v310 = 0u;
  v196 = v231;
  v197 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v309, v314, 16);
  if (v197)
  {
    v198 = v197;
    v199 = *(_QWORD *)v310;
    do
    {
      for (i = 0; i != v198; ++i)
      {
        if (*(_QWORD *)v310 != v199)
          objc_enumerationMutation(v196);
        objc_msgSend(v191, "addSectionWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v309 + 1) + 8 * i));
      }
      v198 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v309, v314, 16);
    }
    while (v198);
  }

  v307 = 0u;
  v308 = 0u;
  v305 = 0u;
  v306 = 0u;
  v201 = v232;
  v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v305, v313, 16);
  if (v202)
  {
    v203 = v202;
    v204 = *(_QWORD *)v306;
    do
    {
      for (j = 0; j != v203; ++j)
      {
        if (*(_QWORD *)v306 != v204)
          objc_enumerationMutation(v201);
        objc_msgSend(v191, "addInteractionWithDescriptor:", *(_QWORD *)(*((_QWORD *)&v305 + 1) + 8 * j));
      }
      v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v305, v313, 16);
    }
    while (v203);
  }

  v206 = (void *)objc_opt_new();
  objc_msgSend(v191, "setMetricsRecorder:", v206);

  v207 = objc_msgSend(v191, "copy");
  v208 = (void *)defaultUpNextConfiguration_defaultConfiguration;
  defaultUpNextConfiguration_defaultConfiguration = v207;

}

unint64_t __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  return (unint64_t)(v2 * 7.0);
}

BOOL __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  _BOOL8 v8;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v5 > v7;

  return v8;
}

BOOL __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3 >= 1.0;

  return v4;
}

BOOL __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v4 = 0;
  if (v5 >= 1.0)
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    if (v7 >= 1.0)
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v4 = v9 >= 1.0;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

unint64_t __83__RERelevanceEngineConfiguration_REUpNextConfiguration__defaultUpNextConfiguration__block_invoke_6(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "doubleValue");
  return (unint64_t)(v2 * 7.0);
}

+ (id)sampleUpNextConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RERankingRule *v12;
  void *v13;
  void *v14;
  void *v15;
  RERankingRule *v16;
  REFilteringRule *v17;
  void *v18;
  REFilteringRule *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  REFeatureSet *v28;
  void *v29;
  void *v30;
  void *v31;
  REFeatureSet *v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  +[RERelevanceEngineConfiguration defaultUpNextConfiguration](RERelevanceEngineConfiguration, "defaultUpNextConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "sectionDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = 0x24BDBC000uLL;
  v35 = v5;
  if (v5)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "sectionDescriptors", v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      RESampleFeature();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[RECondition conditionHasValueForFeature:](RECondition, "conditionHasValueForFeature:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = [RERankingRule alloc];
      RESampleFeature();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      RESampleFeature();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[REComparisonCondition conditionForLeftFeature:relation:rightFeature:](REComparisonCondition, "conditionForLeftFeature:relation:rightFeature:", v13, -2, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[RERankingRule initWithLeftCondition:rightCondition:comparisonCondition:order:](v12, "initWithLeftCondition:rightCondition:comparisonCondition:order:", v11, v11, v15, 1);

      v17 = [REFilteringRule alloc];
      +[RECondition trueCondition](RECondition, "trueCondition");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[REFilteringRule initWithCondition:type:](v17, "initWithCondition:type:", v18, 1);

      v20 = (void *)MEMORY[0x24BDBCF20];
      v38[0] = v16;
      v38[1] = v19;
      objc_msgSend(*(id *)(v6 + 3632), "arrayWithObjects:count:", v38, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRules:", v22);

      objc_msgSend(v9, "historicSectionDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)MEMORY[0x24BDBCF20];
        v37[0] = v16;
        v37[1] = v19;
        objc_msgSend(*(id *)(v6 + 3632), "arrayWithObjects:count:", v37, 2);
        v25 = v6;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setWithArray:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRules:", v27);

        v6 = v25;
        objc_msgSend(v9, "setHistoricSectionDescriptor:", v23);
      }
      objc_msgSend(v3, "removeSectionAtIndex:", v7);
      objc_msgSend(v3, "insertSectionWithDescriptor:atIndex:", v9, v7);

      ++v7;
    }
    while (v35 != v7);
  }
  objc_msgSend(v3, "setAllowsRemoteTraining:", 0, v35);
  objc_msgSend(v3, "setWantsImmutableContent:", 1);
  objc_msgSend(v3, "setAllowsUpdatingModelFile:", 0);
  objc_msgSend(v3, "setIgnoreDeviceLockState:", 1);
  objc_msgSend(v3, "setTrainingBehavior:", 0);
  v28 = [REFeatureSet alloc];
  RESampleFeature();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v29;
  +[REFeature noContentFeature](REFeature, "noContentFeature");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  objc_msgSend(*(id *)(v6 + 3632), "arrayWithObjects:count:", v36, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[REFeatureSet initWithFeatures:](v28, "initWithFeatures:", v31);
  objc_msgSend(v3, "setPrimaryFeatures:", v32);

  v33 = (void *)objc_msgSend(v3, "copy");
  return v33;
}

@end
