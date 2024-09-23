@implementation STUMigrationSession

- (STUMigrationSession)initWithMigrationTaskProvider:(id)a3
{
  id v5;
  STUMigrationSession *v6;
  STUMigrationSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUMigrationSession;
  v6 = -[STUMigrationSession init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_migrationTaskProvider, a3);

  return v7;
}

- (void)startMigration
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUMigrationSession migrationTaskProvider](self, "migrationTaskProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "makeMigrationTasks"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "performMigration", (_QWORD)v13);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUMigrationSession delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "migrationSessionDidFinish:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUMigrationSession delegate](self, "delegate"));
    objc_msgSend(v12, "migrationSessionDidFinish:", self);

  }
}

- (STUMigrationSessionDelegate)delegate
{
  return (STUMigrationSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STUMigrationTaskProvider)migrationTaskProvider
{
  return self->_migrationTaskProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationTaskProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
