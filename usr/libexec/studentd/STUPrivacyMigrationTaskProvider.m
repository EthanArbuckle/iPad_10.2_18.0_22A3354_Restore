@implementation STUPrivacyMigrationTaskProvider

- (STUPrivacyMigrationTaskProvider)initWithFileSystemPrimitives:(id)a3
{
  id v5;
  STUPrivacyMigrationTaskProvider *v6;
  STUPrivacyMigrationTaskProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUPrivacyMigrationTaskProvider;
  v6 = -[STUPrivacyMigrationTaskProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileSystemPrimitives, a3);

  return v7;
}

- (id)makeMigrationTasks
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider userDataMigrationTasks](self, "userDataMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider userImagesMigrationTasks](self, "userImagesMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider IDSMigrationTasks](self, "IDSMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider logEventDatabaseMigrationTasks](self, "logEventDatabaseMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider signInHistoryMigrationTasks](self, "signInHistoryMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider configurationMigrationTasks](self, "configurationMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider systemDataMigrationTasks](self, "systemDataMigrationTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider removeCacheTasks](self, "removeCacheTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider removeContainerTasks](self, "removeContainerTasks"));
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v12);

  v13 = -[NSMutableArray copy](v3, "copy");
  return v13;
}

- (id)userDataMigrationTasks
{
  STUFileBackedDirectoryDataStore *v3;
  void *v4;
  STUFileBackedDirectoryDataStore *v5;
  void *v6;
  STUFileBackedDirectoryDataStore *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  STUFileBackedDataStoreMigrationTask *v16;
  STUFileBackedDataStoreMigrationTask *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v3 = [STUFileBackedDirectoryDataStore alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager studentdLibraryURL](NSFileManager, "studentdLibraryURL"));
  v5 = -[STUFileBackedDirectoryDataStore initWithBaseURL:](v3, "initWithBaseURL:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v7 = -[STUFileBackedDirectoryDataStore initWithBaseURL:]([STUFileBackedDirectoryDataStore alloc], "initWithBaseURL:", v6);
  v25[0] = CFSTR("AdHocConfiguration.plist");
  v25[1] = CFSTR("AdHocEnrollmentRecords.plist");
  v25[2] = CFSTR("StudentConfigurationMetadata.plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
  v9 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14);
        v16 = [STUFileBackedDataStoreMigrationTask alloc];
        v17 = -[STUFileBackedDataStoreMigrationTask initWithFileName:source:destination:](v16, "initWithFileName:source:destination:", v15, v7, v5, (_QWORD)v20);
        -[NSMutableArray addObject:](v9, "addObject:", v17);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = -[NSMutableArray copy](v9, "copy");
  return v18;
}

- (id)userImagesMigrationTasks
{
  void *v3;
  void *v4;
  STUMoveItemMigrationTask *v5;
  void *v6;
  void *v7;
  STUMoveItemMigrationTask *v8;
  void *v9;
  STUMoveItemMigrationTask *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("UserImages")));

  v5 = [STUMoveItemMigrationTask alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager userImagesDirectoryURL](NSFileManager, "userImagesDirectoryURL"));
  v8 = -[STUMoveItemMigrationTask initWithFileSystemPrimitives:sourceURL:destinationURL:](v5, "initWithFileSystemPrimitives:sourceURL:destinationURL:", v6, v4, v7);

  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

- (id)IDSMigrationTasks
{
  void *v3;
  void *v4;
  STUMoveItemMigrationTask *v5;
  void *v6;
  void *v7;
  STUMoveItemMigrationTask *v8;
  void *v9;
  STUMoveItemMigrationTask *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("IDS")));

  v5 = [STUMoveItemMigrationTask alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager IDSDirectoryURL](NSFileManager, "IDSDirectoryURL"));
  v8 = -[STUMoveItemMigrationTask initWithFileSystemPrimitives:sourceURL:destinationURL:](v5, "initWithFileSystemPrimitives:sourceURL:destinationURL:", v6, v4, v7);

  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

