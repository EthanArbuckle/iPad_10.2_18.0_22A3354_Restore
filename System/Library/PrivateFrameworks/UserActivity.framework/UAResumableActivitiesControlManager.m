@implementation UAResumableActivitiesControlManager

+ (id)resumableActivitiesControlManager
{
  return objc_alloc_init(UAResumableActivitiesControlManager);
}

- (UAResumableActivitiesControlManager)init
{
  UAResumableActivitiesControlManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v9[4];
  UAResumableActivitiesControlManager *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UAResumableActivitiesControlManager;
  v2 = -[UAResumableActivitiesControlManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    UAResumableActivitiesManagerServiceName();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithMachServiceName:options:", v4, 0);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v5;

    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", 0);
    -[NSXPCConnection setExportedObject:](v2->connection, "setExportedObject:", v2);
    _LSGetResumableActivitiesAdministrativeProtocolInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection setInterruptionHandler:](v2->connection, "setInterruptionHandler:", &__block_literal_global_2);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__UAResumableActivitiesControlManager_init__block_invoke_2;
    v9[3] = &unk_1E6007310;
    v10 = v2;
    -[NSXPCConnection setInvalidationHandler:](v2->connection, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](v2->connection, "resume");

  }
  return v2;
}

uint64_t __43__UAResumableActivitiesControlManager_init__block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (int)serverPID
{
  UAResumableActivitiesControlManager *v2;
  int v3;
  void *v4;
  UAResumableActivitiesControlManager *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v2 = self;
  objc_sync_enter(v2);
  *((_DWORD *)v9 + 6) = v2->_pid;
  objc_sync_exit(v2);

  v3 = *((_DWORD *)v9 + 6);
  if (!v3)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v2->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__UAResumableActivitiesControlManager_serverPID__block_invoke_7;
    v7[3] = &unk_1E6007358;
    v7[4] = v2;
    v7[5] = &v8;
    objc_msgSend(v4, "doNOP:withCompletionHandler:", CFSTR("serverPID"), v7);

    v5 = v2;
    objc_sync_enter(v5);
    v2->_pid = *((_DWORD *)v9 + 6);
    objc_sync_exit(v5);

    v3 = *((_DWORD *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __48__UAResumableActivitiesControlManager_serverPID__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_ERROR, "Error from server, %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __48__UAResumableActivitiesControlManager_serverPID__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "processIdentifier");
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67240706;
    v10[1] = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_INFO, "Connected to server, pid=%{public}d connection=%{public}@ error=%{public}@", (uint8_t *)v10, 0x1Cu);

  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v9, "processIdentifier");

}

