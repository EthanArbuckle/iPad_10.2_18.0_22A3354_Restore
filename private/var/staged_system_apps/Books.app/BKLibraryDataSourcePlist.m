@implementation BKLibraryDataSourcePlist

+ (id)iTunesSyncedBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKLibraryDataSourcePlist *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BKLibraryDataSourcePlist initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:]([BKLibraryDataSourcePlist alloc], "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", 0, CFSTR("com.apple.ibooks.plist.iTunesSynced"), v9, v8, v7);

  return v10;
}

+ (id)stashedSampleBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKLibraryDataSourcePlistStashedSampleBooks *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BKLibraryDataSourcePlistStashedSampleBooks initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:]([BKLibraryDataSourcePlistStashedSampleBooks alloc], "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", 5, CFSTR("com.apple.iBooks.plist.sample.stashed"), v9, v8, v7);

  return v10;
}

+ (id)managedBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKLibraryDataSourcePlistManagedBooks *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BKLibraryDataSourcePlist initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:]([BKLibraryDataSourcePlistManagedBooks alloc], "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", 2, CFSTR("com.apple.ibooks.plist.managed"), v9, v8, v7);

  return v10;
}

+ (id)untetheredBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKLibraryDataSourcePlistUntetheredBooks *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BKLibraryDataSourcePlistUntetheredBooks initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:]([BKLibraryDataSourcePlistUntetheredBooks alloc], "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", 1, CFSTR("com.apple.ibooks.plist.untethered"), v9, v8, v7);

  return v10;
}

+ (id)sampleBooksPlistDataSourceWithAssetMetadataProvider:(id)a3 coverImageHelper:(id)a4 assetMetadataCache:(id)a5
{
  id v7;
  id v8;
  id v9;
  BKLibraryDataSourcePlistSampleBooks *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[BKLibraryDataSourcePlist initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:]([BKLibraryDataSourcePlistSampleBooks alloc], "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", 4, CFSTR("com.apple.iBooks.plist.sample"), v9, v8, v7);

  return v10;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setDidWritePlistHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeWeak((id *)&self->_libraryManager, a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BKLibraryDataSourcePlist)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BKLibraryDataSourcePlist *v17;
  uint64_t v18;
  IMLibraryPlist *plist;
  NSCache *v20;
  NSCache *assetCache;
  NSCache *v22;
  NSCache *assetCacheByTemporaryAssetID;
  uint64_t v24;
  NSMutableSet *restoringFromBackupAssetIDs;
  uint64_t v26;
  NSMutableSet *restoringFromBackupTemporaryAssetIDs;
  dispatch_queue_t v28;
  OS_dispatch_queue *assetsQueue;
  dispatch_queue_t v30;
  OS_dispatch_queue *updateAssetMetadataQueue;
  dispatch_queue_t v32;
  OS_dispatch_queue *ioQueue;
  uint64_t v34;
  NSMutableDictionary *fullPathToAssetID;
  dispatch_queue_t v36;
  OS_dispatch_queue *itunesuQueue;
  uint64_t v38;
  NSString *lastReloadDigest;
  objc_super v41;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  kdebug_trace(725353716, 32, 0, 0, 0);
  v41.receiver = self;
  v41.super_class = (Class)BKLibraryDataSourcePlist;
  v17 = -[BKLibraryDataSourcePlist init](&v41, "init");
  if (v17)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[IMLibraryPlist libraryPlistWithKind:](IMLibraryPlist, "libraryPlistWithKind:", a3));
    plist = v17->_plist;
    v17->_plist = (IMLibraryPlist *)v18;

    objc_storeStrong((id *)&v17->_identifier, a4);
    v20 = (NSCache *)objc_alloc_init((Class)NSCache);
    assetCache = v17->_assetCache;
    v17->_assetCache = v20;

    -[NSCache setName:](v17->_assetCache, "setName:", CFSTR("assetCache"));
    v22 = (NSCache *)objc_alloc_init((Class)NSCache);
    assetCacheByTemporaryAssetID = v17->_assetCacheByTemporaryAssetID;
    v17->_assetCacheByTemporaryAssetID = v22;

    -[NSCache setName:](v17->_assetCacheByTemporaryAssetID, "setName:", CFSTR("assetCacheByTemporaryAssetID"));
    v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    restoringFromBackupAssetIDs = v17->_restoringFromBackupAssetIDs;
    v17->_restoringFromBackupAssetIDs = (NSMutableSet *)v24;

    v26 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    restoringFromBackupTemporaryAssetIDs = v17->_restoringFromBackupTemporaryAssetIDs;
    v17->_restoringFromBackupTemporaryAssetIDs = (NSMutableSet *)v26;

    v28 = dispatch_queue_create("BKLibraryDataSourcePlist.assetsQueue", 0);
    assetsQueue = v17->_assetsQueue;
    v17->_assetsQueue = (OS_dispatch_queue *)v28;

    v30 = dispatch_queue_create("BKLibraryDataSourcePlist.updateAssetMetadataQueue", 0);
    updateAssetMetadataQueue = v17->_updateAssetMetadataQueue;
    v17->_updateAssetMetadataQueue = (OS_dispatch_queue *)v30;

    objc_storeWeak((id *)&v17->_assetMetadataProvider, v14);
    objc_storeWeak((id *)&v17->_assetMetadataCache, v16);
    objc_storeWeak((id *)&v17->_coverImageHelper, v15);
    v32 = dispatch_queue_create("BKLibraryDataSourcePlist.ioQueue", 0);
    ioQueue = v17->_ioQueue;
    v17->_ioQueue = (OS_dispatch_queue *)v32;

    v34 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    fullPathToAssetID = v17->_fullPathToAssetID;
    v17->_fullPathToAssetID = (NSMutableDictionary *)v34;

    v36 = dispatch_queue_create("com.apple.iBooks.BKLibraryDataSourcePlist.iTunesU", 0);
    itunesuQueue = v17->_itunesuQueue;
    v17->_itunesuQueue = (OS_dispatch_queue *)v36;

    v38 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plistDigest](v17, "plistDigest"));
    lastReloadDigest = v17->_lastReloadDigest;
    v17->_lastReloadDigest = (NSString *)v38;

  }
  kdebug_trace(725353716, 33, 0, 0, 0);

  return v17;
}

- (id)plistDigest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "calculateChecksum"));

  return v3;
}

- (IMLibraryPlist)plist
{
  return self->_plist;
}

- (void)reloadIfChanged
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist lastReloadDigest](self, "lastReloadDigest"));
  if (!v3
    || (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist lastReloadDigest](self, "lastReloadDigest")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plistDigest](self, "plistDigest")),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v5,
        v4,
        (v7 & 1) == 0))
  {
    -[BKLibraryDataSourcePlist reload](self, "reload");
  }
}

- (NSString)lastReloadDigest
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (BKLibraryManager)libraryManager
{
  return (BKLibraryManager *)objc_loadWeakRetained((id *)&self->_libraryManager);
}

- (id)importDestinationPathForAssetImporter:(id)a3
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier", a3));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ibooks.plist.untethered"));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist purchasesRepositoryPath](IMLibraryPlist, "purchasesRepositoryPath"));
  else
    v5 = 0;
  return v5;
}

- (NSString)directory
{
  return (NSString *)-[IMLibraryPlist directory](self->_plist, "directory");
}

- (void)setPlistForUnitTest:(id)a3
{
  objc_storeStrong((id *)&self->_plist, a3);
}

- (BKLibraryDataSourcePlist)initWithTestPlist:(id)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  IMLibraryPlist *v12;
  BKLibraryDataSourcePlist *v13;
  IMLibraryPlist *plist;

  v12 = (IMLibraryPlist *)a3;
  v13 = -[BKLibraryDataSourcePlist initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:](self, "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", 0, a4, a5, a6, a7);
  plist = v13->_plist;
  v13->_plist = v12;

  return v13;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p id=%@ plist=%@ rank=%ld>"), v5, self, v6, v9, -[BKLibraryDataSourcePlist rank](self, "rank")));

  return (NSString *)v10;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetIDsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C9F28;
  v7[3] = &unk_1008E7680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_addAssetIDsToCacheManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v11, v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v15, "addURLs:priority:quality:expiresAfter:", v5, 3, -[BKLibraryDataSourcePlist qualitySetting](self, "qualitySetting"), 0);

  }
}

- (void)_removeAssetIDsFromCacheManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKCoverCacheURLSchemeHandler urlStringForAssetID:dataSourceID:](BKCoverCacheURLSchemeHandler, "urlStringForAssetID:dataSourceID:", v11, v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    objc_msgSend(v15, "removeURLs:priority:quality:", v5, 3, -[BKLibraryDataSourcePlist qualitySetting](self, "qualitySetting"));

  }
}

