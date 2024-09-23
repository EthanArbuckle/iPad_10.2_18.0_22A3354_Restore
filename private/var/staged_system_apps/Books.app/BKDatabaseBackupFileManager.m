@implementation BKDatabaseBackupFileManager

+ (id)mergeSyncSidecarPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_booksRepositoryURL](NSURL, "bu_booksRepositoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKDatabaseBackupFileManager mergeSyncSidecarFileName](BKDatabaseBackupFileManager, "mergeSyncSidecarFileName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));

  return v5;
}

+ (id)mergeSyncSidecarFileName
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ibooks")) & 1) != 0)
  {
    v5 = CFSTR("com.apple.itunesu");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.itunesu")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = CFSTR("com.apple.ibooks");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("-sync.plist")));
LABEL_7:

  return v6;
}

- (void)mergeSyncSidecarWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t v15[16];
  _QWORD block[4];
  NSObject *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDatabaseBackupFileManager annotationProvider](self, "annotationProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKDatabaseBackupFileManager annotationProvider](self, "annotationProvider"));
  v7 = objc_msgSend((id)objc_opt_class(v6), "ubiquityQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDatabaseBackupFileManager annotationProvider](self, "annotationProvider"));
    v11 = objc_msgSend((id)objc_opt_class(v10), "ubiquityQueue");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B734;
    block[3] = &unk_1008E7680;
    v17 = v5;
    v18 = v4;
    dispatch_async(v12, block);

    v13 = v17;
  }
  else
  {
    v14 = BCIMLog(v9);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Missing annotation provider ubiquity queue. Not saving sync side car.", v15, 2u);
    }
  }

}

- (AEAnnotationProvider)annotationProvider
{
  return (AEAnnotationProvider *)objc_getProperty(self, a2, 16, 1);
}

- (BKDatabaseBackupFileManager)initWithLibraryManager:(id)a3 annotationProvider:(id)a4
{
  id v7;
  id v8;
  BKDatabaseBackupFileManager *v9;
  BKDatabaseBackupFileManager *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[BKDatabaseBackupFileManager init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryManager, a3);
    objc_storeStrong((id *)&v10->_annotationProvider, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->_libraryManager, 0);
}

- (void)rewriteBackupFileWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];

  v4 = a3;
  if (-[BKDatabaseBackupFileManager canModifyBackupFiles](self, "canModifyBackupFiles"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDatabaseBackupFileManager annotationProvider](self, "annotationProvider"));
    v6 = objc_msgSend((id)objc_opt_class(v5), "ubiquityQueue");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015EAE4;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async(v7, block);

  }
  if (v4)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[AEAnnotationProvider ubiquityQueue](AEAnnotationProvider, "ubiquityQueue"));
    dispatch_async(v8, v4);

  }
}

+ (BOOL)doesSyncSidecarExist
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("-sync.plist")));
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_alloc_init((Class)NSFileManager);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_booksRepositoryURL](NSURL, "bu_booksRepositoryURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

    v10 = objc_msgSend(v6, "fileExistsAtPath:", v9);
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)canModifyBackupFiles
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine appInfoMgr](AEAssetEngine, "appInfoMgr"));
  v3 = objc_msgSend(v2, "isRunningInStoreDemoMode") ^ 1;

  return v3;
}

- (id)currentBookmarksKey
{
  return CFSTR("1.2");
}

- (id)bookmarksKeyFromVersionOneFive
{
  return CFSTR("1.1");
}

- (id)newBookmarkDictionarysArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation modernDictionaryRepresentationForAnnotationsMatchingPredicate:inManagedObjectContext:](AEAnnotation, "modernDictionaryRepresentationForAnnotationsMatchingPredicate:inManagedObjectContext:", 0, v3));
  objc_autoreleasePoolPop(v4);

  return v5;
}

- (void)rewriteSyncSidecarWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("-sync.plist")));
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_msgSend(objc_alloc((Class)AEAnnotationSidecarProducer), "initWithName:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDatabaseBackupFileManager annotationProvider](self, "annotationProvider"));
    objc_msgSend(v8, "rewriteWithAnnotationProvider:completionBlock:", v9, v10);

  }
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_getProperty(self, a2, 8, 1);
}

@end
