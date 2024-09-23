@implementation BCAnalyticsVisibilityPresentationNotifier

- (BCAnalyticsVisibilityPresentationNotifier)init
{
  BCAnalyticsVisibilityPresentationNotifier *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCAnalyticsVisibilityPresentationNotifier;
  v2 = -[BCAnalyticsVisibilityPresentationNotifier init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_presentationTransitionDidEnd:", UIPresentationControllerPresentationTransitionDidEndNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_dismissalTransitionDidEnd:", UIPresentationControllerDismissalTransitionDidEndNotification, 0);

  }
  return v2;
}

+ (BCAnalyticsVisibilityPresentationNotifier)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_64E4;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_30D4A8 != -1)
    dispatch_once(&qword_30D4A8, block);
  return (BCAnalyticsVisibilityPresentationNotifier *)(id)qword_30D4A0;
}

- (void)_presentationTransitionDidEnd:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v6 = objc_opt_class(UIViewController, v5);
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnalyticsVisibilityPresentationNotifier _viewControllerClassesToIgnore](self, "_viewControllerClassesToIgnore"));
  LOBYTE(v7) = objc_msgSend(v10, "containsObject:", objc_opt_class(v9, v11));

  if ((v7 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", UIPresentationControllerPresentationTransitionDidEndCompletedKey));
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      if (objc_msgSend(v9, "bc_analyticsVisibilityIsObscuredWhenSubtreePresented"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
        objc_msgSend(v15, "bc_analyticsVisibilitySubtreeWillDisappear");
        objc_msgSend(v15, "bc_analyticsVisibilitySubtreeDidDisappear");

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitionCoordinator"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_667C;
      v17[3] = &unk_28B8F0;
      v18 = v9;
      objc_msgSend(v16, "animateAlongsideTransition:completion:", 0, v17);

    }
  }

}

- (void)_dismissalTransitionDidEnd:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  v6 = objc_opt_class(UIViewController, v5);
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnalyticsVisibilityPresentationNotifier _viewControllerClassesToIgnore](self, "_viewControllerClassesToIgnore"));
  LOBYTE(v7) = objc_msgSend(v10, "containsObject:", objc_opt_class(v9, v11));

  if ((v7 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", UIPresentationControllerDismissalTransitionDidEndCompletedKey));
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      objc_msgSend(v9, "bc_analyticsVisibilitySubtreeWillDisappear");
      objc_msgSend(v9, "bc_analyticsVisibilitySubtreeDidDisappear");
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transitionCoordinator"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_67F0;
      v17[3] = &unk_28B8F0;
      v18 = v12;
      objc_msgSend(v16, "animateAlongsideTransition:completion:", 0, v17);

    }
  }

}

- (id)_viewControllerClassesToIgnore
{
  if (qword_30D4B8 != -1)
    dispatch_once(&qword_30D4B8, &stru_28B910);
  return (id)qword_30D4B0;
}

@end
