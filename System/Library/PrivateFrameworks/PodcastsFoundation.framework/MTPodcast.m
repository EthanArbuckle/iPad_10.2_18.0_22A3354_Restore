@implementation MTPodcast

- (BOOL)isPastAutodownloadOrEpisodeLimitDark
{
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = +[PFClientUtil supportsDownloads](PFClientUtil, "supportsDownloads");
  if (v3)
  {
    v3 = -[MTPodcast subscribed](self, "subscribed");
    if (v3)
    {
      v3 = -[MTPodcast currentEpisodeLimitAllowsAutomaticDownloads](self, "currentEpisodeLimitAllowsAutomaticDownloads");
      if (v3)
      {
        v4 = -[MTPodcast darkCountLocal](self, "darkCountLocal");
        if (v4 >= -[MTPodcast darkDownloadCountLimit](self, "darkDownloadCountLimit"))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v6 = v5;
          -[MTPodcast lastTouchDate](self, "lastTouchDate");
          v8 = v7;
          -[MTPodcast darkDownloadTimeInterval](self, "darkDownloadTimeInterval");
          LOBYTE(v3) = v6 > v8 + v9;
        }
        else
        {
          LOBYTE(v3) = 0;
        }
      }
    }
  }
  return v3;
}

- (BOOL)feedUpdateNeedsRetry
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 12) & 1;
}

- (double)darkDownloadTimeInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kMTDarkDownloadDurationOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "doubleForKey:", CFSTR("kMTDarkDownloadDurationOverride"));
    v5 = v4;
  }
  else
  {
    v5 = 1296000.0;
  }

  return v5;
}

- (int64_t)darkDownloadCountLimit
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSharedUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("kMTDarkDownloadCountOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v2, "integerForKey:", CFSTR("kMTDarkDownloadCountOverride"));
  else
    v4 = 5;

  return v4;
}

- (int64_t)episodeLimitResolvedValue
{
  int64_t result;
  void *v4;
  int64_t v5;

  if (-[MTPodcast episodeLimit](self, "episodeLimit") == 0xFFFFFFFFLL)
    return +[MTPodcast episodeLimitDefaultValue](MTPodcast, "episodeLimitDefaultValue");
  result = -[MTPodcast episodeLimit](self, "episodeLimit");
  if (result == 0x100000001)
  {
    if (-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed")
      && !os_feature_enabled_serial_sort_auto_downloads())
    {
      return 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "episodeLimitForKey:", CFSTR("MTPodcastEpisodeLimitDefaultKey"));

      return v5;
    }
  }
  return result;
}

- (BOOL)deletePlayedEpisodesResolvedValue
{
  uint64_t v3;

  if (-[MTPodcast deletePlayedEpisodes](self, "deletePlayedEpisodes") == 0xFFFFFFFFLL)
    v3 = +[MTPodcast deletePlayedEpisodesDefaultValue](MTPodcast, "deletePlayedEpisodesDefaultValue");
  else
    v3 = -[MTPodcast deletePlayedEpisodes](self, "deletePlayedEpisodes");
  return v3 != 0;
}

+ (int64_t)deletePlayedEpisodesDefaultValue
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MTPodcastDeletePlayedEpisodesDefaultKey"));

  return v3;
}

- (BOOL)currentEpisodeLimitAllowsAutomaticDownloads
{
  MTPodcast *v2;
  char v3;

  v2 = self;
  v3 = MTPodcastEpisodeLimit.allowsAutomaticDownloads.getter(-[MTPodcast episodeLimit](v2, sel_episodeLimit));

  return v3 & 1;
}

- (id)metricsAdditionalData
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("subscribed");
  v9[1] = CFSTR("updatedDate");
  v9[2] = CFSTR("playbackNewestToOldest");
  v9[3] = CFSTR("episodeLimit");
  v9[4] = CFSTR("darkCount");
  v9[5] = CFSTR("deletePlayedEpisodes");
  v9[6] = CFSTR("sortAscending");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPodcast dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("settings");
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)metricsContentIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MTPodcast storeCollectionId](self, "storeCollectionId"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), -[MTPodcast storeCollectionId](self, "storeCollectionId"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("adamId"));

  }
  -[MTPodcast currentFeedURL](self, "currentFeedURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("feedUrl"));
  -[MTPodcast title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  return v3;
}

- (id)bestFeedURLExcludingRedirectURL:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  _BOOL4 v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPodcast redirectURL](self, "redirectURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v7, "length") && !v3)
    objc_msgSend(v5, "addObject:", v7);
  -[MTPodcast updatedFeedURL](self, "updatedFeedURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[MTPodcast updatedFeedURL](self, "updatedFeedURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

  }
  -[MTPodcast feedURL](self, "feedURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[MTPodcast feedURL](self, "feedURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
LABEL_10:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v17)
        objc_enumerationMutation(v14);
      v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v18);
      if (!v3
        || !objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v18), "isEqualToString:", v7, (_QWORD)v30))
      {
        break;
      }
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v16)
          goto LABEL_10;
        goto LABEL_17;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v19, (_QWORD)v30);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_30;
    if (!v20)
      goto LABEL_30;
    objc_msgSend(v20, "absoluteString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = +[MTPodcast isRedirectURL:](MTPodcast, "isRedirectURL:", v21);

    if (!v22)
      goto LABEL_30;
    if (+[PFClientUtil supportsMetrics](PFClientUtil, "supportsMetrics"))
    {
      if (v7)
        v23 = v7;
      else
        v23 = &stru_1E5500770;
      v34[0] = CFSTR("firstAttempt");
      v34[1] = CFSTR("skippedFeedURL");
      v35[0] = v23;
      objc_msgSend(v20, "absoluteString");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (const __CFString *)v24;
      else
        v26 = &stru_1E5500770;
      v35[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("skipping_redirect_url_fallback"), self, v27);

    }
    v28 = 0;
  }
  else
  {
LABEL_17:

    v20 = 0;
LABEL_30:
    v20 = v20;
    v28 = v20;
  }

  return v28;
}

- (id)currentFeedURL
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  -[MTPodcast updatedFeedURL](self, "updatedFeedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MTDBUtil isSupportedUrlString:](MTDBUtil, "isSupportedUrlString:", v3);

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    -[MTPodcast updatedFeedURL](self, "updatedFeedURL");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MTPodcast feedURL](self, "feedURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[MTDBUtil isSupportedUrlString:](MTDBUtil, "isSupportedUrlString:", v7);

    if (!v8)
    {
      v10 = 0;
      return v10;
    }
    v5 = (void *)MEMORY[0x1E0C99E98];
    -[MTPodcast feedURL](self, "feedURL");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;
  objc_msgSend(v5, "URLWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)redirectURL
{
  return +[MTPodcast redirectURLForStoreCollectionId:](MTPodcast, "redirectURLForStoreCollectionId:", -[MTPodcast storeCollectionId](self, "storeCollectionId"));
}

+ (id)redirectURLForStoreCollectionId:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "syncStringForKey:", CFSTR("podcast-redirect-url-prefix"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAppendingString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)predicateForNotHiddenPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("hidden"));
}

- (BOOL)importing
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 5) & 1;
}

- (BOOL)isExplicit
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 8) & 1;
}

- (BOOL)playbackNewestToOldest
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 3) & 1;
}

+ (id)predicateForPeriodicallyUpdatablePodcasts
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  +[MTPodcast predicateForNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotImplicitlyFollowedPodcasts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncValueForKey:", CFSTR("podcast-skip-feed-update-interval-seconds"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForPodcastsUpdatedBefore:](MTPodcast, "predicateForPodcastsUpdatedBefore:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "AND:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForNotImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("isImplicitlyFollowed"));
}

