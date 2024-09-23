@implementation PPXJSALibraryManager

- (void)getVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _UNKNOWN **v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v6 = &off_10002E8D0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v4, "enqueueValueCall:arguments:file:line:", v3, v5, CFSTR("PPXJSALibraryManager.m"), 36);

}

- (void)addBookToWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a3;
  v9 = BSUIGetLibraryItemStateUpdater(+[PPXBookDataStoreServices addStoreIDToWantToRead:tracker:](PPXBookDataStoreServices, "addStoreIDToWantToRead:tracker:", v8, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "updateWantToReadState:identifier:", 1, v8);

  v12 = BSUIGetLibraryItemStateUpdater(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "updateItemOfInterestForItemIdentifier:", v8);

  v14 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v14, "enqueueValueCall:arguments:file:line:", v7, 0, CFSTR("PPXJSALibraryManager.m"), 44);

}

- (void)removeBookFromWantToReadCollection:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a3;
  v9 = BSUIGetLibraryItemStateUpdater(+[PPXBookDataStoreServices removeAssetFromWantToRead:tracker:](PPXBookDataStoreServices, "removeAssetFromWantToRead:tracker:", v8, a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "updateWantToReadState:identifier:", 0, v8);

  v12 = BSUIGetLibraryItemStateUpdater(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v13, "updateItemOfInterestForItemIdentifier:", v8);

  v14 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v14, "enqueueValueCall:arguments:file:line:", v7, 0, CFSTR("PPXJSALibraryManager.m"), 52);

}

- (void)downloadBooks:(id)a3 :(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PPXProductPageActions sharedInstance](PPXProductPageActions, "sharedInstance"));
  objc_msgSend(v7, "downloadBooks:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v10 = &off_10002E8F8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v8, "enqueueValueCall:arguments:file:line:", v5, v9, CFSTR("PPXJSALibraryManager.m"), 60);

}

- (void)downloadBookWithRedownloadParameters:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6 :(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UNKNOWN **v19;

  v7 = a7;
  v9 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "windowManager"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PPXProductPageActions sharedInstance](PPXProductPageActions, "sharedInstance"));
  objc_msgSend(v16, "downloadBookWithRedownloadParameters:isAudiobook:hasRacSupport:uiManager:tracker:", v13, v9, v7, v15, v11);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v19 = &off_10002E920;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  objc_msgSend(v17, "enqueueValueCall:arguments:file:line:", v12, v18, CFSTR("PPXJSALibraryManager.m"), 70);

}

- (void)markBookAsFinished:(id)a3 :(BOOL)a4 :(id)a5 :(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  v11 = BSUIGetLibraryItemStateUpdater(+[PPXBookDataStoreServices setFinishedState:storeID:tracker:](PPXBookDataStoreServices, "setFinishedState:storeID:tracker:", v7, v10, a6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "updateFinishedState:identifier:", v7, v10);

  v14 = BSUIGetLibraryItemStateUpdater(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v15, "updateItemOfInterestForItemIdentifier:", v10);

  v16 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v16, "enqueueValueCall:arguments:file:line:", v9, 0, CFSTR("PPXJSALibraryManager.m"), 78);

}

- (void)openBook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PPXProductPageActions sharedInstance](PPXProductPageActions, "sharedInstance"));
  objc_msgSend(v11, "openBook:options:", v10, v9);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v12, "enqueueValueCall:arguments:file:line:", v8, 0, CFSTR("PPXJSALibraryManager.m"), 84);

}

- (void)openSampleBook:(id)a3 downloadSampleURL:(id)a4 options:(id)a5 callback:(id)a6 tracker:(id)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PPXProductPageActions sharedInstance](PPXProductPageActions, "sharedInstance"));
  objc_msgSend(v12, "openSampleBook:withSampleURL:", v11, v10);

  v13 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v13, "enqueueValueCall:arguments:file:line:", v9, 0, CFSTR("PPXJSALibraryManager.m"), 90);

}

- (void)previewAudiobook:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PPXProductPageActions sharedInstance](PPXProductPageActions, "sharedInstance"));
  objc_msgSend(v9, "previewAudiobook:", v8);

  v10 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v10, "enqueueValueCall:arguments:file:line:", v7, 0, CFSTR("PPXJSALibraryManager.m"), 96);

}

- (void)updateBooks:(id)a3 :(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v5, "enqueueValueCall:arguments:file:line:", v4, 0, CFSTR("PPXJSALibraryManager.m"), 102);

}

- (void)cancelDownloadForBook:(id)a3 :(id)a4 :(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PPXProductPageActions sharedInstance](PPXProductPageActions, "sharedInstance"));
  objc_msgSend(v8, "cancelDownloadForBook:", v7);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v9, "enqueueValueCall:arguments:file:line:", v6, 0, CFSTR("PPXJSALibraryManager.m"), 108);

}

- (void)showCollection:(id)a3 :(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v5, "enqueueValueCall:arguments:file:line:", v4, 0, CFSTR("PPXJSALibraryManager.m"), 114);

}

- (void)getCollectionNameForCollectionID:(id)a3 :(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isObject"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", v5));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
      v13 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      objc_msgSend(v8, "enqueueValueCall:arguments:file:line:", v6, v9, CFSTR("PPXJSALibraryManager.m"), 124);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudCollectionsManager sharedManager](BCCloudCollectionsManager, "sharedManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionDetailManager"));

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100004D7C;
      v11[3] = &unk_10002D1D8;
      v12 = v6;
      objc_msgSend(v8, "collectionDetailForCollectionID:completion:", v5, v11);
      v9 = v12;
    }

  }
}

- (void)getStoreIDsWithAvailableUpdatesWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v4, "enqueueValueCall:arguments:file:line:", v3, &off_10002E948, CFSTR("PPXJSALibraryManager.m"), 136);

}

- (void)filterPurchasedBooks:(id)a3 callback:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "isArray"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toArray"));
  else
    v6 = &__NSArray0__struct;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v7, "enqueueValueCall:arguments:file:line:", v5, v6, CFSTR("PPXJSALibraryManager.m"), 143);

}

- (id)mostRecentPurchaseDate
{
  return 0;
}

- (void)assetsOfPurchasedBooks:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v4, "enqueueValueCall:arguments:file:line:", v3, &__NSArray0__struct, CFSTR("PPXJSALibraryManager.m"), 153);

}

@end
