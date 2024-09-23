@implementation RTIInputSystemClient

- (RTIDocumentRequest)defaultDocumentRequest
{
  return self->_defaultDocumentRequest;
}

- (void)setEnvironmentOptions:(unint64_t)a3 withReason:(id)a4
{
  -[RTIInputSystemClient setEnvironmentOptions:withReason:completion:](self, "setEnvironmentOptions:withReason:completion:", a3, a4, 0);
}

void __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

void __62__RTIInputSystemClient__beginSessionWithID_forServices_force___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "documentTraits");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:", v3, v4, v8, v7);

}

- (void)beginAllowingRemoteTextInput:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *v6;
  NSMutableSet *allowanceRequestors;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    RTIInputSessionChangeLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTIInputSystemClient beginAllowingRemoteTextInput:]";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1991A8000, v5, OS_LOG_TYPE_DEFAULT, "%s  Begin allowing remote text input: %@", buf, 0x16u);
    }

    if (!self->_allowanceRequestors)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      allowanceRequestors = self->_allowanceRequestors;
      self->_allowanceRequestors = v6;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allower added: %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__RTIInputSystemClient_beginAllowingRemoteTextInput___block_invoke;
    v9[3] = &unk_1E35C2660;
    v9[4] = self;
    v10 = v4;
    -[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:](self, "_modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:", v8, 0, 1, v9, 0);

  }
}

- (void)setEnvironmentOptions:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__RTIInputSystemClient_setEnvironmentOptions_withReason_completion___block_invoke;
  v5[3] = &unk_1E35C2C18;
  v5[4] = self;
  v5[5] = a3 & 0xFFFFFFFFFFFFFFFDLL;
  -[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:](self, "_modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:", a4, (a3 >> 1) & 1, 0, v5, a5);
}

- (void)_beginSessionWithID:(id)a3 forServices:(id)a4 force:(BOOL)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = -[RTIInputSystemClient _remoteTextEditingIsAllowed](self, "_remoteTextEditingIsAllowed");
  if (!v10 || a5)
  {
    if (!v10)
      goto LABEL_9;
  }
  else
  {
    -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v8);

    if ((v12 & 1) != 0)
      goto LABEL_9;
  }
  -[RTIInputSystemClient activeSessions](self, "activeSessions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "beginOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  RTIInputSessionChangeLogFacility();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[RTIInputSystemClient _beginSessionWithID:forServices:force:]";
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1991A8000, v16, OS_LOG_TYPE_DEFAULT, "%s  Begin text input session. sessionID = %@, options = %@", buf, 0x20u);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__RTIInputSystemClient__beginSessionWithID_forServices_force___block_invoke;
  v21[3] = &unk_1E35C2B28;
  v17 = v8;
  v22 = v17;
  v23 = v15;
  v24 = v14;
  v18 = v14;
  v19 = v15;
  -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", v9, 0, v21);
  -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v17);

LABEL_9:
}

- (NSMutableSet)begunSessionIDs
{
  return self->_begunSessionIDs;
}

- (void)_modifyTextEditingAllowedForReason:(id)a3 notify:(BOOL)a4 animated:(BOOL)a5 modifyAllowancesBlock:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  _BOOL4 v10;
  char *v12;
  id v13;
  void (**v14)(_QWORD);
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v9 = a5;
  v10 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = (char *)a3;
  v13 = a7;
  v14 = (void (**)(_QWORD))a6;
  v15 = -[RTIInputSystemClient _remoteTextEditingIsAllowed](self, "_remoteTextEditingIsAllowed");
  v14[2](v14);

  v16 = -[RTIInputSystemClient _remoteTextEditingIsAllowed](self, "_remoteTextEditingIsAllowed");
  RTILogFacility();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v28 = "-[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:]";
    v29 = 2112;
    v30 = v12;
    v31 = 1024;
    v32 = v10;
    v33 = 1024;
    v34 = v15;
    v35 = 1024;
    v36 = v16;
    _os_log_debug_impl(&dword_1991A8000, v17, OS_LOG_TYPE_DEBUG, "%s  Re-evaluating if text editing is allowed; reason: '%@'; notify: %d; allowed before: %d, allowed after: %d.",
      buf,
      0x28u);
  }

  if (v15 == v16)
  {
    if (v13)
    {
      -[RTIInputSystemClient internalQueue](self, "internalQueue");
      v22 = objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke_2;
      v23[3] = &unk_1E35C27C8;
      v24 = v13;
      dispatch_async(v22, v23);

      v21 = v24;
      goto LABEL_15;
    }
  }
  else
  {
    RTIInputSessionChangeLogFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = "NO";
      if (v16)
        v19 = "YES";
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:]";
      v29 = 2080;
      v30 = v19;
      _os_log_impl(&dword_1991A8000, v18, OS_LOG_TYPE_DEFAULT, "%s  Text editing allowed did change (editingAllowedAfter = %s)", buf, 0x16u);
    }

    if (v16)
    {
      -[RTIInputSystemClient _beginAllActiveSessions](self, "_beginAllActiveSessions");
      if (v10)
        -[RTIInputSystemClient notifyServiceOfPause:withReason:](self, "notifyServiceOfPause:withReason:", 0, v12);
      if (v13)
      {
        -[RTIInputSystemClient internalQueue](self, "internalQueue");
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke;
        block[3] = &unk_1E35C27C8;
        v26 = v13;
        dispatch_async(v20, block);

        v21 = v26;
LABEL_15:

      }
    }
    else
    {
      if (v10)
        -[RTIInputSystemClient notifyServiceOfPause:withReason:](self, "notifyServiceOfPause:withReason:", 1, v12);
      -[RTIInputSystemClient _endAllActiveSessionsAnimated:completion:](self, "_endAllActiveSessionsAnimated:completion:", v9, v13);
    }
  }

}

