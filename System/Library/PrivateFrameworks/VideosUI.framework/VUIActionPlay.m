@implementation VUIActionPlay

- (VUIActionPlay)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7;
  id v8;
  VUIActionPlay *v9;
  VUIActionPlay *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSArray *videosPlayables;
  NSArray *v23;
  uint64_t v24;
  NSArray *multiviewPlayables;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v33;
  NSArray *v34;
  id v35;
  void *v36;
  VUIActionPlay *v37;
  id v38;
  void *v39;
  id obj;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v46.receiver = self;
  v46.super_class = (Class)VUIActionPlay;
  v9 = -[VUIActionPlay init](&v46, sel_init);
  v10 = v9;
  if (v9)
  {
    v35 = a3;
    v37 = v9;
    v38 = v8;
    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("videosPlayables"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_dictionaryForKey:", CFSTR("contentMetadata"));
    v33 = (void *)v11;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v11);
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v39 = v7;
    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("multiviewPlaybackInformation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v12;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("videosPlayables"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("contentMetadata"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "count"))
          {
            objc_msgSend(v20, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v21);

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v14);
    }

    v10 = v37;
    videosPlayables = v37->_videosPlayables;
    v37->_videosPlayables = v34;
    v23 = v34;

    objc_storeStrong((id *)&v37->_contextData, v35);
    v8 = v38;
    objc_storeWeak((id *)&v37->_appContext, v38);
    v37->_upNextPlayback = objc_msgSend(v36, "vui_BOOLForKey:defaultValue:", CFSTR("isUpNextPlayback"), 0);
    v37->_playRequiresAccount = objc_msgSend(v36, "vui_BOOLForKey:defaultValue:", CFSTR("playRequiresAccount"), 0);
    v24 = objc_msgSend(v41, "copy");
    multiviewPlayables = v37->_multiviewPlayables;
    v37->_multiviewPlayables = (NSArray *)v24;

    -[NSArray firstObject](v23, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "sourceRef");
    if ((unint64_t)(v27 - 1) >= 3)
    {
      v7 = v39;
      objc_msgSend(v39, "vui_stringForKey:", CFSTR("type"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("replace"));

      v28 = 4;
      if (!v30)
        v28 = 0;
    }
    else
    {
      v28 = qword_1DA1C22C0[v27 - 1];
      v7 = v39;
    }
    v37->_watchType = v28;
    if (v37->_upNextPlayback)
    {
      v31 = 2;
    }
    else
    {
      switch(v27)
      {
        case 2:
          v31 = 6;
          break;
        case 9:
          v31 = 9;
          break;
        case 3:
          v31 = 7;
          break;
        default:
          v31 = 0;
          break;
      }
    }
    v37->_playbackContext = v31;

  }
  return v10;
}

- (VUIActionPlay)initWithVideosPlayables:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  id v11;
  VUIActionPlay *v12;
  VUIActionPlay *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionPlay;
  v12 = -[VUIActionPlay init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_videosPlayables, a3);
    v13->_watchType = a4;
    v13->_playbackContext = a5;
    v13->_isRentAndWatchNow = a6;
  }

  return v13;
}

- (VUIActionPlay)initWithMPMediaItem:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  id v11;
  VUIActionPlay *v12;
  VUIActionPlay *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionPlay;
  v12 = -[VUIActionPlay init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mpMediaItem, a3);
    v13->_watchType = a4;
    v13->_playbackContext = a5;
    v13->_isRentAndWatchNow = a6;
  }

  return v13;
}

- (VUIActionPlay)initWithSidebandAdamID:(id)a3 watchType:(int64_t)a4 playbackContext:(unint64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  id v11;
  VUIActionPlay *v12;
  VUIActionPlay *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionPlay;
  v12 = -[VUIActionPlay init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sidebandLibraryAdamID, a3);
    v13->_watchType = a4;
    v13->_playbackContext = a5;
    v13->_isRentAndWatchNow = a6;
  }

  return v13;
}

