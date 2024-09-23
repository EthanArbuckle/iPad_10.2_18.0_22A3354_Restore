@implementation MTPodcast(DB_App)

- (void)markPlaylistsForUpdate
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "playlistSettings", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "setNeedsUpdate:", 1);
        objc_msgSend(v6, "playlist");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setNeedsUpdate:", 1);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (uint64_t)setDeletePlayedEpisodes:()DB_App
{
  uint64_t v5;
  void *v6;

  v5 = *MEMORY[0x24BE73AB0];
  objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73AB0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPrimitiveValue:forKey:", v6, v5);

  objc_msgSend(a1, "didChangeValueForKey:", v5);
  return objc_msgSend(a1, "markPlaylistsForUpdate");
}

- (uint64_t)setLastImplicitlyFollowedDate:()DB_App
{
  uint64_t result;
  double v5;
  uint64_t v6;
  void *v7;

  result = objc_msgSend(a1, "lastImplicitlyFollowedDate");
  if (v5 < a2)
  {
    v6 = *MEMORY[0x24BE73B08];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B08]);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v7, v6);

    return objc_msgSend(a1, "didChangeValueForKey:", v6);
  }
  return result;
}

- (uint64_t)setModifiedDate:()DB_App
{
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE73858], "lenientSharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestampBoundByNow:", a2);
  v6 = v5;

  v7 = *MEMORY[0x24BE73B18];
  objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B18]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPrimitiveValue:forKey:", v8, v7);

  return objc_msgSend(a1, "didChangeValueForKey:", v7);
}

- (void)setAuthor:()DB_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "author");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "author");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73A98];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73A98]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setItemDescription:()DB_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "itemDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "itemDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73AB8];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73AB8]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
    }
  }

}

- (uint64_t)setFeedChangedDate:()DB_App
{
  uint64_t result;
  double v5;
  uint64_t v6;
  void *v7;

  result = objc_msgSend(a1, "feedChangedDate");
  if (vabdd_f64(v5, a2) > 2.22044605e-16)
  {
    v6 = *MEMORY[0x24BE73AD8];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73AD8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v7, v6);

    return objc_msgSend(a1, "didChangeValueForKey:", v6);
  }
  return result;
}

- (uint64_t)setUpdateStdDev:()DB_App
{
  uint64_t result;
  double v5;
  uint64_t v6;
  void *v7;

  result = objc_msgSend(a1, "updateStdDev");
  if (vabdd_f64(v5, a2) > 2.22044605e-16)
  {
    v6 = *MEMORY[0x24BE73B68];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B68]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v7, v6);

    return objc_msgSend(a1, "didChangeValueForKey:", v6);
  }
  return result;
}

- (uint64_t)setUpdateAvg:()DB_App
{
  uint64_t result;
  double v5;
  uint64_t v6;
  void *v7;

  result = objc_msgSend(a1, "updateAvg");
  if (vabdd_f64(v5, a2) > 2.22044605e-16)
  {
    v6 = *MEMORY[0x24BE73B60];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B60]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v7, v6);

    return objc_msgSend(a1, "didChangeValueForKey:", v6);
  }
  return result;
}

- (void)setImageURL:()DB_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "imageURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "imageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73AF8];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73AF8]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setShowTypeInFeed:()DB_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "showTypeInFeed");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "showTypeInFeed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73B30];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B30]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setWebpageURL:()DB_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "webpageURL");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "webpageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73B88];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B88]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
    }
  }

}

- (uint64_t)isValidShowTypeSetting:()DB_App
{
  return (a3 < 5) & (0x16u >> a3);
}

