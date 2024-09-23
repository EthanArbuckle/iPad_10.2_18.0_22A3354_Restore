@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__queryStringToQueryDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSPersistentStringForMTPlayReason();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("playReason"));

  v9 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v4, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScheme:", v10);

  objc_msgSend(v4, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHost:", v11);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __82__MTPlaybackIdentifierUtil_playbackRequestURLWithPlayReason_baseRequestURLString___block_invoke;
  v16[3] = &unk_24FD62AB0;
  v17 = v7;
  v12 = v7;
  objc_msgSend(v12, "mt_compactMap:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setQueryItems:", v13);

  objc_msgSend(v9, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __82__MTPlaybackIdentifierUtil_playbackRequestURLWithPlayReason_baseRequestURLString___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1838];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", v4, v6);

  return v7;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  objc_msgSend(v6, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__queryStringToQueryDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("enqueuerDSID"));

  }
  v12 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v6, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScheme:", v13);

  objc_msgSend(v6, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHost:", v14);

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__MTPlaybackIdentifierUtil_playbackRequestURLWithDSID_baseRequestURLString___block_invoke;
  v19[3] = &unk_24FD62AB0;
  v20 = v9;
  v15 = v9;
  objc_msgSend(v15, "mt_compactMap:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setQueryItems:", v16);

  objc_msgSend(v12, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __76__MTPlaybackIdentifierUtil_playbackRequestURLWithDSID_baseRequestURLString___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1838];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", v4, v6);

  return v7;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if (isLocalSetPlaybackQueueURLString__onceToken != -1)
      dispatch_once(&isLocalSetPlaybackQueueURLString__onceToken, &__block_literal_global_2);
    v5 = objc_msgSend((id)isLocalSetPlaybackQueueURLString__commandsSupported, "containsObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __61__MTPlaybackIdentifierUtil_isLocalSetPlaybackQueueURLString___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("playPodcast");
  v2[1] = CFSTR("playPodcasts");
  v2[2] = CFSTR("playStation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isLocalSetPlaybackQueueURLString__commandsSupported;
  isLocalSetPlaybackQueueURLString__commandsSupported = v0;

}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("subscribe"));

  return v5;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("playItem"));

  return v5;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4)
    v4 = (id)*MEMORY[0x24BE82360];
  -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("playPodcasts"), CFSTR("playbackOrder"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("playPodcast"), CFSTR("storeTrackId"), a3);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4
{
  return -[MTPlaybackIdentifierUtil localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:](self, "localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:", a3, 0, a4);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length") || objc_msgSend(v9, "length"))
  {
    -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", v8, 0, 0, v9, 0, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", 0, a3, a4, 0, a5, a6, a7);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", a3, a4, a5, 0, 0, 0, *MEMORY[0x24BE82360]);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", a3, a4, a5, 0, 0, 0, a6);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9
{
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:](self, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:", a3, a4, a5, a6, a7, a8, 0, 0, a9);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10
{
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:](self, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:", a3, a4, a5, a6, a7, a8, a9, a10, *MEMORY[0x24BE82360]);
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  if (!objc_msgSend(v20, "length"))
  {
    v21 = (id)*MEMORY[0x24BE82360];

    v20 = v21;
  }
  v22 = objc_msgSend(v18, "length");
  v23 = objc_msgSend(v16, "length");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("playbackOrder"));
  if (!v23)
  {
    if (!v22)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mainOrPrivateContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__2;
    v45 = __Block_byref_object_dispose__2;
    v46 = 0;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __187__MTPlaybackIdentifierUtil__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder___block_invoke;
    v37[3] = &unk_24FD62828;
    v27 = v26;
    v38 = v27;
    v39 = v18;
    v40 = &v41;
    objc_msgSend(v27, "performBlockAndWait:", v37);
    if (objc_msgSend((id)v42[5], "length"))
      objc_msgSend(v24, "setObject:forKey:", v42[5], CFSTR("uuid"));

    _Block_object_dispose(&v41, 8);
    goto LABEL_10;
  }
  objc_msgSend(v24, "setObject:forKey:", v16, CFSTR("uuid"));
  if (v22)
LABEL_10:
    objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("episodeUuid"));
LABEL_11:
  if (objc_msgSend(v17, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "__stringWithPercentEscape:", v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v28, CFSTR("podcastFeedUrl"));

  }
  if (objc_msgSend(v19, "length"))
    objc_msgSend(v24, "setObject:forKey:", v19, CFSTR("episodeGuid"));
  v29 = *MEMORY[0x24BE73A18];
  if (a5 && v29 != a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v30, CFSTR("storeCollectionId"));

  }
  if (a8 && v29 != a8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v31, CFSTR("storeTrackId"));

  }
  NSPersistentStringForMTEpisodeContext();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v32, CFSTR("context"));

  NSPersistentStringForMTEpisodeContextSortType();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v33, CFSTR("contextSortType"));

  -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playPodcast"), v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

