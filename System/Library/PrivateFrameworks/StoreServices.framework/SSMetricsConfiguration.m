@implementation SSMetricsConfiguration

void __44__SSMetricsConfiguration_reportingFrequency__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setReportingFrequencyOverride:", v3);

}

- (void)_setReportingFrequencyOverride:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSMetricsConfiguration__setReportingFrequencyOverride___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)setDisableEventDecoration:(BOOL)a3
{
  self->_disableEventDecoration = a3;
}

- (SSMetricsConfiguration)initWithGlobalConfiguration:(id)a3
{
  id v4;
  SSMetricsConfiguration *v5;
  uint64_t v6;
  NSDictionary *config;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *fields;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SSMetricsConfiguration _initSSMetricsEventConfiguration](self, "_initSSMetricsEventConfiguration");
  if (!v5)
    goto LABEL_24;
  if (!objc_msgSend(v4, "count"))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      v16 &= 2u;
    if (v16)
    {
      v32 = 138412290;
      v33 = (id)objc_opt_class();
      v18 = v33;
      LODWORD(v27) = 12;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_23:

        v5 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v32, v27);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog(v14, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v17);
    }

    goto LABEL_23;
  }
  v6 = objc_msgSend(v4, "copy");
  config = v5->_config;
  v5->_config = (NSDictionary *)v6;

  v5->_disabled = -[SSMetricsConfiguration _configBooleanForKey:defaultValue:](v5, "_configBooleanForKey:defaultValue:", CFSTR("disabled"), 0);
  v5->_sendDisabled = -[SSMetricsConfiguration _configBooleanForKey:defaultValue:](v5, "_configBooleanForKey:defaultValue:", CFSTR("sendDisabled"), 0);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "objectForKey:", CFSTR("metrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("metricsBase"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("metrics_base"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("fields"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke;
      v30[3] = &unk_1E47BAEA8;
      v31 = v8;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v30);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke_2;
    v28[3] = &unk_1E47BAEA8;
    v29 = v8;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v28);

  }
  v12 = objc_msgSend(v8, "copy");
  fields = v5->_fields;
  v5->_fields = (NSDictionary *)v12;

LABEL_24:
  return v5;
}

- (BOOL)_configBooleanForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;

  -[NSDictionary objectForKey:](self->_config, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)_initSSMetricsEventConfiguration
{
  SSMetricsConfiguration *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD handler[4];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSMetricsConfiguration;
  v2 = -[SSMetricsConfiguration init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.StoreServices.SSMetricsConfiguration", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_dispatchQueue;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

    +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v2->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__SSMetricsConfiguration__initSSMetricsEventConfiguration__block_invoke;
    handler[3] = &unk_1E47BAE80;
    v12 = v7;
    v9 = v7;
    notify_register_dispatch("com.apple.StoreServices.metrics-internal-settings-change", &v2->_internalSettingsToken, v8, handler);

  }
  return v2;
}

void __44__SSMetricsConfiguration_reportingFrequency__block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  }
  else if (!v3)
  {
    if (SSVUserDefaultsIsReadable(CFSTR("com.apple.itunesstored")))
    {
      objc_msgSend((id)objc_opt_class(), "_reportingFrequencyOverride");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v4;
      if (v4)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v4);
        v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v7 = v5;
        v8 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null", 0);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v13 + 80);
        *(_QWORD *)(v13 + 80) = v12;
      }

    }
    else
    {
      +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", *(_QWORD *)(a1 + 32));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_class();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __44__SSMetricsConfiguration_reportingFrequency__block_invoke_2;
      v15[3] = &unk_1E47BAEF8;
      v16 = v9;
      v11 = v9;
      objc_msgSend(v10, "getReportingFrequencyOverrideWithCompletionBlock:", v15);

    }
  }
}

+ (void)getReportingFrequencyOverrideWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  SSXPCConnection *v6;
  xpc_object_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!SSVUserDefaultsIsReadable(CFSTR("com.apple.itunesstored")))
  {
    if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
      goto LABEL_18;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v27 = 136446210;
      v28 = "+[SSMetricsConfiguration getReportingFrequencyOverrideWithCompletionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_17:

LABEL_18:
        v6 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
        v7 = SSXPCCreateMessageDictionary(128);
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke_61;
        v22[3] = &unk_1E47BAB40;
        v23 = v4;
        v20 = v4;
        -[SSXPCConnection sendMessage:withReply:](v6, "sendMessage:withReply:", v7, v22);

        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v27, v21);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_17;
  }
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47BAF20;
  v25 = v4;
  v26 = a1;
  v6 = (SSXPCConnection *)v4;
  dispatch_async(v5, block);

  v7 = v25;
LABEL_19:

}

- (BOOL)_decorateITMLEvents
{
  return -[SSMetricsConfiguration _configBooleanForKey:defaultValue:](self, "_configBooleanForKey:defaultValue:", CFSTR("decorateITMLEvents"), 0);
}

void __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (BOOL)isDisabled
{
  void *v3;
  char v4;

  if (self->_disabled)
    return 1;
  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDisabled");

  return v4;
}

- (double)reportingFrequency
{
  NSObject *dispatchQueue;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__SSMetricsConfiguration_reportingFrequency__block_invoke;
  v10[3] = &unk_1E47B8718;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(dispatchQueue, v10);
  v4 = (void *)v12[5];
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v6 = v5 * 1000.0;
  }
  else
  {
    -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForConfigurationKey:", CFSTR("postFrequency"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("postFrequency"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_opt_class();
    v6 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = (double)objc_msgSend(v8, "longLongValue");

  }
  _Block_object_dispose(&v11, 8);

  return v6 / 1000.0;
}

- (SSMetricsConfiguration)childConfiguration
{
  return self->_childConfiguration;
}

- (void)setChildConfiguration:(id)a3
{
  SSMetricsConfiguration *v5;
  NSMutableDictionary *eventFieldsUnion;
  NSMutableSet *cookieFieldsUnion;
  SSMetricsConfiguration *v8;

  v5 = (SSMetricsConfiguration *)a3;
  if (self->_childConfiguration != v5)
  {
    eventFieldsUnion = self->_eventFieldsUnion;
    self->_eventFieldsUnion = 0;
    v8 = v5;

    cookieFieldsUnion = self->_cookieFieldsUnion;
    self->_cookieFieldsUnion = 0;

    objc_storeStrong((id *)&self->_childConfiguration, a3);
    v5 = v8;
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_internalSettingsToken);
  v3.receiver = self;
  v3.super_class = (Class)SSMetricsConfiguration;
  -[SSMetricsConfiguration dealloc](&v3, sel_dealloc);
}

void __57__SSMetricsConfiguration__setReportingFrequencyOverride___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 80) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v4;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportingFrequencyOverride, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_eventFieldsUnion, 0);
  objc_storeStrong((id *)&self->_cookieFieldsUnion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_childConfiguration, 0);
  objc_storeStrong((id *)&self->_blacklistedEvents, 0);
}

- (id)valueForConfigurationKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_config, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForConfigurationKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)reportingURLString
{
  void *v3;
  void *v4;

  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportingURLString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("metricsUrl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)isEventTypeBlacklisted:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSSet *blacklistedEvents;
  void *v8;
  NSSet *v9;
  NSSet *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_disabled)
    goto LABEL_2;
  if (!objc_msgSend(v4, "length"))
    goto LABEL_19;
  blacklistedEvents = self->_blacklistedEvents;
  if (!blacklistedEvents)
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("blacklistedEvents"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
    v10 = self->_blacklistedEvents;
    self->_blacklistedEvents = v9;

    blacklistedEvents = self->_blacklistedEvents;
  }
  if (!-[NSSet containsObject:](blacklistedEvents, "containsObject:", v5))
  {
LABEL_19:
    -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v23, "isEventTypeBlacklisted:", v5);

    goto LABEL_20;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    v13 &= 2u;
  if (!v13)
    goto LABEL_17;
  *(_DWORD *)v26 = 138412546;
  *(_QWORD *)&v26[4] = objc_opt_class();
  *(_WORD *)&v26[12] = 2112;
  *(_QWORD *)&v26[14] = v5;
  v15 = *(id *)&v26[4];
  LODWORD(v25) = 22;
  v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, v26, v25, *(_OWORD *)v26, *(_QWORD *)&v26[16], v27);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
