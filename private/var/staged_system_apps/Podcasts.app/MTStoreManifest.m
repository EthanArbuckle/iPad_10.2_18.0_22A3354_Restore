@implementation MTStoreManifest

+ (id)activityTypeSuffix
{
  return CFSTR("store");
}

- (MTStoreManifest)initWithEpisodeAdamIds:(id)a3 initialIndex:(unint64_t)a4
{
  return (MTStoreManifest *)-[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:](self, "_initWithEpisodeAdamIds:playheadPosition:initialIndex:", a3, a4, 0.0);
}

- (MTStoreManifest)initWithEpisodeAdamId:(id)a3 siriAssetInfo:(id)a4 initialIndex:(unint64_t)a5 initiatedByAnotherUser:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  MTStoreManifest *v21;
  MTStoreManifest *v22;
  unsigned __int8 v24;
  id v25;
  void *v26;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend((id)objc_opt_class(self), "_episodeStorePlatformDictionaryFromSiriAssetInfo:episodeAdamId:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12
    || ((v24 = 0,
         (v13 = objc_claimAutoreleasedReturnValue(+[MTStorePlatformUtil storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:](MTStorePlatformUtil, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:", v12, &v24, kMTPreferredArtworkSize))) == 0)? (v14 = v24 == 0): (v14 = 0), v14))
  {
    v25 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v20 = -[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:](self, "_initWithEpisodeAdamIds:playheadPosition:initialIndex:", v19, a5, 0.0);

    v21 = (MTStoreManifest *)v20;
  }
  else
  {
    v15 = (void *)v13;
    if (v13)
    {
      v16 = (void *)objc_opt_class(self);
      v26 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "storeMediaDictionariesToPlayerItems:initiatedByAnotherUser:", v17, -[MTStoreManifest initiatedByAnotherUser](self, "initiatedByAnotherUser")));

    }
    else
    {
      v18 = &__NSArray0__struct;
    }
    v22 = -[MTStoreManifest initWithItems:initialIndex:](self, "initWithItems:initialIndex:", v18, a5);
    -[MTStoreManifest _updateLoadStatus:](v22, "_updateLoadStatus:", v24);
    v21 = v22;

  }
  return v21;
}

- (MTStoreManifest)initWithPodcastAdamId:(id)a3 siriAssetInfo:(id)a4 oldestEpisode:(BOOL)a5 initiatedByAnotherUser:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  MTStoreManifest *v20;
  MTStoreManifest *v21;
  uint64_t v22;
  objc_super v24;
  uint8_t buf[4];
  int v26;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend((id)objc_opt_class(self), "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = objc_msgSend((id)objc_opt_class(self), "storePlatformDictionaryHasChildren:", v13);
  v15 = (int)v14;
  v17 = _MTLogCategoryPlayback(v14, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "assetInfo has children %d", buf, 8u);
  }

  if (v13)
    v19 = v15 ^ 1u;
  else
    v19 = 1;
  if ((v19 & 1) != 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)MTStoreManifest;
    v20 = -[MTPlayerManifest init](&v24, "init");
  }
  else
  {
    v20 = -[MTStoreManifest _initWithPodcastStorePlatformDictionary:oldestEpisode:](self, "_initWithPodcastStorePlatformDictionary:oldestEpisode:", v13, v7);
  }
  v21 = v20;
  if (v20)
  {
    -[MTStoreManifest setPlayerItemsNeedLoading:](v20, "setPlayerItemsNeedLoading:", v19);
    if (v7)
      v22 = 2;
    else
      v22 = 1;
    -[MTStoreManifest setPlaybackOrder:](v21, "setPlaybackOrder:", v22);
    -[MTStoreManifest setPodcastAdamId:](v21, "setPodcastAdamId:", v10);
    -[MTStoreManifest setInitiatedByAnotherUser:](v21, "setInitiatedByAnotherUser:", v6);
  }

  return v21;
}

- (id)_initWithEpisodeAdamIds:(id)a3 playheadPosition:(double)a4 initialIndex:(unint64_t)a5
{
  id v8;
  MTStoreManifest *v9;
  MTStoreManifest *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTStoreManifest;
  v9 = -[MTPlayerManifest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    -[MTStoreManifest setPlayerItemsNeedLoading:](v9, "setPlayerItemsNeedLoading:", 1);
    -[MTStoreManifest setInitialPlayheadPosition:](v10, "setInitialPlayheadPosition:", a4);
    -[MTStoreManifest setInitialIndex:](v10, "setInitialIndex:", a5);
    -[MTStoreManifest setEpisodeAdamIds:](v10, "setEpisodeAdamIds:", v8);
  }

  return v10;
}

- (id)_initWithPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  MTStoreManifest *v9;
  MTStoreManifest *v10;
  unsigned __int8 v12;

  v4 = a4;
  v12 = 0;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "playerItemsFromPodcastStorePlatformDictionary:oldestEpisode:restricted:initiatedByAnotherUser:", v6, v4, &v12, -[MTStoreManifest initiatedByAnotherUser](self, "initiatedByAnotherUser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = -[MTStoreManifest initWithItems:](self, "initWithItems:", v8);
  v10 = v9;
  if (v9)
    -[MTStoreManifest _updateLoadStatus:](v9, "_updateLoadStatus:", v12);

  return v10;
}

- (void)load:(id)a3
{
  id v4;
  MTStoreManifest *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  objc_super v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  MTStoreManifest *v24;
  id v25;
  id v26;
  id location;
  _QWORD v28[5];
  id v29;
  void *v30;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[MTStoreManifest playerItemsNeedLoading](v5, "playerItemsNeedLoading"))
  {
    -[MTStoreManifest setPlayerItemsNeedLoading:](v5, "setPlayerItemsNeedLoading:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest episodeAdamIds](v5, "episodeAdamIds"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000BD880;
      v28[3] = &unk_1004A9928;
      v28[4] = v5;
      v29 = v4;
      -[MTStoreManifest _loadItemsFromEpisodeAdamIdsWithCompletion:](v5, "_loadItemsFromEpisodeAdamIdsWithCompletion:", v28);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest podcastAdamId](v5, "podcastAdamId"));
      v9 = +[MTStoreIdentifier isNotEmptyNumber:](MTStoreIdentifier, "isNotEmptyNumber:", v8);

      objc_initWeak(&location, v5);
      if (v9)
      {
        v10 = objc_alloc((Class)IMContentLookupService);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest podcastAdamId](v5, "podcastAdamId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
        v30 = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
        v14 = objc_msgSend(v10, "initWithIds:", v13);

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v14, "setProfile:", kMTStoreLookupPodcastProductProfile);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000BD9C4;
        v22[3] = &unk_1004A9950;
        v16 = v15;
        v23 = v16;
        objc_copyWeak(&v26, &location);
        v24 = v5;
        v25 = v4;
        objc_msgSend(v14, "request:", v22);

        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
      else
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000BDC58;
        v19[3] = &unk_1004A9978;
        objc_copyWeak(&v21, &location);
        v20 = v4;
        v18.receiver = v5;
        v18.super_class = (Class)MTStoreManifest;
        -[MTStoreManifest load:](&v18, "load:", v19);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    v17.receiver = v5;
    v17.super_class = (Class)MTStoreManifest;
    -[MTStoreManifest load:](&v17, "load:", v4);
  }
  objc_sync_exit(v5);

}

