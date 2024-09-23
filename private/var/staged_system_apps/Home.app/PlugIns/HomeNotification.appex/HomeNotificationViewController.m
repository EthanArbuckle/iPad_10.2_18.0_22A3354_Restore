@implementation HomeNotificationViewController

- (HomeNotificationViewController)init
{
  HomeNotificationViewController *v2;
  uint64_t v3;
  HFHomeKitDispatcher *dispatcher;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HomeNotificationViewController;
  v2 = -[HomeNotificationViewController init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    dispatcher = v2->_dispatcher;
    v2->_dispatcher = (HFHomeKitDispatcher *)v3;

  }
  return v2;
}

- (void)viewDidLoad
{
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  HomeNotificationViewController *v12;
  __int16 v13;
  void *v14;

  v10.receiver = self;
  v10.super_class = (Class)HomeNotificationViewController;
  -[HomeNotificationViewController viewDidLoad](&v10, "viewDidLoad");
  v4 = HFLogForCategory(70);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController view](self, "view"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  HomeNotificationViewController *v11;
  __int16 v12;
  void *v13;

  v9.receiver = self;
  v9.super_class = (Class)HomeNotificationViewController;
  -[HomeNotificationViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  v5 = HFLogForCategory(70);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  -[HomeNotificationViewController _clearUpContentViewController](self, "_clearUpContentViewController");
  -[HomeNotificationViewController setCameraProfile:](self, "setCameraProfile:", 0);
  -[HomeNotificationViewController setNotificationSnapshot:](self, "setNotificationSnapshot:", 0);
}

- (void)updateViewConstraints
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController staticConstraintSet](self, "staticConstraintSet"));
  objc_msgSend(v3, "activateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)HomeNotificationViewController;
  -[HomeNotificationViewController updateViewConstraints](&v4, "updateViewConstraints");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HomeNotificationViewController;
  -[HomeNotificationViewController preferredContentSizeDidChangeForChildContentContainer:](&v8, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v4, "preferredContentSize");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController heightConstraint](self, "heightConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

}

