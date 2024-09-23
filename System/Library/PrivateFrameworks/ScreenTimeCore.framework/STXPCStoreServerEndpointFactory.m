@implementation STXPCStoreServerEndpointFactory

- (id)newEndpoint
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v2 = (void *)objc_opt_new();
  v13 = 0;
  objc_msgSend(v2, "startCoreDataServerWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (!v3)
  {
    +[STLog persistence](STLog, "persistence");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[STXPCStoreServerEndpointFactory newEndpoint].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v3;
}

- (void)newEndpoint
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Error getting endpoint for CoreData server: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