- (MTStoreManifest)initWithStoreMediaDictionaries:(id)a3 initialIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  MTStoreManifest *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "storeMediaDictionariesToPlayerItems:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = -[MTStoreManifest initWithItems:initialIndex:](self, "initWithItems:initialIndex:", v8, a4);
  return v9;
}

- (MTStoreManifest)initWithItems:(id)a3
{
  return -[MTStoreManifest initWithItems:initialIndex:](self, "initWithItems:initialIndex:", a3, 0);
}

- (MTStoreManifest)initWithItems:(id)a3 initialIndex:(unint64_t)a4
{
  id v6;
  MTStoreManifest *v7;
  MTStoreManifest *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MTStoreManifest;
  v7 = -[MTItemListManifest initWithItems:](&v27, "initWithItems:", v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](v7, "items"));
    if ((unint64_t)objc_msgSend(v9, "count") <= a4)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = a4;
    -[MTStoreManifest setCurrentIndex:](v8, "setCurrentIndex:", v10);

    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if ((uint64_t)objc_msgSend(v17, "episodeStoreId", (_QWORD)v23) >= 1)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v17, "episodeStoreId")));
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v14);
    }

    v19 = objc_msgSend(v11, "copy");
    -[MTStoreManifest setEpisodeAdamIds:](v8, "setEpisodeAdamIds:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Directory"), &stru_1004C6D40, 0));
    -[MTStoreManifest setTitle:](v8, "setTitle:", v21);

  }
  return v8;
}