- (id)matchingUUIDForString:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  v6 = (void *)v14[5];
  v14[5] = v5;

  if (!v14[5])
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__UAResumableActivitiesControlManager_matchingUUIDForString___block_invoke_2;
    v12[3] = &unk_1E60073A0;
    v12[4] = &v13;
    objc_msgSend(v7, "doFindMatchingUserActivityForString:withCompletionHandler:", v4, v12);

  }
  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = v14[5];
    *(_DWORD *)buf = 138478083;
    v20 = v4;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "(%{private}@), result = %{public}@", buf, 0x16u);
  }

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __61__UAResumableActivitiesControlManager_matchingUUIDForString___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)advertisedItemUUID
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__UAResumableActivitiesControlManager_advertisedItemUUID__block_invoke_2;
  v7[3] = &unk_1E60073A0;
  v7[4] = &v8;
  objc_msgSend(v2, "doCopyAdvertisedUUIDWithCompletionHandler:", v7);

  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = v9[5];
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "result=%{public}@", buf, 0xCu);
  }

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __57__UAResumableActivitiesControlManager_advertisedItemUUID__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)allUUIDsOfType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  _uaGetLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    suggestedActionTypeString(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v21 = a3;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1AF7EB000, v5, OS_LOG_TYPE_DEBUG, "(%d/%{public}@)", buf, 0x12u);

  }
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__UAResumableActivitiesControlManager_allUUIDsOfType___block_invoke_2;
  v13[3] = &unk_1E60073E8;
  v13[4] = &v14;
  objc_msgSend(v7, "doCopyAllUUIDsOfType:withCompletionHandler:", a3, v13);

  _uaGetLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    suggestedActionTypeString(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15[5];
    *(_DWORD *)buf = 67109634;
    v21 = a3;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1AF7EB000, v8, OS_LOG_TYPE_DEBUG, "(%d/%{public}@), result=%{public}@", buf, 0x1Cu);

  }
  v11 = (void *)objc_msgSend((id)v15[5], "copy");
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __54__UAResumableActivitiesControlManager_allUUIDsOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)enabledUUIDs
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__UAResumableActivitiesControlManager_enabledUUIDs__block_invoke_2;
  v5[3] = &unk_1E60073E8;
  v5[4] = &v6;
  objc_msgSend(v2, "doCopyEnabledUUIDsWithCompletionHandler:", v5);

  v3 = (void *)objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__UAResumableActivitiesControlManager_enabledUUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)currentAdvertisedItemUUID
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__UAResumableActivitiesControlManager_currentAdvertisedItemUUID__block_invoke_2;
  v5[3] = &unk_1E60073A0;
  v5[4] = &v6;
  objc_msgSend(v2, "doGetCurrentAdvertisedItemUUID:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __64__UAResumableActivitiesControlManager_currentAdvertisedItemUUID__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)debuggingInfo
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__UAResumableActivitiesControlManager_debuggingInfo__block_invoke_2;
  v5[3] = &unk_1E6007450;
  v5[4] = &v6;
  objc_msgSend(v2, "doCopyDebuggingInfo:completionHandler:", 0, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__UAResumableActivitiesControlManager_debuggingInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)dynamicUserActivities
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_19);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__UAResumableActivitiesControlManager_dynamicUserActivities__block_invoke_2;
  v5[3] = &unk_1E6007498;
  v5[4] = &v6;
  objc_msgSend(v2, "doCopyDynamicUserActivitiesString:completionHandler:", 0, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __60__UAResumableActivitiesControlManager_dynamicUserActivities__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)status
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_21);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__UAResumableActivitiesControlManager_status__block_invoke_2;
  v5[3] = &unk_1E6007498;
  v5[4] = &v6;
  objc_msgSend(v2, "doCopyStatusString:options:completionHandler:", CFSTR("status"), 0, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__UAResumableActivitiesControlManager_status__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)recentActions:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v3 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v5 = MEMORY[0x1E0C9AAB0];
  else
    v5 = MEMORY[0x1E0C9AAA0];
  v16 = CFSTR("clear");
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__UAResumableActivitiesControlManager_recentActions___block_invoke_2;
  v9[3] = &unk_1E60073E8;
  v9[4] = &v10;
  objc_msgSend(v4, "doCopyRecentActions:completionHandler:", v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __53__UAResumableActivitiesControlManager_recentActions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)simulatorStatus
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_28);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__UAResumableActivitiesControlManager_simulatorStatus__block_invoke_2;
  v5[3] = &unk_1E6007498;
  v5[4] = &v6;
  objc_msgSend(v2, "doCopyStatusString:options:completionHandler:", CFSTR("simulatorStatus"), 0, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__UAResumableActivitiesControlManager_simulatorStatus__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)status:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__UAResumableActivitiesControlManager_status_options___block_invoke_2;
  v11[3] = &unk_1E6007498;
  v11[4] = &v12;
  objc_msgSend(v8, "doCopyStatusString:options:completionHandler:", v6, v7, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __54__UAResumableActivitiesControlManager_status_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)fetchMoreAppSuggestions
{
  id v2;

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_32_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doFetchMoreAppSuggestions");

}

- (id)defaults:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__UAResumableActivitiesControlManager_defaults___block_invoke_2;
  v7[3] = &unk_1E6007520;
  v7[4] = &v8;
  objc_msgSend(v4, "doCopyDefaults:completionHandler:", v3, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__UAResumableActivitiesControlManager_defaults___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)setDefault:(id)a3 value:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  void *v8;
  id v9;

  connection = self->connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doSetDefaults:archivedValue:", v7, v8);
}

- (void)restartServer
{
  id v3;

  -[UAResumableActivitiesControlManager terminateServer](self, "terminateServer");
  sleep(1u);
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doNOP:withCompletionHandler:", CFSTR("Hello, world!"), &__block_literal_global_39);

}

