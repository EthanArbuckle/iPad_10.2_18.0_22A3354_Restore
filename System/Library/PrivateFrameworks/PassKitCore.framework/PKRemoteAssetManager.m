@implementation PKRemoteAssetManager

- (PKRemoteAssetManager)init
{

  return 0;
}

- (PKRemoteAssetManager)initWithFileURL:(id)a3
{
  id v4;
  PKDirectoryCoordinator *v5;
  PKRemoteAssetManager *v6;

  v4 = a3;
  v5 = -[PKDirectoryCoordinator initWithURL:]([PKDirectoryCoordinator alloc], "initWithURL:", v4);

  v6 = -[PKRemoteAssetManager initWithDirectoryCoordinator:](self, "initWithDirectoryCoordinator:", v5);
  return v6;
}

- (PKRemoteAssetManager)initWithDirectoryCoordinator:(id)a3
{
  id v5;
  PKRemoteAssetManager *v6;
  NSObject *p_super;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSMutableArray *v10;
  NSMutableArray *completionHandlers;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKRemoteAssetManager;
  v6 = -[PKRemoteAssetManager init](&v18, sel_init);
  if (v6)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__PKRemoteAssetManager_initWithDirectoryCoordinator___block_invoke;
    v13[3] = &unk_1E2AD26A0;
    v13[4] = &v14;
    objc_msgSend(v5, "performCoordinatedAction:", v13);
    if (*((_BYTE *)v15 + 24))
    {
      objc_storeStrong((id *)&v6->_coordinator, a3);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      p_super = objc_claimAutoreleasedReturnValue();
      v8 = dispatch_queue_create("com.apple.passKitCore.remoteAssetManager", p_super);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v8;

      v6->_lock._os_unfair_lock_opaque = 0;
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      completionHandlers = v6->_completionHandlers;
      v6->_completionHandlers = v10;

    }
    else
    {
      p_super = &v6->super;
      v6 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v6;
}

void __53__PKRemoteAssetManager_initWithDirectoryCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  if (a2)
  {
    v4 = 0;
    objc_msgSend(a2, "getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C999D0], 0);
    v3 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  }
}

- (id)remoteAssetManifests
{
  id v3;
  PKDirectoryCoordinator *coordinator;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  coordinator = self->_coordinator;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__PKRemoteAssetManager_remoteAssetManifests__block_invoke;
  v9[3] = &unk_1E2AD26C8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __44__PKRemoteAssetManager_remoteAssetManifests__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  PKRemoteAssetManifest *v22;
  uint64_t v23;
  id v24;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v23 = a1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C999D0];
    v33[0] = *MEMORY[0x1E0C99998];
    v33[1] = v5;
    v6 = *MEMORY[0x1E0C99A28];
    v33[2] = *MEMORY[0x1E0C99A28];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v3;
    objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0;
          v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v27, v6, 0);
          v15 = v27;
          v16 = v15;
          if (v14 && (objc_msgSend(v15, "BOOLValue") & 1) != 0)
          {
            v17 = 0;
          }
          else
          {
            v26 = 0;
            v18 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v26, v5, 0);
            v19 = v26;
            v17 = v19;
            if (!v18 || (objc_msgSend(v19, "BOOLValue") & 1) == 0)
            {
              objc_msgSend(v13, "pathExtension");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("urls"));

              if (v21)
              {
                v22 = -[PKRemoteAssetManifest initWithFileURL:passURL:deviceSEIDs:error:]([PKRemoteAssetManifest alloc], "initWithFileURL:passURL:deviceSEIDs:error:", v13, v24, *(_QWORD *)(*(_QWORD *)(v23 + 32) + 56), 0);
                if (v22)
                  objc_msgSend(*(id *)(v23 + 40), "addObject:", v22);

              }
            }
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    v3 = v24;
  }

}

- (id)deviceSpecificItems
{
  return -[PKRemoteAssetManager deviceSpecificItemsForScreenScale:suffix:](self, "deviceSpecificItemsForScreenScale:suffix:", 0, PKScreenScale());
}