+ (id)predicateForPodcastsUpdatedBefore:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isLessThanDate:", CFSTR("updatedDate"), a3);
}

+ (id)predicateForPodcastStoreId:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("storeCollectionId"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPodcastWithFeedUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("feedURL"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("updatedFeedURL"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "OR:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[MTPodcast isRedirectURL:](MTPodcast, "isRedirectURL:", v4))
    {
      v8 = +[MTPodcast storeCollectionIdForRedirectURL:](MTPodcast, "storeCollectionIdForRedirectURL:", v4);
      if (v8 >= 1)
      {
        objc_msgSend(a1, "predicateForPodcastStoreId:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "OR:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "falsePredicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (BOOL)isRedirectURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncStringForKey:", CFSTR("podcast-redirect-url-prefix"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = objc_msgSend(v3, "hasPrefix:", v5);
  else
    v6 = 0;

  return v6;
}

+ (id)sortDescriptorsForNewestToOldest:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v5;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v6;
    v7 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeLevel"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("title"), 1, sel_localizedStandardCompare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = v6;
    v7 = v10;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForNotHiddenNotImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("isHiddenOrImplicitlyFollowed"));
}

- (id)bestAvailableStoreCleanURL
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MTPodcast storeCleanURL](self, "storeCleanURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    -[MTPodcast storeCleanURL](self, "storeCleanURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", -[MTPodcast storeCollectionId](self, "storeCollectionId")))v8 = +[MTPodcast storeCleanURLForAdamID:](MTPodcast, "storeCleanURLForAdamID:", -[MTPodcast storeCollectionId](self, "storeCollectionId"));
    v7 = 0;
  }
  return v7;
}

- (BOOL)isSerialShowTypeInFeed
{
  void *v2;
  BOOL v3;

  -[MTPodcast showTypeInFeed](self, "showTypeInFeed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MTPodcast showTypeFromString:](MTPodcast, "showTypeFromString:", v2) == 2;

  return v3;
}

+ (int64_t)showTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  v4 = +[MTPodcast defaultShowType](MTPodcast, "defaultShowType");
  if (v3)
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("serial")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("episodic")))
      {
        if (!objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("oldestToNewest")))
          v4 = 4;
      }
      else
      {
        v4 = 1;
      }
    }
    else
    {
      v4 = 2;
    }
  }

  return v4;
}

+ (int64_t)defaultShowType
{
  return 1;
}

+ (double)defaultUpdateInterval
{
  return 3600.0;
}

+ (id)predicateForSubscribedAndNotHidden
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 1 AND %K = 0"), CFSTR("subscribed"), CFSTR("hidden"));
}

+ (id)predicateForPodcastsWithLibraryEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("libraryEpisodesCount"));
}

+ (id)predicateForPodcastUuids:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), a3);
}

+ (id)predicateForPodcastUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), a3);
}

+ (id)predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0 AND %K = 0"), CFSTR("subscribed"), CFSTR("isHiddenOrImplicitlyFollowed"));
}

+ (id)predicateForPodcastsNeedingRetry:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("(%K & %lld) == %lld");
  else
    v3 = CFSTR("(%K & %lld) != %lld");
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, CFSTR("flags"), 4096, 4096);
}

- (id)newestEpisodeExcludingUuid:(id)a3 excludeExplicit:(int64_t)a4
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:", 1, 0, 0, 0, a4, a3);
}

- (id)newestEpisode
{
  return -[MTPodcast newestEpisodeExcludingUuid:excludeExplicit:](self, "newestEpisodeExcludingUuid:excludeExplicit:", 0, 0);
}

- (id)newestEpisodeByAvailabiltyTime
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:", 1, 1, 0, 0, 0, 0);
}

- (id)newestFullEpisode
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:", 1, 0, 0, 0, 0, 1);
}

- (id)nextEpisodeNotPlayedExcludingExplicit:(int64_t)a3 episodeTypeFilter:(int64_t)a4
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:", 1, 0, 0, 1, a3, 0, a4);
}

- (id)newestUserEpisodeExcludingExplicit:(int64_t)a3
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:", 1, 0, 1, 0, a3);
}

- (id)oldestEpisodeExcludingExplicit:(int64_t)a3
{
  return -[MTPodcast oldestEpisodeExcludingExplicit:episodeTypeFilter:](self, "oldestEpisodeExcludingExplicit:episodeTypeFilter:", a3, 0);
}

- (id)oldestEpisodeExcludingExplicit:(int64_t)a3 episodeTypeFilter:(int64_t)a4
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:", 0, 0, 0, 0, a3, 0, a4);
}

- (id)oldestUserEpisodeExcludingExplicit:(int64_t)a3
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:", 0, 0, 1, 0, a3);
}

- (id)mostRecentlyPlayedEpisodeWithFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  if (objc_msgSend(v4, "playStateFilter"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v5, "setPlayStateFilter:", 0);
    v4 = v5;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  objc_initWeak(&location, self);
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MTPodcast_EpisodeLookup__mostRecentlyPlayedEpisodeWithFilter___block_invoke;
  v11[3] = &unk_1E54D12E0;
  objc_copyWeak(&v15, &location);
  v7 = v4;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v17;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = (id)v18[5];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __64__MTPodcast_EpisodeLookup__mostRecentlyPlayedEpisodeWithFilter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForHasBeenPlayed](MTEpisode, "predicateForHasBeenPlayed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForExternalType:](MTEpisode, "predicateForExternalType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForHidingFuturePlayedTimestamps](MTEpisode, "predicateForHidingFuturePlayedTimestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AND:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastDatePlayed"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("playState"), 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("pubDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v9, v13, 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

- (id)highestNumberedEpisodePublishedBefore:(double)a3 filter:(id)a4
{
  void *v4;
  void *v5;

  -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:", 0, 0, 0, 1, a4, 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)newestEpisodeWithFilter:(id)a3
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:filter:](self, "_latestOrOldestEpisode:sortDate:filter:", 1, 0, a3);
}

- (id)lowestNumberedEpisodePublishedAfter:(double)a3 filter:(id)a4
{
  void *v4;
  void *v5;

  -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:", 1, 0, 1, 1, a4, 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)episodePublishedBefore:(double)a3 filter:(id)a4
{
  void *v4;
  void *v5;

  -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:", 0, 0, 1, 0, a4, 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)episodesPublishedAfter:(double)a3 filter:(id)a4 limit:(int64_t)a5 sortAsc:(BOOL)a6
{
  return -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:", 1, 0, a6, 0, a4, a5, a3);
}

- (id)episodePublishedAfter:(double)a3 filter:(id)a4
{
  void *v4;
  void *v5;

  -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:", 1, 0, 0, 0, a4, 1, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)highestNumberedPlayedEpisodeWithFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  MTPodcast *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __67__MTPodcast_EpisodeLookup__highestNumberedPlayedEpisodeWithFilter___block_invoke;
  v14 = &unk_1E54D1308;
  v6 = v4;
  v15 = v6;
  v16 = self;
  v18 = &v19;
  v7 = v5;
  v17 = v7;
  objc_msgSend(v7, "performBlockAndWait:", &v11);
  v8 = (void *)v20[5];
  if (v8)
  {
    objc_msgSend(v8, "firstObject", v11, v12, v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __67__MTPodcast_EpisodeLookup__highestNumberedPlayedEpisodeWithFilter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForHasEpisodeNumber](MTEpisode, "predicateForHasEpisodeNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "AND:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode sortDescriptorsForSeasonAndEpisodeNumberAscending:](MTEpisode, "sortDescriptorsForSeasonAndEpisodeNumberAscending:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v5, v6, 0, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)nextNumberedUnplayedEpisodeAfter:(id)a3 filter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  MTPodcast *v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = a4;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isVisuallyPlayed")
    && objc_msgSend(v6, "episodeNumber")
    && objc_msgSend(v6, "episodeNumber") >= 1)
  {
    v9 = v6;
  }
  else
  {
    -[MTPodcast highestNumberedPlayedEpisodeWithFilter:](self, "highestNumberedPlayedEpisodeWithFilter:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__MTPodcast_EpisodeLookup__nextNumberedUnplayedEpisodeAfter_filter___block_invoke;
  v17[3] = &unk_1E54D1330;
  v11 = v7;
  v18 = v11;
  v19 = self;
  v12 = v10;
  v20 = v12;
  v22 = &v23;
  v13 = v8;
  v21 = v13;
  objc_msgSend(v13, "performBlockAndWait:", v17);
  v14 = (void *)v24[5];
  if (v14)
  {
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __68__MTPodcast_EpisodeLookup__nextNumberedUnplayedEpisodeAfter_filter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForEpisodeTypeFilter:](MTEpisode, "predicateForEpisodeTypeFilter:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "AND:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    +[MTEpisode predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:seasonNumber:](MTEpisode, "predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:seasonNumber:", objc_msgSend(v6, "episodeNumber"), objc_msgSend(*(id *)(a1 + 48), "seasonNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "AND:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  +[MTEpisode sortDescriptorsForSeasonAndEpisodeNumberAscending:](MTEpisode, "sortDescriptorsForSeasonAndEpisodeNumberAscending:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v5, v9, 0, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)oldestEpisodeInLatestSeasonOrShowWithFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MTPodcast_EpisodeLookup__oldestEpisodeInLatestSeasonOrShowWithFilter___block_invoke;
  v9[3] = &unk_1E54D1358;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performBlockAndWait:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__MTPodcast_EpisodeLookup__oldestEpisodeInLatestSeasonOrShowWithFilter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "latestSeasonNumber");
  v3 = *(void **)(a1 + 32);
  if (v2 < 1)
  {
    objc_msgSend(v3, "lowestNumberedEpisodeWithFilter:", *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    objc_msgSend(v3, "episodesInSeasonNumber:lowestNumberedEpisodesFirst:filter:limit:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = v10;
  }

}

- (id)lowestNumberedEpisodeWithFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  objc_initWeak(&location, self);
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MTPodcast_EpisodeLookup__lowestNumberedEpisodeWithFilter___block_invoke;
  v10[3] = &unk_1E54D12E0;
  objc_copyWeak(&v14, &location);
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v16;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v17[5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __60__MTPodcast_EpisodeLookup__lowestNumberedEpisodeWithFilter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForHidingFuturePlayedTimestamps](MTEpisode, "predicateForHidingFuturePlayedTimestamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForExternalType:](MTEpisode, "predicateForExternalType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  +[MTEpisode sortDescriptorsForEpisodeNumberAscending:](MTEpisode, "sortDescriptorsForEpisodeNumberAscending:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v6, v8, 0, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (id)userEpisodesAfterEpisode:(id)a3
{
  return -[MTPodcast _episodesNextToEpisode:after:usePlayOrder:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:](self, "_episodesNextToEpisode:after:usePlayOrder:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", a3, 1, 1, 1, 0, 0, 0, 0);
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 episodeTypeFilter:(int64_t)a8
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:excludePlayed:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:", a3, a4, a5, a6, a7, 0, a8);
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8 episodeTypeFilter:(int64_t)a9
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:playStateFilter:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:playStateFilter:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:", a3, a4, a5, a6, a7, a8);
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 playStateFilter:(int64_t)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8 episodeTypeFilter:(int64_t)a9
{
  _BOOL8 v11;
  _BOOL8 v13;
  id v15;
  void *v16;
  void *v17;

  v11 = a5;
  v13 = a3;
  v15 = a8;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setRestrictToUserEpisodes:", v11);
  objc_msgSend(v16, "setPlayStateFilter:", a6);
  objc_msgSend(v16, "setExcludeExplicit:", a7);
  objc_msgSend(v16, "setExcludingEpisodeUuid:", v15);

  objc_msgSend(v16, "setEpisodeTypeFilter:", a9);
  -[MTPodcast _latestOrOldestEpisode:sortDate:filter:](self, "_latestOrOldestEpisode:sortDate:filter:", v13, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 filter:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  MTPodcast *v16;
  id v17;
  uint64_t *v18;
  id v19[2];
  BOOL v20;
  id location;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  objc_initWeak(&location, self);
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__MTPodcast_EpisodeLookup___latestOrOldestEpisode_sortDate_filter___block_invoke;
  v14[3] = &unk_1E54D1380;
  objc_copyWeak(v19, &location);
  v10 = v8;
  v19[1] = (id)a4;
  v15 = v10;
  v16 = self;
  v20 = a3;
  v11 = v9;
  v17 = v11;
  v18 = &v22;
  objc_msgSend(v11, "performBlockAndWait:", v14);
  v12 = (id)v23[5];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __67__MTPodcast_EpisodeLookup___latestOrOldestEpisode_sortDate_filter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForHidingFuturePlayedTimestamps](MTEpisode, "predicateForHidingFuturePlayedTimestamps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForExternalType:](MTEpisode, "predicateForExternalType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 72);
  v8 = (void *)objc_opt_class();
  v9 = *(_BYTE *)(a1 + 80) != 0;
  if (v7)
    objc_msgSend(v8, "sortDescriptorsForNewestToOldestFirstTimeAvailable:", v9);
  else
    objc_msgSend(v8, "sortDescriptorsForNewestToOldest:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v6, v10, 0, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)_episodeNextToEpisode:(id)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 restrictToUserEpisodes:(BOOL)a6 excludePlayed:(BOOL)a7 excludeExplicit:(int64_t)a8 episodeTypeFilter:(int64_t)a9
{
  void *v9;
  void *v10;

  -[MTPodcast _episodesNextToEpisode:after:usePlayOrder:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:](self, "_episodesNextToEpisode:after:usePlayOrder:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", a3, a4, a5, a6, a7, a8, a9, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_episodesNextToEpisode:(id)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 restrictToUserEpisodes:(BOOL)a6 excludePlayed:(BOOL)a7 excludeExplicit:(int64_t)a8 episodeTypeFilter:(int64_t)a9 limit:(int64_t)a10
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a3, "pubDate");
  return -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", v14, v13, 0, v12, v11, a8);
}

- (id)_episodesNextTo:(double)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 sortAsc:(BOOL)a6 restrictToUserEpisodes:(BOOL)a7 excludePlayed:(BOOL)a8 excludeExplicit:(int64_t)a9 episodeTypeFilter:(int64_t)a10 limit:(int64_t)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  void *v18;
  void *v19;
  _BOOL4 v21;

  v12 = a8;
  v13 = a7;
  v21 = a6;
  v14 = a5;
  v15 = a4;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setRestrictToUserEpisodes:", v13);
  objc_msgSend(v18, "setPlayStateFilter:", +[MTPodcastEpisodeFilter playStateFilterFromExcludePlayed:](MTPodcastEpisodeFilter, "playStateFilterFromExcludePlayed:", v12));
  objc_msgSend(v18, "setExcludeExplicit:", a9);
  objc_msgSend(v18, "setEpisodeTypeFilter:", a10);
  -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:sortByEpisodeNumber:filter:limit:", v15, v14, v21, 0, v18, a11, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_episodesNextTo:(double)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 sortAsc:(BOOL)a6 sortByEpisodeNumber:(BOOL)a7 filter:(id)a8 limit:(int64_t)a9
{
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  MTPodcast *v24;
  id v25;
  uint64_t *v26;
  id v27[3];
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v16 = a8;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  objc_initWeak(&location, self);
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__MTPodcast_EpisodeLookup___episodesNextTo_after_usePlayOrder_sortAsc_sortByEpisodeNumber_filter_limit___block_invoke;
  v22[3] = &unk_1E54D13A8;
  objc_copyWeak(v27, &location);
  v27[1] = *(id *)&a3;
  v28 = a5;
  v29 = a4;
  v18 = v16;
  v30 = a7;
  v31 = a6;
  v23 = v18;
  v24 = self;
  v26 = &v33;
  v19 = v17;
  v25 = v19;
  v27[2] = (id)a9;
  objc_msgSend(v19, "performBlockAndWait:", v22);
  v20 = (id)v34[5];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void __104__MTPodcast_EpisodeLookup___episodesNextTo_after_usePlayOrder_sortAsc_sortByEpisodeNumber_filter_limit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 88))
  {
    if (((objc_msgSend(WeakRetained, "playbackNewestToOldest") ^ (*(_BYTE *)(a1 + 89) == 0)) & 1) != 0)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isLessThanDate:", CFSTR("pubDate"), v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 1;
      goto LABEL_6;
    }
  }
  else if (!*(_BYTE *)(a1 + 89))
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanDate:", CFSTR("pubDate"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "AND:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForExternalType:](MTEpisode, "predicateForExternalType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 90))
  {
    +[MTEpisode sortDescriptorsForSeasonAndEpisodeNumberAscending:](MTEpisode, "sortDescriptorsForSeasonAndEpisodeNumberAscending:", *(unsigned __int8 *)(a1 + 91));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForHasEpisodeNumber](MTEpisode, "predicateForHasEpisodeNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "AND:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  else
  {
    v12 = (void *)objc_opt_class();
    if (*(_BYTE *)(a1 + 91))
      v13 = 1;
    else
      v13 = v4;
    objc_msgSend(v12, "sortDescriptorsForNewestToOldest:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v8, v9, 0, *(_QWORD *)(a1 + 80));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (int64_t)latestSeasonNumber
{
  void *v3;
  id v4;
  int64_t v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MTPodcast_EpisodeLookup__latestSeasonNumber__block_invoke;
  v7[3] = &unk_1E54D13D0;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __46__MTPodcast_EpisodeLookup__latestSeasonNumber__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:](MTEpisode, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("seasonNumber"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v3, v6, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("seasonNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v9, "longLongValue");

}

- (id)episodesInLatestSeasonWithLimit:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__MTPodcast_EpisodeLookup__episodesInLatestSeasonWithLimit___block_invoke;
  v8[3] = &unk_1E54D13F8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __60__MTPodcast_EpisodeLookup__episodesInLatestSeasonWithLimit___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "episodesInSeasonNumber:oldestEpisodesFirst:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", objc_msgSend(*(id *)(a1 + 32), "latestSeasonNumber"), objc_msgSend(*(id *)(a1 + 32), "sortAscending"), 0, 0, 1, *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)episodesInSeasonNumber:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (a3 < 1)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MTPodcast_EpisodeLookup__episodesInSeasonNumber___block_invoke;
  v8[3] = &unk_1E54D13F8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __51__MTPodcast_EpisodeLookup__episodesInSeasonNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "episodesInSeasonNumber:oldestEpisodesFirst:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "sortAscending"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4
{
  return -[MTPodcast episodesInSeasonNumber:oldestEpisodesFirst:excludePlayed:excludeExplicit:limit:](self, "episodesInSeasonNumber:oldestEpisodesFirst:excludePlayed:excludeExplicit:limit:", a3, a4, 0, 0, 0);
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 excludePlayed:(BOOL)a5 excludeExplicit:(int64_t)a6 limit:(int64_t)a7
{
  return -[MTPodcast episodesInSeasonNumber:oldestEpisodesFirst:excludePlayed:excludeExplicit:episodeTypeFilter:limit:](self, "episodesInSeasonNumber:oldestEpisodesFirst:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", a3, a4, a5, a6, 0, a7);
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 excludePlayed:(BOOL)a5 excludeExplicit:(int64_t)a6 episodeTypeFilter:(int64_t)a7 limit:(unint64_t)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  void *v15;
  void *v16;

  v11 = a5;
  v12 = a4;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setPlayStateFilter:", +[MTPodcastEpisodeFilter playStateFilterFromExcludePlayed:](MTPodcastEpisodeFilter, "playStateFilterFromExcludePlayed:", v11));
  objc_msgSend(v15, "setExcludeExplicit:", a6);
  objc_msgSend(v15, "setEpisodeTypeFilter:", a7);
  -[MTPodcast episodesInSeasonNumber:oldestEpisodesFirst:filter:limit:](self, "episodesInSeasonNumber:oldestEpisodesFirst:filter:limit:", a3, v12, v15, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 filter:(id)a5 limit:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  MTPodcast *v18;
  id v19;
  uint64_t *v20;
  int64_t v21;
  int64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__MTPodcast_EpisodeLookup__episodesInSeasonNumber_oldestEpisodesFirst_filter_limit___block_invoke;
  v16[3] = &unk_1E54D1420;
  v21 = a3;
  v12 = v10;
  v17 = v12;
  v18 = self;
  v23 = a4;
  v20 = &v24;
  v13 = v11;
  v19 = v13;
  v22 = a6;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __84__MTPodcast_EpisodeLookup__episodesInSeasonNumber_oldestEpisodesFirst_filter_limit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[MTEpisode predicateForSeasonNumber:](MTEpisode, "predicateForSeasonNumber:", *(_QWORD *)(a1 + 64));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode sortDescriptorsForSeasonsWithOldestEpisodesFirst:](MTEpisode, "sortDescriptorsForSeasonsWithOldestEpisodesFirst:", *(unsigned __int8 *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v3, v4, 0, *(_QWORD *)(a1 + 72));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)episodesInSeasonNumber:(int64_t)a3 lowestNumberedEpisodesFirst:(BOOL)a4 filter:(id)a5 limit:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  MTPodcast *v18;
  id v19;
  uint64_t *v20;
  int64_t v21;
  int64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__MTPodcast_EpisodeLookup__episodesInSeasonNumber_lowestNumberedEpisodesFirst_filter_limit___block_invoke;
  v16[3] = &unk_1E54D1420;
  v21 = a3;
  v12 = v10;
  v17 = v12;
  v18 = self;
  v23 = a4;
  v20 = &v24;
  v13 = v11;
  v19 = v13;
  v22 = a6;
  objc_msgSend(v13, "performBlockAndWait:", v16);
  v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __92__MTPodcast_EpisodeLookup__episodesInSeasonNumber_lowestNumberedEpisodesFirst_filter_limit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[MTEpisode predicateForSeasonNumber:](MTEpisode, "predicateForSeasonNumber:", *(_QWORD *)(a1 + 64));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode sortDescriptorsForEpisodeNumberAscending:](MTEpisode, "sortDescriptorsForEpisodeNumberAscending:", *(unsigned __int8 *)(a1 + 80));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v3, v4, 0, *(_QWORD *)(a1 + 72));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)sortDescriptorsForNewestToOldestFirstTimeAvailable:(BOOL)a3
{
  return +[MTEpisode sortDescriptorsForFirstAvailableAscending:](MTEpisode, "sortDescriptorsForFirstAvailableAscending:", !a3);
}

- (void)setPodcastPID:(int64_t)a3
{
  void *v5;

  if (-[MTPodcast podcastPID](self, "podcastPID") != a3)
  {
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("podcastPID"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("podcastPID"));

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("podcastPID"));
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MTPodcast hidden](self, "hidden") != a3)
  {
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hidden"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("hidden"));

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hidden"));
    -[MTPodcast updateIsHiddenOrImplicitlyFollowed](self, "updateIsHiddenOrImplicitlyFollowed");
  }
}

- (void)setIsImplicitlyFollowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[MTPodcast isImplicitlyFollowed](self, "isImplicitlyFollowed") != a3)
  {
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isImplicitlyFollowed"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("isImplicitlyFollowed"));

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isImplicitlyFollowed"));
    -[MTPodcast updateIsHiddenOrImplicitlyFollowed](self, "updateIsHiddenOrImplicitlyFollowed");
    if (v3)
      -[MTPodcast updateLastImplicitlyFollowedDate](self, "updateLastImplicitlyFollowedDate");
  }
}

- (void)updateLastImplicitlyFollowedDate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  -[MTPodcast setLastImplicitlyFollowedDate:](self, "setLastImplicitlyFollowedDate:");

}

- (void)updateIsHiddenOrImplicitlyFollowed
{
  uint64_t v3;

  if ((-[MTPodcast hidden](self, "hidden") & 1) != 0)
    v3 = 1;
  else
    v3 = -[MTPodcast isImplicitlyFollowed](self, "isImplicitlyFollowed");
  -[MTPodcast setIsHiddenOrImplicitlyFollowed:](self, "setIsHiddenOrImplicitlyFollowed:", v3);
}

- (BOOL)isShareable
{
  void *v2;
  BOOL v3;

  -[MTPodcast feedURL](self, "feedURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setFlags:(int64_t)a3
{
  void *v5;

  if (-[MTPodcast flags](self, "flags") != a3)
  {
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("flags"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("flags"));

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("flags"));
  }
}

- (BOOL)sortAscending
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 1) & 1;
}

- (void)setIsExplicit:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MTPodcast flags](self, "flags");
  if (((((v5 & 0x100) == 0) ^ v3) & 1) == 0)
  {
    v6 = 256;
    if (!v3)
      v6 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFEFFLL | v6);
  }
}

- (void)setFeedUpdateNeedsRetry:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MTPodcast flags](self, "flags");
  if (((((v5 & 0x1000) == 0) ^ v3) & 1) == 0)
  {
    v6 = 4096;
    if (!v3)
      v6 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFEFFFLL | v6);
  }
}

- (void)setHasBeenSynced:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MTPodcast flags](self, "flags");
  if (((((v5 & 4) == 0) ^ v3) & 1) == 0)
  {
    v6 = 4;
    if (!v3)
      v6 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFBLL | v6);
  }
}

- (BOOL)hasBeenSynced
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 2) & 1;
}

