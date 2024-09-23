@implementation VUIIKPlaylistElementToMediaItemsMapper

- (VUIIKPlaylistElementToMediaItemsMapper)init
{
  VUIIKPlaylistElementToMediaItemsMapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIIKPlaylistElementToMediaItemsMapper;
  result = -[VUIIKPlaylistElementToMediaItemsMapper init](&v3, sel_init);
  if (result)
    result->_resumeMenuBehavior = 1;
  return result;
}

- (BOOL)_shouldDisableResumeMenuForAsset:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[VUIIKPlaylistElementToMediaItemsMapper resumeMenuBehavior](self, "resumeMenuBehavior"))
    v5 = objc_msgSend(v4, "vui_disableResumeMenu");
  else
    v5 = 1;

  return v5;
}

- (id)playlistForIKMediaElements:(id)a3 withMediaItem:(id)a4 isExtrasContent:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  VUILibraryMediaItem_iOS *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v30 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v13);
        objc_msgSend(v14, "assets");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "adamID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "longLongValue");

        if (v18
          || (objc_msgSend(v16, "vui_rentalAdamIDString"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v19, "longLongValue"),
              v19,
              v18))
        {
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[VUIIKPlaylistElementToMediaItemsMapper _createClipMediaItemsIfTimeExists:fromMediaElement:](self, "_createClipMediaItemsIfTimeExists:fromMediaElement:", v8, v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[VUIIKPlaylistElementToMediaItemsMapper _storeMediaItemsForAdamID:IKMediaElement:](self, "_storeMediaItemsForAdamID:IKMediaElement:", v18, v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v21 = v20;
          if (objc_msgSend(v20, "count"))
            objc_msgSend(v9, "addObjectsFromArray:", v21);
        }
        else
        {
          objc_msgSend(v16, "vui_persistentID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "longLongValue");

          if (v23)
          {
            v24 = (void *)MEMORY[0x1E0CC23F0];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "vui_mediaItemForPersistentIdentifier:", v25);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = -[VUILibraryMediaItem_iOS initWithMPMediaItem:]([VUILibraryMediaItem_iOS alloc], "initWithMPMediaItem:", v21);
            objc_msgSend(v9, "addObject:", v26);

          }
          else
          {
            -[VUIIKPlaylistElementToMediaItemsMapper _storeAuxMediaItemForIKMediaElement:isExtrasContent:](self, "_storeAuxMediaItemForIKMediaElement:isExtrasContent:", v14, v30);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend(v9, "addObject:", v21);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v11 = v27;
    }
    while (v27);
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1970]), "initWithMediaItems:index:isCollection:", v9, 0, 0);
  return v28;
}

- (id)playlistForIKMediaElements:(id)a3 isExtrasContent:(BOOL)a4
{
  return -[VUIIKPlaylistElementToMediaItemsMapper playlistForIKMediaElements:withMediaItem:isExtrasContent:](self, "playlistForIKMediaElements:withMediaItem:isExtrasContent:", a3, 0, a4);
}

