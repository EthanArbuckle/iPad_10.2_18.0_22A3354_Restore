@implementation DatabaseEpisodePropertySource

+ (id)computedPropertyKeyForBestTitle
{
  return NSStringFromSelector("bestTitle");
}

+ (id)computedPropertyKeyForBestSummary
{
  return NSStringFromSelector("bestSummary");
}

+ (void)fetchSourceForEpisodeUuids:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  void (**v13)(id, _QWORD);
  id v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = objc_msgSend(v6, "count");
  if (!v7 || !v8)
  {
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v7[2](v7, 0);
    goto LABEL_7;
  }
  if ((+[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase") & 1) == 0)
    goto LABEL_6;
  global_queue = dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C000;
  block[3] = &unk_100028E80;
  v12 = v6;
  v14 = a1;
  v13 = v7;
  dispatch_async(v10, block);

LABEL_7:
}

- (BOOL)requiresForegroundLaunch
{
  return self->_isVideo;
}

+ (id)sortProperties
{
  return +[MTPodcast allPossibleEpisodeListSortOrderProperties](MTPodcast, "allPossibleEpisodeListSortOrderProperties");
}

+ (id)computedPropertiesToFetch
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "computedPropertyKeyForBestTitle"));
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "computedPropertyKeyForBestSummary"));
  objc_msgSend(v3, "addObject:", v5);

  return v3;
}

+ (id)propertiesToFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13[0] = kEpisodeUuid;
  v13[1] = kEpisodeStoreTrackId;
  v13[2] = kEpisodePubDate;
  v13[3] = kEpisodeDuration;
  v13[4] = kEpisodeByteSize;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 5));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", kPodcastUuid));
  v12[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", kPodcastTitle));
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", kPodcastStoreCollectionId));
  v12[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sortProperties"));
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  return v10;
}

- (DatabaseEpisodePropertySource)initWithFetchedPropertyValues:(id)a3
{
  id v4;
  DatabaseEpisodePropertySource *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DatabaseEpisodePropertySource;
  v5 = -[DatabaseEpisodePropertySource init](&v28, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kEpisodeUuid));
    -[DatabaseEpisodePropertySource setEpisodeUuid:](v5, "setEpisodeUuid:", v6);

    v7 = objc_msgSend((id)objc_opt_class(v5), "computedPropertyKeyForBestTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
    -[DatabaseEpisodePropertySource setBestTitle:](v5, "setBestTitle:", v9);

    v10 = objc_msgSend((id)objc_opt_class(v5), "computedPropertyKeyForBestSummary");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
    -[DatabaseEpisodePropertySource setBestSummary:](v5, "setBestSummary:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kEpisodeStoreTrackId));
    -[DatabaseEpisodePropertySource setStoreTrackId:](v5, "setStoreTrackId:", objc_msgSend(v13, "longLongValue"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", kPodcastUuid));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    -[DatabaseEpisodePropertySource setPodcastUuid:](v5, "setPodcastUuid:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", kPodcastTitle));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
    -[DatabaseEpisodePropertySource setPodcastTitle:](v5, "setPodcastTitle:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertyPathForPodcastProperty:](MTEpisode, "propertyPathForPodcastProperty:", kPodcastStoreCollectionId));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v18));
    -[DatabaseEpisodePropertySource setStoreCollectionId:](v5, "setStoreCollectionId:", objc_msgSend(v19, "longLongValue"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kEpisodePubDate));
    -[DatabaseEpisodePropertySource setPubDate:](v5, "setPubDate:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kEpisodeDuration));
    objc_msgSend(v21, "doubleValue");
    -[DatabaseEpisodePropertySource setDuration:](v5, "setDuration:");

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kEpisodeByteSize));
    -[DatabaseEpisodePropertySource setByteSize:](v5, "setByteSize:", objc_msgSend(v22, "longLongValue"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kEpisodeVideo));
    -[DatabaseEpisodePropertySource setIsVideo:](v5, "setIsVideo:", objc_msgSend(v23, "BOOLValue"));

    v24 = objc_msgSend((id)objc_opt_class(v5), "sortProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mt_subdictionaryWithKeys:", v25));
    -[BaseEpisodePropertySource setSortPropertyValues:](v5, "setSortPropertyValues:", v26);

  }
  return v5;
}

- (BOOL)isSourceOfTruth
{
  return 1;
}

- (id)uuid
{
  return self->_episodeUuid;
}

- (id)title
{
  return self->_bestTitle;
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (id)summary
{
  return self->_bestSummary;
}

- (id)localizedDateString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DatabaseEpisodePropertySource pubDate](self, "pubDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _localizedDateStringForDate:](self, "_localizedDateStringForDate:", v3));

  return v4;
}

- (id)localizedDurationString
{
  -[DatabaseEpisodePropertySource duration](self, "duration");
  return -[BaseEpisodePropertySource _localizedStringForDuration:](self, "_localizedStringForDuration:");
}

- (id)localizedDurationAndPodcastTitleString
{
  double v3;
  double v4;
  void *v5;
  void *v6;

  -[DatabaseEpisodePropertySource duration](self, "duration");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DatabaseEpisodePropertySource podcastTitle](self, "podcastTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _localizedStringForDuration:podcastTitle:](self, "_localizedStringForDuration:podcastTitle:", v5, v4));

  return v6;
}

- (id)preloadedImageWithSize:(CGSize)a3
{
  return 0;
}

- (id)openPodcastDetailInAppURL
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DatabaseEpisodePropertySource podcastUuid](self, "podcastUuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _openPodcastDetailInAppURLForPodcastUuid:podcastStoreCollectionId:](self, "_openPodcastDetailInAppURLForPodcastUuid:podcastStoreCollectionId:", v3, -[DatabaseEpisodePropertySource storeCollectionId](self, "storeCollectionId")));

  return v4;
}

- (id)openEpisodeDetailInAppURL
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DatabaseEpisodePropertySource episodeUuid](self, "episodeUuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _openEpisodeDetailInAppURLForEpisodeUuid:episodeStoreTrackId:podcastStoreCollectionId:](self, "_openEpisodeDetailInAppURLForEpisodeUuid:episodeStoreTrackId:podcastStoreCollectionId:", v3, -[DatabaseEpisodePropertySource storeTrackId](self, "storeTrackId"), -[DatabaseEpisodePropertySource storeCollectionId](self, "storeCollectionId")));

  return v4;
}