void __187__MTPlaybackIdentifierUtil__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "episodeForUuid:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "podcast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
    v6 = (id)*MEMORY[0x24BE82360];
  v12[0] = CFSTR("storeCollectionId");
  v12[1] = CFSTR("playbackOrder");
  v13[0] = a3;
  v13[1] = v6;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playPodcast"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("subscribe"), CFSTR("storeCollectionId"), a3);
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "__stringWithPercentEscape:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("subscribe"), CFSTR("podcastFeedUrl"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3
{
  return -[MTPlaybackIdentifierUtil localPlaybackQueueIdentifierForStationUuid:episodeUuid:](self, "localPlaybackQueueIdentifierForStationUuid:episodeUuid:", a3, 0);
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:](self, "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:", a3, a4, 0, 0, 0);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:](self, "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:", a3, 0, a4, a5, a6);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = (void *)MEMORY[0x24BDBCED8];
  v15 = a3;
  objc_msgSend(v14, "dictionaryWithCapacity:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("uuid"));

  if (objc_msgSend(v11, "length"))
    objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("episodeUuid"));
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("episodeGuid"));
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "__stringWithPercentEscape:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("podcastFeedUrl"));

  }
  -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playStation"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pf_queryAsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE73800]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeTrackId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeUuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUuid:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeGuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEpisodeGuid:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByRemovingPercentEscapes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEpisodeTitle:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByRemovingPercentEscapes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPodcastTitle:", v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByRemovingPercentEscapes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByRemovingPercentEscapes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPodcastFeedUrl:", v15);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamUrl"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByRemovingPercentEscapes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByRemovingPercentEscapes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreamUrl:", v18);

  objc_msgSend(MEMORY[0x24BE73808], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "findEpisodeWithRequest:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pf_queryAsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByRemovingPercentEscapes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByRemovingPercentEscapes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storeCollectionId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mainOrPrivateContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE73838]), "initWithFeedUrl:storeIdentifier:", v8, v11);
  v15 = objc_alloc(MEMORY[0x24BDBB678]);
  v16 = (void *)objc_msgSend(v15, "initWithEntityName:", *MEMORY[0x24BE739F8]);
  objc_msgSend(MEMORY[0x24BE73820], "predicateForIdentifer:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v17);

  objc_msgSend(v16, "setFetchLimit:", 1);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __76__MTPlaybackIdentifierUtil_podcastUuidForSetPlaybackQueueRequestIdentifier___block_invoke;
  v24[3] = &unk_24FD62AF8;
  v18 = v13;
  v25 = v18;
  v19 = v16;
  v26 = v19;
  v27 = &v35;
  v28 = &v29;
  objc_msgSend(v18, "performBlockAndWait:", v24);
  if (v36[5])
  {
    _MTLogCategoryDatabase();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v36[5];
      *(_DWORD *)buf = 138412290;
      v42 = v21;
      _os_log_impl(&dword_22FB0C000, v20, OS_LOG_TYPE_ERROR, "Error fetching podcast for playback identifier: %@", buf, 0xCu);
    }

    v22 = 0;
  }
  else
  {
    v22 = (id)v30[5];
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

void __76__MTPlaybackIdentifierUtil_podcastUuidForSetPlaybackQueueRequestIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _MRSystemAppPlaybackQueue *v7;

  v4 = a3;
  +[MTSingleton sharedInstance](MTAccountController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDsid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTPlaybackIdentifierUtil playbackQueueWithDsid:forIdentifiers:](self, "playbackQueueWithDsid:forIdentifiers:", v6, v4);

  return v7;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4
{
  id v5;
  _MRSystemAppPlaybackQueue *v6;
  CFDictionaryRef v7;
  id v9;
  void *keys;

  v5 = a4;
  v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate();
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers();

  if (a3)
  {
    v9 = a3;
    keys = CFSTR("enqueuerDSID");
    v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, MEMORY[0x24BDBD6B0]);
    MRSystemAppPlaybackQueueSetUserInfo();
    CFRelease(v7);
  }
  return v6;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;

  v3 = _playQueueTypeForRequestURL__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_playQueueTypeForRequestURL__onceToken, &__block_literal_global_71);
  v5 = (void *)_playQueueTypeForRequestURL__map;
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &unk_24FD6BE90;
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  return v11;
}

void __56__MTPlaybackIdentifierUtil__playQueueTypeForRequestURL___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("playPodcasts");
  v2[1] = CFSTR("playPodcast");
  v3[0] = &unk_24FD6BE48;
  v3[1] = &unk_24FD6BE60;
  v2[2] = CFSTR("playStation");
  v3[2] = &unk_24FD6BE78;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_playQueueTypeForRequestURL__map;
  _playQueueTypeForRequestURL__map = v0;

}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16[0] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v7, "setScheme:", CFSTR("podcasts"));
  v20 = v5;
  objc_msgSend(v7, "setHost:", v5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x24BDD1838]);
        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithName:value:", v14, v16);

        objc_msgSend(v8, "addObject:", v17);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "setQueryItems:", v8);
  objc_msgSend(v7, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82368]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82370]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_playReasonFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = MTPlayReasonFromPersistentString();
  else
    v4 = 0;

  return v4;
}

- (int64_t)_episodeContextFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = MTEpisodeContextFromPersistentString();
  else
    v4 = 0;

  return v4;
}

- (int64_t)_episodeContextSortFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = MTEpisodeContextSortTypeFromPersistentString();
  else
    v4 = 0;

  return v4;
}

+ (id)__stringWithPercentEscape:(id)a3
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)a3, 0, CFSTR("\uFFFC!$&'()+,/:;=?@"),
                                               0x8000100u));
}

+ (id)__stringByRemovingPercentEscapes:(id)a3
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)a3, &stru_24FD64198);
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("="));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          objc_msgSend(v9, "objectAtIndex:", 1);
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v12;
        }
        objc_msgSend(v4, "setObject:forKey:", v11, v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

@end
