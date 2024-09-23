@implementation BKCollection

- (void)awakeFromInsert
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKCollection;
  -[BKCollection awakeFromInsert](&v4, "awakeFromInsert");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BKCollection setLastModification:](self, "setLastModification:", v3);

}

+ (id)keyPathsForValuesAffectingLocalizedTitle
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("title"));
}

+ (id)insertNewCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKCollection"), v6));
  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
  v9 = objc_msgSend(v7, "copyNextCollectionSortKey:", v6);
  objc_msgSend(v8, "setSortKey:", v9);
  objc_msgSend(v8, "setCollectionID:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "resolvedSortMode")));
  objc_msgSend(v8, "setSortMode:", v10);

  objc_msgSend(v8, "setLocalModDate:", 0);
  return v8;
}

+ (unint64_t)sortModeForSeriesCollections
{
  void *v2;
  void *v3;
  signed int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metadataObjectForKey:", CFSTR("BKCollectionSeriesSortMode")));
  v4 = objc_msgSend(v3, "intValue");

  if ((v4 - 11) >= 0xFFFFFFFE)
    return v4;
  else
    return 10;
}

+ (void)setSortModeForSeriesCollections:(unint64_t)a3
{
  void *v4;
  id v5;

  if (a3 - 9 <= 1)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v5, "setMetadataObject:forKey:", v4, CFSTR("BKCollectionSeriesSortMode"));

    objc_msgSend(v5, "saveMetaData");
  }
}

+ (BKCollection)collectionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  char *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  char *v29;

  v5 = (char *)a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BKCollection"));
  objc_msgSend(v7, "setFetchLimit:", 1);
  v29 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForCollectionWithCollectionIDInList:](BKCollection, "predicateForCollectionWithCollectionIDInList:", v8));
  objc_msgSend(v7, "setPredicate:", v9);

  v22 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v22));

  v11 = (char *)v22;
  v13 = v11;
  if (v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
  }
  else
  {
    v15 = BCIMLog(v11, v12);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "+[BKCollection collectionWithID:inManagedObjectContext:]";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKCollection.m";
      v27 = 1024;
      v28 = 171;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v19 = BCIMLog(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "@\"Failed to fetch LibraryAsset with AssetID {%@}{%@}\", buf, 0x16u);
    }

    v14 = 0;
  }

  return (BKCollection *)v14;
}

- (void)addLibraryAssets:(id)a3 hideAssets:(BOOL)a4 inManagedObjectContext:(id)a5 forceToTop:(BOOL)a6
{
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  _QWORD activity_block[4];
  id v16;
  id v17;
  BKCollection *v18;
  BOOL v19;
  BOOL v20;

  v14 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v12 = objc_msgSend(v11, "isEqualToString:", kBKCollectionDefaultIDWantToRead);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("BKLibraryAssetAddToWTRCollectionNotification"), self, 0);

  }
  objc_msgSend(v10, "setSaveContext:", 2);
  if (v10 && objc_msgSend(v14, "count"))
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_4ED2C;
    activity_block[3] = &unk_C28B8;
    v16 = v10;
    v19 = a4;
    v17 = v14;
    v18 = self;
    v20 = a6;
    _os_activity_initiate(&dword_0, "Collection add library assets", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

- (void)addLibraryAssets:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v5 = objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDWantToRead);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("BKLibraryAssetAddToWTRCollectionNotification"), self, 0);

  }
  if (objc_msgSend(v8, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection managedObjectContext](self, "managedObjectContext"));
    -[BKCollection addLibraryAssets:hideAssets:inManagedObjectContext:forceToTop:](self, "addLibraryAssets:hideAssets:inManagedObjectContext:forceToTop:", v8, 0, v7, 0);
    if (objc_msgSend(v7, "hasChanges"))
      objc_msgSend(v7, "saveLibrary");

  }
}

- (OS_dispatch_queue)sortKeyQueue
{
  if (qword_DE4B8 != -1)
    dispatch_once(&qword_DE4B8, &stru_C2DD8);
  return (OS_dispatch_queue *)(id)qword_DE4B0;
}

