@implementation NotificationViewControllerFactory

+ (id)contentAvailableViewControllerForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mt_notificationEpisodes"));

  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewControllerSingleNotificationEpisode:notification:", v9, v4));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "viewControllerMultipleNotificationEpisodes:notification:", v7, v4));
  }

  return v8;
}

+ (id)viewControllerSingleNotificationEpisode:(id)a3 notification:(id)a4
{
  id v4;
  EpisodeAvailableViewController *v5;

  v4 = a4;
  v5 = -[EpisodeAvailableViewController initWithNotification:]([EpisodeAvailableViewController alloc], "initWithNotification:", v4);

  return v5;
}

+ (id)viewControllerMultipleNotificationEpisodes:(id)a3 notification:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  EpisodeListAvailableViewController *v11;
  uint8_t v13[16];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mt_compactMap:", &stru_100028BA0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  v8 = objc_msgSend(v7, "count");

  if ((unint64_t)v8 >= 2)
  {
    v9 = _MTLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Stack of multiple notifications referencing multiple podcast is not supported", v13, 2u);
    }

  }
  v11 = -[EpisodeListAvailableViewController initWithNotification:]([EpisodeListAvailableViewController alloc], "initWithNotification:", v5);

  return v11;
}

@end
