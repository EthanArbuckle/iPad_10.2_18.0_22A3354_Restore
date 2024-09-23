@implementation AEEpubInfoSource

+ (id)sharedInstance
{
  pthread_once(&stru_20E4D8, sub_CF588);
  return (id)qword_20F608;
}

- (AEEpubInfoSource)initWithIdentifier:(id)a3
{
  id v4;
  AEEpubInfoSource *v5;
  NSString *v6;
  NSString *identifier;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *metadataQueue;
  void *v14;
  id v15;
  AEBookManagedObjectContext *v16;
  AEBookManagedObjectContext *privateMoc;
  AEBookManagedObjectContext *v18;
  void *v19;
  _QWORD v21[4];
  AEBookManagedObjectContext *v22;

  v4 = a3;
  v5 = -[AEEpubInfoSource init](self, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.iBooks.AEEpubInfoSource.metadata", v11);
    metadataQueue = v5->_metadataQueue;
    v5->_metadataQueue = (OS_dispatch_queue *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentContainer](v5, "persistentContainer"));
    v15 = objc_msgSend(v14, "newBackgroundContext");

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_CC634;
    v21[3] = &unk_1BEA38;
    v16 = (AEBookManagedObjectContext *)v15;
    v22 = v16;
    -[AEBookManagedObjectContext performBlockAndWait:](v16, "performBlockAndWait:", v21);
    privateMoc = v5->_privateMoc;
    v5->_privateMoc = v16;
    v18 = v16;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v5, "_mocDidSaveNotification:", NSManagedObjectContextDidSaveNotification, 0);

  }
  return v5;
}

- (void)dealloc
{
  AEBookManagedObjectContext *privateMoc;
  objc_super v4;
  _QWORD v5[5];

  privateMoc = self->_privateMoc;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_CC6E8;
  v5[3] = &unk_1BEA38;
  v5[4] = self;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", v5);
  v4.receiver = self;
  v4.super_class = (Class)AEEpubInfoSource;
  -[AEEpubInfoSource dealloc](&v4, "dealloc");
}

- (void)_mocDidSaveNotification:(id)a3
{
  AEBookManagedObjectContext *v4;
  AEBookManagedObjectContext *privateMoc;
  void *v6;
  void *v7;
  AEBookManagedObjectContext *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v9 = a3;
  v4 = (AEBookManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "object"));
  privateMoc = self->_privateMoc;
  if (privateMoc != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookManagedObjectContext persistentStoreCoordinator](privateMoc, "persistentStoreCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookManagedObjectContext persistentStoreCoordinator](v4, "persistentStoreCoordinator"));

    if (v6 == v7)
    {
      v8 = self->_privateMoc;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_CC7C8;
      v10[3] = &unk_1BFDB8;
      v10[4] = self;
      v11 = v9;
      -[AEBookManagedObjectContext performBlockAndWait:](v8, "performBlockAndWait:", v10);

    }
  }

}

- (id)persistentStoreDirectory
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("AEEpubInfoSource")));
  return v5;
}

- (void)recreatePersistentStoreDirectory
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentStoreDirectory](self, "persistentStoreDirectory"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "relativePath"));
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

}

- (id)persistentStoreFileName
{
  NSString *persistentStoreFileName;
  NSString *identifier;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  persistentStoreFileName = self->_persistentStoreFileName;
  if (!persistentStoreFileName)
  {
    identifier = self->_identifier;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemVersion"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@-%@.sqlite"), identifier, CFSTR("v20220131"), v6));
    v8 = self->_persistentStoreFileName;
    self->_persistentStoreFileName = v7;

    persistentStoreFileName = self->_persistentStoreFileName;
  }
  return persistentStoreFileName;
}

