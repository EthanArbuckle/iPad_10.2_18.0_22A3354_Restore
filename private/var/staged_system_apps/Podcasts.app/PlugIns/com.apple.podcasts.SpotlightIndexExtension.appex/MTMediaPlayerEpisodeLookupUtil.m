@implementation MTMediaPlayerEpisodeLookupUtil

+ (id)findEpisodeFromModelObject:(id)a3
{
  id v3;
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

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifiers"));
  v5 = objc_alloc_init((Class)MTEpisodeLookupRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "universalStore"));
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "adamID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "library"));
  objc_msgSend(v5, "setPersistentID:", objc_msgSend(v7, "persistentID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vendorID"));
  objc_msgSend(v5, "setEpisodeGuid:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcast"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "feedURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
  objc_msgSend(v5, "setPodcastFeedUrl:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  objc_msgSend(v5, "setEpisodeTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "author"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  objc_msgSend(v5, "setPodcastTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "streamURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "absoluteString"));
  objc_msgSend(v5, "setStreamUrl:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLookupUtil sharedInstance](MTEpisodeLookupUtil, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "findEpisodeWithRequest:", v5));

  return v18;
}

@end
