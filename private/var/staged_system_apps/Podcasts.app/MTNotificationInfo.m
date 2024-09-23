@implementation MTNotificationInfo

- (MTNotificationInfo)init
{
  MTNotificationInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *podcasts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTNotificationInfo;
  v2 = -[MTNotificationInfo init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    podcasts = v2->_podcasts;
    v2->_podcasts = v3;

  }
  return v2;
}

- (id)addPodcastWithTitle:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  MTNotificationPodcast *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MTNotificationPodcast initWithUuid:title:]([MTNotificationPodcast alloc], "initWithUuid:title:", v6, v7);

  -[MTNotificationInfo addPodcast:](self, "addPodcast:", v8);
  return v8;
}

- (void)addPodcast:(id)a3
{
  NSMutableDictionary *podcasts;
  id v4;
  id v5;

  podcasts = self->_podcasts;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  -[NSMutableDictionary setObject:forKey:](podcasts, "setObject:forKey:", v4, v5);

}

- (id)podcastForUuid:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_podcasts, "objectForKey:", a3);
}

- (NSArray)podcasts
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_podcasts, "allValues");
}

- (id)descriptionForNotificationLogging
{
  void *v3;
  id v4;
  __CFString *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationInfo podcasts](self, "podcasts"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationInfo podcasts](self, "podcasts", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "descriptionForNotificationLogging"));
          -[__CFString appendString:](v5, "appendString:", v11);

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = CFSTR("(no content)");
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcasts, 0);
}

@end
