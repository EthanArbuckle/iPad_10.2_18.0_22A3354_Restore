@implementation MTPlaybackQueueFactory

+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  if (a3 == 1)
    return 0;
  return MTPlaybackContinuousPlaybackEnabled(a1, a2);
}

+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10000D984;
  v27 = sub_10000D994;
  v28 = 0;
  if (a4 == 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_oldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:", v10, 1, a5, v11));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  }
  else if (a4 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_latestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:", v10, 0, a5, v11));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v10, a5, v11));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "episodeUuid"));
  }
  v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000D99C;
  v19[3] = &unk_100028C88;
  v15 = v11;
  v20 = v15;
  v16 = v10;
  v21 = v16;
  v22 = &v23;
  objc_msgSend(v15, "performBlockAndWait:", v19);
  v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return objc_msgSend(a1, "_latestOrOldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:latest:ctx:", a3, a4, a5, 1, a6);
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return objc_msgSend(a1, "_latestOrOldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:latest:ctx:", a3, a4, a5, 0, a6);
}

+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7
{
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v11 = a3;
  v12 = a7;
  if (objc_msgSend(v11, "length"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_10000D984;
    v26 = sub_10000D994;
    v27 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000DB54;
    v15[3] = &unk_100028F38;
    v16 = v12;
    v20 = a4;
    v17 = v11;
    v18 = &v22;
    v21 = a6;
    v19 = a5;
    objc_msgSend(v16, "performBlockAndWait:", v15);
    v13 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_uuidForEpisode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10000D984;
  v15 = sub_10000D994;
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DD00;
  v8[3] = &unk_100028F60;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end