- (NSNumber)maxSortKey
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_4F300;
  v11 = sub_4F310;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[BKCollection sortKeyQueue](self, "sortKeyQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4F318;
  v6[3] = &unk_C2310;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)clearMaxSortKey
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKCollection sortKeyQueue](self, "sortKeyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4F504;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)updateMaxSortKeyWithMember:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  BKCollection *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BKCollection sortKeyQueue](self, "sortKeyQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4F5B4;
  block[3] = &unk_C12F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)isSeriesCollection
{
  return 0;
}

- (NSString)seriesID
{
  return 0;
}

- (id)addCollectionMemberAvoidingDupesWithAssetID:(id)a3 sortKey:(id)a4 forceToTop:(BOOL)a5
{
  return -[BKCollection addCollectionMemberAvoidingDupesWithAsset:assetID:temporaryAssetID:sortKey:forceToTop:](self, "addCollectionMemberAvoidingDupesWithAsset:assetID:temporaryAssetID:sortKey:forceToTop:", 0, a3, 0, a4, a5);
}

- (id)addCollectionMemberAvoidingDupesWithAsset:(id)a3 assetID:(id)a4 temporaryAssetID:(id)a5 sortKey:(id)a6 forceToTop:(BOOL)a7
{
  id v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  BKCollection *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  void *v52;
  __CFString *v53;
  BKCollection *v54;
  void *v55;
  void *v56;
  BKCollection *v57;
  id v58;
  _BOOL4 v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  const __CFString *v69;
  __int16 v70;
  const __CFString *v71;

  v59 = a7;
  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = (__CFString *)a5;
  v14 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v16 = objc_msgSend(v15, "verboseLoggingEnabled");

  if (v16)
  {
    v17 = BKLibraryCollectionDevelopmentLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
      v21 = self;
      v22 = (void *)v20;
      v23 = CFSTR("null");
      if (v20)
        v24 = (const __CFString *)v20;
      else
        v24 = CFSTR("null");
      *(_DWORD *)buf = 138412802;
      v67 = v19;
      v68 = 2112;
      if (v12)
        v23 = v12;
      v69 = v24;
      v70 = 2112;
      v71 = v23;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "\"\\\"addCollectionMemberAvoidingDupesWithAsset for collectionID: %@ asset.assetID: %@ assetID: %@\\\"\", buf, 0x20u);

      self = v21;
    }

  }
  if (-[__CFString length](v12, "length"))
  {
LABEL_11:
    v60 = v14;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection members](self, "members"));
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v62;
      v57 = self;
      v58 = v11;
LABEL_13:
      v29 = 0;
      while (1)
      {
        if (*(_QWORD *)v62 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "assetID", v57, v58));
        if (objc_msgSend(v31, "isEqualToString:", v12))
          break;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "temporaryAssetID"));
        v33 = objc_msgSend(v32, "isEqualToString:", v13);

        if ((v33 & 1) != 0)
          goto LABEL_25;
        if (v27 == (id)++v29)
        {
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
          self = v57;
          v11 = v58;
          if (v27)
            goto LABEL_13;
          goto LABEL_20;
        }
      }

LABEL_25:
      v36 = v30;

      self = v57;
      v11 = v58;
      if (v36)
        goto LABEL_29;
    }
    else
    {
LABEL_20:

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection managedObjectContext](self, "managedObjectContext"));
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BKCollectionMember"), v37));

    objc_msgSend(v36, "setCollection:", self);
    objc_msgSend(v36, "setAssetID:", v12);
    objc_msgSend(v36, "setTemporaryAssetID:", v13);
    v38 = BKLibraryCollectionLog();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
      *(_DWORD *)buf = 138412546;
      v67 = v40;
      v68 = 2112;
      v69 = v12;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Collection Member Inserted.  Creating BKCollectionMember for collectionID: %@ assetID: %@", buf, 0x16u);

    }
