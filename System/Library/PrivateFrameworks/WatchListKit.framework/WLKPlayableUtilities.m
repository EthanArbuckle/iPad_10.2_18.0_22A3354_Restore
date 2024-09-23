@implementation WLKPlayableUtilities

+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5
{
  return objc_msgSend(a1, "openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", a3, a4, a5, 0, 0);
}

+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6
{
  return objc_msgSend(a1, "openPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", a3, a4, a5, a6, 0);
}

+ (BOOL)openPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v17;
  unsigned int v18;
  BOOL v19;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend((id)objc_opt_class(), "isFullTVAppEnabled");
  v17 = objc_msgSend(v12, "isiTunes");
  if (v16)
  {
    if (v17)
      v18 = objc_msgSend(a1, "_openITunesPlayableWatchListAppAvailable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", v12, a4, v13, v14, v15);
    else
      v18 = objc_msgSend(a1, "_openNonITunesPlayableWatchListAppAvailable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", v12, a4, v13, v14, v15);
  }
  else if (v17)
  {
    v18 = objc_msgSend(a1, "_openITunesPlayableWatchListAppUnavailable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", v12, a4, v13, v14, v15);
  }
  else
  {
    v18 = objc_msgSend(a1, "_openNonITunesPlayableWatchListAppUnavailable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", v12, a4, v13, v14, v15);
  }
  v19 = v18;
  NSLog(CFSTR("WLKPlayableUtilities - Returning success: %d"), v18);

  return v19;
}

+ (BOOL)_openITunesPlayableWatchListAppAvailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unsigned __int8 v13;

  v13 = 0;
  objc_msgSend(a1, "_watchListAppPunchoutURLWithPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:allowPlayAction:isPlaybackURL:", a3, a4, a5, a6, a7, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WLKPlayableUtilities - Using WatchList app punchout play URL for iTunes playable: %@"), v10);

    v11 = objc_msgSend(a1, "_openPunchoutURL:isPlaybackURL:", v9, v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_openNonITunesPlayableWatchListAppAvailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v12, "isEntitled")
    && (objc_msgSend(a1, "_playNonITunesPlayableUsingAssociatedApp:", v12) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(a1, "_watchListAppOpenPunchoutURLWithITunesPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:", v12, a4, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "absoluteString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("WLKPlayableUtilities - Using WatchList app punchout open URL for non iTunes playable: %@"), v19);

      v16 = objc_msgSend(a1, "_openPunchoutURL:isPlaybackURL:", v18, 0);
    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

+ (BOOL)_openITunesPlayableWatchListAppUnavailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unsigned __int8 v13;

  v13 = 0;
  objc_msgSend(a1, "_defaultPunchoutURLWithPlayable:isPlaybackURL:", a3, &v13, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WLKPlayableUtilities - Using app punchout URL for iTunes playable: %@"), v10);

    v11 = objc_msgSend(a1, "_openPunchoutURL:isPlaybackURL:", v9, v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_openNonITunesPlayableWatchListAppUnavailable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v14;

  v8 = a3;
  if (objc_msgSend(v8, "isEntitled")
    && (objc_msgSend(a1, "_playNonITunesPlayableUsingAssociatedApp:", v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v14 = 0;
    objc_msgSend(a1, "_defaultPunchoutURLWithPlayable:isPlaybackURL:", v8, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("WLKPlayableUtilities - Using default punchout URL for non iTunes playable: %@"), v12);

      v9 = objc_msgSend(a1, "_openPunchoutURL:isPlaybackURL:", v11, v14);
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

+ (id)_watchListAppOpenPunchoutURLWithITunesPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7
{
  return (id)objc_msgSend(a1, "_watchListAppPunchoutURLWithPlayable:forContentType:canonicalID:showCanonicalID:seasonCanonicalID:allowPlayAction:isPlaybackURL:", a3, a4, a5, a6, a7, 0, 0);
}

+ (id)_watchListAppPunchoutURLWithPlayable:(id)a3 forContentType:(unint64_t)a4 canonicalID:(id)a5 showCanonicalID:(id)a6 seasonCanonicalID:(id)a7 allowPlayAction:(BOOL)a8 isPlaybackURL:(BOOL *)a9
{
  _BOOL4 v9;
  BOOL *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;

  v9 = a8;
  v14 = a9;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  switch(a4)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/movie/%@"), v16);
      goto LABEL_12;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/show/%@"), v16);
      goto LABEL_12;
    case 3uLL:
      if (!v17)
        goto LABEL_6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/season/%@"), v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("showId"), v17);
      objc_msgSend(v19, "addObject:", v21);
      goto LABEL_10;
    case 4uLL:
      v20 = 0;
      if (!v17 || !v18)
        break;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/episode/%@"), v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("seasonId"), v18);
      objc_msgSend(v19, "addObject:", v21);
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("showId"), v17);
      v23 = v17;
      v24 = v18;
      v25 = (void *)v22;
      objc_msgSend(v19, "addObject:", v22);

      v18 = v24;
      v17 = v23;
LABEL_10:

      break;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/sportingevent/%@"), v16);
LABEL_12:
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_6:
      v20 = 0;
      break;
  }
  v26 = objc_msgSend(v15, "isEntitled") & v9;
  if (v26)
  {
    v27 = v17;
    v28 = v18;
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("action"), CFSTR("play"));
    objc_msgSend(v19, "addObject:", v29);
    objc_msgSend(v15, "playEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v15, "playEvent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "elapsedTime");
      v33 = v32;

      if (v33 > 0.00000011920929)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), (unint64_t)v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("resumeTime"), v34);
        objc_msgSend(v19, "addObject:", v35);

      }
    }

    v18 = v28;
    v17 = v27;
    v14 = a9;
  }
  if (!v20)
  {
    v37 = 0;
    LOBYTE(v26) = 0;
    if (!v14)
      goto LABEL_21;
    goto LABEL_20;
  }
  v36 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v36, "setScheme:", CFSTR("com.apple.WatchList"));
  objc_msgSend(v36, "setHost:", CFSTR("tv.apple.com"));
  objc_msgSend(v36, "setPath:", v20);
  objc_msgSend(v36, "setQueryItems:", v19);
  objc_msgSend(v36, "URL");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
LABEL_20:
    *v14 = v26;
LABEL_21:

  return v37;
}

