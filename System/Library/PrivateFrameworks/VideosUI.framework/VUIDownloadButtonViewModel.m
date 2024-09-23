@implementation VUIDownloadButtonViewModel

+ (id)viewModelWithVideosPlayable:(id)a3
{
  id v3;
  VUIDownloadButtonViewModel *v4;

  v3 = a3;
  v4 = -[VUIDownloadButtonViewModel initWithVideosPlayable:]([VUIDownloadButtonViewModel alloc], "initWithVideosPlayable:", v3);

  return v4;
}

- (VUIDownloadButtonViewModel)initWithVideosPlayable:(id)a3
{
  id v4;
  VUIDownloadButtonViewModel *v5;
  void *v6;
  uint64_t v7;
  VUIDownloadButtonViewModel *v8;
  void *v9;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  VUIDownloadButtonViewModel *v14;
  VUIDownloadButtonViewModel *v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIDownloadButtonViewModel;
  v5 = -[VUIDownloadButtonViewModel init](&v16, sel_init);
  if (v5
    && (objc_msgSend(v4, "adamID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    -[VUIDownloadButtonViewModel setVideosPlayable:](v5, "setVideosPlayable:", v4);
    v11 = MEMORY[0x1E0C809B0];
    v12 = __53__VUIDownloadButtonViewModel_initWithVideosPlayable___block_invoke;
    v13 = &unk_1E9F98FD8;
    v14 = (VUIDownloadButtonViewModel *)v4;
    v8 = v5;
    v15 = v8;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v11, 3221225472))
      v12((uint64_t)&v11);
    else
      dispatch_async(MEMORY[0x1E0C80D38], &v11);
    -[VUIDownloadButtonViewModel _createDownloadStateToStringArrayMap](v8, "_createDownloadStateToStringArrayMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButtonViewModel setDownloadStateToString:](v8, "setDownloadStateToString:", v9);

    v5 = v14;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __53__VUIDownloadButtonViewModel_initWithVideosPlayable___block_invoke(uint64_t a1)
{
  VUIUniversalAssetController *v2;

  v2 = -[VUIUniversalAssetController initWithVideosPlayable:]([VUIUniversalAssetController alloc], "initWithVideosPlayable:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setAssetController:", v2);

}

+ (id)viewModelWithAssetController:(id)a3
{
  id v3;
  VUIDownloadButtonViewModel *v4;

  v3 = a3;
  v4 = -[VUIDownloadButtonViewModel initWithAssetController:]([VUIDownloadButtonViewModel alloc], "initWithAssetController:", v3);

  return v4;
}

+ (id)viewModelWithMPMediaItem:(id)a3
{
  id v3;
  VUIDownloadButtonViewModel *v4;

  v3 = a3;
  v4 = -[VUIDownloadButtonViewModel initWithMPMediaItem:]([VUIDownloadButtonViewModel alloc], "initWithMPMediaItem:", v3);

  return v4;
}

+ (id)viewModelWithVideoManagedObject:(id)a3
{
  id v3;
  VUIDownloadButtonViewModel *v4;

  v3 = a3;
  v4 = -[VUIDownloadButtonViewModel initWithVideoManagedObject:]([VUIDownloadButtonViewModel alloc], "initWithVideoManagedObject:", v3);

  return v4;
}

+ (id)viewModelWithMPMediaItemCollection:(id)a3
{
  id v3;
  VUIDownloadButtonViewModel *v4;

  v3 = a3;
  v4 = -[VUIDownloadButtonViewModel initWithMPMediaItemCollection:]([VUIDownloadButtonViewModel alloc], "initWithMPMediaItemCollection:", v3);

  return v4;
}

- (VUIDownloadButtonViewModel)initWithAssetController:(id)a3
{
  id v4;
  VUIDownloadButtonViewModel *v5;
  VUIDownloadButtonViewModel *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDownloadButtonViewModel;
  v5 = -[VUIDownloadButtonViewModel init](&v9, sel_init);
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      -[VUIDownloadButtonViewModel setAssetController:](v5, "setAssetController:", v4);
      -[VUIDownloadButtonViewModel _createDownloadStateToStringArrayMap](v6, "_createDownloadStateToStringArrayMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButtonViewModel setDownloadStateToString:](v6, "setDownloadStateToString:", v7);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = v5;
    v6 = 0;
  }

  return v6;
}

- (VUIDownloadButtonViewModel)initWithMPMediaItem:(id)a3
{
  id v4;
  VUIDownloadButtonViewModel *v5;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  VUIDownloadButtonViewModel *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadButtonViewModel;
  v5 = -[VUIDownloadButtonViewModel init](&v12, sel_init);
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = __50__VUIDownloadButtonViewModel_initWithMPMediaItem___block_invoke;
    v9 = &unk_1E9F98FD8;
    v10 = v4;
    v11 = v5;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7, 3221225472))
      v8((uint64_t)&v7);
    else
      dispatch_async(MEMORY[0x1E0C80D38], &v7);

  }
  return v5;
}

