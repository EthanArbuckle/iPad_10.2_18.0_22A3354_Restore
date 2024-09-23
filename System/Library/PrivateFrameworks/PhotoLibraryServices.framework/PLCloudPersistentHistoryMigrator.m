@implementation PLCloudPersistentHistoryMigrator

- (PLCloudPersistentHistoryMigrator)initWithMigratorContext:(id)a3
{
  id v4;
  PLCloudPersistentHistoryMigrator *v5;
  PLCloudPersistentHistoryMigrator *v6;
  PLCloudPersistentHistoryMigrator *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCloudPersistentHistoryMigrator;
  v5 = -[PLCloudPersistentHistoryMigrator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_migratorContext, v4);
    v7 = v6;
  }

  return v6;
}

- (void)migrateToPersistentHistoryIfNecessary
{
  _BYTE *v3;
  NSObject *v4;
  int64_t v5;
  NSObject *v6;
  NSObject *v7;
  PLCloudPersistentHistoryMigratorContext **p_migratorContext;
  id WeakRetained;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Start migration from change hub to persistent history", buf, 2u);
    }

  }
  v5 = -[PLCloudPersistentHistoryMigrator migrate](self, "migrate");
  if (v5 == 1)
  {
    if (!*v3)
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Migration from change hub succeeded (forced reset sync)", v10, 2u);
      }

    }
    p_migratorContext = &self->_migratorContext;
    WeakRetained = objc_loadWeakRetained((id *)p_migratorContext);
    objc_msgSend(WeakRetained, "resetSyncDueToMigrationMarker");

    v6 = objc_loadWeakRetained((id *)p_migratorContext);
    -[NSObject removeAllChangeHubKeys](v6, "removeAllChangeHubKeys");
    goto LABEL_15;
  }
  if (!v5 && !*v3)
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Migration from change hub not needed", v11, 2u);
    }
LABEL_15:

  }
}

- (int64_t)migrate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_migratorContext);
  objc_msgSend(WeakRetained, "readLocalVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_migratorContext);
}

+ (void)migrateToPersistentHistoryIfNecessaryWithMigratorContext:(id)a3
{
  void *v3;
  PLCloudPersistentHistoryMigrator *v4;
  id v5;

  v5 = a3;
  v3 = (void *)MEMORY[0x19AEC1554]();
  v4 = -[PLCloudPersistentHistoryMigrator initWithMigratorContext:]([PLCloudPersistentHistoryMigrator alloc], "initWithMigratorContext:", v5);
  -[PLCloudPersistentHistoryMigrator migrateToPersistentHistoryIfNecessary](v4, "migrateToPersistentHistoryIfNecessary");

  objc_autoreleasePoolPop(v3);
}

@end
