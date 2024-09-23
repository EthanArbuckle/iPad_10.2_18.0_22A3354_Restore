@implementation GKContactsIntegrationBulletin

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", GKPushCommandKey));
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 << 16 != 19726336)
  {
    if (!os_log_GKGeneral)
      v12 = (id)GKOSLoggers(v8);
    v13 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      sub_10015E4D4((__int16)v7, v13);
      if (!v5)
        goto LABEL_12;
    }
    else if (!v5)
    {
      goto LABEL_12;
    }
    v5[2](v5, 0);
    goto LABEL_12;
  }
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
    sub_10015E494(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKContactsIntegrationController sharedController](GKContactsIntegrationController, "sharedController"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015E404;
  v14[3] = &unk_1002BC0D0;
  v15 = v5;
  objc_msgSend(v11, "clearCachesWithCompletionHandler:", v14);

LABEL_12:
}

@end
