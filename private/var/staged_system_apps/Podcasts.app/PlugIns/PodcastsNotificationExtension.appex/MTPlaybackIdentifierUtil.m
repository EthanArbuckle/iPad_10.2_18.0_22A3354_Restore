@implementation MTPlaybackIdentifierUtil

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a4));
  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "query"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__queryStringToQueryDictionary:", v8));

  v10 = NSPersistentStringForMTPlayReason(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("playReason"));

  v12 = objc_alloc_init((Class)NSURLComponents);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  objc_msgSend(v12, "setScheme:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  objc_msgSend(v12, "setHost:", v14);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100007E6C;
  v19[3] = &unk_100028C20;
  v20 = v9;
  v15 = v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mt_compactMap:", v19));
  objc_msgSend(v12, "setQueryItems:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));
  return v17;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a4));
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__queryStringToQueryDictionary:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("enqueuerDSID"));

  }
  v13 = objc_alloc_init((Class)NSURLComponents);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
  objc_msgSend(v13, "setScheme:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
  objc_msgSend(v13, "setHost:", v15);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008080;
  v20[3] = &unk_100028C20;
  v21 = v10;
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mt_compactMap:", v20));
  objc_msgSend(v13, "setQueryItems:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));
  return v18;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  if (objc_msgSend(v4, "length"))
  {
    if (qword_100033378 != -1)
      dispatch_once(&qword_100033378, &stru_100028C60);
    v5 = objc_msgSend((id)qword_100033370, "containsObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("subscribe"));

  return v5;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("playItem"));

  return v5;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4)
    v4 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("playPodcasts"), CFSTR("playbackOrder"), v4));

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
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", v8, 0, 0, v9, 0, 0, v10));
  else
    v11 = 0;

  return v11;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", 0, a3, a4, 0, a5, a6, a7);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", a3, a4, a5, 0, 0, 0, SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue);
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
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:](self, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:", a3, a4, a5, a6, a7, a8, a9, a10, SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue);
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  if (!objc_msgSend(v20, "length"))
  {
    v21 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;

    v20 = v21;
  }
  v22 = objc_msgSend(v18, "length");
  v23 = objc_msgSend(v16, "length");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("playbackOrder"));
  if (!v23)
  {
    if (!v22)
      goto LABEL_11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mainOrPrivateContext"));

    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = sub_1000088A8;
    v48 = sub_1000088B8;
    v49 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000088C0;
    v40[3] = &unk_100028C88;
    v27 = v26;
    v41 = v27;
    v42 = v18;
    v43 = &v44;
    objc_msgSend(v27, "performBlockAndWait:", v40);
    if (objc_msgSend((id)v45[5], "length"))
      objc_msgSend(v24, "setObject:forKey:", v45[5], CFSTR("uuid"));

    _Block_object_dispose(&v44, 8);
    goto LABEL_10;
  }
  objc_msgSend(v24, "setObject:forKey:", v16, CFSTR("uuid"));
  if (v22)
LABEL_10:
    objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("episodeUuid"));
