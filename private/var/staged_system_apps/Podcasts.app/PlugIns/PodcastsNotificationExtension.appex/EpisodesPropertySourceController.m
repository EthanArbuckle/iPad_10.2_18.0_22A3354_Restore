@implementation EpisodesPropertySourceController

- (EpisodesPropertySourceController)initWithNotification:(id)a3 keepSorted:(BOOL)a4
{
  id v7;
  EpisodesPropertySourceController *v8;
  EpisodesPropertySourceController *v9;
  uint64_t v10;
  NSMutableArray *backgroundEpisodeUuidFetches;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EpisodesPropertySourceController;
  v8 = -[EpisodesPropertySourceController init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notification, a3);
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    backgroundEpisodeUuidFetches = v9->_backgroundEpisodeUuidFetches;
    v9->_backgroundEpisodeUuidFetches = (NSMutableArray *)v10;

    v9->_keepSorted = a4;
    -[EpisodesPropertySourceController _loadEpisodePropertySourcesFromNotificationInfo](v9, "_loadEpisodePropertySourcesFromNotificationInfo");
  }

  return v9;
}

- (int64_t)countOfEpisodePropertySources
{
  return -[NSArray count](self->_orderedEpisodePropertySources, "count");
}

- (id)episodePropertySourceAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_orderedEpisodePropertySources, "objectAtIndex:", a3);
}

- (id)firstEpisodePropertySource
{
  return -[NSArray firstObject](self->_orderedEpisodePropertySources, "firstObject");
}

- (id)firstEpisodePropertySourcePassingTest:(id)a3
{
  id v4;
  void *v5;
  NSArray *orderedEpisodePropertySources;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002A8C;
    v9[3] = &unk_100028898;
    v10 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray mt_firstObjectPassingTest:](orderedEpisodePropertySources, "mt_firstObjectPassingTest:", v9));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)indexOfPropertySourcePassingTest:(id)a3
{
  id v4;
  void *v5;
  NSArray *orderedEpisodePropertySources;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002B28;
    v9[3] = &unk_100028898;
    v10 = v4;
    v7 = -[NSArray indexOfObjectPassingTest:](orderedEpisodePropertySources, "indexOfObjectPassingTest:", v9);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)beginLoadingFromDatabaseInBackground
{
  -[EpisodesPropertySourceController _loadEpisodePropertySourcesFromDatabaseInBackground](self, "_loadEpisodePropertySourcesFromDatabaseInBackground");
}

- (void)_loadEpisodePropertySourcesFromNotificationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NotificationEpisodePropertySource *v14;
  NotificationEpisodePropertySource *v15;
  NSArray *v16;
  NSArray *orderedEpisodePropertySources;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_notificationEpisodes"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12);
        v14 = [NotificationEpisodePropertySource alloc];
        v15 = -[NotificationEpisodePropertySource initWithNotification:episode:](v14, "initWithNotification:episode:", v3, v13, (_QWORD)v18);
        if (v15)
          objc_msgSend(v7, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController _sourceByApplyingDefaultOrderingToPropertySources:](self, "_sourceByApplyingDefaultOrderingToPropertySources:", v7));
  orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
  self->_orderedEpisodePropertySources = v16;

}

