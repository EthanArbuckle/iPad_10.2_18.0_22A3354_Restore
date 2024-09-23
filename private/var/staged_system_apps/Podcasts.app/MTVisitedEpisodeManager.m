@implementation MTVisitedEpisodeManager

- (MTVisitedEpisodeManager)init
{
  MTVisitedEpisodeManager *v2;
  id v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTVisitedEpisodeManager;
  v2 = -[MTVisitedEpisodeManager init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableSet);
    -[MTVisitedEpisodeManager setStartedEpisodeUuids:](v2, "setStartedEpisodeUuids:", v3);

    v4 = objc_alloc_init((Class)NSMutableSet);
    -[MTVisitedEpisodeManager setEndedEpisodeUuids:](v2, "setEndedEpisodeUuids:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "flushVisitedEpisodes", MTApplicationWillResignActiveNotification, 0);

  }
  return v2;
}

- (void)endVisitingEpisode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isNew"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)startVisitingEpisode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isNew"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    objc_msgSend(v4, "addObject:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
    objc_msgSend(v6, "updateUnplayedBadgeCount");

  }
}

- (BOOL)hasEndedVisitingEpisode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (unint64_t)countOfStartedEpisodes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)countOfEndedEpisodes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)flushVisitedEpisodes
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids"));
    v6 = objc_msgSend(v5, "copy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "privateQueueContext"));

    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000D4ADC;
    v16 = &unk_1004A6640;
    v17 = v6;
    v18 = v8;
    v9 = v8;
    v10 = v6;
    objc_msgSend(v9, "performBlock:", &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager startedEpisodeUuids](self, "startedEpisodeUuids", v13, v14, v15, v16));
    objc_msgSend(v11, "removeAllObjects");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTVisitedEpisodeManager endedEpisodeUuids](self, "endedEpisodeUuids"));
    objc_msgSend(v12, "removeAllObjects");

  }
}

- (NSMutableSet)startedEpisodeUuids
{
  return self->_startedEpisodeUuids;
}

- (void)setStartedEpisodeUuids:(id)a3
{
  objc_storeStrong((id *)&self->_startedEpisodeUuids, a3);
}

- (NSMutableSet)endedEpisodeUuids
{
  return self->_endedEpisodeUuids;
}

- (void)setEndedEpisodeUuids:(id)a3
{
  objc_storeStrong((id *)&self->_endedEpisodeUuids, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endedEpisodeUuids, 0);
  objc_storeStrong((id *)&self->_startedEpisodeUuids, 0);
}

@end
