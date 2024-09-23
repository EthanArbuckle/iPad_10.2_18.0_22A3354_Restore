@implementation PALazyAuditTokenBasedClientIdentity

- (PALazyAuditTokenBasedClientIdentity)initWithAuditToken:(id *)a3
{
  PALazyAuditTokenBasedClientIdentity *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PALazyAuditTokenBasedClientIdentity;
  result = -[PALazyAuditTokenBasedClientIdentity init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (OS_tcc_identity)identity
{
  void *v3;
  void *v4;
  void *v5;
  OS_tcc_identity *v6;
  OS_tcc_identity *identity;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (!self->_identityResolved)
  {
    tcc_server_singleton_default();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)tcc_credential_create_for_process_with_audit_token();
    v5 = (void *)tcc_message_options_create();
    tcc_message_options_set_reply_handler_policy();
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy_;
    v13 = __Block_byref_object_dispose_;
    v14 = 0;
    tcc_server_message_get_identity_for_credential();
    v6 = (OS_tcc_identity *)(id)v10[5];
    _Block_object_dispose(&v9, 8);

    identity = self->_identity;
    self->_identity = v6;

    self->_identityResolved = 1;
  }
  return self->_identity;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  audit_token_t audittoken;
  _BYTE buffer[4096];
  uint64_t v11;

  v2 = MEMORY[0x1E0C80A78](self, a2);
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (__CFString *)tcc_object_copy_description();
  }
  else
  {
    v5 = *(_OWORD *)(v2 + 40);
    *(_OWORD *)audittoken.val = *(_OWORD *)(v2 + 24);
    *(_OWORD *)&audittoken.val[4] = v5;
    bzero(buffer, 0x1000uLL);
    if (proc_pidpath_audittoken(&audittoken, buffer, 0x1000u) > 0
      && (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer),
          (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IDENTIFICATION_FAILED:%@>"), v6, 0, *(_QWORD *)audittoken.val, *(_QWORD *)&audittoken.val[2], *(_QWORD *)&audittoken.val[4], *(_QWORD *)&audittoken.val[6]);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = CFSTR("<IDENTITY_UNKNOWN>");
    }
  }

  return (NSString *)v4;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (BOOL)isIdentityResolved
{
  return self->_identityResolved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
