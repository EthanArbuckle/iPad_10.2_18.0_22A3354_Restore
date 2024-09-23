@implementation BSUIStoreServices

- (BSUIStoreServices)initWithDelegate:(id)a3
{
  id v4;
  BSUIStoreServices *v5;
  BSUIStoreServices *v6;
  BSUIDownloadPurchaseMonitor *v7;
  BSUIDownloadPurchaseMonitor *downloadPurchaseMonitor;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BSUIStoreServices;
  v5 = -[BSUIStoreServices init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = -[BSUIDownloadPurchaseMonitor initWithDelegate:]([BSUIDownloadPurchaseMonitor alloc], "initWithDelegate:", v6);
    downloadPurchaseMonitor = v6->_downloadPurchaseMonitor;
    v6->_downloadPurchaseMonitor = v7;

  }
  return v6;
}

+ (id)getInstance
{
  return +[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance");
}

+ (BSUIStoreServices)sharedInstance
{
  if (qword_32C0A8[0] != -1)
    dispatch_once(qword_32C0A8, &stru_2E55A0);
  return (BSUIStoreServices *)(id)qword_32C0A0;
}

+ (void)checkAudiobookAvailabilityForStoreID:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if ((+[BKReachability isOffline](BKReachability, "isOffline") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCMBridgedCatalogService sharedInstance](BCMBridgedCatalogService, "sharedInstance"));
    v8 = objc_alloc((Class)BFMRequestMetadata);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "BSUIStoreServices.m"));
    v10 = objc_msgSend(v8, "initWithFileID:line:", v9, 77);
    v6 = objc_msgSend(v7, "checkAvailabilityForStoreID:type:metadata:", v11, 0, v10) ^ 1;

  }
  v5[2](v5, v6);

}

- (id)analyticsTrackerForPurchaseMonitor:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIStoreServices delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analyticsTrackerForStoreServices:", self));

  return v5;
}

- (id)_optionsForTransaction:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  id v7;

  if (!a3)
    return &__NSDictionary0__struct;
  v6 = BCTransactionOptionsTransactionKey;
  v7 = a3;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));

  return v4;
}

- (void)showProductPageForStoreID:(id)a3 resourceType:(int64_t)a4 transaction:(id)a5 needsAnalyticsLinkData:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v16 = a3;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v15 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));

  -[BSUIStoreServices showProductPagesForStoreIDs:resourceTypes:focusedIndex:transaction:needsAnalyticsLinkData:](self, "showProductPagesForStoreIDs:resourceTypes:focusedIndex:transaction:needsAnalyticsLinkData:", v12, v14, 0, v10, v6);
}

- (void)showProductPagesForStoreIDs:(id)a3 resourceTypes:(id)a4 focusedIndex:(unint64_t)a5 transaction:(id)a6 needsAnalyticsLinkData:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  id v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  BOOL v31;
  unint64_t v32;
  _QWORD v33[4];
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  BOOL v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = BSUIStoreServicesLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", ")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    *(_DWORD *)buf = 136446722;
    v47 = "-[BSUIStoreServices showProductPagesForStoreIDs:resourceTypes:focusedIndex:transaction:needsAnalyticsLinkData:]";
    v48 = 2112;
    v49 = v17;
    v50 = 2112;
    v51 = v18;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}s adamIDs=[%@], focusedIndex=%@", buf, 0x20u);

  }
  if (objc_msgSend(v12, "count"))
  {
    v31 = a7;
    v32 = a5;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIStoreServices _optionsForTransaction:](self, "_optionsForTransaction:", v14));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v20 = v13;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[BCMAssetWrapper nameForResourceType:](BCMAssetWrapper, "nameForResourceType:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i), "integerValue")));
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v22);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_38D3C;
    v35[3] = &unk_2E55F0;
    v40 = v31;
    v35[4] = self;
    v36 = v12;
    v39 = v32;
    v26 = v19;
    v37 = v26;
    v27 = v30;
    v38 = v27;
    v28 = objc_retainBlock(v35);
    v29 = v28;
    if (v14)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_38F60;
      v33[3] = &unk_2E3F88;
      v34 = v28;
      objc_msgSend(v14, "commit:", v33);

    }
    else
    {
      ((void (*)(_QWORD *))v28[2])(v28);
    }

  }
}