- (void)_updateLoadStatus:(BOOL)a3
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = -[MTStoreManifest isLoaded](self, "isLoaded");
  if (v5)
    v6 = 2;
  else
    v6 = 0;
  if (v5 && !a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](self, "items", v6));
    v8 = objc_msgSend(v7, "count");

    if (v8)
      v6 = 1;
    else
      v6 = 3;
  }
  -[MTStoreManifest setLoadStatus:](self, "setLoadStatus:", v6);
}

- (void)_loadItemsFromEpisodeAdamIdsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  id v14[2];
  _QWORD v15[3];
  uint64_t v16;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  -[MTStoreManifest initialPlayheadPosition](self, "initialPlayheadPosition");
  v16 = v5;
  v6 = -[MTStoreManifest initialIndex](self, "initialIndex");
  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest episodeAdamIds](self, "episodeAdamIds"));
  v9 = -[MTStoreManifest initiatedByAnotherUser](self, "initiatedByAnotherUser");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BE120;
  v11[3] = &unk_1004A99C8;
  objc_copyWeak(v14, &location);
  v14[1] = v6;
  v13 = v15;
  v10 = v4;
  v12 = v10;
  objc_msgSend(v7, "fetchPlayerItemsForStoreTrackIDs:initiatedByAnotherUser:completion:", v8, v9, v11);

  objc_destroyWeak(v14);
  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&location);

}

- (id)activity
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTStoreManifest;
  v3 = -[MTPlayerManifest activity](&v8, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MTStoreManifest currentIndex](self, "currentIndex")));
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("MTStoreManifestCurrentIndex"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTStoreManifest episodeAdamIds](self, "episodeAdamIds"));
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("MTStoreManifestAdamIdList"));

  return v4;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  void (**v5)(id, id);
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTStoreManifest *v12;
  double v13;
  id v14;
  id v15;

  v15 = a3;
  v5 = (void (**)(id, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v7 = objc_msgSend(v6, "isReachable");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("MTStoreManifestAdamIdList")));

    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("MTStoreManifestCurrentIndex")));

      v12 = [MTStoreManifest alloc];
      objc_msgSend(v15, "currentTime");
      v14 = -[MTStoreManifest _initWithEpisodeAdamIds:playheadPosition:initialIndex:](v12, "_initWithEpisodeAdamIds:playheadPosition:initialIndex:", v9, objc_msgSend(v11, "unsignedIntegerValue"), v13);
      v5[2](v5, v14);

    }
    else
    {
      v5[2](v5, 0);
    }

  }
  else
  {
    v5[2](v5, 0);
  }

}

- (BOOL)userActivityContainsPlayhead
{
  return 1;
}