- (NSString)playType
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[VUIActionPlay contextData](self, "contextData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_stringForKey:", CFSTR("type"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("play");
  v5 = v3;

  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  VUIMediaInfo *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  VUIMediaInfo *v24;
  void *v25;
  int64_t v26;
  _BOOL8 v27;
  VUIMediaInfo *v28;
  VUIMediaInfo *v29;
  void *v30;
  VUIMediaInfo *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  VUIMediaInfo *v35;
  void *v36;
  int64_t v37;
  _BOOL8 v38;
  void (**v39)(id, uint64_t);
  id v40;
  _QWORD v41[4];
  VUIMediaInfo *v42;
  _QWORD v43[4];
  VUIMediaInfo *v44;
  void *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  -[VUIActionPlay videosPlayables](self, "videosPlayables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v39 = v6;
    -[VUIActionPlay appContext](self, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VUIActionPlay playbackContext](self, "playbackContext");
    if (!v9)
    {
      -[VUIActionPlay openURLCompletionDate](self, "openURLCompletionDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v9 = 5;
      else
        v9 = 1;

    }
    v11 = (void *)objc_opt_class();
    -[VUIActionPlay videosPlayables](self, "videosPlayables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIActionPlay multiviewPlayables](self, "multiviewPlayables");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VUIActionPlay watchType](self, "watchType");
    v15 = -[VUIActionPlay isUpNextPlayback](self, "isUpNextPlayback");
    -[VUIActionPlay userPlaybackInitiationDate](self, "userPlaybackInitiationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIActionPlay openURLCompletionDate](self, "openURLCompletionDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIActionPlay playType](self, "playType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_playPlayables:multiviewPlayables:appContext:watchType:isUpNextPlayback:userPlaybackInitiationDate:openURLCompletionDate:playType:playbackContext:targetResponder:", v12, v13, v8, v14, v15, v16, v17, v18, v9, v40);

    v6 = v39;
  }
  else
  {
    -[VUIActionPlay mpMediaItem](self, "mpMediaItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = [VUIMediaInfo alloc];
      v21 = -[VUIActionPlay playbackContext](self, "playbackContext");
      -[VUIActionPlay mpMediaItem](self, "mpMediaItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[VUIMediaInfo initWithPlaybackContext:mpMediaItems:](v20, "initWithPlaybackContext:mpMediaItems:", v21, v23);

      -[VUIMediaInfo setIntent:](v24, "setIntent:", 1);
      v25 = (void *)objc_opt_class();
      v26 = -[VUIActionPlay watchType](self, "watchType");
      v27 = -[VUIActionPlay isRentAndWatchNow](self, "isRentAndWatchNow");
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke;
      v43[3] = &unk_1E9FA0630;
      v44 = v24;
      v28 = v24;
      objc_msgSend(v25, "_playMediaInfo:multiviewMediaInfos:watchType:extrasInfo:playType:isRentAndWatchNow:targetResponder:completion:", v28, MEMORY[0x1E0C9AA60], v26, 0, CFSTR("play"), v27, v40, v43);
      v29 = v44;
    }
    else
    {
      -[VUIActionPlay sidebandLibraryAdamID](self, "sidebandLibraryAdamID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_13;
      v31 = [VUIMediaInfo alloc];
      v32 = -[VUIActionPlay playbackContext](self, "playbackContext");
      -[VUIActionPlay sidebandLibraryAdamID](self, "sidebandLibraryAdamID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[VUIMediaInfo initWithPlaybackContext:sidebandLibraryAdamIDs:](v31, "initWithPlaybackContext:sidebandLibraryAdamIDs:", v32, v34);

      -[VUIMediaInfo setIntent:](v35, "setIntent:", 1);
      v36 = (void *)objc_opt_class();
      v37 = -[VUIActionPlay watchType](self, "watchType");
      v38 = -[VUIActionPlay isRentAndWatchNow](self, "isRentAndWatchNow");
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke_2;
      v41[3] = &unk_1E9FA0630;
      v42 = v35;
      v28 = v35;
      objc_msgSend(v36, "_playMediaInfo:multiviewMediaInfos:watchType:extrasInfo:playType:isRentAndWatchNow:targetResponder:completion:", v28, MEMORY[0x1E0C9AA60], v37, 0, CFSTR("play"), v38, v40, v41);
      v29 = v42;
    }

  }
LABEL_13:
  if (v6)
    v6[2](v6, 1);

}

void __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tvpPlaylist");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILibraryMetrics recordPlayOfTVPMediaItem:](VUILibraryMetrics, "recordPlayOfTVPMediaItem:", v1);

}

void __62__VUIActionPlay_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tvpPlaylist");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUILibraryMetrics recordPlayOfTVPMediaItem:](VUILibraryMetrics, "recordPlayOfTVPMediaItem:", v1);

}

+ (void)_playPlayables:(id)a3 multiviewPlayables:(id)a4 appContext:(id)a5 watchType:(int64_t)a6 isUpNextPlayback:(BOOL)a7 userPlaybackInitiationDate:(id)a8 openURLCompletionDate:(id)a9 playType:(id)a10 playbackContext:(unint64_t)a11 targetResponder:(id)a12
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  VUIMediaInfo *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  VUIMediaInfo *v28;
  void *v29;
  VUIMediaInfo *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  VUIMediaInfo *v36;
  id v37;
  id v38;
  void *v40;
  id obj;
  void *v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v38 = a10;
  v37 = a12;
  objc_msgSend(v15, "firstObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v15;
  v20 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:]([VUIMediaInfo alloc], "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", a11, v15, 0, 0);
  v42 = v17;
  -[VUIMediaInfo setAppContext:](v20, "setAppContext:", v17);
  -[VUIMediaInfo setIntent:](v20, "setIntent:", 1);
  v36 = v20;
  v21 = v19;
  -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v20, "setUserPlaybackInitiationDate:openURLCompletionDate:", v18, v19);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v16;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v46 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v28 = [VUIMediaInfo alloc];
        v49 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](v28, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", a11, v29, 0, 0);

        -[VUIMediaInfo setAppContext:](v30, "setAppContext:", v42);
        -[VUIMediaInfo setIntent:](v30, "setIntent:", 1);
        -[VUIMediaInfo setUserPlaybackInitiationDate:openURLCompletionDate:](v30, "setUserPlaybackInitiationDate:openURLCompletionDate:", v18, v21);
        objc_msgSend(v22, "addObject:", v30);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v24);
  }

  v31 = (void *)objc_opt_class();
  v32 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v35, "extrasInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __179__VUIActionPlay__playPlayables_multiviewPlayables_appContext_watchType_isUpNextPlayback_userPlaybackInitiationDate_openURLCompletionDate_playType_playbackContext_targetResponder___block_invoke;
  v43[3] = &unk_1E9FA0630;
  v44 = v35;
  v34 = v35;
  objc_msgSend(v31, "_playMediaInfo:multiviewMediaInfos:watchType:extrasInfo:playType:isRentAndWatchNow:targetResponder:completion:", v36, v32, a6, v33, v38, 0, v37, v43);

}

