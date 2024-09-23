@implementation VUIUniversalCollectionAssetController

- (VUIUniversalCollectionAssetController)initWithMediaItemCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VUIUniversalAssetController *v11;
  void *v12;
  uint64_t v13;
  VUIUniversalCollectionAssetController *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = -[VUIUniversalAssetController initWithMPMediaItem:]([VUIUniversalAssetController alloc], "initWithMPMediaItem:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = -[VUIUniversalCollectionAssetController initWithAssetControllers:completionCount:](self, "initWithAssetControllers:completionCount:", v5, v13);
  return v14;
}

- (VUIUniversalCollectionAssetController)initWithPlayables:(id)a3 completionCount:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VUIUniversalAssetController *v14;
  VUIUniversalAssetController *v15;
  VUIUniversalCollectionAssetController *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        v14 = [VUIUniversalAssetController alloc];
        v15 = -[VUIUniversalAssetController initWithVideosPlayable:](v14, "initWithVideosPlayable:", v13, (_QWORD)v18);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = -[VUIUniversalCollectionAssetController initWithAssetControllers:completionCount:](self, "initWithAssetControllers:completionCount:", v7, a4);
  return v16;
}

- (VUIUniversalCollectionAssetController)initWithAssetControllers:(id)a3 completionCount:(unint64_t)a4
{
  id v7;
  VUIUniversalCollectionAssetController *v8;
  VUIUniversalCollectionAssetController *v9;
  VUIMediaEntityAssetControllerState *v10;
  VUIMediaEntityAssetControllerState *stateInternal;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VUIUniversalCollectionAssetController;
  v8 = -[VUIUniversalCollectionAssetController init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    v21 = a4;
    objc_storeStrong((id *)&v8->_completionDispatchQueueInternal, MEMORY[0x1E0C80D38]);
    v10 = objc_alloc_init(VUIMediaEntityAssetControllerState);
    stateInternal = v9->_stateInternal;
    v9->_stateInternal = v10;

    -[VUIMediaEntityAssetControllerState setStatus:](v9->_stateInternal, "setStatus:", 0);
    -[VUIMediaEntityAssetControllerState setDownloadProgress:](v9->_stateInternal, "setDownloadProgress:", -1.0);
    -[VUIMediaEntityAssetControllerState setSupportsCancellation:](v9->_stateInternal, "setSupportsCancellation:", 1);
    -[VUIMediaEntityAssetControllerState setSupportsPausing:](v9->_stateInternal, "setSupportsPausing:", 1);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__assetControllerDidChange_, CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), v17);

          objc_msgSend(v17, "setCompletionDispatchQueue:", v9->_completionDispatchQueueInternal);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&v9->_assetControllers, a3);
    v9->_completionCount = v21;
    -[VUIUniversalCollectionAssetController _updateDownloadStateAndNotifyListeners](v9, "_updateDownloadStateAndNotifyListeners");
    v7 = v20;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIUniversalCollectionAssetController;
  -[VUIUniversalCollectionAssetController dealloc](&v4, sel_dealloc);
}

- (BOOL)supportsStartingDownload
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "supportsStartingDownload") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsRedownloadingContent
{
  return 0;
}

- (BOOL)contentAllowsCellularDownload
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "contentAllowsCellularDownload"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)setCompletionDispatchQueue:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    v5 = MEMORY[0x1E0C80D38];
    v4 = (id)MEMORY[0x1E0C80D38];
  }
  v6 = v4;
  -[VUIUniversalCollectionAssetController setCompletionDispatchQueueInternal:](self, "setCompletionDispatchQueueInternal:", v4);

}