+ (BOOL)storePlatformDictionaryHasChildren:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("childrenIds")));
  v4 = objc_opt_class(NSArray);
  v5 = objc_opt_class(v4);
  v6 = (objc_opt_isKindOfClass(v3, v5) & 1) != 0 && objc_msgSend(v3, "count") != 0;

  return v6;
}

+ (id)playerItemsFromPodcastStorePlatformDictionary:(id)a3 oldestEpisode:(BOOL)a4 restricted:(BOOL *)a5 initiatedByAnotherUser:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
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
  void *v21;
  BOOL v23;
  void *v24;

  v6 = a6;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("childrenIds")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("children")));
  if (a4)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v15));

  if (v16)
  {
    v23 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isNotSubscribeable")));
    v18 = objc_msgSend(v17, "BOOLValue");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTStorePlatformUtil storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:](MTStorePlatformUtil, "storeMediaDictionaryFromStorePlatformDictionary:artworkSize:restricted:isNotSubscribeable:", v16, &v23, v18, kMTPreferredArtworkSize));
    if (+[MTStorePlatformUtil isExplicitForStorePlatformDictionary:](MTStorePlatformUtil, "isExplicitForStorePlatformDictionary:", v10)&& (+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed") & 1) == 0)
    {
      v23 = 1;
    }
    if (a5)
      *a5 = v23;
    if (v19)
    {
      v24 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "storeMediaDictionariesToPlayerItems:initiatedByAnotherUser:", v20, v6));

    }
    else
    {
      v21 = &__NSArray0__struct;
    }

  }
  else
  {
    v21 = &__NSArray0__struct;
  }

  return v21;
}

+ (id)podcastStorePlatformDictionaryFromSiriAssetInfo:(id)a3 podcastAdamId:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v5 = a4;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
    v18 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v18));
    v8 = v7;
    v9 = 0;
    if (!v18)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("results")));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("firstAndLastChildrenIds")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("firstAndLastChildren")));
      v15 = sub_1000BE968((uint64_t)v14, v12);
      if ((v15 & 1) != 0 || (v16 = sub_1000BE968(v15, v13), (v16 & 1) != 0) || (sub_1000BE968(v16, v14) & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        v9 = objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("firstAndLastChildrenIds"));
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("firstAndLastChildren"));
        objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("childrenIds"));
        objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("children"));
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_episodeStorePlatformDictionaryFromSiriAssetInfo:(id)a3 episodeAdamId:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
    v14 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 0, &v14));
    v10 = v9;
    v7 = 0;
    if (!v14)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("results")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v12));

    }
  }

  return v7;
}

+ (id)storeMediaDictionariesToPlayerItems:(id)a3
{
  return objc_msgSend(a1, "storeMediaDictionariesToPlayerItems:initiatedByAnotherUser:", a3, 0);
}

+ (id)episodeCacheForStoreMediaDictionaries:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = kEpisodeEnclosureUrl;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKey:", kEpisodeAssetURL));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K in %@"), v5, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode propertiesToFetchAssetURL](MTEpisode, "propertiesToFetchAssetURL"));
  v24[0] = v5;
  v24[1] = kEpisodeUuid;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainOrPrivateContext"));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000BEC94;
  v19[3] = &unk_1004A6C78;
  v20 = v12;
  v21 = v7;
  v22 = v10;
  v23 = v4;
  v13 = v4;
  v14 = v10;
  v15 = v7;
  v16 = v12;
  objc_msgSend(v16, "performBlockAndWait:", v19);
  v17 = objc_msgSend(v13, "copy");

  return v17;
}

