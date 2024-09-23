@implementation BSUIPurchaseManager

+ (void)purchaseBook:(id)a3 :(id)a4 :(BOOL)a5 :(id)a6 :(id)a7 :(BOOL)a8 :(id)a9 :(id)a10
{
  _BOOL8 v10;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  BSUIPurchaseParameters *v25;
  id v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;

  v10 = a8;
  v13 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a9;
  v19 = a10;
  v20 = a7;
  v21 = JSALog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v32 = "+[BSUIPurchaseManager purchaseBook::::::::]";
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v16;
    v37 = 1024;
    v38 = v13;
    v39 = 1024;
    v40 = v10;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}s adamID=%@, buyParams=%@, isAudiobook=%{BOOL}d, hasRacSupport=%{BOOL}d", buf, 0x2Cu);
  }

  if (objc_msgSend(v18, "isBoolean"))
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "toNumber"));
  else
    v23 = 0;
  if (objc_msgSend(v19, "isString", a1))
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "toString"));
  else
    v24 = 0;
  v25 = -[BSUIPurchaseParameters initWithBuyParams:isAudiobook:hasRacSupport:supportsUnifiedProductPage:editionKind:tracker:]([BSUIPurchaseParameters alloc], "initWithBuyParams:isAudiobook:hasRacSupport:supportsUnifiedProductPage:editionKind:tracker:", v16, v13, v10, v23, v24, v20);

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1015C;
  v29[3] = &unk_2E4538;
  v30 = v17;
  v26 = v17;
  objc_msgSend(v28, "purchaseAsset:parameters:completion:", v15, v25, v29);

}

+ (void)purchaseAsset:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  int v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  const __CFString *v48;
  NSMutableDictionary *v49;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buyParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pageContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[JSAApplication purchaseEventFieldsWithPageId:pageType:pageContext:topic:](JSAApplication, "purchaseEventFieldsWithPageId:pageType:pageContext:topic:", v12, v13, v14, 0));

  if (objc_msgSend(v11, "length") && objc_msgSend(v15, "length"))
  {
    if ((objc_msgSend(v11, "hasSuffix:", CFSTR("&")) & 1) == 0)
      objc_msgSend(v11, "appendString:", CFSTR("&"));
    objc_msgSend(v11, "appendString:", v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "longLongValue")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v11, v16));

  objc_msgSend(v17, "setAudiobook:", objc_msgSend(v8, "isAudiobook"));
  objc_msgSend(v17, "setSuppressNetworkEvaluatorDialogs:", objc_msgSend(v8, "isAudiobook"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tracker"));

  if (v18)
  {
    v19 = objc_opt_new(NSMutableDictionary);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tracker"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v20, CFSTR("BATracker"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "hasRacSupport")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v21, CFSTR("hasRacSupport"));

    if (_os_feature_enabled_impl("Books", "unifiedProductPage"))
    {
      v22 = objc_opt_new(NSMutableDictionary);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportsUnifiedProductPage"));

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportsUnifiedProductPage"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppAnalyticsAdditionalData supportsUnifiedProductPageKey](BAAppAnalyticsAdditionalData, "supportsUnifiedProductPageKey"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v24, v25);

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editionKind"));

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editionKind"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[BAAppAnalyticsAdditionalData editionKindKey](BAAppAnalyticsAdditionalData, "editionKindKey"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v27, v28);

      }
      if (-[NSMutableDictionary count](v22, "count"))
      {
        v29 = -[NSMutableDictionary copy](v22, "copy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v29, BAAppAnalyticsAdditionalDataKey);

      }
    }
    objc_msgSend(v17, "setAnalyticsInfo:", v19);
  }
  else
  {
    v30 = JSALog();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_2385E0(v31);

    v48 = CFSTR("hasRacSupport");
    v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "hasRacSupport")));
    v49 = v19;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
    objc_msgSend(v17, "setAnalyticsInfo:", v32);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "windowManager"));

  v35 = JSALog();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 136447234;
    v39 = "+[BSUIPurchaseManager purchaseAsset:parameters:completion:]";
    v40 = 2112;
    v41 = v17;
    v42 = 2160;
    v43 = 1752392040;
    v44 = 2112;
    v45 = v7;
    v46 = 2112;
    v47 = v11;
    _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%{public}s Purchasing: request=%@, assetID=%{mask.hash}@, buyParams=%@", (uint8_t *)&v38, 0x34u);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  objc_msgSend(v37, "purchaseWithRequest:uiManager:completion:", v17, v34, v9);

}

@end