void __50__VUIDownloadButtonViewModel_initWithMPMediaItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  VUIUniversalAssetController *v4;

  v4 = -[VUIUniversalAssetController initWithMPMediaItem:]([VUIUniversalAssetController alloc], "initWithMPMediaItem:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setAssetController:", v4);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "_createDownloadStateToStringArrayMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDownloadStateToString:", v3);

}

- (VUIDownloadButtonViewModel)initWithVideoManagedObject:(id)a3
{
  id v4;
  VUIDownloadButtonViewModel *v5;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  VUIDownloadButtonViewModel *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadButtonViewModel;
  v5 = -[VUIDownloadButtonViewModel init](&v12, sel_init);
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = __57__VUIDownloadButtonViewModel_initWithVideoManagedObject___block_invoke;
    v9 = &unk_1E9F98FD8;
    v10 = v4;
    v11 = v5;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7, 3221225472))
      v8((uint64_t)&v7);
    else
      dispatch_async(MEMORY[0x1E0C80D38], &v7);

  }
  return v5;
}

void __57__VUIDownloadButtonViewModel_initWithVideoManagedObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  VUIUniversalAssetController *v4;

  v4 = -[VUIUniversalAssetController initWithVideoManagedObject:]([VUIUniversalAssetController alloc], "initWithVideoManagedObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setAssetController:", v4);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "_createDownloadStateToStringArrayMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDownloadStateToString:", v3);

}

- (VUIDownloadButtonViewModel)initWithMPMediaItemCollection:(id)a3
{
  id v4;
  VUIDownloadButtonViewModel *v5;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  VUIDownloadButtonViewModel *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadButtonViewModel;
  v5 = -[VUIDownloadButtonViewModel init](&v12, sel_init);
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = __60__VUIDownloadButtonViewModel_initWithMPMediaItemCollection___block_invoke;
    v9 = &unk_1E9F98FD8;
    v10 = v4;
    v11 = v5;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v7, 3221225472))
      v8((uint64_t)&v7);
    else
      dispatch_async(MEMORY[0x1E0C80D38], &v7);

  }
  return v5;
}

void __60__VUIDownloadButtonViewModel_initWithMPMediaItemCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  VUIUniversalCollectionAssetController *v4;

  v4 = -[VUIUniversalCollectionAssetController initWithMediaItemCollection:]([VUIUniversalCollectionAssetController alloc], "initWithMediaItemCollection:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setAssetController:", v4);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "_createDownloadStateToStringArrayMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDownloadStateToString:", v3);

}

+ (id)viewModelWithSeasonsMetadata:(id)a3 downloadType:(unint64_t)a4
{
  id v5;
  VUIDownloadButtonViewModel *v6;

  v5 = a3;
  v6 = -[VUIDownloadButtonViewModel initWithSeasonsMetadata:downloadType:]([VUIDownloadButtonViewModel alloc], "initWithSeasonsMetadata:downloadType:", v5, a4);

  return v6;
}