- (id)deviceSpecificItemsForScreenScale:(double)a3 suffix:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *seids;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PKRemoteAssetManager remoteAssetManifests](self, "remoteAssetManifests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v13), "deviceSpecificAssetForScreenScale:suffix:", v6, a3, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "seid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16 || (seids = self->_seids) == 0 || -[NSArray containsObject:](seids, "containsObject:", v16))
            objc_msgSend(v8, "addObject:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)pendingRemoteAssetsItems
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKRemoteAssetManager pendingRemoteAssetsItemsForScreenScale:suffix:](self, "pendingRemoteAssetsItemsForScreenScale:suffix:", 0, PKScreenScale());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)pendingRemoteAssetsItemsForScreenScale:(double)a3 suffix:(id)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[PKRemoteAssetManager deviceSpecificItemsForScreenScale:suffix:](self, "deviceSpecificItemsForScreenScale:suffix:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKRemoteAssetManager_pendingRemoteAssetsItemsForScreenScale_suffix___block_invoke;
  v8[3] = &unk_1E2AD26F0;
  v8[4] = self;
  objc_msgSend(v5, "pk_objectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __70__PKRemoteAssetManager_pendingRemoteAssetsItemsForScreenScale_suffix___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetExistsLocally:", a2) ^ 1;
}

- (id)itemWithRelativePath:(id)a3
{
  id v4;
  NSMutableDictionary *manifestItemsByRelativeURL;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  manifestItemsByRelativeURL = self->_manifestItemsByRelativeURL;
  if (!manifestItemsByRelativeURL)
  {
    v21 = v4;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_manifestItemsByRelativeURL;
    self->_manifestItemsByRelativeURL = v6;

    -[PKRemoteAssetManager remoteAssetManifests](self, "remoteAssetManifests");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v8)
    {
      v9 = v8;
      v23 = *(_QWORD *)v29;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v10), "remoteAssets");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v25;
            do
            {
              v15 = 0;
              do
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v11, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "relativeLocalPath");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                  -[NSMutableDictionary setObject:forKey:](self->_manifestItemsByRelativeURL, "setObject:forKey:", v16, v17);
                objc_msgSend(v16, "relativeEncryptedContentsLocalPath");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                  -[NSMutableDictionary setObject:forKey:](self->_manifestItemsByRelativeURL, "setObject:forKey:", v16, v18);

                ++v15;
              }
              while (v13 != v15);
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

          ++v10;
        }
        while (v10 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    manifestItemsByRelativeURL = self->_manifestItemsByRelativeURL;
    v4 = v21;
  }
  -[NSMutableDictionary objectForKey:](manifestItemsByRelativeURL, "objectForKey:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)sha1HexFromRelativeManifestWithRelativePath:(id)a3
{
  id v4;
  NSMutableDictionary *sha1HexFromRelativeManifest;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sha1HexFromRelativeManifest = self->_sha1HexFromRelativeManifest;
  if (!sha1HexFromRelativeManifest)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_sha1HexFromRelativeManifest;
    self->_sha1HexFromRelativeManifest = v6;

    -[PKRemoteAssetManager remoteAssetManifests](self, "remoteAssetManifests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "remoteAssets");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = v12;
          v17[1] = 3221225472;
          v17[2] = __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke;
          v17[3] = &unk_1E2AD2740;
          v17[4] = self;
          objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    sha1HexFromRelativeManifest = self->_sha1HexFromRelativeManifest;
  }
  -[NSMutableDictionary objectForKey:](sha1HexFromRelativeManifest, "objectForKey:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v9 = a2;
  objc_msgSend(a3, "manifest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v9, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke_2;
    v10[3] = &unk_1E2AD2718;
    v7 = *(_QWORD *)(a1 + 32);
    v11 = v6;
    v12 = v7;
    v8 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __68__PKRemoteAssetManager_sha1HexFromRelativeManifestWithRelativePath___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v6, v5);

}

- (BOOL)hasEncryptedDeviceSpecificItemWithRelativePath:(id)a3
{
  id v4;
  void *v5;
  PKDirectoryCoordinator *coordinator;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char v20;
  BOOL v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKRemoteAssetManager remoteAssetManifests](self, "remoteAssetManifests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__41;
  v38 = __Block_byref_object_dispose__41;
  v39 = 0;
  coordinator = self->_coordinator;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __71__PKRemoteAssetManager_hasEncryptedDeviceSpecificItemWithRelativePath___block_invoke;
  v33[3] = &unk_1E2AD26A0;
  v33[4] = &v34;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v33);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v8)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      v23 = v8;
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = (void *)v35[5];
        objc_msgSend(v10, "fileURL", v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLByDeletingLastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKRelativePathAfterResolvingSymlinks(v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v10, "encryptedDeviceSpecificRemoteAssetFilenames");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v26 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(v14, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v4, "isEqualToString:", v19);

              if ((v20 & 1) != 0)
              {

                v21 = 1;
                goto LABEL_19;
              }
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
            if (v16)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      v21 = 0;
    }
    while (v8);
  }
  else
  {
    v21 = 0;
  }