+ (id)storeMediaDictionariesToPlayerItems:(id)a3 initiatedByAnotherUser:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  MTPlayerItem *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  unint64_t v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t buf[4];
  void *v76;
  _BYTE v77[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v63 = v4;
  if (v4)
    v64 = 0;
  else
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "episodeCacheForStoreMediaDictionaries:", v6));
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v6;
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
  if (v66)
  {
    v65 = *(_QWORD *)v72;
    v8 = kEpisodeAssetURL;
    v60 = kEpisodeUuid;
    v57 = vcvtpd_s64_f64(kMTPreferredArtworkSize);
    v59 = kEpisodePubDate;
    v61 = kEpisodeAssetURL;
    v62 = v7;
    do
    {
      for (i = 0; i != v66; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v65)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));
        if (objc_msgSend(v11, "length"))
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "objectForKey:", v11));
        else
          v12 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v8));
        if (objc_msgSend(v13, "length"))
        {
          v14 = v13;

          v11 = v14;
        }
        if (objc_msgSend(v11, "length"))
        {
          v68 = v13;
          v16 = [MTPlayerItem alloc];
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
          v18 = -[MTPlayerItem initWithUrl:](v16, "initWithUrl:", v17);

          -[NSObject setManifestIndex:](v18, "setManifestIndex:", objc_msgSend(v7, "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v60));
          if (objc_msgSend(v19, "length"))
            -[NSObject setEpisodeUuid:](v18, "setEpisodeUuid:", v19);
          v67 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("episodeId")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier validatedIdNumberFromStoreId:](MTStoreIdentifier, "validatedIdNumberFromStoreId:", objc_msgSend(v20, "longLongValue")));
          -[NSObject setEpisodeStoreId:](v18, "setEpisodeStoreId:", objc_msgSend(v21, "longLongValue"));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("episodeGuid")));
          -[NSObject setEpisodeGuid:](v18, "setEpisodeGuid:", v22);

          -[NSObject setEnqueuedByAnotherUser:](v18, "setEnqueuedByAnotherUser:", v63);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("feedURL")));
          -[NSObject setPodcastFeedUrl:](v18, "setPodcastFeedUrl:", v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("podcastId")));
          -[NSObject setPodcastStoreId:](v18, "setPodcastStoreId:", objc_msgSend(v24, "longLongValue"));

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("isNotSubscribeable")));
          -[NSObject setIsNotSubscribeable:](v18, "setIsNotSubscribeable:", objc_msgSend(v25, "BOOLValue"));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("episodeTitle")));
          -[NSObject setTitle:](v18, "setTitle:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("episodeDescription")));
          -[NSObject setItemDescription:](v18, "setItemDescription:", v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("episodeShareUrl")));
          -[NSObject setEpisodeShareUrl:](v18, "setEpisodeShareUrl:", v28);

          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("podcastTitle")));
          -[NSObject setAuthor:](v18, "setAuthor:", v29);

          v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTStorePlatformUtil pubDateFromStoreMediaDictionary:](MTStorePlatformUtil, "pubDateFromStoreMediaDictionary:", v10));
          -[NSObject setPubDate:](v18, "setPubDate:", v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v59));
          if (v31)
          {
            -[NSObject setAlbum:](v18, "setAlbum:", v31);
          }
          else
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pubDate](v18, "pubDate"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "verboseDisplayString"));
            -[NSObject setAlbum:](v18, "setAlbum:", v34);

          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("explicit")));
          -[NSObject setIsExplicit:](v18, "setIsExplicit:", objc_msgSend(v35, "BOOLValue"));

          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("duration")));
          if ((objc_opt_respondsToSelector(v36, "longLongValue") & 1) != 0)
          {
            -[NSObject setDuration:](v18, "setDuration:", (double)(uint64_t)objc_msgSend(v36, "longLongValue"));
          }
          else
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
            objc_msgSend(v37, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/Support/MTStoreManifest.m", 480, CFSTR("Store item %lld is missing a duration"), -[NSObject episodeStoreId](v18, "episodeStoreId"));

          }
          v69 = v12;
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reportParams")));
          if (v38)
            -[NSObject setStoreReportingParams:](v18, "setStoreReportingParams:", v38);
          v70 = v11;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("artworkURL")));
          if (objc_msgSend(v39, "count"))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastObject"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("url")));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v41));
            -[NSObject setArtworkUrl:](v18, "setArtworkUrl:", v42);

          }
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject artworkUrl](v18, "artworkUrl"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "absoluteString"));
          v45 = objc_msgSend(v44, "length");

          if (!v45)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("artwork")));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("url")));
            if (objc_msgSend(v47, "length"))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lix%li"), v57, v57));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}x{h}"), v48));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".{f}"), CFSTR(".jpg")));

              v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v50));
              -[NSObject setArtworkUrl:](v18, "setArtworkUrl:", v51);

            }
          }
          v11 = v70;
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v70));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "pathExtension"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[IMUTITypes UTIByExtension:](IMUTITypes, "UTIByExtension:", v53));

          if (v54)
            -[NSObject setIsVideo:](v18, "setIsVideo:", +[MTUTIUtil isVideo:](MTUTIUtil, "isVideo:", v54));
          v7 = v62;
          objc_msgSend(v62, "addObject:", v18);

          v8 = v61;
          v13 = v68;
          v12 = v69;
        }
        else
        {
          v32 = _MTLogCategoryPlayback(0, v15);
          v18 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v76 = v10;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Skipping player item creation for item %@ because we couldn't play locally or stream", buf, 0xCu);
          }
        }

      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v77, 16);
    }
    while (v66);
  }

  v55 = objc_msgSend(v7, "copy");
  return v55;
}

