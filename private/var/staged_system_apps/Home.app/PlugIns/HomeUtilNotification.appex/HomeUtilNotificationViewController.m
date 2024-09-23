@implementation HomeUtilNotificationViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HomeUtilNotificationViewController;
  -[HomeUtilNotificationViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomeUtilNotificationViewController;
  -[HomeUtilNotificationViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController"));
  objc_msgSend(v4, "tearDownAudioActivity");

}

- (void)updateViewConstraints
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController staticConstraintSet](self, "staticConstraintSet"));
  objc_msgSend(v3, "activateIfNeeded");

  v4.receiver = self;
  v4.super_class = (Class)HomeUtilNotificationViewController;
  -[HomeUtilNotificationViewController updateViewConstraints](&v4, "updateViewConstraints");
}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", ANUserInfoOldestUnreadAnnouncementKey));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", ANUserInfoFailedDeliveryAnnouncementKey));

  if (!(v8 | v12))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "content"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", ANUserInfoOldestAnnouncementKey));

    goto LABEL_5;
  }
  if (v12)
  {
    v13 = (id)v12;
LABEL_5:

    v8 = (uint64_t)v13;
  }
  v16 = ANAnnouncementIDKey;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "objectForKeyedSubscript:", ANAnnouncementIDKey));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "notificationPayload"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v16));

  if (v20
    || (v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController")), v22 = objc_msgSend(v21, "isTearingDown"), v21, v22))
  {
    v23 = HFLogForCategory(7);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412546;
      v31 = v20;
      v32 = 2112;
      v33 = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received Duplicate notification for an active notification. Returning. Existing ID = [%@], New+Incoming = [%@]", (uint8_t *)&v30, 0x16u);
    }

  }
  else
  {
    v25 = HFLogForCategory(7);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "notificationPayload"));
      v30 = 138412546;
      v31 = v27;
      v32 = 2112;
      v33 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "self.announcementsBrowserViewController = [%@] AND notificationPayload %@", (uint8_t *)&v30, 0x16u);

    }
    -[HomeUtilNotificationViewController _presentNotificationExtensionForNotification:](self, "_presentNotificationExtensionForNotification:", v4);
  }

}

- (void)_presentNotificationExtensionForNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void **v41;
  uint64_t v42;
  id (*v43)(uint64_t);
  void *v44;
  id v45;
  id location;
  uint8_t buf[4];
  id v48;

  v4 = a3;
  v5 = HFLogForCategory(7);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "content"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    *(_DWORD *)buf = 138412290;
    v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received announcment userinfo = [%@]", buf, 0xCu);

  }
  v10 = objc_opt_new(NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", ANUserInfoOldestUnreadAnnouncementKey));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "content"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", ANUserInfoFailedDeliveryAnnouncementKey));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "content"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userInfo"));
  v22 = ANUserInfoNotificationTypeKey;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", ANUserInfoNotificationTypeKey));

  if (!(v14 | v18))
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14, "content"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userInfo"));
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", ANUserInfoOldestAnnouncementKey));

    goto LABEL_7;
  }
  if (v18)
  {
    v24 = (id)v18;
LABEL_7:

    goto LABEL_8;
  }
  v24 = (id)v14;
LABEL_8:
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v23, v22);
  -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v24);
  v27 = objc_alloc((Class)HUAnnouncementsBrowserViewController);
  v28 = -[NSMutableDictionary copy](v10, "copy");
  v29 = objc_msgSend(v27, "initWithNotificationPayload:delegate:", v28, self);
  -[HomeUtilNotificationViewController setAnnouncementsBrowserViewController:](self, "setAnnouncementsBrowserViewController:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "view"));
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HomeUtilNotificationViewController addChildViewController:](self, "addChildViewController:", self->_announcementsBrowserViewController);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[HUAnnouncementsBrowserViewController view](self->_announcementsBrowserViewController, "view"));
  objc_msgSend(v32, "addSubview:", v33);

  objc_initWeak(&location, self);
  v34 = objc_alloc((Class)NAUILayoutConstraintSet);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController view](self, "view"));
  v41 = _NSConcreteStackBlock;
  v42 = 3221225472;
  v43 = sub_10000289C;
  v44 = &unk_100004198;
  objc_copyWeak(&v45, &location);
  v36 = objc_msgSend(v34, "initWithOwningView:constraintBuilder:", v35, &v41);
  -[HomeUtilNotificationViewController setStaticConstraintSet:](self, "setStaticConstraintSet:", v36, v41, v42, v43, v44);

  v37 = HFLogForCategory(7);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v24;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Launching Notification Long Look with oldest Unread Announcement Info = [%@]", buf, 0xCu);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController staticConstraintSet](self, "staticConstraintSet"));
  objc_msgSend(v39, "activateIfNeeded");

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController announcementsBrowserViewController](self, "announcementsBrowserViewController"));
  objc_msgSend(v40, "didMoveToParentViewController:", self);

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

}

- (id)_fontForTimeCodeLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIFontDescriptorAttributeName v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleCaption1, 0x8000, 0));
  v11[0] = UIFontFeatureTypeIdentifierKey;
  v11[1] = UIFontFeatureSelectorIdentifierKey;
  v12[0] = &off_1000041E8;
  v12[1] = &off_100004200;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v13 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  v9 = UIFontDescriptorFeatureSettingsAttribute;
  v10 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fontDescriptorByAddingAttributes:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 0.0));
  return v7;
}

- (void)didSendAnnouncementReplyforNotificationPayload:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HomeUtilNotificationViewController extensionContext](self, "extensionContext", a3));
  objc_msgSend(v3, "dismissNotificationContentExtension");

}

- (HUAnnouncementsBrowserViewController)announcementsBrowserViewController
{
  return self->_announcementsBrowserViewController;
}

- (void)setAnnouncementsBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_announcementsBrowserViewController, a3);
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
  objc_storeStrong((id *)&self->_announcementsBrowserViewController, 0);
}

@end
