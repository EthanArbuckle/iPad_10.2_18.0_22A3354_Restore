@implementation PBFApplicationStateComponent

- (PBFApplicationStateComponent)initWithIdentifier:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PBFApplicationStateComponent *v10;
  PBFApplicationStateComponent *v11;
  uint64_t v12;
  NSDictionary *userInfo;
  PBFApplicationStateComponent *result;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    v16.receiver = self;
    v16.super_class = (Class)PBFApplicationStateComponent;
    v10 = -[PBFApplicationStateComponent init](&v16, sel_init);
    v11 = v10;
    if (v10)
    {
      -[PBFApplicationStateComponent setIdentifier:](v10, "setIdentifier:", v7);
      v12 = objc_msgSend(v9, "copy");
      userInfo = v11->_userInfo;
      v11->_userInfo = (NSDictionary *)v12;

      v11->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    }

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("componentIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFApplicationStateComponent initWithIdentifier:userInfo:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    result = (PBFApplicationStateComponent *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PBFApplicationStateComponent)initWithServerIdentity:(id)a3
{
  id v5;
  PBFApplicationStateComponent *v6;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_identity, a3);
    self = -[PBFApplicationStateComponent initWithIdentifier:userInfo:](self, "initWithIdentifier:userInfo:", CFSTR("PosterComponent"), 0);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PBFApplicationStateComponent)initWithPRPosterConfiguration:(id)a3
{
  void *v4;
  void *v5;
  PBFApplicationStateComponent *v6;

  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBFApplicationStateComponent initWithServerIdentity:](self, "initWithServerIdentity:", v5);

  return v6;
}

- (PBFApplicationStateComponent)initWithPRSPosterConfiguration:(id)a3
{
  void *v4;
  void *v5;
  PBFApplicationStateComponent *v6;

  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBFApplicationStateComponent initWithServerIdentity:](self, "initWithServerIdentity:", v5);

  return v6;
}

- (PBFApplicationStateComponent)initWithPRPosterDescriptor:(id)a3
{
  void *v4;
  void *v5;
  PBFApplicationStateComponent *v6;

  objc_msgSend(a3, "_path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBFApplicationStateComponent initWithServerIdentity:](self, "initWithServerIdentity:", v5);

  return v6;
}

- (PBFApplicationStateComponent)initWithPath:(id)a3
{
  void *v4;
  PBFApplicationStateComponent *v5;

  objc_msgSend(a3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PBFApplicationStateComponent initWithServerIdentity:](self, "initWithServerIdentity:", v4);

  return v5;
}

- (NSUUID)posterUUID
{
  return (NSUUID *)-[PFServerPosterIdentity posterUUID](self->_identity, "posterUUID");
}

- (id)description
{
  PBFApplicationStateComponent *v2;
  NSString *v3;
  void *v4;
  id v5;
  NSString *v6;
  NSString *cachedDescription;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cachedDescription;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v2->_identifier, CFSTR("identifier"));
    v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v2->_identity, CFSTR("identity"), 1);
    objc_msgSend(v4, "appendDictionarySection:withName:skipIfEmpty:", v2->_userInfo, CFSTR("userInfo"), 1);
    objc_msgSend(v4, "build");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedDescription = v2->_cachedDescription;
    v2->_cachedDescription = v6;

    v3 = v6;
  }
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)hash
{
  PBFApplicationStateComponent *v2;
  unint64_t cachedHash;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  cachedHash = v2->_cachedHash;
  if (cachedHash == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "appendString:", v2->_identifier);
    v6 = (id)objc_msgSend(v4, "appendObject:", v2->_userInfo);
    v7 = (id)objc_msgSend(v4, "appendObject:", v2->_identifier);
    cachedHash = objc_msgSend(v4, "hash");
    v2->_cachedHash = cachedHash;

  }
  objc_sync_exit(v2);

  return cachedHash;
}

- (NSDictionary)userInfo
{
  PBFApplicationStateComponent *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_userInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setUserInfo:(id)a3
{
  PBFApplicationStateComponent *v4;
  NSString *cachedDescription;
  uint64_t v6;
  NSDictionary *userInfo;
  PBFApplicationStateComponent *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[NSDictionary isEqualToDictionary:](v4->_userInfo, "isEqualToDictionary:", v9))
  {
    objc_sync_exit(v4);
  }
  else
  {
    cachedDescription = v4->_cachedDescription;
    v4->_cachedDescription = 0;

    v4->_cachedHash = 0x7FFFFFFFFFFFFFFFLL;
    v6 = objc_msgSend(v9, "copy");
    userInfo = v4->_userInfo;
    v4->_userInfo = (NSDictionary *)v6;

    objc_sync_exit(v4);
    -[PBFApplicationStateComponent delegate](v4, "delegate");
    v8 = (PBFApplicationStateComponent *)objc_claimAutoreleasedReturnValue();
    -[PBFApplicationStateComponent componentWasUpdated:](v8, "componentWasUpdated:", v4);
    v4 = v8;
  }

}

- (PFServerPosterIdentity)identity
{
  return self->_identity;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PBFStateComponentDelegate)delegate
{
  return (PBFStateComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
}

- (void)initWithIdentifier:(const char *)a1 userInfo:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