- (BOOL)isEnvironmentEnabled
{
  return self->_environmentOptions & 1;
}

- (BOOL)_remoteTextEditingIsAllowed
{
  uint64_t v3;

  v3 = -[NSMutableSet count](self->_allowanceRequestors, "count");
  if (v3)
    LOBYTE(v3) = -[RTIInputSystemClient isEnvironmentEnabled](self, "isEnvironmentEnabled");
  return v3;
}

uint64_t __68__RTIInputSystemClient_setEnvironmentOptions_withReason_completion___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = *(_QWORD *)(result + 40);
  return result;
}

- (void)enumerateServices:(id)a3 force:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 v9;
  NSMutableDictionary *connections;
  uint64_t v11;
  id v12;
  NSMutableSet *endpointConnections;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  v9 = -[RTIInputSystemClient isEnvironmentEnabled](self, "isEnvironmentEnabled");
  if (v8 && (v9 || v6))
  {
    connections = self->_connections;
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke;
    v17[3] = &unk_1E35C2AD8;
    v18 = v14;
    v12 = v8;
    v19 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connections, "enumerateKeysAndObjectsUsingBlock:", v17);
    endpointConnections = self->_endpointConnections;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke_2;
    v15[3] = &unk_1E35C2B00;
    v16 = v12;
    -[NSMutableSet enumerateObjectsUsingBlock:](endpointConnections, "enumerateObjectsUsingBlock:", v15);

  }
}

uint64_t __53__RTIInputSystemClient_beginAllowingRemoteTextInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)beginRemoteTextInputSessionWithID:(id)a3 options:(id)a4 documentTraits:(id)a5 initialDocumentState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSMutableSet *invalidatedServices;
  void *v15;
  void *v16;
  NSObject *v17;
  RTIInputSystemClientSession *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  invalidatedServices = self->_invalidatedServices;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __102__RTIInputSystemClient_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke;
  v19[3] = &unk_1E35C2C68;
  v19[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](invalidatedServices, "enumerateObjectsUsingBlock:", v19);
  -[NSMutableSet removeAllObjects](self->_invalidatedServices, "removeAllObjects");
  -[RTIInputSystemClient activeSessions](self, "activeSessions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    RTIInputSessionChangeLogFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTIInputSystemClient beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:]";
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1991A8000, v17, OS_LOG_TYPE_DEFAULT, "%s  Cannot begin a session that is already active. session = %@", buf, 0x16u);
    }

  }
  else
  {
    v18 = objc_alloc_init(RTIInputSystemClientSession);
    -[RTIInputSystemClientSession setBeginOptions:](v18, "setBeginOptions:", v11);
    -[RTIInputSystemClientSession setDocumentTraits:](v18, "setDocumentTraits:", v12);
    -[RTIInputSystemClientSession setDocumentState:](v18, "setDocumentState:", v13);
    objc_msgSend(v15, "setObject:forKey:", v18, v10);
    -[RTIInputSystemClient _beginSessionWithID:forServices:force:](self, "_beginSessionWithID:forServices:force:", v10, 0, 0);

  }
}

- (void)_beginAllActiveSessions
{
  -[RTIInputSystemClient _beginAllActiveSessionsForServices:](self, "_beginAllActiveSessionsForServices:", 0);
}

