@implementation BSUICloudAssetRatingsManager

+ (void)getRatingForItem:(id)a3 forceFetch:(BOOL)a4 shouldSuppressMetrics:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;

  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeStoreAccount"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetReviewManager"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ams_DSID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BCAssetReview assetReviewIDWithUserID:assetID:](BCAssetReview, "assetReviewIDWithUserID:assetID:", v16, v9));

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_28D9C;
    v22[3] = &unk_2E4EF0;
    v27 = a4;
    v26 = v10;
    v28 = a5;
    v23 = v9;
    v24 = v17;
    v25 = v14;
    v18 = v14;
    v19 = v17;
    objc_msgSend(v18, "assetReviewForAssetReviewID:completion:", v19, v22);

  }
  else
  {
    v20 = objc_retainBlock(v10);
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BSUICloudAssetRatingsManager"), 403, 0));
      (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD, _QWORD))v20 + 2))(v20, 0, v21, 0, 0, 0);

    }
  }

}

+ (void)getRatingForItem:(id)a3 :(id)a4 :(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isString") & 1) == 0)
  {
    v10 = BSUICloudAssetRatingsManagerLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_2389F0();

  }
  if ((objc_msgSend(v8, "isBoolean") & 1) == 0)
  {
    v12 = BSUICloudAssetRatingsManagerLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_2389C4();

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toString"));
  v15 = objc_msgSend(v8, "toBool");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_292C8;
  v17[3] = &unk_2E4F18;
  v18 = v9;
  v16 = v9;
  +[BSUICloudAssetRatingsManager getRatingForItem:forceFetch:shouldSuppressMetrics:completion:](BSUICloudAssetRatingsManager, "getRatingForItem:forceFetch:shouldSuppressMetrics:completion:", v14, v15, 0, v17);

}

+ (void)updateRatingValue:(double)a3 title:(id)a4 body:(id)a5 itemId:(id)a6 shouldSuppressMetrics:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = a7;
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  +[BSUICloudAssetRatingsManager updateRating:title:body:itemId:shouldSuppressMetrics:completion:](BSUICloudAssetRatingsManager, "updateRating:title:body:itemId:shouldSuppressMetrics:completion:", v17, v16, v15, v14, v8, v13);

}

+ (void)updateRating:(id)a3 title:(id)a4 body:(id)a5 itemId:(id)a6 shouldSuppressMetrics:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void (**v22)(id, _QWORD, void *);
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeStoreAccount"));

  if (v20)
  {
    v21 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("rating"));
    if (v15)
    {
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("title"));
      if (v16)
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, CFSTR("body"));
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_29730;
    v24[3] = &unk_2E4F68;
    v25 = v17;
    v26 = v14;
    v31 = a1;
    v27 = v20;
    v28 = v15;
    v29 = v16;
    v30 = v18;
    +[BSUICloudAssetRatingsManager _updateRatingsDataForItem:shouldSuppressMetrics:shouldSuppressResponseDialogs:updatingData:completionHandler:](BSUICloudAssetRatingsManager, "_updateRatingsDataForItem:shouldSuppressMetrics:shouldSuppressResponseDialogs:updatingData:completionHandler:", v25, v9, 0, v21, v24);

  }
  else
  {
    v22 = (void (**)(id, _QWORD, void *))objc_retainBlock(v18);
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BSUICloudAssetRatingsManager"), 403, 0));
      v22[2](v22, 0, v23);

    }
  }

}

+ (void)updateRating:(id)a3 :(id)a4 :(id)a5 :(id)a6 :(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if ((objc_msgSend(v11, "isNumber") & 1) == 0)
  {
    v16 = BSUICloudAssetRatingsManagerLog();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_238A74();

  }
  if ((objc_msgSend(v12, "isString") & 1) == 0)
  {
    v18 = BSUICloudAssetRatingsManagerLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_238A48();

  }
  if ((objc_msgSend(v13, "isString") & 1) == 0)
  {
    v20 = BSUICloudAssetRatingsManagerLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_238A1C();

  }
  if ((objc_msgSend(v14, "isString") & 1) == 0)
  {
    v22 = BSUICloudAssetRatingsManagerLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_2389F0();

  }
  v33 = v11;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toNumber"));
  v25 = objc_msgSend(v12, "isUndefined");
  if ((v25 & 1) != 0)
    v26 = 0;
  else
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toString"));
  v27 = objc_msgSend(v13, "isUndefined");
  v32 = v12;
  if ((v27 & 1) != 0)
    v28 = 0;
  else
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toString"));
  v29 = v14;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toString"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_29EAC;
  v34[3] = &unk_2E4F90;
  v35 = v15;
  v31 = v15;
  +[BSUICloudAssetRatingsManager updateRating:title:body:itemId:shouldSuppressMetrics:completion:](BSUICloudAssetRatingsManager, "updateRating:title:body:itemId:shouldSuppressMetrics:completion:", v24, v26, v28, v30, 0, v34);

  if ((v27 & 1) == 0)
  if ((v25 & 1) == 0)

}

