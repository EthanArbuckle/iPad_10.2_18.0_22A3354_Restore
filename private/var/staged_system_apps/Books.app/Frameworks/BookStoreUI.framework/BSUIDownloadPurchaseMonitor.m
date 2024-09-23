@implementation BSUIDownloadPurchaseMonitor

- (BSUIDownloadPurchaseMonitor)initWithDelegate:(id)a3
{
  id v4;
  BSUIDownloadPurchaseMonitor *v5;
  BSUIDownloadPurchaseMonitor *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *access;
  uint64_t v9;
  BCCloudCollectionsManager *cloudCollectionsManager;
  uint64_t v11;
  NSMutableDictionary *downloadPurchaseAttempts;
  NSMutableArray *queuedStoreIDsToRemoveFromMySamples;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BSUIDownloadPurchaseMonitor;
  v5 = -[BSUIDownloadPurchaseMonitor init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_create("BSUIDownloadPurchaseMonitor.access", 0);
    access = v6->_access;
    v6->_access = (OS_dispatch_queue *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[BCCloudCollectionsManager sharedManager](BCCloudCollectionsManager, "sharedManager"));
    cloudCollectionsManager = v6->_cloudCollectionsManager;
    v6->_cloudCollectionsManager = (BCCloudCollectionsManager *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    downloadPurchaseAttempts = v6->_downloadPurchaseAttempts;
    v6->_downloadPurchaseAttempts = (NSMutableDictionary *)v11;

    queuedStoreIDsToRemoveFromMySamples = v6->_queuedStoreIDsToRemoveFromMySamples;
    v6->_queuedStoreIDsToRemoveFromMySamples = 0;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v14, "addObserver:", v6);

  }
  return v6;
}

- (void)_addStoreIDToWantToReadCollection:(id)a3 tracker:(id)a4 productionType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  BSUIDownloadPurchaseMonitor *v15;
  id v16;
  int64_t v17;
  id v18;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readingNowDetailManager"));
    v18 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1D6C0;
    v13[3] = &unk_2E4A30;
    v14 = v8;
    v15 = self;
    v16 = v9;
    v17 = a5;
    objc_msgSend(v11, "readingNowDetailsForAssetIDs:completion:", v12, v13);

  }
}

- (void)_removeStoreIDFromSamplesCollection:(id)a3 tracker:(id)a4 productionType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  id v22;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    if (self->_queuedStoreIDsToRemoveFromMySamples)
    {
      v10 = BSUIDownloadPurchaseMonitorLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "BSUIDownloadPurchaseMonitor: Deferred removal of %@ from My Samples", buf, 0xCu);
      }

      -[NSMutableArray addObject:](self->_queuedStoreIDsToRemoveFromMySamples, "addObject:", v8);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCCollectionMember collectionMemberIDWithCollectionID:assetID:](BCCollectionMember, "collectionMemberIDWithCollectionID:assetID:", kBKCollectionDefaultIDSamples, v8));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor cloudCollectionsManager](self, "cloudCollectionsManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionMemberManager"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1DC78;
      v16[3] = &unk_2E4A08;
      v16[4] = self;
      v17 = v12;
      v18 = v9;
      v19 = v8;
      v20 = a5;
      v15 = v12;
      objc_msgSend(v14, "collectionMemberForCollectionMemberID:completion:", v15, v16);

    }
  }

}

- (void)aq_processCompletedPurchaseAttempt:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "purchaseResponse"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v13, "isSupplementalContent");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tracker"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sessionAssertion"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storeID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "purchaseResponse"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "upSellData"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appAnalyticsAdditionalData"));
      -[BSUIDownloadPurchaseMonitor _emitPurchaseSuccessEventWithTracker:sessionAssertion:forID:response:upSellData:appAnalyticsAdditionalData:](self, "_emitPurchaseSuccessEventWithTracker:sessionAssertion:forID:response:upSellData:appAnalyticsAdditionalData:", v7, v8, v9, v10, v11, v12);

    }
  }

}

- (void)aq_processFailedPurchaseAttempt:(id)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "failureResponse"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v15, "isSupplementalContent");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tracker"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionAssertion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "buyParams"));
      v11 = objc_msgSend(v15, "hasRacSupport");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "failureResponse"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "upSellData"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "appAnalyticsAdditionalData"));
      -[BSUIDownloadPurchaseMonitor _emitPurchaseFailEventWithTracker:sessionAssertion:forID:buyParams:hasRacSupport:response:upSellData:appAnalyticsAdditionalData:](self, "_emitPurchaseFailEventWithTracker:sessionAssertion:forID:buyParams:hasRacSupport:response:upSellData:appAnalyticsAdditionalData:", v8, v9, v7, v10, v11, v12, v13, v14);

    }
  }

}