- (void)setImporting:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MTPodcast flags](self, "flags");
  if (((((v5 & 0x20) == 0) ^ v3) & 1) == 0)
  {
    v6 = 32;
    if (!v3)
      v6 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFDFLL | v6);
  }
}

- (void)setIsTransitioningFromImplicit:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[MTPodcast flags](self, "flags");
  if (((((v5 & 0x10000) == 0) ^ v3) & 1) == 0)
  {
    v6 = 0x10000;
    if (!v3)
      v6 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFEFFFFLL | v6);
  }
}

- (BOOL)isTransitioningFromImplicit
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 16) & 1;
}

- (BOOL)isAuthenticatedDark
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 11) & 1;
}

- (void)setAuthenticatedDark:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  v5 = -[MTPodcast isDark](self, "isDark");
  v6 = -[MTPodcast flags](self, "flags");
  if (((((v6 & 0x800) == 0) ^ v3) & 1) == 0)
  {
    v7 = 2048;
    if (!v3)
      v7 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v6 & 0xFFFFFFFFFFFFF7FFLL | v7);
    v8 = -[MTPodcast isDark](self, "isDark");
    -[MTPodcast latestExitFromDarkDownloads](self, "latestExitFromDarkDownloads");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v5, v8, 1, v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v5, v8, 1, v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "sendEvent:", v12);

  }
}

