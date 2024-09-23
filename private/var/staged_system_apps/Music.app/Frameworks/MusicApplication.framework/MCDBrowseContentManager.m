@implementation MCDBrowseContentManager

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  objc_super v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager contentResults](self, "contentResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemsInSectionAtIndex:", objc_msgSend(v4, "section")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

    v9 = objc_opt_class(MPSectionedCollection);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstSection"));
    else
      v10 = v8;
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "request"));

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadAdditionalContentURL"));
  if (!v12
    || (v13 = (void *)v12,
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse")),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "results")),
        v16 = objc_msgSend(v15, "numberOfSections"),
        v15,
        v14,
        v13,
        (uint64_t)v16 < 1))
  {
    v23.receiver = self;
    v23.super_class = (Class)MCDBrowseContentManager;
    v21 = -[MCDFuseContentManager itemAtIndexPath:](&v23, "itemAtIndexPath:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue(v21);
LABEL_9:
    v20 = v10;
    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "results"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemsInSectionAtIndex:", 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

LABEL_10:
  return v20;
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
  id v6;
  __int128 v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  id v28;
  __int128 v30;
  id v31;
  MCDBrowseContentManager *v32;
  NSMutableArray *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  _BYTE buf[24];
  void *v40;

  v31 = a3;
  v32 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseContentManager childrenOfItemAtIndexPath:](self, "childrenOfItemAtIndexPath:"));
  v33 = objc_opt_new(NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v35;
    *(_QWORD *)&v7 = 138543618;
    v30 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class(MPModelStoreBrowseContentItem);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "innerObject"));
          v13 = objc_claimAutoreleasedReturnValue(+[MPModelGenericObject genericObjectWithModelObject:](MPModelGenericObject, "genericObjectWithModelObject:", v12));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject artworkCatalog](v13, "artworkCatalog"));
          if (!v14)
          {
            if (-[NSObject type](v13, "type") != &dword_4
              || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject playlist](v13, "playlist")),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2)),
                  v15,
                  !v14))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager viewController](v32, "viewController", v30));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "traitCollection"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage defaultPlaceholderForTraitCollection:](UIImage, "defaultPlaceholderForTraitCollection:", v17));
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[MPArtworkCatalog staticArtworkCatalogWithImage:](MPArtworkCatalog, "staticArtworkCatalogWithImage:", v18));

            }
          }
          switch((unint64_t)objc_msgSend(v10, "itemType", v30))
          {
            case 1uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "album"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              goto LABEL_32;
            case 2uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artist"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 3uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "curator"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 4uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlist"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 5uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "radioStation"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 6uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "socialPerson"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 7uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "song"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              goto LABEL_32;
            case 8uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "episode"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              goto LABEL_32;
            case 9uLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "show"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              goto LABEL_32;
            case 0xAuLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "season"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "show"));
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "title"));

              goto LABEL_33;
            case 0xBuLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "showCreator"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 0xCuLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "movie"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              goto LABEL_32;
            case 0xDuLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaClip"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
              goto LABEL_32;
            case 0xEuLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordLabel"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              goto LABEL_32;
            case 0xFuLL:
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "creditsArtist"));
              v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
LABEL_32:
              v26 = (__CFString *)v20;
LABEL_33:

              if (!v26)
                goto LABEL_36;
              if (!v14)
                goto LABEL_38;
              goto LABEL_37;
            default:
