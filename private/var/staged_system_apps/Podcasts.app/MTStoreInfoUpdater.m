@implementation MTStoreInfoUpdater

- (MTStoreInfoUpdater)init
{
  MTStoreInfoUpdater *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTStoreInfoUpdater;
  v2 = -[MTStoreInfoUpdater init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    -[MTStoreInfoUpdater setUpdateOperationQueue:](v2, "setUpdateOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreInfoUpdater updateOperationQueue](v2, "updateOperationQueue"));
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);

  }
  return v2;
}

- (NSOperationQueue)updateOperationQueue
{
  return self->_updateOperationQueue;
}

- (void)setUpdateOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateOperationQueue, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004838C;
  block[3] = &unk_1004A65A0;
  block[4] = a1;
  if (qword_1005675E8 != -1)
    dispatch_once(&qword_1005675E8, block);
  return (id)qword_1005675E0;
}

- (void)updateStoreInfoForPodcast:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MTStoreInfoUpdater *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreInfoUpdater updateOperationQueue](self, "updateOperationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012D2B4;
  v7[3] = &unk_1004A6640;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "addOperationWithBlock:", v7);

}

- (void)updateStoreInfoForEpisodesAndPodcast:(id)a3 skipPodcastLastCheckDate:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MTStoreInfoUpdater *v14;
  BOOL v15;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "importContext"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012D604;
  v11[3] = &unk_1004A7740;
  v12 = v8;
  v13 = v6;
  v15 = a4;
  v14 = self;
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "performBlockAndWait:", v11);

}

- (void)updateStoreInfoForEpisodesInPodcast:(id)a3 withEpisodeIds:(id)a4 andEpisodesWithGuid:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  MTStoreInfoUpdater *v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "importContext"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10012DB9C;
  v17[3] = &unk_1004A8AE8;
  v18 = v12;
  v19 = v8;
  v20 = self;
  v21 = v10;
  v22 = v9;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  v16 = v12;
  objc_msgSend(v16, "performBlockAndWait:", v17);

}

- (BOOL)updateAdamId:(id)a3 forEpisode:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if (v5
    && (uint64_t)objc_msgSend(v5, "longLongValue") >= 1
    && (v7 = objc_msgSend(v5, "longLongValue"), v8 = objc_msgSend(v6, "storeTrackId"), v8 != v7))
  {
    v11 = _MTLogCategoryDatabase(v8);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
      v14 = 134218242;
      v15 = v7;
      v16 = 2112;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating store track id %lld for episode %@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v6, "setStoreTrackId:", v7);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = kMTEpisodeEntityName;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v3));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setFetchBatchSize:", 200);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:", v4, 1));

  v7 = kEpisodeStoreTrackId;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", kMTSerpentAdamIdOffset));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K = 0 OR %K = %@)"), v7, v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AND:", v9));

  objc_msgSend(v5, "setPredicate:", v10);
  return v5;
}

- (id)episodesWithMissingAdamIdsForPodcast:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreInfoUpdater _fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:](self, "_fetchRequestForEpisodesWithMissingAdamIdsForPodcastUuid:", a3));
  v12 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v12));

  v9 = v12;
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[IMLogCategory defaultCategory](IMLogCategory, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch episodes for store info update - %@", buf, 0xCu);
    }

  }
  return v8;
}

- (void)getStoreInfoForPodcastWithAdamId:(int64_t)a3 callback:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v7 = objc_alloc((Class)IMContentLookupService);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v10 = objc_msgSend(v7, "initWithIds:", v9);

  objc_msgSend(v10, "setProfile:", kProductProfile);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012E630;
  v13[3] = &unk_1004AC0F0;
  v14 = v6;
  v15 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v10, "request:", v13);

}

- (void)getStoreInfoForEpisodesWithAdamIds:(id)a3 callback:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)IMContentLookupService), "initWithIds:", v5);
  objc_msgSend(v7, "setProfile:", kMTStoreLookupPodcastProductProfile);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012EB50;
  v10[3] = &unk_1004AC0F0;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "request:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperationQueue, 0);
}

@end