LABEL_29:
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "asset"));
    if (v41)
    {

      v14 = v60;
      if (!v36)
        goto LABEL_48;
      goto LABEL_40;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "assetID"));
    v14 = v60;
    if (v42)
    {

    }
    else
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "temporaryAssetID"));

      if (!v43)
      {
LABEL_39:
        if (!v36)
        {
LABEL_48:
          -[BKCollection updateMaxSortKeyWithMember:](self, "updateMaxSortKeyWithMember:", v36);
          goto LABEL_49;
        }
LABEL_40:
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sortKey"));
        if (!v44
          || (v45 = (void *)v44,
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sortKey")),
              v47 = objc_msgSend(v46, "unsignedLongValue"),
              v46,
              v45,
              !v47)
          || v59)
        {
          v48 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v14, v48) & 1) == 0 || !objc_msgSend(v14, "unsignedLongValue") || v59)
          {
            v49 = objc_claimAutoreleasedReturnValue(+[BKUserSortOrderManager nextSortKeyForCollection:](BKUserSortOrderManager, "nextSortKeyForCollection:", self));

            v14 = (id)v49;
          }
          objc_msgSend(v36, "setDifferentNumber:forKey:", v14, CFSTR("sortKey"));
        }
        goto LABEL_48;
      }
    }
    if (!v11)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection managedObjectContext](self, "managedObjectContext"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "libraryManager"));
      if (v12)
        v53 = v12;
      else
        v53 = v13;
      v54 = self;
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection managedObjectContext](self, "managedObjectContext"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "libraryMutableAssetWithPermanentOrTemporaryAssetID:inManagedObjectContext:", v53, v55));
      objc_msgSend(v36, "setAsset:", v56);

      self = v54;
      if (!v36)
        goto LABEL_48;
      goto LABEL_40;
    }
    objc_msgSend(v36, "setAsset:", v11);
    goto LABEL_39;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "permlink"));
  if (objc_msgSend(v34, "length"))
  {
    v35 = -[__CFString length](v13, "length");

    if (v35)
      goto LABEL_11;
  }
  else
  {

  }
  v36 = 0;
LABEL_49:
  objc_msgSend(v36, "setLocalModDate:", 0);

  return v36;
}

- (void)addCollectionMemberDictionaries:(id)a3 forceToTop:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reverseObjectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("assetID")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("sortKey")));
        v14 = -[BKCollection addCollectionMemberAvoidingDupesWithAssetID:sortKey:forceToTop:](self, "addCollectionMemberAvoidingDupesWithAssetID:sortKey:forceToTop:", v12, v13, v4);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (BOOL)acceptsContentType:(signed __int16)a3
{
  int v3;
  void *v4;
  char v6;
  unsigned int v7;

  v3 = (unsigned __int16)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  if (objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDBooks))
  {
    v6 = v3 == 4 || (v3 - 1) < 2;
  }
  else if (objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDPDFs))
  {
    v6 = v3 == 3;
  }
  else
  {
    v7 = objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDAudiobooks) ^ 1;
    if (v3 == 6)
      v6 = 1;
    else
      v6 = v7;
  }

  return v6;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (void)updateLastModification
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BKCollection setLastModification:](self, "setLastModification:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[BKCollection setLocalModDate:](self, "setLocalModDate:", v4);

}

+ (id)predicateForCollectionWithCollectionIDInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K in %@) AND deletedFlag == 0"), CFSTR("collectionID"), a3);
}

+ (id)predicateForAllDefaultCollections
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableDefaultCollectionIDsForOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForCollectionWithCollectionIDInList:", v3));

  return v4;
}

+ (id)predicateForSelectableDefaultCollections
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableSelectableDefaultCollectionIDsForOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForCollectionWithCollectionIDInList:", v3));

  return v4;
}

+ (id)predicateForNonDeletedUserCollections
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == 0 AND (%K == NULL OR %K > %i) AND (placeholder == NULL OR placeholder == NO)"), CFSTR("deletedFlag"), CFSTR("sortKey"), CFSTR("sortKey"), kBKCollectionMinUserCollectionSortOrder);
}

+ (id)predicateForDeletedDefaultCollections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableDefaultCollectionIDsForOS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K in %@) AND %K == 1"), CFSTR("collectionID"), v2, CFSTR("deletedFlag")));

  return v3;
}

+ (unint64_t)defaultSortModeForCollectionID:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDFinished) & 1) != 0)
  {
    v5 = 8;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDWantToRead) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDSamples) & 1) != 0)
  {
    v5 = 6;
  }
  else if (objc_msgSend(a1, "isSeriesCollectionID:", v4))
  {
    v5 = 7;
  }
  else
  {
    v5 = 6;
  }

  return v5;
}