LABEL_17:

  }
LABEL_2:
  v6 = 1;
LABEL_20:

  return v6;
}

- (NSDictionary)fieldsMap
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("fieldsMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fieldsMap");
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return (NSDictionary *)v3;
}

- (id)eventFields
{
  NSMutableDictionary *eventFieldsUnion;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;

  eventFieldsUnion = self->_eventFieldsUnion;
  if (!eventFieldsUnion)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_eventFieldsUnion;
    self->_eventFieldsUnion = v4;

    v6 = (void *)MEMORY[0x1A8585BF8]();
    -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSDictionary count](self->_fields, "count"))
      -[NSMutableDictionary addEntriesFromDictionary:](self->_eventFieldsUnion, "addEntriesFromDictionary:", self->_fields);
    if (objc_msgSend(v8, "count"))
      -[NSMutableDictionary addEntriesFromDictionary:](self->_eventFieldsUnion, "addEntriesFromDictionary:", v8);

    objc_autoreleasePoolPop(v6);
    eventFieldsUnion = self->_eventFieldsUnion;
  }
  return eventFieldsUnion;
}

- (BOOL)disableEventDecoration
{
  return self->_disableEventDecoration;
}

- (id)cookieFields
{
  NSMutableSet *cookieFieldsUnion;
  NSMutableSet *v4;
  NSMutableSet *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  cookieFieldsUnion = self->_cookieFieldsUnion;
  if (!cookieFieldsUnion)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_cookieFieldsUnion;
    self->_cookieFieldsUnion = v4;

    v6 = (void *)MEMORY[0x1A8585BF8]();
    -[SSMetricsConfiguration fieldsMap](self, "fieldsMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("cookies"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      -[NSMutableSet addObjectsFromArray:](self->_cookieFieldsUnion, "addObjectsFromArray:", v8);
    -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cookieFields");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
      -[NSMutableSet unionSet:](self->_cookieFieldsUnion, "unionSet:", v10);

    objc_autoreleasePoolPop(v6);
    cookieFieldsUnion = self->_cookieFieldsUnion;
  }
  return cookieFieldsUnion;
}

- (id)blacklistedEventFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("blacklistedFields"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blacklistedEventFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v3);
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "count"))
      v8 = v5;
    else
      v8 = v3;
    v7 = v8;
  }

  return v7;
}

void __58__SSMetricsConfiguration__initSSMetricsEventConfiguration__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setReportingFrequencyOverride:", 0);

}