- (void)downloadQueue:(id)a3 purchaseAttemptForRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *access;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  _QWORD v33[5];
  id v34;

  v6 = a3;
  v7 = a4;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1E250;
  v33[4] = sub_1E260;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BATracker")));
  v34 = objc_msgSend(v9, "newSessionExtendingAssertion");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buyParameters"));
    v13 = objc_msgSend(v7, "isAudiobook");
    v14 = objc_msgSend(v7, "isSupplementalContent");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsInfo"));
    v17 = objc_opt_class(NSNumber, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("hasRacSupport")));
    v19 = BUDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1E268;
    block[3] = &unk_2E4A80;
    block[4] = self;
    v26 = v11;
    v27 = v12;
    v31 = v13;
    v28 = v15;
    v29 = v20;
    v32 = v14;
    v30 = v33;
    v22 = v20;
    v23 = v15;
    v24 = v12;
    dispatch_async(access, block);

  }
  _Block_object_dispose(v33, 8);

}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *access;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

  if (objc_msgSend(v7, "length"))
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1E5B4;
    block[3] = &unk_2E4230;
    block[4] = self;
    v10 = v7;
    v11 = v5;
    dispatch_async(access, block);

  }
}

- (void)downloadQueue:(id)a3 purchasedDidFailWithResponse:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *access;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

  if (objc_msgSend(v7, "length"))
  {
    access = self->_access;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1E7CC;
    block[3] = &unk_2E4230;
    block[4] = self;
    v10 = v7;
    v11 = v5;
    dispatch_async(access, block);

  }
}

- (void)pauseRemovingFromMySamples
{
  NSObject *access;
  _QWORD block[5];

  access = self->_access;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1E8A4;
  block[3] = &unk_2E4608;
  block[4] = self;
  dispatch_async(access, block);
}

- (void)resumeRemovingFromMySamplesWithTracker:(id)a3
{
  id v4;
  NSObject *access;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  access = self->_access;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1E96C;
  v7[3] = &unk_2E40C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(access, v7);

}

- (BSUIDownloadPurchaseMonitorDelegate)delegate
{
  return (BSUIDownloadPurchaseMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BCCloudCollectionsManager)cloudCollectionsManager
{
  return self->_cloudCollectionsManager;
}

- (void)setCloudCollectionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_cloudCollectionsManager, a3);
}

- (NSMutableDictionary)downloadPurchaseAttempts
{
  return self->_downloadPurchaseAttempts;
}

- (void)setDownloadPurchaseAttempts:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPurchaseAttempts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadPurchaseAttempts, 0);
  objc_storeStrong((id *)&self->_cloudCollectionsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedStoreIDsToRemoveFromMySamples, 0);
  objc_storeStrong((id *)&self->_access, 0);
}

- (void)_emitPurchaseAttemptEventWithTracker:(id)a3 forID:(id)a4 buyParams:(id)a5 isAudioBook:(BOOL)a6 hasRacSupport:(BOOL)a7 upSellData:(id)a8 appAnalyticsAdditionalData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  BOOL v33;
  unsigned __int8 v34;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v18 = a9;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor _buyParamsDictFromString:](self, "_buyParamsDictFromString:", a5));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("pricingParameters")));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2AEE0;
  block[3] = &unk_2E5070;
  block[4] = self;
  v27 = v16;
  v32 = a6;
  v33 = a7;
  v28 = v15;
  v29 = v18;
  v34 = -[BSUIDownloadPurchaseMonitor _isPreOrder:](self, "_isPreOrder:", v19);
  v30 = v20;
  v31 = v17;
  v21 = v17;
  v22 = v20;
  v23 = v18;
  v24 = v15;
  v25 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_emitPurchaseSuccessEventWithTracker:(id)a3 sessionAssertion:(id)a4 forID:(id)a5 response:(id)a6 upSellData:(id)a7 appAnalyticsAdditionalData:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  char v39;
  _QWORD v40[4];
  id v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "purchaseParameters"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor _buyParamsDictFromString:](self, "_buyParamsDictFromString:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("pricingParameters")));
  LOBYTE(v20) = -[BSUIDownloadPurchaseMonitor _isPreOrder:](self, "_isPreOrder:", v21);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_2B218;
  v40[3] = &unk_2E4608;
  v41 = v15;
  v23 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B288;
  block[3] = &unk_2E5098;
  block[4] = self;
  v32 = v16;
  v33 = v14;
  v34 = v17;
  v39 = (char)v20;
  v35 = v19;
  v36 = v22;
  v37 = v18;
  v38 = objc_retainBlock(v40);
  v24 = v38;
  v25 = v18;
  v26 = v22;
  v27 = v19;
  v28 = v17;
  v29 = v14;
  v30 = v16;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)_emitPurchaseFailEventWithTracker:(id)a3 sessionAssertion:(id)a4 forID:(id)a5 buyParams:(id)a6 hasRacSupport:(BOOL)a7 response:(id)a8 upSellData:(id)a9 appAnalyticsAdditionalData:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v31;
  void *v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  BOOL v41;
  unsigned __int8 v42;
  _QWORD v43[4];
  id v44;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor _buyParamsDictFromString:](self, "_buyParamsDictFromString:", a6));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("pricingParameters")));
  v22 = -[BSUIDownloadPurchaseMonitor _isPreOrder:](self, "_isPreOrder:", v32);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_2B5F0;
  v43[3] = &unk_2E4608;
  v44 = v16;
  v31 = v16;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B660;
  block[3] = &unk_2E50C0;
  block[4] = self;
  v34 = v17;
  v41 = a7;
  v35 = v15;
  v36 = v20;
  v42 = v22;
  v37 = v21;
  v38 = v18;
  v39 = v19;
  v40 = objc_retainBlock(v43);
  v23 = v40;
  v24 = v19;
  v25 = v18;
  v26 = v21;
  v27 = v20;
  v28 = v15;
  v29 = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_buyParamsDictFromString:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "componentsSeparatedByString:", CFSTR("=")));
        if (objc_msgSend(v10, "count") == (char *)&dword_0 + 2)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
          if (objc_msgSend(v11, "length"))
            -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, v11);

        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_isPreOrder:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pricingParameters")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isPreorder")));

  LOBYTE(v3) = objc_msgSend(v5, "isEqualToString:", CFSTR("1"));
  LOBYTE(v3) = objc_msgSend(v4, "hasSuffix:", CFSTR("PRE")) | v3;

  return (char)v3;
}

