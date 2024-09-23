@implementation PHRegistrationViewController

+ (BOOL)shouldShowRegistration
{
  id v2;
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  void *v7;

  v2 = sub_10000CF14(CFSTR("BypassRegistrationUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0
    || objc_msgSend(UIApp, "showsTelephonyCalls")
    && (objc_msgSend(UIApp, "telephonyCallingIsAvailable") & 1) != 0
    || objc_msgSend(UIApp, "showsFaceTimeVideo")
    && (objc_msgSend(UIApp, "faceTimeVideoIsAvailable") & 1) != 0)
  {
    return 0;
  }
  if (+[PHRegistrationViewController _shouldShowAuthKitSignIn](PHRegistrationViewController, "_shouldShowAuthKitSignIn"))
  {
    return 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHRegistrationViewController _inProgressRegisteringNonPhoneAccount](PHRegistrationViewController, "_inProgressRegisteringNonPhoneAccount"));
  v5 = v7 != 0;

  return v5;
}

+ (BOOL)_shouldShowAuthKitSignIn
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsForService:", v3));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "registrationStatus", (_QWORD)v12) == (id)5)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

+ (id)_inProgressRegisteringNonPhoneAccount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  char *v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountsForService:", v3));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "accountType", (_QWORD)v14);
        v11 = (char *)objc_msgSend(v9, "registrationStatus");
        if (v11 != (char *)5 && v10 != (id)2 && (unint64_t)(v11 - 2) <= 2)
        {
          v6 = v9;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
LABEL_14:

  return v6;
}

