@implementation BKLibraryDataSourcePlistImporting

- (int64_t)rank
{
  return self->_rank;
}

- (void)setReloadCounterpartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setPlistWriter:(id)a3
{
  objc_storeWeak((id *)&self->_plistWriter, a3);
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (BOOL)p_createPurchasesDirectory
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting importingDelegate](self, "importingDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "importDestinationPathForAssetImporter:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v9);
  v7 = v9;

  if (v7)
    objc_msgSend(v7, "logRecursively");

  return v6;
}

- (BKLibraryDataSourcePlistImporting)initWithMetadataCache:(id)a3 importingDelegate:(id)a4
{
  id v6;
  id v7;
  BKLibraryDataSourcePlistImporting *v8;
  BKLibraryDataSourcePlistImporting *v9;
  NSOperationQueue *v10;
  NSOperationQueue *assetImportingQueue;
  NSMutableDictionary *v12;
  NSMutableDictionary *importingOperationsInFlight;
  NSString *identifier;
  dispatch_queue_t v15;
  OS_dispatch_queue *ivarSerialQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353716, 22, 0, 0, 0);
  v20.receiver = self;
  v20.super_class = (Class)BKLibraryDataSourcePlistImporting;
  v8 = -[BKLibraryDataSourcePlistImporting init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_metadataCache, v6);
    objc_storeWeak((id *)&v9->_importingDelegate, v7);
    v10 = objc_opt_new(NSOperationQueue);
    assetImportingQueue = v9->_assetImportingQueue;
    v9->_assetImportingQueue = v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v9->_assetImportingQueue, "setMaxConcurrentOperationCount:", 1);
    v12 = objc_opt_new(NSMutableDictionary);
    importingOperationsInFlight = v9->_importingOperationsInFlight;
    v9->_importingOperationsInFlight = v12;

    identifier = v9->_identifier;
    v9->_identifier = (NSString *)CFSTR("com.apple.ibooks.plist.importing");

    v15 = dispatch_queue_create("com.apple.ibooks.BKLibraryDataSourcePlistImporting.ivarSerialQueue", 0);
    ivarSerialQueue = v9->_ivarSerialQueue;
    v9->_ivarSerialQueue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.ibooks.BKLibraryDataSourcePlistImporting.workQueue", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    -[BKLibraryDataSourcePlistImporting p_createPurchasesDirectory](v9, "p_createPurchasesDirectory");
  }
  kdebug_trace(725353716, 23, 0, 0, 0);

  return v9;
}

- (BKAssetImportingDelegate)importingDelegate
{
  return (BKAssetImportingDelegate *)objc_loadWeakRetained((id *)&self->_importingDelegate);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasCleanedUpImportedFiles
{
  _BOOL4 v3;

  v3 = -[BKLibraryDataSourcePlistImporting _hasCleanedUpFileProtectionOnImportedFiles](self, "_hasCleanedUpFileProtectionOnImportedFiles");
  if (v3)
    LOBYTE(v3) = -[BKLibraryDataSourcePlistImporting _hasCleanedUpBackupAttributeOnImportedFiles](self, "_hasCleanedUpBackupAttributeOnImportedFiles");
  return v3;
}

- (BOOL)_hasCleanedUpFileProtectionOnImportedFiles
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKPlistImportingHasCheckedFileProtection"));

  return v3;
}

- (BOOL)_hasCleanedUpBackupAttributeOnImportedFiles
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("BKPlistImportingHasCheckedBackupAttribute"));

  return v3;
}

- (BKLibraryDataSourcePlistImporting)init
{
  BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/datasources/BKLibraryDataSourcePlistImporting.m", 95, "-[BKLibraryDataSourcePlistImporting init]", "NO", CFSTR("Must call initWithMetadataCache:"));

  return 0;
}

- (id)p_destPathFromSrcPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting importingDelegate](self, "importingDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "importDestinationPathForAssetImporter:", self));

  v7 = objc_alloc_init((Class)NSFileManager);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("_")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bu_nonCollidingNameForFileName:inDestPath:", v9, v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v10));

  return v11;
}