- (void)_beginAllActiveSessionsForServices:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[RTIInputSystemClient activeSessions](self, "activeSessions", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        -[RTIInputSystemClient activeSessions](self, "activeSessions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "beginOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAnimated:", 0);
        -[RTIInputSystemClient _beginSessionWithID:forServices:force:](self, "_beginSessionWithID:forServices:force:", v12, v6, v4);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void)_beginAllActiveSessionsForServices:(id)a3
{
  -[RTIInputSystemClient _beginAllActiveSessionsForServices:force:](self, "_beginAllActiveSessionsForServices:force:", a3, 0);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTIInputSystemClient)initWithMachNames:(id)a3
{
  id v4;
  RTIInputSystemClient *v5;
  RTIInputSystemClient *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *activeSessions;
  NSMutableSet *v9;
  NSMutableSet *begunSessionIDs;
  NSMutableSet *v11;
  NSMutableSet *invalidatedServices;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  uint64_t v16;
  NSArray *machNames;
  uint64_t v18;
  NSMutableDictionary *connections;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RTIInputSystemClient;
  v5 = -[RTIInputSystemClient init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_environmentOptions = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeSessions = v6->_activeSessions;
    v6->_activeSessions = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    begunSessionIDs = v6->_begunSessionIDs;
    v6->_begunSessionIDs = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    invalidatedServices = v6->_invalidatedServices;
    v6->_invalidatedServices = v11;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemClient.Internal", v13);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v14;

    v16 = objc_msgSend(v4, "copy");
    machNames = v6->_machNames;
    v6->_machNames = (NSArray *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](v6->_machNames, "count"));
    connections = v6->_connections;
    v6->_connections = (NSMutableDictionary *)v18;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v6->_machNames;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          -[RTIInputSystemClient _initializeConnectionWithMachName:](v6, "_initializeConnectionWithMachName:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v24++), (_QWORD)v26);
        }
        while (v22 != v24);
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v22);
    }

  }
  return v6;
}

- (void)_didIntializeConnection:(id)a3 withMachName:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[RTIInputSystemClient _configureConnection:withMachName:](self, "_configureConnection:withMachName:", v7, v6);
  -[NSMutableDictionary setObject:forKey:](self->_connections, "setObject:forKey:", v7, v6);

}

- (void)_configureConnection:(id)a3 withMachName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id from;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE347800);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE348650);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v8);
    objc_msgSend(v6, "setExportedInterface:", v9);
    objc_msgSend(v6, "setExportedObject:", self);
    v14 = (void *)v8;
    v10 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke;
    v22[3] = &unk_1E35C2A88;
    objc_copyWeak(&v24, location);
    objc_copyWeak(&v25, &from);
    v11 = v7;
    v23 = v11;
    objc_msgSend(v6, "setInterruptionHandler:", v22);
    v15 = v10;
    v16 = 3221225472;
    v17 = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_2;
    v18 = &unk_1E35C2A88;
    objc_copyWeak(&v20, location);
    objc_copyWeak(&v21, &from);
    v19 = v11;
    objc_msgSend(v6, "setInvalidationHandler:", &v15);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.RemoteTextInput.RTIInputSystemClient.incomingXPC", v12);
    objc_msgSend(v6, "_setQueue:", v13);
    if (-[RTIInputSystemClient _canResumeConnection](self, "_canResumeConnection"))
      objc_msgSend(v6, "resume", v8, v15, v16, v17, v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }

}

- (BOOL)hasActiveSessionWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[RTIInputSystemClient activeSessions](self, "activeSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6 != 0;
  return v7;
}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __75__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation___block_invoke;
      v11[3] = &unk_1E35C2B50;
      v12 = v6;
      v13 = v7;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 0, v11);

    }
    else
    {
      RTILogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:].cold.2();

    }
  }
  else
  {
    RTILogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:].cold.1(v7, v9);
  }

}

void __75__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:performInputOperation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  if (*(_QWORD *)(a1 + 56))
  {
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2;
    v11[3] = &unk_1E35C2B78;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      v9[0] = v4;
      v9[1] = 3221225472;
      v9[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_136;
      v9[3] = &unk_1E35C25C0;
      v7 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v10 = *(id *)(a1 + 32);
      objc_msgSend(v5, "endRemoteTextInputSessionWithID:options:completion:", v7, v6, v9);

    }
  }
  else
  {
    objc_msgSend(a2, "remoteObjectProxy");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endRemoteTextInputSessionWithID:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

void __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)remoteTextInputSessionWithID:(id)a3 textSuggestionsChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RTILogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[RTIInputSystemClient remoteTextInputSessionWithID:textSuggestionsChanged:]";
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1991A8000, v8, OS_LOG_TYPE_DEFAULT, "%s  Text input session suggestions changed. sessionID = %@", buf, 0x16u);
  }

  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__RTIInputSystemClient_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke;
      v12[3] = &unk_1E35C2B50;
      v13 = v6;
      v14 = v7;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 0, v12);

      v11 = v13;
    }
    else
    {
      RTILogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:textSuggestionsChanged:].cold.1();
    }

  }
}

