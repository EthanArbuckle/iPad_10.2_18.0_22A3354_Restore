@implementation BKJSAAppController

- (unint64_t)signpostBeginWithMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  const char *v13;
  int v15;
  id v16;

  v3 = a3;
  v4 = JSASignpostJS();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSAProcessEnvironment currentEnvironment](JSAProcessEnvironment, "currentEnvironment"));
  v8 = objc_msgSend(v7, "variant");

  v9 = JSASignpostJS();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  v12 = v6 - 1;
  if (v8 == (id)1)
  {
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v15 = 138543362;
      v16 = v3;
      v13 = "%{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v6, "JS", v13, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v15 = 138412290;
    v16 = v3;
    v13 = "%@";
    goto LABEL_8;
  }

  return v6;
}

- (void)signpostEndWithSignpostID:(unint64_t)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  const char *v12;
  int v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[JSAProcessEnvironment currentEnvironment](JSAProcessEnvironment, "currentEnvironment"));
  v7 = objc_msgSend(v6, "variant");

  v8 = JSASignpostJS();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  v11 = a3 - 1;
  if (v7 == (id)1)
  {
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      v13 = 138543362;
      v14 = v5;
      v12 = "%{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, a3, "JS", v12, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v13 = 138412290;
    v14 = v5;
    v12 = "%@";
    goto LABEL_8;
  }

}

- (void)setScriptDataSource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v6 = a4;
  v7 = a3;
  v8 = JSALog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[BKJSAAppController setScriptDataSource:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSAAppController sceneManager](self, "sceneManager"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011C64;
  v12[3] = &unk_1008E72C0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "setScriptDataSource:completion:", v7, v12);

}

- (BKAppSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)requestRootBarAnalyticsTrackerWithCompletionValue:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  void (**v9)(_QWORD);
  _QWORD block[4];
  void (**v11)(_QWORD);
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[BKJSAAppController requestRootBarAnalyticsTrackerWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000CF30;
  v12[3] = &unk_1008E7338;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  v8 = objc_retainBlock(v12);
  v9 = objc_retainBlock(v8);
  if (v9)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v9[2](v9);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001092FC;
      block[3] = &unk_1008E7818;
      v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)requestPrimaryAnalyticsControllerWithCompletionValue:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[4];
  _QWORD *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;

  v3 = a3;
  v4 = JSALog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[BKJSAAppController requestPrimaryAnalyticsControllerWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019088;
  v10[3] = &unk_1008E72C0;
  v6 = v3;
  v11 = v6;
  v7 = objc_retainBlock(v10);
  if (v7)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v7[2])(v7);
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100109308;
      v8[3] = &unk_1008E7818;
      v9 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

    }
  }

}

- (BKJSAAppController)initWithSceneManager:(id)a3 jetActionHandler:(id)a4
{
  id v7;
  id v8;
  BKJSAAppController *v9;
  BKJSAAppController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKJSAAppController;
  v9 = -[BKJSAAppController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneManager, a3);
    objc_storeStrong((id *)&v10->_jetActionHandler, a4);
  }

  return v10;
}

- (id)_sceneControllerForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSAAppController sceneManager](self, "sceneManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSceneControllerForTransaction:", v4));

  return v6;
}

- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 titleValue:(id)a5 animatedValue:(id)a6 optionsValue:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  const char *v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v17 = JSALog(v14, v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 136446210;
    v25 = "-[BKJSAAppController presentFeedsInCards:focusedIndexValue:titleValue:animatedValue:optionsValue:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v24, 0xCu);
  }

  if (objc_msgSend(v11, "isArray"))
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toArray"));
  else
    v19 = 0;
  if (objc_msgSend(v12, "isNumber"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "toNumber"));
    v21 = (unint64_t)objc_msgSend(v20, "unsignedIntegerValue");

  }
  else
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (objc_msgSend(v13, "isBoolean"))
    v22 = (uint64_t)objc_msgSend(v13, "toBool");
  else
    v22 = 1;
  if (objc_msgSend(v14, "isObject"))
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "toDictionary"));
  else
    v23 = 0;
  if ((unint64_t)objc_msgSend(v19, "count") > v21)
    -[BKJSAAppController presentFeedsInCards:focusedIndex:animated:options:](self, "presentFeedsInCards:focusedIndex:animated:options:", v19, v21, v22, v23);

}

- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 animatedValue:(id)a5 optionsValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16 = JSALog(v13, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136446210;
    v24 = "-[BKJSAAppController presentFeedsInCards:focusedIndexValue:animatedValue:optionsValue:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v23, 0xCu);
  }

  if (objc_msgSend(v10, "isArray"))
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "toArray"));
  else
    v18 = 0;
  if (objc_msgSend(v11, "isNumber"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toNumber"));
    v20 = (unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

  }
  else
  {
    v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (objc_msgSend(v12, "isBoolean"))
    v21 = (uint64_t)objc_msgSend(v12, "toBool");
  else
    v21 = 1;
  if (objc_msgSend(v13, "isObject"))
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toDictionary"));
  else
    v22 = 0;
  if ((unint64_t)objc_msgSend(v18, "count") > v20)
    -[BKJSAAppController presentFeedsInCards:focusedIndex:animated:options:](self, "presentFeedsInCards:focusedIndex:animated:options:", v18, v20, v21, v22);

}

- (void)presentFeedsInCards:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 options:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  v14 = JSALog(v11, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136446210;
    v20 = "-[BKJSAAppController presentFeedsInCards:focusedIndex:animated:options:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v19, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", BCTransactionOptionsTransactionKey));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSAAppController _sceneControllerForTransaction:](self, "_sceneControllerForTransaction:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "feedCardPresenting"));
  objc_msgSend(v18, "presentFeedsInCards:focusedIndex:animated:options:completion:", v11, a4, v6, v10, 0);

}

- (void)appendFeedsInCards:(id)a3 optionsValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;

  v6 = a3;
  v7 = a4;
  v10 = JSALog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446210;
    v15 = "-[BKJSAAppController appendFeedsInCards:optionsValue:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v14, 0xCu);
  }

  if (objc_msgSend(v6, "isArray"))
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toArray"));
  else
    v12 = 0;
  if (objc_msgSend(v7, "isObject"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toDictionary"));
  else
    v13 = 0;
  if (objc_msgSend(v12, "count"))
    -[BKJSAAppController appendFeedsInCards:options:](self, "appendFeedsInCards:options:", v12, v13);

}

- (void)appendFeedsInCards:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;

  v6 = a4;
  v7 = a3;
  v10 = JSALog(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446210;
    v16 = "-[BKJSAAppController appendFeedsInCards:options:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v15, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", BCTransactionOptionsTransactionKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSAAppController _sceneControllerForTransaction:](self, "_sceneControllerForTransaction:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "feedCardPresenting"));
  objc_msgSend(v14, "appendFeedsInCards:options:", v7, v6);

}

- (BKRootBarCoordinating)rootBarCoordinator
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSAAppController sceneManager](self, "sceneManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primarySceneController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootBarCoordinator"));

  return (BKRootBarCoordinating *)v4;
}

- (void)requestRootBarControllerWithCompletionValue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  void (**v11)(_QWORD);
  _QWORD block[4];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;

  v4 = a3;
  v7 = JSALog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v17 = "-[BKJSAAppController requestRootBarControllerWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100108D50;
  v14[3] = &unk_1008E7338;
  v14[4] = self;
  v9 = v4;
  v15 = v9;
  v10 = objc_retainBlock(v14);
  v11 = objc_retainBlock(v10);
  if (v11)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v11[2](v11);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100108F60;
      block[3] = &unk_1008E7818;
      v13 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)requestPrimarySceneWithCompletionValue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  void (**v11)(_QWORD);
  _QWORD block[4];
  void (**v13)(_QWORD);
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;

  v4 = a3;
  v7 = JSALog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v17 = "-[BKJSAAppController requestPrimarySceneWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001090F0;
  v14[3] = &unk_1008E7338;
  v14[4] = self;
  v9 = v4;
  v15 = v9;
  v10 = objc_retainBlock(v14);
  v11 = objc_retainBlock(v10);
  if (v11)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v11[2](v11);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001092F0;
      block[3] = &unk_1008E7818;
      v13 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)reloadStandardItemsWithAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v6 = a4;
  v9 = JSALog(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    *(_DWORD *)buf = 136446466;
    v20 = "-[BKJSAAppController reloadStandardItemsWithAnimated:completion:]";
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s animated=%@", buf, 0x16u);

  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001094C4;
  v16[3] = &unk_1008E7D78;
  v16[4] = self;
  v18 = v4;
  v12 = v6;
  v17 = v12;
  v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10010965C;
      v14[3] = &unk_1008E7818;
      v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

}