- (void)terminateServer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];
  uint8_t buf[16];

  _uaGetLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF7EB000, v3, OS_LOG_TYPE_DEBUG, "Asking useractivityd server to exit.", buf, 2u);
  }

  v4 = dispatch_group_create();
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__UAResumableActivitiesControlManager_terminateServer__block_invoke;
  block[3] = &unk_1E6007310;
  block[4] = self;
  dispatch_group_async(v4, v5, block);

  v6 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v4, v6);

}

void __54__UAResumableActivitiesControlManager_terminateServer__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_40);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doTerminateServer");

}

- (void)setDebugOption:(id)a3 value:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doSetDebugOption:value:", v7, v6);

}

- (void)injectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11
{
  NSXPCConnection *connection;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  connection = self->connection;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doInjectBTLEItem:type:identifier:title:activityPayload:webPageURL:remoteModel:duration:payloadDelay:", v25, a4, v24, v23, v22, v21, a10, a11, v20);

}

- (void)callWillSaveDelegate:(id)a3 completionHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doWillSaveDelegate:completionHandler:", v7, v6);

}

- (void)connectToRemote:(id)a3 port:(int64_t)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;

  connection = self->connection;
  v6 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doSetupNetworkedPairs:port:", v6, a4);

}

- (void)rendevous:(id)a3 domain:(id)a4 active:(BOOL)a5
{
  _BOOL8 v5;
  NSXPCConnection *connection;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  connection = self->connection;
  v8 = a4;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doSetupRendevous:domain:activate:", v9, v8, v5);

}

- (void)peerDevices:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__UAResumableActivitiesControlManager_peerDevices_completionHandler___block_invoke;
  v11[3] = &unk_1E60075A8;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doGetPairedDevices:completionHandler:", v9, v8);

}

void __69__UAResumableActivitiesControlManager_peerDevices_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -1, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

- (id)getSysdiagnoseStringsIncludingPrivateData:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v3 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
  UAResumableActivitiesManagerServiceName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithMachServiceName:options:", v7, 0);

  objc_msgSend(v8, "setRemoteObjectInterface:", 0);
  objc_msgSend(v8, "setExportedObject:", self);
  _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  objc_msgSend(v8, "setInterruptionHandler:", &__block_literal_global_43);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_2;
  v23[3] = &unk_1E6007310;
  v23[4] = self;
  objc_msgSend(v8, "setInvalidationHandler:", v23);
  objc_msgSend(v8, "resume");
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_3;
  v20[3] = &unk_1E60075F0;
  v22 = &v24;
  v11 = v5;
  v21 = v11;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_4;
  v17[3] = &unk_1E6007618;
  v19 = &v24;
  v13 = v11;
  v18 = v13;
  objc_msgSend(v12, "doGetSysdiagnoseStringsIncludingPrivateData:completionHandler:", v3, v17);

  if (dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL))
    v14 = 0;
  else
    v14 = (void *)v25[5];
  v15 = v14;

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

void __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)replayCommands:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__UAResumableActivitiesControlManager_replayCommands_completionHandler___block_invoke;
  v11[3] = &unk_1E60075A8;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doReplayCommands:completionHandler:", v9, v8);

}

uint64_t __72__UAResumableActivitiesControlManager_replayCommands_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)synchronize
{
  id v2;

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_45);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doNOP:withCompletionHandler:", CFSTR("synchronize"), &__block_literal_global_48);

}

- (void)setLocalReflect:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_49);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doSetLocalPasteboardReflection:", v3);

}

void __55__UAResumableActivitiesControlManager_setLocalReflect___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Error: %@"), a2);
}

- (BOOL)getAdvertisedBytes:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  connection = self->connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__UAResumableActivitiesControlManager_getAdvertisedBytes_completionHandler___block_invoke;
  v12[3] = &unk_1E60075A8;
  v13 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doGetSFActivityAdvertisement:completionHandler:", v9, v8);

  return 1;
}

uint64_t __76__UAResumableActivitiesControlManager_getAdvertisedBytes_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int)recordingPath
{
  return self->_recordingPath;
}

- (void)setRecordingPath:(int)a3
{
  self->_recordingPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connection, 0);
}

@end
