@implementation STUFileBackedDataStoreMigrationTask

- (STUFileBackedDataStoreMigrationTask)initWithFileName:(id)a3 source:(id)a4 destination:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUFileBackedDataStoreMigrationTask *v12;
  STUFileBackedDataStoreMigrationTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STUFileBackedDataStoreMigrationTask;
  v12 = -[STUFileBackedDataStoreMigrationTask init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileName, a3);
    objc_storeStrong((id *)&v13->_source, a4);
    objc_storeStrong((id *)&v13->_destination, a5);
  }

  return v13;
}

- (void)performMigration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask source](self, "source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask fileName](self, "fileName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stu_plistObjectForKey:", v4));

  if (v5)
  {
    v6 = sub_10000D7E4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask fileName](self, "fileName"));
      v17 = 138543362;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PerformMigration: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask destination](self, "destination"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask fileName](self, "fileName"));
    v11 = objc_msgSend(v9, "stu_setPlistObject:forKey:", v5, v10);

    v12 = sub_10000D7E4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask fileName](self, "fileName"));
        v17 = 138543362;
        v18 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "File migrated: %{public}@", (uint8_t *)&v17, 0xCu);

      }
      v14 = objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask source](self, "source"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUFileBackedDataStoreMigrationTask fileName](self, "fileName"));
      -[NSObject stu_setPlistObject:forKey:](v14, "stu_setPlistObject:forKey:", 0, v16);

    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_10007A910(self, v14);
    }

  }
}

- (NSString)fileName
{
  return self->_fileName;
}

- (STUConfigurationDataStoreProtocol)source
{
  return self->_source;
}

- (STUConfigurationDataStoreProtocol)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
