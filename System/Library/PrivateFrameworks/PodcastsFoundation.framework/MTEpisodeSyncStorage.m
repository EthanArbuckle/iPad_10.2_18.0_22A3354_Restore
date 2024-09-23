@implementation MTEpisodeSyncStorage

- (id)importContext
{
  void *v2;
  void *v3;

  +[MTDB sharedInstance](MTDB, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)podcastsDomainVersion
{
  void *v2;
  void *v3;

  +[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "podcastsDomainVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPodcastsDomainVersion:", v3);

}

- (id)versionForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setVersion:(id)a3 forKey:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)resetVersionForFeedUrl:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTEpisodeSyncStorage modernKeyFromFeedUrl:](self, "modernKeyFromFeedUrl:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", 0, v5);

  }
}

- (void)resetVersionForAllFeedUrls
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "dictionaryRepresentation", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("playState:")))
          objc_msgSend(v2, "setObject:forKey:", 0, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)modernKeyFromFeedUrl:(id)a3
{
  return (id)objc_msgSend(CFSTR("playState:"), "stringByAppendingString:", a3);
}

- (id)feedUrlFromModernKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(CFSTR("playState:"), "length"), &stru_1E5500770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