LABEL_11:
  if (objc_msgSend(v17, "length"))
  {
    v28 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v24, "setObject:forKey:", v29, CFSTR("podcastFeedUrl"));

  }
  if (objc_msgSend(v19, "length"))
    objc_msgSend(v24, "setObject:forKey:", v19, CFSTR("episodeGuid"));
  v30 = kMTSerpentAdamIdOffset;
  if (a5 && kMTSerpentAdamIdOffset != a5)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a5));
    objc_msgSend(v24, "setObject:forKey:", v31, CFSTR("storeCollectionId"));

  }
  if (a8 && v30 != a8)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a8));
    objc_msgSend(v24, "setObject:forKey:", v32, CFSTR("storeTrackId"));

  }
  v33 = NSPersistentStringForMTEpisodeContext(a9);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v24, "setObject:forKey:", v34, CFSTR("context"));

  v35 = NSPersistentStringForMTEpisodeContextSortType(a10);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(v24, "setObject:forKey:", v36, CFSTR("contextSortType"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playPodcast"), v24));
  return v37;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v6 = a4;
  if (!v6)
    v6 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  v11[0] = CFSTR("storeCollectionId");
  v11[1] = CFSTR("playbackOrder");
  v12[0] = a3;
  v12[1] = v6;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playPodcast"), v8));

  return v9;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("subscribe"), CFSTR("storeCollectionId"), a3);
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("subscribe"), CFSTR("podcastFeedUrl"), v6));
  return v7;
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
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
  objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("uuid"));

  if (objc_msgSend(v11, "length"))
    objc_msgSend(v15, "setObject:forKey:", v11, CFSTR("episodeUuid"));
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("episodeGuid"));
  if (objc_msgSend(v13, "length"))
  {
    v16 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("podcastFeedUrl"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playStation"), v15));

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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pf_queryAsDictionary"));
  v5 = objc_alloc((Class)MTEpisodeLookupRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeTrackId")));
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "longLongValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeUuid")));
  objc_msgSend(v5, "setUuid:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeGuid")));
  objc_msgSend(v5, "setEpisodeGuid:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeTitle")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setEpisodeTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastTitle")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setPodcastTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByRemovingPercentEscapes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setPodcastFeedUrl:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamUrl")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByRemovingPercentEscapes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setStreamUrl:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLookupUtil sharedInstance](MTEpisodeLookupUtil, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "findEpisodeWithRequest:", v5));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
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
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
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
  uint8_t buf[4];
  uint64_t v44;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByRemovingPercentEscapes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByRemovingPercentEscapes"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storeCollectionId")));
  v10 = objc_msgSend(v9, "longLongValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainOrPrivateContext"));

  v14 = objc_msgSend(objc_alloc((Class)MTStoreIdentifier), "initWithFeedUrl:storeIdentifier:", v8, v11);
  v15 = objc_alloc((Class)NSFetchRequest);
  v16 = objc_msgSend(v15, "initWithEntityName:", kMTPodcastEntityName);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForIdentifer:](MTPodcast, "predicateForIdentifer:", v14));
  objc_msgSend(v16, "setPredicate:", v17);

  objc_msgSend(v16, "setFetchLimit:", 1);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1000088A8;
  v41 = sub_1000088B8;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1000088A8;
  v35 = sub_1000088B8;
  v36 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009160;
  v26[3] = &unk_100028CB0;
  v18 = v13;
  v27 = v18;
  v19 = v16;
  v28 = v19;
  v29 = &v37;
  v30 = &v31;
  v20 = objc_msgSend(v18, "performBlockAndWait:", v26);
  if (v38[5])
  {
    v21 = _MTLogCategoryDatabase(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = v38[5];
      *(_DWORD *)buf = 138412290;
      v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error fetching podcast for playback identifier: %@", buf, 0xCu);
    }

    v24 = 0;
  }
  else
  {
    v24 = (id)v32[5];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v24;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _MRSystemAppPlaybackQueue *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeDsid"));
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
  v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 5);
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers(v6, v5);

  if (a3)
  {
    v9 = a3;
    keys = CFSTR("enqueuerDSID");
    v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, &kCFTypeDictionaryValueCallBacks);
    MRSystemAppPlaybackQueueSetUserInfo(v6, v7);
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
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  id v11;

  v3 = qword_100033380;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100033380, &stru_100028CD0);
  v5 = (void *)qword_100033388;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = (void *)v7;
  v9 = &off_100029FC8;
  if (v7)
    v9 = (_UNKNOWN **)v7;
  v10 = v9;

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  return (unint64_t)v11;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  v14 = a4;
  v15 = a5;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", v10, v11));
  return v12;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v7, "setScheme:", CFSTR("podcasts"));
  v20 = v5;
  objc_msgSend(v7, "setHost:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
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
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13);
        v15 = objc_alloc((Class)NSURLQueryItem);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
        v17 = objc_msgSend(v15, "initWithName:value:", v14, v16);

        objc_msgSend(v8, "addObject:", v17);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "setQueryItems:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));

  return v18;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", SAMPEpisodePlaybackOrderNEWEST_FIRSTValue) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", SAMPEpisodePlaybackOrderOLDEST_FIRSTValue))
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
    v4 = MTPlayReasonFromPersistentString(v3);
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
    v4 = MTEpisodeContextFromPersistentString(v3);
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
    v4 = MTEpisodeContextSortTypeFromPersistentString(v3);
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
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)a3, &stru_1000292B8);
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&")));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
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
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "componentsSeparatedByString:", CFSTR("=")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));

          v11 = (void *)v12;
        }
        objc_msgSend(v4, "setObject:forKey:", v11, v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

@end