- (void)enumerateConnections:(id)a3 force:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  _BOOL4 v9;
  NSMutableDictionary *connections;
  uint64_t v11;
  id v12;
  NSMutableSet *endpointConnections;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  v9 = -[RTIInputSystemClient isEnvironmentEnabled](self, "isEnvironmentEnabled");
  if (v8 && (v9 || v6))
  {
    connections = self->_connections;
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke;
    v17[3] = &unk_1E35C2AD8;
    v18 = v14;
    v12 = v8;
    v19 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](connections, "enumerateKeysAndObjectsUsingBlock:", v17);
    endpointConnections = self->_endpointConnections;
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke_2;
    v15[3] = &unk_1E35C2B00;
    v16 = v12;
    -[NSMutableSet enumerateObjectsUsingBlock:](endpointConnections, "enumerateObjectsUsingBlock:", v15);

  }
}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  _QWORD block[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  RTIInputSessionChangeLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:]";
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1991A8000, v11, OS_LOG_TYPE_DEFAULT, "%s  Ending text input session. sessionID = %@, options = %@", buf, 0x20u);
  }

  if (v8)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "removeObjectForKey:", v8);
      -[RTIInputSystemClient _endSessionWithID:forServices:options:completion:](self, "_endSessionWithID:forServices:options:completion:", v8, 0, v9, v10);
    }
    else
    {
      RTIInputSessionChangeLogFacility();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:].cold.2();

      if (v10)
      {
        -[RTIInputSystemClient internalQueue](self, "internalQueue");
        v24 = objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke_145;
        v25[3] = &unk_1E35C27C8;
        v26 = v10;
        dispatch_async(v24, v25);

      }
    }

    goto LABEL_15;
  }
  RTIInputSessionChangeLogFacility();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  if (v10)
  {
    -[RTIInputSystemClient internalQueue](self, "internalQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke;
    block[3] = &unk_1E35C27C8;
    v28 = v10;
    dispatch_async(v22, block);

    v12 = v28;
LABEL_15:

  }
}

- (void)endRemoteTextInputSessionWithID:(id)a3 options:(id)a4
{
  -[RTIInputSystemClient endRemoteTextInputSessionWithID:options:completion:](self, "endRemoteTextInputSessionWithID:options:completion:", a3, a4, 0);
}

- (void)endAllowingRemoteTextInput:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    RTIInputSessionChangeLogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTIInputSystemClient endAllowingRemoteTextInput:completion:]";
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1991A8000, v9, OS_LOG_TYPE_DEFAULT, "%s  End allowing remote text input: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Allower removed: %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke_133;
    v13[3] = &unk_1E35C2660;
    v13[4] = self;
    v14 = v6;
    -[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:](self, "_modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:", v10, 0, 1, v13, v8);

    v11 = v14;
    goto LABEL_7;
  }
  if (v7)
  {
    -[RTIInputSystemClient internalQueue](self, "internalQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke;
    block[3] = &unk_1E35C27C8;
    v16 = v8;
    dispatch_async(v12, block);

    v11 = v16;
LABEL_7:

  }
}

- (void)endAllowingRemoteTextInput:(id)a3
{
  -[RTIInputSystemClient endAllowingRemoteTextInput:completion:](self, "endAllowingRemoteTextInput:completion:", a3, 0);
}

- (void)_endSessionWithID:(id)a3 forServices:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_group_t v14;
  dispatch_time_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD block[4];
  NSObject *v24;
  id v25;
  id v26;
  dispatch_time_t v27;
  _QWORD v28[4];
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v22 = a4;
  v11 = a5;
  v12 = a6;
  RTIInputSessionChangeLogFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[RTIInputSystemClient _endSessionWithID:forServices:options:completion:]";
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1991A8000, v13, OS_LOG_TYPE_DEFAULT, "%s  End input session: %@", buf, 0x16u);
  }

  v14 = dispatch_group_create();
  v15 = dispatch_time(0, 2100000000);
  -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v10);

  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke;
    v28[3] = &unk_1E35C2BA0;
    v32 = v12;
    v29 = v14;
    v19 = v10;
    v30 = v19;
    v31 = v11;
    -[RTIInputSystemClient enumerateConnections:force:withBlock:](self, "enumerateConnections:force:withBlock:", v22, 1, v28);
    -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObject:", v19);

  }
  if (v12)
  {
    -[RTIInputSystemClient internalQueue](self, "internalQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v18;
    block[1] = 3221225472;
    block[2] = __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_138;
    block[3] = &unk_1E35C2BC8;
    v24 = v14;
    v27 = v15;
    v25 = v10;
    v26 = v12;
    dispatch_async(v21, block);

  }
}

