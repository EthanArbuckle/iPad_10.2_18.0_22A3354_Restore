@implementation SLDRemoteRenderingService

- (SLDRemoteRenderingService)init
{
  SLDRemoteRenderingService *v2;
  uint64_t v3;
  NSMapTable *connectionViewIDs;
  uint64_t v5;
  NSMapTable *viewIDConnections;
  uint64_t v7;
  NSMapTable *viewIdentifierMap;
  uint64_t v9;
  NSMutableArray *viewLRUCache;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SLDRemoteRenderingService;
  v2 = -[SLDRemoteRenderingService init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    connectionViewIDs = v2->_connectionViewIDs;
    v2->_connectionViewIDs = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    viewIDConnections = v2->_viewIDConnections;
    v2->_viewIDConnections = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    viewIdentifierMap = v2->_viewIdentifierMap;
    v2->_viewIdentifierMap = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    viewLRUCache = v2->_viewLRUCache;
    v2->_viewLRUCache = (NSMutableArray *)v9;

  }
  return v2;
}

+ (id)remoteObjectProtocol
{
  return 0;
}

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SLDRemoteRenderingService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken_7 != -1)
    dispatch_once(&sharedService_onceToken_7, block);
  return (id)sharedService_sService_7;
}

void __42__SLDRemoteRenderingService_sharedService__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedService_sService_7;
  sharedService_sService_7 = (uint64_t)v0;

}

- (void)receivedConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v4);

}

- (void)lostConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  v4 = a3;
  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        -[SLDRemoteRenderingService _connection:doesNotNeedViewWithIdentifier:](self, "_connection:doesNotNeedViewWithIdentifier:", v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v4);

  if (!-[SLDRemoteRenderingService _hasConnections](self, "_hasConnections"))
    -[SLDRemoteRenderingService _allConnectionsDisconnected](self, "_allConnectionsDisconnected");

}

- (BOOL)_hasConnections
{
  void *v2;
  BOOL v3;

  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_allConnectionsDisconnected
{
  NSObject *v3;
  void *v4;
  int v5;
  SLDRemoteRenderingService *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SLDaemonLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[%@] All connections have disconnected. Clearing tracking objects and niling out slot machines.", (uint8_t *)&v5, 0xCu);
  }

  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[NSMapTable removeAllObjects](self->_viewIDConnections, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_viewIdentifierMap, "removeAllObjects");
}

- (void)_connection:(id)a3 doesNotNeedViewWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  SLDRemoteRenderingService *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_DEFAULT, "[%@] Connection [%@] does not need viewID with identifier: %@", (uint8_t *)&v13, 0x20u);
  }

  -[SLDRemoteRenderingService viewIDConnections](self, "viewIDConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeObject:", v6);
  objc_msgSend(v12, "removeObject:", v7);
  if (!v10 || !objc_msgSend(v10, "count"))
    -[SLDRemoteRenderingService _destroyViewWithID:](self, "_destroyViewWithID:", v7);

}

- (void)_connection:(id)a3 onlyNeedsViewWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  SLDRemoteRenderingService *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (objc_msgSend(v10, "count"))
  {
    SLDaemonLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v24 = self;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Connection [%@] only needs view with ID: %@", buf, 0x20u);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v17, "isEqual:", v7, (_QWORD)v18) & 1) == 0)
            -[SLDRemoteRenderingService _connection:doesNotNeedViewWithIdentifier:](self, "_connection:doesNotNeedViewWithIdentifier:", v6, v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)_connectionTouchedView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[SLDRemoteRenderingService _connectionTouchedView:].cold.3(self, v7);

  -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 0x21)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[SLDRemoteRenderingService _connectionTouchedView:].cold.2((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);

  }
  -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 >= 0x21)
  {
    do
    {
      -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[SLDRemoteRenderingService viewIDConnections](self, "viewIDConnections");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v40;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(v24);
            -[SLDRemoteRenderingService _connection:doesNotNeedViewWithIdentifier:](self, "_connection:doesNotNeedViewWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v28++), v20);
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v26);
      }

      -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "removeObject:", v20);

      -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

    }
    while (v31 > 0x20);
  }
  if (v9 >= 0x21)
  {
    SLDaemonLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[SLDRemoteRenderingService _connectionTouchedView:].cold.1((uint64_t)self, v32, v33, v34, v35, v36, v37, v38);

  }
}