- (void)didReceiveNotification:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  id v28;
  unsigned __int8 v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  NSObject *v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  -[HomeNotificationViewController setNotification:](self, "setNotification:", v4);
  v5 = HFLogForCategory(48);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject request](v4, "request"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "body"));
    *(_DWORD *)buf = 138412546;
    v39 = v4;
    v40 = 2112;
    v41 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController didReceiveNotification:%@ (body: %@)", buf, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController notificationRequestIdentifier](self, "notificationRequestIdentifier"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraNotificationUUID](self, "cameraNotificationUUID"));
    if (!v11)
      goto LABEL_7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraNotificationUUID](self, "cameraNotificationUUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject request](v4, "request"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", HMBulletinCameraNotificationIDKey));
    v17 = objc_msgSend(v12, "isEqual:", v16);

    if (v17)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
      -[NSObject reloadAfterNotificationUpdate](v18, "reloadAfterNotificationUpdate");
    }
    else
    {
LABEL_7:
      v19 = HFLogForCategory(48);
      v18 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10000E3F0(self);
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject request](v4, "request"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
    -[HomeNotificationViewController setNotificationRequestIdentifier:](self, "setNotificationRequestIdentifier:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject request](v4, "request"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "content"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userInfo"));

    v24 = HFLogForCategory(48);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Notification UserInfo:%@", buf, 0xCu);
    }

    if ((+[HFUtilities isDeviceUnlocked](HFUtilities, "isDeviceUnlocked") & 1) != 0
      || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", HMBulletinCameraProfileIDKey)), v27 = v26 == 0, v26, v27))
    {
      -[HomeNotificationViewController _configureWithContextDictionary:](self, "_configureWithContextDictionary:", v18);
    }
    else
    {
      v28 = objc_alloc_init((Class)LAContext);
      v37 = 0;
      v29 = objc_msgSend(v28, "canEvaluatePolicy:error:", 2, &v37);
      v30 = v37;
      if ((v29 & 1) != 0)
      {
        objc_initWeak((id *)buf, self);
        v31 = HULocalizedString(CFSTR("HUNotificationAuthString"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_100004DBC;
        v34[3] = &unk_100018528;
        objc_copyWeak(&v36, (id *)buf);
        v35 = v18;
        objc_msgSend(v28, "evaluatePolicy:localizedReason:reply:", 2, v32, v34);

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController extensionContext](self, "extensionContext"));
        objc_msgSend(v33, "dismissNotificationContentExtension");

      }
    }
  }

}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  void (**v7)(id, uint64_t);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void (**v75)(id, uint64_t);
  _QWORD v76[4];
  void *v77;
  HomeNotificationViewController *v78;
  void (**v79)(id, uint64_t);
  _QWORD v80[4];
  NSObject *v81;
  HomeNotificationViewController *v82;
  _QWORD v83[4];
  void *v84;
  HomeNotificationViewController *v85;
  uint8_t buf[4];
  NSObject *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  _QWORD v92[2];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = HFLogForCategory(48);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actionIdentifier](v6, "actionIdentifier"));
    *(_DWORD *)buf = 138412546;
    v87 = v6;
    v88 = 2112;
    v89 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController didReceiveNotificationResponse:%@ (actionIdentifier: %@)", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actionIdentifier](v6, "actionIdentifier"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("HomeNotificationActionAssociatePerson"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceUnknownSignificantEvents](self, "faceUnknownSignificantEvents"));
    v14 = objc_msgSend(v13, "count");

    if ((unint64_t)v14 >= 2)
    {
      v15 = HFLogForCategory(48);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceUnknownSignificantEvents](self, "faceUnknownSignificantEvents"));
        v18 = objc_msgSend(v17, "count");
        *(_DWORD *)buf = 134217984;
        v87 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController launching Home for %lu unknown persons", buf, 0xCu);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController home](self, "home"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents faceRecognitionSettingsURLForHome:](HFURLComponents, "faceRecognitionSettingsURLForHome:", v19));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController extensionContext](self, "extensionContext"));
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_100005754;
      v83[3] = &unk_100018550;
      v84 = v20;
      v85 = self;
      v22 = v20;
      objc_msgSend(v21, "openURL:completionHandler:", v22, v83);

      v7[2](v7, 1);
      v23 = v84;
      goto LABEL_10;
    }
    v75 = v7;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceUnknownSignificantEvents](self, "faceUnknownSignificantEvents"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "anyObject"));

    v74 = v31;
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "uniqueIdentifier"));
    v32 = HFURLComponentsHome;
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController home](self, "home"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "uniqueIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "UUIDString"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v32, v33));
    v92[0] = v34;
    v35 = HFURLComponentsCameraProfile;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraProfile](self, "cameraProfile"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueIdentifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "UUIDString"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v35, v38));
    v92[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 2));
    v41 = objc_claimAutoreleasedReturnValue(+[HFURLComponents homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:](HFURLComponents, "homeKitObjectURLForDestination:secondaryDestination:UUID:queryItems:", 10, 0, v71, v40));

    v42 = HFLogForCategory(48);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v87 = v41;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "HomeNotificationViewController launching Home for person URL: %@", buf, 0xCu);
    }

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController extensionContext](self, "extensionContext"));
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1000058FC;
    v80[3] = &unk_100018550;
    v81 = v41;
    v82 = self;
    v45 = v41;
    objc_msgSend(v44, "openURL:completionHandler:", v45, v80);

    v7 = v75;
    v75[2](v75, 1);

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actionIdentifier](v6, "actionIdentifier"));
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("HomeNotificationActionDisassociatePerson"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceKnownSignificantEvents](self, "faceKnownSignificantEvents"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "anyObject"));

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraProfile](self, "cameraProfile"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "clipManager"));
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_100005A84;
      v76[3] = &unk_1000185A0;
      v77 = v27;
      v78 = self;
      v79 = v7;
      v22 = v27;
      objc_msgSend(v29, "handleFaceMisclassificationForSignificantEvent:completion:", v22, v76);

      v23 = v77;