- (void)startDownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 prefer3DOrImmersiveDownload:(BOOL)a6 completion:(id)a7
{
  id v12;
  dispatch_group_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  NSObject *v24;
  _QWORD *v25;
  _QWORD *v26;
  int64_t v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[3];
  char v34;

  v12 = a7;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 1;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__33;
  v31[4] = __Block_byref_object_dispose__33;
  v32 = 0;
  v13 = dispatch_group_create();
  +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke;
  v23[3] = &unk_1E9FA49B8;
  v23[4] = self;
  v16 = v13;
  v28 = a3;
  v29 = a5;
  v30 = a6;
  v24 = v16;
  v25 = v33;
  v26 = v31;
  v27 = a4;
  objc_msgSend(v14, "performBatchAddDownloadsWithBlock:", v23);

  -[VUIUniversalCollectionAssetController completionDispatchQueue](self, "completionDispatchQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_3;
  v19[3] = &unk_1E9FA49E0;
  v20 = v12;
  v21 = v33;
  v22 = v31;
  v18 = v12;
  dispatch_group_notify(v16, v17, v19);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

void __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v15;
  _QWORD v16[4];
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "assetControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "state", v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "status");

        if (!v9)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          v10 = *(unsigned __int8 *)(a1 + 72);
          v11 = *(unsigned __int8 *)(a1 + 73);
          v12 = *(unsigned __int8 *)(a1 + 74);
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_2;
          v16[3] = &unk_1E9FA4990;
          v13 = *(_QWORD *)(a1 + 64);
          v15 = *(_OWORD *)(a1 + 40);
          v18 = *(_QWORD *)(a1 + 56);
          v14 = (id)v15;
          v17 = v15;
          objc_msgSend(v7, "startDownloadAllowingCellular:quality:shouldMarkAsDeletedOnCancellationOrFailure:prefer3DOrImmersiveDownload:completion:", v10, v13, v11, v12, v16);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

}

void __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24) && (a2 & 1) == 0)
  {
    *(_BYTE *)(v6 + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __161__VUIUniversalCollectionAssetController_startDownloadAllowingCellular_quality_shouldMarkAsDeletedOnCancellationOrFailure_prefer3DOrImmersiveDownload_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (void)deleteAndRedownloadAllowingCellular:(BOOL)a3 quality:(int64_t)a4 shouldMarkAsDeletedOnCancellationOrFailure:(BOOL)a5 completion:(id)a6
{
  if (a6)
    (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
}

- (void)pauseDownload
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "pauseDownload");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)resumeDownload
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resumeDownload");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)cancelAndRemoveDownload
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "state");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "status");

        if ((unint64_t)(v11 - 1) <= 2)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    v12 = v3;
  }
  else
  {
    -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "cancelAndRemoveDownload", (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)addAssetController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSArray mutableCopy](self->_assetControllers, "mutableCopy");
  objc_msgSend(v5, "addObject:", v4);
  v6 = (void *)objc_msgSend(v5, "copy");
  -[VUIUniversalCollectionAssetController setAssetControllers:](self, "setAssetControllers:", v6);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__assetControllerDidChange_, CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), v4);

  objc_msgSend(v4, "setCompletionDispatchQueue:", self->_completionDispatchQueueInternal);
  VUIDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIUniversalCollectionAssetController:: add assetController %@ to collectionAssetController", (uint8_t *)&v9, 0xCu);
  }

}

- (VUIContentRating)contentRating
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "contentRating");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "rank");
        if (v9 > objc_msgSend(v5, "rank"))
        {
          v10 = v8;

          v5 = v10;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (VUIContentRating *)v5;
}

