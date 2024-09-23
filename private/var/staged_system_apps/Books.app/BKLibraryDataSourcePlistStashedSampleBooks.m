@implementation BKLibraryDataSourcePlistStashedSampleBooks

- (BKLibraryDataSourcePlistStashedSampleBooks)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  BKLibraryDataSourcePlistStashedSampleBooks *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *pendingDeleteAssetIDs;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  v7 = -[BKLibraryDataSourcePlist initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:](&v14, "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", a3, a4, a5, a6, a7);
  if (v7)
  {
    v15[0] = NSFileOwnerAccountName;
    v15[1] = NSFileGroupOwnerAccountName;
    v16[0] = CFSTR("mobile");
    v16[1] = CFSTR("mobile");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist directory](v7, "directory"));
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, v8, 0);

    v11 = objc_opt_new(NSMutableSet);
    pendingDeleteAssetIDs = v7->_pendingDeleteAssetIDs;
    v7->_pendingDeleteAssetIDs = v11;

  }
  return v7;
}

- (void)setLibraryManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));

  if (v6)
  {
    v7 = BKLibraryOwnershipDidChangeNotification;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist libraryManager](self, "libraryManager"));
    objc_msgSend(v5, "removeObserver:name:object:", self, v7, v8);

  }
  v10.receiver = self;
  v10.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  -[BKLibraryDataSourcePlist setLibraryManager:](&v10, "setLibraryManager:", v4);
  if (v4)
  {
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleOwnershipChange:", BKLibraryOwnershipDidChangeNotification, v4);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "removeObserver:", self);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  -[BKLibraryDataSourcePlistStashedSampleBooks dealloc](&v4, "dealloc");
}

- (void)_handleOwnershipChange:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v20 = objc_opt_new(NSMutableArray);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BKLibraryOwnershipAssetsKey));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v25 = *(_QWORD *)v27;
    v24 = BKLibraryOwnershipOldDatasourceKey;
    v23 = BKLibraryOwnershipNewDatasourceKey;
    v22 = BKLibraryOwnershipAssetIDKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v24));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v23));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v22));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
        if ((objc_msgSend(v9, "isEqualToString:", v12) & 1) != 0)
        {

          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ibooks.plist.untethered")) & 1) != 0)
            goto LABEL_11;
          v13 = 1;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistStashedSampleBooks pendingDeleteAssetIDs](self, "pendingDeleteAssetIDs"));
          v13 = objc_msgSend(v14, "containsObject:", v11);

          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.ibooks.plist.untethered")) & 1) != 0)
          {
            if (!v13)
              goto LABEL_17;
LABEL_11:
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistStashedSampleBooks pendingDeleteAssetIDs](self, "pendingDeleteAssetIDs"));
            objc_msgSend(v15, "removeObject:", v11);

            -[NSMutableArray addObject:](v20, "addObject:", v11);
            goto LABEL_17;
          }
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier"));
        v17 = objc_msgSend(v10, "isEqualToString:", v16);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistStashedSampleBooks pendingDeleteAssetIDs](self, "pendingDeleteAssetIDs"));
          objc_msgSend(v18, "removeObject:", v11);
        }
        else
        {
          if (!v13)
            goto LABEL_17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistStashedSampleBooks pendingDeleteAssetIDs](self, "pendingDeleteAssetIDs"));
          objc_msgSend(v18, "addObject:", v11);
        }

LABEL_17:
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  if (-[NSMutableArray count](v20, "count"))
    -[BKLibraryDataSourcePlist deleteAssetIDs:completion:](self, "deleteAssetIDs:completion:", v20, 0);

}

- (id)_pathStringWithoutDirectoryPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist directory](self, "directory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v5, &stru_10091C438));

  return v6;
}

- (id)_newEntryFromSummary:(id)a3
{
  id v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryDataSourcePlistStashedSampleBooks;
  v3 = -[BKLibraryDataSourcePlist _newEntryFromSummary:](&v6, "_newEntryFromSummary:", a3);
  v4 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isSample"));
  return v4;
}

- (void)ephemeralAssetsRedundant:(id)a3
{
  -[BKLibraryDataSourcePlist deleteAssets:exhaustive:completion:](self, "deleteAssets:exhaustive:completion:", a3, 1, 0);
}

- (NSMutableSet)pendingDeleteAssetIDs
{
  return self->_pendingDeleteAssetIDs;
}

- (void)setPendingDeleteAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDeleteAssetIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDeleteAssetIDs, 0);
}

@end