void __54__SSMetricsConfiguration_initWithGlobalConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (SSMetricsConfiguration)initWithStorePlatformData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SSMetricsConfiguration *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *config;
  uint64_t v14;
  NSDictionary *fields;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  SSMetricsConfiguration *v21;
  _QWORD v22[4];
  SSMetricsConfiguration *v23;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("metrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("metricsBase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("metrics_base"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
LABEL_14:

      goto LABEL_15;
    }
  }
  v7 = -[SSMetricsConfiguration _initSSMetricsEventConfiguration](self, "_initSSMetricsEventConfiguration");
  if (v7)
  {
    self = (SSMetricsConfiguration *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "objectForKey:", CFSTR("fields"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = MEMORY[0x1E0C809B0];
    if ((isKindOfClass & 1) != 0)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke;
      v22[3] = &unk_1E47BAEA8;
      v23 = self;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
    objc_msgSend(v5, "objectForKey:", CFSTR("config"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_msgSend(v11, "copy");
      config = v7->_config;
      v7->_config = (NSDictionary *)v12;

      v7->_disabled = -[SSMetricsConfiguration _configBooleanForKey:defaultValue:](v7, "_configBooleanForKey:defaultValue:", CFSTR("disabled"), 0);
      v7->_sendDisabled = -[SSMetricsConfiguration _configBooleanForKey:defaultValue:](v7, "_configBooleanForKey:defaultValue:", CFSTR("sendDisabled"), 0);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v10;
      v18 = 3221225472;
      v19 = __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke_2;
      v20 = &unk_1E47BAEA8;
      v21 = self;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v17);

    }
    v14 = -[SSMetricsConfiguration copy](self, "copy", v17, v18, v19, v20);
    fields = v7->_fields;
    v7->_fields = (NSDictionary *)v14;

    goto LABEL_14;
  }
LABEL_15:

  return v7;
}

void __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

void __52__SSMetricsConfiguration_initWithStorePlatformData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

- (id)compoundStringWithElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v4 = a3;
  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compoundStringWithElements:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("compoundSeparator"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (__CFString *)v7;
    else
      v8 = CFSTR("_");
    objc_msgSend(v4, "componentsJoinedByString:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isSendDisabled
{
  void *v3;
  char v4;

  if (self->_sendDisabled)
    return 1;
  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSendDisabled");

  return v4;
}

- (id)pingURLs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("pingUrls"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pingURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") || objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__SSMetricsConfiguration_pingURLs__block_invoke;
    v9[3] = &unk_1E47BAED0;
    v7 = v6;
    v10 = v7;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    objc_msgSend(v7, "addObjectsFromArray:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __34__SSMetricsConfiguration_pingURLs__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E98];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithString:", v4);

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

- (id)tokenStringWithElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v4 = a3;
  -[SSMetricsConfiguration childConfiguration](self, "childConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenStringWithElements:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSDictionary objectForKey:](self->_config, "objectForKey:", CFSTR("tokenSeparator"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (__CFString *)v7;
    else
      v8 = CFSTR("_");
    objc_msgSend(v4, "componentsJoinedByString:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "_reportingFrequencyOverride");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75__SSMetricsConfiguration_getReportingFrequencyOverrideWithCompletionBlock___block_invoke_61(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6 && MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812F8])
  {
    v4 = objc_msgSend(CFSTR("SSVMetricsInternalSettingReportingFrequency"), "UTF8String");
    v5 = objc_opt_class();
    v3 = (void *)SSXPCDictionaryCopyObjectWithClass(v6, v4, v5);
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (void)setReportingFrequencyOverride:(id)a3
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SSXPCConnection *v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (SSVUserDefaultsIsWritable(CFSTR("com.apple.itunesstored")))
  {
    v4 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
    if (v4)
    {
      v5 = v4;
      CFPreferencesSetAppValue(CFSTR("SSVMetricsInternalSettingReportingFrequency"), v3, v4);
      CFPreferencesAppSynchronize(v5);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.StoreServices.metrics-internal-settings-change"), 0, 0, 1u);
      CFRelease(v5);
    }
    goto LABEL_23;
  }
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      v25 = 136446210;
      v26 = "+[SSMetricsConfiguration setReportingFrequencyOverride:]";
      LODWORD(v24) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v25, v24);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_18;
  }
LABEL_19:
  v19 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v20 = SSXPCCreateMessageDictionary(129);
  v21 = xpc_dictionary_create(0, 0, 0);
  v22 = objc_msgSend(CFSTR("SSVMetricsInternalSettingReportingFrequency"), "UTF8String");
  if (v3)
  {
    SSXPCDictionarySetObject(v21, v22, v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    SSXPCDictionarySetObject(v21, v22, v23);

  }
  xpc_dictionary_set_value(v20, "1", v21);
  -[SSXPCConnection sendMessage:withReply:](v19, "sendMessage:withReply:", v20, &__block_literal_global_7);

LABEL_23:
}

void __56__SSMetricsConfiguration_setReportingFrequencyOverride___block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.StoreServices.metrics-internal-settings-change"), 0, 0, 1u);
}

+ (id)_reportingFrequencyOverride
{
  const __CFString *v2;
  const __CFString *v3;
  void *v4;

  v2 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v2)
  {
    v3 = v2;
    CFPreferencesAppSynchronize(v2);
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SSVMetricsInternalSettingReportingFrequency"), v3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v4 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
