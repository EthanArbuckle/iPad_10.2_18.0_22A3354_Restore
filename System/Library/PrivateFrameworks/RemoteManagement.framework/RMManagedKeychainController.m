@implementation RMManagedKeychainController

+ (id)newManagedKeychainControllerForScope:(int64_t)a3 personaID:(id)a4
{
  id v5;
  RMManagedKeychainController *v6;

  v5 = a4;
  v6 = -[RMManagedKeychainController initWithScope:personaID:]([RMManagedKeychainController alloc], "initWithScope:personaID:", a3, v5);

  return v6;
}

- (RMManagedKeychainController)initWithScope:(int64_t)a3 personaID:(id)a4
{
  id v7;
  RMManagedKeychainController *v8;
  RMManagedKeychainController *v9;
  NSObject *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMManagedKeychainController;
  v8 = -[RMManagedKeychainController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_scope = a3 == 1;
    objc_storeStrong((id *)&v8->_personaID, a4);
    +[RMLog managedKeychainController](RMLog, "managedKeychainController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[RMManagedKeychainController initWithScope:personaID:].cold.1((uint64_t)v7, a3, v10);

  }
  return v9;
}

+ (RMSharedLock)lock
{
  if (lock_onceToken != -1)
    dispatch_once(&lock_onceToken, &__block_literal_global_11);
  return (RMSharedLock *)(id)lock_lock;
}

void __35__RMManagedKeychainController_lock__block_invoke()
{
  id v0;
  void *v1;

  v0 = +[RMSharedLock newSharedLockWithDescription:](RMSharedLock, "newSharedLockWithDescription:", CFSTR("RMManagedKeychainController-internal"));
  v1 = (void *)lock_lock;
  lock_lock = (uint64_t)v0;

}

+ (RMSharedLock)modifierLock
{
  if (modifierLock_onceToken != -1)
    dispatch_once(&modifierLock_onceToken, &__block_literal_global_15);
  return (RMSharedLock *)(id)modifierLock_lock;
}

void __43__RMManagedKeychainController_modifierLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = +[RMSharedLock newSharedLockWithDescription:](RMSharedLock, "newSharedLockWithDescription:", CFSTR("RMManagedKeychainController-modifier"));
  v1 = (void *)modifierLock_lock;
  modifierLock_lock = (uint64_t)v0;

}

- (void)lockBeforeModifyingKeychain
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "Lock modifier lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)unlockAfterModifyingKeychain
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "Unlock modifier lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (BOOL)hasDataForAssetKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController hasDataForAssetKey:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v7, "hasAssetForAssetKey:scope:persona:", v4, v8, v9);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v8;
}

- (BOOL)storePassword:(id)a3 userName:(id)a4 assetKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController storePassword:userName:assetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v15, "storeWithPassword:userName:assetKey:scope:persona:error:", v12, v11, v10, v16, v17, a6);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a6);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v16;
}

- (BOOL)storePEMData:(id)a3 assetKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController storePEMData:assetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v12, "storeWithPemData:assetKey:scope:persona:error:", v9, v8, v13, v14, a5);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a5);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v13;
}

- (BOOL)storePKCS1Data:(id)a3 assetKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;

  v8 = a4;
  v9 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController storePKCS1Data:assetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v12, "storeWithDerData:assetKey:scope:persona:error:", v9, v8, v13, v14, a5);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a5);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v13;
}

- (BOOL)storePKCS12Data:(id)a3 password:(id)a4 assetKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController storePKCS12Data:password:assetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v15, "storeWithPkcs12Data:password:assetKey:scope:persona:error:", v12, v11, v10, v16, v17, a6);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a6);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v16;
}

- (BOOL)storeSCEPIdentityURL:(id)a3 caInstanceName:(id)a4 caFingerprint:(id)a5 caCapabilities:(id)a6 challenge:(id)a7 subject:(id)a8 keySize:(unint64_t)a9 usageFlags:(unint64_t)a10 subjectAltName:(id)a11 retries:(unint64_t)a12 retryDelay:(unsigned int)a13 assetKey:(id)a14 error:(id *)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  char v37;

  v21 = a14;
  v36 = a11;
  v35 = a8;
  v34 = a7;
  v33 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController storeSCEPIdentityURL:caInstanceName:caFingerprint:caCapabilities:challenge:subject:keySize:usageFlags:subjectAltName:retries:retryDelay:assetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v32) = a13;
  v37 = objc_msgSend(v27, "storeSCEPIdentityWithUrl:caInstanceName:caFingerprint:caCapabilities:challenge:subject:keySize:usageFlags:subjectAltName:retries:retryDelay:assetKey:scope:persona:error:", v24, v23, v22, v33, v34, v35, a9, a10, v36, a12, v32, v21, v28, v29, a15);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a15);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v37;
}

- (BOOL)storeACMEDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(unint64_t)a5 keyType:(id)a6 hardwareBound:(BOOL)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(unint64_t)a10 extendedKeyUsage:(id)a11 attest:(BOOL)a12 isUserEnrollment:(BOOL)a13 assetKey:(id)a14 error:(id *)a15
{
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _BOOL4 v34;
  char v35;
  id v37;

  v34 = a7;
  v37 = a14;
  v32 = a11;
  v31 = a9;
  v30 = a8;
  v29 = a6;
  v19 = a4;
  v20 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController storeACMEDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v28) = __PAIR16__(a13, a12);
  v35 = objc_msgSend(v23, "storeACMEIdentityWithDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:scope:persona:error:", v20, v19, a5, v29, v34, v30, v31, a10, v32, v28, v37, v24, v25, a15);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a15);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v35;
}

