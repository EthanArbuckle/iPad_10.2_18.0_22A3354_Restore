@implementation SiriAnalyticsPrivateLearningStorageProvider

- (BOOL)isAnyEventTypeAllowed:(int)a3
{
  return (a3 < 0x3E) & (0x2000004000DE2202uLL >> a3);
}

- (SiriAnalyticsPrivateLearningStorageProvider)init
{
  SiriAnalyticsPrivateLearningStorageProvider *v2;
  BMSiriPrivateLearningSELFEventStream *v3;
  BMSiriPrivateLearningSELFEventStream *stream;
  uint64_t v5;
  BMSource *source;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriAnalyticsPrivateLearningStorageProvider;
  v2 = -[SiriAnalyticsPrivateLearningStorageProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = (BMSiriPrivateLearningSELFEventStream *)objc_alloc_init(MEMORY[0x1E0D02760]);
    stream = v2->_stream;
    v2->_stream = v3;

    -[BMSiriPrivateLearningSELFEventStream source](v2->_stream, "source");
    v5 = objc_claimAutoreleasedReturnValue();
    source = v2->_source;
    v2->_source = (BMSource *)v5;

  }
  return v2;
}

- (void)storeMessages:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  BMSource *source;
  id v13;
  void *v14;
  void *v15;
  double Current;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "underlyingMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SiriAnalyticsPrivateLearningStorageProvider isAnyEventTypeAllowed:](self, "isAnyEventTypeAllowed:", objc_msgSend(v9, "getAnyEventType"));

        if (v10)
        {
          objc_msgSend(v8, "storageRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            source = self->_source;
            v13 = objc_alloc(MEMORY[0x1E0D02758]);
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "UUIDString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            Current = CFAbsoluteTimeGetCurrent();
            objc_msgSend(v11, "data");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)objc_msgSend(v13, "initWithUniqueId:absoluteTimestamp:eventData:", v15, v17, Current);
            -[BMSource sendEvent:](source, "sendEvent:", v18);

          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

- (void)storeOrderedAnyEvent:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  BMSource *source;
  id v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SiriAnalyticsPrivateLearningStorageProvider isAnyEventTypeAllowed:](self, "isAnyEventTypeAllowed:", objc_msgSend(v4, "anyEventType"));

  v6 = v15;
  if (v5)
  {
    objc_msgSend(v15, "wrapAsAnyEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      source = self->_source;
      v9 = objc_alloc(MEMORY[0x1E0D02758]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v7, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v9, "initWithUniqueId:absoluteTimestamp:eventData:", v11, v13, Current);
      -[BMSource sendEvent:](source, "sendEvent:", v14);

    }
    v6 = v15;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