- (id)displayURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MTPodcast uuid](self, "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("null");
  if (v3)
    v5 = (const __CFString *)v3;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("podcasts://show?podcastUuid=%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)earliestDateForFeedFetch:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  -[MTPodcast lastFetchedDate](self, "lastFetchedDate");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPodcast calculatedUpdateInterval](self, "calculatedUpdateInterval");
  objc_msgSend(v6, "dateByAddingTimeInterval:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)calculatedUpdateInterval
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  double result;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[MTPodcast consecutiveFeedFetchErrors](self, "consecutiveFeedFetchErrors");
  if (v3 > 5)
  {
    v7 = v3;
    _MTLogCategoryFeedUpdate();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 > 0xA)
    {
      if (v9)
      {
        -[MTPodcast feedURL](self, "feedURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v11;
        v14 = 2048;
        v15 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
        _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_DEFAULT, "calculatedUpdateInterval for podcast with feedUrl %@ and storeId %lld: 1 week", (uint8_t *)&v12, 0x16u);

      }
      return 604800.0;
    }
    else
    {
      if (v9)
      {
        -[MTPodcast feedURL](self, "feedURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v10;
        v14 = 2048;
        v15 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
        _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_DEFAULT, "calculatedUpdateInterval for podcast with feedUrl %@ and storeId %lld: 1 day", (uint8_t *)&v12, 0x16u);

      }
      return 86400.0;
    }
  }
  else
  {
    _MTLogCategoryFeedUpdate();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[MTPodcast feedURL](self, "feedURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v5;
      v14 = 2048;
      v15 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
      _os_log_impl(&dword_1A904E000, v4, OS_LOG_TYPE_DEFAULT, "calculatedUpdateInterval for podcast with feedUrl %@ and storeId %lld: 4 hours", (uint8_t *)&v12, 0x16u);

    }
    +[MTPodcast defaultUpdateInterval](MTPodcast, "defaultUpdateInterval");
  }
  return result;
}

+ (int64_t)episodeLimitDefaultValue
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "episodeLimitForKey:", CFSTR("MTPodcastEpisodeLimitDefaultKey"));

  return v3;
}

+ (BOOL)autoDownloadDefaultValue
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("MTPodcastAutoDownloadStateDefaultKey")) != 0;

  return v3;
}

- (int64_t)showTypeInFeedResolvedValue
{
  void *v2;
  int64_t v3;

  -[MTPodcast showTypeInFeed](self, "showTypeInFeed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[MTPodcast showTypeFromString:](MTPodcast, "showTypeFromString:", v2);

  return v3;
}

+ (BOOL)sortOrderAscForShowType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return 0;
  if (a3 == 4 || a3 == 2)
    return 1;
  return +[MTPodcast defaultShowType](MTPodcast, "defaultShowType", v3, v4) != 1;
}