+ (id)_punchoutURLForDirectPlayback:(id)a3 ignoreExtras:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v4 = a4;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("action"), CFSTR("play"));
    objc_msgSend(v11, "addObject:", v12);

    if (v4)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("ignoreExtras"), CFSTR("true"));
      objc_msgSend(v11, "addObject:", v13);

    }
    objc_msgSend(v5, "setQueryItems:", v11);
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (BOOL)_playNonITunesPlayableUsingAssociatedApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEntitled"))
  {
    objc_msgSend(v3, "punchoutUrls");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("play"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("WLKPlayableUtilities - Using playable URL for default playable: %@"), v5);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
      {
        v24 = (void *)v6;
        v25 = v5;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v3, "channelDetails");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appBundleIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
LABEL_6:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
            +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "allAppBundleIdentifiers");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "containsObject:", v14);

            if ((v17 & 1) != 0)
              break;
            if (v11 == ++v13)
            {
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
              if (v11)
                goto LABEL_6;
              goto LABEL_12;
            }
          }
          v19 = v14;

          if (!v19)
            goto LABEL_17;
          v18 = 1;
          WLKLaunchOptionsForPlayback(1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v24;
          objc_msgSend(v21, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v24, v19, 0, 0, 0, 0, v20, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "main");
          v5 = v25;
        }
        else
        {
LABEL_12:

LABEL_17:
          objc_msgSend(v3, "channelDetails");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "appBundleIDs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("WLKPlayableUtilities - Playable bundle IDs unavailable: %@"), v20);
          v18 = 0;
          v7 = v24;
          v5 = v25;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_defaultOpenPunchoutURLWithPlayable:(id)a3
{
  return (id)objc_msgSend(a1, "_defaultPunchoutURLWithPlayable:URLKey:", a3, CFSTR("open"));
}

+ (id)_defaultPlayPunchoutURLWithPlayable:(id)a3
{
  return (id)objc_msgSend(a1, "_defaultPunchoutURLWithPlayable:URLKey:", a3, CFSTR("play"));
}

+ (id)_defaultPunchoutURLWithPlayable:(id)a3 URLKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "punchoutUrls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_defaultPunchoutURLWithPlayable:(id)a3 isPlaybackURL:(BOOL *)a4
{
  id v6;
  int v7;
  BOOL v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "isEntitled");
  v8 = v7;
  if (v7)
    objc_msgSend(a1, "_defaultPlayPunchoutURLWithPlayable:", v6);
  else
    objc_msgSend(a1, "_defaultOpenPunchoutURLWithPlayable:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = v8;
  return v9;
}

+ (BOOL)_openPunchoutURL:(id)a3 isPlaybackURL:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v15;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WLKLaunchOptionsForPlayback(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = objc_msgSend(v9, "openURL:withOptions:error:", v6, v8, &v15);

  v11 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v7);
  NSLog(CFSTR("WLKPlayableUtilities - Done calling LS. Success: %d error: %@ elapsedTime: %.4f"), v10, v11, v13);

  return v10;
}

@end