- (void)_loadEpisodePropertySourcesFromDatabaseInBackground
{
  NSArray *orderedEpisodePropertySources;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  _QWORD v11[5];

  orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002E0C;
  v11[3] = &unk_1000288C0;
  v11[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray mt_compactMap:](orderedEpisodePropertySources, "mt_compactMap:", v11));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController backgroundEpisodeUuidFetches](self, "backgroundEpisodeUuidFetches"));
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002E9C;
  v7[3] = &unk_100028910;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  +[DatabaseEpisodePropertySource fetchSourceForEpisodeUuids:completion:](DatabaseEpisodePropertySource, "fetchSourceForEpisodeUuids:completion:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_didFetchEpisodePropertySources:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v21 = a3;
  v4 = objc_msgSend(v21, "count");
  v5 = v21;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mt_compactMap:", &stru_100028950));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController orderedEpisodePropertySources](self, "orderedEpisodePropertySources"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000321C;
    v22[3] = &unk_100028978;
    v8 = v6;
    v23 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexesOfObjectsPassingTest:", v22));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController orderedEpisodePropertySources](self, "orderedEpisodePropertySources"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mt_allObjectsExcludingIndexes:", v9));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v21));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController _sourceByApplyingDefaultOrderingToPropertySources:](self, "_sourceByApplyingDefaultOrderingToPropertySources:", v12));

    v14 = objc_msgSend(v13, "count");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController orderedEpisodePropertySources](self, "orderedEpisodePropertySources"));
    v16 = objc_msgSend(v15, "count");

    if (v14 == v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController orderedEpisodePropertySources](self, "orderedEpisodePropertySources"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mt_compactMap:", &stru_100028998));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mt_compactMap:", &stru_1000289B8));
      v20 = objc_msgSend(v18, "isEqualToArray:", v19);

      objc_storeStrong((id *)&self->_orderedEpisodePropertySources, v13);
      if ((v20 & 1) != 0)
      {
        -[EpisodesPropertySourceController _didUpdateEpisodePropertySourcesAtIndexes:](self, "_didUpdateEpisodePropertySourcesAtIndexes:", v9);
LABEL_7:

        v5 = v21;
        goto LABEL_8;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_orderedEpisodePropertySources, v13);
    }
    -[EpisodesPropertySourceController _didUpdateEpisodePropertySourcesNeedingFullReload](self, "_didUpdateEpisodePropertySourcesNeedingFullReload");
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_sourceByApplyingDefaultOrderingToPropertySources:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController _sortDescriptorsForDefaultOrdering](self, "_sortDescriptorsForDefaultOrdering"));
  if (v5)
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5));
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (id)_sortDescriptorsForDefaultOrdering
{
  NSArray *cachedSortDescriptors;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  if (-[EpisodesPropertySourceController keepSorted](self, "keepSorted"))
  {
    cachedSortDescriptors = self->_cachedSortDescriptors;
    if (!cachedSortDescriptors)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotification request](self->_notification, "request"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_podcastUuid"));

      v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[BaseEpisodePropertySource defaultSortOrderSortDescriptorsForPodcastUuid:](BaseEpisodePropertySource, "defaultSortOrderSortDescriptorsForPodcastUuid:", v6));
      v8 = self->_cachedSortDescriptors;
      self->_cachedSortDescriptors = v7;

      cachedSortDescriptors = self->_cachedSortDescriptors;
    }
    v9 = cachedSortDescriptors;
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_didUpdateEpisodePropertySourcesNeedingFullReload
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController delegate](self, "delegate"));
  objc_msgSend(v3, "episodesPropertySourceControllerDidUpdatingNeedingFullReload:", self);

}

- (void)_didUpdateEpisodePropertySourcesAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EpisodesPropertySourceController delegate](self, "delegate"));
  objc_msgSend(v5, "episodesPropertySourceController:didUpdateEpisodePropertySourcesAtIndexes:", self, v4);

}

- (UNNotification)notification
{
  return self->_notification;
}

- (BOOL)keepSorted
{
  return self->_keepSorted;
}

- (EpisodesPropertySourceControllerDelegate)delegate
{
  return (EpisodesPropertySourceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)cachedSortDescriptors
{
  return self->_cachedSortDescriptors;
}

- (void)setCachedSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSortDescriptors, a3);
}

- (NSArray)orderedEpisodePropertySources
{
  return self->_orderedEpisodePropertySources;
}

- (void)setOrderedEpisodePropertySources:(id)a3
{
  objc_storeStrong((id *)&self->_orderedEpisodePropertySources, a3);
}

- (NSMutableArray)backgroundEpisodeUuidFetches
{
  return self->_backgroundEpisodeUuidFetches;
}

- (void)setBackgroundEpisodeUuidFetches:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEpisodeUuidFetches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEpisodeUuidFetches, 0);
  objc_storeStrong((id *)&self->_orderedEpisodePropertySources, 0);
  objc_storeStrong((id *)&self->_cachedSortDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