uint64_t __179__VUIActionPlay__playPlayables_multiviewPlayables_appContext_watchType_isUpNextPlayback_userPlaybackInitiationDate_openURLCompletionDate_playType_playbackContext_targetResponder___block_invoke(uint64_t result, int a2, int a3)
{
  if (a2)
    return +[VUIMetricsMediaEvent recordPlay:isLaunchingExtras:](VUIMetricsMediaEvent, "recordPlay:isLaunchingExtras:", *(_QWORD *)(result + 32), a3 ^ 1u);
  return result;
}

+ (void)playMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5
{
  objc_msgSend(a1, "playMediaInfo:multiviewMediaInfos:watchType:isRentAndWatchNow:", a3, MEMORY[0x1E0C9AA60], a4, a5);
}

+ (void)playMediaInfo:(id)a3 watchType:(int64_t)a4 isRentAndWatchNow:(BOOL)a5 completion:(id)a6
{
  objc_msgSend(a1, "playMediaInfo:multiviewMediaInfos:watchType:isRentAndWatchNow:completion:", a3, MEMORY[0x1E0C9AA60], a4, a5, a6);
}

+ (void)playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 isRentAndWatchNow:(BOOL)a6
{
  objc_msgSend(a1, "playMediaInfo:multiviewMediaInfos:watchType:isRentAndWatchNow:completion:", a3, a4, a5, a6, 0);
}

