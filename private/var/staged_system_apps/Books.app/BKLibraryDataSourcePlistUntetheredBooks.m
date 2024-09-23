@implementation BKLibraryDataSourcePlistUntetheredBooks

- (BKLibraryDataSourcePlistUntetheredBooks)initWithPlistKind:(int64_t)a3 identifier:(id)a4 assetMetadataProvider:(id)a5 coverImageHelper:(id)a6 assetMetadataCache:(id)a7
{
  BKLibraryDataSourcePlistUntetheredBooks *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *moveUbiquitousBooksToLocalSerialQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryDataSourcePlistUntetheredBooks;
  v7 = -[BKLibraryDataSourcePlist initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:](&v11, "initWithPlistKind:identifier:assetMetadataProvider:coverImageHelper:assetMetadataCache:", a3, a4, a5, a6, a7);
  if (v7)
  {
    v8 = dispatch_queue_create("BKLibraryDataSourcePlist.moveUbiquitousBooksToLocalSerialQueue", 0);
    moveUbiquitousBooksToLocalSerialQueue = v7->_moveUbiquitousBooksToLocalSerialQueue;
    v7->_moveUbiquitousBooksToLocalSerialQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (BOOL)isEligibleLocalBookToBeMadeUbiquitous:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_opt_class(BKPlistAsset);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist identifier](self, "identifier")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSourceIdentifier")),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        v10))
  {
    if (objc_msgSend(v7, "isSupplementalContent"))
      v11 = objc_msgSend(v7, "contentType") == 3;
    else
      v11 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));
    if (!v12 || v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permlink"));
      if (v13)
        LOBYTE(v11) = 0;
      else
        v11 = objc_msgSend(v7, "isRestoring") ^ 1;

    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  BKLibraryDataSourcePlistUntetheredBooks *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100133770;
  v4[3] = &unk_1008E9D38;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BKLibraryDataSourcePlist fetchAssetIDsWithCompletion:](v5, "fetchAssetIDsWithCompletion:", v4);

}

- (void)fetchLocalAssetWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v14 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100133B1C;
    v12[3] = &unk_1008EA1D0;
    v13 = v8;
    -[BKLibraryDataSourcePlist fetchAssetsWithIDs:completion:](self, "fetchAssetsWithIDs:completion:", v9, v12);

  }
  else
  {
    v10 = (void (**)(id, _QWORD, void *))objc_retainBlock(v7);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kBKLibraryDataSourceDomain, kBKLibraryDataSourceErrorInvalidAssetError, 0));
      v10[2](v10, 0, v11);

    }
  }

}

- (void)makeBooksLocal:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSObject *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  _QWORD v12[4];
  id v13;
  BKLibraryDataSourcePlistUntetheredBooks *v14;
  NSMutableArray *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_opt_new(NSMutableArray);
    v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlistUntetheredBooks moveUbiquitousBooksToLocalSerialQueue](self, "moveUbiquitousBooksToLocalSerialQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100133CE0;
    v12[3] = &unk_1008E8EE0;
    v13 = v6;
    v14 = self;
    v15 = v8;
    v16 = v7;
    v10 = v8;
    dispatch_async(v9, v12);

  }
  else
  {
    v11 = (NSMutableArray *)objc_retainBlock(v7);
    v10 = v11;
    if (v11)
      ((void (*)(NSMutableArray *, _QWORD, _QWORD))v11[2].super.super.isa)(v11, 0, 0);
  }

}

- (BOOL)wantsPlistEntry:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isSampleFromPlistEntry:](IMLibraryPlist, "isSampleFromPlistEntry:", a3));
  v4 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v4;
}

- (void)q_updateUniqueIDIfNeededInMutableEntry:(id)a3 withOriginalBookEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (-[BKLibraryDataSourcePlist _isSupplementalPDFFromPlistEntry:](self, "_isSupplementalPDFFromPlistEntry:", v7)
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist storeIdFromPlistEntry:](IMLibraryPlist, "storeIdFromPlistEntry:", v7))) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist uniqueIdFromPlistEntry:](IMLibraryPlist, "uniqueIdFromPlistEntry:", v7));
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist permlinkFromPlistEntry:](IMLibraryPlist, "permlinkFromPlistEntry:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("Inserted-By-iBooks")));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (!v8)
  {
    if (v9)
      v12 = 1;
    else
      v12 = v11;
    if ((v12 & 1) != 0)
    {
      v8 = 0;
      goto LABEL_19;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("BKLibraryDataSourcePlist-FullPath")));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fullPathToAssetID](self, "fullPathToAssetID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));

      if (v8)
      {
LABEL_17:
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist keyNameForUniqueId](IMLibraryPlist, "keyNameForUniqueId"));
        objc_msgSend(v6, "setValue:forKey:", v8, v17);

        goto LABEL_18;
      }
      v18 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibraryUtility identifierFromBookPath:error:](BLLibraryUtility, "identifierFromBookPath:error:", v13, &v18));
      v15 = v18;
      if (v8 && !v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourcePlist fullPathToAssetID](self, "fullPathToAssetID"));
        objc_msgSend(v16, "setObject:forKey:", v8, v13);

        goto LABEL_17;
      }

      if (v8)
        goto LABEL_17;
    }
    else
    {
      v8 = 0;
    }
LABEL_18:

  }
LABEL_19:

}

- (OS_dispatch_queue)moveUbiquitousBooksToLocalSerialQueue
{
  return self->_moveUbiquitousBooksToLocalSerialQueue;
}

- (void)setMoveUbiquitousBooksToLocalSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_moveUbiquitousBooksToLocalSerialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveUbiquitousBooksToLocalSerialQueue, 0);
}

@end
