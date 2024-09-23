@implementation SMTRequestDispatcherSessionConfiguration

- (SMTRequestDispatcherSessionConfiguration)initWithBuilder:(id)a3
{
  void (**v4)(id, SMTRequestDispatcherSessionConfigurationMutating *);
  SMTRequestDispatcherSessionConfiguration *v5;
  SMTRequestDispatcherSessionConfiguration *v6;
  SMTRequestDispatcherSessionConfigurationMutating *v7;
  void *v8;
  uint64_t v9;
  NSString *assistantId;
  void *v11;
  uint64_t v12;
  NSString *languageCode;
  void *v14;
  uint64_t v15;
  NSString *sharedUserId;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v4 = (void (**)(id, SMTRequestDispatcherSessionConfigurationMutating *))a3;
  v20.receiver = self;
  v20.super_class = (Class)SMTRequestDispatcherSessionConfiguration;
  v5 = -[SMTRequestDispatcherSessionConfiguration init](&v20, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SMTRequestDispatcherSessionConfigurationMutating);
    v4[2](v4, v7);
    -[SMTRequestDispatcherSessionConfigurationMutating assistantId](v7, "assistantId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    assistantId = v6->_assistantId;
    v6->_assistantId = (NSString *)v9;

    -[SMTRequestDispatcherSessionConfigurationMutating languageCode](v7, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    languageCode = v6->_languageCode;
    v6->_languageCode = (NSString *)v12;

    v6->_understandingOnDevice = -[SMTRequestDispatcherSessionConfigurationMutating understandingOnDevice](v7, "understandingOnDevice");
    -[SMTRequestDispatcherSessionConfigurationMutating sharedUserId](v7, "sharedUserId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    sharedUserId = v6->_sharedUserId;
    v6->_sharedUserId = (NSString *)v15;

    if (v7)
    {
      -[SMTRequestDispatcherSessionConfigurationMutating clientAuditToken](v7, "clientAuditToken");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
    }
    *(_OWORD *)v6->_clientAuditToken.val = v18;
    *(_OWORD *)&v6->_clientAuditToken.val[4] = v19;

  }
  return v6;
}

- (SMTRequestDispatcherSessionConfiguration)init
{
  return -[SMTRequestDispatcherSessionConfiguration initWithBuilder:](self, "initWithBuilder:", &__block_literal_global_120);
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (BOOL)understandingOnDevice
{
  return self->_understandingOnDevice;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

@end
