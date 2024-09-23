@implementation PCSCKKSSyncViewOperation

- (PCSCKKSSyncViewOperation)initWithItemModifyContext:(id)a3
{
  id v5;
  void *v6;
  PCSCKKSSyncViewOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  PCSCKKSSyncViewOperation *v11;
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
        v13.super_class = (Class)PCSCKKSSyncViewOperation,
        v7 = -[PCSCKKSSyncViewOperation init](&v13, sel_init),
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
  objc_msgSend(v8, "stringWithFormat:", CFSTR("SyncViewOperation service: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSSyncViewOperation setName:](self, "setName:", v10);

  self = self;
  v11 = self;
LABEL_9:

  return v11;
}

- (void)start
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Starting: %s"), "-[PCSCKKSSyncViewOperation start]");
  if (-[PCSCKKSOperation startOperation](self, "startOperation"))
  {
    -[PCSCKKSSyncViewOperation context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

    if ((v4 & 1) != 0)
    {
      if (!-[PCSCKKSItemModifyContext sync](self->_context, "sync"))
      {
        -[PCSCKKSOperation completeOperation](self, "completeOperation");
        return;
      }
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSSyncViewOperation setView:](self, "setView:", PCSServiceItemGetCKKSViewByName(v5));

      -[PCSCKKSSyncViewOperation view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[PCSCKKSSyncViewOperation checkTLKStatus](self, "checkTLKStatus");
        return;
      }
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = kPCSErrorDomain;
      v15 = *MEMORY[0x1E0CB2D50];
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("No view hint for %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 102, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSOperation setError:](self, "setError:", v13);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    -[PCSCKKSOperation completeOperation](self, "completeOperation");
  }
}

- (BOOL)ensureControl
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[PCSCKKSSyncViewOperation context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

  if ((v4 & 1) != 0)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CD5C10], "controlObject:", &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    -[PCSCKKSSyncViewOperation setCKKSControl:](self, "setCKKSControl:", v5);

    -[PCSCKKSSyncViewOperation CKKSControl](self, "CKKSControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    if (!v7)
    {
      if (v6)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v15[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kPCSErrorDomain, 109, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSOperation setError:](self, "setError:", v10);

      -[PCSCKKSOperation completeOperation](self, "completeOperation");
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    -[PCSCKKSOperation completeOperation](self, "completeOperation");
    return 0;
  }
  return v8;
}

- (void)checkTLKStatus
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PCSCKKSSyncViewOperation *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PCSCKKSSyncViewOperation ensureControl](self, "ensureControl"))
  {
    -[PCSCKKSSyncViewOperation context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

    if ((v4 & 1) != 0)
    {
      pcsLogObjForScope("ckks");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[PCSCKKSSyncViewOperation view](self, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "Checking if CKKS reports bad state: %@", buf, 0xCu);

      }
      -[PCSCKKSSyncViewOperation view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSSyncViewOperation CKKSControl](self, "CKKSControl");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSSyncViewOperation view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__PCSCKKSSyncViewOperation_checkTLKStatus__block_invoke;
      v11[3] = &unk_1E553E2C0;
      v12 = v7;
      v13 = self;
      v10 = v7;
      objc_msgSend(v8, "rpcKnownBadState:reply:", v9, v11);

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
      }
      -[PCSCKKSOperation completeOperation](self, "completeOperation");
    }
  }
}

uint64_t __42__PCSCKKSSyncViewOperation_checkTLKStatus__block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;
  NSObject *v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v2 = a2;
  v19 = *MEMORY[0x1E0C80C00];
  switch(a2)
  {
    case 0:
      pcsLogObjForScope("ckks");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_1A9508000, v4, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%@): Likely good", (uint8_t *)&v15, 0xCu);
      }

      return objc_msgSend(*(id *)(a1 + 40), "syncView");
    case 1:
      pcsLogObjForScope("ckks");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v10;
        _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): TLKs missing", (uint8_t *)&v15, 0xCu);
      }
      v9 = 108;
      goto LABEL_20;
    case 2:
      pcsLogObjForScope("ckks");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v11;
        _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): Needs unlock", (uint8_t *)&v15, 0xCu);
      }
      v9 = 132;
      goto LABEL_20;
    case 3:
      pcsLogObjForScope("ckks");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v12;
        _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): wait for Octagon", (uint8_t *)&v15, 0xCu);
      }
      v9 = 156;
      goto LABEL_20;
    case 4:
      pcsLogObjForScope("ckks");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%{public}@): no CloudKit account", (uint8_t *)&v15, 0xCu);
      }
      v9 = 157;
      goto LABEL_20;
    default:
      pcsLogObjForScope("ckks");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v15 = 138412546;
        v16 = v8;
        v17 = 1024;
        v18 = v2;
        _os_log_impl(&dword_1A9508000, v7, OS_LOG_TYPE_DEFAULT, "CKKS response for known state(%@): unknown but likely fatal error: %d", (uint8_t *)&v15, 0x12u);
      }
      v9 = 133;
LABEL_20:

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", kPCSErrorDomain, v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setError:", v14);

      return objc_msgSend(*(id *)(a1 + 40), "completeOperation");
  }
}

- (void)syncView
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  PCSCKKSSyncViewOperation *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[PCSCKKSSyncViewOperation ensureControl](self, "ensureControl"))
  {
    -[PCSCKKSSyncViewOperation context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

    if ((v4 & 1) != 0)
    {
      pcsLogObjForScope("ckks");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[PCSCKKSSyncViewOperation view](self, "view");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_1A9508000, v5, OS_LOG_TYPE_DEFAULT, "Syncing ckks view: %@", buf, 0xCu);

      }
      -[PCSCKKSSyncViewOperation context](self, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mtt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "measurePoint:", CFSTR("CKKSSyncView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __36__PCSCKKSSyncViewOperation_syncView__block_invoke;
      v19 = &unk_1E553E2E8;
      v20 = self;
      v21 = v9;
      v10 = v9;
      v11 = (void *)MEMORY[0x1AF4156AC](&v16);
      -[PCSCKKSSyncViewOperation context](self, "context", v16, v17, v18, v19, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "forceSync");

      -[PCSCKKSSyncViewOperation CKKSControl](self, "CKKSControl");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSSyncViewOperation view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v14, "rpcFetchAndProcessChanges:reply:", v15, v11);
      else
        objc_msgSend(v14, "rpcFetchAndProcessChangesIfNoRecentFetch:reply:", v15, v11);

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
      }
      -[PCSCKKSOperation completeOperation](self, "completeOperation");
    }
  }
}

void __36__PCSCKKSSyncViewOperation_syncView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "log");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PCSMigrationLog(v4, CFSTR("Syncing CKKS view %@ failed with: %@"), v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  else
  {
    PCSMigrationLog(v4, CFSTR("Syncing CKKS view %@ successful"), v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "complete:", v6 == 0);
  objc_msgSend(*(id *)(a1 + 32), "completeOperation");

}

- (PCSCKKSItemModifyContext)context
{
  return (PCSCKKSItemModifyContext *)objc_getProperty(self, a2, 272, 1);
}

- (CKKSControl)CKKSControl
{
  return (CKKSControl *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCKKSControl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_CKKSControl, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