- (void)p_deletePath:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v4, "length") && objc_msgSend(v3, "fileExistsAtPath:", v4))
    objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

}

- (id)p_assetIdentifierFromExtractionFileOp:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = objc_opt_class(BKPlistImportingOperationAttributes);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userContext"));

  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  if (v8)
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  else
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "temporaryAssetID"));
  v10 = (void *)v9;

  return v10;
}

- (id)p_storeIdFromEpubDirectory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v4));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("itemId")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting p_itemIdStringFromPlistEntry:](self, "p_itemIdStringFromPlistEntry:", v7));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)p_itemIdStringFromPlistEntry:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = objc_opt_class(NSNumber);
    v8 = BUDynamicCast(v7, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (!v9)
      goto LABEL_7;
    v10 = v9;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

    if (!v6)
      goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v6, "length") <= 1)
  {

LABEL_7:
    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting ivarSerialQueue](self, "ivarSerialQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BD244;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int64_t)coverSourceRank
{
  return 1;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v5 = v6;
  }

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
    v5 = v6;
  }

}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  BOOL v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  v8 = +[BKAssetUtilities contentTypeForPath:](BKAssetUtilities, "contentTypeForPath:", v7);

  if (a4)
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend(v6, "isFileURL");
    v12 = v8 == 4 || (v8 & 0xFFFFFFFD) == 1;
    if (v10)
      v9 = v12;
    else
      v9 = 0;
  }

  return v9;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
    v5 = v6;
  }

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "temporaryAssetID"));
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting ivarSerialQueue](self, "ivarSerialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BD51C;
    block[3] = &unk_1008E8898;
    block[4] = self;
    v12 = v7;
    v13 = v6;
    dispatch_async(v8, block);

  }
  else
  {
    v9 = objc_retainBlock(v6);
    v10 = v9;
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

  }
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  BKLibraryDataSourcePlistImporting *v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = -[BKLibraryDataSourcePlistImporting canImportURL:openInPlace:options:](self, "canImportURL:openInPlace:options:", v10, v8, a5);
  if (v12)
  {
    v13 = BKLibraryBookImportLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourcePlistImporting: importURL:%@", buf, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting assetImportingQueue](self, "assetImportingQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000BD720;
    v17[3] = &unk_1008E8898;
    v18 = v10;
    v19 = self;
    v20 = v11;
    objc_msgSend(v15, "addOperationWithBlock:", v17);

  }
  return v12;
}

- (void)clearAgingDocumentInbox
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BKLibraryDataSourcePlistImporting *v11;

  v3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Inbox")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting assetImportingQueue](self, "assetImportingQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000BDBAC;
  v9[3] = &unk_1008E7338;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "addOperationWithBlock:", v9);

}

- (id)p_coverImageFromZipArchive:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v24;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)SFUZipArchive), "initWithPath:collapseCommonRootDirectory:", v5, 0);
  if (!v6)
  {
    v11 = 0;
    v21 = 0;
    goto LABEL_25;
  }
  v7 = NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryWithName:", kIMLibraryPlistArtworkName));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    if (v11)
    {
LABEL_19:
      if ((+[IMCoverUtilities isUndesirableImageData:error:](IMCoverUtilities, "isUndesirableImageData:error:", v11, a4) & 1) == 0)
      {
        v21 = objc_msgSend(objc_alloc((Class)UIImage), "initWithData:", v11);
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  v12 = kIMLibraryPlistMetadataName;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryWithName:", kIMLibraryPlistMetadataName));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v12));
    objc_msgSend(v14, "copyToFile:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v17, "removeItemAtPath:error:", v15, 0);

    if (v16)
    {
      v24 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist coverPathFromPlistEntry:](IMLibraryPlist, "coverPathFromPlistEntry:", v16));
      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entryWithName:", v18));
        v20 = v19;
        if (v19)
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "data"));
        else
          v11 = 0;

      }
      else
      {
        v11 = 0;
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorMissingCoverPath, 0));
      }

      v8 = v24;
    }
    else
    {
      v11 = 0;
    }

    if (v11)
      goto LABEL_19;