- (unsigned)qualitySetting
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned int v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iBooks.plist.sample"));

  if ((v4 & 1) != 0)
    return 204;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.iBooks.plist.sample.stashed"));

  if (v7)
    return 205;
  else
    return 206;
}

- (BOOL)_isSupplementalPDFFromPlistEntry:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  v5 = +[IMLibraryPlist isSupplementalContentFromPlistEntry:](IMLibraryPlist, "isSupplementalContentFromPlistEntry:", v4);
  LODWORD(self) = -[BKLibraryDataSourcePlist _contentTypeFromPlistEntry:logFailure:](self, "_contentTypeFromPlistEntry:logFailure:", v4, 0);

  if ((_DWORD)self == 3)
    return v5;
  else
    return 0;
}

- (void)fetchAssetsWithIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKLibraryDataSourcePlist *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  kdebug_trace(725353716, 72, 0, 0, 0);
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CA958;
  block[3] = &unk_1008E8898;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (int64_t)coverSourceRank
{
  return 4;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  BKLibraryDataSourcePlist *v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("assetID")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("permlink")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist coverImageHelper](self, "coverImageHelper"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("path")));
    if (v13)
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v13));
    else
      v14 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001CB3EC;
    v17[3] = &unk_1008EF348;
    v21 = v8;
    v18 = v11;
    v19 = self;
    v20 = v9;
    objc_msgSend(v12, "coverImageFromURL:completion:", v14, v17);

  }
  else
  {
    v15 = objc_retainBlock(v8);
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorInvalidAssetError, 0));
      (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v16);

    }
  }

}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  id v27;
  id v28;
  NSMutableDictionary *v29;
  id obj;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v6 = a3;
  v28 = a5;
  v9 = BKLibraryLog(v28, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1006A4F68();

  v11 = objc_opt_new(NSMutableArray);
  v29 = objc_opt_new(NSMutableDictionary);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
        if (v17)
        {
          -[NSMutableArray addObject:](v11, "addObject:", v17);
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
          if (v18)
          {
            v19 = (void *)v18;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataSourceIdentifier"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
            v22 = objc_msgSend(v20, "isEqualToString:", v21);

            if (v22)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
              -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v23, v17);

            }
          }
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v13);
  }

  if (-[NSMutableArray count](v11, "count"))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001CB8A8;
    v32[3] = &unk_1008EA2C0;
    v24 = v28;
    v33 = v28;
    v25 = v29;
    -[BKLibraryDataSourcePlist _deleteAssetIDs:assetIDToPath:completion:](self, "_deleteAssetIDs:assetIDToPath:completion:", v11, v29, v32);
    v26 = v33;
  }
  else
  {
    v24 = v28;
    v27 = objc_retainBlock(v28);
    v26 = v27;
    v25 = v29;
    if (v27)
      (*((void (**)(id, uint64_t, _QWORD))v27 + 2))(v27, 1, 0);
  }

}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  return 0;
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
  id v6;
  id v7;
  _QWORD v8[4];
  BKLibraryDataSourcePlist *v9;
  id v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CB9CC;
  v8[3] = &unk_1008ED900;
  v9 = self;
  v10 = a3;
  v11 = a5;
  v6 = v11;
  v7 = v10;
  -[BKLibraryDataSourcePlist assetForLibraryAsset:completion:](v9, "assetForLibraryAsset:completion:", v7, v8);

}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v10 = BKLibraryLog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1006A5098();

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v17 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001CBBC8;
  v15[3] = &unk_1008EA1D0;
  v16 = v7;
  v14 = v7;
  -[BKLibraryDataSourcePlist fetchAssetsWithIDs:completion:](self, "fetchAssetsWithIDs:completion:", v13, v15);

}

- (void)updateAsset:(id)a3 userEditedTitle:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  BKLibraryDataSourcePlist *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = BKLibraryLog(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    *(_DWORD *)buf = 138544130;
    v28 = v15;
    v29 = 2160;
    v30 = 1752392040;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DataSourcePlist: %{public}@ Updating assetID:%{mask.hash}@ with title:(%@)", buf, 0x2Au);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  v18 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001CBEA8;
  v22[3] = &unk_1008E8EE0;
  v23 = v17;
  v24 = self;
  v25 = v9;
  v26 = v10;
  v19 = v10;
  v20 = v9;
  v21 = v17;
  dispatch_async(v18, v22);

}

- (void)updateAsset:(id)a3 isEphemeral:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  BKLibraryDataSourcePlist *v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12 = BKLibraryLog(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    *(_DWORD *)buf = 138543874;
    v27 = v18;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@ Updating asset %@ isEphemeral: %@", buf, 0x20u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  v15 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001CC2E4;
  v21[3] = &unk_1008E96C0;
  v22 = v14;
  v23 = self;
  v25 = v6;
  v24 = v9;
  v16 = v9;
  v17 = v14;
  dispatch_async(v15, v21);

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

- (void)reload
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001CC66C;
  v4[3] = &unk_1008EF3C0;
  v4[4] = self;
  objc_msgSend(v3, "libraryDataSource:updateWithName:block:", self, CFSTR("reload"), v4);

}

- (void)reloadInGroup:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plistDigest](self, "plistDigest"));
  -[BKLibraryDataSourcePlist setLastReloadDigest:](self, "setLastReloadDigest:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
  objc_msgSend(v6, "libraryDataSource:reloadInGroup:", self, v4);

}

- (void)reloadAssetsForAddingWithAssetIDs:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001CC740;
  v3[3] = &unk_1008EC288;
  v3[4] = self;
  -[BKLibraryDataSourcePlist fetchAssetsWithIDs:completion:](self, "fetchAssetsWithIDs:completion:", a3, v3);
}

- (BOOL)hasDigestChangedSinceFetch
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist lastFetchDigest](self, "lastFetchDigest"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist lastFetchDigest](self, "lastFetchDigest"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plistDigest](self, "plistDigest"));
    v6 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)updateFetchDigest
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plistDigest](self, "plistDigest"));
  -[BKLibraryDataSourcePlist setLastFetchDigest:](self, "setLastFetchDigest:", v3);

}

- (BOOL)wantsPlistEntry:(id)a3
{
  return 1;
}

- (void)assetAccountIdentifiersForAssetID:(id)a3 storeID:(id)a4 path:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BKDataSourcePlistAccountIdentifiers *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  id v38;
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = kBKLibraryDataSourceErrorInvalidAssetError;
  v14 = objc_autoreleasePoolPush();
  if (objc_msgSend(v11, "length"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_perUserBookURLForBookURL:", v18));

    if (v19)
    {
      v39 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v20));
      if (v21)
      {
        v22 = objc_opt_new(BKDataSourcePlistAccountIdentifiers);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKeyPath:", CFSTR("accountInfo.FamilyID")));
        v25 = BUStoreIdStringFromObject(v24);
        v38 = v10;
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        -[BKDataSourcePlistAccountIdentifiers setFamilyID:](v22, "setFamilyID:", v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKeyPath:", CFSTR("accountInfo.DSPersonID")));
        v28 = BUStoreIdStringFromObject(v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        -[BKDataSourcePlistAccountIdentifiers setDownloadedDSID:](v22, "setDownloadedDSID:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForKeyPath:", CFSTR("accountInfo.PurchaserID")));
        v31 = BUStoreIdStringFromObject(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        -[BKDataSourcePlistAccountIdentifiers setPurchasedDSID:](v22, "setPurchasedDSID:", v32);

        v10 = v38;
        v13 = 0;
      }
      else
      {
        v22 = 0;
      }

      v9 = v39;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v33 = BKLibraryLog(0, v15, v16);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1006A5128();

    v22 = 0;
  }
  objc_autoreleasePoolPop(v14);
  v35 = objc_retainBlock(v12);
  v36 = (void (**)(_QWORD, _QWORD, _QWORD))v35;
  if (v13)
  {
    if (v35)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, v13, 0));
      ((void (**)(_QWORD, _QWORD, void *))v36)[2](v36, 0, v37);

    }
  }
  else if (v35)
  {
    (*((void (**)(id, BKDataSourcePlistAccountIdentifiers *, _QWORD))v35 + 2))(v35, v22, 0);
  }

}

- (void)addPlistAssetsIfNeeded:(id)a3 completion:(id)a4
{
  -[BKLibraryDataSourcePlist p_addPlistAssets:checkForDuplicates:completion:](self, "p_addPlistAssets:checkForDuplicates:completion:", a3, 1, a4);
}

- (void)addPlistAssets:(id)a3 completion:(id)a4
{
  -[BKLibraryDataSourcePlist p_addPlistAssets:checkForDuplicates:completion:](self, "p_addPlistAssets:checkForDuplicates:completion:", a3, 0, a4);
}