- (void)_destroyViewWithID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMapTable *viewIdentifierMap;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMapTable *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMapTable *v20;
  void *v21;
  int v22;
  SLDRemoteRenderingService *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SLDaemonLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_DEFAULT, "[%@] Releasing view no longer needed by any connection: %@", (uint8_t *)&v22, 0x16u);
  }

  -[SLDRemoteRenderingService slotMachineForViewIdentifier:](self, "slotMachineForViewIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeContentForStyle:tag:", v7, v8);

  -[SLDRemoteRenderingService viewIDConnections](self, "viewIDConnections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v4);

  -[SLDRemoteRenderingService viewLRUCache](self, "viewLRUCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v4);

  viewIdentifierMap = self->_viewIdentifierMap;
  objc_msgSend(v4, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](viewIdentifierMap, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = self->_viewIdentifierMap;
    objc_msgSend(v4, "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v16, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "tag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", v19);

    if (!objc_msgSend(v18, "count"))
    {
      v20 = self->_viewIdentifierMap;
      objc_msgSend(v4, "style");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](v20, "removeObjectForKey:", v21);

    }
  }

}

- (id)_remoteContentForViewIdentifier:(id)a3 layerContextID:(unint64_t)a4 connection:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  SLDRemoteRenderingService *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[SLDRemoteRenderingService slotMachineForViewIdentifier:](self, "slotMachineForViewIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SLGeneralTelemetryLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  SLGeneralTelemetryLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SlotMachineRetrieveRemoteContent", ", (uint8_t *)&v26, 2u);
  }

  objc_msgSend(v8, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteContentForLayerContextWithId:style:tag:", a4, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  SLGeneralTelemetryLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_199EFF000, v19, OS_SIGNPOST_INTERVAL_END, v12, "SlotMachineRetrieveRemoteContent", ", (uint8_t *)&v26, 2u);
  }

  if (v17)
  {
    -[SLDRemoteRenderingService connectionViewIDs](self, "connectionViewIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v9);
    v21 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject containsObject:](v21, "containsObject:", v8) & 1) == 0)
      -[NSObject addObject:](v21, "addObject:", v8);
    -[SLDRemoteRenderingService viewIDConnections](self, "viewIDConnections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKey:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDRemoteRenderingService viewIDConnections](self, "viewIDConnections");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v23, v8);

    }
    if ((objc_msgSend(v23, "containsObject:", v9) & 1) == 0)
      objc_msgSend(v23, "addObject:", v9);

  }
  else
  {
    SLDaemonLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412802;
      v27 = self;
      v28 = 2112;
      v29 = v10;
      v30 = 2112;
      v31 = v8;
      _os_log_error_impl(&dword_199EFF000, v21, OS_LOG_TYPE_ERROR, "[%@] Slot machine [%@] did not return any rendered content for viewID: %@", (uint8_t *)&v26, 0x20u);
    }
  }

  return v17;
}

- (id)_viewIDForStyle:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[SLDRemoteRenderingService viewIdentifierMap](self, "viewIdentifierMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[SLDRemoteRenderingService viewIdentifierMap](self, "viewIdentifierMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDRemoteRenderingService viewIdentifierMap](self, "viewIdentifierMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v12, v6);

    }
    +[SLDRemoteViewIdentifier identifierForStyle:tag:](SLDRemoteViewIdentifier, "identifierForStyle:tag:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v10, v7);

  }
  return v10;
}

- (id)slotMachineForViewIdentifier:(id)a3
{
  return 0;
}

- (NSMapTable)connectionViewIDs
{
  return self->_connectionViewIDs;
}

- (void)setConnectionViewIDs:(id)a3
{
  objc_storeStrong((id *)&self->_connectionViewIDs, a3);
}

- (NSMapTable)viewIDConnections
{
  return self->_viewIDConnections;
}

- (void)setViewIDConnections:(id)a3
{
  objc_storeStrong((id *)&self->_viewIDConnections, a3);
}

- (NSMapTable)viewIdentifierMap
{
  return self->_viewIdentifierMap;
}

- (void)setViewIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_viewIdentifierMap, a3);
}

- (NSMutableArray)viewLRUCache
{
  return self->_viewLRUCache;
}

- (void)setViewLRUCache:(id)a3
{
  objc_storeStrong((id *)&self->_viewLRUCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLRUCache, 0);
  objc_storeStrong((id *)&self->_viewIdentifierMap, 0);
  objc_storeStrong((id *)&self->_viewIDConnections, 0);
  objc_storeStrong((id *)&self->_connectionViewIDs, 0);
}

- (void)_connectionTouchedView:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a2, a3, "[%@] Finished pruning lru cache.", a5, a6, a7, a8, 2u);
}

- (void)_connectionTouchedView:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_199EFF000, a2, a3, "[%@] Pruning lru cache since we've reached the limit.", a5, a6, a7, a8, 2u);
}

- (void)_connectionTouchedView:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "viewLRUCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(v4, "count");
  _os_log_debug_impl(&dword_199EFF000, a2, OS_LOG_TYPE_DEBUG, "[%@] Current unique pill count: %lu", (uint8_t *)&v5, 0x16u);

}

@end
