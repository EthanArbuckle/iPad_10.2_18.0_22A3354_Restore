@implementation MTLibraryQuery

- (MTLibraryQuery)init
{
  MTLibraryQuery *v2;
  MTLibraryQuery *v3;
  MTLibraryQuery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLibraryQuery;
  v2 = -[MTLibraryQuery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_active = 1;
    v2->_fetchLimit = 0;
    v4 = v2;
  }

  return v3;
}

- (void)runQueryWithPodcastPredicate:(id)a3 episodePredicate:(id)a4 channelPredicate:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[MTLibraryQuery setPodcastPredicate:](self, "setPodcastPredicate:", a3);
  -[MTLibraryQuery setEpisodePredicate:](self, "setEpisodePredicate:", v9);

  -[MTLibraryQuery setChannelPredicate:](self, "setChannelPredicate:", v8);
  -[MTLibraryQuery runQuery](self, "runQuery");
}

- (void)runQuery
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainOrPrivateContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[MTLibraryQuery runQueryInContext:](self, "runQueryInContext:", v4);
}

- (void)runQueryInContext:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSPredicate *v8;
  NSPredicate *v9;
  NSPredicate *v10;
  NSPredicate *v11;
  NSArray *v12;
  id v13;
  NSPredicate *v14;
  NSArray *v15;
  NSPredicate *v16;
  NSArray *v17;
  void (**action)(id, uint64_t, uint64_t, uint64_t);
  _QWORD v19[4];
  NSPredicate *v20;
  NSArray *v21;
  MTLibraryQuery *v22;
  id v23;
  NSPredicate *v24;
  NSArray *v25;
  NSPredicate *v26;
  NSArray *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4;
  v47 = __Block_byref_object_dispose__4;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v5 = self->_episodeSortDescriptors;
  v6 = self->_podcastSortDescriptors;
  v7 = self->_channelSortDescriptors;
  v8 = self->_podcastPredicate;
  v9 = self->_episodePredicate;
  v10 = self->_channelPredicate;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __36__MTLibraryQuery_runQueryInContext___block_invoke;
  v19[3] = &unk_24FD62D68;
  v11 = v8;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  v22 = self;
  v28 = &v37;
  v13 = v4;
  v23 = v13;
  v29 = &v31;
  v14 = v9;
  v24 = v14;
  v30 = &v43;
  v15 = v5;
  v25 = v15;
  v16 = v10;
  v26 = v16;
  v17 = v7;
  v27 = v17;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  action = (void (**)(id, uint64_t, uint64_t, uint64_t))self->_action;
  if (action)
    action[2](action, v38[5], v44[5], v32[5]);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __36__MTLibraryQuery_runQueryInContext___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc(MEMORY[0x24BDBB678]);
    v3 = (void *)objc_msgSend(v2, "initWithEntityName:", *MEMORY[0x24BE739F8]);
    objc_msgSend(v3, "setPredicate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setResultType:", 0);
    objc_msgSend(v3, "setSortDescriptors:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
    v33[0] = *MEMORY[0x24BE73AA8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRelationshipKeyPathsForPrefetching:", v4);

    objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
    v5 = *(void **)(a1 + 56);
    v31 = 0;
    objc_msgSend(v5, "executeFetchRequest:error:", v3, &v31);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v31;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v6;

    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    if (!v10)
    {
      objc_msgSend(v7, "logAndThrow:", 1);
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v15), "channel", (_QWORD)v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16
            && objc_msgSend(v16, "showCount") >= 2
            && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "containsObject:", v17) & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "addObject:", v17);
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v13);
    }

  }
  v18 = *(_QWORD *)(a1 + 64);
  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", *MEMORY[0x24BE739E8], v18, *(_QWORD *)(a1 + 72), 0, objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  v22 = *(_QWORD *)(a1 + 80);
  if (v22)
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 56), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", *MEMORY[0x24BE739E0], v22, *(_QWORD *)(a1 + 88), 0, objc_msgSend(*(id *)(a1 + 48), "fetchLimit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v24);

  }
  objc_msgSend(*(id *)(a1 + 48), "setPodcastResults:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), (_QWORD)v27);
  objc_msgSend(*(id *)(a1 + 48), "setEpisodeResults:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40));
  v25 = *(void **)(a1 + 48);
  v26 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), "copy");
  objc_msgSend(v25, "setChannelResults:", v26);

}

- (NSArray)podcastResults
{
  return self->_podcastResults;
}

- (void)setPodcastResults:(id)a3
{
  objc_storeStrong((id *)&self->_podcastResults, a3);
}

- (NSArray)episodeResults
{
  return self->_episodeResults;
}

- (void)setEpisodeResults:(id)a3
{
  objc_storeStrong((id *)&self->_episodeResults, a3);
}

- (NSArray)channelResults
{
  return self->_channelResults;
}

- (void)setChannelResults:(id)a3
{
  objc_storeStrong((id *)&self->_channelResults, a3);
}

- (NSPredicate)podcastPredicate
{
  return self->_podcastPredicate;
}

- (void)setPodcastPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_podcastPredicate, a3);
}

- (NSPredicate)episodePredicate
{
  return self->_episodePredicate;
}

- (void)setEpisodePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_episodePredicate, a3);
}

- (NSPredicate)channelPredicate
{
  return self->_channelPredicate;
}

- (void)setChannelPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_channelPredicate, a3);
}

- (NSArray)podcastSortDescriptors
{
  return self->_podcastSortDescriptors;
}

- (void)setPodcastSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_podcastSortDescriptors, a3);
}

- (NSArray)episodeSortDescriptors
{
  return self->_episodeSortDescriptors;
}

- (void)setEpisodeSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_episodeSortDescriptors, a3);
}

- (NSArray)channelSortDescriptors
{
  return self->_channelSortDescriptors;
}

- (void)setChannelSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_channelSortDescriptors, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(int64_t)a3
{
  self->_fetchLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_channelSortDescriptors, 0);
  objc_storeStrong((id *)&self->_episodeSortDescriptors, 0);
  objc_storeStrong((id *)&self->_podcastSortDescriptors, 0);
  objc_storeStrong((id *)&self->_channelPredicate, 0);
  objc_storeStrong((id *)&self->_episodePredicate, 0);
  objc_storeStrong((id *)&self->_podcastPredicate, 0);
  objc_storeStrong((id *)&self->_channelResults, 0);
  objc_storeStrong((id *)&self->_episodeResults, 0);
  objc_storeStrong((id *)&self->_podcastResults, 0);
}

@end
