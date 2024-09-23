@implementation MTPlaybackQueueFactory

+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  if (a3 == 1)
    return 0;
  return MTPlaybackContinuousPlaybackEnabled();
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
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  if (a4 == 2)
  {
    objc_msgSend(a1, "_oldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:", v10, 1, a5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 == 1)
    {
      objc_msgSend(a1, "_latestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:", v10, 0, a5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE73830], "upNextForPodcastUuid:excludeExplicit:ctx:", v10, a5, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "episodeUuid");
    }
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __89__MTPlaybackQueueFactory__episodeToPlayForPodcastUuid_playbackOrder_excludeExplicit_ctx___block_invoke;
  v19[3] = &unk_24FD62828;
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

void __89__MTPlaybackQueueFactory__episodeToPlayForPodcastUuid_playbackOrder_excludeExplicit_ctx___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hidden"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
}

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return (id)objc_msgSend(a1, "_latestOrOldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:latest:ctx:", a3, a4, a5, 1, a6);
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return (id)objc_msgSend(a1, "_latestOrOldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:latest:ctx:", a3, a4, a5, 0, a6);
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
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    v27 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __113__MTPlaybackQueueFactory__latestOrOldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_latest_ctx___block_invoke;
    v15[3] = &unk_24FD62850;
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

void __113__MTPlaybackQueueFactory__latestOrOldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_latest_ctx___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  v8 = v2;
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 65))
      objc_msgSend(v2, "newestUserEpisodeExcludingExplicit:", v3);
    else
      objc_msgSend(v2, "oldestUserEpisodeExcludingExplicit:", v3);
  }
  else if (*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(v2, "newestEpisodeExcludingUuid:excludeExplicit:", 0, v3);
  }
  else
  {
    objc_msgSend(v2, "oldestEpisodeExcludingExplicit:", v3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = v4;
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

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
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__MTPlaybackQueueFactory__uuidForEpisode___block_invoke;
  v8[3] = &unk_24FD62878;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __42__MTPlaybackQueueFactory__uuidForEpisode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