- (id)logEventDatabaseMigrationTasks
{
  void *v3;
  void *v4;
  STUDeleteItemMigrationTask *v5;
  void *v6;
  STUDeleteItemMigrationTask *v7;
  void *v8;
  STUDeleteItemMigrationTask *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Events"), 1));

  v5 = [STUDeleteItemMigrationTask alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v7 = -[STUDeleteItemMigrationTask initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:](v5, "initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:", v6, v4, 0);

  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (id)signInHistoryMigrationTasks
{
  void *v3;
  void *v4;
  void *v5;
  STUMoveItemMigrationTask *v6;
  void *v7;
  STUMoveItemMigrationTask *v8;
  void *v9;
  STUMoveItemMigrationTask *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("SignInHistory.plist")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager signInHistoryPlistURL](NSFileManager, "signInHistoryPlistURL"));
  v6 = [STUMoveItemMigrationTask alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v8 = -[STUMoveItemMigrationTask initWithFileSystemPrimitives:sourceURL:destinationURL:](v6, "initWithFileSystemPrimitives:sourceURL:destinationURL:", v7, v4, v5);

  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

- (id)configurationMigrationTasks
{
  void *v4;
  void *v5;
  STUMoveItemMigrationTask *v6;
  void *v7;
  void *v8;
  STUMoveItemMigrationTask *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  STUDeleteItemMigrationTask *v15;
  void *v16;
  STUDeleteItemMigrationTask *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  if ((CRKIsiOS(self, a2) & 1) != 0)
    return &__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager systemDataStoreDirectoryURL](NSFileManager, "systemDataStoreDirectoryURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("StudentConfiguration.plist")));

  v6 = [STUMoveItemMigrationTask alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL crk_macOSProfileURL](NSURL, "crk_macOSProfileURL"));
  v9 = -[STUMoveItemMigrationTask initWithFileSystemPrimitives:sourceURL:destinationURL:](v6, "initWithFileSystemPrimitives:sourceURL:destinationURL:", v7, v8, v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager crk_nonContainerizedHomeDirectoryURL](NSFileManager, "crk_nonContainerizedHomeDirectoryURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
  v20[0] = v11;
  v20[1] = CFSTR("Library");
  v20[2] = CFSTR("Apple Education Configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
  v15 = [STUDeleteItemMigrationTask alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v17 = -[STUDeleteItemMigrationTask initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:](v15, "initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:", v16, v14, 1);

  v19[0] = v9;
  v19[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));

  return v18;
}

- (id)systemDataMigrationTasks
{
  STUFileBackedDirectoryDataStore *v4;
  void *v5;
  STUFileBackedDirectoryDataStore *v6;
  void *v7;
  void *v8;
  void *v9;
  STUFileBackedDirectoryDataStore *v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  STUFileBackedDataStoreMigrationTask *v19;
  STUFileBackedDataStoreMigrationTask *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[2];

  if ((CRKIsiOS(self, a2) & 1) != 0)
    return &__NSArray0__struct;
  v4 = [STUFileBackedDirectoryDataStore alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager systemDataStoreDirectoryURL](NSFileManager, "systemDataStoreDirectoryURL"));
  v6 = -[STUFileBackedDirectoryDataStore initWithBaseURL:](v4, "initWithBaseURL:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Container"), 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));
  v10 = -[STUFileBackedDirectoryDataStore initWithBaseURL:]([STUFileBackedDirectoryDataStore alloc], "initWithBaseURL:", v9);
  v27[0] = CFSTR("AuxiliaryUsers.plist");
  v27[1] = CFSTR("AuxiliaryEnrollment.plist");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
  v12 = objc_opt_new(NSMutableArray);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v17);
        v19 = [STUFileBackedDataStoreMigrationTask alloc];
        v20 = -[STUFileBackedDataStoreMigrationTask initWithFileName:source:destination:](v19, "initWithFileName:source:destination:", v18, v10, v6, (_QWORD)v22);
        -[NSMutableArray addObject:](v12, "addObject:", v20);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  v21 = -[NSMutableArray copy](v12, "copy");
  return v21;
}

- (id)removeCacheTasks
{
  void *v4;
  void *v5;
  STUDeleteItemMigrationTask *v6;
  void *v7;
  STUDeleteItemMigrationTask *v8;
  void *v9;
  STUDeleteItemMigrationTask *v10;

  if ((CRKIsiOS(self, a2) & 1) != 0)
    return &__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Container/Library/Caches")));

  v6 = [STUDeleteItemMigrationTask alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v8 = -[STUDeleteItemMigrationTask initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:](v6, "initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:", v7, v5, 0);

  v10 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v9;
}

- (id)removeContainerTasks
{
  void *v4;
  void *v5;
  STUDeleteItemMigrationTask *v6;
  void *v7;
  STUDeleteItemMigrationTask *v8;
  void *v9;
  STUDeleteItemMigrationTask *v10;

  if ((CRKIsiOS(self, a2) & 1) != 0)
    return &__NSArray0__struct;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider oldStudentdLibraryURL](self, "oldStudentdLibraryURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Container")));

  v6 = [STUDeleteItemMigrationTask alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUPrivacyMigrationTaskProvider fileSystemPrimitives](self, "fileSystemPrimitives"));
  v8 = -[STUDeleteItemMigrationTask initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:](v6, "initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:", v7, v5, 0);

  v10 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v9;
}

- (id)oldStudentdLibraryURL
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("studentd")));
  return v6;
}

- (CRKFileSystemPrimitives)fileSystemPrimitives
{
  return self->_fileSystemPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSystemPrimitives, 0);
}

@end
