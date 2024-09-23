@implementation MTURLResolver

+ (id)appController
{
  return +[MTApplication appController](MTApplication, "appController");
}

+ (void)handleiTMSUrlScheme:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "pf_cleanUrlToStoreId");
  v6 = objc_msgSend(v4, "pf_cleanUrlToStoreTrackId");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_cleanUrlToEpisodeGuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainQueueContext"));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100132D3C;
  v13[3] = &unk_1004AC1A8;
  v14 = v9;
  v15 = v7;
  v18 = v6;
  v19 = a1;
  v16 = v4;
  v17 = v5;
  v10 = v4;
  v11 = v7;
  v12 = v9;
  objc_msgSend(v12, "performBlock:", v13);

}

+ (void)handlePodcastsUrlScheme:(id)a3
{
  id v4;
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
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v4 = a3;
  if ((objc_msgSend(a1, "_handleLegacyCoreSpotlightURL:", v4) & 1) == 0
    && (objc_msgSend(a1, "_handleNowPlayingURL:", v4) & 1) == 0
    && (objc_msgSend(a1, "_handleBrowseURL:", v4) & 1) == 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("podcastUuid")));
    v30 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeUuid")));
    v32[0] = CFSTR("play");
    v32[1] = CFSTR("show");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
    v31 = (void *)v5;
    if ((objc_msgSend(v9, "containsObject:", v5) & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
      objc_msgSend(v10, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Utility/MTURLResolver.m", 107, CFSTR("unsupported url: %@"), v4);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainQueueContext"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "episodeForUuid:", v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "podcast"));
    if (v14)
    {
      v15 = v14;
      v16 = v12;
      v17 = v9;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
      v19 = v7;
      v20 = objc_msgSend(v7, "isEqualToString:", v18);

      if ((v20 & 1) != 0)
      {
        v7 = v19;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));

      }
      v9 = v17;
      v12 = v16;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "podcastForUuid:", v7));
    }
    v21 = objc_msgSend(v8, "length");
    if (v13)
      v22 = 1;
    else
      v22 = v21 == 0;
    v23 = !v22;
    v24 = objc_msgSend(v8, "length");
    v29 = v7;
    if ((!v13 || !v24) && objc_msgSend(v7, "length"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:ctx:](MTRecencyUtil, "upNextForPodcastUuid:ctx:", v7, v12));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "episodeUuid"));

      v8 = (void *)v26;
    }
    if (v15)
    {
      v27 = objc_msgSend(v31, "isEqualToString:", CFSTR("play"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appController"));
      objc_msgSend(v28, "presentPodcast:episodeUuid:episodeNotAvailable:podcastTab:startPlayback:animated:", v15, v8, v23, 0, v27, 0);

    }
  }

}

+ (void)showSearchControllerWithSearchText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTURLResolver searchUrlForSearchText:](MTURLResolver, "searchUrlForSearchText:", v6));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appController"));
    objc_msgSend(v5, "openStoreURL:", v4);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appController"));
    objc_msgSend(v4, "selectSearchTabAndFocusSearchField");
  }

}

+ (id)searchUrlForSearchText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("&term=%@"), v5));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("itms-podcasts://?action=search&activate=true"), "stringByAppendingString:", v6));

  }
  else
  {
    v7 = CFSTR("itms-podcasts://?action=search&activate=true");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));

  return v8;
}

+ (id)podcastUrlForStoreId:(int64_t)a3
{
  void *v4;

  if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast storeCleanURLForAdamID:](MTPodcast, "storeCleanURLForAdamID:", a3));
  else
    v4 = 0;
  return v4;
}

+ (id)episodeUrlForPodcastStoreId:(int64_t)a3 episodeStoreId:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "podcastUrlForStoreId:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("i"), v6));

  return v8;
}

+ (BOOL)_handleNowPlayingURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("nowplaying"));
  v7 = v6 == 0;
  if (!v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));

    if (!v9)
    {
      v7 = 0;
      goto LABEL_3;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appController"));
    objc_msgSend(v10, "presentNowPlayingAnimated:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("start")));
    v13 = objc_msgSend(v12, "BOOLValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    v5 = v14;
    if (v13)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentItem"));
      if (v15)
      {
        v16 = (void *)v15;
        v17 = objc_msgSend(v5, "isPlayingLocally");

        if ((v17 & 1) == 0)
          objc_msgSend(v5, "playWithReason:", 11);
      }
    }
  }

LABEL_3:
  return v7;
}

+ (BOOL)_handleBrowseURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
  v6 = objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("browse"));
  v7 = v6 == 0;
  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));

    if (!v8)
    {
      v7 = 0;
      goto LABEL_5;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appController"));
    objc_msgSend(v5, "selectFeaturedTab");
  }

LABEL_5:
  return v7;
}

+ (BOOL)_isLegacyCoreSpotlightURL:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scheme"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("podcasts"));

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host")),
        v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("play")),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
    v9 = objc_msgSend(v8, "containsString:", CFSTR("pid="));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_handleLegacyCoreSpotlightURL:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("play"));

  if (v5)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "query"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("&")));
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = sub_100046914;
    v28 = sub_100046AF4;
    v29 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001339A8;
    v23[3] = &unk_1004AC1D0;
    v23[4] = &v24;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v23);
    if (v25[5])
    {
      v7 = objc_alloc_init((Class)NSNumberFormatter);
      objc_msgSend(v7, "setNumberStyle:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mainOrPrivateContext"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "numberFromString:", v25[5]));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPersistentId:](MTEpisode, "predicateForPersistentId:", v10));
      v12 = kEpisodeUuid;
      v30[0] = kEpisodeUuid;
      v30[1] = kEpisodePodcastUuid;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:", kMTEpisodeEntityName, v11, 0, v13, 0));

      v15 = objc_msgSend(v14, "count");
      v16 = v15 != 0;
      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v12));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playEpisodeUuid:](MTPlaybackQueueFactory, "playEpisodeUuid:", v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
        objc_msgSend(v20, "playManifest:reason:", v19, 3);

      }
    }
    else
    {
      v16 = 0;
    }
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