- (void)_endAllActiveSessionsForServices:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  dispatch_time_t v18;
  id obj;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  dispatch_time_t v23;
  _QWORD v24[4];
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = dispatch_group_create();
  v18 = dispatch_time(0, 2100000000);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[RTIInputSystemClient activeSessions](self, "activeSessions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
        if (a4)
        {
          v16 = 0;
          if (v9)
            goto LABEL_8;
        }
        else
        {
          +[RTISessionOptions defaultEndOptions](RTISessionOptions, "defaultEndOptions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAnimated:", 0);
          if (v9)
          {
LABEL_8:
            dispatch_group_enter(v10);
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke;
            v24[3] = &unk_1E35C25C0;
            v25 = v10;
            -[RTIInputSystemClient _endSessionWithID:forServices:options:completion:](self, "_endSessionWithID:forServices:options:completion:", v15, v8, v16, v24);

            goto LABEL_11;
          }
        }
        -[RTIInputSystemClient _endSessionWithID:forServices:options:completion:](self, "_endSessionWithID:forServices:options:completion:", v15, v8, v16, 0);
LABEL_11:

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  if (v9)
  {
    -[RTIInputSystemClient internalQueue](self, "internalQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2;
    block[3] = &unk_1E35C2BF0;
    v21 = v10;
    v23 = v18;
    v22 = v9;
    dispatch_async(v17, block);

  }
}

- (void)_endAllActiveSessionsAnimated:(BOOL)a3 completion:(id)a4
{
  -[RTIInputSystemClient _endAllActiveSessionsForServices:animated:completion:](self, "_endAllActiveSessionsForServices:animated:completion:", 0, a3, a4);
}

- (void)invalidateConnections
{
  self->_isInvalidated = 1;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_connections, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1);
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_endpointConnections, "enumerateObjectsUsingBlock:", &__block_literal_global_25);
}

uint64_t __45__RTIInputSystemClient_invalidateConnections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

uint64_t __45__RTIInputSystemClient_invalidateConnections__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_isInvalidated)
    -[RTIInputSystemClient invalidateConnections](self, "invalidateConnections");
  v3.receiver = self;
  v3.super_class = (Class)RTIInputSystemClient;
  -[RTIInputSystemClient dealloc](&v3, sel_dealloc);
}

- (BOOL)_canResumeConnection
{
  return 1;
}

- (void)_initializeConnectionWithMachName:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x1E0CB3B38];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithMachServiceName:options:", v5, 4096);
  -[RTIInputSystemClient _didIntializeConnection:withMachName:](self, "_didIntializeConnection:withMachName:", v6, v5);

}

void __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[4];
  id v11;
  _BYTE *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !WeakRetained[16])
  {
    RTIInputSessionChangeLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_cold_1();

    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connectionInterrupted:", *(_QWORD *)(a1 + 32));

    }
    if (*(_QWORD *)(a1 + 32))
    {
      v14[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_123;
    block[3] = &unk_1E35C2750;
    v11 = v3;
    v12 = WeakRetained;
    v13 = v8;
    v9 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_123(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activate");
  return objc_msgSend(*(id *)(a1 + 40), "_beginAllActiveSessionsForServices:force:", *(_QWORD *)(a1 + 48), 1);
}

void __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_2(id *a1)
{
  _BYTE *WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !WeakRetained[16])
  {
    RTIInputSessionChangeLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTIInputSystemClient _configureConnection:withMachName:]_block_invoke_2";
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1991A8000, v4, OS_LOG_TYPE_DEFAULT, "%s  Client connection to service was invalidated: %@", buf, 0x16u);
    }

    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "connectionInvalidated:", a1[4]);

    }
    if (a1[4])
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_127;
      v8[3] = &unk_1E35C2660;
      v8[4] = WeakRetained;
      v9 = a1[4];
      dispatch_async(MEMORY[0x1E0C80D38], v8);

    }
  }

}

uint64_t __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_127(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addEndpoint:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *endpointConnections;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    if (!self->_endpointConnections)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      endpointConnections = self->_endpointConnections;
      self->_endpointConnections = v5;

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v8);
    -[NSMutableSet addObject:](self->_endpointConnections, "addObject:", v7);
    -[RTIInputSystemClient _configureConnection:withMachName:](self, "_configureConnection:withMachName:", v7, 0);

    v4 = v8;
  }

}

- (void)removeEndpoint:(id)a3
{
  id v4;
  NSMutableSet *endpointConnections;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  endpointConnections = self->_endpointConnections;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __39__RTIInputSystemClient_removeEndpoint___block_invoke;
  v11 = &unk_1E35C2AB0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  -[NSMutableSet enumerateObjectsUsingBlock:](endpointConnections, "enumerateObjectsUsingBlock:", &v8);
  v7 = (void *)v15[5];
  if (v7)
  {
    objc_msgSend(v7, "invalidate", v8, v9, v10, v11);
    -[NSMutableSet removeObject:](self->_endpointConnections, "removeObject:", v15[5]);
  }

  _Block_object_dispose(&v14, 8);
}

