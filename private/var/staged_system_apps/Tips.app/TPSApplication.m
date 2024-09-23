@implementation TPSApplication

- (id)_extendLaunchTest
{
  return CFSTR("Extend-Launch-Test");
}

- (id)appDelegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return v3;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_time_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  unsigned int v38;
  unsigned int v39;
  unsigned __int8 v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
  objc_msgSend(v8, "resetCacheDefaults");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iterations")));
  v10 = objc_msgSend(v9, "intValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("delta")));
  v12 = objc_msgSend(v11, "intValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recapBased")));
  v14 = objc_msgSend(v13, "BOOLValue");

  if (objc_msgSend(v6, "hasPrefix:", CFSTR("ScrollCollectionsView")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    objc_msgSend(v15, "showCollectionsView");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collectionListViewController"));
LABEL_5:
    v21 = v17;
    objc_msgSend(v17, "runTest:options:", v6, v7);

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("ScrollTipListView")))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines softwareWelcomeCollectionIdentifier](TPSCommonDefines, "softwareWelcomeCollectionIdentifier"));
    objc_msgSend(v18, "displayCollectionID:tipID:", v19, 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    objc_msgSend(v20, "showTOCView");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tipListViewController"));
    goto LABEL_5;
  }
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("ScrollTipsForCollection")))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "appController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collections"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tipsByCollectionViewController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
    objc_msgSend(v28, "updateWithCollectionID:tipID:", v29, 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    objc_msgSend(v30, "showTipsView");

    v31 = dispatch_time(0, 1000000000);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001F9D0;
    v36[3] = &unk_1000A29B0;
    v36[4] = self;
    v40 = v14;
    v37 = v6;
    v38 = v10;
    v39 = v12;
    dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, v36);

  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("ResizeCollectionsView")))
  {
    v32 = objc_alloc((Class)RPTResizeTestParameters);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSApplication appDelegate](self, "appDelegate"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "window"));
    v35 = objc_msgSend(v32, "initWithTestName:window:completionHandler:", v6, v34, 0);

    objc_msgSend(v35, "setMinimumWindowSize:", 300.0, 300.0);
    objc_msgSend(v35, "setMaximumWindowSize:", 600.0, 600.0);
    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v35);

  }
LABEL_6:

  return 1;
}

@end
