@implementation RMConfigurationSubscriberEventStream

+ (id)newConfigurationSubscriberEventStreamWithScope:(int64_t)a3 applicators:(id)a4 publisherClass:(Class)a5
{
  id v7;
  RMConfigurationSubscriberEventStream *v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = -[RMConfigurationSubscriberEventStream initWithScope:]([RMConfigurationSubscriberEventStream alloc], "initWithScope:", a3);
  if (v7)
  {
    +[RMConfigurationSubscriberDelegate sharedDelegateWithApplicators:](RMConfigurationSubscriberDelegate, "sharedDelegateWithApplicators:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMConfigurationSubscriberClient setSubscriberDelegate:](v8, "setSubscriberDelegate:", v9);

  }
  if (a5)
  {
    +[RMStatusPublisherDelegate sharedDelegateWithPublisherClass:](RMStatusPublisherDelegate, "sharedDelegateWithPublisherClass:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RMConfigurationSubscriberClient setPublisherDelegate:](v8, "setPublisherDelegate:", v10);

  }
  return v8;
}

- (RMConfigurationSubscriberEventStream)initWithScope:(int64_t)a3
{
  RMConfigurationSubscriberEventStream *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RMConfigurationSubscriberEventStream;
  result = -[RMConfigurationSubscriberEventStream init](&v5, sel_init);
  if (result)
    result->_scope = a3;
  return result;
}

+ (id)_configuredConfigurationTypesWithScope:(int64_t)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD applier[4];
  id v13;

  v4 = (void *)objc_opt_class();
  if (a3 == 1)
    v5 = CFSTR("com.apple.remotemanagement.configs.daemon");
  else
    v5 = CFSTR("com.apple.remotemanagement.configs.agent");
  objc_msgSend(v4, "_eventDescriptorByNameForEventStreamNamed:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x24952F7D8]() == MEMORY[0x24BDACFA0])
  {
    v8 = (void *)objc_opt_new();
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __79__RMConfigurationSubscriberEventStream__configuredConfigurationTypesWithScope___block_invoke;
    applier[3] = &unk_25162F660;
    v13 = v8;
    v9 = v8;
    xpc_dictionary_apply(v6, applier);
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v7;
}

uint64_t __79__RMConfigurationSubscriberEventStream__configuredConfigurationTypesWithScope___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (MEMORY[0x24952F7D8]() == MEMORY[0x24BDACFA0])
  {
    v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    +[RMConfigurationSubscriberDescription descriptionWithEventsDictionary:](RMConfigurationSubscriberDescription, "descriptionWithEventsDictionary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "types");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v7);

  }
  return 1;
}

- (NSArray)configurationTypes
{
  NSArray *configurationTypes;
  NSArray *v4;
  NSArray *v5;

  configurationTypes = self->_configurationTypes;
  if (!configurationTypes)
  {
    objc_msgSend((id)objc_opt_class(), "_configuredConfigurationTypesWithScope:", -[RMConfigurationSubscriberEventStream scope](self, "scope"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_configurationTypes;
    self->_configurationTypes = v4;

    configurationTypes = self->_configurationTypes;
  }
  return configurationTypes;
}

+ (id)_eventDescriptorByNameForEventStreamNamed:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  return (id)xpc_copy_event();
}

- (void)dealloc
{
  void *v3;
  id eventStreamObserver;
  objc_super v5;

  if (self->_eventStreamObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_eventStreamObserver);

    eventStreamObserver = self->_eventStreamObserver;
    self->_eventStreamObserver = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)RMConfigurationSubscriberEventStream;
  -[RMConfigurationSubscriberEventStream dealloc](&v5, sel_dealloc);
}

- (void)start
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_245188000, log, OS_LOG_TYPE_DEBUG, "Setting up event handler", v1, 2u);
}

- (void)_setupEventHandler
{
  void *v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RMConfigurationSubscriberEventStream scope](self, "scope");
  v5 = CFSTR("com.apple.remotemanagement.configs.agent");
  if (v4 == 1)
    v5 = CFSTR("com.apple.remotemanagement.configs.daemon");
  v6 = v5;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __58__RMConfigurationSubscriberEventStream__setupEventHandler__block_invoke;
  v11 = &unk_25162F688;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMConfigurationSubscriberEventStream setEventStreamObserver:](self, "setEventStreamObserver:", v7, v8, v9, v10, v11);

  objc_msgSend((id)objc_opt_class(), "_setupEventHandlerWithScope:", -[RMConfigurationSubscriberEventStream scope](self, "scope"));
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __58__RMConfigurationSubscriberEventStream__setupEventHandler__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  id v5;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Event"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleEvent:", v5);

}

