@implementation BKToastPresenter

- (BKToastPresenter)init
{
  BKToastPresenter *v2;
  uint64_t v3;
  NSMutableArray *pendingActions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKToastPresenter;
  v2 = -[BKToastPresenter init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingActions = v2->_pendingActions;
    v2->_pendingActions = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)setToastViewController:(id)a3
{
  BKEndOfBookCompactViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BKEndOfBookCompactViewController *toastViewController;

  v4 = (BKEndOfBookCompactViewController *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentViewController"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v7, "willMoveToParentViewController:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v8, "removeFromParentViewController");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v10, "removeFromSuperview");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v11, "didMoveToParentViewController:", 0);

  }
  toastViewController = self->_toastViewController;
  self->_toastViewController = v4;

}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  if (self->_suppressingNotifications)
  {
    v3 = BCAugmentedExperienceLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BKToastPresenter dealloc, cancelling push suppression.", buf, 2u);
    }

  }
  -[BKToastPresenter setToastViewController:](self, "setToastViewController:", 0);
  v5.receiver = self;
  v5.super_class = (Class)BKToastPresenter;
  -[BKToastPresenter dealloc](&v5, "dealloc");
}

- (void)setSuppressingNotifications:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (self->_suppressingNotifications != a3)
  {
    v3 = a3;
    self->_suppressingNotifications = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "readingActivityService"));

    v7 = BCAugmentedExperienceLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BKToastPresenter start suppressing notifications", buf, 2u);
      }

      objc_msgSend(v6, "suppressNotifications");
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BKToastPresenter end suppressing notifications", v10, 2u);
      }

      objc_msgSend(v6, "resumeNotifications");
    }

  }
}

- (void)presentInVC:(id)a3 autoExpanded:(BOOL)a4 details:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[8];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = BCAugmentedExperienceLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "BKToastPresenter presentInVC", v14, 2u);
  }

  v17[0] = CFSTR("action");
  v17[1] = CFSTR("viewController");
  v18[0] = &off_10092EE08;
  v18[1] = v8;
  v17[2] = CFSTR("details");
  v18[2] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
  -[BKToastPresenter _scheduleAction:](self, "_scheduleAction:", v12);

  if (v6)
  {
    v15[0] = CFSTR("action");
    v15[1] = CFSTR("viewController");
    v16[0] = &off_10092EE20;
    v16[1] = v8;
    v15[2] = CFSTR("details");
    v16[2] = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
    -[BKToastPresenter _scheduleAction:](self, "_scheduleAction:", v13);

  }
}

- (void)bringExperienceViewToFront:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewIfLoaded"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));

  if (v6 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    objc_msgSend(v8, "bringSubviewToFront:", v5);

  }
}

- (void)expandInVC:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = CFSTR("action");
  v6[1] = CFSTR("viewController");
  v7[0] = &off_10092EE20;
  v7[1] = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  -[BKToastPresenter _scheduleAction:](self, "_scheduleAction:", v5);
}

- (void)_expandCompactVCAction:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController", a3));
  v5 = objc_msgSend(v4, "isPresentingCard");

  if (v5)
  {
    -[BKToastPresenter _currentActionComplete](self, "_currentActionComplete");
  }
  else
  {
    v6 = BCAugmentedExperienceLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BKToastPresenter _expandCompactVCAction", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001351FC;
    v9[3] = &unk_1008E72C0;
    v9[4] = self;
    objc_msgSend(v8, "presentCardWithCompletion:", v9);

  }
}

- (id)_presentationAnimator
{
  id v2;
  id v3;
  id v4;

  v2 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 120.0, 15.0, 0.0, 0.0);
  v3 = objc_alloc((Class)UIViewPropertyAnimator);
  objc_msgSend(v2, "settlingDuration");
  v4 = objc_msgSend(v3, "initWithDuration:timingParameters:", v2);

  return v4;
}

- (void)_presentInVCAction:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[9];
  uint8_t buf[16];

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BKToastPresenter _presentInVCAction", buf, 2u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentViewController")),
        v10,
        v9,
        v8,
        !v10))
  {
    -[BKToastPresenter setSuppressingNotifications:](self, "setSuppressingNotifications:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("viewController")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v12, "toastPresenter:willPresentToastInViewController:", self, v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v13, "preferredFrameInViewController:isPresented:", v11, 0);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v22, "preferredFrameInViewController:isPresented:", v11, 1);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v11, "addChildViewController:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "view"));
    objc_msgSend(v33, "setFrame:", v15, v17, v19, v21);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
    objc_msgSend(v34, "addSubview:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v37, "didMoveToParentViewController:", v11);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
    objc_msgSend(v39, "layoutIfNeeded");

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter _presentationAnimator](self, "_presentationAnimator"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100135598;
    v44[3] = &unk_1008E82B8;
    v44[4] = self;
    v44[5] = v24;
    v44[6] = v26;
    v44[7] = v28;
    v44[8] = v30;
    objc_msgSend(v40, "addAnimations:", v44);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100135608;
    v42[3] = &unk_1008EBE28;
    v42[4] = self;
    v43 = v11;
    v41 = v11;
    objc_msgSend(v40, "addCompletion:", v42);
    objc_msgSend(v40, "startAnimation");
    -[BKToastPresenter _setUpSellDataForCurrentAction](self, "_setUpSellDataForCurrentAction");

  }
  else
  {
    -[BKToastPresenter _currentActionComplete](self, "_currentActionComplete");
  }

}