LABEL_20:
    v21 = 0;
    goto LABEL_22;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_20;
  }
  v11 = 0;
  v21 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorMissingiTunesMetadata, 0));
LABEL_22:

LABEL_25:
  v22 = v21;

  return v22;
}

- (void)p_importBookWithAssetID:(id)a3 srcPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  BKPlistImportingOperationAttributes *v27;
  NSObject *v28;
  id v29;
  BKPlistImportingOperationAttributes *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  _QWORD block[5];
  id v41;
  BKPlistImportingOperationAttributes *v42;
  char v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = BKLibraryBookImportLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558786;
    v45 = 1752392040;
    v46 = 2112;
    v47 = v8;
    v48 = 2160;
    v49 = 1752392040;
    v50 = 2112;
    v51 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourcePlistImporting: p_importBookWithAssetID: %{mask.hash}@, srcPath: %{mask.hash}@.", buf, 0x2Au);
  }

  v13 = 0;
  v43 = 0;
  if (v8 && v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v9, &v43);

    if (v15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting p_destPathFromSrcPath:](self, "p_destPathFromSrcPath:", v9));
      v16 = +[BKAssetUtilities contentTypeForPath:](BKAssetUtilities, "contentTypeForPath:", v13);
      v17 = v16;
      if (v43)
        v18 = 1;
      else
        v18 = (_DWORD)v16 == 3;
      v19 = !v18;
      if (v18)
      {
        v20 = 1;
        goto LABEL_23;
      }
      if (+[SFUZipArchive isZipArchiveAtPath:](SFUZipArchive, "isZipArchiveAtPath:", v9))
      {
        v20 = 2;
LABEL_23:
        v23 = +[BKPlistImportingAsset newBlankAsset](BKPlistImportingAsset, "newBlankAsset");
        objc_msgSend(v23, "setAssetID:", v8);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting identifier](self, "identifier"));
        objc_msgSend(v23, "setDataSourceIdentifier:", v26);

        objc_msgSend(v23, "setContentType:", v17);
        objc_msgSend(v23, "setState:", v20);
        v27 = -[BKPlistImportingOperationAttributes initWithAssetID:contentType:]([BKPlistImportingOperationAttributes alloc], "initWithAssetID:contentType:", v8, v17);
        -[BKPlistImportingOperationAttributes setAsset:](v27, "setAsset:", v23);
        -[BKPlistImportingOperationAttributes setAssetSourcePath:](v27, "setAssetSourcePath:", v9);
        -[BKPlistImportingOperationAttributes setImportCompletionBlock:](v27, "setImportCompletionBlock:", v10);
        -[BKPlistImportingOperationAttributes setIsZipArchive:](v27, "setIsZipArchive:", v19);
        v28 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting ivarSerialQueue](self, "ivarSerialQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000BE718;
        block[3] = &unk_1008E7928;
        block[4] = self;
        v29 = v8;
        v41 = v29;
        v30 = v27;
        v42 = v30;
        dispatch_sync(v28, block);

        if ((_DWORD)v19)
        {
          v39 = 0;
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting p_coverImageFromZipArchive:error:](self, "p_coverImageFromZipArchive:error:", v9, &v39));
          v37 = v39;
          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager", v37));
            objc_msgSend(v32, "addCGImage:withIdentifier:priority:quality:", objc_msgSend(objc_retainAutorelease(v31), "CGImage"), v29, 3, 206);

          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting libraryManager](self, "libraryManager", v37));
          objc_msgSend(v33, "libraryDataSource:addedAsset:", self, v23);

          v34 = 1;
        }
        else
        {
          v34 = 2;
        }
        v35 = (void *)objc_opt_new(BKExtractFileOperation);
        objc_msgSend(v35, "setSourceFilePath:", v9);
        objc_msgSend(v35, "setDestinationFilePath:", v13);
        objc_msgSend(v35, "setSourceFileType:", v34);
        objc_msgSend(v35, "setDelegate:", self);
        objc_msgSend(v35, "setUserContext:", v30);
        objc_msgSend(v35, "setForcedFileProtection:", NSFileProtectionCompleteUntilFirstUserAuthentication);
        objc_msgSend(v35, "setFixFilePermissions:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting assetImportingQueue](self, "assetImportingQueue"));
        objc_msgSend(v36, "addOperation:", v35);

        goto LABEL_21;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  v21 = BKLibraryBookImportLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    v45 = 1752392040;
    v46 = 2112;
    v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourcePlistImporting: Not a valid asset.  Removing: %{mask.hash}@", buf, 0x16u);
  }

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorInvalidAssetError, 0));
  v24 = objc_retainBlock(v10);
  v25 = v24;
  if (v24)
    (*((void (**)(id, _QWORD, id))v24 + 2))(v24, 0, v23);

  -[BKLibraryDataSourcePlistImporting p_deletePath:](self, "p_deletePath:", v9);