- (VUIDownloadButtonViewModel)initWithSeasonsMetadata:(id)a3 downloadType:(unint64_t)a4
{
  id v6;
  VUIDownloadButtonViewModel *v7;
  VUIDownloadButtonViewModel *v8;
  _QWORD block[2];
  void (*v11)(uint64_t);
  void *v12;
  VUIDownloadButtonViewModel *v13;
  id v14;
  unint64_t v15;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VUIDownloadButtonViewModel;
  v7 = -[VUIDownloadButtonViewModel init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v11 = __67__VUIDownloadButtonViewModel_initWithSeasonsMetadata_downloadType___block_invoke;
    v12 = &unk_1E9FA22E0;
    v13 = v7;
    v14 = v6;
    v15 = a4;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v11((uint64_t)block);
    else
      dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v8;
}

void __67__VUIDownloadButtonViewModel_initWithSeasonsMetadata_downloadType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setSeasonsMetadata:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDownloadType:", *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_createDownloadStateToStringArrayMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDownloadStateToString:", v3);

  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_initDownloadButtonStateForTVShowOrSeason");
  }
  else if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_initDownloadButtonStateForTVShowOrSeason");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__downloadQueueManagerDidAddDownloadForTVShow_, CFSTR("VUIMediaDownloadQueueManagerDidAddDownload"), 0);

  }
}

- (void)_initDownloadButtonStateForTVShowOrSeason
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t downloadType;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  VUIUniversalAssetController *v26;
  VUIUniversalCollectionAssetController *v27;
  void *v28;
  VUIUniversalCollectionAssetController *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[VUIDownloadButtonViewModel seasonsMetadata](self, "seasonsMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "episodeCount");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[VUIDownloadButtonViewModel seasonsMetadata](self, "seasonsMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mediaDownloadQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sidebandMediaLibrary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    downloadType = self->_downloadType;
    v31 = v13;
    if (downloadType == 2)
    {
      objc_msgSend(v10, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v13, "assetControllersForSeasonCanonicalId:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "episodesWithDownloadState:seasonCanonicalId:usingMainThreadContext:", 2, v17, 1);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {
      if (downloadType != 1)
      {
        v30 = 0;
        v20 = 0;
LABEL_23:
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v33 != v24)
                objc_enumerationMutation(v21);
              v26 = -[VUIUniversalAssetController initWithVideoManagedObject:]([VUIUniversalAssetController alloc], "initWithVideoManagedObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
              objc_msgSend(v11, "addObject:", v26);

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v23);
        }

        v27 = [VUIUniversalCollectionAssetController alloc];
        v28 = (void *)objc_msgSend(v11, "copy");
        v29 = -[VUIUniversalCollectionAssetController initWithAssetControllers:completionCount:](v27, "initWithAssetControllers:completionCount:", v28, v6);

        -[VUIDownloadButtonViewModel setAssetController:](self, "setAssetController:", v29);
        goto LABEL_31;
      }
      objc_msgSend(v10, "showCanonicalId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v13, "assetControllersForShowCanonicalId:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "episodesWithDownloadState:showCanonicalId:usingMainThreadContext:", 2, v17, 1);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v20 = (void *)v19;
        goto LABEL_20;
      }
    }
    v20 = 0;
    v18 = 0;
LABEL_20:

    if (v18)
    {
      v30 = (void *)v18;
      objc_msgSend(v11, "addObjectsFromArray:", v18);
    }
    else
    {
      v30 = 0;
    }
    goto LABEL_23;
  }
LABEL_31:

}