LABEL_19:

  _Block_object_dispose(&v34, 8);
  return v21;
}

void __71__PKRemoteAssetManager_hasEncryptedDeviceSpecificItemWithRelativePath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)assetExistsLocally:(id)a3
{
  id v4;
  PKDirectoryCoordinator *coordinator;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  coordinator = self->_coordinator;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PKRemoteAssetManager_assetExistsLocally___block_invoke;
  v8[3] = &unk_1E2AC1A48;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v8);
  LOBYTE(coordinator) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)coordinator;
}

void __43__PKRemoteAssetManager_assetExistsLocally___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v3 = a2;
  if (v3)
  {
    v15 = v3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "fileExistsAtPath:", v6);

    v3 = v15;
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(*(id *)(a1 + 32), "localURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataWithContentsOfURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "SHA1Hash");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hexEncoding");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sha1Hex");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }

      v3 = v15;
    }
  }

}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 ignoreRequiredAssetDownloadFailures:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSMutableArray *completionHandlers;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  double v24;
  BOOL v25;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  os_unfair_lock_lock(&self->_lock);
  v15 = -[NSMutableArray count](self->_completionHandlers, "count");
  if (v14)
  {
    completionHandlers = self->_completionHandlers;
    v17 = _Block_copy(v14);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v17);

  }
  os_unfair_lock_unlock(&self->_lock);
  if (!v15)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __144__PKRemoteAssetManager_downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_ignoreRequiredAssetDownloadFailures_completion___block_invoke;
    v20[3] = &unk_1E2AC9E90;
    v20[4] = self;
    v24 = a3;
    v21 = v12;
    v22 = v13;
    v25 = a6;
    v23 = v14;
    v18 = _Block_copy(v20);
    if (PKPaymentPassArtDownloadDelayEnabled())
    {
      v19 = dispatch_time(0, 30000000000);
      dispatch_after(v19, (dispatch_queue_t)self->_queue, v18);
    }
    else
    {
      dispatch_async((dispatch_queue_t)self->_queue, v18);
    }

  }
}

uint64_t __144__PKRemoteAssetManager_downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_ignoreRequiredAssetDownloadFailures_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:requireRequiredAssets:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 72) == 0, *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 cloudStoreCoordinatorDelegate:(id)a5 requireRequiredAssets:(BOOL)a6 completion:(id)a7
{
  id v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  PKAsyncUnaryOperationComposer *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  PKRemoteAssetManager *v36;
  _QWORD v37[6];
  _QWORD v38[6];
  id v39;
  id v40;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD aBlock[9];
  BOOL v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[3];
  uint64_t v55;
  _QWORD v56[4];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v35 = a5;
  v32 = v12;
  v33 = a7;
  v36 = self;
  -[PKRemoteAssetManager pendingRemoteAssetsItemsForScreenScale:suffix:](self, "pendingRemoteAssetsItemsForScreenScale:suffix:", v12, a3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;
  if (objc_msgSend(v34, "count"))
  {
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x2020000000;
    v56[3] = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x2020000000;
    v55 = 0;
    v55 = objc_msgSend(v34, "count");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v15 = v34;
    v16 = 0;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v51 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "size");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedIntegerValue");

          v16 += v21;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v17);
    }

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__41;
    v48[4] = __Block_byref_object_dispose__41;
    v49 = 0;
    v22 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke;
    aBlock[3] = &unk_1E2AD2768;
    v47 = a6;
    aBlock[6] = v56;
    aBlock[7] = v48;
    aBlock[8] = v16;
    aBlock[4] = v36;
    aBlock[5] = v54;
    v23 = _Block_copy(aBlock);
    v24 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    v42 = 0u;
    v25 = v15;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * j);
          v38[0] = v22;
          v38[1] = 3221225472;
          v38[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_29;
          v38[3] = &unk_1E2AD27B8;
          v38[4] = v36;
          v38[5] = v29;
          v39 = v35;
          v40 = v23;
          v41 = v48;
          -[PKAsyncUnaryOperationComposer addOperation:](v24, "addOperation:", v38);

        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_3;
    v37[3] = &unk_1E2AD27E0;
    v37[4] = v36;
    v37[5] = v48;
    v31 = -[PKAsyncUnaryOperationComposer evaluateWithInput:completion:](v24, "evaluateWithInput:completion:", v30, v37);

    _Block_object_dispose(v48, 8);
    _Block_object_dispose(v54, 8);
    _Block_object_dispose(v56, 8);
    v13 = v34;
  }
  else
  {
    LODWORD(v14) = 1.0;
    -[PKRemoteAssetManager _callCompletionHandlersWithFinishState:progress:error:](self, "_callCompletionHandlersWithFinishState:progress:error:", 1, 0, v14);
  }

}