LABEL_36:
              v26 = &stru_13E1990;
              if (v14)
              {
LABEL_37:
                v27 = (void *)objc_claimAutoreleasedReturnValue(+[MusicObjectPair pairWithFirst:andSecond:](MusicObjectPair, "pairWithFirst:andSecond:", v14, v26));
                -[NSMutableArray addObject:](v33, "addObject:", v27);

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
          v21 = getMCDMusicGeneralLoggingSymbolLoc_ptr_11;
          v40 = getMCDMusicGeneralLoggingSymbolLoc_ptr_11;
          if (!getMCDMusicGeneralLoggingSymbolLoc_ptr_11)
          {
            v22 = (void *)MusicCarDisplayUILibrary_15();
            v21 = dlsym(v22, "MCDMusicGeneralLogging");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;
            getMCDMusicGeneralLoggingSymbolLoc_ptr_11 = v21;
          }
          _Block_object_dispose(buf, 8);
          if (!v21)
          {
            soft_MCDMusicGeneralLogging_cold_1();
            __break(1u);
          }
          v23 = ((uint64_t (*)(void))v21)();
          v13 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v24 = objc_opt_class(v10);
            *(_DWORD *)buf = v30;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v31;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Wrong kind (%{public}@) of child found in childrenOfItemAtIndexPath at %{public}@", buf, 0x16u);
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v6);
  }

  v28 = -[NSMutableArray copy](v33, "copy");
  return v28;
}

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseContentManager itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v4 = objc_opt_class(MPModelStoreBrowseSection);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "displaysAsGridCellInCarPlay");
  else
    v5 = 0;

  return v5;
}

- (int64_t)maximumNumberOfItemsForDisplay
{
  id v3;
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
          v3 = &dword_8 + 3;
        else
          v3 = &dword_14;
      }
    }
    else
    {

    }
  }

  return (int64_t)v3;
}

- (id)cellTitleAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDBrowseContentManager itemAtIndexPath:](self, "itemAtIndexPath:", a3));
  v4 = objc_opt_class(MPModelStoreBrowseSection);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  else
    v5 = 0;

  return v5;
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
  if (objc_msgSend(v3, "domain") != (char *)&dword_0 + 1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v11 = (_QWORD *)getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_2;
    v22 = getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_2;
    if (!getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_2)
    {
      v12 = (void *)MusicCarDisplayUILibrary_15();
      v11 = dlsym(v12, "MCDMusicCarPlayBundleIdentifier");
      v20[3] = (uint64_t)v11;
      getMCDMusicCarPlayBundleIdentifierSymbolLoc_ptr_2 = (uint64_t)v11;
    }
    _Block_object_dispose(&v19, 8);
    if (v11)
    {
      objc_msgSend(v3, "setClientIdentifier:", *v11, v19);
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v13 = (_QWORD *)getMCDMusicCarPlayVersionSymbolLoc_ptr_2;
      v22 = getMCDMusicCarPlayVersionSymbolLoc_ptr_2;
      if (!getMCDMusicCarPlayVersionSymbolLoc_ptr_2)
      {
        v14 = (void *)MusicCarDisplayUILibrary_15();
        v13 = dlsym(v14, "MCDMusicCarPlayVersion");
        v20[3] = (uint64_t)v13;
        getMCDMusicCarPlayVersionSymbolLoc_ptr_2 = (uint64_t)v13;
      }
      _Block_object_dispose(&v19, 8);
      if (v13)
      {
        objc_msgSend(v3, "setClientVersion:", *v13, v19);
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v15 = (_QWORD *)getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_2;
        v22 = getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_2;
        if (!getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_2)
        {
          v16 = (void *)MusicCarDisplayUILibrary_15();
          v15 = dlsym(v16, "MCDMusicCarPlayPlatformIdentifier");
          v20[3] = (uint64_t)v15;
          getMCDMusicCarPlayPlatformIdentifierSymbolLoc_ptr_2 = (uint64_t)v15;
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
        v18 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
        _Block_object_dispose(&v19, 8);
        _Unwind_Resume(v18);
      }
    }
    else
    {
      soft_MCDMusicGeneralLogging_cold_1();
    }
    soft_MCDMusicGeneralLogging_cold_1();
    goto LABEL_19;
  }
  return v3;
}

- (id)_queueName
{
  return CFSTR("com.apple.MusicCarDisplayUI.MCDBrowseContentManager.operationQueue");
}

@end
