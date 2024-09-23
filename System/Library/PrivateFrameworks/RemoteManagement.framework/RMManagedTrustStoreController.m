@implementation RMManagedTrustStoreController

+ (id)newManagedTrustStoreControllerProtocolForScope:(int64_t)a3 personaID:(id)a4
{
  id v5;
  RMManagedTrustStoreController *v6;

  v5 = a4;
  v6 = -[RMManagedTrustStoreController initWithScope:personaID:]([RMManagedTrustStoreController alloc], "initWithScope:personaID:", a3, v5);

  return v6;
}

- (RMManagedTrustStoreController)initWithScope:(int64_t)a3 personaID:(id)a4
{
  id v7;
  RMManagedTrustStoreController *v8;
  RMManagedTrustStoreController *v9;
  NSObject *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMManagedTrustStoreController;
  v8 = -[RMManagedTrustStoreController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_scope = a3 == 1;
    objc_storeStrong((id *)&v8->_personaID, a4);
    +[RMLog managedTrustStoreController](RMLog, "managedTrustStoreController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[RMManagedTrustStoreController initWithScope:personaID:].cold.1((uint64_t)v7, a3, v10);

  }
  return v9;
}

- (BOOL)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  +[RMManagedTrustStore sharedInstance](_TtC16RemoteManagement19RMManagedTrustStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RMManagedTrustStoreController scope](self, "scope");
  -[RMManagedTrustStoreController personaID](self, "personaID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "setTrustForCertificateRef:configurationKey:fullTrust:scope:persona:error:", v11, v10, v7, v13, v14, a6);

  return (char)a6;
}

- (BOOL)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  int64_t v13;
  void *v14;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  +[RMManagedTrustStore sharedInstance](_TtC16RemoteManagement19RMManagedTrustStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RMManagedTrustStoreController scope](self, "scope");
  -[RMManagedTrustStoreController personaID](self, "personaID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "removeTrustForCertificateRef:configurationKey:fullTrust:scope:persona:error:", v11, v10, v7, v13, v14, a6);

  return (char)a6;
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

- (void)initWithScope:(os_log_t)log personaID:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2114;
  v6 = a1;
  _os_log_debug_impl(&dword_21885E000, log, OS_LOG_TYPE_DEBUG, "Created with scope: %ld personaID: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