+ (id)propertiesToObserveForDownloadableEpisodes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("flags");
  v6[1] = CFSTR("feedURL");
  v6[2] = CFSTR("sortOrder");
  v6[3] = CFSTR("hidden");
  v6[4] = CFSTR("playbackNewestToOldest");
  v6[5] = CFSTR("episodeLimit");
  v6[6] = CFSTR("nextEpisodeUuid");
  v6[7] = CFSTR("deletePlayedEpisodes");
  v6[8] = CFSTR("sortAscending");
  v6[9] = CFSTR("showTypeSetting");
  v6[10] = CFSTR("showTypeInFeed");
  v6[11] = CFSTR("episodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDark
{
  return -[MTPodcast isAuthenticatedDark](self, "isAuthenticatedDark")
      || -[MTPodcast isPastAutodownloadOrEpisodeLimitDark](self, "isPastAutodownloadOrEpisodeLimitDark");
}

- (void)resetGoDarkWithReason:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[MTPodcast darkCount](self, "darkCount") >= 5)
  {
    +[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));

  }
  if (-[MTPodcast isDark](self, "isDark"))
  {
    -[MTPodcast latestExitFromDarkDownloads](self, "latestExitFromDarkDownloads");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", 1, 0, a3, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", 1, 0, a3, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "sendEvent:", v7);

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTPodcast suppressEpisodesWithBasisDate:](self, "suppressEpisodesWithBasisDate:", v10);
    -[MTPodcast setLatestExitFromDarkDownloads:](self, "setLatestExitFromDarkDownloads:", v10);

  }
  -[MTPodcast setDarkCount:](self, "setDarkCount:", 0);
  -[MTPodcast setDarkCountLocal:](self, "setDarkCountLocal:", 0);
  -[MTPodcast updateLastTouchDate](self, "updateLastTouchDate");
}

- (void)updateLastTouchDate
{
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[MTPodcast setLastTouchDate:](self, "setLastTouchDate:");
}

- (void)suppressEpisodesWithBasisDate:(id)a3
{
  id v4;
  void *v5;
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
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  _QWORD v39[5];

  v39[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C97AB0], "batchUpdateRequestWithEntityName:", CFSTR("MTEpisode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  -[MTPodcast uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v8;
  +[MTEpisode predicateForDownloadBehavior:](MTEpisode, "predicateForDownloadBehavior:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v9;
  v28 = v4;
  +[MTEpisode predicateForEpisodesPublishedBeforeDate:](MTEpisode, "predicateForEpisodesPublishedBeforeDate:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v10;
  +[MTEpisode predicateForEpisodesWithinLevel:](MTEpisode, "predicateForEpisodesWithinLevel:", -[MTPodcast levelForDownloadsOnSubscription](self, "levelForDownloadsOnSubscription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "NOT");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v14);

  v37 = CFSTR("downloadBehavior");
  v38 = &unk_1E5538C00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertiesToUpdate:", v15);

  objc_msgSend(v5, "setResultType:", 1);
  -[MTPodcast managedObjectContext](self, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v16, "executeRequest:error:", v5, &v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v29;

  objc_msgSend(v17, "result");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v35 = *MEMORY[0x1E0C97A20];
    objc_msgSend(v17, "result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0C97B88];
    -[MTPodcast managedObjectContext](self, "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mergeChangesFromRemoteContextSave:intoContexts:", v21, v24);

    _MTLogCategoryDatabase();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v28;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "result");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v28;
      v32 = 2112;
      v33 = v27;
      _os_log_impl(&dword_1A904E000, v25, OS_LOG_TYPE_INFO, "Batch suppressed episodes because of basis date (%@): %@", buf, 0x16u);

    }
  }
  else
  {
    _MTLogCategoryDatabase();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v28;
      v31 = v28;
      v32 = 2112;
      v33 = v18;
      _os_log_impl(&dword_1A904E000, v21, OS_LOG_TYPE_ERROR, "Failed to suppressed episodes with basis date. (%@): %@", buf, 0x16u);
    }
    else
    {
      v26 = v28;
    }
  }

}

- (unint64_t)levelForDownloadsOnSubscription
{
  _BOOL4 v2;
  unint64_t *v3;

  v2 = -[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed");
  v3 = (unint64_t *)&kMaxSubscribeDownloadForSerialWithSeasons;
  if (!v2)
    v3 = (unint64_t *)&kMaxSubscribeDownloadForNonSerialShow;
  return *v3;
}

+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 showTypeInFeed:(id)a7 title:(id)a8 author:(id)a9 provider:(id)a10 imageUrl:(id)a11 description:(id)a12 adamId:(int64_t)a13 displayType:(id)a14 showSpecificUpsellCopy:(id)a15
{
  void *v15;

  +[MTPodcast insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:showTypeInFeed:title:author:provider:imageUrl:description:displayType:showSpecificUpsellCopy:](MTPodcast, "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:showTypeInFeed:title:author:provider:imageUrl:description:displayType:showSpecificUpsellCopy:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a14, a15);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", a13))
    objc_msgSend(v15, "setStoreCollectionId:", a13);
  return v15;
}

+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 title:(id)a7 author:(id)a8 provider:(id)a9 imageUrl:(id)a10 description:(id)a11
{
  return (id)objc_msgSend(a1, "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:showTypeInFeed:title:author:provider:imageUrl:description:displayType:showSpecificUpsellCopy:", a3, a4, a5, a6, 0, a7, a8, a9, a10, a11, 0, 0);
}

+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 showTypeInFeed:(id)a7 title:(id)a8 author:(id)a9 provider:(id)a10 imageUrl:(id)a11 description:(id)a12 displayType:(id)a13 showSpecificUpsellCopy:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  id v34;
  id v35;
  void *v36;

  v31 = a4;
  v17 = a3;
  v18 = a5;
  v35 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  v34 = a13;
  v24 = a14;
  v36 = v17;
  objc_msgSend(v17, "podcastForFeedUrl:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", 0);
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C97B20], "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("MTPodcast"), v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setUuid:", v26);

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v25, "setAddedDate:");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v25, "setModifiedDate:");
    objc_msgSend(v25, "setUpdateInterval:", 0);
    objc_msgSend(v25, "updateLastTouchDate");
    objc_msgSend(v25, "setFeedURL:", v18);
    objc_msgSend(v25, "setAuthor:", v20);
    objc_msgSend(v25, "setProvider:", v21);
    objc_msgSend(v25, "setImageURL:", v22);
    objc_msgSend(v25, "setTitle:", v19);
    objc_msgSend(v25, "setItemDescription:", v23);
    objc_msgSend(v25, "setSubscribed:");
    objc_msgSend(v25, "setDeletePlayedEpisodes:", 0xFFFFFFFFLL);
    objc_msgSend(v25, "setNeedsArtworkUpdate:", 1);
    objc_msgSend(v25, "setDisplayType:", v34);
    objc_msgSend(v25, "setShowSpecificUpsellCopy:", v24);
    if (v35)
      objc_msgSend(v25, "setShowTypeInFeed:", v35);
    if (v31)
      objc_msgSend(v25, "applyFollowedShowSettingsFor:", a6);
    else
      objc_msgSend(v25, "applyUnfollowedShowSettings", a6);
    objc_msgSend(v25, "setUpdatedDate:", 0.0);
    objc_msgSend(v25, "setSortOrder:", objc_msgSend(v17, "nextSortOrderForPodcasts"));
    objc_msgSend(a1, "prepareForPlatform:", v25);
  }
  +[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(v25, "syncType"));

  v28 = (void *)objc_opt_new();
  objc_msgSend(v25, "feedURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "resetVersionForFeedUrl:", v29);

  return v25;
}

