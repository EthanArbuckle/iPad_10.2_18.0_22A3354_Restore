@implementation TUCallFilterController

- (TUCallFilterController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4
{
  id v6;
  id v7;
  TUCallFilterController *v8;
  TUCallFilterController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUCallFilterController;
  v8 = -[TUCallFilterController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_actionsDelegate, v6);
  }

  return v9;
}

- (BOOL)silenceUnknownCallersEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("allowContactsOnly"));

  return v3;
}

- (BOOL)silenceUnknownFaceTimeCallersEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("silenceUnknownFaceTimeCallers"));

  return v3;
}

- (BOOL)isUnknownHandle:(id)a3
{
  void *v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TUCallFilterController isUnknownAddress:normalizedAddress:forBundleIdentifier:](self, "isUnknownAddress:normalizedAddress:forBundleIdentifier:", v4, v4, &stru_1E38A53C8);

  return (char)self;
}

- (BOOL)shouldRestrictDialRequest:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[TUCallFilterController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  LOBYTE(self) = -[TUCallFilterController shouldRestrictDialRequest:performSynchronously:](self, "shouldRestrictDialRequest:performSynchronously:", v4, 0);
  return (char)self;
}

- (BOOL)shouldRestrictDialRequest:(id)a3 performSynchronously:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a4;
  v6 = a3;
  -[TUCallFilterController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (objc_msgSend(v6, "dialType") == 1 || (objc_msgSend(v6, "isSOS") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "provider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallFilterController bundleIdentifierForCallProvider:](self, "bundleIdentifierForCallProvider:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v6, "handle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", &stru_1E38A53C8);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      v8 = -[TUCallFilterController containsRestrictedHandle:forBundleIdentifier:performSynchronously:](self, "containsRestrictedHandle:forBundleIdentifier:performSynchronously:", v14, v10, v4);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)callFilterStatusForDialRequest:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[TUCallFilterController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "dialType") == 1 || (objc_msgSend(v4, "isSOS") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v4, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = &stru_1E38A53C8;
    }

    objc_msgSend(v4, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallFilterController bundleIdentifierForCallProvider:](self, "bundleIdentifierForCallProvider:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v13, "filterStatusForAddresses:forBundleIdentifier:", v14, v12);

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)restrictedContacts:(id)a3 callProvider:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[16];
  _BYTE v34[16];
  _BYTE v35[16];
  _BYTE v36[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUCallFilterController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCallFilterController bundleIdentifierForCallProvider:](self, "bundleIdentifierForCallProvider:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v25 = v7;
    v26 = v6;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (!v10)
      goto LABEL_25;
    v11 = v10;
    v12 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "personHandle", v25, v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v14, "personHandle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "value");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = &stru_1E38A53C8;
        }

        -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "filterStatusForAddresses:forBundleIdentifier:", v20, v9);

        switch(v21)
        {
          case 1:
            TUDefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              -[TUCallFilterController restrictedContacts:callProvider:].cold.4((uint64_t)v34, (uint64_t)v14);
            goto LABEL_19;
          case 2:
            TUDefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              -[TUCallFilterController restrictedContacts:callProvider:].cold.3((uint64_t)v35, (uint64_t)v14);
            goto LABEL_19;
          case 3:
            TUDefaultLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              -[TUCallFilterController restrictedContacts:callProvider:].cold.2((uint64_t)v36, (uint64_t)v14);
LABEL_19:

            objc_msgSend(v28, "addObject:", v14);
            goto LABEL_23;
        }
        TUDefaultLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[TUCallFilterController restrictedContacts:callProvider:].cold.1((uint64_t)v33, (uint64_t)v14);

LABEL_23:
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (!v11)
      {
LABEL_25:

        v7 = v25;
        v6 = v26;
        break;
      }
    }
  }

  return v28;
}

- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[TUCallFilterController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "policyForAddresses:forBundleIdentifier:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TUCallFilterController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "containsRestrictedHandle:forBundleIdentifier:performSynchronously:", v7, v6, 0);

  return (char)v8;
}