void __39__RTIInputSystemClient_removeEndpoint___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "endpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__RTIInputSystemClient_endAllowingRemoteTextInput_completion___block_invoke_133(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __58__RTIInputSystemClient_enumerateServices_force_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __61__RTIInputSystemClient_enumerateConnections_force_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateTextForSessionWithID:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__RTIInputSystemClient__updateTextForSessionWithID___block_invoke;
    v10[3] = &unk_1E35C2B50;
    v11 = v9;
    v12 = v7;
    v8 = v7;
    -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 0, v10);

  }
}

void __52__RTIInputSystemClient__updateTextForSessionWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "documentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTextInputSessionWithID:documentDidChange:", v2, v5);

}

- (void)_updateAttributesForSessionWithID:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__RTIInputSystemClient__updateAttributesForSessionWithID___block_invoke;
    v10[3] = &unk_1E35C2B50;
    v11 = v9;
    v12 = v7;
    v8 = v7;
    -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 0, v10);

  }
}

void __58__RTIInputSystemClient__updateAttributesForSessionWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "documentTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteTextInputSessionWithID:documentTraitsDidChange:", v2, v5);

}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  RTIInputSessionChangeLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_cold_1();

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_136(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_138(uint64_t a1)
{
  NSObject *v2;

  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(_QWORD *)(a1 + 56)))
  {
    RTIInputSessionChangeLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_138_cold_1(a1, v2);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), *(_QWORD *)(a1 + 48)))
  {
    RTIInputSessionChangeLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2_cold_1(v2);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setEnvironmentEnabled:(BOOL)a3 withReason:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__RTIInputSystemClient_setEnvironmentEnabled_withReason___block_invoke;
  v4[3] = &unk_1E35C2C18;
  v4[4] = self;
  v4[5] = a3;
  -[RTIInputSystemClient _modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:](self, "_modifyTextEditingAllowedForReason:notify:animated:modifyAllowancesBlock:completion:", a4, 1, 1, v4, 0);
}

uint64_t __57__RTIInputSystemClient_setEnvironmentEnabled_withReason___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __108__RTIInputSystemClient__modifyTextEditingAllowedForReason_notify_animated_modifyAllowancesBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)notifyServiceOfPause:(BOOL)a3 withReason:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[RTIInputSystemClient activeSessions](self, "activeSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        -[RTIInputSystemClient begunSessionIDs](self, "begunSessionIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if (v14)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __56__RTIInputSystemClient_notifyServiceOfPause_withReason___block_invoke;
          v15[3] = &unk_1E35C2C40;
          v15[4] = v12;
          v17 = a3;
          v16 = v6;
          -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 1, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

void __56__RTIInputSystemClient_notifyServiceOfPause_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:didChangePause:withReason:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)beginRemoteTextInputSessionWithID:(id)a3 documentTraits:(id)a4 initialDocumentState:(id)a5
{
  -[RTIInputSystemClient beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:](self, "beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:", a3, 0, a4, a5);
}

void __102__RTIInputSystemClient_beginRemoteTextInputSessionWithID_options_documentTraits_initialDocumentState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  RTIInputSessionChangeLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[RTIInputSystemClient beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1991A8000, v4, OS_LOG_TYPE_DEFAULT, "%s  Connection to service with mach name %@ was invalidated. Attempting to create a new connection.", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_initializeConnectionWithMachName:", v3);
}

- (void)remoteTextInputSessionWithID:(id)a3 documentDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "setDocumentState:", v7);
      -[RTIInputSystemClient _updateTextForSessionWithID:](self, "_updateTextForSessionWithID:", v6);
    }
    else
    {
      RTILogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = "-[RTIInputSystemClient remoteTextInputSessionWithID:documentDidChange:]";
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1991A8000, v10, OS_LOG_TYPE_DEFAULT, "%s  Can only update text of an active session. sessionID = %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (void)remoteTextInputSessionWithID:(id)a3 documentTraitsDidChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "setDocumentTraits:", v7);
      -[RTIInputSystemClient _updateAttributesForSessionWithID:](self, "_updateAttributesForSessionWithID:", v6);
    }
    else
    {
      RTILogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = "-[RTIInputSystemClient remoteTextInputSessionWithID:documentTraitsDidChange:]";
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_1991A8000, v10, OS_LOG_TYPE_DEFAULT, "%s  Can only update attributes of an active session. sessionID = %@", (uint8_t *)&v11, 0x16u);
      }

    }
  }

}

- (void)endRemoteTextInputSessionWithID:(id)a3
{
  -[RTIInputSystemClient endRemoteTextInputSessionWithID:options:](self, "endRemoteTextInputSessionWithID:options:", a3, 0);
}

