@implementation SBAccessoryConnectionInfoProvider

+ (SBAccessoryConnectionInfoProvider)sharedInstance
{
  void *v2;

  v2 = (void *)__sharedInstance_0;
  if (!__sharedInstance_0)
  {
    if (sharedInstance_onceToken_17 != -1)
      dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_135);
    v2 = (void *)__sharedInstance_0;
  }
  return (SBAccessoryConnectionInfoProvider *)v2;
}

void __51__SBAccessoryConnectionInfoProvider_sharedInstance__block_invoke()
{
  SBAccessoryConnectionInfoProvider *v0;
  void *v1;

  v0 = objc_alloc_init(SBAccessoryConnectionInfoProvider);
  v1 = (void *)__sharedInstance_0;
  __sharedInstance_0 = (uint64_t)v0;

}

- (SBAccessoryConnectionInfoProvider)init
{
  SBAccessoryConnectionInfoProvider *v2;
  uint64_t v3;
  ACCConnectionInfo *connectionInfo;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAccessoryConnectionInfoProvider;
  v2 = -[SBAccessoryConnectionInfoProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D153A0], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    connectionInfo = v2->_connectionInfo;
    v2->_connectionInfo = (ACCConnectionInfo *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

  }
  return v2;
}

- (void)dealloc
{
  ACCConnectionInfo *connectionInfo;
  objc_super v4;

  -[ACCConnectionInfo registerDelegate:](self->_connectionInfo, "registerDelegate:", 0);
  connectionInfo = self->_connectionInfo;
  self->_connectionInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBAccessoryConnectionInfoProvider;
  -[SBAccessoryConnectionInfoProvider dealloc](&v4, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
  -[ACCConnectionInfo registerDelegate:](self->_connectionInfo, "registerDelegate:", 0);
  -[ACCConnectionInfo registerDelegate:](self->_connectionInfo, "registerDelegate:", self);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
    -[ACCConnectionInfo registerDelegate:](self->_connectionInfo, "registerDelegate:", 0);
}

- (int)accessoryEndpointTransportType:(id)a3 connection:(id)a4
{
  return -[ACCConnectionInfo accessoryEndpointTransportType:connection:](self->_connectionInfo, "accessoryEndpointTransportType:connection:", a3, a4);
}

- (int)accessoryConnectionType:(id)a3
{
  return -[ACCConnectionInfo accessoryConnectionType:](self->_connectionInfo, "accessoryConnectionType:", a3);
}

- (void)accessoryInfoForEndpoint:(id)a3 connection:(id)a4 withReply:(id)a5
{
  -[ACCConnectionInfo accessoryInfoForEndpoint:connection:withReply:](self->_connectionInfo, "accessoryInfoForEndpoint:connection:withReply:", a3, a4, a5);
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  NSHashTable *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v9 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v11 = a6;
  v12 = a7;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_observers;
  v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v18, "accessoryConnectionInfoProvider:accessoryEndpointAttached:transportType:protocol:properties:forConnection:", self, v20, v9, a5, v11, v12);
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

}

- (void)accessoryEndpointInfoPropertyChanged:(id)a3 properties:(id)a4 forConnection:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_observers;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "accessoryConnectionInfoProvider:accessoryEndpointInfoPropertyChanged:properties:forConnection:", self, v8, v9, v10, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "accessoryConnectionInfoProvider:accessoryEndpointDetached:forConnection:", self, v6, v7, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
}

@end
