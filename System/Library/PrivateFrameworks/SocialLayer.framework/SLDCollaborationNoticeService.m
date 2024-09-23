@implementation SLDCollaborationNoticeService

+ (id)remoteObjectProtocol
{
  return &unk_1EE39BB08;
}

+ (id)sharedService
{
  if (sharedService_onceToken_6 != -1)
    dispatch_once(&sharedService_onceToken_6, &__block_literal_global_16);
  return (id)sharedService_sService_6;
}

void __46__SLDCollaborationNoticeService_sharedService__block_invoke()
{
  SLDCollaborationNoticeService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDCollaborationNoticeService);
  v1 = (void *)sharedService_sService_6;
  sharedService_sService_6 = (uint64_t)v0;

}

- (void)sendClearNoticesFor:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)getIMCollaborationClearTransmissionClass());
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v11, "initWithCollaborationId:date:guidString:", v10, v12, v14);

  -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:](self, "_sendClearNoticesTransmission:forAttributionIdentifiers:reply:", v15, v9, v8);
}

- (void)sendHighlightEventData:(id)a3 eventType:(int64_t)a4 forAttributionIdentifiers:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc((Class)getIMCollaborationNoticeTransmissionClass());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v13, "initWithEventData:eventType:guidString:date:", v12, a4, v15, v16);

  -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:](self, "_send:forAttributionIdentifiers:reply:", v17, v11, v10);
}

- (void)_sendClearNoticesTransmission:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SLDCollaborationNoticeService _connShouldUnrestrictHighlightLookup:](self, "_connShouldUnrestrictHighlightLookup:", v11))
  {
    v12 = CFSTR("accessibility");
  }
  else
  {
    -[SLDCollaborationNoticeService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!getIMCollaborationNoticeDispatcherClass()
    || !getIMCollaborationClearTransmissionClass()
    || (objc_msgSend(getIMCollaborationClearTransmissionClass(), "instancesRespondToSelector:", sel_initWithCollaborationId_date_guidString_) & 1) == 0)
  {
    SLDaemonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:].cold.3();

    v10[2](v10, 0);
  }
  -[SLDCollaborationNoticeService _handlesForAttributionIdentifiers:appID:](self, "_handlesForAttributionIdentifiers:appID:", v9, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:].cold.1();
    goto LABEL_17;
  }
  if (!objc_msgSend(getIMCollaborationNoticeDispatcherClass(), "instancesRespondToSelector:", sel_sendClearNotice_toHandles_completion_))
  {
    SLDaemonLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:].cold.2();
LABEL_17:

    v10[2](v10, 0);
    goto LABEL_18;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke;
  block[3] = &unk_1E3795A70;
  block[4] = self;
  v17 = v8;
  v18 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v10[2](v10, 1);

LABEL_18:
}

void __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 134218498;
    v17 = v5;
    v18 = 2080;
    v19 = "-[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]_block_invoke";
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] posting clear notice to imagent. Request UUID: %@", buf, 0x20u);
  }

  v6 = objc_alloc_init((Class)getIMCollaborationNoticeDispatcherClass());
  v7 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke_55;
  v12[3] = &unk_1E3795DC8;
  v9 = a1[4];
  v13 = v6;
  v14 = v9;
  v15 = v3;
  v10 = v3;
  v11 = v6;
  objc_msgSend(v11, "sendClearNotice:toHandles:completion:", v7, v8, v12);

}

void __95__SLDCollaborationNoticeService__sendClearNoticesTransmission_forAttributionIdentifiers_reply___block_invoke_55(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disconnectFromDaemon");
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    if (a2)
      v5 = CFSTR("YES");
    v8 = 134218754;
    v9 = v6;
    v10 = 2080;
    v11 = "-[SLDCollaborationNoticeService _sendClearNoticesTransmission:forAttributionIdentifiers:reply:]_block_invoke";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] post clear notice completion success: %@ request UUID: %@", (uint8_t *)&v8, 0x2Au);
  }

}

- (void)_send:(id)a3 forAttributionIdentifiers:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SLDCollaborationNoticeService _connShouldUnrestrictHighlightLookup:](self, "_connShouldUnrestrictHighlightLookup:", v11))
  {
    v12 = CFSTR("accessibility");
  }
  else
  {
    -[SLDCollaborationNoticeService _applicationIdentifierForConnection:](self, "_applicationIdentifierForConnection:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!getIMCollaborationNoticeDispatcherClass()
    || !getIMCollaborationNoticeTransmissionClass()
    || (objc_msgSend(getIMCollaborationNoticeTransmissionClass(), "instancesRespondToSelector:", sel_initWithEventData_eventType_guidString_date_) & 1) == 0)
  {
    SLDaemonLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:].cold.3();

    v10[2](v10, 0);
  }
  v14 = (void *)MEMORY[0x1E0C99E60];
  -[SLDCollaborationNoticeService _handlesForAttributionIdentifiers:appID:](self, "_handlesForAttributionIdentifiers:appID:", v9, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    SLDaemonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:].cold.1();
    goto LABEL_17;
  }
  if (!objc_msgSend(getIMCollaborationNoticeDispatcherClass(), "instancesRespondToSelector:", sel_sendNotice_toHandles_completion_))
  {
    SLDaemonLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:].cold.2();