- (void)_setPurchaseHidden:(BOOL)a3 forStoreID:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v7 = a4;
  v8 = a5;
  if (v7
    && (+[BLLibraryUtility _isMultiUser](BLLibraryUtility, "_isMultiUser") & 1) == 0
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance")),
        v10 = objc_msgSend(v9, "isAccountModificationAllowed"),
        v9,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_3909C;
    v14[3] = &unk_2E5640;
    v16 = v8;
    v17 = a3;
    v15 = v7;
    objc_msgSend(v11, "enqueueBlock:file:line:", v14, CFSTR("BSUIStoreServices.m"), 170);

  }
  else
  {
    v12 = objc_retainBlock(v8);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

  }
}

- (void)hidePurchasedForStoreIDs:(id)a3 contentTypeDictionary:(id)a4 supplementalContentCountDictionary:(id)a5 hasRACSupportDictionary:(id)a6 tracker:(id)a7
{
  id v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  NSMutableSet *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  dispatch_queue_global_t global_queue;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  NSObject *group;
  NSMutableSet *v60;
  id obj;
  NSMutableDictionary *v62;
  uint64_t v63;
  id v64;
  NSMutableSet *v65;
  _QWORD block[5];
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 *v71;
  _QWORD *v72;
  _QWORD v73[4];
  NSMutableDictionary *v74;
  NSObject *v75;
  __int128 *p_buf;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  NSMutableSet *v82;
  NSObject *v83;
  _QWORD *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  id v90;
  uint8_t v91[128];
  uint8_t v92[4];
  void *v93;
  uint8_t v94[128];
  __int128 buf;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;

  v11 = a3;
  v64 = a4;
  v57 = a5;
  v56 = a6;
  v55 = a7;
  v12 = BSUIStoreServicesLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", ")));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "[BSUIStoreServices] hidePurchasedForStoreIDs:(%@)", (uint8_t *)&buf, 0xCu);

  }
  v16 = objc_opt_new(NSMutableSet);
  v65 = objc_opt_new(NSMutableSet);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v96 = 0x3032000000;
  v97 = sub_39A84;
  v98 = sub_39A94;
  v99 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = sub_39A84;
  v89[4] = sub_39A94;
  v90 = 0;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v11;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v86 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKeyedSubscript:", v20));
        v22 = objc_msgSend(v21, "integerValue") == (char *)&dword_0 + 2;

        if (v22)
          v23 = v16;
        else
          v23 = v65;
        -[NSMutableSet addObject:](v23, "addObject:", v20);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
    }
    while (v17);
  }

  group = dispatch_group_create();
  if (-[NSMutableSet count](v65, "count"))
  {
    dispatch_group_enter(group);
    v24 = BSUIStoreServicesLog();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v65, "allObjects"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)v92 = 138412290;
      v93 = v27;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices hiding jalisco items with identifiers on server %@", v92, 0xCu);

    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_39A9C;
    v81[3] = &unk_2E5668;
    v84 = v89;
    v82 = v65;
    v83 = group;
    objc_msgSend(v28, "hideItemsWithStoreIDs:completion:", v82, v81);

  }
  v62 = objc_opt_new(NSMutableDictionary);
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v60 = v16;
  v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
  if (v29)
  {
    v63 = *(_QWORD *)v78;
    v30 = MPMediaItemPropertyStoreID;
    v31 = MPMediaItemPropertyPurchaseHistoryID;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v78 != v63)
          objc_enumerationMutation(v60);
        v33 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v33, v30));
        objc_msgSend(v34, "addFilterPredicate:", v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "collections"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bk_cloudRepresentativeItem"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForProperty:", v31));
        if (v39)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v39, v33);
        }
        else
        {
          v40 = BSUIStoreServicesLog();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v92 = 138412290;
            v93 = v33;
            _os_log_error_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "BSUIStoreServices failed to find purchase history id for audiobook %@", v92, 0xCu);
          }

        }
      }
      v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    }
    while (v29);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v62, "allValues"));
  v43 = objc_msgSend(v42, "count") == 0;

  if (!v43)
  {
    v44 = BSUIStoreServicesLog();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v62, "allKeys"));
      *(_DWORD *)v92 = 138412290;
      v93 = v46;
      _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices hiding audiobooks with identifiers %@", v92, 0xCu);

    }
    dispatch_group_enter(group);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v62, "allValues"));
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_39BEC;
    v73[3] = &unk_2E56D0;
    p_buf = &buf;
    v74 = v62;
    v75 = group;
    objc_msgSend(v47, "hideItemsWithPurchaseHistoryIDs:completionHandler:", v48, v73);

  }
  global_queue = dispatch_get_global_queue(2, 0);
  v50 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_39D80;
  block[3] = &unk_2E5720;
  v71 = &buf;
  v72 = v89;
  block[4] = self;
  v67 = v64;
  v68 = v57;
  v69 = v56;
  v70 = v55;
  v51 = v55;
  v52 = v56;
  v53 = v57;
  v54 = v64;
  dispatch_group_notify(group, v50, block);

  _Block_object_dispose(v89, 8);
  _Block_object_dispose(&buf, 8);

}

