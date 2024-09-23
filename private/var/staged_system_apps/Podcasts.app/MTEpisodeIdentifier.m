@implementation MTEpisodeIdentifier

+ (id)identifierWithEpisode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithEpisode:", v4);

  return v5;
}

+ (id)identifierWithPlayerItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithPlayerItem:", v4);

  return v5;
}

- (MTEpisodeIdentifier)initWithEpisode:(id)a3
{
  id v4;
  MTEpisodeIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTEpisodeIdentifier;
  v5 = -[MTEpisodeIdentifier init](&v13, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    -[MTEpisodeIdentifier setEpisodeUUID:](v5, "setEpisodeUUID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guid"));
    -[MTEpisodeIdentifier setEpisodeGUID:](v5, "setEpisodeGUID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier adamIdNumberFromStoreId:](MTStoreIdentifier, "adamIdNumberFromStoreId:", objc_msgSend(v4, "storeTrackId")));
    -[MTEpisodeIdentifier setEpisodeAdamID:](v5, "setEpisodeAdamID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier validatedIdNumberFromStoreId:](MTStoreIdentifier, "validatedIdNumberFromStoreId:", objc_msgSend(v4, "storeTrackId")));
    -[MTEpisodeIdentifier setEpisodeSerpentID:](v5, "setEpisodeSerpentID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcast"));
    if (v10)
    {
      -[MTEpisodeIdentifier _updateWithPodcast:](v5, "_updateWithPodcast:", v10);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastUuid"));
      -[MTEpisodeIdentifier setPodcastUUID:](v5, "setPodcastUUID:", v11);

    }
  }

  return v5;
}

- (MTEpisodeIdentifier)initWithPlayerItem:(id)a3
{
  id v4;
  MTEpisodeIdentifier *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTEpisodeIdentifier;
  v5 = -[MTEpisodeIdentifier init](&v16, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodeUuid"));
    -[MTEpisodeIdentifier setEpisodeUUID:](v5, "setEpisodeUUID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodeGuid"));
    -[MTEpisodeIdentifier setEpisodeGUID:](v5, "setEpisodeGUID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier adamIdNumberFromStoreId:](MTStoreIdentifier, "adamIdNumberFromStoreId:", objc_msgSend(v4, "episodeStoreId")));
    -[MTEpisodeIdentifier setEpisodeAdamID:](v5, "setEpisodeAdamID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier validatedIdNumberFromStoreId:](MTStoreIdentifier, "validatedIdNumberFromStoreId:", objc_msgSend(v4, "episodeStoreId")));
    -[MTEpisodeIdentifier setEpisodeSerpentID:](v5, "setEpisodeSerpentID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "podcast"));

    if (v11)
    {
      -[MTEpisodeIdentifier _updateWithPodcast:](v5, "_updateWithPodcast:", v11);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastUuid"));
      -[MTEpisodeIdentifier setPodcastUUID:](v5, "setPodcastUUID:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier adamIdNumberFromStoreId:](MTStoreIdentifier, "adamIdNumberFromStoreId:", objc_msgSend(v4, "podcastStoreId")));
      -[MTEpisodeIdentifier setPodcastAdamID:](v5, "setPodcastAdamID:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "podcastFeedUrl"));
      -[MTEpisodeIdentifier setCurrentPodcastFeedURL:](v5, "setCurrentPodcastFeedURL:", v14);

      -[MTEpisodeIdentifier setOriginalPodcastFeedURL:](v5, "setOriginalPodcastFeedURL:", 0);
    }

  }
  return v5;
}

- (void)_updateWithPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
  -[MTEpisodeIdentifier setPodcastUUID:](self, "setPodcastUUID:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier adamIdNumberFromStoreId:](MTStoreIdentifier, "adamIdNumberFromStoreId:", objc_msgSend(v4, "storeCollectionId")));
  -[MTEpisodeIdentifier setPodcastAdamID:](self, "setPodcastAdamID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentFeedURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
  -[MTEpisodeIdentifier setCurrentPodcastFeedURL:](self, "setCurrentPodcastFeedURL:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedURL"));
  -[MTEpisodeIdentifier setOriginalPodcastFeedURL:](self, "setOriginalPodcastFeedURL:", v9);

}

- (BOOL)_hasFeedURL:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeIdentifier currentPodcastFeedURL](self, "currentPodcastFeedURL"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeIdentifier originalPodcastFeedURL](self, "originalPodcastFeedURL"));
    v7 = objc_msgSend(v8, "isEqualToString:", v4);

  }
  return v7;
}

- (NSString)episodeUUID
{
  return self->_episodeUUID;
}

- (void)setEpisodeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)episodeGUID
{
  return self->_episodeGUID;
}

- (void)setEpisodeGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)episodeAdamID
{
  return self->_episodeAdamID;
}

- (void)setEpisodeAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_episodeAdamID, a3);
}

- (NSNumber)episodeSerpentID
{
  return self->_episodeSerpentID;
}

- (void)setEpisodeSerpentID:(id)a3
{
  objc_storeStrong((id *)&self->_episodeSerpentID, a3);
}

- (NSString)podcastUUID
{
  return self->_podcastUUID;
}

- (void)setPodcastUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)podcastAdamID
{
  return self->_podcastAdamID;
}

- (void)setPodcastAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_podcastAdamID, a3);
}

- (NSString)currentPodcastFeedURL
{
  return self->_currentPodcastFeedURL;
}

- (void)setCurrentPodcastFeedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)originalPodcastFeedURL
{
  return self->_originalPodcastFeedURL;
}

- (void)setOriginalPodcastFeedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPodcastFeedURL, 0);
  objc_storeStrong((id *)&self->_currentPodcastFeedURL, 0);
  objc_storeStrong((id *)&self->_podcastAdamID, 0);
  objc_storeStrong((id *)&self->_podcastUUID, 0);
  objc_storeStrong((id *)&self->_episodeSerpentID, 0);
  objc_storeStrong((id *)&self->_episodeAdamID, 0);
  objc_storeStrong((id *)&self->_episodeGUID, 0);
  objc_storeStrong((id *)&self->_episodeUUID, 0);
}

@end