void __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9)
  {
    PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v9;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error downloading remote asset - %@", (uint8_t *)&v15, 0xCu);
    }

    if (*(_BYTE *)(a1 + 72))
    {
      if (objc_msgSend(v7, "isRequired"))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v14 = *(_QWORD *)(v12 + 40);
        v13 = (id *)(v12 + 40);
        if (!v14)
        {
          objc_storeStrong(v13, a4);
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v8, "length");
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(float *)&v11 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
                   / (float)*(unint64_t *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlersWithFinishState:progress:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);
  }
LABEL_11:

}

void __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_29(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_2;
  v15[3] = &unk_1E2AD2790;
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 40);
  v17 = v11;
  v18 = v7;
  v15[4] = v12;
  v16 = v6;
  v19 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v14 = v7;
  objc_msgSend(v8, "_downloadRemoteAssetItem:withCloudStoreCoordinatorDelegate:shouldWriteData:completion:", v9, v10, 1, v15);

}

uint64_t __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_2(_QWORD *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(a1[7] + 16))(a1[7], a1[5], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) != 0);
}

uint64_t __131__PKRemoteAssetManager__downloadRemoteAssetsWithScreenScale_suffix_cloudStoreCoordinatorDelegate_requireRequiredAssets_completion___block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandlersWithFinishState:progress:error:", 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)downloadRemoteAssetItem:(id)a3 withCloudStoreCoordinatorDelegate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__PKRemoteAssetManager_downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_completion___block_invoke;
  v10[3] = &unk_1E2ABE4F0;
  v11 = v8;
  v9 = v8;
  -[PKRemoteAssetManager _downloadRemoteAssetItem:withCloudStoreCoordinatorDelegate:shouldWriteData:completion:](self, "_downloadRemoteAssetItem:withCloudStoreCoordinatorDelegate:shouldWriteData:completion:", a3, a4, 1, v10);

}

uint64_t __93__PKRemoteAssetManager_downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  BOOL v4;
  uint64_t v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
      v4 = a3 == 0;
    else
      v4 = 0;
    v5 = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

- (void)_downloadRemoteAssetItem:(id)a3 withCloudStoreCoordinatorDelegate:(id)a4 shouldWriteData:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  PKDirectoryCoordinator *coordinator;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  void (**v30)(id, uint64_t, _QWORD);
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v7 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v27 = a4;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  objc_msgSend(v10, "localURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__41;
  v40 = __Block_byref_object_dispose__41;
  v41 = 0;
  coordinator = self->_coordinator;
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke;
  v32[3] = &unk_1E2AD2858;
  v15 = v12;
  v33 = v15;
  v16 = v10;
  v34 = v16;
  v35 = &v36;
  -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v32);
  if (v37[5])
  {
    PKLogFacilityTypeGetObject(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "remoteURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v18;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Not downloading: %@ since the asset already exists in the pass directory", buf, 0xCu);

    }
    -[PKRemoteAssetManager addRemoteAssetData:shouldWriteData:forManifestItem:error:](self, "addRemoteAssetData:shouldWriteData:forManifestItem:error:", v37[5], 0, v16, 0);
    v11[2](v11, v37[5], 0);
  }
  else
  {
    objc_msgSend(v16, "sha1Hex");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PKCachedFileForSHA1(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      PKLogFacilityTypeGetObject(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "localURL");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        PKPassAssetDownloadCachePath();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "sha1Hex");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v43 = v26;
        v44 = 2112;
        v45 = v23;
        _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Using cached copy of %@ at %@", buf, 0x16u);

      }
      if (v7)
      {
        v31 = 0;
        -[PKRemoteAssetManager addRemoteAssetData:forManifestItem:error:](self, "addRemoteAssetData:forManifestItem:error:", v20, v16, &v31);
        v24 = v31;
      }
      else
      {
        v24 = 0;
      }
      ((void (**)(id, uint64_t, id))v11)[2](v11, (uint64_t)v20, v24);

    }
    else
    {
      v28[0] = v14;
      v28[1] = 3221225472;
      v28[2] = __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke_34;
      v28[3] = &unk_1E2AD2808;
      v28[4] = self;
      v29 = v16;
      v30 = v11;
      objc_msgSend(v29, "downloadAssetWithCloudStoreCoordinatorDelegate:completion:", v27, v28);

    }
  }

  _Block_object_dispose(&v36, 8);
}

