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
  v6 = -[MTURLCommandRequest init](&v9, "init");
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
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v4 = objc_opt_class(self);
  v5 = (_QWORD *)objc_opt_new(v4);
  v6 = -[NSString copy](self->_urlString, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_commandType;
  v5[3] = self->_playQueueType;
  v5[4] = self->_playReason;
  v5[5] = self->_playbackOrder;
  v5[6] = self->_playContext;
  v5[7] = self->_playContextSortType;
  v8 = -[NSString copy](self->_podcastUuid, "copy");
  v9 = (void *)v5[8];
  v5[8] = v8;

  v10 = -[NSString copy](self->_podcastFeedUrl, "copy");
  v11 = (void *)v5[9];
  v5[9] = v10;

  v12 = -[NSString copy](self->_episodeUuid, "copy");
  v13 = (void *)v5[10];
  v5[10] = v12;

  v14 = -[NSString copy](self->_podcastAdamId, "copy");
  v15 = (void *)v5[11];
  v5[11] = v14;

  v16 = -[NSString copy](self->_episodeAdamId, "copy");
  v17 = (void *)v5[12];
  v5[12] = v16;

  v18 = -[NSString copy](self->_stationUuid, "copy");
  v19 = (void *)v5[13];
  v5[13] = v18;

  v20 = -[NSString copy](self->_requesterDsid, "copy");
  v21 = (void *)v5[14];
  v5[14] = v20;

  return v5;
}

- (id)copyWithPlayReason:(unint64_t)a3
{
  id result;

  result = -[MTURLCommandRequest copy](self, "copy");
  *((_QWORD *)result + 4) = a3;
  return result;
}

- (void)_loadQueryParameterValuesFromString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  unint64_t v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned int v13;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v42));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "query"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil __queryStringToQueryDictionary:](MTPlaybackIdentifierUtil, "__queryStringToQueryDictionary:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v8 = objc_msgSend(v7, "isSubscribeCommandURLString:", v42);

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
    v11 = objc_msgSend(v10, "isLocalSetPlaybackQueueURLString:", v42);

    if ((v11 & 1) != 0)
    {
      v9 = 2;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
      v13 = objc_msgSend(v12, "isUniversalPlaybackIdentifierURLString:", v42);

      if (!v13)
        goto LABEL_8;
      v9 = 3;
    }
  }
  self->_commandType = v9;
LABEL_8:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  self->_playQueueType = (unint64_t)objc_msgSend(v14, "_playQueueTypeForRequestURL:", v4);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playbackOrder")));
  self->_playbackOrder = (int64_t)objc_msgSend(v15, "_episodeOrderFromString:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("playReason")));
  self->_playReason = (unint64_t)objc_msgSend(v17, "_playReasonFromString:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("context")));
  self->_playContext = (int64_t)objc_msgSend(v19, "_episodeContextFromString:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextSortType")));
  self->_playContextSortType = (int64_t)objc_msgSend(v21, "_episodeContextSortFromString:", v22);

  playQueueType = self->_playQueueType;
  if (playQueueType == 3)
  {
    v28 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid")));
    stationUuid = self->_stationUuid;
    self->_stationUuid = v28;

    v30 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeUuid")));
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v30;

    goto LABEL_12;
  }
  if (playQueueType == 2)
  {
    v24 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid")));
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v24;

    v26 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeUuid")));
    v27 = self->_episodeUuid;
    self->_episodeUuid = v26;

    -[MTURLCommandRequest _lookupPodcastUuidIfNecessaryFromURLString:](self, "_lookupPodcastUuidIfNecessaryFromURLString:", v42);
LABEL_12:
    -[MTURLCommandRequest _lookupEpisodeUuidIfNecessaryFromURLString:](self, "_lookupEpisodeUuidIfNecessaryFromURLString:", v42);
  }
  v32 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeCollectionId")));
  podcastAdamId = self->_podcastAdamId;
  self->_podcastAdamId = v32;

  v34 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("storeTrackId")));
  episodeAdamId = self->_episodeAdamId;
  self->_episodeAdamId = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:](MTPlaybackIdentifierUtil, "__stringByRemovingPercentEscapes:", v36));

  v38 = (NSString *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil __stringByRemovingPercentEscapes:](MTPlaybackIdentifierUtil, "__stringByRemovingPercentEscapes:", v37));
  podcastFeedUrl = self->_podcastFeedUrl;
  self->_podcastFeedUrl = v38;

  v40 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enqueuerDSID")));
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
  void **v11;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10000A0F8;
  v14 = &unk_100028CF8;
  v16 = &v18;
  v7 = v6;
  v15 = v7;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "performBlockAndWait:", &v11);
  if (!*((_BYTE *)v19 + 24))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance", v11, v12, v13, v14, v15, v16));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcastUuidForSetPlaybackQueueRequestIdentifier:", v4));
    podcastUuid = self->_podcastUuid;
    self->_podcastUuid = v9;

  }
  objc_destroyWeak(&v17);

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);

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
  void **v11;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10000A2EC;
  v14 = &unk_100028CF8;
  v16 = &v18;
  v7 = v6;
  v15 = v7;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v7, "performBlockAndWait:", &v11);
  if (!*((_BYTE *)v19 + 24))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance", v11, v12, v13, v14, v15, v16));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "episodeUuidForSetPlaybackQueueRequestIdentifier:", v4));
    episodeUuid = self->_episodeUuid;
    self->_episodeUuid = v9;

  }
  objc_destroyWeak(&v17);

  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);

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