+ (void)playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 isRentAndWatchNow:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a6;
  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_class();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__VUIActionPlay_playMediaInfo_multiviewMediaInfos_watchType_isRentAndWatchNow_completion___block_invoke;
  v16[3] = &unk_1E9F9A268;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "_playMediaInfo:multiviewMediaInfos:watchType:extrasInfo:playType:isRentAndWatchNow:targetResponder:completion:", v13, v12, a5, 0, CFSTR("play"), v7, 0, v16);

}

uint64_t __90__VUIActionPlay_playMediaInfo_multiviewMediaInfos_watchType_isRentAndWatchNow_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)_playMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 watchType:(int64_t)a5 extrasInfo:(id)a6 playType:(id)a7 isRentAndWatchNow:(BOOL)a8 targetResponder:(id)a9 completion:(id)a10
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _BOOL4 v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int64_t v43;
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v46;

  v31 = a8;
  v14 = a3;
  v15 = a4;
  v34 = a6;
  v33 = a7;
  v32 = a9;
  v16 = a10;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke;
  aBlock[3] = &unk_1E9F9A268;
  v18 = v16;
  v46 = v18;
  v19 = _Block_copy(aBlock);
  objc_msgSend(v14, "videosPlayables");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sharedWatchId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "groupActivitiesManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isSharedWatchIdValidForCurrentSession:", v22);

  if (a5 == 1 && v22 && (v25 & 1) == 0)
  {
    VUIDefaultLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Ignoring playback request because the session does not match the shared watch id", buf, 2u);
    }

    (*((void (**)(void *, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
    v28 = v33;
    v27 = v34;
    v29 = v32;
  }
  else
  {
    +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:](VUIPlaybackStartupCoordinator, "startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:", v14, a5, v31);
    v35[0] = v17;
    v35[1] = 3221225472;
    v35[2] = __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke_29;
    v35[3] = &unk_1E9FA0658;
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v43 = a5;
    v37 = v14;
    v38 = v15;
    v27 = v34;
    v29 = v32;
    v28 = v33;
    v39 = v34;
    v40 = v33;
    v41 = v32;
    v42 = v19;
    v30 = v36;
    objc_msgSend(v30, "performPlaybackStartupFlowWithCompletion:", v35);

  }
}

uint64_t __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __127__VUIActionPlay__playMediaInfo_multiviewMediaInfos_watchType_extrasInfo_playType_isRentAndWatchNow_targetResponder_completion___block_invoke_29(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v13 = a8;
  VUIDefaultLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v23 = a2;
    v24 = 2048;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    v28 = 2048;
    v29 = a5;
    _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Startup coordinator finished startup flow.  startPlayback == %ld, isCoWatching == %ld, forceDownloadToStream == %ld, allowCellular == %ld", buf, 0x2Au);
  }

  VUIDefaultLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Starting playback since startup flow allowed it", buf, 2u);
    }

    if ((_DWORD)a3 && *(_QWORD *)(a1 + 88) == 1)
    {
      VUIDefaultLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Playback will be co-watched, will use existing resume time for join", buf, 2u);
      }

    }
    if (a4)
    {
      VUIDefaultLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Forcing downloaded video to be streamed", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "tvpPlaylist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentMediaItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setMediaItemMetadata:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0DB1AE8]);
    }
    LOBYTE(v21) = a5;
    +[VUIActionPlay presentPlaybackWithMediaInfo:multiviewMediaInfos:extrasInfo:isCoWatching:watchType:playType:allowsCellular:previewMetadata:targetResponder:completion:](VUIActionPlay, "presentPlaybackWithMediaInfo:multiviewMediaInfos:extrasInfo:isCoWatching:watchType:playType:allowsCellular:previewMetadata:targetResponder:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a3, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64), v21, v13, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - Not starting playback since startup flow disallowed it", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }

}