- (void)initiatePlaybackWithCompletion:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DatabaseEpisodePropertySource episodeUuid](self, "episodeUuid"));
  v6 = -[DatabaseEpisodePropertySource storeTrackId](self, "storeTrackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DatabaseEpisodePropertySource podcastUuid](self, "podcastUuid"));
  v8 = -[DatabaseEpisodePropertySource storeCollectionId](self, "storeCollectionId");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000CC90;
  v10[3] = &unk_100028DE0;
  v11 = v4;
  v9 = v4;
  -[BaseEpisodePropertySource _initiatePlaybackWithDefaultBehaviorForEpisodeUUid:episodeStoreTrackId:podcastUuid:podcastStoreCollectionId:completion:](self, "_initiatePlaybackWithDefaultBehaviorForEpisodeUUid:episodeStoreTrackId:podcastUuid:podcastStoreCollectionId:completion:", v5, v6, v7, v8, v10);

}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (void)setEpisodeUuid:(id)a3
{
  objc_storeStrong((id *)&self->_episodeUuid, a3);
}

- (NSString)bestTitle
{
  return self->_bestTitle;
}

- (void)setBestTitle:(id)a3
{
  objc_storeStrong((id *)&self->_bestTitle, a3);
}

- (NSString)bestSummary
{
  return self->_bestSummary;
}

- (void)setBestSummary:(id)a3
{
  objc_storeStrong((id *)&self->_bestSummary, a3);
}

- (int64_t)storeTrackId
{
  return self->_storeTrackId;
}

- (void)setStoreTrackId:(int64_t)a3
{
  self->_storeTrackId = a3;
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
  objc_storeStrong((id *)&self->_pubDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(int64_t)a3
{
  self->_byteSize = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (void)setPodcastUuid:(id)a3
{
  objc_storeStrong((id *)&self->_podcastUuid, a3);
}

- (void)setPodcastTitle:(id)a3
{
  objc_storeStrong((id *)&self->_podcastTitle, a3);
}

- (int64_t)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(int64_t)a3
{
  self->_storeCollectionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_bestSummary, 0);
  objc_storeStrong((id *)&self->_bestTitle, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
}

@end