- (int64_t)downloadedCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "status");

        if (v9 == 4)
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateDownloadStateAndNotifyListeners
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  VUIMediaEntityAssetControllerState *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t j;
  void *v24;
  double v25;
  uint64_t v26;
  VUIUniversalCollectionAssetController *v27;
  VUIMediaEntityAssetControllerState *stateInternal;
  void *v29;
  id v30;
  VUIUniversalCollectionAssetController *v31;
  NSObject *queue;
  _QWORD block[4];
  id v34;
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  const __CFString *v45;
  VUIMediaEntityAssetControllerState *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  -[VUIUniversalCollectionAssetController completionDispatchQueueInternal](self, "completionDispatchQueueInternal");
  queue = objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v31 = self;
  -[VUIUniversalCollectionAssetController assetControllers](self, "assetControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "state");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "status");

        v14 = v3;
        if (v13)
        {
          objc_msgSend(v11, "state");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "status");

          if (v16 == 4)
            v14 = v4;
          else
            v14 = v5;
        }
        objc_msgSend(v14, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v8);
  }

  v17 = objc_alloc_init(VUIMediaEntityAssetControllerState);
  -[VUIMediaEntityAssetControllerState setStatus:](v17, "setStatus:", 0);
  if (objc_msgSend(v5, "count"))
  {
    -[VUIMediaEntityAssetControllerState setStatus:](v17, "setStatus:", 2);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = v5;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v38;
      v22 = 0.0;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "state");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "downloadProgress");
          v22 = v22 + v25;

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v20);
    }
    else
    {
      v22 = 0.0;
    }

    v27 = v31;
    -[VUIMediaEntityAssetControllerState setDownloadProgress:](v17, "setDownloadProgress:", (v22 + (double)(unint64_t)objc_msgSend(v4, "count"))/ (double)-[NSArray count](v31->_assetControllers, "count"));
  }
  else
  {
    v26 = objc_msgSend(v4, "count");
    v27 = v31;
    if (v26 == -[VUIUniversalCollectionAssetController completionCount](v31, "completionCount"))
    {
      -[VUIMediaEntityAssetControllerState setStatus:](v17, "setStatus:", 4);
      -[VUIMediaEntityAssetControllerState setSupportsCancellation:](v17, "setSupportsCancellation:", 1);
      stateInternal = v17;
    }
    else
    {
      -[VUIMediaEntityAssetControllerState setStatus:](v17, "setStatus:", 0);
      -[VUIMediaEntityAssetControllerState setDownloadProgress:](v31->_stateInternal, "setDownloadProgress:", -1.0);
      -[VUIMediaEntityAssetControllerState setSupportsCancellation:](v31->_stateInternal, "setSupportsCancellation:", 1);
      stateInternal = v31->_stateInternal;
    }
    -[VUIMediaEntityAssetControllerState setSupportsPausing:](stateInternal, "setSupportsPausing:", 1);
  }
  -[VUIUniversalCollectionAssetController setStateInternal:](v27, "setStateInternal:", v17);
  if (v17)
  {
    v45 = CFSTR("VUIMediaEntityAssetControllerStateKey");
    v46 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  objc_initWeak(&location, v27);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__VUIUniversalCollectionAssetController__updateDownloadStateAndNotifyListeners__block_invoke;
  block[3] = &unk_1E9F9A938;
  objc_copyWeak(&v35, &location);
  v34 = v29;
  v30 = v29;
  dispatch_async(queue, block);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __79__VUIUniversalCollectionAssetController__updateDownloadStateAndNotifyListeners__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("VUIMediaEntityAssetControllerStateDidChangeNotification"), WeakRetained, *(_QWORD *)(a1 + 32));

  }
}

- (NSArray)assetControllers
{
  return self->_assetControllers;
}

- (void)setAssetControllers:(id)a3
{
  objc_storeStrong((id *)&self->_assetControllers, a3);
}

- (OS_dispatch_queue)completionDispatchQueueInternal
{
  return self->_completionDispatchQueueInternal;
}

- (void)setCompletionDispatchQueueInternal:(id)a3
{
  objc_storeStrong((id *)&self->_completionDispatchQueueInternal, a3);
}

- (VUIMediaEntityAssetControllerState)stateInternal
{
  return self->_stateInternal;
}

- (void)setStateInternal:(id)a3
{
  objc_storeStrong((id *)&self->_stateInternal, a3);
}

- (unint64_t)completionCount
{
  return self->_completionCount;
}

- (void)setCompletionCount:(unint64_t)a3
{
  self->_completionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateInternal, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueueInternal, 0);
  objc_storeStrong((id *)&self->_assetControllers, 0);
}

@end
