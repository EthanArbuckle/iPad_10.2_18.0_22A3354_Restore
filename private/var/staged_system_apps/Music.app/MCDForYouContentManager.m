@implementation MCDForYouContentManager

- (MCDForYouContentManager)initWithDataSource:(id)a3 delegate:(id)a4 viewController:(id)a5 playbackManager:(id)a6 limitedUI:(BOOL)a7 contentResults:(id)a8
{
  MCDForYouContentManager *v8;
  NSOperationQueue *v9;
  NSOperationQueue *refreshQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCDForYouContentManager;
  v8 = -[MCDFuseContentManager initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:](&v12, "initWithDataSource:delegate:viewController:playbackManager:limitedUI:contentResults:", a3, a4, a5, a6, a7, a8);
  if (v8)
  {
    v9 = objc_opt_new(NSOperationQueue);
    refreshQueue = v8->_refreshQueue;
    v8->_refreshQueue = v9;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_refreshQueue, "setMaxConcurrentOperationCount:", 4);
    -[NSOperationQueue setQualityOfService:](v8->_refreshQueue, "setQualityOfService:", 17);
    -[NSOperationQueue setName:](v8->_refreshQueue, "setName:", CFSTR("RefreshQueue"));
  }
  return v8;
}

- (id)prefixSections
{
  const __CFString *v3;

  v3 = CFSTR("siri_action_section");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouContentManager itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v4 = objc_opt_class(MPModelForYouRecommendationGroup);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "displaysAsGridCellInCarPlay");
  else
    v5 = 0;

  return v5;
}

- (BOOL)wantsTallCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionAtIndex:", objc_msgSend(v4, "section")));

  v8 = objc_opt_class(MPModelForYouRecommendationGroup);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    && (objc_msgSend(v7, "displaysAsTitledSectionWithRowsInCarPlay") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MCDForYouContentManager;
    v9 = -[MCDFuseContentManager wantsTallCellAtIndexPath:](&v11, "wantsTallCellAtIndexPath:", v4);
  }

  return v9;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouContentManager itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v4 = objc_opt_class(MPModelForYouRecommendationGroup);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_msgSend(v3, "groupType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    v7 = v6;
    if (v5 == (id)4)
    {
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Recently Played"), &stru_101122068, 0));

      }
      v7 = v8;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)childrenOfItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t i;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = objc_msgSend(v6, "numberOfSections");
  v8 = objc_msgSend(v4, "section");

  if ((uint64_t)v7 <= (uint64_t)v8)
  {
    v14 = (NSMutableArray *)&__NSArray0__struct;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v4, "section")));

    v12 = objc_opt_class(MPModelForYouRecommendationGroup);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = (uint64_t)objc_msgSend(v11, "numberOfItems");
      v14 = objc_opt_new(NSMutableArray);
      if (v13 >= 1)
      {
        for (i = 0; i != v13; ++i)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemAtIndex:", i));
          -[NSMutableArray addObject:](v14, "addObject:", v16);

        }
      }
    }
    else
    {
      v14 = (NSMutableArray *)&__NSArray0__struct;
    }

  }
  return v14;
}

- (id)artworksWithTitlesAtIndexPath:(id)a3
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  void *v26;
  id v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouContentManager childrenOfItemAtIndexPath:](self, "childrenOfItemAtIndexPath:", a3));
  v4 = objc_opt_new(NSMutableArray);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "itemType");
        if (v11 == (id)3)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "radioStation"));
LABEL_13:
          v13 = v12;
          v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "artworkCatalog"));
LABEL_16:

          if (v16)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (v11 == (id)2)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlist"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "artworkCatalog"));
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlist"));
            v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2));

          }
          goto LABEL_16;
        }
        if (v11 == (id)1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "album"));
          goto LABEL_13;
        }
LABEL_17:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "traitCollection"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPlaceholderForTraitCollection:](UIImage, "defaultPlaceholderForTraitCollection:", v19));
        v16 = (id)objc_claimAutoreleasedReturnValue(+[MPArtworkCatalog staticArtworkCatalogWithImage:](MPArtworkCatalog, "staticArtworkCatalogWithImage:", v20));

