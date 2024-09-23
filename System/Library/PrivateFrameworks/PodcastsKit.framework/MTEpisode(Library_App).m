@implementation MTEpisode(Library_App)

+ (id)dateLabelDescriptionForEpisode:()Library_App download:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_14;
  +[MTReachability sharedInstance](MTReachability, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "reasonForNoInternet");

  v9 = objc_msgSend(MEMORY[0x24BE737F8], "downloadSizeLimitForEpisode:", v5);
  if (objc_msgSend(v6, "downloadBytes") <= v9)
  {
    v11 = 0;
  }
  else
  {
    +[MTReachability sharedInstance](MTReachability, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isReachableViaCellular");

  }
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v8 == 2)
      v14 = 1;
    else
      v14 = v11;
    if (v14 == 1)
    {
      v15 = MGGetBoolAnswer();
      v16 = CFSTR("WIFI_CONNECT_RESUME");
      if (v15)
        v16 = CFSTR("WLAN_CONNECT_RESUME");
      v17 = (void *)MEMORY[0x24BDD1488];
      v18 = v16;
      objc_msgSend(v17, "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", v18, &stru_24FD64198, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
LABEL_14:
    switch(objc_msgSend(v6, "downloadPhase"))
    {
      case 1:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v21;
        v22 = CFSTR("Preparing to download...");
        goto LABEL_21;
      case 2:
        objc_msgSend(v6, "downloadDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 3:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v21;
        v22 = CFSTR("TAP_TO_RESUME_DOWNLOAD");
        goto LABEL_21;
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v21;
        v22 = CFSTR("Waiting");
        goto LABEL_21;
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v21;
        v22 = CFSTR("DOWNLOAD_ERROR_TAP_TO_RETRY");
LABEL_21:
        objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_24FD64198, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      default:
        v20 = 0;
        goto LABEL_23;
    }
  }
  +[MTReachability sharedInstance](MTReachability, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reasonTextForNoInternet");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v20 = (void *)v13;

LABEL_23:
  return v20;
}

+ (uint64_t)downloadSizeLimitForEpisode:()Library_App
{
  return objc_msgSend(a1, "downloadSizeLimitForVideo:", objc_msgSend(a3, "isVideo"));
}

+ (uint64_t)downloadSizeLimitForVideo:()Library_App
{
  return 0;
}

- (void)setGuid:()Library_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  unint64_t v9;

  v9 = a3;
  objc_msgSend(a1, "guid");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v9 | v4;

  if (v5)
  {
    objc_msgSend(a1, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE73930];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73930]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v9, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
      objc_msgSend(a1, "updateUPPIdentifierIfNeeded");
    }
  }

}

- (void)setTitle:()Library_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = a3;
  objc_msgSend(a1, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v10 | v4;

  if (v5)
  {
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v10);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE739A8];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE739A8]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v10, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
      objc_msgSend(a1, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        objc_msgSend(a1, "updateUPPIdentifierIfNeeded");
    }
  }

}

- (void)setAuthor:()Library_App
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = a3;
  objc_msgSend(a1, "author");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v10 | v4;

  if (v5)
  {
    objc_msgSend(a1, "author");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v10);

    if ((v7 & 1) == 0)
    {
      v8 = *MEMORY[0x24BE738C8];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE738C8]);
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v10, v8);
      objc_msgSend(a1, "didChangeValueForKey:", v8);
      objc_msgSend(a1, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        objc_msgSend(a1, "updateUPPIdentifierIfNeeded");
    }
  }

}

- (BOOL)isPlayable
{
  return objc_msgSend(a1, "reasonForNotPlayable") == 0;
}

- (int64_t)reasonForNotPlayable
{
  return +[MTEpisodeUnavailableUtil unavailableReasonForEpisode:](MTEpisodeUnavailableUtil, "unavailableReasonForEpisode:", a1);
}

- (void)didChangePersistentID
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
  objc_msgSend(a1, "playlists", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "updateUnplayedCount");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (uint64_t)setPlayCount:()Library_App
{
  uint64_t result;
  uint64_t v6;
  void *v7;

  result = objc_msgSend(a1, "playCount");
  if (result != a3)
  {
    v6 = *MEMORY[0x24BE73958];
    objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73958]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPrimitiveValue:forKey:", v7, v6);

    objc_msgSend(a1, "didChangeValueForKey:", v6);
    return objc_msgSend(a1, "updateUPPTimestamp");
  }
  return result;
}

- (uint64_t)setPlayhead:()Library_App
{
  float v4;
  float v5;
  uint64_t result;
  double v7;
  uint64_t v9;
  double v10;
  void *v11;

  objc_msgSend(a1, "playhead");
  v5 = v4;
  result = objc_msgSend(a1, "playhead");
  if (*(float *)&v7 != a2)
  {
    *(float *)&v7 = vabds_f32(v5, a2);
    if (a2 == 0.0 || *(float *)&v7 >= 0.5)
    {
      v9 = *MEMORY[0x24BE73970];
      objc_msgSend(a1, "willChangeValueForKey:", *MEMORY[0x24BE73970], v7);
      *(float *)&v10 = a2;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setPrimitiveValue:forKey:", v11, v9);

      objc_msgSend(a1, "didChangeValueForKey:", v9);
      return objc_msgSend(a1, "updateUPPTimestamp");
    }
  }
  return result;
}

@end