+ (unint64_t)totalUnplayedCount
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainOrPrivateContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__MTPodcast_Library__totalUnplayedCount__block_invoke;
  v7[3] = &unk_1E54D19C0;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __40__MTPodcast_Library__totalUnplayedCount__block_invoke(uint64_t a1)
{
  id v2;

  +[MTEpisode predicateForEpisodesOnUnplayedTab](MTEpisode, "predicateForEpisodesOnUnplayedTab");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "countOfObjectsInEntity:predicate:", CFSTR("MTEpisode"), v2);

}

- (id)shareURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[MTPodcast bestAvailableStoreCleanURL](self, "bestAvailableStoreCleanURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MTPodcast currentFeedURL](self, "currentFeedURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)storeCleanURLForAdamID:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:"))
  {
    v4 = 0;
  }
  else
  {
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncStringForKey:", CFSTR("viewPodcast"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewPodcast")))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("id"), v8);
      }
      else
      {
        objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("/id%lld"), a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
      }
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (id)productURLForStoreCollectionId:(int64_t)a3 storeTrackId:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  +[MTPodcast storeCleanURLForAdamID:](MTPodcast, "storeCleanURLForAdamID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("i"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)twitterShareURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MTPodcast storeCleanURL](self, "storeCleanURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    -[MTPodcast storeShortURL](self, "storeShortURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)storeCollectionIdForRedirectURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  if (objc_msgSend(a1, "isRedirectURL:", v4))
  {
    +[IMURLBag sharedInstance](IMURLBag, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncStringForKey:", CFSTR("podcast-redirect-url-prefix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v6, &stru_1E5500770);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "longLongValue");
    if ((unint64_t)(v8 - 0x7FFFFFFFFFFFFFFFLL) >= 2)
      v9 = v8;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)updatedAtString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "podcastsFoundationBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SHOW_UPDATED_AT_FORMAT"), &stru_1E5500770, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0C99D68];
  -[MTPodcast latestEpisodeAvailabilityTime](self, "latestEpisodeAvailabilityTime");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "friendlyDisplayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)requestsAreNonAppInitiated
{
  return +[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", -[MTPodcast storeCollectionId](self, "storeCollectionId"));
}

- (void)markPlaylistsForUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MTPodcast playlistSettings](self, "playlistSettings", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "setNeedsUpdate:", 1);
        objc_msgSend(v7, "playlist");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNeedsUpdate:", 1);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

+ (id)episodeLimitsAllowingAutomaticDownloads
{
  if (episodeLimitsAllowingAutomaticDownloads_onceToken != -1)
    dispatch_once(&episodeLimitsAllowingAutomaticDownloads_onceToken, &__block_literal_global_13);
  return (id)episodeLimitsAllowingAutomaticDownloads_limits;
}

void __65__MTPodcast_NSPredicate__episodeLimitsAllowingAutomaticDownloads__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  +[MTPodcastEpisodeLimitHelper allGlobalLimits](MTPodcastEpisodeLimitHelper, "allGlobalLimits", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * i);
        if (+[MTPodcastEpisodeLimitHelper limitAllowsAutomaticDownloads:](MTPodcastEpisodeLimitHelper, "limitAllowsAutomaticDownloads:", objc_msgSend(v6, "longLongValue")))
        {
          objc_msgSend(v0, "addObject:", v6);
        }
        objc_storeStrong((id *)&episodeLimitsAllowingAutomaticDownloads_limits, v0);
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

+ (id)userDefaultPropertiesAffectingPredicates
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("MTPodcastAutoDownloadStateDefaultKey");
  v6[1] = CFSTR("MTPodcastEpisodeLimitDefaultKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForHiddenPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 1"), CFSTR("hidden"));
}

+ (id)predicateForImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 1"), CFSTR("isImplicitlyFollowed"));
}

+ (id)predicateForImplicitlyFollowedPodcastsExcludingUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "predicateForImplicitlyFollowedPodcasts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("!(%K IN %@)"), CFSTR("uuid"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "AND:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForHiddenOrImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 1"), CFSTR("isHiddenOrImplicitlyFollowed"));
}

+ (id)predicateForNotImplicitlyFollowedPodcastsWithChannelStoreId:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("channelStoreId"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForSubscribedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 1"), CFSTR("subscribed"));
}

+ (id)predicateForNonFollowedShowsWithPlayState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "predicateForNotHiddenPodcasts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForNotSubscribedPodcasts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY(%K, $episode, $episode.%K != %@ AND ($episode.%K = %@ OR $episode.%K != %@ OR $episode.%K = %@)).@count > 0"), CFSTR("episodes"), CFSTR("playState"), &unk_1E5539368, CFSTR("backCatalog"), MEMORY[0x1E0C9AAA0], CFSTR("playState"), &unk_1E5539380, CFSTR("playStateManuallySet"), MEMORY[0x1E0C9AAA0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "AND:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "AND:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "predicateForImplicitlyFollowedPodcasts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OR:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForLastDatePlayedAfterDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanDate:", CFSTR("lastDatePlayed"), a3);
}

+ (id)predicateForLastDatePlayedNotInTheFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForDateKey:isLessThanOrEqualToDate:", CFSTR("lastDatePlayed"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForNotSubscribedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = 0"), CFSTR("subscribed"));
}

+ (id)predicateForHasBeenSynced:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K != NULL) && ((%K & %lld) == %lld)"), CFSTR("flags"), CFSTR("flags"), 4, v3);
}

+ (id)predicateForImporting:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("(%K & %lld) == %lld");
  else
    v3 = CFSTR("(%K & %lld) != %lld");
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, CFSTR("flags"), 32, 32);
}

+ (id)predicateForAutoDownloadEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "episodeLimitsAllowingAutomaticDownloads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("episodeLimit"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "episodeLimitForKey:", CFSTR("MTPodcastEpisodeLimitDefaultKey"));

  if (+[MTPodcastEpisodeLimitHelper limitAllowsAutomaticDownloads:](MTPodcastEpisodeLimitHelper, "limitAllowsAutomaticDownloads:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %llu"), CFSTR("episodeLimit"), 0x100000001);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "OR:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

+ (id)predicateForPodcastsFetchedBefore:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isLessThanDate:", CFSTR("lastFetchedDate"), a3);
}

+ (id)predicateForPodcastsFollowedSince:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isGreaterThanDate:", CFSTR("addedDate"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForSubscribedPodcasts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPodcastWithTitle:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("title"), v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "falsePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForHiddenPodcastUuids:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "predicateForPodcastUuids:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForHiddenPodcasts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForIdentifer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "falsePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v3, "feedUrl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPodcast predicateForPodcastWithFeedUrl:](MTPodcast, "predicateForPodcastWithFeedUrl:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend(v3, "storeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue");
  if (v10)
  {
    +[MTPodcast predicateForPodcastStoreId:](MTPodcast, "predicateForPodcastStoreId:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "OR:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }

  return v4;
}

+ (id)predicateForPodcastStoreIDs:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("storeCollectionId"), a3);
}

+ (id)predicateForAreMediaAPI:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("%K != %@");
  else
    v3 = CFSTR("%K = %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, CFSTR("storeCollectionId"), &unk_1E5539398);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)predicateForPodcastWithPodcastPID:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("podcastPID"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPaidSubscriptionActive:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("(%K.%K != NULL) && (%K.%K = 1)");
  else
    v3 = CFSTR("NOT ((%K.%K != NULL) && (%K.%K = 1))");
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v3, CFSTR("channel"), CFSTR("subscriptionActive"), CFSTR("channel"), CFSTR("subscriptionActive"));
}

+ (id)predicateForEntitledShows
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "predicateForPaidSubscriptionActive:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForShowsWithPlayableFreeEpisodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "OR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForPodcastsWithDownloadedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("downloadedEpisodesCount"));
}

