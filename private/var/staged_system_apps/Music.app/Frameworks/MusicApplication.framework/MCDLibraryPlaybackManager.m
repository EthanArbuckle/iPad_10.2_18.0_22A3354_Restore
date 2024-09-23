@implementation MCDLibraryPlaybackManager

- (void)_initiatePlaybackForItemKind:(id)a3 object:(id)a4 lastResponse:(id)a5 shuffled:(BOOL)a6 forceScopingToResponseResults:(BOOL)a7 playActivityFeatureName:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _BOOL4 v33;
  _QWORD v34[4];
  id v35;
  void *v36;

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = objc_alloc_init((Class)MPModelLibraryRequest);
  objc_msgSend(v17, "setItemKind:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "request"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scopedContainers"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

  v33 = v10;
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemSortDescriptors"));
    objc_msgSend(v17, "setItemSortDescriptors:", v21);

    v22 = objc_opt_class(MPModelPlaylistEntryKind);
    if ((objc_opt_isKindOfClass(v13, v22) & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 1));
      v36 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 215, v25, 0));
      objc_msgSend(v17, "setSectionKind:", v26);

    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sectionKind"));
      objc_msgSend(v17, "setSectionKind:", v30);

    }
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "scopedContainers"));
    objc_msgSend(v17, "setScopedContainers:", v29);
  }
  else if (v9)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "results"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __141__MCDLibraryPlaybackManager__initiatePlaybackForItemKind_object_lastResponse_shuffled_forceScopingToResponseResults_playActivityFeatureName___block_invoke;
    v34[3] = &unk_13398F0;
    v35 = v27;
    v29 = v27;
    objc_msgSend(v28, "enumerateItemIdentifiersUsingBlock:", v34);

    objc_msgSend(v17, "setScopedContainers:", v29);
  }
  else
  {
    if (v10)
      goto LABEL_9;
    v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "itemSortDescriptors"));
    objc_msgSend(v17, "setItemSortDescriptors:", v29);
  }

LABEL_9:
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifiers"));
  -[MCDLibraryPlaybackManager _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:](self, "_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:", v17, v31, v33, v16);

}

void __141__MCDLibraryPlaybackManager__initiatePlaybackForItemKind_object_lastResponse_shuffled_forceScopingToResponseResults_playActivityFeatureName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MPModelAlbum), "initWithIdentifiers:block:", v4, &__block_literal_global_10);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

- (void)initiatePlaybackForSong:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3));
  -[MCDLibraryPlaybackManager _initiatePlaybackForItemKind:object:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:](self, "_initiatePlaybackForItemKind:object:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:", v15, v14, v13, v8, v7, v12);

}

- (void)initiatePlaybackForPlaylistEntry:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3));
  v18 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v16));

  -[MCDLibraryPlaybackManager _initiatePlaybackForItemKind:object:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:](self, "_initiatePlaybackForItemKind:object:lastResponse:shuffled:forceScopingToResponseResults:playActivityFeatureName:", v17, v14, v13, v8, v7, v12);
}

- (void)initiatePlaybackForPerson:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = objc_alloc_init((Class)MPModelLibraryRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3));
  objc_msgSend(v11, "setItemKind:", v12);

  v14 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  objc_msgSend(v11, "setScopedContainers:", v13);
  -[MCDLibraryPlaybackManager _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:](self, "_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:", v11, 0, v6, v9);

}

- (void)initiatePlaybackForGenre:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a5;
  v9 = a6;
  v10 = a3;
  v11 = objc_alloc_init((Class)MPModelLibraryRequest);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3));
  objc_msgSend(v11, "setItemKind:", v12);

  v14 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  objc_msgSend(v11, "setScopedContainers:", v13);
  -[MCDLibraryPlaybackManager _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:](self, "_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:", v11, 0, v6, v9);

}

- (id)playbackRequestForAlbum:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  id v13;

  v3 = a3;
  v4 = objc_alloc_init((Class)MPModelLibraryRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3));
  objc_msgSend(v4, "setItemKind:", v5);

  v13 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  objc_msgSend(v4, "setScopedContainers:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongDiscNumber, 1));
  v12[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTrackNumber, 1));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", MPModelPropertySongTitle, 1));
  v12[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));

  objc_msgSend(v4, "setItemSortDescriptors:", v10);
  return v4;
}