- (void)p_addPlistAssets:(id)a3 checkForDuplicates:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  NSObject *v53;
  NSMutableDictionary *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  NSMutableDictionary *v59;
  NSMutableArray *v60;
  id v61;
  id obj;
  uint64_t v64;
  _QWORD block[5];
  NSMutableDictionary *v66;
  NSMutableArray *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];

  v6 = a4;
  v7 = a3;
  v58 = a5;
  v10 = BKLibraryLog(v58, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1006A51A4();

  v60 = objc_opt_new(NSMutableArray);
  v59 = objc_opt_new(NSMutableDictionary);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (v12)
  {
    v13 = v12;
    v64 = *(_QWORD *)v70;
    do
    {
      v14 = 0;
      v61 = v13;
      do
      {
        if (*(_QWORD *)v70 != v64)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "url"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
        if (v6)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "contents"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist entryForAssetID:contents:](IMLibraryPlist, "entryForAssetID:contents:", v17, v19));

          v21 = v20 == 0;
        }
        else
        {
          v21 = 1;
        }
        if (objc_msgSend(v16, "isFileURL"))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
          if (!objc_msgSend(v22, "length"))
            v21 = 0;

          if (v21)
          {
            v23 = objc_alloc_init((Class)NSMutableDictionary);
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "author"));
            v25 = objc_msgSend(v24, "length");

            if (v25)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "author"));
              objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("author"));

            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
            v28 = objc_msgSend(v27, "length");

            if (v28)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
              objc_msgSend(v23, "setObject:forKey:", v29, CFSTR("title"));

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "genre"));
            v31 = objc_msgSend(v30, "length");

            if (v31)
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "genre"));
              objc_msgSend(v23, "setObject:forKey:", v32, CFSTR("genre"));

            }
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
            v34 = objc_msgSend(v33, "length");

            if (v34)
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
              objc_msgSend(v23, "setObject:forKey:", v35, CFSTR("storeId"));

            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
            v37 = objc_msgSend(v36, "length");

            if (v37)
            {
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
              objc_msgSend(v23, "setObject:forKey:", v38, CFSTR("assetID"));

            }
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortTitle"));
            v40 = objc_msgSend(v39, "length");

            if (v40)
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortTitle"));
              objc_msgSend(v23, "setObject:forKey:", v41, CFSTR("sortTitle"));

            }
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortAuthor"));
            v43 = objc_msgSend(v42, "length");

            if (v43)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortAuthor"));
              objc_msgSend(v23, "setObject:forKey:", v44, CFSTR("sortAuthor"));

            }
            if (objc_msgSend(v15, "isProof"))
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "isProof")));
              objc_msgSend(v23, "setObject:forKey:", v45, CFSTR("proof"));

            }
            if (objc_msgSend(v15, "isEphemeral"))
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "isEphemeral")));
              objc_msgSend(v23, "setObject:forKey:", v46, CFSTR("ephemeral"));

            }
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "purchaseDate"));

            if (v47)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "purchaseDate"));
              objc_msgSend(v23, "setObject:forKey:", v48, CFSTR("importDate"));

            }
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
            objc_msgSend(v23, "setObject:forKey:", v49, CFSTR("path"));

            v50 = -[BKLibraryDataSourcePlist _newEntryFromSummary:](self, "_newEntryFromSummary:", v23);
            -[NSMutableArray addObject:](v60, "addObject:", v50);
            v51 = +[BKPlistAsset newBlankAsset](BKPlistAsset, "newBlankAsset");
            -[BKLibraryDataSourcePlist _setPropertiesOfAsset:withPlistEntry:](self, "_setPropertiesOfAsset:withPlistEntry:", v51, v50);
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v51, v52);

            v13 = v61;
          }
        }

        v14 = (char *)v14 + 1;
      }
      while (v13 != v14);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    }
    while (v13);
  }

  if (-[NSMutableArray count](v60, "count"))
  {
    v53 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001CD1E0;
    block[3] = &unk_1008E8EE0;
    block[4] = self;
    v54 = v59;
    v66 = v59;
    v67 = v60;
    v55 = v58;
    v68 = v58;
    dispatch_async(v53, block);

  }
  else
  {
    v55 = v58;
    v56 = objc_retainBlock(v58);
    v57 = v56;
    v54 = v59;
    if (v56)
      (*((void (**)(id, uint64_t, _QWORD))v56 + 2))(v56, 1, 0);

  }
}

- (void)removePlistAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSMutableSet *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSMutableSet *v24;
  _QWORD block[4];
  NSMutableSet *v26;
  BKLibraryDataSourcePlist *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v10 = BKLibraryLog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1006A523C();

  v12 = objc_opt_new(NSMutableSet);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
        v20 = objc_msgSend(v19, "length");

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
          -[NSMutableSet addObject:](v12, "addObject:", v21);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  v22 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD5E8;
  block[3] = &unk_1008E8898;
  v26 = v12;
  v27 = self;
  v28 = v7;
  v23 = v7;
  v24 = v12;
  dispatch_async(v22, block);

}

- (void)updatePlistAssets:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v4 = objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
    v4 = v5;
  }

}

- (id)coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = sub_10004E530;
  v37 = sub_10004E300;
  v38 = 0;
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = sub_10004E530;
  v31 = sub_10004E300;
  v32 = 0;
  v21 = 0;
  v22 = (id *)&v21;
  v23 = 0x3032000000;
  v24 = sub_10004E530;
  v25 = sub_10004E300;
  v26 = 0;
  v6 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CD968;
  block[3] = &unk_1008E7630;
  block[4] = self;
  v7 = v4;
  v17 = v7;
  v18 = &v33;
  v19 = &v27;
  v20 = &v21;
  dispatch_sync(v6, block);

  if (v34[5] && v28[5] && v22[5])
    goto LABEL_14;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetMetadataProvider](self, "assetMetadataProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "coverWritingModeLanguageAndPageProgressionDirectionFromAssetID:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("coverWritingMode")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("language")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pageProgressionDirection")));
  if (!v34[5] && v10)
    objc_storeStrong(v34 + 5, v10);
  if (!v28[5] && v11)
    objc_storeStrong(v28 + 5, v11);
  if (!v22[5] && v12)
    objc_storeStrong(v22 + 5, v12);

  if (v34[5])
LABEL_14:
    objc_msgSend(v5, "setObject:forKey:");
  v13 = v28[5];
  if (v13)
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("language"));
  v14 = v22[5];
  if (v14)
    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("pageProgressionDirection"));

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v5;
}

- (id)plistEntryAsDictionaryFromAssetID:(id)a3 path:(id)a4 needsCoordination:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_10004E530;
  v22 = sub_10004E300;
  v23 = 0;
  v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001CDD4C;
  v14[3] = &unk_1008EF3E8;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = &v18;
  v10 = v8;
  v11 = v7;
  dispatch_sync(v9, v14);

  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (void)q_refreshAssetCachesFromPlistContents:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist booksArrayFromPlistEntry:](IMLibraryPlist, "booksArrayFromPlistEntry:", a3));
  v7 = BKLibraryLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
    *(_DWORD *)buf = 138543618;
    v31 = v9;
    v32 = 2048;
    v33 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: q_refreshAssetCachesFromPlistContents: Refreshing asset caches. count: %ld", buf, 0x16u);

  }
  -[BKLibraryDataSourcePlist q_clearAssetCaches](self, "q_clearAssetCaches");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v14);
        v16 = +[BKPlistAsset newBlankAsset](BKPlistAsset, "newBlankAsset", (_QWORD)v25);
        -[BKLibraryDataSourcePlist _setPropertiesOfAsset:withPlistEntry:](self, "_setPropertiesOfAsset:withPlistEntry:", v16, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
        v18 = objc_msgSend(v17, "length");

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetCache](self, "assetCache"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetID"));
          objc_msgSend(v19, "setObject:forKey:", v16, v20);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "temporaryAssetID"));
        v22 = objc_msgSend(v21, "length");

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetCacheByTemporaryAssetID](self, "assetCacheByTemporaryAssetID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "temporaryAssetID"));
          objc_msgSend(v23, "setObject:forKey:", v16, v24);

        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

}

- (void)q_clearAssetCaches
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetCache](self, "assetCache"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetCacheByTemporaryAssetID](self, "assetCacheByTemporaryAssetID"));
  objc_msgSend(v4, "removeAllObjects");

}

- (void)q_evictFromAssetCaches:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetCache](self, "assetCache"));
  objc_msgSend(v5, "removeObjectForKey:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetCacheByTemporaryAssetID](self, "assetCacheByTemporaryAssetID"));
  objc_msgSend(v6, "removeObjectForKey:", v4);

}

- (id)_pathStringWithoutDirectoryPrefix:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist purchasesRepositoryPath](IMLibraryPlist, "purchasesRepositoryPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", v4, &stru_10091C438));

  return v5;
}

