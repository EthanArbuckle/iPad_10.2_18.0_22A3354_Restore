@implementation AEAnnotationSerializationManager

+ (BOOL)managedBooksAllowedToSync
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isEnterpriseBookMetadataSyncAllowed");

  return v3;
}

+ (id)annotationSerializationManagerWithAssetID:(id)a3 assetURL:(id)a4 bookVersionString:(id)a5 pathToAssetContextDirectory:(id)a6 isManagedBook:(BOOL)a7
{
  void *v8;
  id v9;
  void *v10;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AESingleBookMetadataProvider singleBookMetadataProviderWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:](AESingleBookMetadataProvider, "singleBookMetadataProviderWithAssetID:assetURL:bookVersionString:pathToAssetContextDirectory:isManagedBook:", a3, a4, a5, a6, a7));
  v9 = objc_msgSend((id)objc_opt_class(a1), "annotationSerializationManagerWithBookMetadataProvider:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

+ (id)annotationSerializationManagerWithBookMetadataProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithBookMetadataProvider:", v4);

  return v5;
}

- (AEAnnotationSerializationManager)initWithBookMetadataProvider:(id)a3
{
  id v4;
  AEAnnotationSerializationManager *v5;
  AEAnnotationSerializationManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AEAnnotationSerializationManager;
  v5 = -[AEAnnotationSerializationManager init](&v8, "init");
  v6 = v5;
  if (v5)
    -[AEAnnotationSerializationManager setBookMetadataProvider:](v5, "setBookMetadataProvider:", v4);

  return v6;
}

- (id)annotationProviderForOfflineDBWithAssetID:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AEAnnotationProvider *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager urlForOfflineDBWithAssetID:](self, "urlForOfflineDBWithAssetID:", a3));
  if (v3)
  {
    v7 = -[AEAnnotationProvider initWithPersistentStoreURL:]([AEAnnotationProvider alloc], "initWithPersistentStoreURL:", v3);
    if (!v7)
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 111, (uint64_t)"-[AEAnnotationSerializationManager annotationProviderForOfflineDBWithAssetID:]", (uint64_t)"provider", CFSTR("failed to open annotation provider for url '%@'"), v4, v5, v6, (uint64_t)v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)urlForOfflineDBWithAssetID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));
  v6 = objc_msgSend(v5, "isManagedWithAssetID:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));
    v9 = v8;
    if (v6)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetURLForAssetID:", v4));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByDeletingLastPathComponent"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager p_filenameForOfflineDBWithAssetID:](self, "p_filenameForOfflineDBWithAssetID:", v4));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v12));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathToContextDirectoryForAssetID:", v4));

      if (!v10)
      {
        v13 = 0;
        goto LABEL_9;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v17 = 0;
      objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v17);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager p_filenameForOfflineDBWithAssetID:](self, "p_filenameForOfflineDBWithAssetID:", v4));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v15));

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
    }

LABEL_9:
    goto LABEL_10;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (BOOL)isAssetOfflineWithAssetID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager urlForOfflineDBWithAssetID:](self, "urlForOfflineDBWithAssetID:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  return v6;
}

- (void)removeOfflineDBFilesWithAssetID:(id)a3 exceptBookVersionString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pathToContextDirectoryForAssetID:", v6));

    v27 = (void *)v9;
    if (v9)
    {
      if (a4)
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager p_filenameForOfflineDBWithAssetID:](self, "p_filenameForOfflineDBWithAssetID:", v6));
      else
        v10 = 0;
      v11 = CATransaction_ptr;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v33 = 0;
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v27, &v33));
      v14 = v33;

      if (v14)
      {
        NSLog(CFSTR("unexpected error reading file system: %@"), v14);
      }
      else
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v13 = v13;
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v15)
        {
          v16 = v15;
          v26 = v6;
          v17 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v13);
              v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v19, "hasPrefix:", CFSTR("offlineNotes"))
                && (objc_msgSend(v19, "hasPrefix:", v10) & 1) == 0)
              {
                v20 = v13;
                v21 = v10;
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathComponent:", v19));
                v23 = v11;
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11[58], "defaultManager"));
                v28 = 0;
                objc_msgSend(v24, "removeItemAtPath:error:", v22, &v28);
                v25 = v28;

                if (v25)
                  NSLog(CFSTR("error deleting offline annotation database file '%@': '%@'"), v19, v25);

                v11 = v23;
                v10 = v21;
                v13 = v20;
              }
            }
            v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v16);
          v14 = v13;
          v6 = v26;
        }
        else
        {
          v14 = v13;
        }
      }

    }
  }

}

