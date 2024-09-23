@implementation STUDeleteItemMigrationTask

- (STUDeleteItemMigrationTask)initWithFileSystemPrimitives:(id)a3 itemURL:(id)a4 deleteOnlyIfEmpty:(BOOL)a5
{
  id v9;
  id v10;
  STUDeleteItemMigrationTask *v11;
  STUDeleteItemMigrationTask *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUDeleteItemMigrationTask;
  v11 = -[STUDeleteItemMigrationTask init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fileSystemPrimitives, a3);
    objc_storeStrong((id *)&v12->_itemURL, a4);
    v12->_deleteOnlyIfEmpty = a5;
  }

  return v12;
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
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask fileSystemPrimitives](self, "fileSystemPrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask itemURL](self, "itemURL"));
  v5 = objc_msgSend(v3, "fileExistsAtURL:", v4);

  if (v5)
  {
    v6 = sub_100038708();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask itemURL](self, "itemURL"));
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Remove item %{public}@", buf, 0xCu);

    }
    if (-[STUDeleteItemMigrationTask deleteOnlyIfEmpty](self, "deleteOnlyIfEmpty"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask fileSystemPrimitives](self, "fileSystemPrimitives"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask itemURL](self, "itemURL"));
      v21 = 0;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtURL:error:", v10, &v21));
      v12 = v21;

      if (v12)
      {
        v13 = sub_100038708();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_10007C138(self);
LABEL_8:

        goto LABEL_17;
      }
      if (v11 && -[NSObject count](v11, "count"))
      {
        v15 = sub_100038708();
        v14 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_10007C0A4(self, v14);
        goto LABEL_8;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask fileSystemPrimitives](self, "fileSystemPrimitives"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUDeleteItemMigrationTask itemURL](self, "itemURL"));
    v20 = 0;
    v18 = objc_msgSend(v16, "removeItemAtURL:error:", v17, &v20);
    v12 = v20;

    if ((v18 & 1) != 0)
    {
LABEL_18:

      return;
    }
    v19 = sub_100038708();
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10007C024(self);
LABEL_17:

    goto LABEL_18;
  }
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  return self->_fileSystemPrimitives;
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (BOOL)deleteOnlyIfEmpty
{
  return self->_deleteOnlyIfEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
}

@end