- (PHRegistrationViewController)init
{
  PHRegistrationViewController *v2;
  PHRegistrationView *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  AKTapToSignInViewController *v11;
  AKTapToSignInViewController *akSignInVC;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  OBPrivacyLinkController *privacyLinkController;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v25.receiver = self;
  v25.super_class = (Class)PHRegistrationViewController;
  v2 = -[PHRegistrationViewController init](&v25, "init");
  if (v2)
  {
    v3 = -[PHRegistrationView initWithFrame:]([PHRegistrationView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[PHRegistrationView setRegistrationDelegate:](v3, "setRegistrationDelegate:", v2);
    -[PHRegistrationViewController setView:](v2, "setView:", v3);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsForService:", v5));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "accountType") == (id)2)
          break;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v11 = (AKTapToSignInViewController *)objc_alloc_init((Class)CUTWeakLinkClass(CFSTR("AKTapToSignInViewController"), CFSTR("AuthKitUI")));
      akSignInVC = v2->_akSignInVC;
      v2->_akSignInVC = v11;

      -[AKTapToSignInViewController setUsesDarkMode:](v2->_akSignInVC, "setUsesDarkMode:", 1);
      -[AKTapToSignInViewController setDelegate:](v2->_akSignInVC, "setDelegate:", v2);
      v6 = objc_alloc_init((Class)CUTWeakLinkClass(CFSTR("AKAppleIDAuthenticationInAppContext"), CFSTR("AuthKitUI")));
      objc_msgSend(v6, "setPresentingViewController:", v2);
      v13 = objc_alloc_init((Class)CUTWeakLinkClass(CFSTR("ACAccountStore"), CFSTR("Accounts")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_primaryAppleAccount"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "username"));
      if (objc_msgSend(v15, "length"))
        objc_msgSend(v6, "setUsername:", v15);
      -[AKTapToSignInViewController setContext:](v2->_akSignInVC, "setContext:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[AKTapToSignInViewController view](v2->_akSignInVC, "view"));
      -[PHRegistrationView setAuthKitSignInView:](v3, "setAuthKitSignInView:", v16);

      v17 = objc_claimAutoreleasedReturnValue(+[OBPrivacyLinkController linkWithBundleIdentifier:](OBPrivacyLinkController, "linkWithBundleIdentifier:", CFSTR("com.apple.onboarding.facetime")));
      privacyLinkController = v2->_privacyLinkController;
      v2->_privacyLinkController = (OBPrivacyLinkController *)v17;

      -[PHRegistrationViewController addChildViewController:](v2, "addChildViewController:", v2->_privacyLinkController);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OBPrivacyLinkController view](v2->_privacyLinkController, "view"));
      -[PHRegistrationView setPrivacyLinkView:](v3, "setPrivacyLinkView:", v19);

      -[OBPrivacyLinkController didMoveToParentViewController:](v2->_privacyLinkController, "didMoveToParentViewController:", v2);
    }

    -[PHRegistrationView layoutSubviews](v3, "layoutSubviews");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PHRegistrationViewController _stopListeningToKeyboardNotifications](self, "_stopListeningToKeyboardNotifications");
  v3.receiver = self;
  v3.super_class = (Class)PHRegistrationViewController;
  -[PHRegistrationViewController dealloc](&v3, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD block[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHRegistrationViewController;
  -[PHRegistrationViewController viewWillAppear:](&v14, "viewWillAppear:", a3);
  -[PHRegistrationViewController _startListeningForKeyboardNotifications](self, "_startListeningForKeyboardNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHRegistrationViewController _inProgressRegisteringNonPhoneAccount](PHRegistrationViewController, "_inProgressRegisteringNonPhoneAccount"));
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037968;
    block[3] = &unk_1000898B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = sub_10003799C;
    v11 = sub_1000379AC;
    v12 = objc_alloc_init((Class)CNFAccountRegistrar);
    v5 = (void *)v8[5];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000379B4;
    v6[3] = &unk_10008A228;
    v6[4] = self;
    v6[5] = &v7;
    objc_msgSend(v5, "continueRegistrationForAccount:completionBlock:", v4, v6);
    _Block_object_dispose(&v7, 8);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHRegistrationViewController;
  -[PHRegistrationViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[PHRegistrationViewController _stopListeningToKeyboardNotifications](self, "_stopListeningToKeyboardNotifications");
}

- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void **v17;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  _QWORD v32[5];
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  _QWORD block[6];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_10000E6C4();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_100055778();

  if (v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037DBC;
    block[3] = &unk_1000898B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v13 = sub_10000E6C4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100055704((uint64_t)v10, v14);

  }
  else
  {
    v15 = sub_10000E6C4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_1000556D8();

    if (!qword_1000A3968)
    {
      v17 = (void **)CUTWeakLinkSymbol("AKAuthenticationUsernameKey", CFSTR("AuthKit"));
      if (v17)
        v18 = *v17;
      else
        v18 = 0;
      objc_storeStrong((id *)&qword_1000A3968, v18);
    }
    if (!qword_1000A3970)
    {
      v19 = (void **)CUTWeakLinkSymbol("AKAuthenticationPasswordKey", CFSTR("AuthKit"));
      if (v19)
        v20 = *v19;
      else
        v20 = 0;
      objc_storeStrong((id *)&qword_1000A3970, v20);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", qword_1000A3968));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", qword_1000A3970));
    v23 = (void *)v22;
    if (v21 && v22)
    {
      v24 = sub_10000E6C4();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_100055674();

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100037E44;
      v40[3] = &unk_1000898B8;
      v40[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v40);
      v26 = sub_10000E6C4();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        sub_100055648();

      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = sub_10003799C;
      v38 = sub_1000379AC;
      v39 = objc_msgSend(objc_alloc((Class)CNFAccountRegistrar), "initWithServiceType:presentationViewController:", 0, self);
      v28 = (void *)v35[5];
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[IMServiceImpl facetimeService](IMServiceImpl, "facetimeService"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100037E78;
      v33[3] = &unk_10008A228;
      v33[4] = self;
      v33[5] = &v34;
      objc_msgSend(v28, "registerAccountWithUsername:password:service:completionBlock:", v21, v23, v29, v33);

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100037E88;
      v32[3] = &unk_1000898B8;
      v32[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v32);
      v30 = sub_10000E6C4();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1000556A0();

    }
  }

}

- (void)_handleRegistrarCompletion:(BOOL)a3 errorAlertController:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;
  NSObject *v14;
  _QWORD block[5];

  v4 = a3;
  v6 = a4;
  v7 = sub_10000E6C4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000557FC();

  if (v4)
  {
    v9 = sub_10000E6C4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1000557A4();

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController completionBlock](self, "completionBlock"));
    if (v11)
    {
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController completionBlock](self, "completionBlock"));
      v12[2](v12, 1);

    }
  }
  else if (v6)
  {
    v13 = sub_10000E6C4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_1000557D0();

    -[PHRegistrationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038008;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)registrationViewSignInPhoneAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  dispatch_queue_global_t global_queue;
  void *v22;
  __int128 v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "View requested phone account to register", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsForService:", v7));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v26;
    v14 = IMAccountRegistrationStatusChangedNotification;
    *(_QWORD *)&v11 = 138412290;
    v23 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "accountType", v23) == (id)2)
        {
          v17 = sub_10000E6C4();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Registering this acount: %@", buf, 0xCu);
          }

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_registrationTimedOut:", 0, 0, 180.0));
          -[PHRegistrationViewController setRegistrationTimeout:](self, "setRegistrationTimeout:", v19);

          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          objc_msgSend(v20, "addObserver:selector:name:object:", self, "_registrationStatusChanged:", v14, 0);

          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10003830C;
          v24[3] = &unk_10008A250;
          v24[4] = v16;
          global_queue = dispatch_get_global_queue(21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
          IDSRegistrationControlEnableRegistrationType(0, v24, v22);

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v12);
  }

}

