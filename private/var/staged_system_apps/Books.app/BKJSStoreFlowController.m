@implementation BKJSStoreFlowController

- (id)_sceneControllerForTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _sceneManager](self, "_sceneManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSceneControllerForTransaction:", v4));

  return v6;
}

- (id)_presentingDelegateForAlertAction:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _sceneControllerForTransaction:](self, "_sceneControllerForTransaction:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genericPresenting"));

  return v4;
}

- (id)_presentingDelegateForStoreURLAction:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _sceneControllerForTransaction:](self, "_sceneControllerForTransaction:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genericPresenting"));

  return v4;
}

- (id)_presentingDelegateForShowProductCardAction:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _sceneControllerForTransaction:](self, "_sceneControllerForTransaction:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeFlowProductPagePresenting"));

  return v4;
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

- (void)showStore:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 transaction:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[BSUIURL URLWithURL:sourceApplication:annotation:](BSUIURL, "URLWithURL:sourceApplication:annotation:", a3, a4, a5));
  -[BKJSStoreFlowController showStoreWithURL:transaction:](self, "showStoreWithURL:transaction:", v11, v10);

}

- (void)showStoreWithURL:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10018D9D8;
  v12[3] = &unk_1008E7928;
  v12[4] = self;
  v7 = a4;
  v13 = v7;
  v8 = v6;
  v14 = v8;
  v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v9[2])(v9);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10018DAEC;
      v10[3] = &unk_1008E7818;
      v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

    }
  }

}

- (void)_showStoreWithURL:(id)a3 tabBarIdentifier:(id)a4 transaction:(id)a5 presentingDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BKJSStoreFlowController *v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10018DBEC;
  v17[3] = &unk_1008E78B8;
  v18 = a6;
  v19 = v12;
  v20 = v10;
  v21 = self;
  v22 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  v16 = v18;
  objc_msgSend(v15, "commit:", v17);

}

- (id)_sceneManager
{
  return +[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager");
}

- (void)showStoreWithTransaction:(id)a3
{
  -[BKJSStoreFlowController showStoreWithURL:transaction:](self, "showStoreWithURL:transaction:", 0, a3);
}

- (void)showStoreSearchWithTransaction:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _sceneManager](self, "_sceneManager", a3));
  objc_msgSend(v3, "requestPrimaryScene:", &stru_1008ED728);

}

- (void)showReadingNowWithTransaction:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v5 = objc_msgSend(v4, "isBookStoreAllowed");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider HomeIdentifier](BKRootBarItemsProvider, "HomeIdentifier"));
    -[BKJSStoreFlowController showTabWithIdentifier:transaction:](self, "showTabWithIdentifier:transaction:", v6, v7);

  }
}

- (void)showAudiobookStoreWithTransaction:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v5 = objc_msgSend(v4, "isBookStoreAllowed");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider AudiobooksIdentifier](BKRootBarItemsProvider, "AudiobooksIdentifier"));
    -[BKJSStoreFlowController showTabWithIdentifier:transaction:](self, "showTabWithIdentifier:transaction:", v6, v7);

  }
}

- (void)showMangaStoreWithTransaction:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v5 = objc_msgSend(v4, "isBookStoreAllowed");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider MangaIdentifier](BKRootBarItemsProvider, "MangaIdentifier"));
    -[BKJSStoreFlowController showTabWithIdentifier:transaction:](self, "showTabWithIdentifier:transaction:", v6, v7);

  }
}

- (void)showTabWithIdentifier:(id)a3 transaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BKJSStoreFlowController *v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10018E2B0;
    v9[3] = &unk_1008E7B70;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _sceneManager](self, "_sceneManager"));
    v11 = self;
    v12 = v6;
    v13 = v7;
    v8 = v10;
    objc_msgSend(v8, "forceTransaction:ontoPrimarySceneWithContinuation:", v13, v9);

  }
}

- (void)_storeCheckConnectionAndShowStoreURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 transaction:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  BKJSStoreFlowController *v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIURL URLWithURL:sourceApplication:annotation:](BSUIURL, "URLWithURL:sourceApplication:annotation:", v10, a4, a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appLaunchCoordinator"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10018E42C;
  v18[3] = &unk_1008E9070;
  v19 = v10;
  v20 = self;
  v21 = v12;
  v22 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  objc_msgSend(v14, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 32, CFSTR("showStoreURL"), v18);

}

