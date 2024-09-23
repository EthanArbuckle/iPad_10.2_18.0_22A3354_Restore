@implementation RBSAuditToken

- (int)pid
{
  return self->_auditToken.val[5];
}

- (BOOL)isEqual:(id)a3
{
  RBSAuditToken *v4;
  RBSAuditToken *v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  _OWORD v12[2];

  v4 = (RBSAuditToken *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    if (v4)
      -[RBSAuditToken realToken](v4, "realToken");
    if (LODWORD(v12[0]) == self->_auditToken.val[0])
    {
      v6 = 0;
      do
      {
        v7 = v6;
        if (v6 == 7)
          break;
        v8 = *((_DWORD *)v12 + v6 + 1);
        v9 = self->_auditToken.val[++v6];
      }
      while (v8 == v9);
      v10 = v7 > 6;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

+ (id)tokenFromAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = objc_alloc((Class)a1);
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (id)objc_msgSend(v4, "initWithAuditToken:", v7);
}

- (RBSAuditToken)initWithAuditToken:(id *)a3
{
  RBSAuditToken *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RBSAuditToken;
  result = -[RBSAuditToken init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)a3->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)result->_auditToken.val = v5;
  }
  return result;
}

- (int)pidversion
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pidversion(&v4);
}

+ (id)tokenFromAuditTokenRef:(id *)a3
{
  __int128 v5;
  void *v8;
  _OWORD v9[2];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSSecurityUtilities.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auditToken"));

  }
  v5 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v5;
  objc_msgSend(a1, "tokenFromAuditToken:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)tokenFromXPCConnection:(id)a3
{
  id v5;
  __int128 v6;
  void *v7;
  void *v9;
  audit_token_t v10;
  audit_token_t atoken;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("RBSSecurityUtilities.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  *(_OWORD *)v10.val = v6;
  *(_OWORD *)&v10.val[4] = v6;
  xpc_connection_get_audit_token();
  atoken = v10;
  if (audit_token_to_pid(&atoken) == -1)
  {
    v7 = 0;
  }
  else
  {
    atoken = v10;
    objc_msgSend(a1, "tokenFromAuditToken:", &atoken);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  xpc_object_t v4;
  id v5;

  v5 = a3;
  v4 = xpc_data_create(&self->_auditToken, 0x20uLL);
  if (v4)
    objc_msgSend(v5, "encodeXPCObject:forKey:", v4, CFSTR("_auditToken"));

}

- (RBSAuditToken)initWithRBSXPCCoder:(id)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  RBSAuditToken *v7;
  _OWORD v9[2];
  __int128 buffer;
  __int128 v11;

  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  buffer = v4;
  v11 = v4;
  objc_msgSend(a3, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C812E8], CFSTR("_auditToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && xpc_data_get_bytes(v5, &buffer, 0, 0x20uLL) == 32)
  {
    v9[0] = buffer;
    v9[1] = v11;
    self = -[RBSAuditToken initWithAuditToken:](self, "initWithAuditToken:", v9);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RBSAuditToken)initWithCoder:(id)a3
{
  __int128 v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  v7 = v4;
  v8 = v4;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "{?=[8I]}", &v7, 32);
  v6[0] = v7;
  v6[1] = v8;
  return -[RBSAuditToken initWithAuditToken:](self, "initWithAuditToken:", v6);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "{?=[8I]}", &self->_auditToken);
}

- (unint64_t)hash
{
  __int128 v2;
  audit_token_t v4;

  v2 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)v4.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&v4.val[4] = v2;
  return audit_token_to_pid(&v4);
}

- (NSString)description
{
  id v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  audit_token_t atoken;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v5;
  v6 = audit_token_to_auid(&atoken);
  v7 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v7;
  v8 = audit_token_to_euid(&atoken);
  v9 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v9;
  v10 = audit_token_to_egid(&atoken);
  v11 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v11;
  v12 = audit_token_to_ruid(&atoken);
  v13 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v13;
  v14 = audit_token_to_rgid(&atoken);
  v15 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v15;
  v16 = audit_token_to_pid(&atoken);
  v17 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)atoken.val = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&atoken.val[4] = v17;
  v18 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| AUID:%d EUID:%d EGID:%d RUID:%d RGID:%d PID:%d ASID:%d>"), v4, v6, v8, v10, v12, v14, v16, audit_token_to_asid(&atoken));

  return (NSString *)v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v5;
  return (id)objc_msgSend(v4, "initWithAuditToken:", v7);
}

@end