+ (void)presentPlaybackWithMediaInfo:(id)a3 multiviewMediaInfos:(id)a4 extrasInfo:(id)a5 isCoWatching:(BOOL)a6 watchType:(int64_t)a7 playType:(id)a8 allowsCellular:(BOOL)a9 previewMetadata:(id)a10 targetResponder:(id)a11 completion:(id)a12
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void (**v66)(void *, uint64_t);
  id v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD aBlock[4];
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v69 = a4;
  v15 = a8;
  v16 = a10;
  v17 = a11;
  v18 = a12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __167__VUIActionPlay_presentPlaybackWithMediaInfo_multiviewMediaInfos_extrasInfo_isCoWatching_watchType_playType_allowsCellular_previewMetadata_targetResponder_completion___block_invoke;
  aBlock[3] = &unk_1E9F98E18;
  v67 = v18;
  v75 = v67;
  v66 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  objc_msgSend(v14, "tvpPlaylist");
  v19 = objc_claimAutoreleasedReturnValue();
  +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "topViewController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "presentedViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)v19;
  v63 = v20;
  if (!v20
    || (v21 = v20, (objc_msgSend(v20, "isBeingDismissed") & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appWindow");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "rootViewController");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "controllerPresenter");
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v24 = v21;
  }
  v62 = v24;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "playbackContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v27, VUIPlaybackManagerPresentPlaylistUserInfoPlaybackContext[0]);

  objc_msgSend(v14, "videosPlayables");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v14, "videosPlayables");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "metadata");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v17;
    v35 = v16;
    v36 = v15;
    v37 = objc_msgSend(v33, "isEligibleForPlayerTabs");

    v38 = v37;
    v15 = v36;
    v16 = v35;
    v17 = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v39, VUIPlaybackManagerPresentPlaylistUserInfoIsEligibleForPlayerTabs[0]);

  }
  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v16, VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchMetadata[0]);
  objc_msgSend(v14, "videosPlayables");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sharedWatchId");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v42, VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchId[0]);

  objc_msgSend(v14, "videosPlayables");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "firstObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sharedWatchUrl");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v45, VUIPlaybackManagerPresentPlaylistUserInfoSharedWatchURL[0]);

  objc_msgSend(v26, "vui_setObjectIfNotNil:forKey:", v17, VUIPlaybackManagerPresentPlaylistUserInfoTargetResponder[0]);
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("multiview")))
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v68;
    objc_msgSend(v46, "addPlaylistToMultiview:animated:completion:", v68, 1, 0);
    v48 = v69;
    v49 = v62;
  }
  else
  {
    v60 = v16;
    v61 = v15;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v68);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v50 = v69;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v71;
      do
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v71 != v53)
            objc_enumerationMutation(v50);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v54), "tvpPlaylist");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v55);

          ++v54;
        }
        while (v52 != v54);
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v52);
    }

    v56 = objc_msgSend(v46, "count");
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v56 < 2)
    {
      v59 = (void *)objc_msgSend(v26, "copy");
      v47 = v68;
      v49 = v62;
      objc_msgSend(v58, "presentPlaylist:fromViewController:dismissalOperation:allowsCellular:animated:userInfo:completion:", v68, 0);

      v16 = v60;
    }
    else
    {
      v49 = v62;
      objc_msgSend(v57, "presentMultiviewWithPlaylists:fromViewController:animated:", v46, v62, 1);
      v16 = v60;
      v47 = v68;
    }

    v48 = v69;
    v15 = v61;
  }

  v66[2](v66, 1);
}