- (id)addressesToCheckForRestrictionsInConversation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallFilterController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v4, "mergedActiveRemoteParticipants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = v4;
  objc_msgSend(v4, "mergedActiveRemoteParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v14, "handle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "value");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v14, "handle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "value");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = &stru_1E38A53C8;
        }

        objc_msgSend(v8, "addObject:", v18);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v11);
  }

  if (!objc_msgSend(v8, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v31, "mergedRemoteMembers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          objc_msgSend(v24, "handle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "length"))
          {
            objc_msgSend(v24, "handle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "value");
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v28 = &stru_1E38A53C8;
          }

          objc_msgSend(v8, "addObject:", v28);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v21);
    }

  }
  v29 = (void *)objc_msgSend(v8, "copy");

  return v29;
}

- (BOOL)shouldRestrictConversation:(id)a3 performSynchronously:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[TUCallFilterController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[TUCallFilterController addressesToCheckForRestrictionsInConversation:](self, "addressesToCheckForRestrictionsInConversation:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = -[TUCallFilterController shouldRestrictAddresses:performSynchronously:](self, "shouldRestrictAddresses:performSynchronously:", v8, v4);
  return v4;
}

- (BOOL)shouldRestrictAddresses:(id)a3 performSynchronously:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;

  v4 = a4;
  v6 = a3;
  -[TUCallFilterController queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  LOBYTE(v4) = -[TUCallFilterController shouldRestrictAddresses:forBundleIdentifier:performSynchronously:](self, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:", v6, CFSTR("com.apple.facetime"), v4);
  return v4;
}

- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TUCallFilterController queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v11, "containsRestrictedHandle:forBundleIdentifier:performSynchronously:", v9, v8, v5);

  return v5;
}

- (BOOL)shouldRestrictJoinConversationRequest:(id)a3 performSynchronously:(BOOL)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  char v21;
  TUCallFilterController *v23;
  _BOOL4 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v24 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23 = self;
  -[TUCallFilterController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v5, "remoteMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = v5;
  objc_msgSend(v5, "remoteMembers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "handle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          objc_msgSend(v15, "handle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "value");
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = &stru_1E38A53C8;
        }

        objc_msgSend(v9, "addObject:", v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  -[TUCallFilterController actionsDelegate](v23, "actionsDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:", v9, CFSTR("com.apple.facetime"), v24);

  return v21;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[TUCallFilterController queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v11, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:", v9, v8, v5);

  return v5;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  return -[TUCallFilterController shouldRestrictAddresses:forBundleIdentifier:performSynchronously:](self, "shouldRestrictAddresses:forBundleIdentifier:performSynchronously:", a3, a4, 0);
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TUCallFilterController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "willRestrictAddresses:forBundleIdentifier:", v7, v6);

  return (char)v8;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUCallFilterController queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[TUCallFilterController actionsDelegate](self, "actionsDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v12, "isUnknownAddress:normalizedAddress:forBundleIdentifier:", v10, v9, v8);

  return (char)v11;
}

- (id)bundleIdentifierForCallProvider:(id)a3
{
  id v3;
  __CFString **v4;
  __CFString *v5;
  __CFString *v6;

  v3 = a3;
  if (objc_msgSend(v3, "isTelephonyProvider"))
  {
    v4 = TUBundleIdentifierMobilePhoneApplication;
  }
  else
  {
    if (!objc_msgSend(v3, "isFaceTimeProvider"))
    {
      objc_msgSend(v3, "bundleIdentifier");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v4 = TUBundleIdentifierFaceTimeApplication;
  }
  v5 = *v4;
LABEL_7:
  v6 = v5;

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUCallFilterControllerActions)actionsDelegate
{
  return (TUCallFilterControllerActions *)objc_loadWeakRetained((id *)&self->_actionsDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_3(&dword_19A50D000, v4, v5, "Member with handle (%@) doesn't have a restricted status");

  OUTLINED_FUNCTION_1_3();
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_3(&dword_19A50D000, v4, v5, "Member with handle (%@) has a restricted status");

  OUTLINED_FUNCTION_1_3();
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_3(&dword_19A50D000, v4, v5, "Member with handle (%@) has a status limited by downtime");

  OUTLINED_FUNCTION_1_3();
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "personHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_3(&dword_19A50D000, v4, v5, "Member with handle (%@) has a status limited by screentime");

  OUTLINED_FUNCTION_1_3();
}

@end