- (BOOL)endPresentation:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint8_t v14[8];
  const __CFString *v15;
  _UNKNOWN **v16;

  v4 = a3;
  v5 = BCAugmentedExperienceLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BKToastPresenter endPresentation", v14, 2u);
  }

  -[BKToastPresenter setSuppressingNotifications:](self, "setSuppressingNotifications:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewIfLoaded"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superview"));
  if (v9)
  {
    v15 = CFSTR("action");
    v16 = &off_10092EE38;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    -[BKToastPresenter _scheduleAction:](self, "_scheduleAction:", v10);

    v11 = objc_retainBlock(v4);
    v12 = v11;
    if (v11)
      (*((void (**)(id))v11 + 2))(v11);

  }
  return 1;
}

- (void)preloadPresentationInVC:(id)a3 pageProgressionIsRTL:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  id v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  NSObject *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  _QWORD v39[5];
  _QWORD *v40;
  _QWORD v41[4];
  __CFString *v42;
  BKToastPresenter *v43;
  id v44;
  id v45;
  BOOL v46;
  uint8_t buf[4];
  BKToastPresenter *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter presentingDelegate](self, "presentingDelegate"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "storeIDForPresenter:", self));

  v13 = BCAugmentedExperienceLog(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    v49 = 2112;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: preloadPresentation (storeID: %@)", buf, 0x16u);
  }

  if (-[__CFString length](v11, "length"))
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100135C14;
    v41[3] = &unk_1008EBEA0;
    v46 = a4;
    v42 = v11;
    v43 = self;
    v44 = v8;
    v45 = v9;
    v15 = objc_retainBlock(v41);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v17 = objc_msgSend(v16, "isUserSignedInToiTunes");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v19 = objc_msgSend(v18, "isUserSignedInToiCloud");

    v20 = +[BCSyncUserDefaults isCloudKitSyncOptedIn](BCSyncUserDefaults, "isCloudKitSyncOptedIn");
    v21 = (int)v20;
    if (v17 && v19 && (_DWORD)v20)
    {
      v22 = objc_opt_class(NSNumber);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "configs"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKeyPath:", BRCBooksDefaultsKeyEndOfBookExperienceSendAdditionalSeedLimit));
      v26 = BUDynamicCast(v22, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      if (v27)
        v29 = (int)objc_msgSend(v27, "intValue");
      else
        v29 = 100;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1001364AC;
      v39[3] = &unk_1008E9D38;
      v39[4] = self;
      v40 = v15;
      objc_msgSend(v28, "storeAssetIDsOfWantToReadWithLimit:completion:", v29, v39);

    }
    else
    {
      v34 = BCAugmentedExperienceLog(v20);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = CFSTR("NO");
        if (v17)
          v37 = CFSTR("YES");
        else
          v37 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        v48 = self;
        if (v19)
          v38 = CFSTR("YES");
        else
          v38 = CFSTR("NO");
        v49 = 2112;
        v50 = v37;
        v51 = 2112;
        if (v21)
          v36 = CFSTR("YES");
        v52 = v38;
        v53 = 2112;
        v54 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@: skipping additional seeds: store=%@ iCloud=%@ CloudKit=%@", buf, 0x2Au);
      }

      ((void (*)(_QWORD *, _QWORD))v15[2])(v15, 0);
    }

    v33 = v42;
  }
  else
  {
    v30 = BCAugmentedExperienceLog(0);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_1006A1F88((uint64_t)self, v31);

    v32 = (__CFString *)objc_retainBlock(v9);
    v33 = v32;
    if (v32)
      ((void (*)(__CFString *, uint64_t))v32->data)(v32, 1);
  }

}

- (void)cancelPreloadPresentation
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = BCAugmentedExperienceLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BKToastPresenter cancelPreloadPresentation", v5, 2u);
  }

  -[BKToastPresenter setCardViewController:](self, "setCardViewController:", 0);
  -[BKToastPresenter setToastViewController:](self, "setToastViewController:", 0);
}

