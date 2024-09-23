@implementation PCSCKKSFetchCurrentOperation

- (PCSCKKSFetchCurrentOperation)initWithItemModifyContext:(id)a3
{
  id v5;
  void *v6;
  PCSCKKSFetchCurrentOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  PCSCKKSFetchCurrentOperation *v11;
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
        v13.super_class = (Class)PCSCKKSFetchCurrentOperation,
        v7 = -[PCSCKKSFetchCurrentOperation init](&v13, sel_init),
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
  objc_msgSend(v8, "stringWithFormat:", CFSTR("FetchCurrentOperation service: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSFetchCurrentOperation setName:](self, "setName:", v10);

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
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Starting: %s"), "-[PCSCKKSFetchCurrentOperation start]");
  if (-[PCSCKKSOperation startOperation](self, "startOperation"))
  {
    -[PCSCKKSFetchCurrentOperation context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v3, "set"));

    if ((v4 & 1) != 0)
    {
      -[PCSCKKSFetchCurrentOperation context](self, "context");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mtt");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "measurePoint:", CFSTR("CKKSFetchCurrent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__PCSCKKSFetchCurrentOperation_start__block_invoke;
      v10[3] = &unk_1E553EF30;
      v10[4] = self;
      v11 = v7;
      v9 = v7;
      -[PCSCKKSFetchCurrentOperation fetchCurrentItem:viewhint:complete:](self, "fetchCurrentItem:viewhint:complete:", v8, 0, v10);

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
  }
}

uint64_t __37__PCSCKKSFetchCurrentOperation_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchComplete:point:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

- (void)fetchComplete:(id)a3 point:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PCSCKKSFetchCurrentOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v11, "set"));

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v8, "persistentRef");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 || !v13)
    {
      pcsLogObjForScope("ckks");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[PCSCKKSFetchCurrentOperation context](self, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "service");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v16;
        v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1A9508000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get CKKS current service %@: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v8, "persistentRef");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v8, "persistentRef");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCSCKKSFetchCurrentOperation fetchPersistentRef:](self, "fetchPersistentRef:", v18);

    }
    else if (objc_msgSend(v10, "code") != -25300)
    {
      if (v10)
      {
        -[PCSCKKSOperation setError:](self, "setError:", v10);
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = kPCSErrorDomain;
        v31 = *MEMORY[0x1E0CB2D50];
        v26 = (void *)MEMORY[0x1E0CB3940];
        -[PCSCKKSItemModifyContext service](self->_context, "service");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("Fetch current identity failed for service %@"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 104, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PCSCKKSOperation setError:](self, "setError:", v30);

      }
      v23 = 0;
      goto LABEL_14;
    }
    v23 = 1;
LABEL_14:
    objc_msgSend(v9, "complete:", v23);
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v20 = kPCSErrorDomain;
  v37 = *MEMORY[0x1E0CB2D50];
  v38[0] = CFSTR("dsid does not match current persona's account dsid");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 146, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCSCKKSOperation setError:](self, "setError:", v22);

LABEL_15:
  -[PCSCKKSOperation completeOperation](self, "completeOperation");

}

- (void)fetchCurrentItem:(id)a3 viewhint:(id)a4 complete:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  char v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *AccessGroupByName;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[8];
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[PCSCKKSFetchCurrentOperation context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v11, "set"));

  if ((v12 & 1) != 0)
  {
    if (v9
      || (-[PCSCKKSItemModifyContext service](self->_context, "service"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          PCSServiceItemGetCKKSViewByName(v13),
          v9 = (id)objc_claimAutoreleasedReturnValue(),
          v13,
          v9))
    {
      PCSMigrationLog((uint64_t)-[PCSCKKSItemModifyContext log](self->_context, "log"), CFSTR("Server fetching service %@ from view %@"), v8, v9);
      v14 = off_1ECED4020;
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      AccessGroupByName = PCSServiceItemGetAccessGroupByName(v15);
      ((void (*)(__CFString *, id, id, _QWORD, void (**)(id, _QWORD, void *)))v14)(AccessGroupByName, v8, v9, 0, v10);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = kPCSErrorDomain;
      v26 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[PCSCKKSItemModifyContext service](self->_context, "service");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("No view hint for %@"), v9);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 102, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v24);

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = kPCSErrorDomain;
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("dsid does not match current persona's account dsid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 146, v19);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v15);
  }

}

- (void)fetchPersistentRef:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  const void *SHA1;
  id v10;
  PCSCKKSItemModifyContext *context;
  uint64_t v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  -[PCSCKKSFetchCurrentOperation context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PCSCurrentPersonaMatchesDSIDFromSet(objc_msgSend(v5, "set"));

  if ((v6 & 1) != 0)
  {
    -[PCSCKKSItemModifyContext setExistingItemReference:](self->_context, "setExistingItemReference:", 0);
    -[PCSCKKSItemModifyContext setExistingItemSHA1:](self->_context, "setExistingItemSHA1:", 0);
    -[PCSCKKSItemModifyContext setCurrentIdentity:persistentReference:](self->_context, "setCurrentIdentity:persistentReference:", 0, 0);
    -[PCSCKKSFetchCurrentOperation context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    SHA1 = (const void *)PCSIdentityCreateFromPersistentReferenceAndGetSHA1(v4, v8, &v13);
    v10 = v13;

    -[PCSCKKSItemModifyContext setExistingItemReference:](self->_context, "setExistingItemReference:", v4);
    -[PCSCKKSItemModifyContext setExistingItemSHA1:](self->_context, "setExistingItemSHA1:", v10);
    context = self->_context;
    if (SHA1)
    {
      -[PCSCKKSItemModifyContext setCurrentIdentity:persistentReference:](context, "setCurrentIdentity:persistentReference:", SHA1, v4);

      CFRelease(SHA1);
    }
    else
    {
      v12 = -[PCSCKKSItemModifyContext log](context, "log");

      PCSMigrationLog(v12, CFSTR("Failed to create identity from persistent ref: %@"), v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "dsid does not match current persona's account dsid", buf, 2u);
  }

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
