@implementation MCDStorePlaybackManager

- (void)initiatePlaybackForSong:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  id v14;

  v7 = a5;
  v11 = a7;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "results"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemsInSectionAtIndex:", 0));

  if (objc_msgSend(v14, "count"))
    -[MCDStorePlaybackManager initiatePlaybackForSong:useResultsAsPlaybackQueue:itemList:playActivityFeatureName:](self, "initiatePlaybackForSong:useResultsAsPlaybackQueue:itemList:playActivityFeatureName:", v12, 1, v14, v11);
  else
    -[MCDStorePlaybackManager _initiatePlaybackForItem:shouldShuffle:playActivityFeatureName:](self, "_initiatePlaybackForItem:shouldShuffle:playActivityFeatureName:", v12, v7, v11);

}

- (void)initiatePlaybackForSong:(id)a3 useResultsAsPlaybackQueue:(BOOL)a4 itemList:(id)a5 playActivityFeatureName:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _UNKNOWN **v19;
  _UNKNOWN **v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  MCDStorePlaybackManager *v41;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v8)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCDStorePlaybackManager _setupPlaybackIntentForContentItem:shouldShuffle:](self, "_setupPlaybackIntentForContentItem:shouldShuffle:", v10, 0));
    goto LABEL_26;
  }
  v40 = v12;
  v41 = self;
  v43 = v10;
  v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v42 = v11;
  v15 = v11;
  v16 = (void *)v14;
  v17 = v15;
  v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  v19 = MPLibraryAddStatusObserver_ptr;
  v20 = MPLibraryAddStatusObserver_ptr;
  if (!v18)
    goto LABEL_19;
  v21 = v18;
  v22 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v47 != v22)
        objc_enumerationMutation(v17);
      v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
      v25 = objc_opt_class(v19[54]);
      if ((objc_opt_isKindOfClass(v24, v25) & 1) == 0)
      {
        v32 = objc_opt_class(v20[51]);
        if ((objc_opt_isKindOfClass(v24, v32) & 1) == 0)
          continue;
        v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifiers"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "universalStore"));
        v27 = objc_msgSend(v28, "adamID");
LABEL_13:

        v19 = MPLibraryAddStatusObserver_ptr;
        goto LABEL_15;
      }
      v26 = v24;
      if (objc_msgSend(v26, "itemType") == (id)7)
      {
        v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "song"));

        if (!v27)
          goto LABEL_15;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "song"));
        v29 = v16;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifiers"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "universalStore"));
        v27 = objc_msgSend(v31, "adamID");

        v16 = v29;
        v20 = MPLibraryAddStatusObserver_ptr;
        goto LABEL_13;
      }
      v27 = 0;
LABEL_15:

      if (v27)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v27));
        objc_msgSend(v16, "addObject:", v33);

      }
    }
    v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  }
  while (v21);
LABEL_19:

  self = v41;
  -[MCDStorePlaybackManager setPlaybackQueueItemIDs:](v41, "setPlaybackQueueItemIDs:", v16);
  v34 = objc_opt_class(v19[54]);
  v10 = v43;
  if ((objc_opt_isKindOfClass(v43, v34) & 1) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "song"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "identifiers"));

  }
  else
  {
    v38 = objc_opt_class(MPModelSong);
    if ((objc_opt_isKindOfClass(v43, v38) & 1) != 0)
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "identifiers"));
    else
      v36 = 0;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MCDStorePlaybackManager _setupPlaybackIntentForQueuedSongsLength:startItemIdentifiers:](v41, "_setupPlaybackIntentForQueuedSongsLength:startItemIdentifiers:", objc_msgSend(v16, "count"), v36));

  v11 = v42;
  v13 = v40;
LABEL_26:
  objc_msgSend(v37, "setPlayActivityFeatureName:", v13);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10003B704;
  v44[3] = &unk_1010A9938;
  v44[4] = self;
  v45 = v37;
  v39 = v37;
  -[MCDPlaybackManager setupPlaybackRequestWithCompletion:](self, "setupPlaybackRequestWithCompletion:", v44);

}

- (void)initiatePlaybackForAlbum:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  -[MCDStorePlaybackManager _initiatePlaybackForItem:shouldShuffle:playActivityFeatureName:](self, "_initiatePlaybackForItem:shouldShuffle:playActivityFeatureName:", a3, a5, a6);
}

