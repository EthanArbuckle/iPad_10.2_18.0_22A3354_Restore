@implementation BNBookDataStoreServices

+ (void)addStoreIDToWantToRead:(id)a3 tracker:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = kBKCollectionDefaultIDWantToRead;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000299C;
  v15[3] = &unk_100008458;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = a1;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  +[BDSServiceCenter addStoreID:toCollectionID:completion:](BDSServiceCenter, "addStoreID:toCollectionID:completion:", v14, v11, v15);

}

+ (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentPrivateIDForContentID:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentUserIDForContentID:", v7));

  v10 = objc_msgSend(objc_alloc((Class)BAContentData), "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v7, 0, v8, v9, objc_msgSend(a1, "_isOwned:", v7), 0, 0, 0, 0, 0, 0, 0);
  return v10;
}

+ (BOOL)_isOwned:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = BSUIGetLibraryItemStateProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemStateWithIdentifier:", v3));

  v7 = objc_msgSend(v6, "library") == (id)1
    || objc_msgSend(v6, "library") == (id)3
    || objc_msgSend(v6, "library") == (id)4
    || objc_msgSend(v6, "library") == (id)5;

  return v7;
}

@end
