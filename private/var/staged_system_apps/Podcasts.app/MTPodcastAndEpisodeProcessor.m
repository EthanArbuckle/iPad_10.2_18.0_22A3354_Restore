@implementation MTPodcastAndEpisodeProcessor

- (MTPodcastAndEpisodeProcessor)init
{
  MTPodcastAndEpisodeProcessor *v2;
  uint64_t v3;
  NSMutableDictionary *episodeObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPodcastAndEpisodeProcessor;
  v2 = -[MTBaseProcessor init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    episodeObservers = v2->_episodeObservers;
    v2->_episodeObservers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)stop
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTPodcastAndEpisodeProcessor;
  -[MTBaseProcessor stop](&v5, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &stru_1004AA350);

}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (id)predicate
{
  return -[MTPodcastAndEpisodeProcessor podcastPredicate](self, "podcastPredicate");
}

- (id)podcastPredicate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("podcastPredicate must be implemented by subclasses"), 0));
  objc_exception_throw(v2);
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, CFSTR("episodePredicateForPodcast must be implemented by subclasses"), 0));
  objc_exception_throw(v4);
}

- (id)episodeSortDescriptorsForPodcast:(id)a3
{
  return &__NSArray0__struct;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  -[MTPodcastAndEpisodeProcessor updateEpisodePredicatesWithDeletedIds:andInsertIds:andUpdatedIds:](self, "updateEpisodePredicatesWithDeletedIds:andInsertIds:andUpdatedIds:", a3, a4, a5);
}

- (void)updateEpisodePredicatesWithDeletedIds:(id)a3 andInsertIds:(id)a4 andUpdatedIds:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D9DBC;
  v14[3] = &unk_1004A9A80;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v15 = v11;
  v12 = v10;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)addEpisodeObserverForPodcast:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](self, "episodePredicateForPodcast:", v10));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:](self, "episodeSortDescriptorsForPodcast:", v10));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:](self, "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:", v10, v5, v6));
  objc_msgSend(v7, "setIdentifier:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v10);

  objc_sync_exit(v8);
  objc_msgSend(v7, "startObserving");

  objc_autoreleasePoolPop(v4);
}

- (void)updateEpisodeObserverForPodcast:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](self, "episodePredicateForPodcast:", v13));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate falsePredicate](NSPredicate, "falsePredicate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObserverForPodcastUuid:](self, "episodeObserverForPodcastUuid:", v13));
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "predicate"));
  v9 = v8;
  if (!v8 || (objc_msgSend(v8, "isEqual:", v5) & 1) == 0)
  {
    objc_msgSend(v7, "stop");

LABEL_7:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:](self, "episodeSortDescriptorsForPodcast:", v13));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:](self, "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:", v13, v5, v9));
    objc_msgSend(v10, "setIdentifier:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
    objc_sync_enter(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v13);

    objc_sync_exit(v11);
    objc_msgSend(v10, "startObserving");

  }
  objc_autoreleasePoolPop(v4);

}

- (void)removeEpisodeObserverForPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5, v7));

  -[MTPodcastAndEpisodeProcessor removeEpisodeObserverForPodcasts:](self, "removeEpisodeObserverForPodcasts:", v6);
}

- (void)removeEpisodeObserverForPodcasts:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v4);
  if (objc_msgSend(v14, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v14;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

          if (v12)
          {
            objc_msgSend(v12, "stop");
            -[NSMutableArray addObject:](v5, "addObject:", v10);
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
    objc_msgSend(v13, "removeObjectsForKeys:", v5);

  }
  objc_sync_exit(v4);

}

- (id)createEpisodeObserverForPodcastUuid:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTUuidQueryObserver *v11;
  MTUuidQueryObserver *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [MTUuidQueryObserver alloc];
  v12 = -[MTUuidQueryObserver initWithEntityName:predicate:sortDescriptors:](v11, "initWithEntityName:predicate:sortDescriptors:", kMTEpisodeEntityName, v9, v10);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DA5F4;
  v16[3] = &unk_1004AA3A0;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  v13 = v8;
  v17 = v13;
  v14 = -[MTUuidQueryObserver addResultsChangedHandler:](v12, "addResultsChangedHandler:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ must be implemented by subclasses"), v15));

  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSGenericException, v16, 0));
  objc_exception_throw(v17);
}

- (id)episodeObserverForPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (id)podcastUuids
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000467AC;
  v9 = sub_100046A4C;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DA960;
  v4[3] = &unk_1004A97D8;
  v4[4] = &v5;
  -[MTBaseProcessor results:](self, "results:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)episodeUuids
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000467AC;
  v12 = sub_100046A4C;
  v13 = objc_alloc_init((Class)NSMutableSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DAAC0;
  v7[3] = &unk_1004AA3C8;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  objc_sync_exit(v3);
  v5 = objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSMutableDictionary)episodeObservers
{
  return self->_episodeObservers;
}

- (void)setEpisodeObservers:(id)a3
{
  objc_storeStrong((id *)&self->_episodeObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeObservers, 0);
}

@end