- (BOOL)takeBookOfflineIfManagedWithAnnotationProvider:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));
    v10 = objc_msgSend(v9, "isManagedWithAssetID:", v7);

    if (v10)
    {
      v11 = -[AEAnnotationSerializationManager isAssetOfflineWithAssetID:](self, "isAssetOfflineWithAssetID:", v7);
      v12 = objc_msgSend((id)objc_opt_class(self), "managedBooksAllowedToSync");
      LOBYTE(v8) = 0;
      if ((v11 & 1) == 0 && (v12 & 1) == 0)
      {
        LOBYTE(v8) = 1;
        -[AEAnnotationSerializationManager protected_takeAssetOfflineWithProvider:assetID:copyData:](self, "protected_takeAssetOfflineWithProvider:assetID:copyData:", v6, v7, 1);
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

- (BOOL)p_ensureDirectoryPathExists:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v11;

  v3 = a3;
  if (!v3)
    goto LABEL_4;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = 0;
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v11);
  v5 = v11;

  v9 = v5 == 0;
  if (v5)
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 243, (uint64_t)"-[AEAnnotationSerializationManager p_ensureDirectoryPathExists:]", (uint64_t)"!error", CFSTR("Unable to ensure directory path exists at '%@'"), v6, v7, v8, (uint64_t)v3);
LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (void)protected_takeAssetOfflineWithProvider:(id)a3 assetID:(id)a4 copyData:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  NSObject *v32;

  v8 = a3;
  v9 = a4;
  if (-[AEAnnotationSerializationManager isAssetOfflineWithAssetID:](self, "isAssetOfflineWithAssetID:", v9))
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 255, (uint64_t)"-[AEAnnotationSerializationManager protected_takeAssetOfflineWithProvider:assetID:copyData:]", (uint64_t)"!isAssetAlreadyOffline", CFSTR("expected the asset was not yet offline"), v10, v11, v12, v27);
    v26 = BKMobileCloudSyncAnnotationsLog();
    v13 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B81F4((uint64_t)v9, v13);
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager urlForOfflineDBWithAssetID:](self, "urlForOfflineDBWithAssetID:", v9));
    v14 = BKMobileCloudSyncAnnotationsLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v9;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Taking asset offline. assetID: %@, db url: %@", buf, 0x16u);
    }

    if (v13
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URLByDeletingLastPathComponent](v13, "URLByDeletingLastPathComponent")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path")),
          v18 = -[AEAnnotationSerializationManager p_ensureDirectoryPathExists:](self, "p_ensureDirectoryPathExists:", v17), v17, v16, v18))
    {
      if (a5)
        v19 = objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForAnnotationsWithAssetID:includingDeleted:](AEAnnotation, "predicateForAnnotationsWithAssetID:includingDeleted:", v9, 0));
      else
        v19 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 0));
      v22 = (void *)v19;
      v28 = 0;
      objc_msgSend(v8, "exportAnnotationsMatchingPredicate:toURL:withType:error:", v19, v13, 0, &v28);
      v21 = v28;
      if (v21)
        BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 271, (uint64_t)"-[AEAnnotationSerializationManager protected_takeAssetOfflineWithProvider:assetID:copyData:]", (uint64_t)"error == nil", CFSTR("Exporting annotations to offline DB, error: '%@'"), v23, v24, v25, (uint64_t)v21);

    }
    else
    {
      v20 = BKMobileCloudSyncAnnotationsLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1B8268(v21);
    }

  }
}

- (id)p_filenameForOfflineDBWithAssetID:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  uint64_t v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSerializationManager bookMetadataProvider](self, "bookMetadataProvider"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookVersionStringForAssetID:", v4));

  if (v4)
  {
    v10 = &stru_296430;
    if (v6)
      v10 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@:%@:.sqlite"), CFSTR("offlineNotes"), v4, v10));
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AEAnnotation/AEAnnotationSerializationManager.m", 284, (uint64_t)"-[AEAnnotationSerializationManager p_filenameForOfflineDBWithAssetID:]", (uint64_t)"assetID != nil", CFSTR("expected asset ID but got nil"), v7, v8, v9, v13);
    v11 = 0;
  }

  return v11;
}

- (AEBookMetadataProvider)bookMetadataProvider
{
  return self->bookMetadataProvider;
}

- (void)setBookMetadataProvider:(id)a3
{
  objc_storeStrong((id *)&self->bookMetadataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bookMetadataProvider, 0);
}

@end