- (id)_storeMediaItemsForAdamID:(int64_t)a3 IKMediaElement:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  VUIStoreMediaItem_iOS *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VUIMediaStartTimeInfo *v19;
  void *v20;
  VUIMediaStartTimeInfo *v21;
  void *v22;
  void *v23;

  v6 = a4;
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIStoreMediaItem_iOS initWithAdamID:videoManagedObject:isForStartingDownload:]([VUIStoreMediaItem_iOS alloc], "initWithAdamID:videoManagedObject:isForStartingDownload:", a3, 0, 0);
  objc_msgSend(v8, "vui_fpsCertificateURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS setFpsCertificateURL:](v9, "setFpsCertificateURL:", v10);

  objc_msgSend(v8, "vui_fpsKeyServerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS setFpsKeyServerURL:](v9, "setFpsKeyServerURL:", v11);

  -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v9, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iTunesLibraryPlaybackMediaMetricsForAdamID:mediaType:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v9, "setMediaItemMetadata:forProperty:", v15, *MEMORY[0x1E0DB1B88]);
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "iTunesVPAF");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v9, "setMediaItemMetadata:forProperty:", v17, *MEMORY[0x1E0DB1CE8]);

  objc_msgSend(v8, "vui_resumeTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = [VUIMediaStartTimeInfo alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v19, "initWithStartTime:timestamp:type:source:", v18, v20, 0, CFSTR("ITML/XML"));

    -[VUIBaseMediaItem startTimeCollection](v9, "startTimeCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addStartTimeInfo:", v21);

  }
  if (objc_msgSend(v8, "vui_disableLocalAsset"))
    -[VUIStoreMediaItem_iOS setMediaItemMetadata:forProperty:](v9, "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1AE8]);
  -[VUIIKPlaylistElementToMediaItemsMapper _createClipMediaItemsIfTimeExists:fromMediaElement:](self, "_createClipMediaItemsIfTimeExists:fromMediaElement:", v9, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_storeAuxMediaItemForIKMediaElement:(id)a3 isExtrasContent:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  VUIStoreAuxMediaItem *v8;
  void *v9;
  VUIStoreAuxMediaItem *v10;
  void *v11;
  void *v12;
  void *v13;
  VUIStoreAuxMediaItem *v14;
  id v15;
  id v16;
  void *v17;
  VUIStoreAuxMediaItem *v18;
  _QWORD v20[4];
  VUIStoreAuxMediaItem *v21;
  id v22;
  id v23;
  BOOL v24;

  v5 = a3;
  objc_msgSend(v5, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [VUIStoreAuxMediaItem alloc];
  objc_msgSend(v7, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIStoreAuxMediaItem initWithURL:](v8, "initWithURL:", v9);

  objc_msgSend(v7, "vui_fpsCertificateURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setFpsCertificateURL:](v10, "setFpsCertificateURL:", v11);

  objc_msgSend(v7, "vui_fpsKeyServerURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setFpsKeyServerURL:](v10, "setFpsKeyServerURL:", v12);

  objc_opt_class();
  -[VUIStoreAuxMediaItem setIsAudioOnly:](v10, "setIsAudioOnly:", objc_opt_isKindOfClass() & 1);
  objc_msgSend(v7, "bookmarkID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIStoreAuxMediaItem setBookmarkID:](v10, "setBookmarkID:", v13);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__VUIIKPlaylistElementToMediaItemsMapper__storeAuxMediaItemForIKMediaElement_isExtrasContent___block_invoke;
  v20[3] = &unk_1E9F9A1B8;
  v14 = v10;
  v21 = v14;
  v22 = v7;
  v23 = v5;
  v24 = a4;
  v15 = v5;
  v16 = v7;
  -[TVPBaseMediaItem performMediaItemMetadataTransactionWithBlock:](v14, "performMediaItemMetadataTransactionWithBlock:", v20);
  v17 = v23;
  v18 = v14;

  return v18;
}

void __94__VUIIKPlaylistElementToMediaItemsMapper__storeAuxMediaItemForIKMediaElement_isExtrasContent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  VUIMediaStartTimeInfo *v18;
  void *v19;
  VUIMediaStartTimeInfo *v20;
  void *v21;
  __CFString *v22;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_activeiTunesAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_DSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaItemMetadata:forProperty:", v5, *MEMORY[0x1E0DB1A50]);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "adamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaItemMetadata:forProperty:", v7, *MEMORY[0x1E0DB1CB8]);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "externalID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMediaItemMetadata:forProperty:", v9, *MEMORY[0x1E0DB1AB0]);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "vui_title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaItemMetadata:forProperty:", v11, *MEMORY[0x1E0DB1CC8]);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "vui_imageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMediaItemMetadata:forProperty:", v14, *MEMORY[0x1E0DB19E8]);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "vui_description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMediaItemMetadata:forProperty:", v16, *MEMORY[0x1E0DB1B70]);

  objc_msgSend(*(id *)(a1 + 40), "serviceID");
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v22, "length") && *(_BYTE *)(a1 + 56))
  {

    v22 = CFSTR("com.apple.itunes.extras");
  }
  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", v22, *MEMORY[0x1E0DB1C50]);
  objc_msgSend(*(id *)(a1 + 40), "vui_resumeTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = [VUIMediaStartTimeInfo alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[VUIMediaStartTimeInfo initWithStartTime:timestamp:type:source:](v18, "initWithStartTime:timestamp:type:source:", v17, v19, 0, CFSTR("ITML/XML"));

    objc_msgSend(*(id *)(a1 + 32), "startTimeCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addStartTimeInfo:", v20);

  }
}

- (id)_createClipMediaItemsIfTimeExists:(id)a3 fromMediaElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "timelines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setBookmarkDisabled:", 1);
      }
      -[VUIIKPlaylistElementToMediaItemsMapper _clipMediaItemsMediaItem:fromTimelineElement:](self, "_clipMediaItemsMediaItem:fromTimelineElement:", v6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
        objc_msgSend(v8, "addObjectsFromArray:", v11);

    }
    else
    {
      objc_msgSend(v8, "addObject:", v6);
    }

  }
  return v8;
}

