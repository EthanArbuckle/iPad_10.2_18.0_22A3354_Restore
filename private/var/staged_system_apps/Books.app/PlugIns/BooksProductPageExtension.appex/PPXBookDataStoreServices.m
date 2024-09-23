@implementation PPXBookDataStoreServices

+ (void)removeAssetID:(id)a3 fromCollectionID:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a5;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BCCollectionMember collectionMemberIDWithCollectionID:assetID:](BCCollectionMember, "collectionMemberIDWithCollectionID:assetID:", a4, a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudCollectionsManager sharedManager](BCCloudCollectionsManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionMemberManager"));

  objc_msgSend(v9, "deleteCollectionMemberForCollectionMemberID:completion:", v10, v7);
}

+ (void)removeAssetFromWantToRead:(id)a3 tracker:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = kBKCollectionDefaultIDWantToRead;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005308;
  v10[3] = &unk_10002D2C0;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  +[PPXBookDataStoreServices removeAssetID:fromCollectionID:completion:](PPXBookDataStoreServices, "removeAssetID:fromCollectionID:completion:", v8, v7, v10);

}

+ (void)addStoreIDToWantToRead:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = kBKCollectionDefaultIDWantToRead;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000054C0;
  v11[3] = &unk_10002D310;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  +[BDSServiceCenter addStoreID:toCollectionID:completion:](BDSServiceCenter, "addStoreID:toCollectionID:completion:", v10, v8, v11);

}

+ (void)fetchIsAssetID:(id)a3 inWantToReadCollectionWithCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = kBKCollectionDefaultIDWantToRead;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005684;
  v8[3] = &unk_10002D338;
  v9 = v5;
  v7 = v5;
  +[BDSServiceCenter fetchIsAssetID:inCollectionID:completion:](BDSServiceCenter, "fetchIsAssetID:inCollectionID:completion:", a3, v6, v8);

}

+ (void)setFinishedState:(BOOL)a3 storeID:(id)a4 tracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)BCMutableStoreItem), "initWithStoreID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeAssetManager"));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000057D0;
  v15[3] = &unk_10002D388;
  v19 = a3;
  v17 = v9;
  v18 = a1;
  v16 = v8;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v12, "addStoreItem:completion:", v10, v15);

}

+ (void)fetchIsAssetID:(id)a3 inFinishedCollectionWithCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetDetailManager"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005B1C;
  v10[3] = &unk_10002D3B0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "assetDetailForAssetID:completion:", v6, v10);

}

+ (void)_analyticsSubmitRemoveFromWantListEventWithTracker:(id)a3 contentID:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7 && objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v6, "emitRemoveFromWantListEventWithTracker:contentID:contentType:", v7, v5, 0);

  }
}

+ (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)BAContentData);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentPrivateIDForContentID:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentUserIDForContentID:", v7));

  v11 = objc_msgSend(a1, "_isOwned:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v13 = objc_msgSend(v8, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v7, 0, v9, v10, v11, 0, 0, 0, objc_msgSend(v12, "seriesTypeForContentID:", v7), 0, 0, 0);

  return v13;
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
