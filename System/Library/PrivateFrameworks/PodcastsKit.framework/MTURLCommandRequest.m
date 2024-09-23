@implementation MTURLCommandRequest

- (MTURLCommandRequest)initWithURLString:(id)a3
{
  id v5;
  MTURLCommandRequest *v6;
  MTURLCommandRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTURLCommandRequest;
  v6 = -[MTURLCommandRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_urlString, a3);
    -[MTURLCommandRequest _loadQueryParameterValuesFromString:](v7, "_loadQueryParameterValuesFromString:", v5);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v5 = -[NSString copy](self->_urlString, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = self->_commandType;
  v4[3] = self->_playQueueType;
  v4[4] = self->_playReason;
  v4[5] = self->_playbackOrder;
  v4[6] = self->_playContext;
  v4[7] = self->_playContextSortType;
  v7 = -[NSString copy](self->_podcastUuid, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = -[NSString copy](self->_podcastFeedUrl, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  v11 = -[NSString copy](self->_episodeUuid, "copy");
  v12 = (void *)v4[10];
  v4[10] = v11;

  v13 = -[NSString copy](self->_podcastAdamId, "copy");
  v14 = (void *)v4[11];
  v4[11] = v13;

  v15 = -[NSString copy](self->_episodeAdamId, "copy");
  v16 = (void *)v4[12];
  v4[12] = v15;

  v17 = -[NSString copy](self->_stationUuid, "copy");
  v18 = (void *)v4[13];
  v4[13] = v17;

  v19 = -[NSString copy](self->_requesterDsid, "copy");
  v20 = (void *)v4[14];
  v4[14] = v19;

  return v4;
}

- (id)copyWithPlayReason:(unint64_t)a3
{
  id result;

  result = (id)-[MTURLCommandRequest copy](self, "copy");
  *((_QWORD *)result + 4) = a3;
  return result;
}

- (void)_loadQueryParameterValuesFromString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t playQueueType;
  NSString *v24;
  NSString *podcastUuid;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  NSString *stationUuid;
  NSString *v30;
  NSString *episodeUuid;
  NSString *v32;
  NSString *podcastAdamId;
  NSString *v34;
  NSString *episodeAdamId;
  void *v36;
  void *v37;
  NSString *v38;
  NSString *podcastFeedUrl;
  NSString *v40;
  NSString *requesterDsid;
  id v42;

  v42 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPlaybackIdentifierUtil __queryStringToQueryDictionary:](MTPlaybackIdentifierUtil, "__queryStringToQueryDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSubscribeCommandURLString:", v42);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isLocalSetPlaybackQueueURLString:", v42);

    if ((v11 & 1) != 0)
    {
      v9 = 2;
    }
    else
    {
      +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isUniversalPlaybackIdentifierURLString:", v42);

      if (!v13)
        goto LABEL_8;
      v9 = 3;
    }
  }
  self->_commandType = v9;
LABEL_8:
  +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playQueueType = objc_msgSend(v14, "_playQueueTypeForRequestURL:", v4);

  +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackOrder"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playbackOrder = objc_msgSend(v15, "_episodeOrderFromString:", v16);

  +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playReason"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playReason = objc_msgSend(v17, "_playReasonFromString:", v18);

  +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("context"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playContext = objc_msgSend(v19, "_episodeContextFromString:", v20);

  +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextSortType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_playContextSortType = objc_msgSend(v21, "_episodeContextSortFromString:", v22);

  playQueueType = self->_playQueueType;
  if (playQueueType == 3)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    stationUuid = self->_stationUuid;
    self->_stationUuid = v28;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeUuid"));
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v30;

    goto LABEL_12;
  }
  if (playQueueType == 2)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v24;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeUuid"));
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    v27 = self->_episodeUuid;
    self->_episodeUuid = v26;

    -[MTURLCommandRequest _lookupPodcastUuidIfNecessaryFromURLString:](self, "_lookupPodcastUuidIfNecessaryFromURLString:", v42);
LABEL_12:
    -[MTURLCommandRequest _lookupEpisodeUuidIfNecessaryFromURLString:](self, "_lookupEpisodeUuidIfNecessaryFromURLString:", v42);
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeCollectionId"));
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  podcastAdamId = self->_podcastAdamId;
  self->_podcastAdamId = v32;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeTrackId"));
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  episodeAdamId = self->_episodeAdamId;
  self->_episodeAdamId = v34;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:](MTPlaybackIdentifierUtil, "__stringByRemovingPercentEscapes:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:](MTPlaybackIdentifierUtil, "__stringByRemovingPercentEscapes:", v37);
  v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  podcastFeedUrl = self->_podcastFeedUrl;
  self->_podcastFeedUrl = v38;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enqueuerDSID"));
  v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  requesterDsid = self->_requesterDsid;
  self->_requesterDsid = v40;

}

- (void)_lookupPodcastUuidIfNecessaryFromURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *podcastUuid;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainOrPrivateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __66__MTURLCommandRequest__lookupPodcastUuidIfNecessaryFromURLString___block_invoke;
  v14 = &unk_24FD62B40;
  v16 = &v18;
  v7 = v6;
  v15 = v7;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "performBlockAndWait:", &v11);
  if (!*((_BYTE *)v19 + 24))
  {
    +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance", v11, v12, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "podcastUuidForSetPlaybackQueueRequestIdentifier:", v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v9;

  }
  objc_destroyWeak(&v17);

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);

}

void __66__MTURLCommandRequest__lookupPodcastUuidIfNecessaryFromURLString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "podcastUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "podcastForUuid:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

}

- (void)_lookupEpisodeUuidIfNecessaryFromURLString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *episodeUuid;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainOrPrivateContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __66__MTURLCommandRequest__lookupEpisodeUuidIfNecessaryFromURLString___block_invoke;
  v14 = &unk_24FD62B40;
  v16 = &v18;
  v7 = v6;
  v15 = v7;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "performBlockAndWait:", &v11);
  if (!*((_BYTE *)v19 + 24))
  {
    +[MTSingleton sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance", v11, v12, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "episodeUuidForSetPlaybackQueueRequestIdentifier:", v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v9;

  }
  objc_destroyWeak(&v17);

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);

}

void __66__MTURLCommandRequest__lookupEpisodeUuidIfNecessaryFromURLString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "episodeUuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "episodeForUuid:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

}

- (NSString)urlString
{
  return self->_urlString;
}

- (unint64_t)commandType
{
  return self->_commandType;
}

- (unint64_t)playQueueType
{
  return self->_playQueueType;
}

- (unint64_t)playReason
{
  return self->_playReason;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (int64_t)playContext
{
  return self->_playContext;
}

- (int64_t)playContextSortType
{
  return self->_playContextSortType;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (NSString)podcastAdamId
{
  return self->_podcastAdamId;
}

- (NSString)episodeAdamId
{
  return self->_episodeAdamId;
}

- (NSString)stationUuid
{
  return self->_stationUuid;
}

- (NSString)requesterDsid
{
  return self->_requesterDsid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterDsid, 0);
  objc_storeStrong((id *)&self->_stationUuid, 0);
  objc_storeStrong((id *)&self->_episodeAdamId, 0);
  objc_storeStrong((id *)&self->_podcastAdamId, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
  objc_storeStrong((id *)&self->_podcastFeedUrl, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end
