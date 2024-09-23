@implementation UNMutableNotificationContent

- (void)mt_setUserInfoPodcastUuid:(id)a3 episodes:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  const __CFString *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v7 = (__CFString *)a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UNMutableNotificationContent userInfo](self, "userInfo"));
  v9 = objc_msgSend(v8, "mutableCopy");
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = v11;

  if (v7)
    v12 = v7;
  else
    v12 = &stru_1004C6D40;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("podcastUuid"));

  v13 = NSStringFromSelector("dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", v14));

  if (v15)
    v16 = v15;
  else
    v16 = &__NSDictionary0__struct;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("notificationEpisodeDictionaryRepresentations"));
  -[UNMutableNotificationContent setUserInfo:](self, "setUserInfo:", v17);

}

- (void)mt_setUserInfoEpisode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastUuid"));
  v6 = (void *)v5;
  v7 = &stru_1004C6D40;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  v10 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  -[UNMutableNotificationContent mt_setUserInfoPodcastUuid:episodes:](self, "mt_setUserInfoPodcastUuid:episodes:", v8, v9);
}

@end
