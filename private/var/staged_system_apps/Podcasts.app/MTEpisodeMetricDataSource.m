@implementation MTEpisodeMetricDataSource

- (MTEpisodeMetricDataSource)initWithEpisodeIdentifier:(id)a3
{
  id v5;
  MTEpisodeMetricDataSource *v6;
  MTEpisodeMetricDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTEpisodeMetricDataSource;
  v6 = -[MTEpisodeMetricDataSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_episodeIdentifier, a3);

  return v7;
}

- (MTEpisodeMetricDataSource)initWithPlayerItem:(id)a3
{
  id v4;
  void *v5;
  MTEpisodeMetricDataSource *v6;
  double v7;
  uint64_t v8;
  NSString *podcastState;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodeIdentifier"));
  v6 = -[MTEpisodeMetricDataSource initWithEpisodeIdentifier:](self, "initWithEpisodeIdentifier:", v5);

  if (v6)
  {
    objc_msgSend(v4, "duration");
    v6->_duration = v7;
    v6->_mediaType = -[MTEpisodeMetricDataSource _mediaTypeForPlayerItem:](v6, "_mediaTypeForPlayerItem:", v4);
    v6->_itemType = -[MTEpisodeMetricDataSource _itemTypeForPlayerItem:](v6, "_itemTypeForPlayerItem:", v4);
    v8 = objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastStateForPlayerItem:](v6, "_podcastStateForPlayerItem:", v4));
    podcastState = v6->_podcastState;
    v6->_podcastState = (NSString *)v8;

  }
  return v6;
}

- (unint64_t)_mediaTypeForEpisode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F5E60;
  v8[3] = &unk_1004A6B98;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)_itemTypeForEpisode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000F5F98;
  v8[3] = &unk_1004A6B98;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performBlockAndWait:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)_mediaTypeForPlayerItem:(id)a3
{
  if (objc_msgSend(a3, "isVideo"))
    return 2;
  else
    return a3 != 0;
}

- (unint64_t)_itemTypeForPlayerItem:(id)a3
{
  if (objc_msgSend(a3, "isLocal"))
    return 2;
  else
    return a3 != 0;
}

- (id)_podcastStateForPlayerItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsStateCoordinator shared](_TtC8Podcasts24PodcastsStateCoordinator, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastUuid"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPodcastStateDescriptionFrom:", v5));
  return v6;
}

- (id)_contentId
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "episodeSerpentID"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  if (v4)
    v5 = v4;
  else
    v5 = &stru_1004C6D40;
  v6 = v5;

  return v6;
}

- (id)_contentGUID
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "episodeGUID"));

  if (v3)
    v4 = v3;
  else
    v4 = &stru_1004C6D40;
  v5 = v4;

  return v5;
}

- (id)_podcastId
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "podcastAdamID"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));

  if (v4)
    v5 = v4;
  else
    v5 = &stru_1004C6D40;
  v6 = v5;

  return v6;
}

- (id)_podcastFeedURL
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource episodeIdentifier](self, "episodeIdentifier"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentPodcastFeedURL"));

  if (v3)
    v4 = v3;
  else
    v4 = &stru_1004C6D40;
  v5 = v4;

  return v5;
}

- (id)_providerId
{
  return &stru_1004C6D40;
}

- (id)_mediaType
{
  unint64_t v2;

  v2 = -[MTEpisodeMetricDataSource mediaType](self, "mediaType");
  if (v2 - 1 > 2)
    return CFSTR("unknown");
  else
    return off_1004AAED0[v2 - 1];
}

- (id)_itemType
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[MTEpisodeMetricDataSource itemType](self, "itemType");
  v3 = CFSTR("unknown");
  if (v2 == 2)
    v3 = CFSTR("download");
  if (v2 == 1)
    return CFSTR("stream");
  else
    return (id)v3;
}

- (id)_podcastState
{
  return -[MTEpisodeMetricDataSource podcastState](self, "podcastState");
}

- (id)_duration
{
  -[MTEpisodeMetricDataSource duration](self, "duration");
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (id)metricsContentIdentifier
{
  return -[MTEpisodeMetricDataSource _contentId](self, "_contentId");
}

- (id)metricsAdditionalData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[8];

  v13[0] = CFSTR("contentGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _contentGUID](self, "_contentGUID"));
  v14[0] = v3;
  v13[1] = CFSTR("contentLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _duration](self, "_duration"));
  v14[1] = v4;
  v13[2] = CFSTR("podcastId");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastId](self, "_podcastId"));
  v14[2] = v5;
  v13[3] = CFSTR("podcastFeedURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastFeedURL](self, "_podcastFeedURL"));
  v14[3] = v6;
  v13[4] = CFSTR("providerId");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _providerId](self, "_providerId"));
  v14[4] = v7;
  v13[5] = CFSTR("mediaType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _mediaType](self, "_mediaType"));
  v14[5] = v8;
  v13[6] = CFSTR("itemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _itemType](self, "_itemType"));
  v14[6] = v9;
  v13[7] = CFSTR("podcastState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource _podcastState](self, "_podcastState"));
  v14[7] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 8));

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = a3;
  v5 = objc_opt_class(MTEpisodeMetricDataSource);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsContentIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsContentIdentifier](self, "metricsContentIdentifier"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metricsAdditionalData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsAdditionalData](self, "metricsAdditionalData"));
      v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsContentIdentifier](self, "metricsContentIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeMetricDataSource metricsAdditionalData](self, "metricsAdditionalData"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return self->_episodeIdentifier;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSString)podcastState
{
  return self->_podcastState;
}

- (void)setPodcastState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastState, 0);
  objc_storeStrong((id *)&self->_episodeIdentifier, 0);
}

@end