- (void)showPurchasedForStoreID:(id)a3
{
  -[BSUIStoreServices _setPurchaseHidden:forStoreID:withCompletion:](self, "_setPurchaseHidden:forStoreID:withCompletion:", 0, a3, 0);
}

- (void)purchasedHiddenDidChange:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[4];
  id v12;
  BSUIStoreServices *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_0, "Books/BSUIPurchaseHiddenChange", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3A1B8;
  block[3] = &unk_2E4230;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

- (void)purchasedDidHide:(BOOL)a3 withStoreID:(id)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = BSUIStoreServicesLog(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices Attempting to update jalisco after hide:%d storeid:%@.", buf, 0x12u);
  }

  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController sharedCloudController](MPCloudController, "sharedCloudController"));
    objc_msgSend(v11, "updateJaliscoMediaLibraryWithReason:completionHandler:", 1, &stru_2E5740);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
  objc_msgSend(v12, "setItemHidden:forStoreID:completion:", v6, v7, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BDSJaliscoDAAPClient sharedClient](BDSJaliscoDAAPClient, "sharedClient"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3A65C;
  v16[3] = &unk_2E5768;
  v19 = v6;
  v17 = v7;
  v18 = v8;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v13, "updatePolitely:reason:completion:", 0, 8, v16);

}

- (void)showWriteAReviewForStoreId:(id)a3 transaction:(id)a4
{
  -[BSUIStoreServices showWriteAReviewForStoreId:transaction:completion:](self, "showWriteAReviewForStoreId:transaction:completion:", a3, a4, 0);
}

- (void)showWriteAReviewForStoreId:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  void (**v18)(id, uint64_t);
  void (**v19)(id, uint64_t);
  void (**v20)(id, uint64_t);
  _QWORD v21[4];
  id v22;
  __int128 *p_buf;
  _QWORD v24[5];
  id v25;
  id v26;
  __int128 buf;
  uint64_t v28;
  id (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  void (**v31)(id, uint64_t);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = BSUIStoreServicesLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "BSUIStoreServices showWriteAReviewForStoreId adamID=%@.", (uint8_t *)&buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIStoreServices customerReviewURLForAssetID:](self, "customerReviewURLForAssetID:", v8));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_3AA18;
  v24[3] = &unk_2E4230;
  v24[4] = self;
  v14 = v9;
  v25 = v14;
  v15 = v13;
  v26 = v15;
  v16 = objc_retainBlock(v24);
  v17 = v16;
  if (!v15)
  {
    v18 = objc_retainBlock(v10);
    v19 = v18;
    if (v18)
      v18[2](v18, 0);
    goto LABEL_11;
  }
  if (!v14)
  {
    ((void (*)(_QWORD *))v16[2])(v16);
    v20 = objc_retainBlock(v10);
    v19 = v20;
    if (v20)
      v20[2](v20, 1);
LABEL_11:

    v10 = v19;
    goto LABEL_12;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x3032000000;
  v29 = sub_3AA68;
  v30 = sub_3AA90;
  v31 = objc_retainBlock(v10);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_3AA98;
  v21[3] = &unk_2E5790;
  v22 = v17;
  p_buf = &buf;
  objc_msgSend(v14, "commit:", v21);

  _Block_object_dispose(&buf, 8);
LABEL_12:

}

- (id)customerReviewURLForAssetID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)JSARatingsWriteReviewUrlString;
  v4 = a3;
  v5 = objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%7Bid%7D"), v4, 2, 0, objc_msgSend(v5, "length"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  return v6;
}