- (NSPersistentContainer)persistentContainer
{
  void *v3;
  void *v4;
  AEEpubInfoSource *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSPersistentContainer *persistentContainer;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSPersistentContainer *v17;
  id v18;
  NSPersistentContainer *v19;
  NSPersistentContainer *v20;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentStoreDirectory](self, "persistentStoreDirectory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentStoreFileName](self, "persistentStoreFileName"));
  -[AEEpubInfoSource recreatePersistentStoreDirectory](self, "recreatePersistentStoreDirectory");
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_persistentContainer)
  {
    v6 = AEBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("AEBookInfo"), CFSTR("momd")));
    v9 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", v8);
    v10 = objc_claimAutoreleasedReturnValue(+[NSPersistentContainer persistentContainerWithName:managedObjectModel:](NSPersistentContainer, "persistentContainerWithName:managedObjectModel:", CFSTR("AEBookInfo"), v9));
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = (NSPersistentContainer *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v12, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPersistentStoreDescription persistentStoreDescriptionWithURL:](NSPersistentStoreDescription, "persistentStoreDescriptionWithURL:", v13));
    objc_msgSend(v14, "setOption:forKey:", NSFileProtectionNone, NSPersistentStoreFileProtectionKey);
    v31 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    -[NSPersistentContainer setPersistentStoreDescriptions:](v5->_persistentContainer, "setPersistentStoreDescriptions:", v15);
    v22 = v7;

    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 1;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPersistentContainer persistentStoreCoordinator](v5->_persistentContainer, "persistentStoreCoordinator"));
    v17 = v5->_persistentContainer;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_CCC78;
    v24[3] = &unk_1C1350;
    v18 = v16;
    v25 = v18;
    v26 = &v27;
    -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v17, "loadPersistentStoresWithCompletionHandler:", v24);
    if (*((_BYTE *)v28 + 24))
    {
      v19 = v5->_persistentContainer;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_CCEF8;
      v23[3] = &unk_1C1378;
      v23[4] = &v27;
      -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v19, "loadPersistentStoresWithCompletionHandler:", v23);
    }

    _Block_object_dispose(&v27, 8);
  }
  objc_sync_exit(v5);

  v20 = v5->_persistentContainer;
  return v20;
}

- (id)newManagedObjectContextWithPrivateQueueConcurrency
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentContainer](self, "persistentContainer"));
  v3 = objc_msgSend(v2, "newBackgroundContext");

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_CD0F0;
  v6[3] = &unk_1BEA38;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v4, "performBlockAndWait:", v6);

  return v4;
}

- (void)performBackgroundTaskAndWait:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_CD1C4;
    v6[3] = &unk_1BF0C0;
    v7 = -[AEEpubInfoSource newManagedObjectContextWithPrivateQueueConcurrency](self, "newManagedObjectContextWithPrivateQueueConcurrency");
    v8 = v5;
    v4 = v7;
    objc_msgSend(v4, "performBlockAndWait:", v6);

  }
}

- (void)performMainQueueTaskWithNewContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentContainer](self, "persistentContainer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_CD2B8;
    v9[3] = &unk_1C13A0;
    v10 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 2);
    v11 = v6;
    v12 = v4;
    v7 = v6;
    v8 = v10;
    objc_msgSend(v8, "performBlock:", v9);

  }
}

- (void)performMainQueueTaskWithNewContextAndWait:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v8 = a3;
  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource persistentContainer](self, "persistentContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreCoordinator"));

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_CD3E8;
    v9[3] = &unk_1C13A0;
    v10 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 2);
    v11 = v5;
    v12 = v8;
    v6 = v5;
    v7 = v10;
    objc_msgSend(v7, "performBlockAndWait:", v9);

  }
}

- (id)databaseKeyFromLibraryManagerInfo:(id)a3 forAssetAtURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist assetIDFromPlistEntry:forAssetAtPath:](IMLibraryPlist, "assetIDFromPlistEntry:forAssetAtPath:", v5, v6));

  return v7;
}

- (id)existingBookInfoWithPredicate:(id)a3 fromManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  AEBookManagedObjectContext *privateMoc;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_CD5C8;
  v19 = sub_CD5D8;
  v20 = 0;
  if (!v6)
    goto LABEL_4;
  privateMoc = self->_privateMoc;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_CD5E0;
  v12[3] = &unk_1C13C8;
  v12[4] = self;
  v13 = v6;
  v14 = &v15;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", v12);

  v9 = v16[5];
  if (v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "existingObjectWithID:error:", v9, 0));
  else
LABEL_4:
    v10 = 0;
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (id)existingBookInfoForURL:(id)a3 fromManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookBundlePath ==[n] %@"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource existingBookInfoWithPredicate:fromManagedObjectContext:](self, "existingBookInfoWithPredicate:fromManagedObjectContext:", v8, v6));
  return v9;
}

- (void)readableBookInfoForDatabaseKey_sync:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_CD78C;
  v8[3] = &unk_1C13F0;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[AEEpubInfoSource performBackgroundTaskAndWait:](self, "performBackgroundTaskAndWait:", v8);

}

- (void)writableBookInfoForDatabaseKey_sync:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_CD8E4;
  v8[3] = &unk_1C13F0;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[AEEpubInfoSource performBackgroundTaskAndWait:](self, "performBackgroundTaskAndWait:", v8);

}

- (id)existingBookInfoForDatabaseKey:(id)a3 fromManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("databaseKey ==[n] %@"), a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEEpubInfoSource existingBookInfoWithPredicate:fromManagedObjectContext:](self, "existingBookInfoWithPredicate:fromManagedObjectContext:", v7, v6));

  return v8;
}

