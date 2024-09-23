@implementation PCSCKKSEnsurePCSFieldsOperation

- (PCSCKKSEnsurePCSFieldsOperation)initWithItemModifyContext:(id)a3
{
  id v5;
  void *v6;
  PCSCKKSEnsurePCSFieldsOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  PCSCKKSEnsurePCSFieldsOperation *v11;
  objc_super v13;
  uint8_t buf[16];

  v5 = a3;
  if ((PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v5, "set")) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    goto LABEL_8;
  }
  if (!v5
    || (objc_msgSend(v5, "service"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6)
    || (v13.receiver = self,
        v13.super_class = (Class)PCSCKKSEnsurePCSFieldsOperation,
        v7 = -[PCSCKKSEnsurePCSFieldsOperation init](&v13, sel_init),
        (self = v7) == 0))
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v7->_context, a3);
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PCSCKKSItemModifyContext service](self->_context, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("EnsurePCSFields service: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSEnsurePCSFieldsOperation setName:](self, "setName:", v10);

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (BOOL)haveCKKSPlaintextEntitlements
{
  void *v2;
  char v3;
  BOOL result;
  _BOOL4 v5;
  uint8_t v6[16];

  -[PCSCKKSEnsurePCSFieldsOperation context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v2, "set"));

  if ((v3 & 1) != 0)
  {
    if (haveCKKSPlaintextEntitlements_once != -1)
      dispatch_once(&haveCKKSPlaintextEntitlements_once, &__block_literal_global_7);
    return haveCKKSPlaintextEntitlements_haveEntitlements != 0;
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v6, 2u);
      return 0;
    }
  }
  return result;
}

void __64__PCSCKKSEnsurePCSFieldsOperation_haveCKKSPlaintextEntitlements__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  void *v2;
  BOOL v3;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    v2 = (void *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.ckks.plaintextfields"), 0);
    CFRelease(v1);

    v3 = v2 != 0;
  }
  else
  {
    v3 = 0;
  }
  haveCKKSPlaintextEntitlements_haveEntitlements = v3;
}

- (void)start
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[8];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Starting: %s"), "-[PCSCKKSEnsurePCSFieldsOperation start]");
  if (-[PCSCKKSOperation startOperation](self, "startOperation"))
  {
    -[PCSCKKSEnsurePCSFieldsOperation context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

    if ((v4 & 1) != 0)
    {
      if (-[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity"))
      {
        -[PCSCKKSItemModifyContext currentItemReference](self->_context, "currentItemReference");
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v6 = (void *)v5;
          v7 = -[PCSCKKSEnsurePCSFieldsOperation haveCKKSPlaintextEntitlements](self, "haveCKKSPlaintextEntitlements");

          if (v7)
          {
            -[PCSCKKSEnsurePCSFieldsOperation context](self, "context");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "mtt");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "measurePoint:", CFSTR("EnsurePCSAttributes"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if ((_PCSIdentityHavePCSCKKSAttributes((uint64_t)-[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity")) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = *MEMORY[0x1E0CD70E0];
              -[PCSCKKSItemModifyContext currentItemReference](self->_context, "currentItemReference");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v17[0] = v12;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (_PCSKeychainAmendCKKSEntry((uint64_t)-[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity"), (__CFDictionary *)v11))
              {
                v14 = -[PCSCKKSEnsurePCSFieldsOperation updateKeychain:withAttributes:](self, "updateKeychain:withAttributes:", v13, v11);
                PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Updated identity %@ with CKKS attributes: status: %d"), -[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity"), v14);
                if (!(_DWORD)v14)
                  _PCSIdentityCheckPCSAttributes((uint64_t)-[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity"), v11);
              }
              else
              {
                PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Could not build CKKS attributes for %@"), -[PCSCKKSItemModifyContext currentIdentity](self->_context, "currentIdentity"));
              }
              objc_msgSend(v10, "complete:", 1);

            }
          }
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    -[PCSCKKSOperation completeOperation](self, "completeOperation");
  }
}

- (int)updateKeychain:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  int v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  -[PCSCKKSEnsurePCSFieldsOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v8, "set"));

  if ((v9 & 1) != 0)
  {
    v10 = qword_1ECED3FF0(v6, v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", v12, 2u);
    }
    v10 = -25291;
  }

  return v10;
}

- (PCSCKKSItemModifyContext)context
{
  return (PCSCKKSItemModifyContext *)objc_getProperty(self, a2, 272, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