void __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = a2;
  if (v3)
  {
    v18 = v3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    v3 = v18;
    if (v6)
    {
      v7 = (void *)MEMORY[0x19400CFE8](v18);
      objc_msgSend(*(id *)(a1 + 40), "sha1Hex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pk_decodeHexadecimal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", *(_QWORD *)(a1 + 32));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "SHA1Hash");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13 || (v14 = (void *)v13, v15 = objc_msgSend(v9, "isEqual:", v13), v14, (v15 & 1) == 0))
        {
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = 0;

        }
      }

      objc_autoreleasePoolPop(v7);
      v3 = v18;
    }
  }

}

void __110__PKRemoteAssetManager__downloadRemoteAssetItem_withCloudStoreCoordinatorDelegate_shouldWriteData_completion___block_invoke_34(_QWORD *a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = a4;
  if (v7)
  {
    if (a3)
    {
      v9 = (void *)a1[4];
      v10 = a1[5];
      v14 = v8;
      objc_msgSend(v9, "addRemoteAssetData:forManifestItem:error:", v7, v10, &v14);
      v11 = v14;

      v8 = v11;
    }
    objc_msgSend(v7, "SHA1Hash");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hexEncoding");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)a1[5], "itemType") != 1 && (PKCachedFileForSHA1Exists(v13) & 1) == 0)
      PKCacheFile(v7, v13);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)_callCompletionHandlersWithFinishState:(BOOL)a3 progress:(float)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  float v16;
  BOOL v17;

  v6 = a3;
  v8 = a5;
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)-[NSMutableArray copy](self->_completionHandlers, "copy");
  if (v6)
    -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKRemoteAssetManager__callCompletionHandlersWithFinishState_progress_error___block_invoke;
  block[3] = &unk_1E2AD2830;
  v17 = v6;
  v16 = a4;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, block);

}

void __78__PKRemoteAssetManager__callCompletionHandlersWithFinishState_progress_error___block_invoke(uint64_t a1)
{
  id v2;
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
  v2 = *(id *)(a1 + 32);
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
        (*(void (**)(float))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))(*(float *)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)addRemoteAssetData:(id)a3 forManifestItem:(id)a4 error:(id *)a5
{
  return -[PKRemoteAssetManager addRemoteAssetData:shouldWriteData:forManifestItem:error:](self, "addRemoteAssetData:shouldWriteData:forManifestItem:error:", a3, 1, a4, a5);
}