uint64_t __167__VUIActionPlay_presentPlaybackWithMediaInfo_multiviewMediaInfos_extrasInfo_isCoWatching_watchType_playType_allowsCellular_previewMetadata_targetResponder_completion___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    VUIDefaultLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "VUIActionPlay - DropOnTab: resetting last playback date %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("lastPlaybackDate"));

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

+ (id)_hlsURLUpdatedWithBingeWatchingParamFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("m3u8"));

    v7 = v4;
    if (v6)
    {
      objc_msgSend(v4, "vui_URLByAddingQueryParamWithName:value:", CFSTR("bingeWatching"), CFSTR("true"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v7 = v4;
      if (v8)
      {
        v7 = v8;

        VUIDefaultLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412290;
          v13 = v7;
          _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "HLS URL after adding bingeWatching param: %@", (uint8_t *)&v12, 0xCu);
        }

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAccountRequired
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  BOOL v9;

  v3 = -[VUIActionPlay playbackContext](self, "playbackContext");
  -[VUIActionPlay videosPlayables](self, "videosPlayables");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Trailer"));
  v8 = v3 == 3;
  v9 = v3 != 3;
  if (!v8 && v7)
    v9 = -[VUIActionPlay playRequiresAccount](self, "playRequiresAccount");

  return v9;
}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (NSArray)videosPlayables
{
  return self->_videosPlayables;
}

- (void)setVideosPlayables:(id)a3
{
  objc_storeStrong((id *)&self->_videosPlayables, a3);
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (NSDate)userPlaybackInitiationDate
{
  return self->_userPlaybackInitiationDate;
}

- (void)setUserPlaybackInitiationDate:(id)a3
{
  objc_storeStrong((id *)&self->_userPlaybackInitiationDate, a3);
}

- (NSDate)openURLCompletionDate
{
  return self->_openURLCompletionDate;
}

- (void)setOpenURLCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_openURLCompletionDate, a3);
}

- (BOOL)isUpNextPlayback
{
  return self->_upNextPlayback;
}

- (void)setUpNextPlayback:(BOOL)a3
{
  self->_upNextPlayback = a3;
}

- (MPMediaItem)mpMediaItem
{
  return self->_mpMediaItem;
}

- (void)setMpMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mpMediaItem, a3);
}

- (NSString)sidebandLibraryAdamID
{
  return self->_sidebandLibraryAdamID;
}

- (void)setSidebandLibraryAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_sidebandLibraryAdamID, a3);
}

- (int64_t)watchType
{
  return self->_watchType;
}

- (void)setWatchType:(int64_t)a3
{
  self->_watchType = a3;
}

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (BOOL)isRentAndWatchNow
{
  return self->_isRentAndWatchNow;
}

- (void)setIsRentAndWatchNow:(BOOL)a3
{
  self->_isRentAndWatchNow = a3;
}

- (BOOL)playRequiresAccount
{
  return self->_playRequiresAccount;
}

- (void)setPlayRequiresAccount:(BOOL)a3
{
  self->_playRequiresAccount = a3;
}

- (NSArray)multiviewPlayables
{
  return self->_multiviewPlayables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiviewPlayables, 0);
  objc_storeStrong((id *)&self->_sidebandLibraryAdamID, 0);
  objc_storeStrong((id *)&self->_mpMediaItem, 0);
  objc_storeStrong((id *)&self->_openURLCompletionDate, 0);
  objc_storeStrong((id *)&self->_userPlaybackInitiationDate, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_videosPlayables, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end