- (id)_newContentDataForID:(id)a3 isAudioBook:(BOOL)a4 hasRacSupport:(BOOL)a5 tracker:(id)a6 supplementalContentCount:(id)a7 appAnalyticsAdditionalData:(id)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  v11 = a5;
  v12 = a4;
  v14 = a3;
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentPrivateIDForContentID:", v14));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "contentUserIDForContentID:", v14));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v21 = objc_msgSend(v20, "seriesTypeForContentID:", v14);

  v22 = -[BSUIDownloadPurchaseMonitor _newProductionTypeForIsAudiobook:hasRacSupport:](self, "_newProductionTypeForIsAudiobook:hasRacSupport:", v12, v11);
  if (v15 && _os_feature_enabled_impl("Books", "unifiedProductPage"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v15, "supportsUnifiedProductPage")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "editionKind"));
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }
  if (v12)
    v25 = 2;
  else
    v25 = 1;
  v26 = objc_msgSend(objc_alloc((Class)BAContentData), "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v14, v25, v18, v19, 1, 0, 0, v16, v21, v22, v23, v24);

  return v26;
}

- (int64_t)_newProductionTypeForIsAudiobook:(BOOL)a3 hasRacSupport:(BOOL)a4
{
  int64_t v4;

  v4 = 1;
  if (!a4)
    v4 = 2;
  if (a3)
    return v4;
  else
    return 0;
}

- (id)_newPurchaseDataForPurchaseID:(id)a3 isPreorder:(BOOL)a4 pricingParameters:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)BAPurchaseData), "initWithPurchaseAttemptID:purchaseMethod:isPreorder:pricingParameters:", v8, 0, v5, v7);

  return v9;
}

- (id)_newPurchaseFailData:(int64_t)a3 errorCode:(id)a4 errorDescription:(id)a5 errorDomain:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_msgSend(objc_alloc((Class)BAPurchaseFailData), "initWithPurchaseFailureReason:errorCode:errorDescription:errorDomain:", a3, v11, v10, v9);

  return v12;
}

- (id)purchaseIDs
{
  void *v2;
  NSMutableDictionary *v3;
  void *v4;

  v2 = (void *)qword_32C060;
  if (!qword_32C060)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    v4 = (void *)qword_32C060;
    qword_32C060 = (uint64_t)v3;

    v2 = (void *)qword_32C060;
  }
  return v2;
}

- (id)_purchaseForItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor purchaseIDs](self, "purchaseIDs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_addPurchaseForItemID:(id)a3 isAudioBook:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BSUIPurchase *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    v4 = a4;
    v6 = a3;
    v7 = objc_opt_new(BSUIPurchase);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    -[BSUIPurchase setIdentifier:](v7, "setIdentifier:", v9);

    -[BSUIPurchase setIsAudioBook:](v7, "setIsAudioBook:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor purchaseIDs](self, "purchaseIDs"));
    objc_msgSend(v10, "setObject:forKey:", v7, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_removePurchaseByItemID:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BSUIDownloadPurchaseMonitor purchaseIDs](self, "purchaseIDs"));
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

@end