+ (void)deleteRatingForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeStoreAccount"));

  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2A120;
    v14[3] = &unk_2E4FE0;
    v15 = v8;
    v18 = a1;
    v16 = v11;
    v17 = v9;
    +[BSUICloudAssetRatingsManager _deleteRatingsDataForItem:shouldSuppressMetrics:shouldSuppressResponseDialogs:completionHandler:](BSUICloudAssetRatingsManager, "_deleteRatingsDataForItem:shouldSuppressMetrics:shouldSuppressResponseDialogs:completionHandler:", v15, v6, 0, v14);

  }
  else
  {
    v12 = (void (**)(id, _QWORD, void *))objc_retainBlock(v9);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BSUICloudAssetRatingsManager"), 403, 0));
      v12[2](v12, 0, v13);

    }
  }

}

+ (void)deleteRatingForItem:(id)a3 :(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isString") & 1) == 0)
  {
    v7 = BSUICloudAssetRatingsManagerLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_2389F0();

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "toString"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2A480;
  v11[3] = &unk_2E4F90;
  v12 = v6;
  v10 = v6;
  +[BSUICloudAssetRatingsManager deleteRatingForItem:shouldSuppressMetrics:completion:](BSUICloudAssetRatingsManager, "deleteRatingForItem:shouldSuppressMetrics:completion:", v9, 0, v11);

}

+ (void)_fetchRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v6 = a5;
  v7 = a4;
  v15[0] = a3;
  v14[0] = CFSTR("itemId");
  v14[1] = CFSTR("shouldSuppressMetrics");
  v9 = a6;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v15[1] = v11;
  v14[2] = CFSTR("shouldSuppressResponseDialogs");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v15[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  +[BSUICloudAssetRatingsManager _callOnJSBridge:options:completionHandler:](BSUICloudAssetRatingsManager, "_callOnJSBridge:options:completionHandler:", CFSTR("getRatingFromServer"), v13, v9);
}

+ (void)_updateRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 updatingData:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v8 = a5;
  v9 = a4;
  v18[0] = a3;
  v17[0] = CFSTR("itemId");
  v17[1] = CFSTR("shouldSuppressMetrics");
  v11 = a7;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
  v18[1] = v14;
  v17[2] = CFSTR("shouldSuppressResponseDialogs");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  v17[3] = CFSTR("updatingData");
  v18[2] = v15;
  v18[3] = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));

  +[BSUICloudAssetRatingsManager _callOnJSBridge:options:completionHandler:](BSUICloudAssetRatingsManager, "_callOnJSBridge:options:completionHandler:", CFSTR("updateRatingOnServer"), v16, v11);
}

+ (void)_deleteRatingsDataForItem:(id)a3 shouldSuppressMetrics:(BOOL)a4 shouldSuppressResponseDialogs:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];

  v6 = a5;
  v7 = a4;
  v15[0] = a3;
  v14[0] = CFSTR("itemId");
  v14[1] = CFSTR("shouldSuppressMetrics");
  v9 = a6;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7));
  v15[1] = v11;
  v14[2] = CFSTR("shouldSuppressResponseDialogs");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v15[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));

  +[BSUICloudAssetRatingsManager _callOnJSBridge:options:completionHandler:](BSUICloudAssetRatingsManager, "_callOnJSBridge:options:completionHandler:", CFSTR("deleteRatingFromServer"), v13, v9);
}

+ (void)_callOnJSBridge:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_2AA0C;
  v14[3] = &unk_2E5008;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v10, "enqueueBlock:file:line:", v14, CFSTR("BSUICloudAssetRatingsManager.m"), 375);

}

@end
