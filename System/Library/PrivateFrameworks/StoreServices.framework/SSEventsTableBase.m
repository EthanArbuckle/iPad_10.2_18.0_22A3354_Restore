@implementation SSEventsTableBase

uint64_t __49__SSEventsTableBase_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1A8585BF8]();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
  return v3;
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4;
  SSSQLiteDatabase *database;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SSEventsTableBase_performTransactionWithBlock___block_invoke;
  v7[3] = &unk_1E47BB890;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v7);

}

- (SSEventsTableBase)init
{
  SSEventsTableBase *v2;
  void *v3;
  void *v4;
  SSSQLiteDatabase *v5;
  void *v6;
  uint64_t v7;
  SSSQLiteDatabase *database;
  _QWORD v10[4];
  SSEventsTableBase *v11;
  _QWORD *v12;
  _QWORD v13[4];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SSEventsTableBase;
  v2 = -[SSEventsTableBase init](&v14, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A8585BF8]();
    objc_msgSend((id)objc_opt_class(), "databasePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SSSQLiteDatabase alloc];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:](v5, "initWithDatabaseURL:readOnly:protectionType:", v6, 0, *MEMORY[0x1E0CB2AC0]);
    database = v2->_database;
    v2->_database = (SSSQLiteDatabase *)v7;

    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2050000000;
    v13[3] = v2;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __25__SSEventsTableBase_init__block_invoke;
    v10[3] = &unk_1E47BB868;
    v12 = v13;
    v11 = v2;
    -[SSSQLiteDatabase setSetupBlock:](v2->_database, "setSetupBlock:", v10);

    _Block_object_dispose(v13, 8);
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

void __25__SSEventsTableBase_init__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  int v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "_setupDatabase") & 1) == 0)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v2 = objc_msgSend(v1, "shouldLog");
    if (objc_msgSend(v1, "shouldLogToDisk"))
      v3 = v2 | 2;
    else
      v3 = v2;
    objc_msgSend(v1, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      v3 &= 2u;
    if (v3)
    {
      LODWORD(v14) = 138412290;
      *(_QWORD *)((char *)&v14 + 4) = objc_opt_class();
      v5 = *(id *)((char *)&v14 + 4);
      LODWORD(v13) = 12;
      v6 = (void *)_os_log_send_and_compose_impl();

      if (!v6)
      {
LABEL_13:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4, &v14, v13, v14);
      v4 = objc_claimAutoreleasedReturnValue();
      free(v6);
      SSFileLog(v1, CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v4);
    }

    goto LABEL_13;
  }
}

+ (id)databasePath
{
  return 0;
}

- (BOOL)_setupDatabase
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
