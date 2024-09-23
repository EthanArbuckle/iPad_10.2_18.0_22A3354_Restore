@implementation TIMetricDescriptorRegistry

- (TIMetricDescriptorRegistry)initWithConfig:(id)a3
{
  id v5;
  TIMetricDescriptorRegistry *v6;
  TIMetricDescriptorRegistry *v7;
  uint64_t v8;
  NSMutableDictionary *metricDescriptors;
  uint64_t v10;
  NSMutableSet *invalidMetricNames;
  NSLock *v12;
  NSLock *lock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIMetricDescriptorRegistry;
  v6 = -[TIMetricDescriptorRegistry init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_opt_new();
    metricDescriptors = v7->_metricDescriptors;
    v7->_metricDescriptors = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    invalidMetricNames = v7->_invalidMetricNames;
    v7->_invalidMetricNames = (NSMutableSet *)v10;

    v7->_loaded = 0;
    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v12;

  }
  return v7;
}

- (TIMetricDescriptorRegistry)initWithDescriptors:(id)a3 andInvalidMetricNames:(id)a4
{
  id v6;
  id v7;
  TIMetricDescriptorRegistry *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *metricDescriptors;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSLock *v22;
  NSLock *lock;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[TIMetricDescriptorRegistry initWithConfig:](self, "initWithConfig:", MEMORY[0x1E0C9AA70]);
  if (v8)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          metricDescriptors = v8->_metricDescriptors;
          objc_msgSend(v14, "metricName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](metricDescriptors, "setObject:forKey:", v14, v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          -[NSMutableSet addObject:](v8->_invalidMetricNames, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    v8->_loaded = 1;
    v22 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v8->_lock;
    v8->_lock = v22;

  }
  return v8;
}

- (id)allMetricDescriptors
{
  void *v2;
  void *v3;

  -[TIMetricDescriptorRegistry metricDescriptors](self, "metricDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)metricDescriptorWithName:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[TIMetricDescriptorRegistry invalidMetricNames](self, "invalidMetricNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[TIMetricDescriptorRegistry metricDescriptors](self, "metricDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[TINumericValueDescriptor numericValueDescriptorWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:](TINumericValueDescriptor, "numericValueDescriptorWithMetricName:calculationExpression:calculationPrecondition:calculationDefaultValue:calculationDependencies:bucketThresholds:bucketValues:", v4, 0, 0, 0, 0, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (NSDictionary)metricDescriptors
{
  -[TIMetricDescriptorRegistry loadMetricDescriptorsIfNecessary](self, "loadMetricDescriptorsIfNecessary");
  return (NSDictionary *)self->_metricDescriptors;
}

- (NSSet)invalidMetricNames
{
  -[TIMetricDescriptorRegistry loadMetricDescriptorsIfNecessary](self, "loadMetricDescriptorsIfNecessary");
  return (NSSet *)self->_invalidMetricNames;
}

- (void)loadMetricDescriptorsIfNecessary
{
  -[NSLock lock](self->_lock, "lock");
  if (!self->_loaded)
  {
    -[TIMetricDescriptorRegistry _loadMetricDescriptors](self, "_loadMetricDescriptors");
    self->_loaded = 1;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_loadMetricDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *metricDescriptors;
  NSMutableSet *invalidMetricNames;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TIMetricDescriptorRegistry config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("MetricDescriptors"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IXADefaultLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading metric descriptor configuration."), "-[TIMetricDescriptorRegistry _loadMetricDescriptors]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIMetricDescriptorRegistry setConfig:](self, "setConfig:", v8);

    -[TIMetricDescriptorRegistry config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      IXADefaultLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unable to load the metric descriptor configuration from %@.plist."), "-[TIMetricDescriptorRegistry _loadMetricDescriptors]", CFSTR("MetricDescriptors"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }

  }
  -[TIMetricDescriptorRegistry config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    IXADefaultLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading metric descriptors."), "-[TIMetricDescriptorRegistry _loadMetricDescriptors]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    metricDescriptors = self->_metricDescriptors;
    invalidMetricNames = self->_invalidMetricNames;
    -[TIMetricDescriptorRegistry config](self, "config");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parseMetricDescriptors:andInvalidMetricNames:fromConfig:errors:", metricDescriptors, invalidMetricNames, v18, v15);

    if (objc_msgSend(v15, "count"))
    {
      IXADefaultLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The following errors occurred while parsing the metrics descriptor configuration."), "-[TIMetricDescriptorRegistry _loadMetricDescriptors]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_error_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__TIMetricDescriptorRegistry__loadMetricDescriptors__block_invoke;
      v22[3] = &unk_1EA1018D8;
      v22[4] = self;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v22);
    }

  }
}

- (id)contextFromError:(id)a3
{
  void *v3;
  __CFString *v4;

  -[TIMetricDescriptorRegistry valueFromError:forKey:](self, "valueFromError:forKey:", a3, CFSTR("metric"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metric %@ "), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1EA1081D0;
  }

  return v4;
}

- (id)valueFromError:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), objc_msgSend(v7, "intValue"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_invalidMetricNames, 0);
  objc_storeStrong((id *)&self->_metricDescriptors, 0);
}

void __52__TIMetricDescriptorRegistry__loadMetricDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXADefaultLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "contextFromError:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%s   %@%@"), "-[TIMetricDescriptorRegistry _loadMetricDescriptors]_block_invoke", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_error_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  }
}

+ (id)registry
{
  return -[TIMetricDescriptorRegistry initWithConfig:]([TIMetricDescriptorRegistry alloc], "initWithConfig:", 0);
}

+ (TIMetricDescriptorRegistry)registryWithConfig:(id)a3
{
  id v3;
  TIMetricDescriptorRegistry *v4;

  v3 = a3;
  v4 = -[TIMetricDescriptorRegistry initWithConfig:]([TIMetricDescriptorRegistry alloc], "initWithConfig:", v3);

  return v4;
}

+ (TIMetricDescriptorRegistry)registryWithDescriptors:(id)a3 andInvalidMetricNames:(id)a4
{
  id v5;
  id v6;
  TIMetricDescriptorRegistry *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TIMetricDescriptorRegistry initWithDescriptors:andInvalidMetricNames:]([TIMetricDescriptorRegistry alloc], "initWithDescriptors:andInvalidMetricNames:", v6, v5);

  return v7;
}

@end
