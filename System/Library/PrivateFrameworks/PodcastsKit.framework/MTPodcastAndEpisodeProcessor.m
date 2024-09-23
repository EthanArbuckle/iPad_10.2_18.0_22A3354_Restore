@implementation MTPodcastAndEpisodeProcessor

- (MTPodcastAndEpisodeProcessor)init
{
  MTPodcastAndEpisodeProcessor *v2;
  uint64_t v3;
  NSMutableDictionary *episodeObservers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTPodcastAndEpisodeProcessor;
  v2 = -[MTBaseProcessor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
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
  -[MTBaseProcessor stop](&v5, sel_stop);
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global);

}

uint64_t __36__MTPodcastAndEpisodeProcessor_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

- (id)entityName
{
  return (id)*MEMORY[0x24BE739F8];
}

- (id)podcastPredicate
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("podcastPredicate must be implemented by subclasses"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("episodePredicateForPodcast must be implemented by subclasses"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)episodeSortDescriptorsForPodcast:(id)a3
{
  return (id)MEMORY[0x24BDBD1A8];
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
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __97__MTPodcastAndEpisodeProcessor_updateEpisodePredicatesWithDeletedIds_andInsertIds_andUpdatedIds___block_invoke;
  v14[3] = &unk_24FD625A0;
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

void __97__MTPodcastAndEpisodeProcessor_updateEpisodePredicatesWithDeletedIds_andInsertIds_andUpdatedIds___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x2348A9D28]();
    objc_msgSend(WeakRetained, "removeEpisodeObserverForPodcasts:", *(_QWORD *)(a1 + 32));
    objc_autoreleasePoolPop(v3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(id *)(a1 + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(WeakRetained, "updateEpisodeObserverForPodcast:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v6);
    }

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = *(id *)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(WeakRetained, "addEpisodeObserverForPodcast:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v11);
    }

  }
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
  v4 = (void *)MEMORY[0x2348A9D28]();
  -[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](self, "episodePredicateForPodcast:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "falsePredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:](self, "episodeSortDescriptorsForPodcast:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPodcastAndEpisodeProcessor createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:](self, "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:", v10, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIdentifier:", v10);
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  v4 = (void *)MEMORY[0x2348A9D28]();
  -[MTPodcastAndEpisodeProcessor episodePredicateForPodcast:](self, "episodePredicateForPodcast:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "falsePredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MTPodcastAndEpisodeProcessor episodeObserverForPodcastUuid:](self, "episodeObserverForPodcastUuid:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v6, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || (objc_msgSend(v8, "isEqual:", v5) & 1) == 0)
  {
    objc_msgSend(v7, "stop");

LABEL_7:
    -[MTPodcastAndEpisodeProcessor episodeSortDescriptorsForPodcast:](self, "episodeSortDescriptorsForPodcast:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPodcastAndEpisodeProcessor createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:](self, "createEpisodeObserverForPodcastUuid:predicate:sortDescriptors:", v13, v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIdentifier:", v13);
    -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v11);
    -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v13);

    objc_sync_exit(v11);
    objc_msgSend(v10, "startObserving");

  }
  objc_autoreleasePoolPop(v4);

}

- (void)removeEpisodeObserverForPodcast:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v9 = a3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7, v9, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPodcastAndEpisodeProcessor removeEpisodeObserverForPodcasts:](self, "removeEpisodeObserverForPodcasts:", v8);
}

- (void)removeEpisodeObserverForPodcasts:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  if (objc_msgSend(v14, "count"))
  {
    v5 = (void *)objc_opt_new();
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
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v12, "stop");
            objc_msgSend(v5, "addObject:", v10);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
  v12 = -[MTBaseQueryObserver initWithEntityName:predicate:sortDescriptors:](v11, "initWithEntityName:predicate:sortDescriptors:", *MEMORY[0x24BE739E8], v9, v10);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v12);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke;
  v16[3] = &unk_24FD625F0;
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

void __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke_2;
  v10[3] = &unk_24FD625C8;
  objc_copyWeak(&v14, a1 + 6);
  objc_copyWeak(&v15, a1 + 5);
  v11 = a1[4];
  v8 = v5;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  objc_msgSend(WeakRetained, "enqueueWorkBlock:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);

}

void __94__MTPodcastAndEpisodeProcessor_createEpisodeObserverForPodcastUuid_predicate_sortDescriptors___block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v2, "episodeUuidObserver:resultsChangedForPodcast:withDeletedIds:andInsertIds:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ must be implemented by subclasses"), v15);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], v16, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v17);
}

- (id)episodeObserverForPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__MTPodcastAndEpisodeProcessor_podcastUuids__block_invoke;
  v4[3] = &unk_24FD62618;
  v4[4] = &v5;
  -[MTBaseProcessor results:](self, "results:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__MTPodcastAndEpisodeProcessor_podcastUuids__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "valueForKey:", *MEMORY[0x24BE73B80]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)episodeUuids
{
  void *v3;
  void *v4;
  void *v5;
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
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[MTPodcastAndEpisodeProcessor episodeObservers](self, "episodeObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__MTPodcastAndEpisodeProcessor_episodeUuids__block_invoke;
  v7[3] = &unk_24FD62640;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  objc_sync_exit(v3);
  v5 = (void *)objc_msgSend((id)v9[5], "copy");
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__MTPodcastAndEpisodeProcessor_episodeUuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a3, "uuids");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

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