+ (unint64_t)defaultViewModeForCollectionID:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDFinished) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDWantToRead) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDSamples))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSortKey:(id)a3
{
  id v4;

  v4 = a3;
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sortKey"));
  -[BKCollection setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("sortKey"));

  -[BKCollection updateLastModification](self, "updateLastModification");
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sortKey"));
}

- (void)setSortMode:(id)a3
{
  id v4;

  v4 = a3;
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sortMode"));
  -[BKCollection setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("sortMode"));

  -[BKCollection updateLastModification](self, "updateLastModification");
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sortMode"));
}

- (void)setViewMode:(id)a3
{
  id v4;

  v4 = a3;
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("viewMode"));
  -[BKCollection setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("viewMode"));

  -[BKCollection updateLastModification](self, "updateLastModification");
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("viewMode"));
}

- (unint64_t)resolvedSortMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection sortMode](self, "sortMode"));
  v4 = v3;
  if (v3)
  {
    v5 = (int)objc_msgSend(v3, "intValue");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
    v5 = +[BKCollection defaultSortModeForCollectionID:](BKCollection, "defaultSortModeForCollectionID:", v6);

  }
  return v5;
}

- (unint64_t)resolvedViewMode
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection viewMode](self, "viewMode"));
  v4 = v3;
  if (v3)
  {
    v5 = (int)objc_msgSend(v3, "intValue");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
    v5 = +[BKCollection defaultViewModeForCollectionID:](BKCollection, "defaultViewModeForCollectionID:", v6);

  }
  return v5;
}

- (void)setTitle:(id)a3
{
  id v4;

  v4 = a3;
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("title"));
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("localizedTitle"));
  -[BKCollection setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("title"));

  -[BKCollection updateLastModification](self, "updateLastModification");
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("localizedTitle"));
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("title"));
}

- (void)setDeletedFlag:(id)a3
{
  id v4;

  v4 = a3;
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("deletedFlag"));
  -[BKCollection setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("deletedFlag"));

  -[BKCollection updateLastModification](self, "updateLastModification");
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("deletedFlag"));
}

- (void)setHidden:(id)a3
{
  id v4;

  v4 = a3;
  -[BKCollection willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hidden"));
  -[BKCollection setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("hidden"));

  -[BKCollection updateLastModification](self, "updateLastModification");
  -[BKCollection didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hidden"));
}

- (void)setLocalizedTitle:(id)a3
{
  id v3;
  _QWORD activity_block[5];
  id v5;

  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_504F4;
  activity_block[3] = &unk_C12F8;
  activity_block[4] = self;
  v5 = a3;
  v3 = v5;
  _os_activity_initiate(&dword_0, "Set Collection Title", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (BKLibraryManagedObjectContext)managedObjectContext
{
  BKLibraryManagedObjectContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKCollection;
  v2 = -[BKCollection managedObjectContext](&v4, "managedObjectContext");
  return (BKLibraryManagedObjectContext *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)isValidForSerialization
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection deletedFlag](self, "deletedFlag"));
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection lastModification](self, "lastModification"));
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = (unint64_t)v5;

    v7 = +[IMUserDataCull isTimestampNewerThanMaxDeletedAge:](IMUserDataCull, "isTimestampNewerThanMaxDeletedAge:", v6);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)isDefaultCollection:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("serverSyncUniqueId")));
  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(a1), "availableDefaultCollectionIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = objc_msgSend(v6, "containsObject:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isValidForDeserialization:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;

  v4 = a3;
  v5 = objc_opt_class(NSNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("deletedFlag")));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "BOOLValue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lastModification_Since1970")));
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    if (+[IMUserDataCull isTimestampNewerThanMaxDeletedAge:](IMUserDataCull, "isTimestampNewerThanMaxDeletedAge:", v10))v11 = objc_msgSend(a1, "isDefaultCollection:", v4) ^ 1;
    else
      LOBYTE(v11) = 0;
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)mergeWithDictionaryRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  char *v10;
  id v11;

  v11 = a3;
  -[BKCollection clearMaxSortKey](self, "clearMaxSortKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("lastModification_Since1970")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v4, "unsignedLongLongValue")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("deletedFlag")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection deletedFlag](self, "deletedFlag"));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v6, "BOOLValue"))
    {
      +[BKCollection isDefaultCollection:](BKCollection, "isDefaultCollection:", v11);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection lastModification](self, "lastModification"));
      v10 = (char *)objc_msgSend(v5, "compare:", v9);

      if (v10 == (_BYTE *)&dword_0 + 1)
        -[BKCollection configureFromDictionary:](self, "configureFromDictionary:", v11);
    }
  }

}

