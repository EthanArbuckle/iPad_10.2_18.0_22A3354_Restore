@implementation PLCoreAnalyticsEvent

- (PLCoreAnalyticsEvent)initWithEvent:(id)a3 payload:(id)a4
{
  id v7;
  id v8;
  PLCoreAnalyticsEvent *v9;
  PLCoreAnalyticsEvent *v10;
  uint64_t v11;
  NSMutableDictionary *mutablePayload;
  uint64_t v13;
  PFJSONDebugDumpConverter *jsonConverter;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLCoreAnalyticsEvent;
  v9 = -[PLCoreAnalyticsEvent init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    mutablePayload = v10->_mutablePayload;
    v10->_mutablePayload = (NSMutableDictionary *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D75110]), "initWithUnknownTypeHandler:", 0);
    jsonConverter = v10->_jsonConverter;
    v10->_jsonConverter = (PFJSONDebugDumpConverter *)v13;

    -[PFJSONDebugDumpConverter setEnablePretty:](v10->_jsonConverter, "setEnablePretty:", 0);
  }

  return v10;
}

- (id)description
{
  void *v3;
  NSString *event;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCoreAnalyticsEvent;
  -[PLCoreAnalyticsEvent description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  -[PLCoreAnalyticsEvent payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" event: %@, payload: %@"), event, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  PFJSONDebugDumpConverter *jsonConverter;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  jsonConverter = self->_jsonConverter;
  -[PLCoreAnalyticsEvent payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFJSONDebugDumpConverter JSONForObject:error:](jsonConverter, "JSONForObject:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  else
    v6 = CFSTR("unknown");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" event: %@, payload: %@"), self->_event, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)payload
{
  return (NSDictionary *)self->_mutablePayload;
}

- (void)addKey:(id)a3 value:(id)a4
{
  id v6;
  NSMutableDictionary *mutablePayload;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    mutablePayload = self->_mutablePayload;
    if (!mutablePayload)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_mutablePayload;
      self->_mutablePayload = v8;

      mutablePayload = self->_mutablePayload;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](mutablePayload, "setObject:forKeyedSubscript:", v6, v10);
  }

}

- (void)mergePayload:(id)a3
{
  id v4;
  NSMutableDictionary *mutablePayload;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mutablePayload = self->_mutablePayload;
    v8 = v4;
    if (!mutablePayload)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = self->_mutablePayload;
      self->_mutablePayload = v6;

      mutablePayload = self->_mutablePayload;
    }
    -[NSMutableDictionary addEntriesFromDictionary:](mutablePayload, "addEntriesFromDictionary:", v8);
    v4 = v8;
  }

}

- (void)removeKey:(id)a3
{
  if (a3)
    -[NSMutableDictionary removeObjectForKey:](self->_mutablePayload, "removeObjectForKey:");
}

- (void)publish
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSString *event;
  void *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PLCoreAnalyticsEvent payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PLCoreAnalyticsEvent payload](self, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      event = self->_event;
      -[PLCoreAnalyticsEvent payload](self, "payload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = event;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "CoreAnalytics published event: %{public}@ payload: %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonConverter, 0);
  objc_storeStrong((id *)&self->_mutablePayload, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