LABEL_21:

}

- (void)extractOperationDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryDataSourcePlistImporting *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BE7F8;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)extractOperationDidUpdateProgress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting p_assetIdentifierFromExtractionFileOp:](self, "p_assetIdentifierFromExtractionFileOp:", v4));
  if (v5)
  {
    v6 = objc_msgSend(v4, "progress");
    v8 = v7;
    v9 = BKLibraryBookImportLog(v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationFilePath"));
      *(_DWORD *)buf = 138412802;
      v20 = v5;
      v21 = 2112;
      v22 = v16;
      v23 = 2048;
      v24 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[BKLibraryDataSourcePlistImporting] extractOperationDidUpdateProgress with assetID/path/progress [%@ | %@ | %f]", buf, 0x20u);

    }
    if (v8 >= 1.0)
      v11 = 5;
    else
      v11 = 4;
    v12 = objc_msgSend(objc_alloc((Class)BKLibraryDownloadStatus), "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v5, v11, 0, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12, BKLibraryDownloadStatusKey));
    v18 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "postNotificationName:object:userInfo:", BKLibraryDownloadStatusNotification, self, v14);

  }
}

- (void)extractOperationDidFail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  BKLibraryDataSourcePlistImporting *v18;
  id v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting p_assetIdentifierFromExtractionFileOp:](self, "p_assetIdentifierFromExtractionFileOp:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting libraryManager](self, "libraryManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryAssetOnMainQueueWithAssetID:", v5));

  v9 = BKLibraryBookImportLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10069EDBC((uint64_t)v5, v4, v10);

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting libraryManager](self, "libraryManager"));
    v20 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    objc_msgSend(v11, "deleteAssets:exhaustive:", v12, 0);

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "skipCleanupDestinationFile") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationFilePath"));
    -[BKLibraryDataSourcePlistImporting p_deletePath:](self, "p_deletePath:", v11);
    goto LABEL_7;
  }
LABEL_8:
  v13 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistImporting ivarSerialQueue](self, "ivarSerialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BF630;
  block[3] = &unk_1008E7928;
  v17 = v4;
  v18 = self;
  v19 = v5;
  v14 = v5;
  v15 = v4;
  dispatch_async(v13, block);

}