- (void)dismissCardsForSelectedTab:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v6 = a4;
  v9 = JSALog(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    *(_DWORD *)buf = 136446466;
    v21 = "-[BKJSAAppController dismissCardsForSelectedTab:completion:]";
    v22 = 2112;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s animated=%@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100109868;
  v16[3] = &unk_1008EAF38;
  objc_copyWeak(&v18, (id *)buf);
  v19 = v4;
  v12 = v6;
  v17 = v12;
  v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100109C2C;
      v14[3] = &unk_1008E7818;
      v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD block[4];
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100109D7C;
  v11[3] = &unk_1008EAF38;
  objc_copyWeak(&v13, &location);
  v14 = a3;
  v7 = v6;
  v12 = v7;
  v8 = objc_retainBlock(v11);
  if (v8)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v8[2])(v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010A238;
      block[3] = &unk_1008E7818;
      v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)pushViewControllerOnSelectedNavigationController:(id)a3 animated:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;

  v6 = a3;
  v9 = JSALog(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v20 = "-[BKJSAAppController pushViewControllerOnSelectedNavigationController:animated:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010A414;
  v15[3] = &unk_1008EAF60;
  v11 = v6;
  v16 = v11;
  objc_copyWeak(&v17, (id *)buf);
  v18 = a4;
  v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10010A49C;
      v13[3] = &unk_1008E7818;
      v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)selectTabWithIdentifier:(id)a3 isUserAction:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v9 = JSALog(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "-[BKJSAAppController selectTabWithIdentifier:isUserAction:]";
    v21 = 2114;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s identifier=%{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010A684;
  v15[3] = &unk_1008EAF38;
  objc_copyWeak(&v17, (id *)buf);
  v11 = v6;
  v16 = v11;
  v18 = a4;
  v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v12[2])(v12);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10010A6D4;
      v13[3] = &unk_1008E7818;
      v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)topViewControllerInSelectedTab:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD *v10;
  _QWORD block[4];
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;

  v4 = a3;
  v7 = JSALog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v17 = "-[BKJSAAppController topViewControllerInSelectedTab:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010A8A8;
  v13[3] = &unk_1008EAF88;
  objc_copyWeak(&v15, (id *)buf);
  v9 = v4;
  v14 = v9;
  v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v10[2])(v10);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10010AA14;
      block[3] = &unk_1008E7818;
      v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)signpostEventWithMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  const char *v13;
  int v14;
  id v15;

  v3 = a3;
  v4 = JSASignpostJS();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSAProcessEnvironment currentEnvironment](JSAProcessEnvironment, "currentEnvironment"));
  v8 = objc_msgSend(v7, "variant");

  v9 = JSASignpostJS();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  v12 = v6 - 1;
  if (v8 == (id)1)
  {
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      v14 = 138543362;
      v15 = v3;
      v13 = "%{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, v6, "JS", v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v14 = 138412290;
    v15 = v3;
    v13 = "%@";
    goto LABEL_8;
  }

}

- (void)performRawActionModelOnRootBarCurrentViewController:(id)a3 withParentTracker:(id)a4 shouldReportFigaro:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v25;

  v8 = a3;
  v9 = a4;
  v12 = JSALog(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v25 = "-[BKJSAAppController performRawActionModelOnRootBarCurrentViewController:withParentTracker:shouldReportFigaro:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10010AD68;
  v19[3] = &unk_1008EAFD0;
  objc_copyWeak(&v22, (id *)buf);
  v19[4] = self;
  v14 = v8;
  v20 = v14;
  v15 = v9;
  v21 = v15;
  v23 = a5;
  v16 = objc_retainBlock(v19);
  if (v16)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v16[2])(v16);
    }
    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10010AE34;
      v17[3] = &unk_1008E7818;
      v18 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);

    }
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

}

- (void)performRawFlowActionOnRootBarCurrentViewController:(id)a3 withParentTracker:(id)a4 shouldReportFigaro:(BOOL)a5
{
  -[BKJSAAppController performRawActionModelOnRootBarCurrentViewController:withParentTracker:shouldReportFigaro:](self, "performRawActionModelOnRootBarCurrentViewController:withParentTracker:shouldReportFigaro:", a3, a4, a5);
}

- (void)setSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManager, a3);
}

- (BSUIJetActionHandling)jetActionHandler
{
  return self->_jetActionHandler;
}

- (void)setJetActionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_jetActionHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jetActionHandler, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
}

@end