- (id)_newEntryFromSummary:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v4 = a3;
  v5 = -[BKLibraryDataSourcePlist writesFullPaths](self, "writesFullPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("path")));
  if ((v5 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist _pathStringWithoutDirectoryPrefix:](self, "_pathStringWithoutDirectoryPrefix:", v6));

    if (objc_msgSend(v7, "characterAtIndex:", 0) == 47)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 1));

      v7 = (void *)v8;
    }
    if (objc_msgSend(v7, "characterAtIndex:", (char *)objc_msgSend(v7, "length") - 1) == 47)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 1));

    }
    else
    {
      v6 = v7;
    }
  }
  if (objc_msgSend(v6, "length"))
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v9, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("Inserted-By-iBooks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForPath](IMLibraryPlist, "keyNameForPath"));
    objc_msgSend(v9, "setObject:forKey:", v6, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("author")));
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("author")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForAuthor](IMLibraryPlist, "keyNameForAuthor"));
      objc_msgSend(v9, "setObject:forKey:", v13, v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("title")));
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("title")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForTitle](IMLibraryPlist, "keyNameForTitle"));
      objc_msgSend(v9, "setObject:forKey:", v17, v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("genre")));
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("genre")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForGenre](IMLibraryPlist, "keyNameForGenre"));
      objc_msgSend(v9, "setObject:forKey:", v21, v22);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("storeId")));
    v24 = objc_msgSend(v23, "length");

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("storeId")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForStoreId](IMLibraryPlist, "keyNameForStoreId"));
      objc_msgSend(v9, "setObject:forKey:", v25, v26);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("assetID")));
    v28 = objc_msgSend(v27, "length");

    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("assetID")));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForUniqueId](IMLibraryPlist, "keyNameForUniqueId"));
      objc_msgSend(v9, "setObject:forKey:", v29, v30);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sortAuthor")));
    v32 = objc_msgSend(v31, "length");

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sortAuthor")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("author")));
      v35 = objc_msgSend(v33, "isEqualToString:", v34);

      if ((v35 & 1) == 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sortAuthor")));
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForSortAuthor](IMLibraryPlist, "keyNameForSortAuthor"));
        objc_msgSend(v9, "setObject:forKey:", v36, v37);

      }
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sortTitle")));
    v39 = objc_msgSend(v38, "length");

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sortTitle")));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("title")));
      v42 = objc_msgSend(v40, "isEqualToString:", v41);

      if ((v42 & 1) == 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("sortTitle")));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForSortTitle](IMLibraryPlist, "keyNameForSortTitle"));
        objc_msgSend(v9, "setObject:forKey:", v43, v44);

      }
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("pageProgressionDirection")));
    v46 = objc_msgSend(v45, "length");

    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("pageProgressionDirection")));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForPageProgression](IMLibraryPlist, "keyNameForPageProgression"));
      objc_msgSend(v9, "setObject:forKey:", v47, v48);

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("proof")));
    v50 = objc_msgSend(v49, "BOOLValue");

    if (v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("proof")));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForProofedAsset](IMLibraryPlist, "keyNameForProofedAsset"));
      objc_msgSend(v9, "setObject:forKey:", v51, v52);

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ephemeral")));
    v54 = objc_msgSend(v53, "BOOLValue");

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("ephemeral")));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForIsEphemeral](IMLibraryPlist, "keyNameForIsEphemeral"));
      objc_msgSend(v9, "setObject:forKey:", v55, v56);

    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("importDate")));

    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("importDate")));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForImportDate](IMLibraryPlist, "keyNameForImportDate"));
      objc_msgSend(v9, "setObject:forKey:", v58, v59);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isiTunesSyncedPlist
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ibooks.plist.iTunesSynced"));

  return v3;
}

- (id)q_plistContentsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForBooksArray](IMLibraryPlist, "keyNameForBooksArray"));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist q_plistContentsArrayWithError:](self, "q_plistContentsArrayWithError:", a3));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  return v7;
}

- (id)q_plistContentsArrayWithError:(id *)a3
{
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  char v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  unsigned int v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  unsigned int v71;
  void *v72;
  BOOL v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  _BOOL8 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  void *v91;
  char *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  __int128 v117;
  void *context;
  void *v119;
  id v120;
  id v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  unsigned int v126;
  id obj;
  uint64_t v128;
  id v129;
  void *v130;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint8_t buf[4];
  uint64_t v138;
  __int16 v139;
  const char *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  const __CFString *v146;
  __int16 v147;
  void *v148;
  _BYTE v149[128];

  v3 = BKLibraryLog(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1006A5464(self, v4);

  v120 = objc_alloc_init((Class)NSMutableArray);
  v125 = objc_alloc_init((Class)NSMutableDictionary);
  v121 = objc_alloc_init((Class)NSMutableArray);
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
  context = objc_autoreleasePoolPush();
  v5 = 0;
  v119 = 0;
  do
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BLLockFile iTunesSyncLockFile](BLLockFile, "iTunesSyncLockFile"));
    if (objc_msgSend(v6, "tryLock:", 0))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contents"));

      v9 = 1;
      v10 = v6;
      v119 = (void *)v8;
    }
    else
    {
      v9 = 0;
      v10 = v6;
    }
    v11 = objc_msgSend(v10, "unlock");
    v14 = BKLibraryLog(v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
      v19 = (void *)v18;
      *(_DWORD *)buf = 138543874;
      v20 = "NO";
      if (v9)
        v20 = "YES";
      v138 = v18;
      v139 = 2082;
      v140 = v20;
      v141 = 1024;
      LODWORD(v142) = v5 + 1;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}@ -- read succeeded: %{public}s -- Try # %d", buf, 0x1Cu);

    }
    v16 = v5 > 8;
    if (v5 > 8)
      v17 = 1;
    else
      v17 = v9;
    if ((v17 & 1) == 0)
    {
      usleep(0x61A8u);
      v16 = 0;
    }

    ++v5;
  }
  while ((v16 | v9) != 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForBooksArray](IMLibraryPlist, "keyNameForBooksArray"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "objectForKey:", v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
  v126 = objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.ibooks.plist.iTunesSynced"));

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  obj = v22;
  v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v149, 16);
  if (v129)
  {
    v123 = 0;
    v128 = *(_QWORD *)v134;
    *(_QWORD *)&v24 = 138544130;
    v117 = v24;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v134 != v128)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)v25);
        if (-[BKLibraryDataSourcePlist wantsPlistEntry:](self, "wantsPlistEntry:", v26, v117)
          && (!v126
           || -[BKLibraryDataSourcePlist _contentTypeFromPlistEntry:logFailure:](self, "_contentTypeFromPlistEntry:logFailure:", v26, 0)))
        {
          v130 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v26));
          v27 = objc_msgSend(v26, "mutableCopy");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v27));
          if (objc_msgSend(v28, "length"))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "directory"));
            if ((objc_msgSend(v28, "hasPrefix:", CFSTR("/")) & 1) != 0
              || (objc_msgSend(v28, "hasPrefix:", v29) & 1) != 0)
            {
              v30 = v28;
            }
            else
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "directory"));
              v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathComponent:", v28));

            }
            objc_msgSend(v27, "setObject:forKey:", v30, CFSTR("BKLibraryDataSourcePlist-FullPath"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fileManager](self, "fileManager"));
            v33 = objc_msgSend(v32, "fileExistsAtPath:", v30);

            if ((v33 & 1) == 0)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibrarySharedContainerManager sharedInstance](BKLibrarySharedContainerManager, "sharedInstance"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sharedURLForEntry:", v26));

              if (!v35)
                goto LABEL_53;
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fileManager](self, "fileManager"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "path"));
              v50 = objc_msgSend(v48, "fileExistsAtPath:", v49);

              if (!v50)
                goto LABEL_53;
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "path"));
              objc_msgSend(v27, "setObject:forKey:", v51, CFSTR("BKLibraryDataSourcePlist-FullPath"));

              goto LABEL_44;
            }
            if (objc_msgSend(v122, "_isMultiUser")
              && objc_msgSend(v122, "_isShareableBook:", v26))
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibrarySharedContainerManager sharedInstance](BKLibrarySharedContainerManager, "sharedInstance"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sharedURLForEntry:", v26));

              if (!v35
                || (v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fileManager](self, "fileManager")),
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "path")),
                    v38 = objc_msgSend(v36, "fileExistsAtPath:", v37),
                    v37,
                    v36,
                    (v38 & 1) == 0))
              {
                objc_msgSend(v27, "removeObjectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fileManager](self, "fileManager"));
                v132 = 0;
                v40 = objc_msgSend(v39, "removeItemAtPath:error:", v30, &v132);
                v41 = (char *)v132;

                if (v40)
                {
                  v45 = BKLibraryLog(v42, v43, v44);
                  v46 = objc_claimAutoreleasedReturnValue(v45);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v138 = (uint64_t)v30;
                    v139 = 2112;
                    v140 = v41;
                    _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Failed to remove per-user file at path %@. Error: %@", buf, 0x16u);
                  }

                }
LABEL_53:

                v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
                objc_msgSend(v27, "setObject:forKey:", v62, CFSTR("BKLibraryDataSourcePlist-Exists"));

                if ((v123 & 1) == 0)
                {
                  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
                  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "delegate"));

                  if ((objc_opt_respondsToSelector(v67, "isRestoringFromiCloud") & 1) != 0)
                    BYTE4(v123) = objc_msgSend(v67, "isRestoringFromiCloud");
                  else
                    BYTE4(v123) = 0;

                }
                v86 = BKLibraryLog(v63, v64, v65);
                v87 = objc_claimAutoreleasedReturnValue(v86);
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
                {
                  v91 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                  v92 = (char *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v27));
                  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                  v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-Exists")));
                  v95 = (void *)v94;
                  *(_DWORD *)buf = 138544386;
                  v96 = &stru_10091C438;
                  if ((v123 & 0x100000000) != 0)
                    v96 = CFSTR("BUT iCloud Restore in progress, not removing this entry");
                  v138 = (uint64_t)v91;
                  v139 = 2112;
                  v140 = v92;
                  v141 = 2112;
                  v142 = v93;
                  v143 = 2112;
                  v144 = v94;
                  v145 = 2112;
                  v146 = v96;
                  _os_log_debug_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "%{public}@ Dead Entry: [%@ ==> %@] [Exists: %@] %@", buf, 0x34u);

                }
                if ((v123 & 0x100000000) != 0)
                {
                  BYTE4(v123) = 1;
                }
                else
                {
                  objc_msgSend(v121, "addObject:", v27);
                  BYTE4(v123) = 0;
                }
                LOBYTE(v123) = 1;
