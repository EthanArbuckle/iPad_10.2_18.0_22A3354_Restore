@implementation UNNotificationAction

+ (id)mt_showOnePodcastOneEpisodeDetail
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = sub_10000CF2C(3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_ACTION_SHOW_EPISODE_DETAILS"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("podcasts.square")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", v3, v4, 4, v5));

  return v6;
}

+ (id)mt_showOnePodcastMultipleEpisodesDetail
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = sub_10000CF2C(4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_ACTION_SHOW_EPISODE_DETAILS"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("podcasts.square")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", v3, v4, 4, v5));

  return v6;
}

+ (id)mt_playEpisodeActionWithOptions:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = sub_10000CF2C(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_ACTION_PLAY_EPISODE"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("play")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", v5, v6, a3, v7));

  return v8;
}

+ (id)mt_playMultipleEpisodesActionWithCount:(int64_t)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = sub_10000CF2C(2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_ACTION_PLAY_MANY_EPISODES"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationActionIcon iconWithSystemImageName:](UNNotificationActionIcon, "iconWithSystemImageName:", CFSTR("play")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:icon:](UNNotificationAction, "actionWithIdentifier:title:options:icon:", v6, v7, a4, v8));

  return v9;
}

@end