+ (void)cleanupDefaultCollections:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForDeletedDefaultCollections](BKCollection, "predicateForDeletedDefaultCollections"));
  objc_msgSend(v3, "batchDeleteEntity:matching:prefetchRelationships:", CFSTR("BKCollection"), v4, 0);

}

- (void)configureFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[BKCollection configureFromBackupSummary:](self, "configureFromBackupSummary:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection deletedFlag](self, "deletedFlag"));
  if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("databaseKeys")));

  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollectionMember collectionMemberDictionariesWithAssetIDs:](BKCollectionMember, "collectionMemberDictionariesWithAssetIDs:", v5));
    -[BKCollection addCollectionMemberDictionaries:forceToTop:](self, "addCollectionMemberDictionaries:forceToTop:", v6, 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("lastModification_Since1970")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "unsignedLongLongValue")));
  -[BKCollection setLastModification:](self, "setLastModification:", v8);

}

- (id)collectionDetailRepresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v4 = objc_msgSend(objc_alloc((Class)BCMutableCollectionDetail), "initWithCollectionID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
  objc_msgSend(v4, "setName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection details](self, "details"));
  objc_msgSend(v4, "setCollectionDescription:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection hidden](self, "hidden"));
  objc_msgSend(v4, "setHidden:", objc_msgSend(v7, "BOOLValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection sortKey](self, "sortKey"));
  objc_msgSend(v4, "setSortOrder:", objc_msgSend(v8, "intValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKCollection resolvedSortMode](self, "resolvedSortMode")));
  objc_msgSend(v4, "setSortMode:", objc_msgSend(v9, "intValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection deletedFlag](self, "deletedFlag"));
  objc_msgSend(v4, "setDeletedFlag:", objc_msgSend(v10, "BOOLValue"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection localModDate](self, "localModDate"));
  objc_msgSend(v4, "setModificationDate:", v11);

  return v4;
}

- (void)configureFromCollectionDetail:(id)a3 shouldCompareModificationDate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  const char *v42;
  void *v43;
  unsigned int v44;
  id v45;
  NSObject *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  unsigned int v52;
  id v53;
  _BYTE v54[24];
  void *v55;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[BKCollection localModDate](self, "localModDate"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDate"));
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (!v7 && v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      v11 = objc_msgSend(v10, "verboseLoggingEnabled");

      if (v11)
      {
        v12 = BKLibraryCollectionDevelopmentLog();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
          *(_DWORD *)v54 = 138412546;
          *(_QWORD *)&v54[4] = v9;
          *(_WORD *)&v54[12] = 2112;
          *(_QWORD *)&v54[14] = v14;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "\"\\\"No local modDate, collectionDetail has modDate:%@  for collectionDetail %@ \\\"\", v54, 0x16u);

        }
      }
      goto LABEL_23;
    }
    if (v7 && v8)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
      v21 = objc_msgSend(v20, "verboseLoggingEnabled");

      if (v21)
      {
        v22 = BKLibraryCollectionDevelopmentLog();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
          *(_DWORD *)v54 = 138412802;
          *(_QWORD *)&v54[4] = v7;
          *(_WORD *)&v54[12] = 2112;
          *(_QWORD *)&v54[14] = v9;
          *(_WORD *)&v54[22] = 2112;
          v55 = v24;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "\"\\\"local has modDate:%@, collectionDetail has modDate:%@ for collectionDetail %@\\\"\", v54, 0x20u);

        }
      }
      goto LABEL_20;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
    v16 = objc_msgSend(v15, "verboseLoggingEnabled");

    if (v16)
    {
      v17 = BKLibraryCollectionDevelopmentLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
        *(_DWORD *)v54 = 138412290;
        *(_QWORD *)&v54[4] = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "\"\\\"configureFromCollectionDetail No local modDate, No collectionDetail modDate for collectionDetail %@\\\"\", v54, 0xCu);

      }
    }
  }
  if (v4 && !v9)
    goto LABEL_38;
LABEL_20:
  if (v7)
  {
    if (v4)
    {
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v26 = v25;
      objc_msgSend((id)v7, "timeIntervalSinceReferenceDate");
      if (v26 <= v27)
      {
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v49 = v48;
        objc_msgSend((id)v7, "timeIntervalSinceReferenceDate");
        if (v49 >= v50)
          goto LABEL_33;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
        v52 = objc_msgSend(v51, "verboseLoggingEnabled");

        if (!v52)
          goto LABEL_33;
        v53 = BKLibraryCollectionDevelopmentLog();
        v38 = objc_claimAutoreleasedReturnValue(v53);
        if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
        *(_DWORD *)v54 = 138412546;
        *(_QWORD *)&v54[4] = v39;
        *(_WORD *)&v54[12] = 2112;
        *(_QWORD *)&v54[14] = v41;
        v42 = "\"\\\"BKCollection Not Taking changes from collectiond detail as my mod date is > detail mod date for coll"
              "ectionTitle: %@ collectionID:%@\\\"\";
        goto LABEL_30;
      }
    }
  }
LABEL_23:
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  -[BKCollection setDifferentString:forKey:](self, "setDifferentString:forKey:", v28, CFSTR("title"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionDescription"));
  -[BKCollection setDifferentString:forKey:](self, "setDifferentString:forKey:", v29, CFSTR("details"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "hidden")));
  -[BKCollection setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", v30, CFSTR("hidden"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v6, "sortOrder")));
  -[BKCollection setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", v31, CFSTR("sortKey"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v6, "sortMode")));
  -[BKCollection setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", v32, CFSTR("sortMode"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "deletedFlag")));
  -[BKCollection setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", v33, CFSTR("deletedFlag"));

  v34 = -[BKCollection hasChanges](self, "hasChanges");
  -[BKCollection setDifferentDate:forKey:](self, "setDifferentDate:forKey:", v9, CFSTR("localModDate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[BULogUtilities shared](BULogUtilities, "shared"));
  v36 = objc_msgSend(v35, "verboseLoggingEnabled");

  if (!v34)
  {
    if (!v36)
      goto LABEL_33;
    v40 = BKLibraryCollectionDevelopmentLog();
    v38 = objc_claimAutoreleasedReturnValue(v40);
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      goto LABEL_32;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
    *(_DWORD *)v54 = 138412546;
    *(_QWORD *)&v54[4] = v39;
    *(_WORD *)&v54[12] = 2112;
    *(_QWORD *)&v54[14] = v41;
    v42 = "\"\\\"BKCollection No changes besides date for collectionTitle: %@ collectionID:%@\\\"\";
LABEL_30:
    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, v42, v54, 0x16u);

    goto LABEL_31;
  }
  if (v36)
  {
    v37 = BKLibraryCollectionDevelopmentLog();
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection description](self, "description"));
      *(_DWORD *)v54 = 138412290;
      *(_QWORD *)&v54[4] = v39;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "\"\\\"BKCollection configured with changes: %@\\\"\", v54, 0xCu);
LABEL_31:

    }
LABEL_32:

  }
LABEL_33:
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection placeholder](self, "placeholder", *(_OWORD *)v54, *(_QWORD *)&v54[16]));
  v44 = objc_msgSend(v43, "BOOLValue");

  if (v44)
  {
    v45 = BKLibraryCollectionLog();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
      *(_DWORD *)v54 = 138412290;
      *(_QWORD *)&v54[4] = v47;
      _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Un-hiding user collection BKCollection: %@", v54, 0xCu);

    }
  }
  -[BKCollection setDifferentNumber:forKey:](self, "setDifferentNumber:forKey:", &__kCFBooleanFalse, CFSTR("placeholder"));
LABEL_38:

}

- (id)contentTypePredicate
{
  void *v2;
  unsigned int v3;
  NSPredicate *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection sortKey](self, "sortKey"));
  v3 = objc_msgSend(v2, "intValue");

  if (v3 == -4)
  {
    v5 = 6;
LABEL_7:
    v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %d)"), CFSTR("contentType"), v5, v8, v9);
    goto LABEL_8;
  }
  if (v3 == -3)
  {
    v5 = 3;
    goto LABEL_7;
  }
  if (v3 != -1)
  {
    v6 = 0;
    return v6;
  }
  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("((%K == %d) OR (%K == %d))"), CFSTR("contentType"), 1, CFSTR("contentType"), 4);
LABEL_8:
  v6 = (void *)objc_claimAutoreleasedReturnValue(v4);
  return v6;
}