- (void)canHandleURLAsProductPage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  NSObject *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[4];
  _QWORD block[4];
  NSObject *v27;
  _QWORD v28[4];
  id v29;

  v5 = a3;
  v6 = a4;
  global_queue = dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v10 = objc_msgSend(v9, "isOnDeviceAppInstallationAllowed");

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "underlyingURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));

      if (objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("http"))
        && objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("https")))
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_3AE60;
        block[3] = &unk_2E3F88;
        v27 = v6;
        dispatch_async(v8, block);
        v13 = v27;
      }
      else
      {
        v13 = dispatch_group_create();
        v25[0] = 0;
        v25[1] = v25;
        v25[2] = 0x2020000000;
        v25[3] = 0;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "underlyingURL"));
        if (v14)
        {
          dispatch_group_enter(v13);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_3AE70;
          v22[3] = &unk_2E57B8;
          v24 = v25;
          v15 = v13;
          v23 = v15;
          objc_msgSend(v14, "bc_isStoreProductURLWithCompletion:", v22);
          dispatch_group_enter(v15);
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_3AE90;
          v19[3] = &unk_2E57B8;
          v21 = v25;
          v20 = v15;
          objc_msgSend(v14, "bc_isBookStoreProductURLWithCompletion:", v19);

        }
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_3AEB0;
        v16[3] = &unk_2E5790;
        v17 = v6;
        v18 = v25;
        dispatch_group_notify(v13, v8, v16);

        _Block_object_dispose(v25, 8);
      }

    }
    else
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_3AE50;
      v28[3] = &unk_2E3F88;
      v29 = v6;
      dispatch_async(v8, v28);
      v12 = v29;
    }

  }
}

- (void)productPageURLForStoreID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = sub_39A84;
      v19 = sub_39A94;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIItemDescriptionCache sharedInstance](BSUIItemDescriptionCache, "sharedInstance"));
      v21 = v5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemDescriptionsFromIdentifiers:", v9));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v5));

      v11 = (void *)v16[5];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_3B078;
      v12[3] = &unk_2E53F0;
      v13 = v7;
      v14 = &v15;
      objc_msgSend(v11, "get:", v12);

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

- (void)pauseRemovingFromMySamples
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v3 = BSUIStoreServicesLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446210;
    v6 = "-[BSUIStoreServices pauseRemovingFromMySamples]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  -[BSUIDownloadPurchaseMonitor pauseRemovingFromMySamples](self->_downloadPurchaseMonitor, "pauseRemovingFromMySamples");
}

- (void)resumeRemovingFromMySamplesWithTracker:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = BSUIStoreServicesLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446210;
    v8 = "-[BSUIStoreServices resumeRemovingFromMySamplesWithTracker:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  -[BSUIDownloadPurchaseMonitor resumeRemovingFromMySamplesWithTracker:](self->_downloadPurchaseMonitor, "resumeRemovingFromMySamplesWithTracker:", v4);
}

- (void)_analyticsSubmitHideBookEventWithStoreIDs:(id)a3 contentTypeDictionary:(id)a4 supplementalContentCountDictionary:(id)a5 hasRACSupportDictionary:(id)a6 tracker:(id)a7
{
  id v11;
  id v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id obj;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  obj = a3;
  v34 = a4;
  v33 = a5;
  v11 = a6;
  v12 = a7;
  if (v12)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v35)
    {
      v30 = *(_QWORD *)v37;
      v31 = v12;
      v32 = v11;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentPrivateIDForContentID:", v14));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentUserIDForContentID:", v14));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKey:", v14));
          v18 = v17;
          if (v17)
            v19 = objc_msgSend(v17, "integerValue");
          else
            v19 = 0;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
          v21 = objc_msgSend(v20, "seriesTypeForContentID:", v14);

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v14));
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v14));
            if (objc_msgSend(v23, "BOOLValue"))
              v24 = 1;
            else
              v24 = 2;

          }
          else
          {
            v24 = 0;
          }
          v25 = objc_alloc((Class)BAContentData);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", v14));
          v27 = objc_msgSend(v25, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v14, v19, v15, v16, 1, 0, 0, v26, v21, v24, 0, 0);

          v28 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
          v12 = v31;
          objc_msgSend(v28, "emitHideBookEventWithTracker:contentData:", v31, v27);

          v11 = v32;
        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v35);
    }
  }

}

- (BSUIStoreServicesDelegate)delegate
{
  return (BSUIStoreServicesDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BSUIDownloadPurchaseMonitor)downloadPurchaseMonitor
{
  return self->_downloadPurchaseMonitor;
}

- (void)setDownloadPurchaseMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPurchaseMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadPurchaseMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