LABEL_10:

      goto LABEL_24;
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actionIdentifier](v6, "actionIdentifier"));
    v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("provide_cameraRecordingFeedback"));

    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notification](v6, "notification"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "request"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "content"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "userInfo"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", HMUserNotificationContentActionURLKey));

      v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notification](v6, "notification"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "request"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "content"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "userInfo"));
      v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", HMBulletinCameraClipIDKey));

      if (v52 && v57)
      {
        v58 = HFNotificationCameraClipKey;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[HFCameraUtilities cameraFeedbackQueryString](HFCameraUtilities, "cameraFeedbackQueryString"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("&%@=%@%@"), v58, v57, v59));
        v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingString:", v60));

        v62 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v61));
        v63 = HFLogForCategory(48);
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v62;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Open app for feedback request with URL:%@.", buf, 0xCu);
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController extensionContext](self, "extensionContext"));
        objc_msgSend(v65, "openURL:completionHandler:", v62, 0);

        v52 = (void *)v61;
      }
      else
      {
        v66 = HFLogForCategory(48);
        v62 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject notification](v6, "notification"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "request"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "content"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "userInfo"));
          *(_DWORD *)buf = 138412802;
          v87 = v57;
          v88 = 2112;
          v89 = v52;
          v90 = 2112;
          v91 = v70;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Received request to display feedback flow with invalid clip/URL string pair (%@/%@) from userInfo:%@", buf, 0x20u);

        }
      }

      v7[2](v7, 1);
    }
    else
    {
      v7[2](v7, 2);
    }
  }
LABEL_24:

}

- (void)setHome:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_home, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController dispatcher](self, "dispatcher"));
  objc_msgSend(v6, "setOverrideHome:", v5);

}

- (void)_configureWithContextDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  HomeNotificationViewController *v31;
  id v32;
  id v33;
  id v34;

  v4 = a3;
  -[HomeNotificationViewController setContext:](self, "setContext:", v4);
  v5 = objc_alloc((Class)NSUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", HMBulletinContextHomeIDKey));
  v7 = objc_msgSend(v5, "initWithUUIDString:", v6);

  v8 = objc_alloc((Class)NSUUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", HMBulletinCameraProfileIDKey));
  v10 = objc_msgSend(v8, "initWithUUIDString:", v9);

  v11 = objc_alloc((Class)NSUUID);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", HMBulletinContextServiceIDKey));
  v13 = objc_msgSend(v11, "initWithUUIDString:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", HMBulletinCameraSignificantEventUUIDsKey));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "na_map:", &stru_1000185E0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));

  v17 = objc_alloc((Class)NSUUID);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", HMBulletinCameraNotificationIDKey));
  v19 = objc_msgSend(v17, "initWithUUIDString:", v18);
  -[HomeNotificationViewController setCameraNotificationUUID:](self, "setCameraNotificationUUID:", v19);

  v20 = objc_alloc((Class)NSUUID);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", HMBulletinCameraClipIDKey));
  v22 = objc_msgSend(v20, "initWithUUIDString:", v21);
  -[HomeNotificationViewController setCameraClipUUID:](self, "setCameraClipUUID:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController _configureHomeWithUUID:](self, "_configureHomeWithUUID:", v7));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000061BC;
  v29[3] = &unk_100018680;
  v30 = v4;
  v31 = self;
  v32 = v13;
  v33 = v10;
  v34 = v16;
  v24 = v16;
  v25 = v10;
  v26 = v13;
  v27 = v4;
  v28 = objc_msgSend(v23, "addCompletionBlock:", v29);

}

- (id)_configureHomeWithUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000066DC;
  v8[3] = &unk_1000186F8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v8));
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_configureCameraProfileWithUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006958;
  v8[3] = &unk_1000186F8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v8));
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_configureCameraSignificantEventsWithUUIDs:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006BD4;
  v8[3] = &unk_1000186F8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v8));
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