- (BOOL)storeHandleURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5 isLaunch:(BOOL)a6 transaction:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  BKJSStoreFlowController *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BKJSStoreFlowController *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v11)
  {
    v27 = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _presentingDelegateForShowProductCardAction:](self, "_presentingDelegateForShowProductCardAction:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appLaunchCoordinator"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appLaunchCoordinatorHoldAtLaunchingAssertion"));
    v19 = v18;
    if (v18)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10018E9A8;
      v39[3] = &unk_1008E77C8;
      v20 = v18;
      v40 = v20;
      objc_msgSend(v17, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 1024, CFSTR("invalidate holdAtLaunchScreen"), v39);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10018E9B0;
      v37[3] = &unk_1008E72C0;
      v38 = v20;
      objc_msgSend(v14, "whenCancelled:", v37);

    }
    if (objc_msgSend(v15, "presenterCanShowStoreProductOnCurrentContent"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "httpURL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appLaunchCoordinatorHoldAtLaunchingAssertion"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIURL URLWithURL:](BSUIURL, "URLWithURL:", v26));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10018E9B8;
      v28[3] = &unk_1008ED7C8;
      v29 = v14;
      v30 = v17;
      v31 = v11;
      v32 = v12;
      v33 = v13;
      v34 = v27;
      v35 = v15;
      v36 = v21;
      v24 = v21;
      objc_msgSend(v22, "canHandleURLAsProductPage:completion:", v23, v28);

    }
    else
    {
      -[BKJSStoreFlowController _storeCheckConnectionAndShowStoreURL:sourceApplication:annotation:transaction:](v27, "_storeCheckConnectionAndShowStoreURL:sourceApplication:annotation:transaction:", v11, v12, v13, v14);
    }

  }
  return v11 != 0;
}

- (void)displayInternetReachabilityErrorAlert:(BOOL)a3 transaction:(id)a4
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018EEF8;
  v8[3] = &unk_1008E83C0;
  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _presentingDelegateForAlertAction:](self, "_presentingDelegateForAlertAction:", a4));
  v9 = v4;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10018F0A8;
      block[3] = &unk_1008E7818;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)displayOffineCannotDownloadErrorForContentType:(signed __int16)a3 transaction:(id)a4
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  signed __int16 v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018F1AC;
  v8[3] = &unk_1008E7F28;
  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _presentingDelegateForAlertAction:](self, "_presentingDelegateForAlertAction:", a4));
  v9 = v4;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10018F34C;
      block[3] = &unk_1008E7818;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)displayStoreConnectionErrorAlert:(BOOL)a3 transaction:(id)a4
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018F450;
  v8[3] = &unk_1008E83C0;
  v10 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _presentingDelegateForAlertAction:](self, "_presentingDelegateForAlertAction:", a4));
  v9 = v4;
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10018F5A8;
      block[3] = &unk_1008E7818;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)storeShowBookWithStoreID:(id)a3 resourceType:(int64_t)a4 transaction:(id)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  if (v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v10 = objc_msgSend(v9, "isConnectedToInternet");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
      objc_msgSend(v11, "showProductPageForStoreID:resourceType:transaction:needsAnalyticsLinkData:", v12, a4, v8, 0);

    }
    else
    {
      -[BKJSStoreFlowController displayInternetReachabilityErrorAlert:transaction:](self, "displayInternetReachabilityErrorAlert:transaction:", 1, v8);
    }
  }

}

- (void)storeShowBooksWithStoreIDs:(id)a3 resourceTypes:(id)a4 focusedIndex:(unint64_t)a5 transaction:(id)a6 needsAnalyticsLinkData:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;

  v7 = a7;
  v17 = a3;
  v12 = a4;
  v13 = a6;
  if (objc_msgSend(v17, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v15 = objc_msgSend(v14, "isConnectedToInternet");

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
      objc_msgSend(v16, "showProductPagesForStoreIDs:resourceTypes:focusedIndex:transaction:needsAnalyticsLinkData:", v17, v12, a5, v13, v7);

    }
    else
    {
      -[BKJSStoreFlowController displayInternetReachabilityErrorAlert:transaction:](self, "displayInternetReachabilityErrorAlert:transaction:", 1, v13);
    }
  }

}

- (void)displayBookUnavailableInStorefrontErrorWithTransaction:(id)a3
{
  id v3;
  _QWORD *v4;
  _QWORD v5[4];
  _QWORD *v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018F844;
  v7[3] = &unk_1008E72C0;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKJSStoreFlowController _presentingDelegateForAlertAction:](self, "_presentingDelegateForAlertAction:", a3));
  v8 = v3;
  v4 = objc_retainBlock(v7);
  if (v4)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v4[2])(v4);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10018F954;
      v5[3] = &unk_1008E7818;
      v6 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

    }
  }

}

- (void)productViewControllerDidFinish:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
