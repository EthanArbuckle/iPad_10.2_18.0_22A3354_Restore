@implementation HomePersonalRequestNotificationViewController

- (void)didReceiveNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = HULocalizedString(CFSTR("HUPersonalRequestSetting"), a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (_os_feature_enabled_impl("Kettle", "FeatureComplete"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("gear")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", CFSTR("PersonalRequestsActivityAction"), v5, 0, v6));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("PersonalRequestsActivityAction"), v5, 0));
  }
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomePersonalRequestNotificationViewController extensionContext](self, "extensionContext"));
  objc_msgSend(v9, "setNotificationActions:", v8);

}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "categoryIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionIdentifier"));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PersonalRequestsActivityAction")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notification"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "request"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("PersonalRequestsActivityUserInfoHomeIdentifier")));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomePersonalRequestNotificationViewController extensionContext](self, "extensionContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents personalRequestsOptInURLForHomeID:](HFURLComponents, "personalRequestsOptInURLForHomeID:", v17));
    objc_msgSend(v18, "openURL:completionHandler:", v19, 0);

  }
  else
  {
    v20 = HFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10000360C((uint64_t)v11, (uint64_t)v12, v21);

  }
  v7[2](v7, 1);

}

@end
