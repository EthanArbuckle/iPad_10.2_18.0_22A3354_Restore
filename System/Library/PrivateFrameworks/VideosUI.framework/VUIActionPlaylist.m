@implementation VUIActionPlaylist

- (VUIActionPlaylist)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7;
  id v8;
  VUIActionPlaylist *v9;
  VUIActionPlaylist *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *videosPlayable;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  NSArray *clipItems;
  uint64_t v19;
  NSArray *metadataViewModels;
  uint64_t v21;
  NSString *nextToken;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VUIActionPlaylist;
  v9 = -[VUIActionPlaylist init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("videosPlayables"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "vui_dictionaryForKey:", CFSTR("contentMetadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIVideosPlayable videosPlayablesFromDictionaries:andMetadataDictionary:](VUIVideosPlayable, "videosPlayablesFromDictionaries:andMetadataDictionary:", v11, v12);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    videosPlayable = v10->_videosPlayable;
    v10->_videosPlayable = v13;
    v15 = v13;

    objc_msgSend(v7, "vui_numberForKey:", CFSTR("index"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_index = objc_msgSend(v16, "integerValue");

    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("clipItems"));
    v17 = objc_claimAutoreleasedReturnValue();
    clipItems = v10->_clipItems;
    v10->_clipItems = (NSArray *)v17;

    objc_msgSend(v7, "vui_arrayForKey:", CFSTR("metadataViewModels"));
    v19 = objc_claimAutoreleasedReturnValue();
    metadataViewModels = v10->_metadataViewModels;
    v10->_metadataViewModels = (NSArray *)v19;

    v10->_requiresAuthentication = objc_msgSend(v7, "vui_BOOLForKey:defaultValue:", CFSTR("requiresAuthentication"), 0);
    objc_msgSend(v7, "vui_stringForKey:", CFSTR("nextToken"));
    v21 = objc_claimAutoreleasedReturnValue();
    nextToken = v10->_nextToken;
    v10->_nextToken = (NSString *)v21;

  }
  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  VUIMediaInfo *v8;
  void *v9;
  VUIMediaInfo *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  id v23;
  VUIMediaInfo *v24;
  id v25;
  id v26;
  id location;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = [VUIMediaInfo alloc];
  -[VUIActionPlaylist videosPlayable](self, "videosPlayable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIMediaInfo initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:](v8, "initWithPlaybackContext:videosPlayables:imageProxies:storeDictionary:", 10, v9, 0, 0);

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isFullscreenPlaybackUIBeingShown");

  if (v12)
    v13 = 2;
  else
    v13 = 0;
  +[VUIPlaybackStartupCoordinator startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:](VUIPlaybackStartupCoordinator, "startupCoordinatorWithMediaInfo:watchType:isRentAndWatchNow:", v10, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIActionPlaylist videosPlayable](self, "videosPlayable");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sharedWatchUrl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v18 = 1;
  else
    v18 = objc_msgSend(v16, "useSharedPlayableForCowatching");

  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "groupActivitiesManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEligibleForSession");

  if (v21 && v18)
  {
    -[VUIMediaInfo setIntent:](v10, "setIntent:", 1);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke;
    v28[3] = &unk_1E9F98E68;
    v29 = v7;
    +[VUIActionPlay playMediaInfo:watchType:isRentAndWatchNow:completion:](VUIActionPlay, "playMediaInfo:watchType:isRentAndWatchNow:completion:", v10, 0, 0, v28);

  }
  else
  {
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_2;
    v22[3] = &unk_1E9F9A290;
    v23 = v14;
    v24 = v10;
    v25 = v7;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v23, "performPlaybackStartupFlowWithCompletion:", v22);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }

}

uint64_t __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_2(id *a1, int a2, int a3, uint64_t a4, char a5, void *a6, void *a7, void *a8)
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  void (*v21)(void);
  id WeakRetained;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (a2)
  {
    if (a3)
    {
      VUIDefaultLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "VUIActionPlaylist:: cowatching, skipping playlist feature", buf, 2u);
      }

      objc_msgSend(a1[5], "setIntent:", 1);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_17;
      v25[3] = &unk_1E9F9A268;
      v18 = a1[5];
      v26 = a1[6];
      LOBYTE(v24) = a5;
      +[VUIActionPlay presentPlaybackWithMediaInfo:multiviewMediaInfos:extrasInfo:isCoWatching:watchType:playType:allowsCellular:previewMetadata:completion:](VUIActionPlay, "presentPlaybackWithMediaInfo:multiviewMediaInfos:extrasInfo:isCoWatching:watchType:playType:allowsCellular:previewMetadata:completion:", v18, MEMORY[0x1E0C9AA60], 0, 1, 0, CFSTR("play"), v24, v16, v25);

      goto LABEL_13;
    }
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "_presentViewController");

    v23 = a1[6];
    if (!v23)
      goto LABEL_13;
    v21 = (void (*)(void))*((_QWORD *)v23 + 2);
LABEL_12:
    v21();
    goto LABEL_13;
  }
  VUIDefaultLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v19, OS_LOG_TYPE_DEFAULT, "VUIActionPlaylist:: start playback is false, failing playlist presentation", buf, 2u);
  }

  v20 = a1[6];
  if (v20)
  {
    v21 = (void (*)(void))*((_QWORD *)v20 + 2);
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __66__VUIActionPlaylist_performWithTargetResponder_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_presentViewController
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIActionPlaylist:: not presenting because presenting view controlller or docuemnt is missing", v1, 2u);
}

void __43__VUIActionPlaylist__presentViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  void *v9;
  VUIMediaInfo *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;

  v6 = (id *)(a1 + 40);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(v7, "currentMediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIMediaInfo initWithPlaybackContext:storeAuxMediaItem:]([VUIMediaInfo alloc], "initWithPlaybackContext:storeAuxMediaItem:", 10, v9);
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentCreator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(WeakRetained, "index");
  objc_msgSend(*(id *)(a1 + 32), "clipItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metadataViewModels");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "nextToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "catchUpToLiveViewControllerWithIndex:mediaInfo:segments:metadataViewModels:nextToken:", v13, v10, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "embedCatchUpToLiveViewController:reusingFullscreenPlaybackWithPlayer:", v17, v7);
}

void __43__VUIActionPlaylist__presentViewController__block_invoke_24(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "embedCatchUpToLiveViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "vuiView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (NSArray)videosPlayable
{
  return self->_videosPlayable;
}

- (void)setVideosPlayable:(id)a3
{
  objc_storeStrong((id *)&self->_videosPlayable, a3);
}

- (unint64_t)index
{
  return self->_index;
}

- (NSDictionary)collectionViewModel
{
  return self->_collectionViewModel;
}

- (void)setCollectionViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewModel, a3);
}

- (NSArray)clipItems
{
  return self->_clipItems;
}

- (void)setClipItems:(id)a3
{
  objc_storeStrong((id *)&self->_clipItems, a3);
}

- (NSArray)metadataViewModels
{
  return self->_metadataViewModels;
}

- (void)setMetadataViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_metadataViewModels, a3);
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (NSString)nextToken
{
  return self->_nextToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextToken, 0);
  objc_storeStrong((id *)&self->_metadataViewModels, 0);
  objc_storeStrong((id *)&self->_clipItems, 0);
  objc_storeStrong((id *)&self->_collectionViewModel, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end