LABEL_87:

                goto LABEL_88;
              }
LABEL_44:

            }
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
            objc_msgSend(v27, "setObject:forKey:", v52, CFSTR("BKLibraryDataSourcePlist-Exists"));

          }
          if (!objc_msgSend(v130, "length"))
          {
            -[BKLibraryDataSourcePlist q_updateUniqueIDIfNeededInMutableEntry:withOriginalBookEntry:](self, "q_updateUniqueIDIfNeededInMutableEntry:withOriginalBookEntry:", v27, v26);
            objc_msgSend(v120, "addObject:", v27);
            goto LABEL_87;
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "objectForKey:", v130));
          if (v53)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist publicationVersionFromPlistEntry:](IMLibraryPlist, "publicationVersionFromPlistEntry:", v53));
            v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist publicationVersionFromPlistEntry:](IMLibraryPlist, "publicationVersionFromPlistEntry:", v27));
            v56 = objc_msgSend(v54, "longLongValue");
            v57 = -[__CFString longLongValue](v55, "longLongValue");
            if ((uint64_t)v57 > (uint64_t)v56)
            {
              v60 = BKLibraryLog(v57, v58, v59);
              v61 = objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              {
                v97 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                *(_DWORD *)buf = 138544642;
                v138 = (uint64_t)v97;
                v139 = 2112;
                v140 = (const char *)v130;
                v141 = 2112;
                v142 = v54;
                v143 = 2112;
                v144 = (uint64_t)v98;
                v145 = 2112;
                v146 = v55;
                v147 = 2112;
                v148 = v99;
                _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}@ Newer item taking over: [Store ID: %@] [Older: %@ -- %@] [Newer: %@ -- %@]", buf, 0x3Eu);

              }
              goto LABEL_84;
            }
            if (v57 != v56)
            {
              v83 = BKLibraryLog(v57, v58, v59);
              v84 = objc_claimAutoreleasedReturnValue(v83);
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
              {
                v101 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                *(_DWORD *)buf = 138544642;
                v138 = (uint64_t)v101;
                v139 = 2112;
                v140 = (const char *)v130;
                v141 = 2112;
                v142 = v54;
                v143 = 2112;
                v144 = (uint64_t)v102;
                v145 = 2112;
                v146 = v55;
                v147 = 2112;
                v148 = v103;
                _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%{public}@ Newer item already in place: [Store ID: %@] [Current: %@ -- %@] [Contender: %@ -- %@]", buf, 0x3Eu);

              }
              goto LABEL_68;
            }
            v68 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v53));
            v69 = objc_msgSend(v68, "BOOLValue");

            v70 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v27));
            v71 = objc_msgSend(v70, "BOOLValue");

            v72 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v53));
            v73 = v72 != 0;

            v74 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v27));
            if (v74)
              v78 = v73;
            else
              v78 = 1;
            if ((v78 & 1) == 0)
            {
              v88 = BKLibraryLog(v75, v76, v77);
              v89 = objc_claimAutoreleasedReturnValue(v88);
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
              {
                v104 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                *(_DWORD *)buf = 138543618;
                v138 = (uint64_t)v104;
                v139 = 2112;
                v140 = (const char *)v130;
                _os_log_debug_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "%{public}@ Item with path taking over item without path: [StoreID: %@]", buf, 0x16u);

              }
              objc_msgSend(v121, "addObject:", v53);
              objc_msgSend(v125, "setObject:forKey:", v27, v130);
              goto LABEL_85;
            }
            if (((v71 | v69 ^ 1) & 1) != 0)
            {
              v79 = -[BKLibraryDataSourcePlist _isEntryFamilyPurchase:](self, "_isEntryFamilyPurchase:", v53);
              if (!v79
                || (v79 = -[BKLibraryDataSourcePlist _isEntryFamilyPurchase:](self, "_isEntryFamilyPurchase:", v27)))
              {
                v82 = BKLibraryLog(v79, v80, v81);
                v84 = objc_claimAutoreleasedReturnValue(v82);
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                {
                  v108 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                  *(_DWORD *)buf = 138544642;
                  v138 = (uint64_t)v108;
                  v139 = 2112;
                  v140 = (const char *)v130;
                  v141 = 2112;
                  v142 = v54;
                  v143 = 2112;
                  v144 = (uint64_t)v109;
                  v145 = 2112;
                  v146 = v55;
                  v147 = 2112;
                  v148 = v110;
                  _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%{public}@ Same-Version Right-Rez item already in place: [Store ID: %@] [Current: %@ -- %@] [Contender: %@ -- %@]", buf, 0x3Eu);

                }
LABEL_68:

                objc_msgSend(v121, "addObject:", v27);
LABEL_85:

LABEL_86:
                goto LABEL_87;
              }
              v100 = BKLibraryLog(v79, v80, v81);
              v61 = objc_claimAutoreleasedReturnValue(v100);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              {
                v111 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                *(_DWORD *)buf = v117;
                v138 = (uint64_t)v111;
                v139 = 2112;
                v140 = (const char *)v130;
                v141 = 2112;
                v142 = v112;
                v143 = 2112;
                v144 = (uint64_t)v113;
                _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}@ Non-family purchase item taking over: [Store ID: %@] [Older: %@] [Newer: %@]", buf, 0x2Au);

              }
            }
            else
            {
              v90 = BKLibraryLog(v75, v76, v77);
              v61 = objc_claimAutoreleasedReturnValue(v90);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              {
                v105 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
                v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
                *(_DWORD *)buf = 138544642;
                v138 = (uint64_t)v105;
                v139 = 2112;
                v140 = (const char *)v130;
                v141 = 2112;
                v142 = v54;
                v143 = 2112;
                v144 = (uint64_t)v106;
                v145 = 2112;
                v146 = v55;
                v147 = 2112;
                v148 = v107;
                _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}@ Newer item (same version) taking over sample: [Store ID: %@] [Older: %@ -- %@] [Newer: %@ -- %@]", buf, 0x3Eu);

              }
            }
LABEL_84:

            objc_msgSend(v121, "addObject:", v53);
            objc_msgSend(v125, "setObject:forKey:", v27, v130);
            goto LABEL_85;
          }
          objc_msgSend(v125, "setObject:forKey:", v27, v130);
          goto LABEL_86;
        }
LABEL_88:
        v25 = (char *)v25 + 1;
      }
      while (v129 != v25);
      v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v149, 16);
      v129 = v114;
    }
    while (v114);
  }

  objc_autoreleasePoolPop(context);
  -[BKLibraryDataSourcePlist q_deletePlistEntries:](self, "q_deletePlistEntries:", v121);
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "allValues"));
  objc_msgSend(v120, "addObjectsFromArray:", v115);

  return v120;
}