- (void)initiatePlaybackForAlbum:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;

  v6 = a5;
  v9 = a6;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryPlaybackManager playbackRequestForAlbum:](self, "playbackRequestForAlbum:", a3));
  -[MCDLibraryPlaybackManager _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:](self, "_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:", v10, 0, v6, v9);

}

- (id)playbackRequestForPlaylist:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v3 = a3;
  v4 = objc_alloc_init((Class)MPModelLibraryRequest);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelSong kindWithVariants:](MPModelSong, "kindWithVariants:", 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelTVEpisode kindWithVariants:](MPModelTVEpisode, "kindWithVariants:", 3));
  v14[0] = v5;
  v14[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylistEntry kindWithKinds:](MPModelPlaylistEntry, "kindWithKinds:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPModelPlaylist kindWithVariants:playlistEntryKind:options:](MPModelPlaylist, "kindWithVariants:playlistEntryKind:options:", 215, v8, 0));
  objc_msgSend(v4, "setSectionKind:", v9);
  objc_msgSend(v4, "setItemKind:", v8);
  v13 = v3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  objc_msgSend(v4, "setScopedContainers:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredTracklistSortDescriptors"));
  objc_msgSend(v4, "setItemSortDescriptors:", v11);

  return v4;
}

- (void)initiatePlaybackForPlaylist:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;

  v6 = a5;
  v9 = a6;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MCDLibraryPlaybackManager playbackRequestForPlaylist:](self, "playbackRequestForPlaylist:", a3));
  -[MCDLibraryPlaybackManager _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:](self, "_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:startItemIdentifiers:shuffle:playActivityFeatureName:", v10, 0, v6, v9);

}

- (void)initiateRadioPlaybackForArtist:(id)a3 playActivityFeatureName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPCPlaybackIntent radioPlaybackIntentFromArtist:](MPCPlaybackIntent, "radioPlaybackIntentFromArtist:", v6));
  objc_msgSend(v8, "setPlayActivityFeatureName:", v7);

  v9 = soft_MCDMusicGeneralLogging_0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Initiating radio playback for artist: %{public}@", buf, 0xCu);

  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __84__MCDLibraryPlaybackManager_initiateRadioPlaybackForArtist_playActivityFeatureName___block_invoke;
  v13[3] = &unk_1339918;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  -[MCDPlaybackManager setupPlaybackRequestWithCompletion:](self, "setupPlaybackRequestWithCompletion:", v13);

}

void __84__MCDLibraryPlaybackManager_initiateRadioPlaybackForArtist_playActivityFeatureName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "tracklist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "replaceWithPlaybackIntent:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v3, "performPlaybackRequestWithCommand:", v5);

}

- (void)_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:(id)a3 startItemIdentifiers:(id)a4 shuffle:(BOOL)a5 playActivityFeatureName:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[16];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[MCDPlaybackManager localContentOnly](self, "localContentOnly"))
    objc_msgSend(v10, "setFilteringOptions:", (unint64_t)objc_msgSend(v10, "filteringOptions") | 2);
  if (-[MCDPlaybackManager favoriteContentOnly](self, "favoriteContentOnly"))
    objc_msgSend(v10, "setFilteringOptions:", (unint64_t)objc_msgSend(v10, "filteringOptions") | 0x200000);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playbackIntentWithStartItemIdentifiers:", v11));
  v14 = v13;
  if (v7)
    v15 = 1;
  else
    v15 = -1;
  objc_msgSend(v13, "setShuffleMode:", v15);
  objc_msgSend(v14, "setPlayActivityFeatureName:", v12);

  v16 = soft_MCDMusicGeneralLogging_0();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Initiating playback for library content", buf, 2u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __141__MCDLibraryPlaybackManager__initiatePlaybackAndPushNPViewControllerForPlaybackRequest_startItemIdentifiers_shuffle_playActivityFeatureName___block_invoke;
  v19[3] = &unk_1339918;
  v19[4] = self;
  v20 = v14;
  v18 = v14;
  -[MCDPlaybackManager setupPlaybackRequestWithCompletion:](self, "setupPlaybackRequestWithCompletion:", v19);

}

void __141__MCDLibraryPlaybackManager__initiatePlaybackAndPushNPViewControllerForPlaybackRequest_startItemIdentifiers_shuffle_playActivityFeatureName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "tracklist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resetCommand"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "replaceWithPlaybackIntent:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v3, "performPlaybackRequestWithCommand:", v5);

}

@end