LABEL_18:
        v21 = objc_msgSend(v10, "itemType");
        if (v21 == (id)3)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "radioStation"));
          goto LABEL_24;
        }
        if (v21 == (id)2)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlist"));
LABEL_24:
          v22 = v24;
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
LABEL_25:
          v25 = (__CFString *)v23;

          if (v25)
            goto LABEL_27;
          goto LABEL_26;
        }
        if (v21 == (id)1)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "album"));
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
          goto LABEL_25;
        }
LABEL_26:
        v25 = &stru_101122068;
LABEL_27:
        if (v16)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[MusicObjectPair pairWithFirst:andSecond:](MusicObjectPair, "pairWithFirst:andSecond:", v16, v25));
          -[NSMutableArray addObject:](v4, "addObject:", v26);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  v27 = -[NSMutableArray copy](v4, "copy");
  return v27;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionAtIndex:", a4));

  if (v7
    && (v8 = objc_opt_class(MPModelForYouRecommendationGroup), (objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    && objc_msgSend(v7, "displaysAsTitledSectionWithRowsInCarPlay"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionAtIndex:", a5));

  if (v9)
  {
    v10 = objc_opt_class(MPModelForYouRecommendationGroup);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      if (objc_msgSend(v9, "displaysAsTitledSectionWithRowsInCarPlay"))
      {
        v11 = v14;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 16.0));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "textLabel"));

        objc_msgSend(v13, "setFont:", v12);
      }
    }
  }

}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
  v8 = objc_msgSend(v7, "numberOfSections");

  if ((uint64_t)v5 >= (uint64_t)v8)
  {
    v13 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionAtIndex:", objc_msgSend(v4, "section")));

    if (objc_msgSend(v11, "displaysAsTitledSectionWithRowsInCarPlay"))
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemAtIndex:", objc_msgSend(v4, "row")));
    else
      v12 = v11;
    v13 = v12;

  }
  return v13;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  int64_t v14;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionAtIndex:", a4));

  if (objc_msgSend(v9, "displaysAsTitledSectionWithRowsInCarPlay"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionAtIndex:", a4));
    v12 = objc_msgSend(v11, "numberOfItems");

    v13 = -[MCDFuseContentManager maximumNumberOfItemsForDisplay](self, "maximumNumberOfItemsForDisplay");
    if ((uint64_t)v12 >= v13)
      v14 = v13;
    else
      v14 = (int64_t)v12;
  }
  else
  {
    v14 = (uint64_t)objc_msgSend(v9, "numberOfItems") > 0;
  }

  return v14;
}

- (id)_queueName
{
  return CFSTR("com.apple.MusicCarDisplayUI.MCDForYouContentManager.operationQueue");
}

- (id)_modelRequest
{
  id v2;
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _Unwind_Exception *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = objc_alloc_init((Class)MPModelForYouRecommendationsRequest);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v3 = (_QWORD *)qword_1011ECC30;
  v14 = qword_1011ECC30;
  if (!qword_1011ECC30)
  {
    v4 = (void *)sub_10001D794();
    v3 = dlsym(v4, "MCDMusicCarPlayBundleIdentifier");
    v12[3] = (uint64_t)v3;
    qword_1011ECC30 = (uint64_t)v3;
  }
  _Block_object_dispose(&v11, 8);
  if (!v3)
  {
    sub_100DE9368();
LABEL_12:
    sub_100DE9368();
    goto LABEL_13;
  }
  objc_msgSend(v2, "setClientIdentifier:", *v3, v11);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v5 = (_QWORD *)qword_1011ECC40;
  v14 = qword_1011ECC40;
  if (!qword_1011ECC40)
  {
    v6 = (void *)sub_10001D794();
    v5 = dlsym(v6, "MCDMusicCarPlayVersion");
    v12[3] = (uint64_t)v5;
    qword_1011ECC40 = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (!v5)
    goto LABEL_12;
  objc_msgSend(v2, "setClientVersion:", *v5, v11);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v7 = (_QWORD *)qword_1011ECC48;
  v14 = qword_1011ECC48;
  if (!qword_1011ECC48)
  {
    v8 = (void *)sub_10001D794();
    v7 = dlsym(v8, "MCDMusicCarPlayPlatformIdentifier");
    v12[3] = (uint64_t)v7;
    qword_1011ECC48 = (uint64_t)v7;
  }
  _Block_object_dispose(&v11, 8);
  if (!v7)
  {
LABEL_13:
    v10 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  objc_msgSend(v2, "setClientPlatformIdentifier:", *v7, v11);
  objc_msgSend(v2, "setFilteringPolicy:", 1);
  objc_msgSend(v2, "setRequestEndpoint:", 1);
  objc_msgSend(v2, "setAuthenticationOptions:", 3);
  objc_msgSend(v2, "setMode:", 1);
  objc_msgSend(v2, "setWithRecentlyPlayed:", 0);
  objc_msgSend(v2, "setWithSocial:", 1);
  return v2;
}

- (void)performRefresh
{
  void *v3;
  id v4;
  NSObject *v5;
  NSOperationQueue *refreshQueue;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  MCDForYouContentManager *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouContentManager _refreshRecentlyPlayedRequest](self, "_refreshRecentlyPlayedRequest"));
  if (!v3)
  {
    v4 = sub_10001CEB4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100DE9490();

  }
  -[MCDFuseContentManager decorateRequest:](self, "decorateRequest:", v3);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10001CF50;
  v9[4] = sub_10001CF60;
  v10 = self;
  refreshQueue = v10->_refreshQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001CF68;
  v8[3] = &unk_1010A8FE8;
  v8[4] = v9;
  v7 = objc_msgSend(v3, "newOperationWithResponseHandler:", v8);
  -[NSOperationQueue addOperation:](refreshQueue, "addOperation:", v7);

  _Block_object_dispose(v9, 8);
}