- (void)q_deletePlistEntries:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
        if (objc_msgSend(v11, "length"))
          -[NSMutableSet addObject:](v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (-[NSMutableSet count](v5, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));
    objc_msgSend(v12, "addDeletedFiles:", v13);

    -[BKLibraryDataSourcePlist q_asyncRemovePlistPaths:completion:](self, "q_asyncRemovePlistPaths:completion:", v5, 0);
  }

}

- (NSFileManager)fileManager
{
  NSFileManager *fileManager;
  NSFileManager *v4;
  NSFileManager *v5;

  fileManager = self->_fileManager;
  if (!fileManager)
  {
    v4 = (NSFileManager *)objc_alloc_init((Class)NSFileManager);
    v5 = self->_fileManager;
    self->_fileManager = v4;

    fileManager = self->_fileManager;
  }
  return fileManager;
}

- (BOOL)_isFamilyPurchaseAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v6));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("com.apple.iTunesStore.downloadInfo")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", CFSTR("accountInfo.FamilyID")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", CFSTR("accountInfo.DSPersonID")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", CFSTR("accountInfo.PurchaserID")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
    v14 = objc_msgSend(v13, "isFamilyPurchaseWithFamilyID:purchaserDSID:downloaderDSID:", v10, v12, v11);

  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v14;
}

- (BOOL)_isEntryFamilyPurchase:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
  LOBYTE(self) = -[BKLibraryDataSourcePlist _isFamilyPurchaseAtPath:](self, "_isFamilyPurchaseAtPath:", v4);

  return (char)self;
}

- (void)_setPropertiesOfAsset:(id)a3 withPlistEntry:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  _BOOL4 v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  BKLibraryDataSourcePlist *v126;
  id v127;
  id v128;

  v6 = a3;
  v7 = a4;
  v8 = -[BKLibraryDataSourcePlist _isSupplementalPDFFromPlistEntry:](self, "_isSupplementalPDFFromPlistEntry:", v7);
  v9 = objc_claimAutoreleasedReturnValue(+[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v7));
  v10 = (void *)v9;
  if (v8)
    v11 = 0;
  else
    v11 = (void *)v9;
  v12 = v9;
  v126 = self;
  if (!v11)
  {
    v13 = -[BKLibraryDataSourcePlist _contentTypeFromPlistEntry:logFailure:](self, "_contentTypeFromPlistEntry:logFailure:", v7, 0);
    if ((_DWORD)v13 != 3)
      goto LABEL_9;
    v12 = objc_claimAutoreleasedReturnValue(+[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v7));
    v18 = BKLibraryLog(v12, v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      sub_1006A583C();

    if (!v12)
    {
LABEL_9:
      v20 = v10;
      v21 = BKLibraryLog(v13, v14, v15);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        sub_1006A580C(v22, v23, v24, v25, v26, v27, v28, v29);

      v30 = objc_opt_class(NSString);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
      v32 = BUDynamicCast(v30, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

      if (v33)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fullPathToAssetID](self, "fullPathToAssetID"));
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKey:", v33));

        if (v38)
        {
          v42 = v38;
          v43 = BKLibraryLog(v39, v40, v41);
          v44 = objc_claimAutoreleasedReturnValue(v43);
          v10 = v20;
          v12 = v42;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            sub_1006A5774();
          goto LABEL_32;
        }
        v128 = 0;
        v63 = objc_claimAutoreleasedReturnValue(+[BLLibraryUtility identifierFromBookPath:allowHash:allowStoreID:error:](BLLibraryUtility, "identifierFromBookPath:allowHash:allowStoreID:error:", v33, 0, 0, &v128));
        v64 = v128;
        v67 = BKLibraryLog(v64, v65, v66);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        v69 = os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG);
        v10 = v20;
        v12 = v63;
        if (v63 && !v64)
        {
          if (v69)
            sub_1006A570C();

          v44 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fullPathToAssetID](v126, "fullPathToAssetID"));
          -[NSObject setObject:forKey:](v44, "setObject:forKey:", v63, v33);
          goto LABEL_32;
        }
        if (v69)
          sub_1006A56A8();

        self = v126;
        if (v12)
          goto LABEL_33;
      }
      else
      {
        v45 = BKLibraryLog(v34, v35, v36);
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          sub_1006A57DC(v46, v47, v48, v49, v50, v51, v52, v53);

        v10 = v20;
      }
      v12 = objc_claimAutoreleasedReturnValue(+[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v7));
      v56 = BKLibraryLog(v12, v54, v55);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        sub_1006A5644();

      if (!v33 || v12)
        goto LABEL_33;
      v127 = 0;
      v12 = objc_claimAutoreleasedReturnValue(+[BLLibraryUtility identifierFromBookPath:allowHash:allowStoreID:error:](BLLibraryUtility, "identifierFromBookPath:allowHash:allowStoreID:error:", v33, 1, 0, &v127));
      v44 = v127;
      v60 = BKLibraryLog(v44, v58, v59);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        sub_1006A55E0();

      if (v12 && !v44)
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fullPathToAssetID](self, "fullPathToAssetID"));
        objc_msgSend(v62, "setObject:forKey:", v12, v33);

      }
LABEL_32:

LABEL_33:
    }
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist temporaryItemIdentifierFromPlistEntry:](IMLibraryPlist, "temporaryItemIdentifierFromPlistEntry:", v7));
  if (v70)
  {
    v71 = v70;
    if (!objc_msgSend(v70, "isEqualToString:", &stru_10091C438))
      goto LABEL_46;
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/datasources/BKLibraryDataSourcePlist.m", 1665, "-[BKLibraryDataSourcePlist _setPropertiesOfAsset:withPlistEntry:]", "NO", CFSTR("Malformed plist entry.  The Persistent ID should NEVER be an empty string"));

    v75 = BKLibraryLog(v72, v73, v74);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      sub_1006A55B0(v76, v77, v78, v79, v80, v81, v82, v83);
    v71 = 0;
  }
  else if (v8)
  {
    v71 = v10;
    v86 = BKLibraryLog(v71, v84, v85);
    v76 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
      sub_1006A54E8();
  }
  else
  {
    v76 = objc_claimAutoreleasedReturnValue(+[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v7));
    v71 = (id)objc_claimAutoreleasedReturnValue(-[NSObject identifierFromPermlink](v76, "identifierFromPermlink"));
    v89 = BKLibraryLog(v71, v87, v88);
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      sub_1006A554C();

  }
