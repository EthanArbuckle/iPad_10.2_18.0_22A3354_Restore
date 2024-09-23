@implementation PUJoiningMediaProvider

- (PUJoiningMediaProvider)init
{
  PUJoiningMediaProvider *v2;
  uint64_t v3;
  NSMapTable *mediaProviderByClass;
  NSMutableArray *mediaProviderPredicateRecords;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUJoiningMediaProvider;
  v2 = -[PUJoiningMediaProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    mediaProviderByClass = v2->__mediaProviderByClass;
    v2->__mediaProviderByClass = (NSMapTable *)v3;

    mediaProviderPredicateRecords = v2->__mediaProviderPredicateRecords;
    v2->__mediaProviderPredicateRecords = 0;

  }
  return v2;
}

- (void)registerMediaProvider:(id)a3 forAssetClass:(Class)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUJoiningMediaProvider.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUJoiningMediaProvider.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetClass != nil"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  -[PUJoiningMediaProvider _mediaProviderByClass](self, "_mediaProviderByClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v10, a4);

}

- (void)registerMediaProvider:(id)a3 forAssetPassingTest:(id)a4
{
  id v7;
  PUJoiningMediaProviderPredicateRecord *v8;
  NSMutableArray *v9;
  NSMutableArray *mediaProviderPredicateRecords;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (v14)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUJoiningMediaProvider.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUJoiningMediaProvider.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate != nil"));

LABEL_3:
  v8 = -[PUJoiningMediaProviderPredicateRecord initWithMediaProvider:predicate:]([PUJoiningMediaProviderPredicateRecord alloc], "initWithMediaProvider:predicate:", v14, v7);
  if (!self->__mediaProviderPredicateRecords)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mediaProviderPredicateRecords = self->__mediaProviderPredicateRecords;
    self->__mediaProviderPredicateRecords = v9;

  }
  -[PUJoiningMediaProvider _mediaProviderPredicateRecords](self, "_mediaProviderPredicateRecords");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);

}

- (id)_mediaProviderForAsset:(id)a3 requestType:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t (**v13)(_QWORD, _QWORD, _QWORD);
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[PUJoiningMediaProvider _mediaProviderPredicateRecords](self, "_mediaProviderPredicateRecords");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        objc_msgSend(v12, "predicate");
        v13 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v14 = ((uint64_t (**)(_QWORD, id, int64_t))v13)[2](v13, v6, a4);

        if ((v14 & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v12, "mediaProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_26;
    }
    else
    {
LABEL_10:

    }
    -[PUJoiningMediaProvider _mediaProviderByClass](self, "_mediaProviderByClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[PUJoiningMediaProvider _mediaProviderByClass](self, "_mediaProviderByClass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      objc_msgSend(v17, "keyEnumerator", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", v23) & 1) != 0)
            {
              objc_msgSend(v17, "objectForKey:", v23);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
                objc_msgSend(v17, "setObject:forKey:", v15, objc_opt_class());
              goto LABEL_25;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v20)
            continue;
          break;
        }
      }

      v15 = 0;
LABEL_25:

    }
LABEL_26:
    -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[PUMediaProvider loadingStatusManager](self, "loadingStatusManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLoadingStatusManager:", v25);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PUJoiningMediaProvider _mediaProviderForAsset:requestType:](self, "_mediaProviderForAsset:requestType:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUJoiningMediaProvider _mediaProviderForAsset:requestType:](self, "_mediaProviderForAsset:requestType:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestImageDataForAsset:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUJoiningMediaProvider _mediaProviderForAsset:requestType:](self, "_mediaProviderForAsset:requestType:", v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestImageURLForAsset:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUJoiningMediaProvider _mediaProviderForAsset:requestType:](self, "_mediaProviderForAsset:requestType:", v10, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestPlayerItemForVideo:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[PUJoiningMediaProvider _mediaProviderForAsset:requestType:](self, "_mediaProviderForAsset:requestType:", v15, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v14, v13, width, height);

  return a5;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PUJoiningMediaProvider _mediaProviderForAsset:requestType:](self, "_mediaProviderForAsset:requestType:", v10, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requestAnimatedImageForAsset:options:resultHandler:", v10, v9, v8);

  return v12;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PUJoiningMediaProvider _mediaProviderByClass](self, "_mediaProviderByClass", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cancelImageRequest:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSMapTable)_mediaProviderByClass
{
  return self->__mediaProviderByClass;
}

- (NSMutableArray)_mediaProviderPredicateRecords
{
  return self->__mediaProviderPredicateRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__mediaProviderPredicateRecords, 0);
  objc_storeStrong((id *)&self->__mediaProviderByClass, 0);
}

@end