- (void)_registrationTimedOut:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint8_t v11[16];

  v4 = a3;
  v5 = sub_10000E6C4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration timed out", v11, 2u);
  }

  objc_msgSend(v4, "invalidate");
  -[PHRegistrationViewController setRegistrationTimeout:](self, "setRegistrationTimeout:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, IMAccountRegistrationStatusChangedNotification, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController completionBlock](self, "completionBlock"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController view](self, "view"));
    objc_msgSend(v9, "setSigningIn:", 0);
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController completionBlock](self, "completionBlock"));
    v10[2](v10, 0);

  }
}

- (void)_startListeningForKeyboardNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_keyboardWillAppear:", UIKeyboardWillShowNotification, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_keyboardWillDisappear:", UIKeyboardWillHideNotification, 0);

}

- (void)_stopListeningToKeyboardNotifications
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);

}

- (void)_keyboardWillAppear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController view](self, "view"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;

    objc_msgSend(v4, "bounds");
    v10 = v9;
    objc_msgSend(v4, "contentSize");
    if (v8 > v10 - v11)
    {
      objc_msgSend(v4, "contentInset");
      objc_msgSend(v4, "setContentInset:");
      objc_msgSend(v4, "contentSize");
      v13 = v12;
      objc_msgSend(v4, "bounds");
      v15 = v13 - v14;
      objc_msgSend(v4, "contentInset");
      objc_msgSend(v4, "setContentOffset:animated:", 1, 0.0, fabs(v16 + v15));
    }
  }

}

- (void)_keyboardWillDisappear:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController view](self, "view", a3));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    objc_msgSend(v4, "setContentOffset:", CGPointZero.x, CGPointZero.y);
    v3 = v4;
  }

}

- (void)_registrationStatusChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  const __CFString *v27;
  void (**v28)(_QWORD, _QWORD);
  void *v29;
  _QWORD block[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const __CFString *v36;
  _BYTE v37[128];

  v4 = sub_10000E6C4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration status changed", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMService facetimeService](IMService, "facetimeService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsForService:", v7));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (!v10)
    goto LABEL_29;
  v11 = v10;
  v12 = *(_QWORD *)v32;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v14, "accountType") == (id)2)
      {
        v15 = objc_msgSend(v14, "registrationStatus");
        v16 = v15;
        if (v15 == (id)5)
        {
          v17 = sub_10000E6C4();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Phone account is registered", buf, 2u);
          }

        }
        else
        {
          if (v15 != (id)-1)
            continue;
          v19 = sub_10000E6C4();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Phone account failed registration", buf, 2u);
          }

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100038B14;
          block[3] = &unk_1000898B8;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        v21 = sub_10000E6C4();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Registration status change handled", buf, 2u);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController registrationTimeout](self, "registrationTimeout"));
        objc_msgSend(v23, "invalidate");

        -[PHRegistrationViewController setRegistrationTimeout:](self, "setRegistrationTimeout:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController completionBlock](self, "completionBlock"));

        if (v24)
        {
          v25 = sub_10000E6C4();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = CFSTR("NO");
            if (v16 == (id)5)
              v27 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            v36 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Calling completion block with result: %@", buf, 0xCu);
          }

          v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHRegistrationViewController completionBlock](self, "completionBlock"));
          ((void (**)(_QWORD, BOOL))v28)[2](v28, v16 == (id)5);

        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v29, "removeObserver:name:object:", self, IMAccountRegistrationStatusChangedNotification, 0);

        goto LABEL_29;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v11)
      continue;
    break;
  }
LABEL_29:

}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (AKTapToSignInViewController)akSignInVC
{
  return (AKTapToSignInViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAkSignInVC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OBPrivacyLinkController)privacyLinkController
{
  return (OBPrivacyLinkController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrivacyLinkController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSTimer)registrationTimeout
{
  return (NSTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRegistrationTimeout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationTimeout, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_akSignInVC, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