LABEL_46:
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibrarySharedContainerManager sharedInstance](BKLibrarySharedContainerManager, "sharedInstance"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "sharedURLForEntry:", v7));

  v93 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v7));
  if (v93)
  {
    objc_msgSend(v6, "setIsRestoring:", 0);
  }
  else
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist backupFolderNameFromPlistEntry:](IMLibraryPlist, "backupFolderNameFromPlistEntry:", v7));
    objc_msgSend(v6, "setIsRestoring:", v94 != 0);

  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist backupFolderNameFromPlistEntry:](IMLibraryPlist, "backupFolderNameFromPlistEntry:", v7));

  if (v95)
    objc_msgSend(v6, "setGeneration:", 0x7FFFFFFFFFFFFFFFLL);
  if (objc_msgSend(v6, "isRestoring"))
    v96 = 2;
  else
    v96 = 1;
  objc_msgSend(v6, "setState:", v96);
  if (v92)
  {
    objc_msgSend(v6, "setUrl:", v92);
  }
  else
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
    if (v97)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v98));
      objc_msgSend(v6, "setUrl:", v99);

    }
    else
    {
      objc_msgSend(v6, "setUrl:", 0);
    }

  }
  objc_msgSend(v6, "setStoreID:", v10);
  v100 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist storePlaylistIdFromPlistEntry:](IMLibraryPlist, "storePlaylistIdFromPlistEntry:", v7));
  objc_msgSend(v6, "setStorePlaylistID:", v100);

  objc_msgSend(v6, "setSupplementalContent:", +[IMLibraryPlist isSupplementalContentFromPlistEntry:](IMLibraryPlist, "isSupplementalContentFromPlistEntry:", v7));
  objc_msgSend(v6, "setAssetID:", v12);
  objc_msgSend(v6, "setTemporaryAssetID:", v71);
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist authorFromPlistEntry:](IMLibraryPlist, "authorFromPlistEntry:", v7));
  objc_msgSend(v6, "setAuthor:", v101);

  v102 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist sortAuthorFromPlistEntry:](IMLibraryPlist, "sortAuthorFromPlistEntry:", v7));
  objc_msgSend(v6, "setSortAuthor:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist titleFromPlistEntry:](IMLibraryPlist, "titleFromPlistEntry:", v7));
  objc_msgSend(v6, "setTitle:", v103);

  v104 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist sortTitleFromPlistEntry:](IMLibraryPlist, "sortTitleFromPlistEntry:", v7));
  if (!objc_msgSend(v104, "length"))
  {
    v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

    v104 = (void *)v105;
  }
  v125 = (void *)v12;
  objc_msgSend(v6, "setSortTitle:", v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  if (objc_msgSend(v106, "length"))
    goto LABEL_65;
  v107 = v10;
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortTitle"));
  v109 = objc_msgSend(v108, "length");

  v10 = v107;
  if (v109)
  {
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortTitle"));
    objc_msgSend(v6, "setTitle:", v106);
LABEL_65:

  }
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist genreFromPlistEntry:](IMLibraryPlist, "genreFromPlistEntry:", v7));
  objc_msgSend(v6, "setGenre:", v110);

  v111 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](v126, "identifier"));
  objc_msgSend(v6, "setDataSourceIdentifier:", v111);

  objc_msgSend(v6, "setContentType:", -[BKLibraryDataSourcePlist _contentTypeFromPlistEntry:logFailure:](v126, "_contentTypeFromPlistEntry:logFailure:", v7, 1));
  v112 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", v7));
  objc_msgSend(v6, "setSample:", objc_msgSend(v112, "BOOLValue"));

  v113 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isProofedAssetFromPlistEntry:](IMLibraryPlist, "isProofedAssetFromPlistEntry:", v7));
  objc_msgSend(v6, "setProof:", objc_msgSend(v113, "BOOLValue"));

  v114 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isExplicitContentFromPlistEntry:](IMLibraryPlist, "isExplicitContentFromPlistEntry:", v7));
  objc_msgSend(v6, "setIsExplicit:", v114);

  v115 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isEphemeralFromPlistEntry:](IMLibraryPlist, "isEphemeralFromPlistEntry:", v7));
  objc_msgSend(v6, "setEphemeral:", objc_msgSend(v115, "BOOLValue"));

  v116 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist publicationVersionNumberFromPlistEntry:](IMLibraryPlist, "publicationVersionNumberFromPlistEntry:", v7));
  objc_msgSend(v6, "setVersionNumber:", v116);

  v117 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist humanReadablePublicationVersionFromPlistEntry:](IMLibraryPlist, "humanReadablePublicationVersionFromPlistEntry:", v7));
  objc_msgSend(v6, "setVersionNumberHumanReadable:", v117);

  v118 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist scrollDirectionFromPlistEntry:](IMLibraryPlist, "scrollDirectionFromPlistEntry:", v7));
  v119 = v118;
  if (v118
    && ((objc_msgSend(v118, "isEqualToString:", CFSTR("horizontal")) & 1) != 0
     || objc_msgSend(v119, "isEqualToString:", CFSTR("vertical"))))
  {
    objc_msgSend(v6, "setScrollDirection:", v119);
  }
  v120 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist languageFromPlistEntry:](IMLibraryPlist, "languageFromPlistEntry:", v7));
  objc_msgSend(v6, "setLanguage:", v120);

  v121 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist coverWritingModeFromPlistEntry:](IMLibraryPlist, "coverWritingModeFromPlistEntry:", v7));
  objc_msgSend(v6, "setCoverWritingMode:", v121);

  v122 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist pageProgressionFromPlistEntry:](IMLibraryPlist, "pageProgressionFromPlistEntry:", v7));
  objc_msgSend(v6, "setPageProgressionDirection:", v122);

  v123 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v7));
  objc_msgSend(v6, "setPermlink:", v123);

  v124 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist importDateFromPlistEntry:](IMLibraryPlist, "importDateFromPlistEntry:", v7));
  if (v124)
    objc_msgSend(v6, "setPurchaseDate:", v124);

}

- (void)q_processAssetStateChanges:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  __objc2_class *v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  __objc2_class *v19;
  uint64_t v20;
  NSMutableArray *v21;
  void *v22;
  unsigned int v23;
  int v24;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  BKLibraryDataSourcePlist *v33;
  id v34;
  _QWORD v35[4];
  NSMutableArray *v36;
  BKLibraryDataSourcePlist *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v34)
  {
    v6 = *(_QWORD *)v39;
    v7 = &OBJC_METACLASS___BKJSStoreFlowController;
    v33 = self;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v10 = objc_opt_class(&v7[18]);
        v11 = BUDynamicCast(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "temporaryAssetID"));
          if (objc_msgSend(v14, "length"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist restoringFromBackupAssetIDs](self, "restoringFromBackupAssetIDs"));
            v17 = objc_msgSend(v16, "containsObject:", v14);

          }
          else
          {
            v17 = 0;
          }
          if (objc_msgSend(v15, "length"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist restoringFromBackupTemporaryAssetIDs](self, "restoringFromBackupTemporaryAssetIDs"));
            v19 = v7;
            v20 = v6;
            v21 = v5;
            v22 = v18;
            v23 = objc_msgSend(v18, "containsObject:", v15);

            v5 = v21;
            v6 = v20;
            v7 = v19;
          }
          else
          {
            v23 = 0;
          }
          v24 = v17 | v23;
          if (objc_msgSend(v13, "state") != 1 || v24 == 0 || v14 == 0)
          {
            if (objc_msgSend(v13, "state") == 2)
              v27 = v24;
            else
              v27 = 1;
            self = v33;
            if ((v27 & 1) == 0)
            {
              if (v14)
              {
                objc_msgSend(v13, "setGeneration:", 0x7FFFFFFFFFFFFFFFLL);
                -[NSMutableArray addObject:](v5, "addObject:", v13);
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist restoringFromBackupAssetIDs](v33, "restoringFromBackupAssetIDs"));
                objc_msgSend(v28, "addObject:", v14);

                if (v15)
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist restoringFromBackupTemporaryAssetIDs](v33, "restoringFromBackupTemporaryAssetIDs"));
                  objc_msgSend(v29, "addObject:", v15);
                  goto LABEL_30;
                }
              }
            }
          }
          else
          {
            objc_msgSend(v13, "setGeneration:", 0x7FFFFFFFFFFFFFFFLL);
            -[NSMutableArray addObject:](v5, "addObject:", v13);
            self = v33;
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist restoringFromBackupAssetIDs](v33, "restoringFromBackupAssetIDs"));
            objc_msgSend(v30, "removeObject:", v14);

            if (objc_msgSend(v15, "length"))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist restoringFromBackupTemporaryAssetIDs](v33, "restoringFromBackupTemporaryAssetIDs"));
              objc_msgSend(v29, "removeObject:", v15);
LABEL_30:

            }
          }

        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v34);
  }

  if (-[NSMutableArray count](v5, "count"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001D0AFC;
    v35[3] = &unk_1008E7338;
    v36 = v5;
    v37 = self;
    objc_msgSend(v31, "addCustomOperationBlock:", v35);

  }
}

- (signed)_contentTypeFromPlistEntry:(id)a3 logFailure:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist folderNameFromPlistEntry:](IMLibraryPlist, "folderNameFromPlistEntry:", v5));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist backupFolderNameFromPlistEntry:](IMLibraryPlist, "backupFolderNameFromPlistEntry:", v5));
  v9 = v8;

  if (objc_msgSend(v9, "length"))
  {
    v10 = +[BKAssetUtilities contentTypeForPath:](BKAssetUtilities, "contentTypeForPath:", v9);
    v13 = (int)v10;
  }
  else
  {
    v14 = objc_opt_class(NSString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("AssetType")));
    v16 = BUDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v13 = 4 * (objc_msgSend(v17, "length") != 0);
  }
  if (v13)
    v18 = 1;
  else
    v18 = !v4;
  if (!v18)
  {
    v19 = BKLibraryLog(v10, v11, v12);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      sub_1006A58A0();

  }
  return v13;
}

- (void)deleteAssetIDs:(id)a3 completion:(id)a4
{
  -[BKLibraryDataSourcePlist _deleteAssetIDs:assetIDToPath:completion:](self, "_deleteAssetIDs:assetIDToPath:completion:", a3, 0, a4);
}

- (void)_deleteAssetIDs:(id)a3 assetIDToPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist assetsQueue](self, "assetsQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D0E8C;
  block[3] = &unk_1008EF410;
  block[4] = self;
  v22 = v8;
  v23 = v9;
  v24 = v12;
  v25 = v11;
  v26 = v13;
  v27 = v10;
  v15 = v10;
  v16 = v13;
  v17 = v11;
  v18 = v12;
  v19 = v9;
  v20 = v8;
  dispatch_async(v14, block);

}

- (id)booksRootPath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist plist](self, "plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingLastPathComponent"));

  return v4;
}

- (BOOL)removeFileWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  objc_msgSend(v7, "removeCacheObjectForURL:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fileManager](self, "fileManager"));
  LOBYTE(a4) = objc_msgSend(v8, "removeItemAtURL:error:", v6, a4);

  return (char)a4;
}