- (void)cleanupImportedFiles
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  if (!-[BKLibraryDataSourcePlistImporting hasCleanedUpImportedFiles](self, "hasCleanedUpImportedFiles"))
  {
    global_queue = dispatch_get_global_queue(17, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BF854;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (BOOL)_cleanupFileProtectionOnItemAtURL:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v3 = a3;
  v34 = 0;
  v33 = 0;
  v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v34, NSURLFileProtectionKey, &v33);
  v5 = v34;
  v6 = v33;
  v7 = v6;
  if (!v4)
  {
    v12 = BCIMLog(v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10069EFF0();
    v14 = 0;
    v15 = v5;
    goto LABEL_19;
  }
  if ((objc_msgSend(v5, "isEqualToString:", NSURLFileProtectionComplete) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", NSURLFileProtectionCompleteUnlessOpen))
  {
    v14 = 1;
    goto LABEL_21;
  }
  v32 = v7;
  v8 = objc_msgSend(v3, "setResourceValue:forKey:error:", NSURLFileProtectionCompleteUntilFirstUserAuthentication, NSURLFileProtectionKey, &v32);
  v9 = v32;

  if ((v8 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v16 = BCIMLog(v10);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10069EF90();

    v11 = 1;
  }
  v30 = 0;
  v31 = 0;
  v18 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v31, NSURLFileProtectionKey, &v30);
  v15 = v31;

  v7 = v30;
  if (!v18)
  {
    v28 = BCIMLog(v19);
    v13 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10069EF30();
    v14 = 0;
    goto LABEL_19;
  }
  v20 = objc_msgSend(v15, "isEqualToString:", NSURLFileProtectionCompleteUntilFirstUserAuthentication);
  v14 = (v11 | v20 ^ 1) == 0;
  if ((v20 & 1) == 0)
  {
    v21 = BCIMLog(v20);
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10069EECC((uint64_t)v3, v13, v22, v23, v24, v25, v26, v27);
LABEL_19:

  }
  v5 = v15;
LABEL_21:

  return v14;
}

- (BOOL)_cleanupBackupAttributeOnItemAtURL:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v3 = a3;
  v19 = 0;
  v18 = 0;
  v4 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v19, NSURLIsExcludedFromBackupKey, &v18);
  v5 = v19;
  v6 = v18;
  v7 = v6;
  if (v4)
  {
    if (v5 && !objc_msgSend(v5, "BOOLValue"))
    {
      v14 = 1;
      goto LABEL_15;
    }
    v17 = v7;
    v8 = objc_msgSend(v3, "setResourceValue:forKey:error:", &__kCFBooleanFalse, NSURLIsExcludedFromBackupKey, &v17);
    v9 = v17;

    v11 = BCIMLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "success setting NSURLIsExcludedFromBackupKey to NO on %@", buf, 0xCu);
      }
      v14 = 1;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10069F050();
      v14 = 0;
    }
  }
  else
  {
    v15 = BCIMLog(v6);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10069F0B0();
    v14 = 0;
    v9 = v7;
  }

  v7 = v9;
LABEL_15:

  return v14;
}

- (void)setImportingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_importingDelegate, a3);
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (BKLibraryDataSourcePlistWriting)plistWriter
{
  return (BKLibraryDataSourcePlistWriting *)objc_loadWeakRetained((id *)&self->_plistWriter);
}

- (id)reloadCounterpartHandler
{
  return self->_reloadCounterpartHandler;
}

- (NSOperationQueue)assetImportingQueue
{
  return self->_assetImportingQueue;
}

- (void)setAssetImportingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetImportingQueue, a3);
}

- (BKAssetMetadataCaching)metadataCache
{
  return (BKAssetMetadataCaching *)objc_loadWeakRetained((id *)&self->_metadataCache);
}

- (void)setMetadataCache:(id)a3
{
  objc_storeWeak((id *)&self->_metadataCache, a3);
}

- (OS_dispatch_queue)ivarSerialQueue
{
  return self->_ivarSerialQueue;
}

- (void)setIvarSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ivarSerialQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableDictionary)importingOperationsInFlight
{
  return self->_importingOperationsInFlight;
}

- (void)setImportingOperationsInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_importingOperationsInFlight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importingOperationsInFlight, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ivarSerialQueue, 0);
  objc_destroyWeak((id *)&self->_metadataCache);
  objc_storeStrong((id *)&self->_assetImportingQueue, 0);
  objc_storeStrong(&self->_reloadCounterpartHandler, 0);
  objc_destroyWeak((id *)&self->_plistWriter);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
  objc_destroyWeak((id *)&self->_importingDelegate);
}

@end