- (void)_dismissToast
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[9];
  uint8_t buf[16];

  v3 = BCAugmentedExperienceLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BKToastPresenter _dismissToast", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewIfLoaded"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v8, "toastPresenterWillDismissToast:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentViewController"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
    objc_msgSend(v11, "preferredFrameInViewController:isPresented:", v10, 0);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter _presentationAnimator](self, "_presentationAnimator"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100136874;
    v22[3] = &unk_1008E82B8;
    v22[4] = self;
    v22[5] = v13;
    v22[6] = v15;
    v22[7] = v17;
    v22[8] = v19;
    objc_msgSend(v20, "addAnimations:", v22);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001368E4;
    v21[3] = &unk_1008E98D0;
    v21[4] = self;
    objc_msgSend(v20, "addCompletion:", v21);
    objc_msgSend(v20, "startAnimation");

  }
  else
  {
    -[BKToastPresenter _currentActionComplete](self, "_currentActionComplete");
  }

}

- (void)_setUpSellDataForCurrentAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter runningAction](self, "runningAction"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("details")));

  if (v20)
  {
    v4 = objc_opt_class(NSNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", BCAugmentedExperienceLocationKey));
    v6 = BUDynamicCast(v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "integerValue");

    v9 = objc_opt_class(NSNumber);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", BCAugmentedExperienceLocationVariantKey));
    v11 = BUDynamicCast(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "integerValue");

    v14 = objc_opt_class(NSString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForKey:", BCAugmentedExperienceVariantVersionKey));
    v16 = BUDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = objc_msgSend(objc_alloc((Class)BAUpSellData), "initWithLocation:variant:variantVersion:", v8, v13, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter cardViewController](self, "cardViewController"));
    objc_msgSend(v19, "setUpSellData:", v18);

  }
}

- (void)_scheduleAction:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = BCAugmentedExperienceLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BKToastPresenter _scheduleAction: %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter pendingActions](self, "pendingActions"));
  objc_msgSend(v7, "addObject:", v4);

  -[BKToastPresenter _performNextActionIfIdle](self, "_performNextActionIfIdle");
}

- (void)_performNextActionIfIdle
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter runningAction](self, "runningAction"));

  if (!v3)
    -[BKToastPresenter _performNextAction](self, "_performNextAction");
}

- (void)_performNextAction
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;

  v3 = BCAugmentedExperienceLog(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BKToastPresenter _performNextAction checking", (uint8_t *)&v18, 2u);
  }

  -[BKToastPresenter setRunningAction:](self, "setRunningAction:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter pendingActions](self, "pendingActions"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter pendingActions](self, "pendingActions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    -[BKToastPresenter setRunningAction:](self, "setRunningAction:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter pendingActions](self, "pendingActions"));
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

    v11 = BCAugmentedExperienceLog(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter runningAction](self, "runningAction"));
      v18 = 138543362;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BKToastPresenter _performNextAction: %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter runningAction](self, "runningAction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("action")));
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 == (id)2)
    {
      -[BKToastPresenter _dismissToast](self, "_dismissToast");
    }
    else
    {
      if (v16 == (id)1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter runningAction](self, "runningAction"));
        -[BKToastPresenter _expandCompactVCAction:](self, "_expandCompactVCAction:", v17);
      }
      else
      {
        if (v16)
          return;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter runningAction](self, "runningAction"));
        -[BKToastPresenter _presentInVCAction:](self, "_presentInVCAction:", v17);
      }

    }
  }
}

- (void)_currentActionComplete
{
  -[BKToastPresenter setRunningAction:](self, "setRunningAction:", 0);
  -[BKToastPresenter _performNextAction](self, "_performNextAction");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter cardViewController](self, "cardViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKToastPresenter toastViewController](self, "toastViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BKToastPresenter(cardVC:%@ toastVC:%@)"), v3, v4));

  return (NSString *)v5;
}

- (void)endOfBookCompactViewControllerWantsToDismiss:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKToastPresenter presentingDelegate](self, "presentingDelegate", a3));
  objc_msgSend(v4, "presenterWantsToDismiss:", self);

}

- (void)endOfBookCompactViewControllerWantsToCloseAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKToastPresenter presentingDelegate](self, "presentingDelegate"));
  objc_msgSend(v6, "presenterWantsToCloseAsset:completion:", self, v5);

}

- (BCAugmentedExperiencePresentingDelegate)presentingDelegate
{
  return (BCAugmentedExperiencePresentingDelegate *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (BKEndOfBookCompactViewController)toastViewController
{
  return self->_toastViewController;
}

- (BKEndOfBookCardViewController)cardViewController
{
  return self->_cardViewController;
}

- (void)setCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardViewController, a3);
}

- (BOOL)suppressingNotifications
{
  return self->_suppressingNotifications;
}

- (NSMutableArray)pendingActions
{
  return self->_pendingActions;
}

- (void)setPendingActions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActions, a3);
}

- (NSDictionary)runningAction
{
  return self->_runningAction;
}

- (void)setRunningAction:(id)a3
{
  objc_storeStrong((id *)&self->_runningAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningAction, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
  objc_storeStrong((id *)&self->_toastViewController, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
}

@end