- (void)q_plistWasChangedOnDisk
{
  void *v3;
  void (**v4)(void);
  void (**v5)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
  objc_msgSend(v3, "reloadDataSource:completion:", self, 0);

  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist didWritePlistHandler](self, "didWritePlistHandler"));
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (BOOL)q_rewritePlistDictionary:(id)a3 path:(id)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (!v8)
  {
    v18 = BKLibraryLog(v9, v10, v11);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1006A5904();

    goto LABEL_9;
  }
  v13 = -[BKLibraryDataSourcePlist currentQueueGeneration](self, "currentQueueGeneration");
  v14 = -[BKLibraryDataSourcePlist startQueueGeneration](self, "startQueueGeneration");
  if (v13 == v14)
  {
    v17 = objc_msgSend(v8, "writeToFile:atomically:", v12, 1);
    if (v17 && v5)
    {
      -[BKLibraryDataSourcePlist q_plistWasChangedOnDisk](self, "q_plistWasChangedOnDisk");
LABEL_9:
      LOBYTE(v17) = 1;
    }
  }
  else
  {
    v20 = BKLibraryLog(v14, v15, v16);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1006A5980();

    LOBYTE(v17) = 0;
  }

  return v17;
}

- (void)q_asyncRemovePlistAssets:(id)a3 notify:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D1848;
  v9[3] = &unk_1008EF438;
  v10 = a3;
  v8 = v10;
  -[BKLibraryDataSourcePlist q_asyncRemovePlistEntriesMatching:notify:completion:](self, "q_asyncRemovePlistEntriesMatching:notify:completion:", v9, v6, a5);

}

- (void)q_asyncRemovePlistPaths:(id)a3 completion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D1920;
  v7[3] = &unk_1008EF438;
  v8 = a3;
  v6 = v8;
  -[BKLibraryDataSourcePlist q_asyncRemovePlistEntriesMatching:notify:completion:](self, "q_asyncRemovePlistEntriesMatching:notify:completion:", v7, 1, a4);

}

- (void)q_asyncRemovePlistEntriesMatching:(id)a3 notify:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  BOOL v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D1A1C;
  v9[3] = &unk_1008EF488;
  v9[4] = self;
  v10 = a3;
  v12 = a4;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)q_asyncReplacePlistEntries:(id)a3 notify:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  BOOL v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001D2230;
  v9[3] = &unk_1008EF488;
  v9[4] = self;
  v10 = a3;
  v12 = a4;
  v11 = a5;
  v7 = v11;
  v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)q_asyncAddAssetDictionaries:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D29B8;
  block[3] = &unk_1008E8898;
  block[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = v9;
  v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)plistAssetWithAsset:(id)a3 andURL:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v7 = +[BKPlistAsset newBlankAsset](BKPlistAsset, "newBlankAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  objc_msgSend(v7, "setAssetID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
  objc_msgSend(v7, "setStoreID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storePlaylistID"));
  objc_msgSend(v7, "setStorePlaylistID:", v10);

  objc_msgSend(v7, "setSupplementalContent:", objc_msgSend(v6, "isSupplementalContent"));
  objc_msgSend(v7, "setUrl:", v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  objc_msgSend(v7, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortTitle"));
  objc_msgSend(v7, "setSortTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
  objc_msgSend(v7, "setAuthor:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortAuthor"));
  objc_msgSend(v7, "setSortAuthor:", v14);

  return v7;
}

- (void)prioritizeAssetRestoreWithAssetID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001D31BC;
    v6[3] = &unk_1008EC288;
    v6[4] = self;
    -[BKLibraryDataSourcePlist fetchAssetsWithIDs:completion:](self, "fetchAssetsWithIDs:completion:", v5, v6);

  }
}

- (void)_prioritizeRestorePlistAsset:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  ATConnection *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "isRestoring");
  if ((_DWORD)v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "temporaryAssetID"));
    if (v8)
    {
      v9 = objc_opt_new(ATConnection);
      v10 = -[ATConnection prioritizeAsset:forDataclass:](v9, "prioritizeAsset:forDataclass:", v8, CFSTR("Book"));
      v13 = BKLibraryLog(v10, v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
        v18 = 138412546;
        v19 = v15;
        v20 = 2112;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Prioritizing asset: %@ %@", (uint8_t *)&v18, 0x16u);

      }
    }
    else
    {
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/datasources/BKLibraryDataSourcePlist.m", 2403, "-[BKLibraryDataSourcePlist _prioritizeRestorePlistAsset:]", "persistentID", 0);
    }
  }
  else
  {
    v17 = BKLibraryLog(v5, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1006A5A74();
  }

}

- (int64_t)currentQueueGeneration
{
  return self->_currentQueueGeneration;
}

- (void)setCurrentQueueGeneration:(int64_t)a3
{
  self->_currentQueueGeneration = a3;
}

- (id)didWritePlistHandler
{
  return self->_didWritePlistHandler;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (OS_dispatch_queue)itunesuQueue
{
  return self->_itunesuQueue;
}

- (OS_dispatch_queue)updateAssetMetadataQueue
{
  return self->_updateAssetMetadataQueue;
}

- (BKAssetMetadataProvider)assetMetadataProvider
{
  return (BKAssetMetadataProvider *)objc_loadWeakRetained((id *)&self->_assetMetadataProvider);
}

- (void)setAssetMetadataProvider:(id)a3
{
  objc_storeWeak((id *)&self->_assetMetadataProvider, a3);
}

- (BKAssetMetadataCaching)assetMetadataCache
{
  return (BKAssetMetadataCaching *)objc_loadWeakRetained((id *)&self->_assetMetadataCache);
}

- (void)setAssetMetadataCache:(id)a3
{
  objc_storeWeak((id *)&self->_assetMetadataCache, a3);
}

- (BKAssetCoverImageHelping)coverImageHelper
{
  return (BKAssetCoverImageHelping *)objc_loadWeakRetained((id *)&self->_coverImageHelper);
}

- (void)setCoverImageHelper:(id)a3
{
  objc_storeWeak((id *)&self->_coverImageHelper, a3);
}

- (NSCache)assetCache
{
  return self->_assetCache;
}

- (void)setAssetCache:(id)a3
{
  objc_storeStrong((id *)&self->_assetCache, a3);
}

- (NSCache)assetCacheByTemporaryAssetID
{
  return self->_assetCacheByTemporaryAssetID;
}

- (void)setAssetCacheByTemporaryAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_assetCacheByTemporaryAssetID, a3);
}

- (NSMutableSet)restoringFromBackupAssetIDs
{
  return self->_restoringFromBackupAssetIDs;
}

- (void)setRestoringFromBackupAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_restoringFromBackupAssetIDs, a3);
}

- (NSMutableSet)restoringFromBackupTemporaryAssetIDs
{
  return self->_restoringFromBackupTemporaryAssetIDs;
}

- (void)setRestoringFromBackupTemporaryAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_restoringFromBackupTemporaryAssetIDs, a3);
}

- (NSString)lastFetchDigest
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastFetchDigest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void)setLastReloadDigest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (int64_t)startQueueGeneration
{
  return self->_startQueueGeneration;
}

- (void)setStartQueueGeneration:(int64_t)a3
{
  self->_startQueueGeneration = a3;
}

- (BOOL)backgroundTaskCancelled
{
  return self->_backgroundTaskCancelled;
}

- (void)setBackgroundTaskCancelled:(BOOL)a3
{
  self->_backgroundTaskCancelled = a3;
}

- (BOOL)writesFullPaths
{
  return self->_writesFullPaths;
}

- (void)setWritesFullPaths:(BOOL)a3
{
  self->_writesFullPaths = a3;
}

- (NSMutableDictionary)fullPathToAssetID
{
  return self->_fullPathToAssetID;
}

- (void)setFullPathToAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_fullPathToAssetID, a3);
}

- (OS_dispatch_queue)assetsQueue
{
  return self->_assetsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsQueue, 0);
  objc_storeStrong((id *)&self->_fullPathToAssetID, 0);
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_lastReloadDigest, 0);
  objc_storeStrong((id *)&self->_lastFetchDigest, 0);
  objc_storeStrong((id *)&self->_restoringFromBackupTemporaryAssetIDs, 0);
  objc_storeStrong((id *)&self->_restoringFromBackupAssetIDs, 0);
  objc_storeStrong((id *)&self->_assetCacheByTemporaryAssetID, 0);
  objc_storeStrong((id *)&self->_assetCache, 0);
  objc_destroyWeak((id *)&self->_coverImageHelper);
  objc_destroyWeak((id *)&self->_assetMetadataCache);
  objc_destroyWeak((id *)&self->_assetMetadataProvider);
  objc_storeStrong((id *)&self->_updateAssetMetadataQueue, 0);
  objc_storeStrong((id *)&self->_itunesuQueue, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong(&self->_didWritePlistHandler, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);
}

@end