- (void)setShowTypeSetting:()DB_App
{
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "showTypeSetting") != a3)
  {
    v5 = objc_msgSend(a1, "isValidShowTypeSetting:", a3);
    _MTLogCategoryDatabase();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) != 0)
    {
      if (v7)
      {
        objc_msgSend(a1, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "feedURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "storeCollectionId");
        objc_msgSend(a1, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 134350083;
        v15 = a3;
        v16 = 2113;
        v17 = v8;
        v18 = 2113;
        v19 = v9;
        v20 = 2049;
        v21 = v10;
        v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_22FB0C000, v6, OS_LOG_TYPE_DEFAULT, "Switching show type setting to %{public}lld, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v14, 0x34u);

      }
      v12 = *MEMORY[0x24BE73B38];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73B38]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v13, v12);

      objc_msgSend(a1, "didChangeValueForKey:", v12);
      objc_msgSend(a1, "applyShowTypeSetting:", a3);
    }
    else
    {
      if (v7)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_22FB0C000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Ignoring attempt to set an invalid show type", (uint8_t *)&v14, 2u);
      }

    }
  }
}

- (uint64_t)applyShowTypeSetting:()DB_App
{
  uint64_t v2;
  int v3;

  v2 = objc_msgSend(MEMORY[0x24BE73820], "sortOrderAscForShowType:");
  v3 = v2;
  objc_msgSend(a1, "setSortAscending:", v2);
  return objc_msgSend(a1, "setPlaybackNewestToOldest:", v3 ^ 1u);
}

- (void)setSortAscending:()DB_App
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  _MTLogCategoryDatabase();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v6 = CFSTR("true");
    else
      v6 = CFSTR("false");
    objc_msgSend(a1, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "feedURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a1, "storeCollectionId");
    objc_msgSend(a1, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544387;
    v15 = v6;
    v16 = 2113;
    v17 = v7;
    v18 = 2113;
    v19 = v8;
    v20 = 2049;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_22FB0C000, v5, OS_LOG_TYPE_DEFAULT, "Switching SortAscendingFlag to %{public}@, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v14, 0x34u);

  }
  v11 = objc_msgSend(a1, "flags");
  if (((((v11 & 2) == 0) ^ a3) & 1) == 0)
  {
    v12 = 2;
    if (!a3)
      v12 = 0;
    objc_msgSend(a1, "setFlags:", v11 & 0xFFFFFFFFFFFFFFFDLL | v12);
    objc_msgSend(a1, "markPlaylistsForUpdate");
    objc_msgSend(MEMORY[0x24BE73860], "shared");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));

  }
}

- (unint64_t)sortAscending
{
  return ((unint64_t)objc_msgSend(a1, "flags") >> 1) & 1;
}

+ (id)allPossibleEpisodeListSortOrderProperties
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v18 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v20 = *MEMORY[0x24BE73990];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v0;
  v1 = *MEMORY[0x24BE73908];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v2;
  v3 = *MEMORY[0x24BE73948];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v4;
  v5 = *MEMORY[0x24BE739A8];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "initWithArray:", v7);

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v20, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v3, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", v5, 1, sel_localizedStandardCompare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v12);

  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v19, "mt_compactMap:", &__block_literal_global_4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)sortDescriptorsForSortOrder
{
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "isSerialShowTypeInFeed"))
  {
    objc_msgSend(a1, "seasonSortDescriptorsForSortOrder");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(a1, "sortAscending");
    v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v5 = *MEMORY[0x24BE73990];
    if ((v3 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v6;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v7;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2] = v8;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[3] = v9;
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v7;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2] = v8;
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[3] = v9;
      v10 = (void *)MEMORY[0x24BDBCE30];
      v11 = v14;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v4, "initWithArray:", v12);

    return v13;
  }
}

- (uint64_t)seasonSortDescriptorsForSortOrder
{
  return objc_msgSend(MEMORY[0x24BE737F8], "seasonSortDescriptors:", objc_msgSend(a1, "showTypeSetting"));
}

+ (id)sortDescriptorsForOldestOnTop
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73990], 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sortDescriptorsForNewestOnTop
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73990], 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73908], 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73948], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", *MEMORY[0x24BE739A8], 1, sel_localizedStandardCompare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sortDescriptorsForPlayOrder
{
  if ((objc_msgSend(a1, "isSerialShowTypeInFeed") & 1) != 0)
    objc_msgSend(a1, "sortDescriptorsForPlayOrderByEpisodeNumber");
  else
    objc_msgSend(a1, "sortDescriptorsForPlayOrderByPubDate");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)sortDescriptorsForPlayOrderByPubDate
{
  return objc_msgSend((id)objc_opt_class(), "sortDescriptorsForNewestToOldest:", objc_msgSend(a1, "playbackNewestToOldest"));
}

