@implementation BKBookPurchaseAction

+ (void)tryToPurchaseBook:(id)a3 libraryAssetProvider:(id)a4 buyParameters:(id)a5 allowPurchaseFromNonSampleBuyButton:(BOOL)a6 suppressNetworkEvaluatorDialogs:(BOOL)a7 analyticsInfo:(id)a8 completion:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  BOOL v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  BOOL v53;
  id location[2];

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
  if (objc_msgSend(v15, "isCloud"))
  {
    objc_initWeak(location, a1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BLJaliscoDAAPClient sharedClient](BLJaliscoDAAPClient, "sharedClient"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v20));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10017581C;
    v47[3] = &unk_1008ED0C8;
    objc_copyWeak(&v52, location);
    v48 = v20;
    v49 = v15;
    v53 = v10;
    v50 = v18;
    v51 = v19;
    objc_msgSend(v21, "fetchItemsForStoreIDs:completion:", v22, v47);

    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
  }
  else if (objc_msgSend(v15, "isSeriesItem"))
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100175990;
    v40[3] = &unk_1008ED0F0;
    v45 = a1;
    v23 = v20;
    v41 = v23;
    v24 = v15;
    v42 = v24;
    v46 = v10;
    v43 = v18;
    v44 = v19;
    v25 = objc_retainBlock(v40);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BKSeriesManager sharedManager](BKSeriesManager, "sharedManager"));
    objc_msgSend(v26, "fetchBuyParametersForSeriesWithAdamID:isAudiobook:completionHandler:", v23, objc_msgSend(v24, "isAudiobook"), v25);

  }
  else
  {
    v27 = objc_msgSend(v17, "length");
    if (v27 && (v27 = objc_msgSend(v20, "length")) != 0 && (a6 || (v27 = objc_msgSend(v15, "isSample"), (_DWORD)v27)))
    {
      objc_msgSend(a1, "_executePurchaseOfBookWithParameters:storeID:isAudiobook:suppressNetworkEvaluatorDialogs:shouldSuppressError:analyticsInfo:completion:", v17, v20, objc_msgSend(v15, "isAudiobook"), v10, 1, v18, v19);
    }
    else
    {
      v30 = BKLibraryLog(v27, v28, v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1006A2E6C((uint64_t)v20, v31, v32, v33, v34, v35, v36, v37);

      v38 = objc_retainBlock(v19);
      v39 = v38;
      if (v38)
        (*((void (**)(id, _QWORD, _QWORD))v38 + 2))(v38, 0, 0);

    }
  }

}

+ (void)tryToUpdateBook:(id)a3 libraryAssetProvider:(id)a4 analyticsInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeID"));
  v12 = objc_msgSend(v8, "isAudiobook");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100175B8C;
  v15[3] = &unk_1008ED118;
  objc_copyWeak(&v18, &location);
  v13 = v11;
  v16 = v13;
  v19 = v12;
  v14 = v10;
  v17 = v14;
  +[BKUpdatesParameterProvider fetchUpdateParametersForLibraryAsset:completion:](BKUpdatesParameterProvider, "fetchUpdateParametersForLibraryAsset:completion:", v8, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

+ (void)_executePurchaseOfBookWithParameters:(id)a3 storeID:(id)a4 isAudiobook:(BOOL)a5 suppressNetworkEvaluatorDialogs:(BOOL)a6 shouldSuppressError:(BOOL)a7 analyticsInfo:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  BOOL v26;

  v11 = a6;
  v12 = a5;
  v15 = a9;
  v16 = a8;
  v17 = a3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(a4, "longLongValue")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v17, v18));

  objc_msgSend(v19, "setAudiobook:", v12);
  objc_msgSend(v19, "setSuppressNetworkEvaluatorDialogs:", v11);
  objc_msgSend(v19, "setAnalyticsInfo:", v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "windowManager"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100175E74;
  v24[3] = &unk_1008ED140;
  v26 = a7;
  v25 = v15;
  v23 = v15;
  objc_msgSend(v22, "purchaseWithRequest:uiManager:completion:", v19, v21, v24);

}

@end