- (BOOL)canDeleteCollection
{
  return !-[BKCollection isDefaultCollection](self, "isDefaultCollection");
}

- (BOOL)isDefaultCollection
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = objc_msgSend((id)objc_opt_class(self), "availableDefaultCollectionIDsForOS");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)allowsManualAddition
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  LOBYTE(v3) = objc_msgSend(v3, "allowsManualAdditionToCollectionWithID:", v4);

  return (char)v3;
}

+ (BOOL)allowsManualAdditionToCollectionWithID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableDefaultCollectionIDs"));
    if (objc_msgSend(v5, "containsObject:", v4)
      && (objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDWantToRead) & 1) == 0)
    {
      v6 = objc_msgSend(v4, "isEqualToString:", kBKCollectionDefaultIDFinished);
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldSyncCollectionMembers
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v3 = +[BKCollection shouldSyncCollectionID:](BKCollection, "shouldSyncCollectionID:", v2);

  return v3;
}

+ (BOOL)shouldSyncCollectionID:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDDownloaded) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDFinished) ^ 1;

  return v4;
}

- (BOOL)canDeleteLibraryAsset:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !-[BKCollection isDefaultCollection](self, "isDefaultCollection")
    || (objc_msgSend(v4, "isSeriesItem") & 1) == 0
    && (!objc_msgSend(v4, "isCloud")
     || (objc_msgSend(v4, "iTunesU") & 1) != 0
     || objc_msgSend(v4, "isUbiquitousBook"));

  return v5;
}