- (void)_processRefreshResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = sub_10001CEB4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100DE95B8((uint64_t)v7, v9, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstSection"));

      if (v9)
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0x7FFFFFFFFFFFFFFFLL;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
        v15 = objc_msgSend(v14, "mutableCopy");

        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10001D200;
        v26[3] = &unk_1010A9010;
        v9 = v9;
        v27 = v9;
        v28 = &v29;
        objc_msgSend(v15, "replaceSectionsUsingBlock:", v26);
        if (v30[3] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = sub_10001CEB4();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_100DE9550((uint64_t)v13, v17, v18);

        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001D2D0;
          block[3] = &unk_1010A9038;
          block[4] = self;
          v24 = v13;
          v25 = v15;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        }
        _Block_object_dispose(&v29, 8);
      }
      else
      {
        v20 = sub_10001CEB4();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100DE94E8((uint64_t)v6, v21, v22);

      }
    }
    else
    {
      v19 = sub_10001CEB4();
      v9 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100DE94BC();
    }
  }

}

- (id)_refreshRecentlyPlayedRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _BYTE v17[24];

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001CF50;
  v15 = sub_10001CF60;
  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D560;
  v10[3] = &unk_1010A9060;
  v10[4] = &v11;
  objc_msgSend(v4, "enumerateSectionsUsingBlock:", v10);

  if (v12[5])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDForYouContentManager _modelRequest](self, "_modelRequest"));
    objc_msgSend(v5, "setCustomForYouURL:", v12[5]);
    objc_msgSend(v5, "setRefreshRequest:", 1);
  }
  else
  {
    v6 = sub_10001CEB4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
      sub_100DE9678(v8, (uint64_t)v17, v7);
    }

    v5 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "itemType");
  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "radioStation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedPlayActivityFeatureName"));
    objc_msgSend(v5, "initiatePlaybackForRadioStation:lastResponse:shuffled:playActivityFeatureName:", v6, 0, 0, v8);
    goto LABEL_7;
  }
  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playlist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedPlayActivityFeatureName"));
    objc_msgSend(v5, "initiatePlaybackForPlaylist:lastResponse:shuffled:playActivityFeatureName:", v6, 0, 0, v8);
    goto LABEL_7;
  }
  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "album"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedPlayActivityFeatureName"));
    objc_msgSend(v5, "initiatePlaybackForAlbum:lastResponse:shuffled:playActivityFeatureName:", v6, 0, 0, v8);
LABEL_7:

  }
}

- (NSOperationQueue)refreshQueue
{
  return self->_refreshQueue;
}

- (void)setRefreshQueue:(id)a3
{
  objc_storeStrong((id *)&self->_refreshQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshQueue, 0);
}

@end