+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "fetchPlayerItemsForStoreTrackIDs:initiatedByAnotherUser:completion:", a3, 0, a4);
}

+ (void)fetchPlayerItemsForStoreTrackIDs:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  uint8_t buf[4];
  id v21;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mt_compactMap:", &stru_1004A99E8));
    v11 = objc_msgSend(objc_alloc((Class)IMContentLookupService), "initWithIds:", v10);
    objc_msgSend(v11, "setProfile:", kMTStoreLookupPodcastProductProfile);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000BF850;
    v15[3] = &unk_1004A9A10;
    v16 = v10;
    v18 = a1;
    v19 = a4;
    v17 = v9;
    v12 = v10;
    objc_msgSend(v11, "request:", v15);

  }
  else
  {
    v13 = _MTLogCategoryMediaRemote(0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = a1;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ Found 0 store track IDs", buf, 0xCu);
    }

    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (unint64_t)loadStatus
{
  return self->_loadStatus;
}

- (void)setLoadStatus:(unint64_t)a3
{
  self->_loadStatus = a3;
}

- (int64_t)playbackOrder
{
  return self->_playbackOrder;
}

- (void)setPlaybackOrder:(int64_t)a3
{
  self->_playbackOrder = a3;
}

- (NSArray)episodeAdamIds
{
  return self->_episodeAdamIds;
}

- (void)setEpisodeAdamIds:(id)a3
{
  objc_storeStrong((id *)&self->_episodeAdamIds, a3);
}

- (NSNumber)podcastAdamId
{
  return self->_podcastAdamId;
}

- (void)setPodcastAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_podcastAdamId, a3);
}

- (double)initialPlayheadPosition
{
  return self->_initialPlayheadPosition;
}

- (void)setInitialPlayheadPosition:(double)a3
{
  self->_initialPlayheadPosition = a3;
}

- (unint64_t)initialIndex
{
  return self->_initialIndex;
}

- (void)setInitialIndex:(unint64_t)a3
{
  self->_initialIndex = a3;
}

- (BOOL)playerItemsNeedLoading
{
  return self->_playerItemsNeedLoading;
}

- (void)setPlayerItemsNeedLoading:(BOOL)a3
{
  self->_playerItemsNeedLoading = a3;
}

- (BOOL)initiatedByAnotherUser
{
  return self->_initiatedByAnotherUser;
}

- (void)setInitiatedByAnotherUser:(BOOL)a3
{
  self->_initiatedByAnotherUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastAdamId, 0);
  objc_storeStrong((id *)&self->_episodeAdamIds, 0);
}

@end
