@implementation MTNotificationPodcast

- (MTNotificationPodcast)initWithUuid:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  MTNotificationPodcast *v9;
  MTNotificationPodcast *v10;
  NSMutableArray *v11;
  NSMutableArray *episodes;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTNotificationPodcast;
  v9 = -[MTNotificationPodcast init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_title, a4);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    episodes = v10->_episodes;
    v10->_episodes = v11;

  }
  return v10;
}

- (void)addEpisode:(id)a3
{
  -[NSMutableArray addObject:](self->_episodes, "addObject:", a3);
}

- (NSArray)episodes
{
  return (NSArray *)self->_episodes;
}

- (id)descriptionForNotificationLogging
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationPodcast episodes](self, "episodes"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationPodcast episodes](self, "episodes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_compactMap:", &stru_1004A6B70));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationPodcast uuid](self, "uuid"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcastUuid = %@, episodeUuids = %@"), v8, v7));

  }
  else
  {
    v9 = CFSTR("(no content)");
  }
  return v9;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_episodes, 0);
}

@end