- (void)initiatePlaybackForPlaylist:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  MCDStorePlaybackManager *v22;
  BOOL v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MCDStorePlaybackManager;
  v13 = -[MCDLibraryPlaybackManager playbackRequestForPlaylist:](&v24, "playbackRequestForPlaylist:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10003B888;
  v18[3] = &unk_1010A9960;
  v19 = v10;
  v20 = v11;
  v23 = a5;
  v21 = v12;
  v22 = self;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "performWithResponseHandler:", v18);

}

- (void)initiatePlaybackForRadioStation:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  MCDStorePlaybackManager *v16;

  v8 = a3;
  v9 = a6;
  v10 = v8;
  v11 = objc_opt_class(MPModelRadioStation);
  v12 = v10;
  if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "radioStation"));

  }
  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003BA04;
    v13[3] = &unk_1010A9988;
    v14 = v12;
    v15 = v9;
    v16 = self;
    -[MCDPlaybackManager setupPlaybackRequestWithCompletion:](self, "setupPlaybackRequestWithCompletion:", v13);

  }
}

- (void)_initiatePlaybackForItem:(id)a3 shouldShuffle:(BOOL)a4 playActivityFeatureName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  v10 = sub_10003AFAC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initiating playback for store item", buf, 2u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003BBB0;
  v14[3] = &unk_1010A99B0;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[MCDPlaybackManager setupPlaybackRequestWithCompletion:](self, "setupPlaybackRequestWithCompletion:", v14);

}

- (id)_setupPlaybackIntentForQueuedSongsLength:(int64_t)a3 startItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  uint8_t v17[16];

  v6 = a4;
  v7 = sub_10003AFAC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting up playback for queued songs", v17, 2u);
  }

  v9 = objc_alloc_init((Class)MPCModelStorePlaybackItemsRequest);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDStorePlaybackManager playbackQueueItemIDs](self, "playbackQueueItemIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCDStorePlaybackManager playbackQueueItemIDs](self, "playbackQueueItemIDs"));
  v12 = objc_msgSend(v11, "count");

  if ((unint64_t)v12 >= a3)
    v13 = a3;
  else
    v13 = (int64_t)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v13));
  objc_msgSend(v9, "setStoreIDs:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "playbackIntentWithStartItemIdentifiers:", v6));
  return v15;
}

- (id)_setupPlaybackIntentForContentItem:(id)a3 shouldShuffle:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  id v7;
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
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init((Class)MPCModelStorePlaybackItemsRequest);
  v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "universalStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "globalPlaylistID"));

  if (v10
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "universalStore")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v12, "adamID"))), v12, v11, v10))
  {
    objc_msgSend(v7, "addObject:", v10);

  }
  objc_msgSend(v6, "setStoreIDs:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playbackIntentWithStartItemIdentifiers:", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "personalizedStore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recommendationID"));

  if (v16)
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataUsingEncoding:", 4));
  else
    v17 = 0;
  objc_msgSend(v13, "setPlayActivityRecommendationData:", v17);
  if (v4)
    v18 = 1;
  else
    v18 = -1;
  objc_msgSend(v13, "setShuffleMode:", v18);

  return v13;
}

- (id)_normalizedStringStoreIDForContentItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class(MPModelStoreBrowseContentItem);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = objc_msgSend(v6, "itemType");
    if (v7 == (id)7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "song"));
    }
    else if (v7 == (id)4)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playlist"));
    }
    else
    {
      if (v7 != (id)1)
      {
        v9 = 0;
        goto LABEL_11;
      }
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "album"));
    }
    v10 = (void *)v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDStorePlaybackManager _storeIDForObject:](self, "_storeIDForObject:", v8));

LABEL_11:
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCDStorePlaybackManager _storeIDForObject:](self, "_storeIDForObject:", v4));
LABEL_12:

  return v9;
}

- (id)_storeIDForObject:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = a3;
  v4 = objc_opt_class(MPModelAlbum);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    || (v5 = objc_opt_class(MPModelSong), (objc_opt_isKindOfClass(v3, v5) & 1) != 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v7, "adamID")));
    v9 = MPStoreItemMetadataStringNormalizeStoreIDValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  }
  else
  {
    v12 = objc_opt_class(MPModelPlaylist);
    if ((objc_opt_isKindOfClass(v3, v12) & 1) == 0)
    {
      v10 = 0;
      goto LABEL_5;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "globalPlaylistID"));
  }

LABEL_5:
  return v10;
}

- (NSArray)playbackQueueItemIDs
{
  return self->_playbackQueueItemIDs;
}

- (void)setPlaybackQueueItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_playbackQueueItemIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackQueueItemIDs, 0);
}

@end
