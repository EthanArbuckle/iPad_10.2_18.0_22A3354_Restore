@implementation MCDBrowseContentManager

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsInSectionAtIndex:", objc_msgSend(v4, "section")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

    v10 = objc_opt_class(MPSectionedCollection, v9);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstSection"));
    else
      v11 = v8;
    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "request"));

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadAdditionalContentURL"));
  if (!v13
    || (v14 = (void *)v13,
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "results")),
        v17 = (uint64_t)objc_msgSend(v16, "numberOfSections"),
        v16,
        v15,
        v14,
        v17 < 1))
  {
    v24.receiver = self;
    v24.super_class = (Class)MCDBrowseContentManager;
    v22 = -[MCDFuseContentManager itemAtIndexPath:](&v24, "itemAtIndexPath:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue(v22);
LABEL_9:
    v21 = v11;
    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "results"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemsInSectionAtIndex:", 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

LABEL_10:
  return v21;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v7 = objc_msgSend(v6, "numberOfSections");
  v8 = objc_msgSend(v4, "row");

  if ((uint64_t)v7 <= (uint64_t)v8)
  {
    v11 = &__NSArray0__struct;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemsInSectionAtIndex:", objc_msgSend(v4, "row")));

  }
  return v11;
}

- (id)artworksWithTitlesAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  void *v29;
  id v30;
  __int128 v32;
  id v33;
  MCDBrowseContentManager *v34;
  NSMutableArray *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  _BYTE buf[24];
  void *v42;

  v33 = a3;
  v34 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseContentManager childrenOfItemAtIndexPath:](self, "childrenOfItemAtIndexPath:"));
  v35 = objc_opt_new(NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v37;
    *(_QWORD *)&v8 = 138543618;
    v32 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(MPModelStoreBrowseContentItem, v6);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "innerObject"));
          v14 = objc_claimAutoreleasedReturnValue(+[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v13));

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject artworkCatalog](v14, "artworkCatalog"));
          if (!v15)
          {
            if (-[NSObject type](v14, "type") != (id)4
              || (v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject playlist](v14, "playlist")),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2)),
                  v16,
                  !v15))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](v34, "viewController", v32));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "traitCollection"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPlaceholderForTraitCollection:](UIImage, "defaultPlaceholderForTraitCollection:", v18));
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPArtworkCatalog staticArtworkCatalogWithImage:](MPArtworkCatalog, "staticArtworkCatalogWithImage:", v19));

            }
          }
          switch((unint64_t)objc_msgSend(v11, "itemType", v32))
          {
            case 1uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "album"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              goto LABEL_32;
            case 2uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "artist"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 3uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "curator"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 4uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playlist"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 5uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "radioStation"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 6uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "socialPerson"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 7uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "song"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              goto LABEL_32;
            case 8uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "episode"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              goto LABEL_32;
            case 9uLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "show"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              goto LABEL_32;
            case 0xAuLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "season"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "show"));
              v28 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "title"));

              goto LABEL_33;
            case 0xBuLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "showCreator"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 0xCuLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "movie"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              goto LABEL_32;
            case 0xDuLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mediaClip"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              goto LABEL_32;
            case 0xEuLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordLabel"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
              goto LABEL_32;
            case 0xFuLL:
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "creditsArtist"));
              v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
LABEL_32:
              v28 = (__CFString *)v21;
LABEL_33:

              if (!v28)
                goto LABEL_36;
              if (!v15)
                goto LABEL_38;
              goto LABEL_37;
            default:
LABEL_36:
              v28 = &stru_101122068;
              if (v15)
              {
LABEL_37:
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[MusicObjectPair pairWithFirst:andSecond:](MusicObjectPair, "pairWithFirst:andSecond:", v15, v28));
                -[NSMutableArray addObject:](v35, "addObject:", v29);

              }
LABEL_38:

              break;
          }
        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v22 = off_1011EC9A0;
          v42 = off_1011EC9A0;
          if (!off_1011EC9A0)
          {
            v23 = (void *)sub_1000093B4();
            v22 = dlsym(v23, "MCDMusicGeneralLogging");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v22;
            off_1011EC9A0 = v22;
          }
          _Block_object_dispose(buf, 8);
          if (!v22)
          {
            sub_100DE9368();
            __break(1u);
          }
          v24 = ((uint64_t (*)(void))v22)();
          v14 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v26 = objc_opt_class(v11, v25);
            *(_DWORD *)buf = v32;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Wrong kind (%{public}@) of child found in childrenOfItemAtIndexPath at %{public}@", buf, 0x16u);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v7);
  }

  v30 = -[NSMutableArray copy](v35, "copy");
  return v30;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseContentManager itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v5 = objc_opt_class(MPModelStoreBrowseSection, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = objc_msgSend(v3, "displaysAsGridCellInCarPlay");
  else
    v6 = 0;

  return v6;
}

