@implementation WebBookmarksSettingsGateway

- (WebBookmarksSettingsGateway)init
{
  WebBookmarksSettingsGateway *v2;
  WebBookmarksSettingsGateway *v3;
  WebBookmarksSettingsGateway *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WebBookmarksSettingsGateway;
  v2 = -[WebBookmarksSettingsGateway init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WebBookmarksSettingsGateway _setupConnection](v2, "_setupConnection");
    v4 = v3;
  }

  return v3;
}

- (void)_setupConnection
{
  WebBookmarksXPCConnection *v3;
  WebBookmarksXPCConnection *v4;
  WebBookmarksXPCConnection *connection;

  v3 = [WebBookmarksXPCConnection alloc];
  v4 = -[WebBookmarksXPCConnection initClientForMachService:](v3, "initClientForMachService:", kWebBookmarksdServiceName);
  connection = self->_connection;
  self->_connection = v4;

  -[WebBookmarksXPCConnection setDelegate:](self->_connection, "setDelegate:", self);
}

- (void)getSafariWebDataUsageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  WebBookmarksXPCConnection *connection;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksGetSafariWebDataUsageMessageName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for website data from webbookmarksd.", buf, 2u);
  }
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke;
  v9[3] = &unk_24CB35008;
  v10 = v4;
  v8 = v4;
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](connection, "sendMessage:withReplyHandler:", v5, v9);

}

void __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD applier[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_cold_1(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_dictionary_get_value(v5, kWebsiteDataAllRecordsKey);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_2;
      applier[3] = &unk_24CB34FE0;
      v14 = v8;
      xpc_array_apply(v9, applier);

    }
    v10 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v16 = v12;
      _os_log_impl(&dword_211022000, v11, OS_LOG_TYPE_DEFAULT, "Parsed %zu data records from webbookmarksd.", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  +[WBWebsiteDataRecord websiteDataRecordFromXPCDictionary:](WBWebsiteDataRecord, "websiteDataRecordFromXPCDictionary:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

- (void)deleteAllSafariSecurityOriginsForProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  xpc_object_t v13;
  WebBookmarksXPCConnection *connection;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_INFO, "Sending XPC message to delete all Website data", buf, 2u);
  }
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksDeleteAllSafariWebSecurityOriginsMessageName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = xpc_array_create(0, 0);
  v11 = objc_retainAutorelease(v7);
  v12 = (const char *)objc_msgSend(v11, "UTF8String");

  v13 = xpc_string_create(v12);
  xpc_array_append_value(v10, v13);

  xpc_dictionary_set_value(v9, kWebsiteProfileIdentifiersKey, v10);
  connection = self->_connection;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_24CB35008;
  v17 = v6;
  v15 = v6;
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](connection, "sendMessage:withReplyHandler:", v9, v16);

}

void __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke_cold_1(v7);
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete all website data", v10, 2u);
      }
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

}

- (void)deleteSafariWebsiteDataRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  WebBookmarksXPCConnection *connection;
  char *v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  WebBookmarksXPCConnection *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  connection = self->_connection;
  v8 = kWebBookmarksDeleteSafariWebSecurityOriginMessageName;
  v9 = a3;
  -[WebBookmarksXPCConnection messageWithName:](connection, "messageWithName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = kWebsiteDataRecordKey;
  objc_msgSend(v9, "XPCDictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_value(v10, v11, v12);
  v13 = self->_connection;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke;
  v15[3] = &unk_24CB35008;
  v16 = v6;
  v14 = v6;
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](v13, "sendMessage:withReplyHandler:", v10, v15);

}

void __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke_cold_1(v7);
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete individual website data", v10, 2u);
      }
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

}

- (void)deleteSafariPersistentURLCacheStorageWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  WebBookmarksXPCConnection *connection;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksDeleteSafariPersistentURLCacheStorageMessageName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke;
  v8[3] = &unk_24CB35008;
  v9 = v4;
  v7 = v4;
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](connection, "sendMessage:withReplyHandler:", v5, v8);

}

void __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke_cold_1(v7);
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete persistent URL cache storage", v10, 2u);
      }
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

}

- (void)getSafariDataUsageByteCountWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  WebBookmarksXPCConnection *connection;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksGetSafariDataUsageSummaryMessageName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__WebBookmarksSettingsGateway_getSafariDataUsageByteCountWithCompletionHandler___block_invoke;
  v8[3] = &unk_24CB35008;
  v9 = v4;
  v7 = v4;
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](connection, "sendMessage:withReplyHandler:", v5, v8);

}

uint64_t __80__WebBookmarksSettingsGateway_getSafariDataUsageByteCountWithCompletionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (xdict)
    xdict = (xpc_object_t)xpc_dictionary_get_uint64(xdict, kWebDataUsageSizeKey);
  return (*(uint64_t (**)(uint64_t, xpc_object_t))(v2 + 16))(v2, xdict);
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 profileIdentifiers:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  xpc_object_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  xpc_object_t v27;
  WebBookmarksXPCConnection *connection;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksClearHistoryMessageName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = kWebsiteStartDateKey;
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(v16, v17, v18);
  v19 = kWebsiteEndDateKey;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  xpc_dictionary_set_double(v16, v19, v20);
  xpc_dictionary_set_int64(v16, kWebsiteOptionsKey, a6);
  if (v14)
  {
    v30 = v13;
    v31 = v12;
    v21 = xpc_array_create(0, 0);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          v27 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v26)), "UTF8String"));
          xpc_array_append_value(v21, v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v24);
    }

    xpc_dictionary_set_value(v16, kWebsiteProfileIdentifiersKey, v21);
    v13 = v30;
    v12 = v31;
  }
  connection = self->_connection;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __120__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_completionHandler___block_invoke;
  v32[3] = &unk_24CB35008;
  v33 = v15;
  v29 = v15;
  -[WebBookmarksXPCConnection sendMessage:withReplyHandler:](connection, "sendMessage:withReplyHandler:", v16, v32);

}

void __120__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __120__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_completionHandler___block_invoke_cold_1(v7);
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_211022000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete Safari's history", v10, 2u);
      }
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);

}

- (void)scheduleBookmarksDatabaseMaintenance
{
  id v3;

  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", webBookmarksScheduleBookmarksDatabaseMaintenanceTask);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

}

- (void)scheduleBookmarksDatabaseMigrationTask
{
  id v3;

  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", webBookmarksScheduleBookmarksDatabaseMigrationTask);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

}

- (void)scheduleHSTSSuperCookieCleanup
{
  id v3;

  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", kWebBookmarksClearHSTSSuperCookiesMessageName);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

}

- (void)schedulePasswordIconsCleanup
{
  id v3;

  -[WebBookmarksXPCConnection messageWithName:](self->_connection, "messageWithName:", webBookmarksPasswordIconsCleanupMessageName);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarksXPCConnection sendMessage:](self->_connection, "sendMessage:", v3);

}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v5, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_INFO, "Settings gateway connection closed with error: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[WebBookmarksSettingsGateway _setupConnection](self, "_setupConnection");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v3, v4, "Error obtaining website data from webbookmarksd: %{public}@.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

void __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "wb_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v3, v4, "Error encountered while delivering XPC message to delete all website data. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

void __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "wb_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v3, v4, "Error encountered while delivering XPC message to delete individual website data. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

void __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "wb_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v3, v4, "Error encountered while delivering XPC message to delete persistent URL cache storage. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

void __120__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_8(), "wb_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_4(&dword_211022000, v3, v4, "Error encountered while delivering XPC message to delete Safari's history. Error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3_0();
}

@end
