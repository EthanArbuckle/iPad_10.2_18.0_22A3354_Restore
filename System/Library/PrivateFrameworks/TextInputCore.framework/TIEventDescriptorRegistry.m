@implementation TIEventDescriptorRegistry

- (TIEventDescriptorRegistry)initWithConfig:(id)a3
{
  id v5;
  TIEventDescriptorRegistry *v6;
  TIEventDescriptorRegistry *v7;
  uint64_t v8;
  NSMutableDictionary *eventDescriptors;
  uint64_t v10;
  NSMutableDictionary *eventSpecs;
  NSLock *v12;
  NSLock *lock;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIEventDescriptorRegistry;
  v6 = -[TIEventDescriptorRegistry init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = objc_opt_new();
    eventDescriptors = v7->_eventDescriptors;
    v7->_eventDescriptors = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    eventSpecs = v7->_eventSpecs;
    v7->_eventSpecs = (NSMutableDictionary *)v10;

    v7->_loaded = 0;
    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v12;

  }
  return v7;
}

- (TIEventDescriptorRegistry)initWithDescriptors:(id)a3 andSpecs:(id)a4
{
  id v6;
  id v7;
  TIEventDescriptorRegistry *v8;
  TIEventDescriptorRegistry *v9;
  TIEventDescriptorRegistry *v10;
  NSLock *v11;
  NSLock *lock;
  _QWORD v14[4];
  TIEventDescriptorRegistry *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = -[TIEventDescriptorRegistry initWithConfig:](self, "initWithConfig:", MEMORY[0x1E0C9AA70]);
  v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__TIEventDescriptorRegistry_initWithDescriptors_andSpecs___block_invoke;
    v14[3] = &unk_1EA1018B0;
    v10 = v8;
    v15 = v10;
    v16 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
    v10->_loaded = 1;
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v10->_lock;
    v10->_lock = v11;

  }
  return v9;
}

- (id)allEventDescriptors
{
  void *v2;
  void *v3;

  -[TIEventDescriptorRegistry eventDescriptors](self, "eventDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)eventDescriptorWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIEventDescriptorRegistry eventDescriptors](self, "eventDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)eventSpecWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIEventDescriptorRegistry eventSpecs](self, "eventSpecs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)eventDescriptors
{
  -[TIEventDescriptorRegistry loadEventDescriptorsIfNecessary](self, "loadEventDescriptorsIfNecessary");
  return (NSDictionary *)self->_eventDescriptors;
}

- (NSDictionary)eventSpecs
{
  -[TIEventDescriptorRegistry loadEventDescriptorsIfNecessary](self, "loadEventDescriptorsIfNecessary");
  return (NSDictionary *)self->_eventSpecs;
}

- (void)loadEventDescriptorsIfNecessary
{
  -[NSLock lock](self->_lock, "lock");
  if (!self->_loaded)
  {
    -[TIEventDescriptorRegistry _loadEventDescriptors](self, "_loadEventDescriptors");
    self->_loaded = 1;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_loadEventDescriptors
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
  NSMutableDictionary *eventDescriptors;
  NSMutableDictionary *eventSpecs;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[TIEventDescriptorRegistry config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("EventDescriptors"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IXADefaultLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading event descriptor configuration."), "-[TIEventDescriptorRegistry _loadEventDescriptors]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEventDescriptorRegistry setConfig:](self, "setConfig:", v8);

    -[TIEventDescriptorRegistry config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      IXADefaultLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unable to load the event descriptor configuration from %@.plist."), "-[TIEventDescriptorRegistry _loadEventDescriptors]", CFSTR("EventDescriptors"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_error_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }

  }
  -[TIEventDescriptorRegistry config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    IXADefaultLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading event descriptors."), "-[TIEventDescriptorRegistry _loadEventDescriptors]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    eventDescriptors = self->_eventDescriptors;
    eventSpecs = self->_eventSpecs;
    -[TIEventDescriptorRegistry config](self, "config");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "parseEventDescriptors:andEventSpecs:fromConfig:errors:", eventDescriptors, eventSpecs, v18, v15);

    if (objc_msgSend(v15, "count"))
    {
      IXADefaultLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The following errors occurred while parsing the event descriptor configuration."), "-[TIEventDescriptorRegistry _loadEventDescriptors]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_error_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __50__TIEventDescriptorRegistry__loadEventDescriptors__block_invoke;
      v22[3] = &unk_1EA1018D8;
      v22[4] = self;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v22);
    }

  }
}

- (id)contextFromError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v9;

  v4 = a3;
  -[TIEventDescriptorRegistry valueFromError:forKey:](self, "valueFromError:forKey:", v4, CFSTR("event"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIEventDescriptorRegistry valueFromError:forKey:](self, "valueFromError:forKey:", v4, CFSTR("field"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v6)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Event %@ Field %@ "), v5, v6);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Event %@ "), v5, v9);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1EA1081D0;
  }

  return v7;
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
  objc_storeStrong((id *)&self->_eventSpecs, 0);
  objc_storeStrong((id *)&self->_eventDescriptors, 0);
}

void __50__TIEventDescriptorRegistry__loadEventDescriptors__block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%s   %@%@"), "-[TIEventDescriptorRegistry _loadEventDescriptors]_block_invoke", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_error_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  }
}

void __58__TIEventDescriptorRegistry_initWithDescriptors_andSpecs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a2;
  objc_msgSend(v6, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v7);

  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", v11, v10);
}

+ (id)registry
{
  return -[TIEventDescriptorRegistry initWithConfig:]([TIEventDescriptorRegistry alloc], "initWithConfig:", 0);
}

+ (TIEventDescriptorRegistry)registryWithConfig:(id)a3
{
  id v3;
  TIEventDescriptorRegistry *v4;

  v3 = a3;
  v4 = -[TIEventDescriptorRegistry initWithConfig:]([TIEventDescriptorRegistry alloc], "initWithConfig:", v3);

  return v4;
}

+ (TIEventDescriptorRegistry)registryWithDescriptors:(id)a3 andSpecs:(id)a4
{
  id v5;
  id v6;
  TIEventDescriptorRegistry *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TIEventDescriptorRegistry initWithDescriptors:andSpecs:]([TIEventDescriptorRegistry alloc], "initWithDescriptors:andSpecs:", v6, v5);

  return v7;
}

@end