- (id)_configureNotificationSnapshot
{
  void *v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000070D4;
  v5[3] = &unk_1000187C0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v5));
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)_setupContentViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  double v26;
  HomeNotificationTableViewController *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HomeNotificationTableViewController *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraProfile](self, "cameraProfile"));

    if (!v4)
    {
      v9 = HFLogForCategory(22);
      v8 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10000E7D0(v8, v10, v11, v12, v13, v14, v15, v16);
      goto LABEL_19;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController affectedService](self, "affectedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceType"));
    if (objc_msgSend(v6, "isEqualToString:", HMServiceTypeMotionSensor))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraNotificationUUID](self, "cameraNotificationUUID"));
      if (v7)
        v8 = 0;
      else
        v8 = objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController notificationSnapshot](self, "notificationSnapshot"));

      if (v8)
        goto LABEL_18;
    }
    else
    {

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController affectedService](self, "affectedService"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serviceType"));
    if ((objc_msgSend(v18, "isEqualToString:", HMServiceTypeMotionSensor) & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController notification](self, "notification"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "request"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "content"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "attachments"));
      v23 = objc_msgSend(v22, "count");

      if (!v23)
      {
        v24 = HFLogForCategory(22);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Legacy cameras without an embedded snapshot don't get a long look.", (uint8_t *)buf, 2u);
        }

        v8 = objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController view](self, "view"));
        -[NSObject bounds](v8, "bounds");
        -[HomeNotificationViewController setPreferredContentSize:](self, "setPreferredContentSize:", v26, 1.0);
        goto LABEL_19;
      }
    }
    else
    {

    }
    v8 = 0;
LABEL_18:
    v27 = [HomeNotificationTableViewController alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController notification](self, "notification"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController home](self, "home"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraProfile](self, "cameraProfile"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraNotificationUUID](self, "cameraNotificationUUID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController cameraClipUUID](self, "cameraClipUUID"));
    v33 = -[HomeNotificationTableViewController initWithNotification:home:cameraProfile:notificationUUID:clipUUID:snapshot:](v27, "initWithNotification:home:cameraProfile:notificationUUID:clipUUID:snapshot:", v28, v29, v30, v31, v32, v8);
    -[HomeNotificationViewController setContentViewController:](self, "setContentViewController:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
    -[HomeNotificationViewController addChildViewController:](self, "addChildViewController:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "view"));
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController view](self, "view"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
    objc_msgSend(v37, "addSubview:", v39);

    objc_initWeak(buf, self);
    v40 = objc_alloc((Class)NAUILayoutConstraintSet);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController view](self, "view"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100007824;
    v45[3] = &unk_1000187E8;
    objc_copyWeak(&v46, buf);
    v42 = objc_msgSend(v40, "initWithOwningView:constraintBuilder:", v41, v45);
    -[HomeNotificationViewController setStaticConstraintSet:](self, "setStaticConstraintSet:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController staticConstraintSet](self, "staticConstraintSet"));
    objc_msgSend(v43, "activateIfNeeded");

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
    objc_msgSend(v44, "didMoveToParentViewController:", self);

    objc_destroyWeak(&v46);
    objc_destroyWeak(buf);
LABEL_19:

  }
}

- (void)_clearUpContentViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v3, "willMoveToParentViewController:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "removeFromSuperview");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
  objc_msgSend(v6, "removeFromParentViewController");

  -[HomeNotificationViewController setStaticConstraintSet:](self, "setStaticConstraintSet:", 0);
  -[HomeNotificationViewController setContentViewController:](self, "setContentViewController:", 0);
}

- (void)_setupNotificationActions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceKnownSignificantEvents](self, "faceKnownSignificantEvents"));
  v4 = objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceUnknownSignificantEvents](self, "faceUnknownSignificantEvents"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController home](self, "home"));
  v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  if (v4 != (id)1 && v6 && v8)
  {
    v9 = HULocalizedString(CFSTR("HUFaceRecognitionHomeNotificationActionAssociatePerson"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (_os_feature_enabled_impl("Kettle", "FeatureComplete"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("person.crop.circle.badge.plus")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("HomeNotificationActionAssociatePerson"), v10, 0, v11));

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("HomeNotificationActionAssociatePerson"), v10, 0));
    }
    v26 = v12;
    v21 = &v26;
LABEL_19:
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 1));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController extensionContext](self, "extensionContext"));
    objc_msgSend(v23, "setNotificationActions:", v22);

    return;
  }
  if (v4 == (id)1 && v6 == 0)
    v14 = v8;
  else
    v14 = 0;
  if (v14 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController faceKnownSignificantEvents](self, "faceKnownSignificantEvents"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "faceClassification"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "person"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
    v19 = HULocalizedStringWithFormat(CFSTR("HUFaceRecognitionHomeNotificationActionDisassociatePersonFormat"), CFSTR("%@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (_os_feature_enabled_impl("Kettle", "FeatureComplete"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("person.crop.circle.badge.xmark")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("HomeNotificationActionDisassociatePerson"), v10, 4, v20));

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("HomeNotificationActionDisassociatePerson"), v10, 4));
    }
    v25 = v12;
    v21 = &v25;
    goto LABEL_19;
  }
}