- (void)_handleEvent:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v18 = 138543362;
    v19 = v4;
    _os_log_impl(&dword_245188000, v5, OS_LOG_TYPE_INFO, "Received event stream message: %{public}@", (uint8_t *)&v18, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ConfigurationTypes"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[RMConfigurationSubscriberEventStream _handleEvent:].cold.4();
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCEF0];
    -[RMConfigurationSubscriberEventStream configurationTypes](self, "configurationTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject minusSet:](v7, "minusSet:", v10);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intersectSet:", v11);

    if (-[NSObject count](v7, "count"))
    {
      v12 = objc_msgSend(v10, "count");
      objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (!v12)
      {
        if (v14)
          -[RMConfigurationSubscriberEventStream _handleEvent:].cold.2();

        goto LABEL_20;
      }
      if (v14)
        -[RMConfigurationSubscriberEventStream _handleEvent:].cold.3();

    }
    objc_msgSend(v10, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
    v16 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[RMConfigurationSubscriberEventStream _handleEvent:].cold.1();

    -[RMConfigurationSubscriberEventStream _fetchConfigurations:](self, "_fetchConfigurations:", v16);
    v6 = v16;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[RMConfigurationSubscriberEventStream _handleEvent:].cold.5();
LABEL_22:

}

- (void)_fetchConfigurations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMConfigurationSubscriberEventStream _fetchConfigurations:].cold.1(self);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RMConfigurationSubscriberEventStream scope](self, "scope");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke;
  v9[3] = &unk_25162F6B0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[RMConfigurationSubscriberClient fetchConfigurationsWithTypes:scope:completionHandler:](self, "fetchConfigurationsWithTypes:scope:completionHandler:", v6, v7, v9);

}

void __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE7EB20], "configurationSubscriberEventStream");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke_cold_1(a1);

}

+ (void)_setupEventHandlerWithScope:(int64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_setupEventHandlerWithScope__onceToken != -1)
    dispatch_once(&_setupEventHandlerWithScope__onceToken, block);
}

void __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke(uint64_t a1)
{
  __CFString *v2;
  const char *v3;
  _QWORD handler[5];

  if (*(_QWORD *)(a1 + 32) == 1)
    v2 = CFSTR("com.apple.remotemanagement.configs.daemon");
  else
    v2 = CFSTR("com.apple.remotemanagement.configs.agent");
  v3 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(v2), "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke_2;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_set_event_stream_handler(v3, 0, handler);
}

void __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16D0];
  v4 = a2;
  objc_msgSend(v3, "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32) == 1)
    v6 = CFSTR("com.apple.remotemanagement.configs.daemon");
  else
    v6 = CFSTR("com.apple.remotemanagement.configs.agent");
  v10 = CFSTR("Event");
  v11[0] = v4;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = v6;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", v8, 0, v9);
}

- (id)eventStreamObserver
{
  return self->_eventStreamObserver;
}

- (void)setEventStreamObserver:(id)a3
{
  objc_storeStrong(&self->_eventStreamObserver, a3);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventStreamObserver, 0);
  objc_storeStrong((id *)&self->_configurationTypes, 0);
}

- (void)_handleEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_245188000, v0, v1, "Fetch of configurations with types: %{public}@...", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_handleEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Ignoring event stream message, notified about unsupported types: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleEvent:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Ignoring unsupported types: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleEvent:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Ignoring event stream message, configuration types is unexpected type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleEvent:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_245188000, v0, v1, "Ignoring event stream message, payload is unexpected type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_fetchConfigurations:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", objc_msgSend(a1, "scope"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_245188000, v2, v3, "Fetch configurations for %{public}@ scope with types: %{public}@...", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

void __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "rms_stringWithScope:", objc_msgSend(*(id *)(a1 + 32), "scope"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_2(&dword_245188000, v2, v3, "Processed configurations for %{public}@ scope with types: %{public}@...", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_2();
}

@end
