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
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BE73800]);
  objc_msgSend(v4, "universalStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "adamID"));

  objc_msgSend(v4, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersistentID:", objc_msgSend(v7, "persistentID"));

  objc_msgSend(v4, "vendorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEpisodeGuid:", v8);

  objc_msgSend(v3, "podcast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "feedURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPodcastFeedUrl:", v11);

  objc_msgSend(v3, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEpisodeTitle:", v12);

  objc_msgSend(v3, "author");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPodcastTitle:", v14);

  objc_msgSend(v3, "streamURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "absoluteString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreamUrl:", v16);

  objc_msgSend(MEMORY[0x24BE73808], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "findEpisodeWithRequest:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