- (BOOL)deleteRemovesFromCollection
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  if (!-[BKCollection isDefaultCollection](self, "isDefaultCollection"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  if ((objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDFinished) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
    if ((objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDWantToRead) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
      v4 = objc_msgSend(v6, "isEqualToString:", kBKCollectionDefaultIDSamples);

    }
  }

  return v4;
}

+ (void)addCollections:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "libraryManager"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (+[BKCollection isValidForDeserialization:](BKCollection, "isValidForDeserialization:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("serverSyncUniqueId")));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection insertNewCollectionWithCollectionID:inManagedObjectContext:](BKCollection, "insertNewCollectionWithCollectionID:inManagedObjectContext:", v13, v6));
          objc_msgSend(v14, "configureFromDictionary:", v12);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  objc_msgSend(v15, "resetNextCollectionSort");
}

- (void)configureFromBackupSummary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("serverSyncUniqueId")));
  -[BKCollection setCollectionID:](self, "setCollectionID:", v4);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("title")));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_C40E8;
  -[BKCollection setTitle:](self, "setTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("sortKey")));
  -[BKCollection setSortKey:](self, "setSortKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("sortMode")));
  if (v9)
    -[BKCollection setSortMode:](self, "setSortMode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("viewMode")));
  if (v10)
    -[BKCollection setViewMode:](self, "setViewMode:", v10);
  -[BKCollection clearMaxSortKey](self, "clearMaxSortKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("deletedFlag")));
  if (v11)
  {
    -[BKCollection setDeletedFlag:](self, "setDeletedFlag:", v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[BKCollection setDeletedFlag:](self, "setDeletedFlag:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection deletedFlag](self, "deletedFlag"));
  if (objc_msgSend(v13, "BOOLValue"))
  {

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection sortKey](self, "sortKey"));

    if (v14)
      goto LABEL_15;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  -[BKCollection setSortKey:](self, "setSortKey:", v15);

LABEL_15:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));

  if (!v16)
    -[BKCollection setTitle:](self, "setTitle:", &stru_C40E8);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("lastModification")));
  v18 = objc_opt_class(NSDate);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    -[BKCollection setLastModification:](self, "setLastModification:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection lastModification](self, "lastModification"));

  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0));
    -[BKCollection setLastModification:](self, "setLastModification:", v20);

  }
}