- (id)assignPasswordForAssetKey:(id)a3 toConfigurationKey:(id)a4 access:(void *)a5 group:(id)a6 returnUserName:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController assignPasswordForAssetKey:toConfigurationKey:access:group:returnUserName:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assignPasswordWithAssetKey:scope:persona:toConfigurationKey:accessibility:accessGroup:returnUserName:error:", v14, v20, v21, v15, a5, v16, a7, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a8);
  return v22;
}

- (id)assignCertificateForAssetKey:(id)a3 toConfigurationKey:(id)a4 access:(void *)a5 group:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController assignCertificateForAssetKey:toConfigurationKey:access:group:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assignCertWithAssetKey:scope:persona:toConfigurationKey:accessibility:accessGroup:error:", v12, v18, v19, v13, a5, v14, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a7);
  return v20;
}

- (id)assignIdentityForAssetKey:(id)a3 configurationKey:(id)a4 access:(void *)a5 group:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController assignIdentityForAssetKey:configurationKey:access:group:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assignIdentityWithAssetKey:scope:persona:toConfigurationKey:accessibility:accessGroup:error:", v12, v18, v19, v13, a5, v14, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a7);
  return v20;
}

- (BOOL)unassignAllAssetsFromConfigurationKey:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController unassignAllAssetsFromConfigurationKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v9, "unassignAllAssetsFromConfigurationKey:scope:persona:error:", v6, v10, v11, a4);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a4);
  return v10;
}

- (BOOL)removedKeychainItemsForAssetKey:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController removedKeychainItemsForAssetKey:error:].cold.1();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v9, "deleteWithAssetKey:scope:persona:error:", v6, v10, v11, a4);

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a4);
  -[RMManagedKeychainController _postNotification](self, "_postNotification");

  return v10;
}

- (id)assetKeysForCertificatesAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetKeysForCertificatesWithScope:persona:error:", v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a3);
  return v9;
}

- (id)assetKeysForIdentitiesAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetKeysForIdentitiesWithScope:persona:error:", v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a3);
  return v9;
}

- (id)assetKeysForPasswordsAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetKeysForPasswordsWithScope:persona:error:", v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a3);
  return v9;
}

- (id)certificatePersistentRefForAssetKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "certificatePersistentRefWithAssetKey:scope:persona:error:", v6, v9, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a4);
  return v11;
}

- (id)certificatePersistentRefsForAssetKeys:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lock");

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "certificatePersistentRefsWithAssetKeys:scope:persona:error:", v6, v9, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMManagedKeychainController lock](RMManagedKeychainController, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

  +[RMErrorUtilities convertSwiftErrorReference:](RMErrorUtilities, "convertSwiftErrorReference:", a4);
  return v11;
}

- (void)_postNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "sending certificate changed notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (id)debugState
{
  NSObject *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;

  +[RMLog managedKeychainController](RMLog, "managedKeychainController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[RMManagedKeychainController debugState].cold.1();

  +[ManagedKeychain sharedInstance](_TtC16RemoteManagement15ManagedKeychain, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RMManagedKeychainController scope](self, "scope");
  -[RMManagedKeychainController personaID](self, "personaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "debugStateWithScope:persona:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
}

- (void)initWithScope:(NSObject *)a3 personaID:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_2_3(&dword_21885E000, a2, a3, "Created with scope: %ld personaID: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)hasDataForAssetKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "hasDataForAssetKey: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storePassword:userName:assetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "storePassword: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storePEMData:assetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "storePEMData: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storePKCS1Data:assetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "storePKCS1Data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storePKCS12Data:password:assetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "storePKCS12Data identity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storeSCEPIdentityURL:caInstanceName:caFingerprint:caCapabilities:challenge:subject:keySize:usageFlags:subjectAltName:retries:retryDelay:assetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "storeSCEPIdentity identity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)storeACMEDirectoryURL:clientIdentifier:keySize:keyType:hardwareBound:subject:subjectAltName:usageFlags:extendedKeyUsage:attest:isUserEnrollment:assetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "storeACMEIdentity identity: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)assignPasswordForAssetKey:toConfigurationKey:access:group:returnUserName:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_3(&dword_21885E000, v0, v1, "assignPasswordForAssetKey: %{public}@ configuration: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)assignCertificateForAssetKey:toConfigurationKey:access:group:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_3(&dword_21885E000, v0, v1, "assignCertificateForAssetKey: %{public}@ configuration: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)assignIdentityForAssetKey:configurationKey:access:group:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_3(&dword_21885E000, v0, v1, "assignIdentityForAssetKey: %{public}@ configuration: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)unassignAllAssetsFromConfigurationKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "unassignAllAssetsFromConfigurationKey: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removedKeychainItemsForAssetKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21885E000, v0, v1, "removedKeychainItemsForAssetKey: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)debugState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_21885E000, v0, v1, "debugState", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

@end
