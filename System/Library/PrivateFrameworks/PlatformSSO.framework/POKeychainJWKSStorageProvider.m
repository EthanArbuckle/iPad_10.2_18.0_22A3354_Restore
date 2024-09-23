@implementation POKeychainJWKSStorageProvider

- (POKeychainJWKSStorageProvider)init
{
  return -[POKeychainJWKSStorageProvider initWithSystem:](self, "initWithSystem:", 0);
}

- (POKeychainJWKSStorageProvider)initWithSystem:(BOOL)a3
{
  POKeychainJWKSStorageProvider *v4;
  POKeychainJWKSStorageProvider *v5;
  POKeychainHelper *v6;
  POKeychainHelper *keychainHelper;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)POKeychainJWKSStorageProvider;
  v4 = -[POKeychainJWKSStorageProvider init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isSystem = a3;
    v6 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x24BE72ED8]);
    keychainHelper = v5->_keychainHelper;
    v5->_keychainHelper = v6;

  }
  return v5;
}

- (id)jwksCacheForExtensionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POKeychainJWKSStorageProvider jwksCacheForExtensionIdentifier:].cold.1();

  -[POKeychainJWKSStorageProvider keychainHelper](self, "keychainHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "retrieveTokensFromKeychainForService:username:returningTokens:metaData:", v4, CFSTR("com.apple.jwksCache"), &v12, 0);

  v8 = v12;
  if (v7)
  {
    v9 = __65__POKeychainJWKSStorageProvider_jwksCacheForExtensionIdentifier___block_invoke();
    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

id __65__POKeychainJWKSStorageProvider_jwksCacheForExtensionIdentifier___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("JWKS data not found in cache."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)setJwksCache:(id)a3 forExtensionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  int v13;
  id v14;

  v6 = a3;
  v7 = a4;
  PO_LOG_POConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POKeychainJWKSStorageProvider setJwksCache:forExtensionIdentifier:].cold.1();

  -[POKeychainJWKSStorageProvider keychainHelper](self, "keychainHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    v11 = objc_msgSend(v9, "addTokens:metaData:toKeychainForService:username:system:", v6, 0, v7, CFSTR("com.apple.jwksCache"), -[POKeychainJWKSStorageProvider isSystem](self, "isSystem"));

    if (v11)
      v12 = __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke();
  }
  else
  {
    v13 = objc_msgSend(v9, "removeTokensFromKeychainWithService:username:", v7, CFSTR("com.apple.jwksCache"));

    if (v13 != -25300 && v13)
      v14 = __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke_8();
  }

}

id __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save JWKS data in cache."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __69__POKeychainJWKSStorageProvider_setJwksCache_forExtensionIdentifier___block_invoke_8()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Error removing jwks data from cache"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isSystem
{
  return self->_isSystem;
}

- (void)setIsSystem:(BOOL)a3
{
  self->_isSystem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
}

- (void)jwksCacheForExtensionIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setJwksCache:forExtensionIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