+ (BOOL)isSelectableDefaultCollectionID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "availableSelectableDefaultCollectionIDsForOS"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

+ (id)availableDefaultCollectionIDsForOS
{
  _QWORD v3[8];

  v3[0] = kBKCollectionDefaultAll;
  v3[1] = kBKCollectionDefaultIDBooks;
  v3[2] = kBKCollectionDefaultIDWantToRead;
  v3[3] = kBKCollectionDefaultIDAudiobooks;
  v3[4] = kBKCollectionDefaultIDDownloaded;
  v3[5] = kBKCollectionDefaultIDFinished;
  v3[6] = kBKCollectionDefaultIDSamples;
  v3[7] = kBKCollectionDefaultIDPDFs;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 8));
}

+ (id)availableSelectableDefaultCollectionIDsForOS
{
  _QWORD v3[7];

  v3[0] = kBKCollectionDefaultIDBooks;
  v3[1] = kBKCollectionDefaultIDWantToRead;
  v3[2] = kBKCollectionDefaultIDAudiobooks;
  v3[3] = kBKCollectionDefaultIDDownloaded;
  v3[4] = kBKCollectionDefaultIDFinished;
  v3[5] = kBKCollectionDefaultIDSamples;
  v3[6] = kBKCollectionDefaultIDPDFs;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 7));
}

+ (id)availableDefaultCollectionIDs
{
  _QWORD v3[8];

  v3[0] = kBKCollectionDefaultAll;
  v3[1] = kBKCollectionDefaultIDBooks;
  v3[2] = kBKCollectionDefaultIDWantToRead;
  v3[3] = kBKCollectionDefaultIDAudiobooks;
  v3[4] = kBKCollectionDefaultIDDownloaded;
  v3[5] = kBKCollectionDefaultIDFinished;
  v3[6] = kBKCollectionDefaultIDSamples;
  v3[7] = kBKCollectionDefaultIDPDFs;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 8));
}

+ (id)mapContentTypeToDefaultCollectionIDForOS
{
  if (qword_DE4C0 != -1)
    dispatch_once(&qword_DE4C0, &stru_C2DF8);
  return (id)qword_DE4C8;
}

+ (id)contentTypesForDefaultCollectionWithID:(id)a3
{
  id v3;
  _UNKNOWN **v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDBooks) & 1) != 0)
  {
    v4 = &off_CA090;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDPDFs) & 1) != 0)
  {
    v4 = &off_CA0A8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultIDAudiobooks))
  {
    v4 = &off_CA0C0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isSeriesCollectionID:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("iBooks_Series_"));
}

+ (id)seriesCollectionIDForSeriesID:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("iBooks_Series_"), a3);
}

+ (id)seriesIDFromSeriesCollectionID:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (+[BKCollection isSeriesCollectionID:](BKCollection, "isSeriesCollectionID:", v3))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("iBooks_Series_"), "length")));
  else
    v4 = 0;

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ (%p) collectionID=%@ title=%@>"), CFSTR("self"), self, v3, v4));

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection title](self, "title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection details](self, "details"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionID](self, "collectionID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection sortKey](self, "sortKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection sortMode](self, "sortMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection viewMode](self, "viewMode"));
  v5 = -[BKCollection isDefaultCollection](self, "isDefaultCollection");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v16 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection deletedFlag](self, "deletedFlag"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection hidden](self, "hidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection placeholder](self, "placeholder"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection lastModification](self, "lastModification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection members](self, "members"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection seriesID](self, "seriesID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   %@ (%p) \n title: %@\n details:%@ collectionID: %@\n sortKey: %@\n sortMode: %@\n viewMode: %@\n isDefault: %@\n deletedFlag: %@\n hidden: %@\n placeholder: %@ lastModification: %@\n member count: %@\n seriesID: %@"), CFSTR("self"), self, v19, v18, v20, v17, v3, v4, v16, v7, v15, v8, v9, v11, v12));

  return (NSString *)v13;
}

- (void)setMaxSortKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSortKey, 0);
}

@end
