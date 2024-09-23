@implementation NotificationEpisodePropertySource

- (NotificationEpisodePropertySource)initWithNotification:(id)a3 episode:(id)a4
{
  id v7;
  id v8;
  NotificationEpisodePropertySource *v9;
  NotificationEpisodePropertySource *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NotificationEpisodePropertySource;
  v9 = -[NotificationEpisodePropertySource init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_notification, a3);
    objc_storeStrong((id *)&v10->_episode, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode sortPropertyValues](v10->_episode, "sortPropertyValues"));
    -[BaseEpisodePropertySource setSortPropertyValues:](v10, "setSortPropertyValues:", v11);

  }
  return v10;
}

- (BOOL)isSourceOfTruth
{
  return 0;
}

- (id)uuid
{
  return -[MTNotificationEpisode uuid](self->_episode, "uuid");
}

- (id)title
{
  return -[MTNotificationEpisode bestTitle](self->_episode, "bestTitle");
}

- (id)podcastUuid
{
  return -[MTNotificationEpisode podcastUuid](self->_episode, "podcastUuid");
}

- (id)podcastTitle
{
  return -[MTNotificationEpisode podcastTitle](self->_episode, "podcastTitle");
}

- (id)summary
{
  return -[MTNotificationEpisode bestSummary](self->_episode, "bestSummary");
}

- (BOOL)requiresForegroundLaunch
{
  return -[MTNotificationEpisode isVideo](self->_episode, "isVideo");
}

- (id)localizedDateString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode pubDate](self->_episode, "pubDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _localizedDateStringForDate:](self, "_localizedDateStringForDate:", v3));

  return v4;
}

- (id)localizedDurationString
{
  -[MTNotificationEpisode duration](self->_episode, "duration");
  return -[BaseEpisodePropertySource _localizedStringForDuration:](self, "_localizedStringForDuration:");
}

- (id)localizedDurationAndPodcastTitleString
{
  double v3;
  double v4;
  void *v5;
  void *v6;

  -[MTNotificationEpisode duration](self->_episode, "duration");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode podcastTitle](self->_episode, "podcastTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _localizedStringForDuration:podcastTitle:](self, "_localizedStringForDuration:podcastTitle:", v5, v4));

  return v6;
}

- (id)preloadedImageWithSize:(CGSize)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UNNotification request](self->_notification, "request", a3.width, a3.height));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode podcastUuid](self->_episode, "podcastUuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_attachedImageForCacheKey:", v6));

  return v7;
}

- (id)openPodcastDetailInAppURL
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode podcastUuid](self->_episode, "podcastUuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _openPodcastDetailInAppURLForPodcastUuid:podcastStoreCollectionId:](self, "_openPodcastDetailInAppURLForPodcastUuid:podcastStoreCollectionId:", v3, -[MTNotificationEpisode podcastStoreCollectionId](self->_episode, "podcastStoreCollectionId")));

  return v4;
}

- (id)openEpisodeDetailInAppURL
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode uuid](self->_episode, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _openEpisodeDetailInAppURLForEpisodeUuid:episodeStoreTrackId:podcastStoreCollectionId:](self, "_openEpisodeDetailInAppURLForEpisodeUuid:episodeStoreTrackId:podcastStoreCollectionId:", v3, -[MTNotificationEpisode storeTrackId](self->_episode, "storeTrackId"), -[MTNotificationEpisode podcastStoreCollectionId](self->_episode, "podcastStoreCollectionId")));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode uuid](self->_episode, "uuid"));
  v6 = -[MTNotificationEpisode storeTrackId](self->_episode, "storeTrackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTNotificationEpisode podcastUuid](self->_episode, "podcastUuid"));
  v8 = -[MTNotificationEpisode podcastStoreCollectionId](self->_episode, "podcastStoreCollectionId");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BE80;
  v10[3] = &unk_100028DE0;
  v11 = v4;
  v9 = v4;
  -[BaseEpisodePropertySource _initiatePlaybackWithDefaultBehaviorForEpisodeUUid:episodeStoreTrackId:podcastUuid:podcastStoreCollectionId:completion:](self, "_initiatePlaybackWithDefaultBehaviorForEpisodeUUid:episodeStoreTrackId:podcastUuid:podcastStoreCollectionId:completion:", v5, v6, v7, v8, v10);

}

- (UNNotification)notification
{
  return self->_notification;
}

- (MTNotificationEpisode)episode
{
  return self->_episode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episode, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