uint64_t __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__RTIInputSystemClient_endRemoteTextInputSessionWithID_options_completion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__RTIInputSystemClient_remoteTextInputSessionWithID_textSuggestionsChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:textSuggestionsChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didAddSupplementalLexicon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __79__RTIInputSystemClient_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke;
      v18[3] = &unk_1E35C2B50;
      v19 = v6;
      v20 = v7;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 1, v18);

    }
    else
    {
      RTILogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:didAddSupplementalLexicon:].cold.2();

    }
  }
  else
  {
    RTILogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemClient remoteTextInputSessionWithID:didAddSupplementalLexicon:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void __79__RTIInputSystemClient_remoteTextInputSessionWithID_didAddSupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:didAddSupplementalLexicon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __82__RTIInputSystemClient_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke;
      v18[3] = &unk_1E35C2B50;
      v19 = v6;
      v20 = v7;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 1, v18);

    }
    else
    {
      RTILogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:didAddRTISupplementalLexicon:].cold.2();

    }
  }
  else
  {
    RTILogFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemClient remoteTextInputSessionWithID:didAddRTISupplementalLexicon:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void __82__RTIInputSystemClient_remoteTextInputSessionWithID_didAddRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:didAddRTISupplementalLexicon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  unint64_t v19;

  v6 = a3;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __96__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke;
      v17[3] = &unk_1E35C2C90;
      v18 = v6;
      v19 = a4;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 1, v17);

    }
    else
    {
      RTILogFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:].cold.2();

    }
  }
  else
  {
    RTILogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

void __96__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveSupplementalLexiconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 didRemoveRTISupplementalLexiconWithIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  unint64_t v19;

  v6 = a3;
  if (v6)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __99__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke;
      v17[3] = &unk_1E35C2C90;
      v18 = v6;
      v19 = a4;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 1, v17);

    }
    else
    {
      RTILogFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:].cold.2();

    }
  }
  else
  {
    RTILogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemClient remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }

}

void __99__RTIInputSystemClient_remoteTextInputSessionWithID_didRemoveRTISupplementalLexiconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)remoteTextInputSessionWithID:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[RTIInputSystemClient activeSessions](self, "activeSessions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke;
      v17[3] = &unk_1E35C2CE0;
      v18 = v8;
      v19 = v9;
      v13 = v10;
      v20 = v13;
      v21 = &v22;
      -[RTIInputSystemClient enumerateServices:force:withBlock:](self, "enumerateServices:force:withBlock:", 0, 0, v17);
      if (v13 && !*((_BYTE *)v23 + 24))
      {
        RTILogFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:].cold.3();

        (*((void (**)(id, uint64_t))v13 + 2))(v13, 128);
      }

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      RTILogFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:].cold.2();

      if (v10)
        (*((void (**)(id, uint64_t))v10 + 2))(v10, 128);
    }

  }
  else
  {
    RTILogFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:].cold.1(v9, v15);

    if (v10)
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 128);
  }

}

void __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2;
  v6[3] = &unk_1E35C2CB8;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remoteTextInputSessionWithID:performInputOperation:withResponse:", v4, v5, v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

uint64_t __88__RTIInputSystemClient_remoteTextInputSessionWithID_performInputOperation_withResponse___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performTextOperations:(id)a3
{
  RTIInputSystemClientDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "performTextOperations:", v10);

    }
  }

}

- (void)performTextOperations:(id)a3 resultHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  RTIInputSystemClientDelegate **p_delegate;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained
    && (v9 = WeakRetained,
        v10 = objc_loadWeakRetained((id *)p_delegate),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v12, "performTextOperations:resultHandler:", v18, v6);

  }
  else
  {
    v13 = objc_loadWeakRetained((id *)p_delegate);
    if (v13
      && (v14 = v13,
          v15 = objc_loadWeakRetained((id *)p_delegate),
          v16 = objc_opt_respondsToSelector(),
          v15,
          v14,
          (v16 & 1) != 0))
    {
      v17 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v17, "performTextOperations:", v18);

      if (v6)
        v6[2](v6, 255);
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }
  }

}

- (void)updateDefaultDocumentRequest:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  -[RTIInputSystemClient setDefaultDocumentRequest:](self, "setDefaultDocumentRequest:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "defaultDocumentRequestDidChange:", self->_defaultDocumentRequest);

    }
  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  void *v8;
  RTIInputSystemClientDelegate **p_delegate;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v15)
  {
    v7 = v15;
  }
  else
  {
    -[RTIInputSystemClient defaultDocumentRequest](self, "defaultDocumentRequest");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained
    && (v11 = WeakRetained,
        v12 = objc_loadWeakRetained((id *)p_delegate),
        v13 = objc_opt_respondsToSelector(),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    v14 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v14, "performDocumentRequest:completion:", v8, v6);

  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (unint64_t)currentEnvironmentOptions
{
  return self->_currentEnvironmentOptions;
}

- (RTIInputSystemClientDelegate)delegate
{
  return (RTIInputSystemClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDefaultDocumentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDocumentRequest, a3);
}

- (void)setActiveSessions:(id)a3
{
  objc_storeStrong((id *)&self->_activeSessions, a3);
}

- (void)setBegunSessionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_begunSessionIDs, a3);
}

