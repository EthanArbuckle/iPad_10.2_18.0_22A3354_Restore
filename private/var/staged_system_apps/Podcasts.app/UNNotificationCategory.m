@implementation UNNotificationCategory

+ (id)mt_allSupportedLocalNotificationCategories
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory mt_localNotificationForNewEpisodesAvailable](UNNotificationCategory, "mt_localNotificationForNewEpisodesAvailable"));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory mt_localNotificationForAnnouncements](UNNotificationCategory, "mt_localNotificationForAnnouncements"));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

+ (id)mt_allSupportedNotificationCategories
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mt_allSupportedLocalNotificationCategories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)mt_localNotificationForAnnouncements
{
  return +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", CFSTR("com.apple.podcasts.announcement"), &__NSArray0__struct, &__NSArray0__struct, 0, 0, 0);
}

+ (id)mt_localNotificationForNewEpisodesAvailable
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_EPISODES_AVAILABLE_COALESCING_SUMMARY_FORMAT"), 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedUserNotificationStringForKey:arguments:](NSString, "localizedUserNotificationStringForKey:arguments:", CFSTR("NOTIFICATION_HIDDEN_PREVIEWS_BODY"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", CFSTR("com.apple.podcasts.newEpisodesAvailable"), &__NSArray0__struct, &__NSArray0__struct, v3, v2, 0));

  return v4;
}

@end