+ (id)predicateForPodcastsWithUnplayedDownloadedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("downloadedUnplayedEpisodesCount"));
}

+ (id)predicateForPodcastsWithBookmarkedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("savedEpisodesCount"));
}

+ (id)predicateForPodcastsWithUnplayedBookmarkedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != 0"), CFSTR("savedUnplayedEpisodesCount"));
}

+ (id)predicateForWatchLibraryShows
{
  void *v2;
  void *v3;
  void *v4;

  +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForEntitledShows](MTPodcast, "predicateForEntitledShows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)recentlyUnfollowedCutoffDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
}

+ (id)predicateForRecentlyUnfollowed
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateForDateKey:isGreaterThanDate:", CFSTR("lastUnfollowedDate"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForRecentlyUnfollowedOlderThanCutoffDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "recentlyUnfollowedCutoffDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForLastUnfollowedDateOlderThanDate:](MTPodcast, "predicateForLastUnfollowedDateOlderThanDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForNilLastUnfollowedDate](MTPodcast, "predicateForNilLastUnfollowedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "OR:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForLastUnfollowedDateOlderThanDate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForDateKey:isLessThanDate:", CFSTR("lastUnfollowedDate"), a3);
}

+ (id)predicateForNilLastUnfollowedDate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateForNilValueForKey:", CFSTR("lastUnfollowedDate"));
}

+ (id)_predicateForShowsWithPlayableFreeEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %lu"), CFSTR("offerTypes"), 2);
}

+ (id)predicateForPodcastsToAutodownload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForAutoDownloadEnabled](MTPodcast, "predicateForAutoDownloadEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AND:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForExcludingExplicitBasedOnSetting](MTPodcast, "predicateForExcludingExplicitBasedOnSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "AND:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPodcastToAutoRemove
{
  return +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
}

+ (id)predicateForExcludingExplicitBasedOnSetting
{
  if (+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed"))
    objc_msgSend(MEMORY[0x1E0CB3880], "truePredicate");
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K & %lld) == 0"), CFSTR("flags"), 256);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)podcastUuidForEpisodeUuid:(id)a3 ctx:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__8;
    v17 = __Block_byref_object_dispose__8;
    v18 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__MTPodcast_PFDB__podcastUuidForEpisodeUuid_ctx___block_invoke;
    v9[3] = &unk_1E54D13D0;
    v10 = v6;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v10, "performBlockAndWait:", v9);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __49__MTPodcast_PFDB__podcastUuidForEpisodeUuid_ctx___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  +[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("podcastUuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:", CFSTR("MTEpisode"), v3, MEMORY[0x1E0C9AA60], v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("podcastUuid"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (BOOL)needsArtworkUpdate
{
  return -[MTPodcast flags](self, "flags") & 1;
}

- (void)setNeedsArtworkUpdate:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (-[MTPodcast needsArtworkUpdate](self, "needsArtworkUpdate") != a3)
  {
    v5 = -[MTPodcast flags](self, "flags");
    if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
      -[MTPodcast setFlags:](self, "setFlags:", v5 & 0xFFFFFFFFFFFFFFFELL | v3);
  }
}

- (int64_t)syncType
{
  MTPodcast *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = self;
  v3 = -[MTPodcast displayType](v2, sel_displayType);
  if (v3)
  {
    v4 = v3;
    v5 = MTDisplayTypeFromPersistentString(v3);

    return v5 == 1;
  }
  else
  {

    return 0;
  }
}

- (void)calculateNewEpisodeCountIn:(id)a3 serialShowsUseExperimentalRules:(BOOL)a4
{
  void *v7;
  id v8;
  id v9;
  id v10;
  char **v11;
  MTPodcast *v12;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v12 = self;
  v9 = -[MTPodcast showTypeInFeed](v12, sel_showTypeInFeed);
  v10 = objc_msgSend(v7, sel_showTypeFromString_, v9);

  v11 = &selRef_calculateSerialNewEpisodeCountIn_;
  if (v10 == (id)1 || !a4)
    v11 = &selRef_calculateEpisodicNewEpisodeCountIn_;
  objc_msgSend(v12, *v11, v8);

}

- (void)calculateEpisodicNewEpisodeCountIn:(id)a3
{
  id v4;
  MTPodcast *v5;

  v4 = a3;
  v5 = self;
  sub_1A91DD5B0();

}

- (void)calculateSerialNewEpisodeCountIn:(id)a3
{
  id v4;
  MTPodcast *v5;

  v4 = a3;
  v5 = self;
  sub_1A91DE024(v4);

}

- (BOOL)shouldBeDeleted
{
  MTPodcast *v2;
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  unsigned __int8 v8;

  v2 = self;
  v3 = -[MTPodcast episodes](v2, sel_episodes);
  if (v3)
  {
    v4 = v3;
    sub_1A909E53C();
    sub_1A922ECCC();
    v5 = sub_1A93F85F8();

    sub_1A922E888(v5);
    LOBYTE(v4) = v6;
    swift_bridgeObjectRelease();
    v7 = v4 ^ 1;
  }
  else
  {
    v7 = 1;
  }
  v8 = -[MTPodcast subscribed](v2, sel_subscribed);

  return (v8 ^ 1) & v7;
}

- (BOOL)currentEpisodeLimitIsNextNEpisodes
{
  MTPodcast *v2;
  BOOL v3;

  v2 = self;
  if (-[MTPodcast isSerialShowTypeInFeed](v2, sel_isSerialShowTypeInFeed))
    v3 = sub_1A92C5A68((char *)-[MTPodcast episodeLimit](v2, sel_episodeLimit));
  else
    v3 = 0;

  return v3;
}

+ (id)importedShowArtworkURLFor:(id)a3
{
  void *v3;

  sub_1A93F8040();
  sub_1A93F8C70();
  swift_bridgeObjectRelease();
  sub_1A93F810C();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)shouldBeHiddenFromUpNext
{
  MTPodcast *v2;
  BOOL v3;

  v2 = self;
  v3 = MTPodcast.shouldBeHiddenFromUpNext.getter();

  return v3;
}

- (void)applyFollowedShowSettingsFor:(int64_t)a3
{
  MTPodcast *v4;

  v4 = self;
  -[MTPodcast setNotifications:](v4, sel_setNotifications_, 1);
  -[MTPodcast setShowTypeSetting:](v4, sel_setShowTypeSetting_, a3);
  -[MTPodcast setHidesPlayedEpisodes:](v4, sel_setHidesPlayedEpisodes_, 0);
  -[MTPodcast setEpisodeLimit:](v4, sel_setEpisodeLimit_, 0x100000001);
  -[MTPodcast setDeletePlayedEpisodes:](v4, sel_setDeletePlayedEpisodes_, 0xFFFFFFFFLL);

}

- (void)applyUnfollowedShowSettings
{
  void *v3;
  id v4;
  id v5;
  MTPodcast *v6;

  v3 = (void *)objc_opt_self();
  v6 = self;
  v4 = -[MTPodcast showTypeInFeed](v6, sel_showTypeInFeed);
  v5 = objc_msgSend(v3, sel_showTypeFromString_, v4);

  -[MTPodcast applyFollowedShowSettingsFor:](v6, sel_applyFollowedShowSettingsFor_, v5);
  -[MTPodcast setEpisodeLimit:](v6, sel_setEpisodeLimit_, 0x100000000);
  -[MTPodcast setNotifications:](v6, sel_setNotifications_, 0);

}

@end