- (NSMutableSet)allowanceRequestors
{
  return self->_allowanceRequestors;
}

- (void)setAllowanceRequestors:(id)a3
{
  objc_storeStrong((id *)&self->_allowanceRequestors, a3);
}

- (NSArray)machNames
{
  return self->_machNames;
}

- (void)setMachNames:(id)a3
{
  objc_storeStrong((id *)&self->_machNames, a3);
}

- (NSMutableSet)invalidatedServices
{
  return self->_invalidatedServices;
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (NSMutableSet)endpointConnections
{
  return self->_endpointConnections;
}

- (void)setEndpointConnections:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnections, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_invalidatedServices, 0);
  objc_storeStrong((id *)&self->_machNames, 0);
  objc_storeStrong((id *)&self->_allowanceRequestors, 0);
  objc_storeStrong((id *)&self->_begunSessionIDs, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_storeStrong((id *)&self->_defaultDocumentRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __58__RTIInputSystemClient__configureConnection_withMachName___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Client connection to service was interrupted: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Error sending -[service endRemoteTextInputSessionWithID:] message: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __73__RTIInputSystemClient__endSessionWithID_forServices_options_completion___block_invoke_2_138_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 136315394;
  v4 = "-[RTIInputSystemClient _endSessionWithID:forServices:options:completion:]_block_invoke_2";
  v5 = 2112;
  v6 = v2;
  _os_log_fault_impl(&dword_1991A8000, a2, OS_LOG_TYPE_FAULT, "%s  Timeout while waiting to end session. sessionID = %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __77__RTIInputSystemClient__endAllActiveSessionsForServices_animated_completion___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RTIInputSystemClient _endAllActiveSessionsForServices:animated:completion:]_block_invoke_2";
  _os_log_fault_impl(&dword_1991A8000, log, OS_LOG_TYPE_FAULT, "%s  Timeout while waiting to end all active sessions.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)endRemoteTextInputSessionWithID:(uint64_t)a3 options:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  Session identifier is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)endRemoteTextInputSessionWithID:options:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only end an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:textSuggestionsChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only set suggestions for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didAddSupplementalLexicon:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  didAddSupplementalLexicon requires a valid sessionID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:didAddSupplementalLexicon:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only didAddSupplementalLexicon for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didAddRTISupplementalLexicon:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  didAddRTISupplementalLexicon requires a valid sessionID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:didAddRTISupplementalLexicon:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only didAddRTISupplementalLexicon for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didRemoveSupplementalLexiconWithIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  didRemoveSupplementalLexiconWithIdentifier requires a valid sessionID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:didRemoveSupplementalLexiconWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only didRemoveSupplementalLexiconWithIdentifier for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:(uint64_t)a3 didRemoveRTISupplementalLexiconWithIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1991A8000, a1, a3, "%s  didRemoveRTISupplementalLexiconWithIdentifier requires a valid sessionID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only didRemoveRTISupplementalLexiconWithIdentifier for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:(void *)a1 performInputOperation:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _RTI_NSStringFromRTIInputModality(objc_msgSend(a1, "inputModality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sel_getName((SEL)objc_msgSend(a1, "actionSelector"));
  objc_msgSend(a1, "customInfoType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315906;
  v8 = "-[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:]";
  v9 = 2112;
  v10 = v4;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_1991A8000, a2, v6, "%s  perform input operation requires a valid sessionID. inputModality = %@, inputOperation = %s, customInfoType = %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_5();
}

- (void)remoteTextInputSessionWithID:performInputOperation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only perform input operation for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:(void *)a1 performInputOperation:(NSObject *)a2 withResponse:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _RTI_NSStringFromRTIInputModality(objc_msgSend(a1, "inputModality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sel_getName((SEL)objc_msgSend(a1, "actionSelector"));
  objc_msgSend(a1, "customInfoType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315906;
  v8 = "-[RTIInputSystemClient remoteTextInputSessionWithID:performInputOperation:withResponse:]";
  v9 = 2112;
  v10 = v4;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_1991A8000, a2, v6, "%s  perform input operation requires a valid sessionID. inputModality = %@, inputOperation = %s, customInfoType = %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_5();
}

- (void)remoteTextInputSessionWithID:performInputOperation:withResponse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  Can only perform input operation for an active session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteTextInputSessionWithID:performInputOperation:withResponse:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1991A8000, v0, v1, "%s  No services for this session. sessionID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