- (void)_downloadQueueManagerDidAddDownloadForTVShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[VUIDownloadButtonViewModel seasonsMetadata](self, "seasonsMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "showCanonicalId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "showCanonicalId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && v7 && objc_msgSend(v8, "isEqualToString:", v6))
  {
    -[VUIDownloadButtonViewModel assetController](self, "assetController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "addAssetController:", v7);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VUIDownloadButtonViewModel setAssetController:](self, "setAssetController:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadButtonViewModel;
  -[VUIDownloadButtonViewModel dealloc](&v4, sel_dealloc);
}

- (void)setAssetController:(id)a3
{
  VUIMediaEntityAssetController *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIMediaEntityAssetController *v9;

  v5 = (VUIMediaEntityAssetController *)a3;
  if (self->_assetController != v5)
  {
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), 0);

    objc_storeStrong((id *)&self->_assetController, a3);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__assetControllerStateDidChange_, CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), v9);

      -[VUIMediaEntityAssetController state](v9, "state");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButtonViewModel _updateDownloadStateFromAssetControllerState:](self, "_updateDownloadStateFromAssetControllerState:", v8);

    }
    else
    {
      -[VUIDownloadButtonViewModel setDownloadState:](self, "setDownloadState:", 0);
    }
    v5 = v9;
  }

}

- (NSString)brandName
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VUIDownloadButtonViewModel assetController](self, "assetController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brandName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)brandID
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VUIDownloadButtonViewModel assetController](self, "assetController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "brandID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)allowsManualDownloadRenewal
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsManualDownloadRenewal");

  return v6;
}

- (void)startDownloadAllowingCellular:(BOOL)a3 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a4 quality:(int64_t)a5 prefer3DOrImmersiveDownload:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  _BOOL8 v9;
  unint64_t v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[2];
  uint64_t (*v18)(uint64_t);
  void *v19;
  VUIDownloadButtonViewModel *v20;
  uint8_t buf[4];
  NSObject *v22;
  uint64_t v23;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = -[VUIDownloadButtonViewModel downloadState](self, "downloadState");
  if (v11 == 2)
  {
    VUIDefaultLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_INFO, "The item is either already downloaded or being downloaded.", buf, 2u);
    }
  }
  else
  {
    v13 = v11;
    -[VUIDownloadButtonViewModel assetController](self, "assetController");
    v14 = objc_claimAutoreleasedReturnValue();
    v12 = v14;
    if (v13 == 4 && !-[NSObject supportsRedownloadingContent](v14, "supportsRedownloadingContent"))
    {
      VUIDefaultLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_INFO, "The item is already downloaded and does not support redownloading.", buf, 2u);
      }

    }
    else
    {
      -[NSObject startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:](v12, "startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:", v9, a5, v8, v6, 0);
      VUIDefaultLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_INFO, "Asset controller %@ starting download.", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      v18 = __139__VUIDownloadButtonViewModel_startDownloadAllowingCellular_shouldMarkAsDeletedOnCancellationOrFailure_quality_prefer3DOrImmersiveDownload___block_invoke;
      v19 = &unk_1E9F98DF0;
      v20 = self;
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
        v18((uint64_t)block);
      else
        dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __139__VUIDownloadButtonViewModel_startDownloadAllowingCellular_shouldMarkAsDeletedOnCancellationOrFailure_quality_prefer3DOrImmersiveDownload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("VUIDownloadModelNotificationUserInfo");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIDownloadDidStartNotification"), 0, v4);

  return +[VideosUI pushDownloadDidStartSignal](_TtC8VideosUI8VideosUI, "pushDownloadDidStartSignal");
}

- (void)fetchNewKeysForDownloadedVideo
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (-[VUIDownloadButtonViewModel downloadState](self, "downloadState") == 4)
  {
    -[VUIDownloadButtonViewModel assetController](self, "assetController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchNewKeysForDownloadedVideo");

  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Unable to fetch new keys because video is not in state Downloaded.", buf, 2u);
    }

  }
}

- (void)pauseDownload
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ pausing download.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "pauseDownload");
}

- (void)resumeDownload
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ resuming download.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "resumeDownload");
}

- (void)stopDownload
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ canceling download.", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v2, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "performsKeyFetchOnly");

  if (v5)
    objc_msgSend(v2, "cancelKeyFetch");
  else
    objc_msgSend(v2, "cancelAndRemoveDownload");

}