- (BOOL)addRemoteAssetData:(id)a3 shouldWriteData:(BOOL)a4 forManifestItem:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  NSObject *v33;
  PKDirectoryCoordinator *coordinator;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PKDirectoryCoordinator *v43;
  id v44;
  BOOL v45;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _BYTE *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  _BYTE *v55;
  uint8_t v56[4];
  void *v57;
  _BYTE buf[24];
  void *v59;
  uint64_t v60;

  v8 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    objc_msgSend(v10, "SHA1Hash");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hexEncoding");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sha1Hex");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", v13);

    if ((v15 & 1) == 0)
    {
      PKLogFacilityTypeGetObject(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "localURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sha1Hex");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2112;
        v59 = v13;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "SHA1 Invalid Hash: For file %@, manifest's listed SHA1 hash %@ doesn't match computed hash, %@. Please file a radar and include this faulty pass", buf, 0x20u);

      }
      if (a6)
      {
        objc_msgSend(v11, "localURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sha1Hex");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        PKSignatureErrorWithReason(CFSTR("For file %@, manifest's listed SHA1 hash %@ doesn't match computed hash, %@"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v19 = 0;
      goto LABEL_27;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v59) = 0;
    if (v8)
    {
      objc_msgSend(v11, "encryptedContentsLocalURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v11, "localURL");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v18;

      PKLogFacilityTypeGetObject(0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v56 = 138412290;
        v57 = v32;
        _os_log_impl(&dword_18FC92000, v33, OS_LOG_TYPE_DEFAULT, "Writing %@", v56, 0xCu);
      }

      coordinator = self->_coordinator;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke;
      v52[3] = &unk_1E2AD2858;
      v55 = buf;
      v53 = v10;
      v35 = v32;
      v54 = v35;
      -[PKDirectoryCoordinator performCoordinatedAction:](coordinator, "performCoordinatedAction:", v52);
      v31 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        goto LABEL_22;
    }
    else
    {
      v31 = 0;
      LOBYTE(v59) = 1;
    }
    if (objc_msgSend(v11, "isZipFile"))
    {
      objc_msgSend(v11, "localURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      PKLogFacilityTypeGetObject(0);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v36, "lastPathComponent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v56 = 138412290;
        v57 = v38;
        _os_log_impl(&dword_18FC92000, v37, OS_LOG_TYPE_DEFAULT, "Unpacking zip file \"%@\".", v56, 0xCu);

      }
      objc_msgSend(v36, "URLByDeletingPathExtension");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastPathComponent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "passURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "URLByAppendingPathComponent:", v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = self->_coordinator;
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke_38;
      v48[3] = &unk_1E2AC19D0;
      v44 = v42;
      v49 = v44;
      v51 = buf;
      v50 = v10;
      -[PKDirectoryCoordinator performCoordinatedAction:](v43, "performCoordinatedAction:", v48);
      if (v31)
      {

      }
      else
      {
        v45 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;

        if (v45)
        {
LABEL_26:
          v19 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
          _Block_object_dispose(buf, 8);
LABEL_27:

          goto LABEL_28;
        }
      }
LABEL_25:
      -[PKRemoteAssetManager _flushBundleCaches](self, "_flushBundleCaches");
      goto LABEL_26;
    }
LABEL_22:
    if (!v31)
      goto LABEL_26;
    goto LABEL_25;
  }
  v19 = 0;
LABEL_28:

  return v19;
}

uint64_t __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result;
  if (a2)
  {
    result = objc_msgSend(*(id *)(result + 32), "writeToURL:atomically:", *(_QWORD *)(result + 40), 1);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 0;
  }
  return result;
}

void __81__PKRemoteAssetManager_addRemoteAssetData_shouldWriteData_forManifestItem_error___block_invoke_38(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 0;
      v7 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v12);
      v8 = v12;
      v9 = v8;
      if ((v7 & 1) == 0 && v8)
      {
        PKLogFacilityTypeGetObject(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v14 = v11;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Could not create directory at %@", buf, 0xCu);
        }

      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = PKUnarchiverZip(*(NSData **)(a1 + 40), *(NSURL **)(a1 + 32));

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)_flushBundleCaches
{
  -[PKDirectoryCoordinator performCoordinatedAction:](self->_coordinator, "performCoordinatedAction:", &__block_literal_global_130);
}

void __42__PKRemoteAssetManager__flushBundleCaches__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  id v5;

  if (a2)
  {
    v2 = (objc_class *)MEMORY[0x1E0CB34D0];
    v3 = a2;
    v5 = (id)objc_msgSend([v2 alloc], "initWithURL:", v3);

    v4 = v5;
    if (v5)
    {
      objc_msgSend(v5, "_cfBundle");
      _CFBundleFlushBundleCaches();
      v4 = v5;
    }

  }
}

- (NSArray)seids
{
  return self->_seids;
}

- (void)setSeids:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seids, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_sha1HexFromRelativeManifest, 0);
  objc_storeStrong((id *)&self->_manifestItemsByRelativeURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

- (void)downloadRemoteAssetsWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[PKRemoteAssetManager downloadRemoteAssetsWithScreenScale:suffix:completion:](self, "downloadRemoteAssetsWithScreenScale:suffix:completion:", 0, v4, PKScreenScale());

}

- (void)downloadRemoteAssetsWithScreenScale:(double)a3 suffix:(id)a4 completion:(id)a5
{
  -[PKRemoteAssetManager downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:ignoreRequiredAssetDownloadFailures:completion:](self, "downloadRemoteAssetsWithScreenScale:suffix:cloudStoreCoordinatorDelegate:ignoreRequiredAssetDownloadFailures:completion:", a4, 0, 0, a5, a3);
}

@end
