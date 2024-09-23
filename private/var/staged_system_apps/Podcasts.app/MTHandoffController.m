@implementation MTHandoffController

- (void)continueActivity:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMPlayerManifest supportedActivityTypes](IMPlayerManifest, "supportedActivityTypes"));
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    -[MTHandoffController continuePlaybackActivity:](self, "continuePlaybackActivity:", v6);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CSSearchableItemActionType))
  {
    -[MTHandoffController continueCoreSpotlightItemActivity:](self, "continueCoreSpotlightItemActivity:", v6);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CSQueryContinuationActionType))
  {
    -[MTHandoffController continueCoreSpotlightSearchActivity:](self, "continueCoreSpotlightSearchActivity:", v6);
  }

}

- (MTHandoffController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTHandoffController;
  return -[MTHandoffController init](&v3, "init");
}

- (id)supportedActivityTypes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMPlayerManifest supportedActivityTypes](IMPlayerManifest, "supportedActivityTypes"));
  v3 = objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CSSearchableItemActionType);
  objc_msgSend(v3, "addObject:", CSQueryContinuationActionType);
  return v3;
}

- (void)continuePlaybackActivity:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100088DD4;
  v6[3] = &unk_1004A63A0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "restoreFromUserActivity:startPlayback:reason:interactive:completion:", v5, 1, 2, 0, v6);

}

- (BOOL)continueCoreSpotlightItemActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MDItemUniqueIdentifier));

  if (!objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CSSearchableItemActivityIdentifier));

    v5 = (void *)v7;
  }
  if ((unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mainOrPrivateContext"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
    objc_msgSend(v12, "dismissSearchOverlayController");

    if (objc_msgSend(v5, "hasPrefix:", CFSTR("p")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "podcastForFeedUrl:", v9));
      v8 = v13 != 0;
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
        objc_msgSend(v14, "presentPodcast:episode:podcastTab:startPlayback:animated:", v13, 0, 0, 0, 0);

        +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("spotlight"), v13, &off_1004D7588);
        v8 = 1;
      }
      goto LABEL_21;
    }
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("e")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerIdentifier"));
      if (objc_msgSend(v13, "length"))
        v15 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:onFeedURL:](MTEpisode, "predicateForEpisodeGuid:onFeedURL:", v9, v13));
      else
        v15 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:](MTEpisode, "predicateForEpisodeGuid:", v9));
      v16 = (void *)v15;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectsInEntity:predicate:sortDescriptors:", kMTEpisodeEntityName, v15, 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
      v21 = v20;
      v8 = v20 != 0;
      if (v20)
      {
        v25 = objc_msgSend(v20, "isInPodcastDetailsUnplayedTab") ^ 1;
        v26 = v16;
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "podcast"));
        objc_msgSend(v22, "presentPodcast:episode:podcastTab:startPlayback:animated:", v23, v21, v25, 0, 0);

        v16 = v26;
        +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("spotlight"), v21, &off_1004D75B0);
      }

    }
    else
    {
      if (!objc_msgSend(v5, "hasPrefix:", CFSTR("s")))
      {
        v8 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaylist predicateForVisiblePlaylistWithUUID:](MTPlaylist, "predicateForVisiblePlaylistWithUUID:", v9));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectsInEntity:predicate:sortDescriptors:", kMTPlaylistEntityName, v13, 0));
      v17 = objc_msgSend(v16, "count");
      v8 = v17 != 0;
      if (!v17)
        goto LABEL_20;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
      objc_msgSend(v19, "presentStation:new:", v18, 0);

      +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("spotlight"), v18, &off_1004D75D8);
    }

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  v8 = 0;
LABEL_23:

  return v8;
}

- (BOOL)continueCoreSpotlightSearchActivity:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CSSearchQueryString));

  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
    objc_msgSend(v6, "showSearchControllerWithSearchText:", v4);

  }
  return v5 != 0;
}

- (NSUserActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
