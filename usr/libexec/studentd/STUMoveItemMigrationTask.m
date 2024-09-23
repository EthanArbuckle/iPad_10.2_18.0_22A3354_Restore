@implementation STUMoveItemMigrationTask

- (STUMoveItemMigrationTask)initWithFileSystemPrimitives:(id)a3 sourceURL:(id)a4 destinationURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUMoveItemMigrationTask *v12;
  STUMoveItemMigrationTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STUMoveItemMigrationTask;
  v12 = -[STUMoveItemMigrationTask init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileSystemPrimitives, a3);
    objc_storeStrong((id *)&v13->_sourceURL, a4);
    objc_storeStrong((id *)&v13->_destinationURL, a5);
  }

  return v13;
}

- (void)performMigration
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask fileSystemPrimitives](self, "fileSystemPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask sourceURL](self, "sourceURL"));
  v5 = objc_msgSend(v3, "fileExistsAtURL:", v4);

  if (v5)
  {
    v6 = sub_100042CC4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask sourceURL](self, "sourceURL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask destinationURL](self, "destinationURL"));
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Migrate item at %{public}@ to %{public}@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask fileSystemPrimitives](self, "fileSystemPrimitives"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask sourceURL](self, "sourceURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUMoveItemMigrationTask destinationURL](self, "destinationURL"));
    v17 = 0;
    v13 = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v11, v12, &v17);
    v14 = v17;

    if ((v13 & 1) == 0)
    {
      v15 = sub_100042CC4();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10007C310(self, (uint64_t)v14, v16);

    }
  }
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  return self->_fileSystemPrimitives;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
}

@end