- (int64_t)maximumNumberOfItemsForDisplay
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCDBrowseContentManager;
  v3 = -[MCDFuseContentManager maximumNumberOfItemsForDisplay](&v12, "maximumNumberOfItemsForDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));

  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "loadAdditionalContentURL"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v8, "showRankedList") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
      v10 = objc_msgSend(v9, "showRankedList");

      if (v10)
      {
        if (-[MCDFuseContentManager limitedUI](self, "limitedUI"))
          v3 = 11;
        else
          v3 = 20;
      }
    }
    else
    {

    }
  }

  return v3;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseContentManager itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v5 = objc_opt_class(MPModelStoreBrowseSection, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  else
    v6 = 0;

  return v6;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  switch((unint64_t)objc_msgSend(v18, "itemType"))
  {
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "album"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedPlayActivityFeatureName"));
      objc_msgSend(v4, "initiatePlaybackForAlbum:lastResponse:shuffled:playActivityFeatureName:", v5, 0, 0, v7);
      goto LABEL_11;
    case 4uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "playlist"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedPlayActivityFeatureName"));
      objc_msgSend(v4, "initiatePlaybackForPlaylist:lastResponse:shuffled:playActivityFeatureName:", v5, 0, 0, v7);
      goto LABEL_11;
    case 5uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "radioStation"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedPlayActivityFeatureName"));
      objc_msgSend(v4, "initiatePlaybackForRadioStation:lastResponse:shuffled:playActivityFeatureName:", v5, 0, 0, v7);
      goto LABEL_11;
    case 7uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
      v9 = objc_opt_respondsToSelector(v8, "queueListForPlayback");

      if ((v9 & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager delegate](self, "delegate"));
        v11 = objc_msgSend(v10, "queueListForPlayback");

      }
      else
      {
        v11 = 0;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "results"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemsInSectionAtIndex:", 0));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
      v15 = -[MCDFuseContentManager allowedNumberOfItemsForDisplayWithResponse:inSection:](self, "allowedNumberOfItemsForDisplayWithResponse:inSection:", v14, 0);

      if (v15 <= (unint64_t)objc_msgSend(v4, "count"))
      {
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v15));

        v4 = (void *)v16;
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager playbackManager](self, "playbackManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "song"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](self, "viewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "combinedPlayActivityFeatureName"));
      objc_msgSend(v5, "initiatePlaybackForSong:useResultsAsPlaybackQueue:itemList:playActivityFeatureName:", v6, v11, v4, v17);

LABEL_11:
      break;
    default:
      break;
  }

}

- (id)_modelRequest
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _Unwind_Exception *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = objc_alloc_init((Class)MPModelStoreBrowseRequest);
  objc_msgSend(v3, "setFilteringPolicy:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "parentSection");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentSection"));
    objc_msgSend(v3, "configureWithParentSection:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v9 = objc_opt_respondsToSelector(v8, "domain");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    objc_msgSend(v3, "setDomain:", objc_msgSend(v10, "domain"));

  }
  if (objc_msgSend(v3, "domain") != (id)1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v11 = (_QWORD *)qword_1011EC9B0;
    v22 = qword_1011EC9B0;
    if (!qword_1011EC9B0)
    {
      v12 = (void *)sub_1000093B4();
      v11 = dlsym(v12, "MCDMusicCarPlayBundleIdentifier");
      v20[3] = (uint64_t)v11;
      qword_1011EC9B0 = (uint64_t)v11;
    }
    _Block_object_dispose(&v19, 8);
    if (v11)
    {
      objc_msgSend(v3, "setClientIdentifier:", *v11, v19);
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v13 = (_QWORD *)qword_1011EC9B8;
      v22 = qword_1011EC9B8;
      if (!qword_1011EC9B8)
      {
        v14 = (void *)sub_1000093B4();
        v13 = dlsym(v14, "MCDMusicCarPlayVersion");
        v20[3] = (uint64_t)v13;
        qword_1011EC9B8 = (uint64_t)v13;
      }
      _Block_object_dispose(&v19, 8);
      if (v13)
      {
        objc_msgSend(v3, "setClientVersion:", *v13, v19);
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v15 = (_QWORD *)qword_1011EC9C0;
        v22 = qword_1011EC9C0;
        if (!qword_1011EC9C0)
        {
          v16 = (void *)sub_1000093B4();
          v15 = dlsym(v16, "MCDMusicCarPlayPlatformIdentifier");
          v20[3] = (uint64_t)v15;
          qword_1011EC9C0 = (uint64_t)v15;
        }
        _Block_object_dispose(&v19, 8);
        if (v15)
        {
          objc_msgSend(v3, "setClientPlatformIdentifier:", *v15, v19);
          objc_msgSend(v3, "setRequestEndpoint:", 1);
          objc_msgSend(v3, "setAuthenticationOptions:", 1);
          return v3;
        }
LABEL_19:
        v18 = (_Unwind_Exception *)sub_100DE9368();
        _Block_object_dispose(&v19, 8);
        _Unwind_Resume(v18);
      }
    }
    else
    {
      sub_100DE9368();
    }
    sub_100DE9368();
    goto LABEL_19;
  }
  return v3;
}

- (id)_queueName
{
  return CFSTR("com.apple.MusicCarDisplayUI.MCDBrowseContentManager.operationQueue");
}

@end