- (void)setPropertiesOfBook:(id)a3 withPlistEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    v15 = (id)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist titleFromPlistEntry:](IMLibraryPlist, "titleFromPlistEntry:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v5));
    objc_msgSend(v6, "setStoreId:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v5));
    objc_msgSend(v6, "setBookUniqueId:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:](IMLibraryPlist, "temporaryItemIdentifierFromPlistEntry:", v5));
    objc_msgSend(v6, "setTemporaryItemIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist authorFromPlistEntry:](IMLibraryPlist, "authorFromPlistEntry:", v5));
    objc_msgSend(v6, "setBookAuthor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist sortAuthorFromPlistEntry:](IMLibraryPlist, "sortAuthorFromPlistEntry:", v5));
    objc_msgSend(v6, "setSortAuthor:", v11);

    objc_msgSend(v6, "setBookTitle:", v15);
    objc_msgSend(v6, "setSortTitle:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist genreFromPlistEntry:](IMLibraryPlist, "genreFromPlistEntry:", v5));
    objc_msgSend(v6, "setGenre:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v5));
    objc_msgSend(v6, "setSampleContent:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist bookEpubIdFromPlistEntry:](IMLibraryPlist, "bookEpubIdFromPlistEntry:", v5));
    objc_msgSend(v6, "setBookEpubId:", v14);

  }
}

- (id)bookInfoForDatabaseKey:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  AEBookManagedObjectContext *v8;
  AEBookManagedObjectContext *privateMoc;
  id v10;
  uint64_t v11;
  void *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  AEEpubInfoSource *v18;
  id v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = (AEBookManagedObjectContext *)a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_CD5C8;
  v26 = sub_CD5D8;
  v27 = 0;
  privateMoc = self->_privateMoc;
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_CDD48;
  v17 = &unk_1C1418;
  v18 = self;
  v10 = v7;
  v19 = v10;
  v20 = &v22;
  v21 = privateMoc == v8;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", &v14);
  v11 = v23[5];
  if (v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookManagedObjectContext existingObjectWithID:error:](v8, "existingObjectWithID:error:", v11, 0, v14, v15, v16, v17, v18));
  else
    v12 = 0;

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (id)bookInfoForURL:(id)a3 fromManagedObjectContext:(id)a4 error:(id *)a5 needsCoordination:(BOOL)a6 updateDate:(id)a7
{
  id v11;
  AEBookManagedObjectContext *v12;
  id v13;
  AEBookManagedObjectContext *privateMoc;
  AEBookManagedObjectContext *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *metadataQueue;
  void *v21;
  void *v22;
  id v23;
  _QWORD block[4];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  id *v34;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v11 = a3;
  v12 = (AEBookManagedObjectContext *)a4;
  v13 = a7;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_CD5C8;
  v51 = sub_CD5D8;
  v52 = 0;
  privateMoc = self->_privateMoc;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_CD5C8;
  v45 = sub_CD5D8;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v15 = v12;
  v39 = 0x2020000000;
  v40 = 0;
  if (privateMoc != v12)
  {
    dispatch_suspend((dispatch_object_t)self->_metadataQueue);
    v15 = self->_privateMoc;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_CE0F0;
  v28[3] = &unk_1C1440;
  v28[4] = self;
  v16 = v11;
  v35 = a6;
  v29 = v16;
  v31 = &v41;
  v32 = &v37;
  v34 = a5;
  v17 = v13;
  v30 = v17;
  v33 = &v47;
  v36 = privateMoc == v12;
  -[AEBookManagedObjectContext performBlockAndWait:](v15, "performBlockAndWait:", v28);
  if (privateMoc != v12)
    dispatch_resume((dispatch_object_t)self->_metadataQueue);
  v18 = v48[5];
  if (v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookManagedObjectContext existingObjectWithID:error:](v12, "existingObjectWithID:error:", v18, 0));
  else
    v19 = 0;
  if (!*((_BYTE *)v38 + 24) && objc_msgSend(v19, "hasDuplicatedDocument"))
  {
    metadataQueue = self->_metadataQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CE5DC;
    block[3] = &unk_1BEA38;
    v27 = v19;
    dispatch_async(metadataQueue, block);

  }
  if (a5)
  {
    v21 = (void *)v42[5];
    if (v21)
      objc_storeStrong(a5, v21);
  }
  v22 = v30;
  v23 = v19;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v23;
}

- (int)parseBook:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  AEBookManagedObjectContext *v7;
  void *v8;
  unsigned int v9;
  AEBookManagedObjectContext *privateMoc;
  AEBookManagedObjectContext *v11;
  AEBookManagedObjectContext *v12;
  AEBookManagedObjectContext *v13;
  void *v14;
  void *v15;
  BOOL v16;
  AEBookManagedObjectContext *v17;
  int v18;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v6 = objc_msgSend(v5, "isTemporaryID");

  if (!v6)
    goto LABEL_6;
  v7 = (AEBookManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  if (v7 != self->_privateMoc)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v9 = objc_msgSend(v8, "hasChanges");

    if (!v9)
      goto LABEL_6;
    v7 = (AEBookManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    -[AEBookManagedObjectContext save:](v7, "save:", 0);
  }

LABEL_6:
  privateMoc = self->_privateMoc;
  v11 = (AEBookManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));

  v12 = (AEBookManagedObjectContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v13 = self->_privateMoc;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v15 = v14;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (v14)
  {
    v16 = privateMoc == v11;
    v17 = self->_privateMoc;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_CE80C;
    v20[3] = &unk_1C1468;
    v20[4] = self;
    v21 = v14;
    v22 = &v25;
    v23 = v12 != v13;
    v24 = v16;
    -[AEBookManagedObjectContext performBlockAndWait:](v17, "performBlockAndWait:", v20);

    v18 = *((_DWORD *)v26 + 6);
  }
  else
  {
    v18 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v18;
}

- (void)updateCachedURLFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  AEBookManagedObjectContext *privateMoc;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  privateMoc = self->_privateMoc;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CE9A8;
  v11[3] = &unk_1C00A8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", v11);

}

- (void)resetBookForURL:(id)a3
{
  id v4;
  AEBookManagedObjectContext *privateMoc;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  privateMoc = self->_privateMoc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CEAF0;
  v7[3] = &unk_1BFDB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", v7);

}

- (void)resetBookForDatabaseKey:(id)a3
{
  id v4;
  AEBookManagedObjectContext *privateMoc;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  privateMoc = self->_privateMoc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CEBC0;
  v7[3] = &unk_1BFDB8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", v7);

}

- (void)_resetBookInfo:(id)a3
{
  id v4;
  AEBookManagedObjectContext *privateMoc;
  id v6;
  _QWORD v7[4];
  id v8;
  AEEpubInfoSource *v9;

  v4 = a3;
  privateMoc = self->_privateMoc;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_CEC90;
  v7[3] = &unk_1BFDB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[AEBookManagedObjectContext performBlockAndWait:](privateMoc, "performBlockAndWait:", v7);

}

- (id)metadataForKey:(id)a3 forURL:(id)a4 needsCoordination:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *metadataQueue;
  void *v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  BOOL v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_CD5C8;
  v40 = sub_CD5D8;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  if (!objc_msgSend(v8, "isEqualToString:", AEHelperStringMetadataAssetIDKey))
  {
    if (!objc_msgSend(v8, "isEqualToString:", AEHelperStringMetadataPageProgressionKey))
      goto LABEL_9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pageProgressionDirectionForAssetAtURLOnMainThread:", v9));

    if (objc_msgSend(v11, "length"))
      goto LABEL_6;
LABEL_7:

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "metadataForAssetAtURL:needsCoordination:", v9, v5));

    metadataQueue = self->_metadataQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CEFFC;
    block[3] = &unk_1C1490;
    block[4] = self;
    v27 = v8;
    v28 = v16;
    v29 = v9;
    v30 = &v36;
    v31 = &v32;
    v11 = v16;
    dispatch_sync(metadataQueue, block);

    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetIDForAssetAtURLOnMainThread:", v9));

  if (!objc_msgSend(v11, "length"))
    goto LABEL_7;
LABEL_6:
  v13 = objc_msgSend(v11, "copy");
  v14 = (void *)v37[5];
  v37[5] = (uint64_t)v13;

  *((_BYTE *)v33 + 24) = 0;
LABEL_8:

LABEL_9:
  if (*((_BYTE *)v33 + 24))
  {
    v18 = objc_autoreleasePoolPush();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_CF164;
    v21[3] = &unk_1C14B8;
    v21[4] = self;
    v22 = v9;
    v25 = v5;
    v23 = v8;
    v24 = &v36;
    -[AEEpubInfoSource performBackgroundTaskAndWait:](self, "performBackgroundTaskAndWait:", v21);

    objc_autoreleasePoolPop(v18);
  }
  v19 = (id)v37[5];
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

- (void)setMetadata:(id)a3 forKey:(id)a4 forURL:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v9 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "isEqualToString:", AEHelperStringMetadataTitleKey))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_CF4B8;
    v10[3] = &unk_1C14E0;
    v10[4] = self;
    v11 = v8;
    v12 = v9;
    -[AEEpubInfoSource performBackgroundTaskAndWait:](self, "performBackgroundTaskAndWait:", v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_persistentStoreFileName, 0);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_privateMoc, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