- (void)deleteDownload
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  -[VUIDownloadButtonViewModel assetController](self, "assetController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Asset controller %@ deleting download.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "cancelAndRemoveDownload");
}

- (void)preflightPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14 && v6)
  {
    -[VUIDownloadButtonViewModel assetController](self, "assetController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIDownloadButtonViewModel videosPlayable](self, "videosPlayable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButtonViewModel videosPlayable](self, "videosPlayable");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preflightDownloadForVideosPlayable:presentingViewController:contentAllowsCellularDownload:completion:", v10, v14, objc_msgSend(v7, "contentAllowsCellularDownload"), v6);
    }
    else
    {
      -[VUIDownloadButtonViewModel assetController](self, "assetController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[VUIDownloadButtonViewModel assetController](self, "assetController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentRating");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }
      +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preflightDownloadForContentRating:presentingViewController:contentAllowsCellularDownload:completion:", v9, v14, objc_msgSend(v7, "contentAllowsCellularDownload"), v6);
    }

  }
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  char v5;

  -[VUIDownloadButtonViewModel downloadExpirationDate](self, "downloadExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIDownloadButtonViewModel downloadExpirationDate](self, "downloadExpirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "vui_isInThePast");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isExpiringSoon
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[VUIDownloadButtonViewModel downloadExpirationDate](self, "downloadExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "shouldShowLabelForDownloadExpirationDate:", v3);

  return (char)v2;
}

+ (BOOL)shouldShowExpiredImageWithDownloadState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  switch(a3)
  {
    case 0uLL:
      return a4 || a6;
    case 4uLL:
      return a4 || a5;
    case 3uLL:
      return a4 || a6;
  }
  return 0;
}

- (void)_assetControllerStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("VUIMediaEntityAssetControllerStateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    VUIMediaEntityAssetControllerStatusLogString(objc_msgSend(v7, "status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "Asset controller %@ state changed to: %@", (uint8_t *)&v10, 0x16u);

  }
  -[VUIDownloadButtonViewModel _updateDownloadStateFromAssetControllerState:](self, "_updateDownloadStateFromAssetControllerState:", v7);

}

- (void)_updateDownloadStateFromAssetControllerState:(id)a3
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id v22;

  v22 = a3;
  v4 = -[VUIDownloadButtonViewModel _downloadStateFromAssetsControllerStatus:](self, "_downloadStateFromAssetsControllerStatus:", objc_msgSend(v22, "status"));
  objc_msgSend(v22, "downloadProgress");
  if (v4 == 2)
  {
    v6 = v5;
    -[VUIDownloadButtonViewModel downloadProgress](self, "downloadProgress");
    v8 = v7;
    -[VUIDownloadButtonViewModel setDownloadProgress:](self, "setDownloadProgress:", v6);
    if (v8 != v6)
    {
      objc_msgSend(v22, "downloadExpirationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButtonViewModel setDownloadExpirationDate:](self, "setDownloadExpirationDate:", v9);

LABEL_5:
      -[VUIDownloadButtonViewModel setRenewsOfflineKeysAutomatically:](self, "setRenewsOfflineKeysAutomatically:", objc_msgSend(v22, "renewsOfflineKeysAutomatically"));
LABEL_6:
      objc_msgSend(v22, "availabilityEndDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIDownloadButtonViewModel setAvailabilityEndDate:](self, "setAvailabilityEndDate:", v13);

LABEL_7:
      v14 = 1;
      goto LABEL_8;
    }
  }
  -[VUIDownloadButtonViewModel downloadExpirationDate](self, "downloadExpirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "downloadExpirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "downloadExpirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButtonViewModel setDownloadExpirationDate:](self, "setDownloadExpirationDate:", v12);

  if (v10 != v11)
    goto LABEL_5;
  v16 = -[VUIDownloadButtonViewModel renewsOfflineKeysAutomatically](self, "renewsOfflineKeysAutomatically");
  v17 = objc_msgSend(v22, "renewsOfflineKeysAutomatically");
  -[VUIDownloadButtonViewModel setRenewsOfflineKeysAutomatically:](self, "setRenewsOfflineKeysAutomatically:", objc_msgSend(v22, "renewsOfflineKeysAutomatically"));
  if (v16 != v17)
    goto LABEL_6;
  -[VUIDownloadButtonViewModel availabilityEndDate](self, "availabilityEndDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "availabilityEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "availabilityEndDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDownloadButtonViewModel setAvailabilityEndDate:](self, "setAvailabilityEndDate:", v20);

  if (v18 != v19)
    goto LABEL_7;
  v21 = -[VUIDownloadButtonViewModel downloadFailedDueToError](self, "downloadFailedDueToError");
  v14 = v21 ^ objc_msgSend(v22, "downloadFailedDueToError");
LABEL_8:
  -[VUIDownloadButtonViewModel setDownloadFailedDueToError:](self, "setDownloadFailedDueToError:", objc_msgSend(v22, "downloadFailedDueToError"));
  if (-[VUIDownloadButtonViewModel downloadState](self, "downloadState") == v4)
  {
    if (v14)
    {
      -[VUIDownloadButtonViewModel setDownloadState:](self, "setDownloadState:", v4);
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "postNotificationName:object:", CFSTR("VUIDownloadViewModelDownloadStateDidChangeNotification"), self);

      }
    }
  }
  else
  {
    -[VUIDownloadButtonViewModel setDownloadState:](self, "setDownloadState:", v4);
  }

}

- (unint64_t)_downloadStateFromAssetsControllerStatus:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 0;
  else
    return a3;
}

