@implementation FRInternalExtrasFakeNotificationSender

- (void)scheduleAnyFakeNotificationsFromInternalExtras:(id)a3 whenAppEntersBackground:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("fake_notification_for_article_on_background"));

  if (v8)
    -[FRInternalExtrasFakeNotificationSender _scheduleFakeNewArticleNotification:whenAppEntersBackground:](self, "_scheduleFakeNewArticleNotification:whenAppEntersBackground:", v11, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("fake_notification_for_channel_supports_notifications_on_background"));

  if (v10)
    -[FRInternalExtrasFakeNotificationSender _scheduleFakeChannelSupportNotification:](self, "_scheduleFakeChannelSupportNotification:", v11);

}

- (void)_scheduleFakeChannelSupportNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("fake_notification_for_channel_supports_notifications_on_background"));

  v6 = objc_msgSend(objc_alloc((Class)FCTag), "initForTestingWithTagType:identifier:name:", 2, CFSTR("fakeID"), CFSTR("Fake Channel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v6));
  objc_msgSend(v3, "scheduleLocalNotificationforChannels:", v5);

}

- (void)_scheduleFakeNewArticleNotification:(id)a3 whenAppEntersBackground:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "setBool:forKey:", 0, CFSTR("fake_notification_for_article_on_background"));

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005CDD0;
  v17[3] = &unk_1000DBFB0;
  v8 = v6;
  v18 = v8;
  v19 = &v20;
  v9 = objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("AppDelegateEnterBackground"), v17);
  v21[3] = (uint64_t)v9;
  v10 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CE18;
  block[3] = &unk_1000DB5D0;
  v14 = v5;
  v15 = v8;
  v16 = &v20;
  v11 = v8;
  v12 = v5;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v20, 8);
}

@end
