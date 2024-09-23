@implementation PLClientApplicationIdentification

- (PLClientApplicationIdentification)initWithConnection:(id)a3
{
  id v5;
  PLClientApplicationIdentification *v6;
  PLClientApplicationIdentification *v7;
  $0B20F48E2CD2D778BD1F216BA81B71CE *p_clientAuditToken;
  uint64_t v9;
  NSString *trustedCallerBundleID;
  void *v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLXPCUtilities.m"), 1098, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PLClientApplicationIdentification;
  v6 = -[PLClientApplicationIdentification init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    p_clientAuditToken = &v6->_clientAuditToken;
    if (v5)
    {
      objc_msgSend(v5, "auditToken");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
    *(_OWORD *)p_clientAuditToken->val = v13;
    *(_OWORD *)&v7->_clientAuditToken.val[4] = v14;
    v7->_clientProcessIdentifier = objc_msgSend(v5, "processIdentifier");
    PLClientApplicationIdentifierFromXPCConnection(v5);
    v9 = objc_claimAutoreleasedReturnValue();
    trustedCallerBundleID = v7->_trustedCallerBundleID;
    v7->_trustedCallerBundleID = (NSString *)v9;

  }
  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSString)trustedCallerBundleID
{
  return self->_trustedCallerBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
}

@end