- (id)_createDownloadStateToStringArrayMap
{
  return &unk_1EA0BBB20;
}

- (NSString)downloadStateStringValue
{
  __CFString *v3;

  if (-[NSArray count](self->_downloadStateToString, "count") <= self->_downloadState)
  {
    v3 = CFSTR("Unknown");
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_downloadStateToString, "objectAtIndexedSubscript:");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (NSArray)seasonsMetadata
{
  return self->_seasonsMetadata;
}

- (void)setSeasonsMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_seasonsMetadata, a3);
}

- (unint64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(unint64_t)a3
{
  self->_downloadType = a3;
}

- (VUIVideosPlayable)videosPlayable
{
  return self->_videosPlayable;
}

- (void)setVideosPlayable:(id)a3
{
  objc_storeStrong((id *)&self->_videosPlayable, a3);
}

- (VUIMediaEntity)mediaEntity
{
  return self->_mediaEntity;
}

- (void)setMediaEntity:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEntity, a3);
}

- (unint64_t)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(unint64_t)a3
{
  self->_downloadState = a3;
}

- (void)setDownloadStateStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStateStringValue, a3);
}

- (BOOL)renewsOfflineKeysAutomatically
{
  return self->_renewsOfflineKeysAutomatically;
}

- (void)setRenewsOfflineKeysAutomatically:(BOOL)a3
{
  self->_renewsOfflineKeysAutomatically = a3;
}

- (NSDate)downloadExpirationDate
{
  return self->_downloadExpirationDate;
}

- (void)setDownloadExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadExpirationDate, a3);
}

- (NSDate)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (void)setAvailabilityEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityEndDate, a3);
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)downloadFailedDueToError
{
  return self->_downloadFailedDueToError;
}

- (void)setDownloadFailedDueToError:(BOOL)a3
{
  self->_downloadFailedDueToError = a3;
}

- (VUIMediaEntityAssetController)assetController
{
  return self->_assetController;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, a3);
}

- (NSArray)downloadStateToString
{
  return self->_downloadStateToString;
}

- (void)setDownloadStateToString:(id)a3
{
  objc_storeStrong((id *)&self->_downloadStateToString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStateToString, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_downloadExpirationDate, 0);
  objc_storeStrong((id *)&self->_downloadStateStringValue, 0);
  objc_storeStrong((id *)&self->_mediaEntity, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
  objc_storeStrong((id *)&self->_seasonsMetadata, 0);
}

@end
