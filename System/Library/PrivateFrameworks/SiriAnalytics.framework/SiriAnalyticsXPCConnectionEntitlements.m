@implementation SiriAnalyticsXPCConnectionEntitlements

- (SiriAnalyticsXPCConnectionEntitlements)initWithEntitlements:(id)a3
{
  id v4;
  SiriAnalyticsXPCConnectionEntitlements *v5;
  id v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  char v15;
  BOOL *p_runtimeManagement;
  char v17;
  char v18;
  char v19;
  int v20;
  NSArray *extendedEntitlements;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SiriAnalyticsXPCConnectionEntitlements;
  v5 = -[SiriAnalyticsXPCConnectionEntitlements init](&v28, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5->_genericEntitlement = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v4;
        v6 = v4;
        v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v25 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = v13;
                -[NSArray addObject:](v7, "addObject:", v14);
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("runtime.management"));
                p_runtimeManagement = &v5->_runtimeManagement;
                if ((v15 & 1) != 0)
                  goto LABEL_16;
                v17 = objc_msgSend(v14, "isEqualToString:", CFSTR("runtime.introspection"));
                p_runtimeManagement = &v5->_runtimeIntrospection;
                if ((v17 & 1) != 0
                  || (v18 = objc_msgSend(v14, "isEqualToString:", CFSTR("stream.unifiedMessageStream.readonly")),
                      p_runtimeManagement = &v5->_unifiedMessageStreamReadOnlyAccess,
                      (v18 & 1) != 0)
                  || (v19 = objc_msgSend(v14, "isEqualToString:", CFSTR("publish.unordered")),
                      p_runtimeManagement = &v5->_publishUnorderedMessages,
                      (v19 & 1) != 0)
                  || (v20 = objc_msgSend(v14, "isEqualToString:", CFSTR("plugin.state")),
                      p_runtimeManagement = &v5->_pluginState,
                      v20))
                {
LABEL_16:
                  *p_runtimeManagement = 1;
                }

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          }
          while (v10);
        }

        extendedEntitlements = v5->_extendedEntitlements;
        v5->_extendedEntitlements = v7;

        v4 = v23;
      }
    }
  }

  return v5;
}

- (NSArray)extendedEntitlements
{
  return self->_extendedEntitlements;
}

- (BOOL)hasGenericEntitlement
{
  return self->_genericEntitlement;
}

- (BOOL)hasRuntimeManagement
{
  return self->_runtimeManagement;
}

- (BOOL)hasRuntimeIntrospection
{
  return self->_runtimeIntrospection;
}

- (BOOL)hasUnifiedMessageStreamReadOnlyAccess
{
  return self->_unifiedMessageStreamReadOnlyAccess;
}

- (BOOL)canPublishUnordered
{
  return self->_publishUnorderedMessages;
}

- (BOOL)hasPluginState
{
  return self->_pluginState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedEntitlements, 0);
}

@end
