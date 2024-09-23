@implementation SYBacklinkIndicatorUsage

+ (NSXPCListenerEndpoint)_listenerEndpoint
{
  return (NSXPCListenerEndpoint *)(id)__listenerEndpoint;
}

+ (void)set_listenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&__listenerEndpoint, a3);
}

+ (id)_proxyWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  objc_msgSend(a1, "_listenerEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v7 = v6;
  if (v5)
  {
    objc_msgSend(a1, "_listenerEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithListenerEndpoint:", v8);

  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "initWithMachServiceName:options:", CFSTR("com.apple.synapse.backlink-indicator-usage"), 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF497818);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v10);

  objc_msgSend(v9, "resume");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke;
  v13[3] = &unk_1E757B6C0;
  v13[4] = &v14;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  v4 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

+ (void)didActivateBacklinkItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v7 = 0;
  objc_msgSend(a1, "_proxyWithError:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v7)
    objc_msgSend(v5, "didActivateBacklinkItemWithIdentifier:", v4);

}

+ (id)_identifierFromUserActivity:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  objc_msgSend(v3, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.notes.activity.edit-note")))
  {
    objc_msgSend(v3, "userInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:](v5, "objectForKey:", CFSTR("uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
      if (v7)
      {
LABEL_12:

        goto LABEL_13;
      }
      v8 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SYBacklinkIndicatorUsage _identifierFromUserActivity:].cold.2((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
    else
    {
      v8 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SYBacklinkIndicatorUsage _identifierFromUserActivity:].cold.1((uint64_t)v5, v8, v21, v22, v23, v24, v25, v26);
    }

    v7 = 0;
    goto LABEL_12;
  }
  v5 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SYBacklinkIndicatorUsage _identifierFromUserActivity:].cold.3((uint64_t)v4, v5, v15, v16, v17, v18, v19, v20);
  v7 = 0;
LABEL_13:

  return v7;
}

+ (void)didActivateBacklinkItemWithUserActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "_identifierFromUserActivity:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = 0;
    objc_msgSend(a1, "_proxyWithError:", &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v7)
      objc_msgSend(v5, "didActivateBacklinkItemWithIdentifier:", v4);

  }
}

+ (void)didDismissBacklinkItemWithUserActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "_identifierFromUserActivity:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = 0;
    objc_msgSend(a1, "_proxyWithError:", &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v7)
      objc_msgSend(v5, "didDismissBacklinkItemWithIdentifier:", v4);

  }
}

void __44__SYBacklinkIndicatorUsage__proxyWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Error creating remote object for backlink usage: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_identifierFromUserActivity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Failed to retrieve identifier from userInfo: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_identifierFromUserActivity:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Failed to create NSUUID from userActivity identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_identifierFromUserActivity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BCC38000, a2, a3, "Received userActivity with invalid activityType: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