- (id)_clipMediaItemsMediaItem:(id)a3 fromTimelineElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = v7;
    objc_msgSend(v7, "events");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v15, "offset");
          v17 = v16;
          objc_msgSend(v15, "duration");
          v19 = v18;
          v20 = objc_alloc(MEMORY[0x1E0DB1910]);
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1980]), "initWithStartTime:duration:", v17, v19);
          v22 = (void *)objc_msgSend(v20, "initWithMediaItem:clipTimeRange:", v6, v21);

          -[VUIIKPlaylistElementToMediaItemsMapper _populateMediaItem:withMetadatafromTimelineEventElement:](self, "_populateMediaItem:withMetadatafromTimelineEventElement:", v22, v15);
          objc_msgSend(v10, "addObject:", v22);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    v7 = v24;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_populateMediaItem:(id)a3 withMetadatafromVideoElement:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "relatedContent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIIKPlaylistElementToMediaItemsMapper _populateMediaItem:withMetadatafromRelatedContentElement:](self, "_populateMediaItem:withMetadatafromRelatedContentElement:", v6, v7);

}

- (void)_populateMediaItem:(id)a3 withMetadatafromTimelineEventElement:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "relatedContent");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIIKPlaylistElementToMediaItemsMapper _populateMediaItem:withMetadatafromRelatedContentElement:](self, "_populateMediaItem:withMetadatafromRelatedContentElement:", v6, v7);

}

- (void)_populateMediaItem:(id)a3 withMetadatafromRelatedContentElement:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v47 = v5;
  isKindOfClass = objc_opt_isKindOfClass();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v36 = v6;
  objc_msgSend(v6, "children");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    v11 = *MEMORY[0x1E0D3A480];
    v12 = *MEMORY[0x1E0D3A530];
    v46 = *MEMORY[0x1E0D3A408];
    v44 = *MEMORY[0x1E0D3A450];
    v42 = *MEMORY[0x1E0DB19E8];
    v43 = *MEMORY[0x1E0DB1B70];
    v45 = *MEMORY[0x1E0DB1CC8];
    v37 = *MEMORY[0x1E0D3A480];
    v38 = *(_QWORD *)v53;
    do
    {
      v13 = 0;
      v39 = v9;
      do
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v13);
        objc_msgSend(v14, "elementName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v11);

        if (v16)
        {
          v41 = v13;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v14, "children");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (!v18)
            goto LABEL_25;
          v19 = v18;
          v20 = *(_QWORD *)v49;
          while (1)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v49 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v22, "elementName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToString:", v12);

              if (v24)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v22, "text");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "string");
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                v27 = v47;
                v28 = v26;
                v29 = v45;
                goto LABEL_15;
              }
              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v22, "elementName");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = objc_msgSend(v30, "isEqualToString:", v46);

                if (v31)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v22, "text");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "string");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();

                    v27 = v47;
                    v28 = v26;
                    v29 = v43;
LABEL_15:
                    objc_msgSend(v27, "setMediaItemMetadata:forProperty:", v28, v29);

                    continue;
                  }
                }
                else
                {
                  objc_msgSend(v22, "elementName");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "isEqualToString:", v44);

                  if (v34)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v22, "url");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "absoluteString");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();

                      v27 = v47;
                      v28 = v26;
                      v29 = v42;
                      goto LABEL_15;
                    }
                  }
                }
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            if (!v19)
            {
LABEL_25:

              v11 = v37;
              v10 = v38;
              v9 = v39;
              v13 = v41;
              break;
            }
          }
        }
        ++v13;
      }
      while (v13 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v9);
  }

}

- (unint64_t)resumeMenuBehavior
{
  return self->_resumeMenuBehavior;
}

- (void)setResumeMenuBehavior:(unint64_t)a3
{
  self->_resumeMenuBehavior = a3;
}

@end
