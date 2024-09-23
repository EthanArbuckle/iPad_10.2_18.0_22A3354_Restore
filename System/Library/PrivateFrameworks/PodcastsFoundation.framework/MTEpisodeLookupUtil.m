@implementation MTEpisodeLookupUtil

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance_instance;
}

void __37__MTEpisodeLookupUtil_sharedInstance__block_invoke()
{
  MTEpisodeLookupUtil *v0;
  void *v1;

  v0 = objc_alloc_init(MTEpisodeLookupUtil);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (id)findEpisodeWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainOrPrivateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTEpisodeLookupUtil findEpisodeWithRequest:context:](self, "findEpisodeWithRequest:context:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)findEpisodeWithRequest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length")
    || (+[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MTEpisodeLookupUtil _episodeMatchFromPredicate:](self, "_episodeMatchFromPredicate:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    v11 = objc_msgSend(v6, "storeTrackId");
    if (!+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v11)
      || (+[MTEpisode predicateForEpisodeStoreTrackId:](MTEpisode, "predicateForEpisodeStoreTrackId:", v11), v12 = (void *)objc_claimAutoreleasedReturnValue(), -[MTEpisodeLookupUtil _episodeMatchFromPredicate:context:](self, "_episodeMatchFromPredicate:context:", v12, v7), v10 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v10))
    {
      if (!objc_msgSend(v6, "persistentID"))
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "persistentID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTEpisode predicateForPersistentId:](MTEpisode, "predicateForPersistentId:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[MTEpisodeLookupUtil _episodeMatchFromPredicate:context:](self, "_episodeMatchFromPredicate:context:", v14, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_7:
        objc_msgSend(v6, "podcastFeedUrl");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "episodeGuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length") && objc_msgSend(v16, "length"))
        {
          -[MTEpisodeLookupUtil findPodcastWithFeedUrl:](self, "findPodcastWithFeedUrl:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "uuid");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            +[MTEpisode predicateForEpisodeGuid:onPodcastUuid:](MTEpisode, "predicateForEpisodeGuid:onPodcastUuid:", v16, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            -[MTEpisodeLookupUtil _episodeMatchFromPredicate:](self, "_episodeMatchFromPredicate:", v20);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
LABEL_26:

              goto LABEL_27;
            }
          }

        }
        objc_msgSend(v6, "episodeTitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "podcastTitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "streamUrl");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "length") && objc_msgSend(v18, "length"))
        {
          +[MTPodcast predicateForPodcastWithTitle:](MTPodcast, "predicateForPodcastWithTitle:", v21);
          v34 = objc_claimAutoreleasedReturnValue();
          -[MTEpisodeLookupUtil _podcastMatchFromPredicate:](self, "_podcastMatchFromPredicate:");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            v32 = v16;
            v33 = v23;
            objc_msgSend(v23, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[MTEpisode predicateForEpisodeTitle:onPodcastUuid:](MTEpisode, "predicateForEpisodeTitle:onPodcastUuid:", v18, v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v31 = (void *)v25;
            -[MTEpisodeLookupUtil _episodeMatchFromPredicate:](self, "_episodeMatchFromPredicate:", v25);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10
              || !objc_msgSend(v22, "length")
              || (objc_msgSend(v10, "enclosureURL"),
                  v26 = (void *)objc_claimAutoreleasedReturnValue(),
                  v27 = objc_msgSend(v26, "isEqualToString:", v22),
                  v26,
                  (v27 & 1) == 0))
            {
              if (v22
                || (objc_msgSend(v10, "enclosureURL"),
                    v28 = (void *)objc_claimAutoreleasedReturnValue(),
                    v28,
                    v28))
              {

                v10 = 0;
              }
            }
            v16 = v32;
            v29 = (void *)v34;

            v23 = v33;
          }
          else
          {
            v10 = 0;
            v29 = (void *)v34;
          }

        }
        else
        {
          v10 = 0;
        }

        goto LABEL_26;
      }
    }
  }
LABEL_27:

  return v10;
}

- (id)findPodcastWithFeedUrl:(id)a3
{
  void *v4;
  void *v5;

  +[MTPodcast predicateForPodcastWithFeedUrl:](MTPodcast, "predicateForPodcastWithFeedUrl:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEpisodeLookupUtil _podcastMatchFromPredicate:](self, "_podcastMatchFromPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_podcastMatchFromPredicate:(id)a3
{
  return -[MTEpisodeLookupUtil _podcastMatchFromPredicate:context:](self, "_podcastMatchFromPredicate:context:", a3, 0);
}

- (id)_podcastMatchFromPredicate:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0C97B48];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithEntityName:", CFSTR("MTPodcast"));
  objc_msgSend(v9, "setPredicate:", v8);

  objc_msgSend(v9, "setFetchLimit:", 1);
  -[MTEpisodeLookupUtil _entityForFetchRequest:context:](self, "_entityForFetchRequest:context:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_episodeMatchFromPredicate:(id)a3
{
  return -[MTEpisodeLookupUtil _episodeMatchFromPredicate:context:](self, "_episodeMatchFromPredicate:context:", a3, 0);
}

- (id)_episodeMatchFromPredicate:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0C97B48];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithEntityName:", CFSTR("MTEpisode"));
  objc_msgSend(v9, "setPredicate:", v8);

  objc_msgSend(v9, "setFetchLimit:", 1);
  -[MTEpisodeLookupUtil _entityForFetchRequest:context:](self, "_entityForFetchRequest:context:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_entityForFetchRequest:(id)a3
{
  return -[MTEpisodeLookupUtil _entityForFetchRequest:context:](self, "_entityForFetchRequest:context:", a3, 0);
}

- (id)_entityForFetchRequest:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD *);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    +[MTDB sharedInstance](MTDB, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mainOrPrivateContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __54__MTEpisodeLookupUtil__entityForFetchRequest_context___block_invoke;
  v17 = &unk_1E54D1468;
  v20 = &v22;
  v8 = v6;
  v18 = v8;
  v9 = v5;
  v19 = v9;
  v21 = &v28;
  objc_msgSend(v8, "performBlockAndWait:", &v14);
  if (v29[5])
  {
    _MTLogCategoryDatabase();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v29[5];
      *(_DWORD *)buf = 138412290;
      v35 = v11;
      _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_DEFAULT, "Error fetching entity: %@", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    objc_msgSend((id)v23[5], "firstObject", v14, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __54__MTEpisodeLookupUtil__entityForFetchRequest_context___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