LABEL_17:

    v10[2](v10, 0);
    goto LABEL_18;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke;
  block[3] = &unk_1E3795A70;
  block[4] = self;
  v19 = v8;
  v20 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v10[2](v10, 1);

LABEL_18:
}

void __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 134218498;
    v17 = v5;
    v18 = 2080;
    v19 = "-[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]_block_invoke";
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] posting notice to imagent. Request UUID: %@", buf, 0x20u);
  }

  v6 = objc_alloc_init((Class)getIMCollaborationNoticeDispatcherClass());
  v8 = a1[5];
  v7 = a1[6];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke_65;
  v12[3] = &unk_1E3795DC8;
  v9 = a1[4];
  v13 = v6;
  v14 = v9;
  v15 = v3;
  v10 = v3;
  v11 = v6;
  objc_msgSend(v11, "sendNotice:toHandles:completion:", v8, v7, v12);

}

void __71__SLDCollaborationNoticeService__send_forAttributionIdentifiers_reply___block_invoke_65(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "disconnectFromDaemon");
  SLDaemonLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    if (a2)
      v5 = CFSTR("YES");
    v8 = 134218754;
    v9 = v6;
    v10 = 2080;
    v11 = "-[SLDCollaborationNoticeService _send:forAttributionIdentifiers:reply:]_block_invoke";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationNoticeService: %p][%s] post notice completion success: %@ request UUID: %@", (uint8_t *)&v8, 0x2Au);
  }

}

- (id)_handlesForAttributionIdentifiers:(id)a3 appID:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v21;
  id obj;
  SLHighlightCenter *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  v23 = -[SLHighlightCenter initWithAppIdentifier:]([SLHighlightCenter alloc], "initWithAppIdentifier:", v21);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        -[SLHighlightCenter fetchAttributionForAttributionIdentifier:](v23, "fetchAttributionForAttributionIdentifier:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v11, "relatedPersons");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "handle");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v18);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v15);
          }

        }
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  v19 = (void *)objc_msgSend(v6, "copy");
  return v19;
}

- (BOOL)_connShouldUnrestrictHighlightLookup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v14;
  uint8_t buf[4];
  SLDCollaborationNoticeService *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D87D68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "handleForIdentifier:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (v9)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v16 = self;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v8;
      _os_log_error_impl(&dword_199EFF000, v10, OS_LOG_TYPE_ERROR, "[SLDCollaborationNoticeService: %p] failed to look up a process handle for: %@ error: %@", buf, 0x20u);
    }
    v12 = 0;
  }
  else
  {
    objc_msgSend(v7, "bundle");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject identifier](v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.SafariBookmarksSyncAgent"));

  }
  return v12;
}

- (id)_applicationIdentifierForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v13;
  _OWORD v14[2];

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CA5898];
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v14, 0, sizeof(v14));
  v13 = 0;
  objc_msgSend(v6, "bundleRecordForAuditToken:error:", v14, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLDaemonLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SLDCollaborationNoticeService _applicationIdentifierForConnection:].cold.1((uint64_t)self, (uint64_t)v8, v10);

  }
  objc_msgSend(v7, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_sendClearNoticesTransmission:forAttributionIdentifiers:reply:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_1(&dword_199EFF000, v0, (uint64_t)v0, "[SLDCollaborationNoticeService: %p][%s] Didn't find any handles for attribution identifiers '%@' Bailing.", v1);
}

- (void)_sendClearNoticesTransmission:forAttributionIdentifiers:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_199EFF000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Notice dispatch class doesn't respond to the expected selector.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_sendClearNoticesTransmission:forAttributionIdentifiers:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_199EFF000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Missing notice dispatch and/or notice transmission classes from IMCore/IMSharedUtilities. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_send:forAttributionIdentifiers:reply:.cold.1()
{
  NSObject *v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_1(&dword_199EFF000, v0, (uint64_t)v0, "[SLDCollaborationNoticeService: %p][%s] Didn't find any handles for attribution identifiers '%@' Bailing.", v1);
}

- (void)_send:forAttributionIdentifiers:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_199EFF000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Notice dispatch class doesn't respond to the expected selector.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_send:forAttributionIdentifiers:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_6(&dword_199EFF000, v0, v1, "[SLDCollaborationNoticeService: %p][%s] Missing notice dispatch and/or notice transmission classes from IMCore/IMSharedUtilities. Bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_applicationIdentifierForConnection:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v7;
  v11 = 2048;
  v12 = a1;
  v13 = 2112;
  v14 = a2;
  OUTLINED_FUNCTION_2_1(&dword_199EFF000, a3, v8, "[%@: %p] Failed to generate a bundle record, or the record's app ID is nil. This is required to look up attribution data. Error: %@", (uint8_t *)&v9);

}

@end