- (uint64_t)sortDescriptorsForPlayOrderByEpisodeNumber
{
  return objc_msgSend(MEMORY[0x24BE737F8], "seasonSortDescriptors:", objc_msgSend(a1, "showTypeSetting"));
}

- (void)setPlaybackNewestToOldest:()DB_App
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend(a1, "playbackNewestToOldest");
  v6 = objc_msgSend(a1, "flags");
  if (((((v6 & 8) == 0) ^ a3) & 1) == 0)
  {
    v7 = 8;
    if (!a3)
      v7 = 0;
    objc_msgSend(a1, "setFlags:", v6 & 0xFFFFFFFFFFFFFFF7 | v7);
    objc_msgSend(a1, "markPlaylistsForUpdate");
    objc_msgSend(MEMORY[0x24BE73860], "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(a1, "syncType"));

    if (v5 != a3)
      objc_msgSend(a1, "updateCursorPosition:", 0);
  }
}

- (uint64_t)updateCursorPosition:()DB_App
{
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__MTPodcast_DB_App__updateCursorPosition___block_invoke;
  v9[3] = &unk_24FD62CF0;
  v9[4] = a1;
  v6 = v5;
  v10 = v6;
  v11 = &v13;
  v12 = a3;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

+ (id)podcastUuidForFeedUrlString:()DB_App ctx:
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
    v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    v18 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__MTPodcast_DB_App__podcastUuidForFeedUrlString_ctx___block_invoke;
    v9[3] = &unk_24FD62828;
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

+ (id)podcastUuidForFeedUrl:()DB_App ctx:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)smartPlayEpisode
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((objc_msgSend(a1, "subscribed") & 1) != 0
    || !objc_msgSend(a1, "isSerialShowTypeInFeed")
    || objc_msgSend(a1, "latestSeasonNumber") < 1
    || (objc_msgSend(a1, "lastDatePlayed"), v2 != 0.0)
    || (objc_msgSend(a1, "seasonTrailerInSeason:", objc_msgSend(a1, "latestSeasonNumber")),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "nextEpisodeUuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_8;
    objc_msgSend(a1, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "nextEpisodeUuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "episodeForUuid:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
LABEL_8:
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setExcludeUnentitled:", 1);
      objc_msgSend(a1, "newestEpisodeWithFilter:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (id)_fetchRequestForDistinctSeasons
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BE737F8];
  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BE73998];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BE73998], 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", *MEMORY[0x24BE739E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultType:", 2);
  v11[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v7);

  objc_msgSend(v6, "setReturnsDistinctResults:", 1);
  objc_msgSend(v6, "setPredicate:", v3);
  v10 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  return v6;
}

- (uint64_t)hasAtLeastOneSeason
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
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__MTPodcast_DB_App__hasAtLeastOneSeason__block_invoke;
  v6[3] = &unk_24FD62D18;
  v6[4] = a1;
  v8 = &v9;
  v3 = v2;
  v7 = v3;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)hasMultipleSeasons
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "seasonNumbers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v1, "count") > 1;

  return v2;
}

- (id)seasonNumbers
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
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
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__MTPodcast_DB_App__seasonNumbers__block_invoke;
  v6[3] = &unk_24FD62828;
  v6[4] = a1;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)seasonTrailerInSeason:()DB_App
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = (void *)objc_opt_new();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  objc_msgSend(a1, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__MTPodcast_DB_App__seasonTrailerInSeason___block_invoke;
  v12[3] = &unk_24FD62D40;
  v7 = v5;
  v13 = v7;
  v14 = a1;
  v16 = &v18;
  v17 = a3;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v9 = (void *)v19[5];
  if (v9)
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)bestDescription
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "itemDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasHTML"))
  {
    objc_msgSend(v1, "stringBySmartlyStrippingHTML");
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  return v1;
}

@end
