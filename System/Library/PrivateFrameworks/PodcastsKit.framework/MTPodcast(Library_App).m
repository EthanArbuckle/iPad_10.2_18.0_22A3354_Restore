@implementation MTPodcast(Library_App)

- (void)setTitle:()Library_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73B58];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B58]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
      objc_msgSend(a1, "updateEpisodesMetadataIdentifiers");
    }
  }

}

- (void)setUpdatedFeedURL:()Library_App
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *MEMORY[0x24BE73B78];
  v5 = a3;
  objc_msgSend(a1, "willChangeValueForKey:", v4);
  objc_msgSend(a1, "setPrimitiveValue:forKey:", v5, v4);

  objc_msgSend(a1, "didChangeValueForKey:", v4);
  objc_msgSend(a1, "updateEpisodesMetadataIdentifiers");
  objc_msgSend(MEMORY[0x24BE73860], "shared");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));

}

- (void)setSubscribed:()Library_App
{
  uint64_t v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "subscribed") != (_DWORD)a3)
  {
    v5 = *MEMORY[0x24BE73B50];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B50]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v6, v5);

    objc_msgSend(a1, "didChangeValueForKey:", v5);
    objc_msgSend(MEMORY[0x24BE73860], "shared");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));

  }
}

- (void)setChannel:()Library_App
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "channel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(a1, "channel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE73AA8];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73AA8]);
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v8, v7);
    objc_msgSend(a1, "didChangeValueForKey:", v7);
    objc_msgSend(a1, "setChannelStoreId:", objc_msgSend(v8, "storeId"));
    objc_msgSend(a1, "_updateChannelRelationship:deassociate:", v6, 1);
    objc_msgSend(a1, "_updateChannelRelationship:deassociate:", v8, 0);

  }
}

- (void)_updateChannelRelationship:()Library_App deassociate:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "podcastUuids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v7, "mutableCopy");

    v8 = (uint64_t)v10;
    if (!v10)
      v8 = objc_opt_new();
    v11 = (id)v8;
    objc_msgSend(a1, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      objc_msgSend(v11, "removeObject:", v9);
    else
      objc_msgSend(v11, "addObject:", v9);

    objc_msgSend(v6, "setPodcastUuids:", v11);
  }
}

- (void)updateEpisodesMetadataIdentifiers
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a1, "episodes", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "updateUPPIdentifierIfNeeded");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (id)prepareForDeletion
{
  void *v2;
  objc_super v4;

  objc_msgSend(a1, "channel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateChannelRelationship:deassociate:", v2, 1);

  v4.receiver = a1;
  v4.super_class = (Class)&off_255E47630;
  return objc_msgSendSuper2(&v4, sel_prepareForDeletion);
}

+ (void)setRemovePlayedDownloadsSetting:()Library_App forPodcastUuid:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE737E8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainOrPrivateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__MTPodcast_Library_App__setRemovePlayedDownloadsSetting_forPodcastUuid___block_invoke;
  v10[3] = &unk_24FD63050;
  v11 = v7;
  v12 = v5;
  v13 = a3;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v9, "performBlockAndWaitWithSave:", v10);

}

- (uint64_t)countOfNewEpisodes
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
}

- (uint64_t)countOfUnplayedEpisodes
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
}

- (uint64_t)countOfUnplayedRssEpisodes
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__MTPodcast_Library_App__countOfUnplayedRssEpisodes__block_invoke;
  v6[3] = &unk_24FD62D18;
  v6[4] = a1;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

@end
