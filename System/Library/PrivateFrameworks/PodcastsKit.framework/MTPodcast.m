@implementation MTPodcast

uint64_t __62__MTPodcast_DB_App__allPossibleEpisodeListSortOrderProperties__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __42__MTPodcast_DB_App__updateCursorPosition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE73830];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upNextForPodcastUuid:excludeExplicit:ctx:", v3, 0, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "episodeUuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nextEpisodeUuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _MTLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "episodeUuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedDate");
    v15 = 138543874;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2050;
    v20 = v10;
    _os_log_impl(&dword_22FB0C000, v7, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v15, 0x20u);

  }
  _MTLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "episodeUuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_22FB0C000, v11, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v15, 0x16u);

  }
  if (v6 != v5 && (objc_msgSend(v6, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "listenNowEpisode"))
    {
      objc_msgSend(v14, "setListenNowEpisode:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v13 && (objc_msgSend(v13, "listenNowEpisode") & 1) == 0)
    {
      objc_msgSend(v13, "setListenNowEpisode:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v4, "modifiedDate");
      objc_msgSend(*(id *)(a1 + 32), "setModifiedDate:");
    }

  }
  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "saveInCurrentBlock");

}

void __53__MTPodcast_DB_App__podcastUuidForFeedUrlString_ctx___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "podcastForFeedUrl:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __40__MTPodcast_DB_App__hasAtLeastOneSeason__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *MEMORY[0x24BE739E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BE737F8];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v5);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v6 = *(void **)(a1 + 40);
  v9 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "count") != 0;

  objc_msgSend(v8, "logAndThrow:", 0);
}

void __34__MTPodcast_DB_App__seasonNumbers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_fetchRequestForDistinctSeasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v9 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  objc_msgSend(v5, "logAndThrow:", 0);
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x24BE73998]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __43__MTPodcast_DB_App__seasonTrailerInSeason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForEpisodeType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737F8], "predicateForSeasonNumberWithNoEpisodeNumber:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "AND:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE737F8], "sortDescriptorsForPubDateAscending:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", *MEMORY[0x24BE739E8], v5, v6, 0, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __73__MTPodcast_Library_App__setRemovePlayedDownloadsSetting_forPodcastUuid___block_invoke(uint64_t a1)
{
  char v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "deletePlayedEpisodesResolvedValue");
  objc_msgSend(v3, "setDeletePlayedEpisodes:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v3, "deletePlayedEpisodesResolvedValue") && (v2 & 1) == 0)
    objc_msgSend(v3, "setShowPlacardForRemovePlayedEpisodes:", 0);

}

void __52__MTPodcast_Library_App__countOfUnplayedRssEpisodes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kMTUnplayedRssEpisodesRecursionCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 <= 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("kMTUnplayedRssEpisodesRecursionCount"));

    objc_msgSend(MEMORY[0x24BE737F8], "predicateForRSSEpisodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BE737F8];
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForEpisodesOnPodcastUuid:deletePlayedEpisodes:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AND:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "countOfObjectsInEntity:predicate:", *MEMORY[0x24BE739E8], v12);
  }
  else
  {
    _MTLogCategoryDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22FB0C000, v6, OS_LOG_TYPE_FAULT, "Hit recursion guard for -[MTPodcast countOfUnplayedRssEpisodes]. Short circuiting.", v13, 2u);
    }

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24FD6BED8, CFSTR("kMTUnplayedRssEpisodesRecursionCount"));

}

@end
