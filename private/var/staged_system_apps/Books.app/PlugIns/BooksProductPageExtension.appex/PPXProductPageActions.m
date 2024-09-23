@implementation PPXProductPageActions

+ (id)sharedInstance
{
  if (qword_1000356E8 != -1)
    dispatch_once(&qword_1000356E8, &stru_10002D430);
  return (id)qword_1000356E0;
}

- (PPXProductPageActions)init
{
  PPXProductPageActions *v2;
  id v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PPXProductPageActions;
  v2 = -[PPXProductPageActions init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)BUNetworkMonitor);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("PPXProductPageActions.networkMonitorQueue", v5);
    v7 = objc_msgSend(v3, "initWithQueue:", v6);
    -[PPXProductPageActions setNetworkMonitor:](v2, "setNetworkMonitor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPXProductPageActions networkMonitor](v2, "networkMonitor"));
    objc_msgSend(v8, "start");

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPXProductPageActions networkMonitor](self, "networkMonitor"));
  objc_msgSend(v3, "stop");

  v4.receiver = self;
  v4.super_class = (Class)PPXProductPageActions;
  -[PPXProductPageActions dealloc](&v4, "dealloc");
}

- (void)removeDownload:(id)a3 isAudiobook:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;

  v4 = a4;
  v5 = a3;
  if (!v5)
    goto LABEL_14;
  if (!v4)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
    v40 = 0;
    objc_msgSend(v26, "removeBookFromLibraryWithIdentifier:error:", v5, &v40);
    v27 = v40;

    if (v27)
    {
      v31 = BCProductPageExtensionLog(v25, v28, v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10001EB90((uint64_t)v27, v32, v33, v34, v35, v36, v37, v38);

      goto LABEL_13;
    }
LABEL_12:
    v39 = BSUIGetLibraryItemStateUpdater(v25);
    v27 = (id)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v27, "updateStateToDeletedForIdentifier:", v5);
LABEL_13:

    goto LABEL_14;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[BLMediaQuery audiobooksQuery](BLMediaQuery, "audiobooksQuery"));
  if (v6)
  {
    v7 = (void *)v6;
    v41 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:comparisonType:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:comparisonType:", v8, MPMediaItemPropertyStorePlaylistID, 108));
    objc_msgSend(v7, "addFilterPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](MPMediaLibrary, "defaultMediaLibrary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
    v12 = (uint64_t)objc_msgSend(v10, "removeItems:", v11);

    v17 = BCProductPageExtensionLog(v13, v14, v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10001EB14(v12, v18, v19, v20, v21, v22, v23, v24);

    if ((v12 & 1) != 0)
      goto LABEL_12;
  }
LABEL_14:

}

- (void)downloadBooks:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  void *v34;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeStoreAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ams_DSID"));

  if (v6)
  {
    v28 = v3;
    v7 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoReadOnlyDAAPClient sharedClient](BLJaliscoReadOnlyDAAPClient, "sharedClient"));
    v34 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
    v27 = (void *)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchServerItemsForStoreIDs:andDSIDS:", v7, v9));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "storeID"));
          v18 = (void *)v17;
          if (v17)
          {
            v19 = BSUIGetLibraryItemStateUpdater(v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            objc_msgSend(v20, "updateStateToPurchasingForIdentifier:", v18);

            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "storeDownloadParameters"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v18, "longLongValue")));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v21, v22));

            v24 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "windowManager"));

            v26 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
            objc_msgSend(v26, "purchaseWithRequest:uiManager:completion:", v23, v25, &stru_10002D470);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v13);
    }

    v3 = v28;
  }

}

- (void)downloadBookWithRedownloadParameters:(id)a3 isAudiobook:(BOOL)a4 hasRacSupport:(BOOL)a5 uiManager:(id)a6 tracker:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;
  BOOL v29;

  v10 = a3;
  v11 = a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BLUtilities storeIDFromBuyParameters:](BLUtilities, "storeIDFromBuyParameters:", v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));

  v15 = BSUIGetLibraryItemStateUpdater(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v16, "updateStateToPurchasingForIdentifier:", v13);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006690;
  v24[3] = &unk_10002D4C0;
  v25 = v10;
  v26 = v13;
  v28 = a4;
  v27 = v11;
  v29 = a5;
  v17 = v11;
  v18 = v13;
  v19 = v10;
  v20 = objc_retainBlock(v24);
  ((void (*)(_QWORD *, uint64_t, uint64_t, uint64_t))v20[2])(v20, v21, v22, v23);

}

- (void)cancelDownloadForBook:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[PPXBLDownloadController sharedController](PPXBLDownloadController, "sharedController"));
  objc_msgSend(v4, "cancelDownloadForAssetID:", v3);

}

- (void)openBook:(id)a3 options:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ibooks://storeid/%@"), a4, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v16 = 0;
  v7 = objc_msgSend(v6, "openSensitiveURL:withOptions:error:", v5, 0, &v16);
  v8 = v16;

  if (v7)
    v13 = v8 == 0;
  else
    v13 = 0;
  if (!v13)
  {
    v14 = BCProductPageExtensionLog(v9, v10, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10001EC34();

  }
}

- (void)openSampleBook:(id)a3 withSampleURL:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("itms-bookss://?action=read-sample-book&contentId=%@"), a4, a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v16 = 0;
  v7 = objc_msgSend(v6, "openSensitiveURL:withOptions:error:", v5, 0, &v16);
  v8 = v16;

  if (v7)
    v13 = v8 == 0;
  else
    v13 = 0;
  if (!v13)
  {
    v14 = BCProductPageExtensionLog(v9, v10, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10001EC94();

  }
}

- (void)previewAudiobook:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("itms-bookss://?action=preview-audiobook&contentId=%@"), a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v15 = 0;
  v6 = objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v4, 0, &v15);
  v7 = v15;

  if (v6)
    v12 = v7 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = BCProductPageExtensionLog(v8, v9, v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10001ECF4();

  }
}

- (BUNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitor, 0);
}

@end