- (void)_showErrorText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HomeNotificationViewController *v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController contentViewController](self, "contentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "setHidden:", 1);

  v10 = self;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007F90;
  v11[3] = &unk_100018810;
  v11[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007FE8;
  v8[3] = &unk_100018550;
  v9 = v4;
  v7 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x10000, v11, v8, 0.2, 0.0);

}

- (id)_homeWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController dispatcher](self, "dispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allHomesFuture"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008170;
  v10[3] = &unk_100018860;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v10));

  return v8;
}

- (id)_homeWithUUID:(id)a3 retryDelay:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  double v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController _homeWithUUID:](self, "_homeWithUUID:", v6));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000847C;
  v11[3] = &unk_1000188D8;
  v13 = a4;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recover:", v11));

  return v9;
}

- (id)_cameraProfileWithUUID:(id)a3 retryDelay:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeNotificationViewController home](self, "home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_cameraProfileWithIdentifier:", v6));

  v9 = HFLogForCategory(48);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(NC) Found camera profile for UUID:%@", buf, 0xCu);
    }

    v12 = (id)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v8));
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000E8CC(self);

    v13 = (void *)objc_opt_new(NAFuture);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "homeManager"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a4));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100008970;
    v21[3] = &unk_1000188B0;
    v21[4] = self;
    v22 = v6;
    v17 = v13;
    v23 = v17;
    v18 = objc_msgSend(v15, "_refreshBeforeDate:completionHandler:", v16, v21);

    v19 = v23;
    v12 = v17;

  }
  return v12;
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)notificationRequestIdentifier
{
  return self->_notificationRequestIdentifier;
}

- (void)setNotificationRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFHomeKitDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (HMService)affectedService
{
  return self->_affectedService;
}

- (void)setAffectedService:(id)a3
{
  objc_storeStrong((id *)&self->_affectedService, a3);
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (NSSet)cameraSignificantEvents
{
  return self->_cameraSignificantEvents;
}

- (void)setCameraSignificantEvents:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSignificantEvents, a3);
}

- (HMCameraSnapshot)notificationSnapshot
{
  return self->_notificationSnapshot;
}

- (void)setNotificationSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSnapshot, a3);
}

- (NSUUID)cameraNotificationUUID
{
  return self->_cameraNotificationUUID;
}

- (void)setCameraNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_cameraNotificationUUID, a3);
}

- (NSUUID)cameraClipUUID
{
  return self->_cameraClipUUID;
}

- (void)setCameraClipUUID:(id)a3
{
  objc_storeStrong((id *)&self->_cameraClipUUID, a3);
}

- (NSSet)faceKnownSignificantEvents
{
  return self->_faceKnownSignificantEvents;
}

- (void)setFaceKnownSignificantEvents:(id)a3
{
  objc_storeStrong((id *)&self->_faceKnownSignificantEvents, a3);
}

- (NSSet)faceUnknownSignificantEvents
{
  return self->_faceUnknownSignificantEvents;
}

- (void)setFaceUnknownSignificantEvents:(id)a3
{
  objc_storeStrong((id *)&self->_faceUnknownSignificantEvents, a3);
}

- (HomeNotificationTableViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (NAUILayoutConstraintSet)staticConstraintSet
{
  return self->_staticConstraintSet;
}

- (void)setStaticConstraintSet:(id)a3
{
  objc_storeStrong((id *)&self->_staticConstraintSet, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_staticConstraintSet, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_faceUnknownSignificantEvents, 0);
  objc_storeStrong((id *)&self->_faceKnownSignificantEvents, 0);
  objc_storeStrong((id *)&self->_cameraClipUUID, 0);
  objc_storeStrong((id *)&self->_cameraNotificationUUID, 0);
  objc_storeStrong((id *)&self->_notificationSnapshot, 0);
  objc_storeStrong((id *)&self->_cameraSignificantEvents, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_storeStrong((id *)&self->_affectedService, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_notificationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
