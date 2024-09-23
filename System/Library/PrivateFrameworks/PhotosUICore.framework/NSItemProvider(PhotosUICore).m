@implementation NSItemProvider(PhotosUICore)

- (void)px_createAssetWithImportSessionID:()PhotosUICore completionBlock:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id *v11;
  id *v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  void *v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_px_bestTypeIdentifierForItemProvider:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXDragAndDropSettings sharedInstance](PXDragAndDropSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "useData");

  if (v10)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke;
    v26[3] = &unk_1E511A450;
    v11 = &v27;
    v26[4] = a1;
    v27 = v8;
    v12 = &v28;
    v13 = &v29;
    v28 = v6;
    v29 = v7;
    v14 = v6;
    v15 = v8;
    v16 = v7;
    v17 = (id)objc_msgSend(a1, "loadDataRepresentationForTypeIdentifier:completionHandler:", v15, v26);
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_134;
    v22[3] = &unk_1E511A478;
    v11 = &v25;
    v12 = &v23;
    v22[4] = a1;
    v23 = v8;
    v13 = &v24;
    v24 = v6;
    v25 = v7;
    v18 = v6;
    v19 = v8;
    v20 = v7;
    v21 = (id)objc_msgSend(a1, "loadFileRepresentationForTypeIdentifier:completionHandler:", v19, v22);
  }

}

- (void)px_createStreamShareSourceWithCompletionBlock:()PhotosUICore
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(a1, "_px_bestTypeIdentifierForItemProvider:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__NSItemProvider_PhotosUICore__px_createStreamShareSourceWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E5123258;
  v10 = v5;
  v11 = v4;
  v9[4] = a1;
  v6 = v5;
  v7 = v4;
  v8 = (id)objc_msgSend(a1, "loadFileRepresentationForTypeIdentifier:completionHandler:", v6, v9);

}

- (id)_px_bestTypeIdentifierForItemProvider:()PhotosUICore
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "registeredTypeIdentifiersWithFileOptions:", 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = PFIsLivePhotoBundleType();

        if ((v10 & 1) != 0)
        {
          PFCurrentPlatformLivePhotoBundleType();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_21;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v6)
        continue;
      break;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if (objc_msgSend(a1, "_px_isSupportedUniformTypeIdentifier:", v16, (_QWORD)v20))
        {
          v17 = v16;
          goto LABEL_21;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v17 = 0;
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }
LABEL_21:

  return v17;
}

- (uint64_t)_px_isSupportedUniformTypeIdentifier:()PhotosUICore
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0
    || (objc_msgSend(v0, "conformsToType:", *MEMORY[0x1E0CEC520]) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = PFIsLivePhotoBundleType();
  }

  return v1;
}

- (uint64_t)_px_assetResourceTypeFromUniformTypeIdentifier:()PhotosUICore
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if ((objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
    v5 = 2;
  else
    v5 = objc_msgSend(v4, "conformsToType:", *MEMORY[0x1E0CEC520]);

  return v5;
}

- (id)_px_assetResourceBagsFromUniformTypeIdentifier:()PhotosUICore atURL:
{
  id v5;
  void *v6;
  _PXAssetResourceBag *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _PXAssetResourceBag *v14;
  _PXAssetResourceBag *v15;
  void *v16;
  void *v17;
  _PXAssetResourceBag **v18;
  _PXAssetResourceBag *v20;
  _PXAssetResourceBag *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (PFIsLivePhotoBundleType())
  {
    v7 = (_PXAssetResourceBag *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75318]), "initWithBundleAtURL:", v5);
    v8 = (void *)MEMORY[0x1E0C99E98];
    -[_PXAssetResourceBag imagePath](v7, "imagePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E98];
    -[_PXAssetResourceBag videoPath](v7, "videoPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[_PXAssetResourceBag initWithResourceType:atURL:]([_PXAssetResourceBag alloc], "initWithResourceType:atURL:", 1, v10);
    v15 = -[_PXAssetResourceBag initWithResourceType:atURL:]([_PXAssetResourceBag alloc], "initWithResourceType:atURL:", 9, v13);
    v22[0] = v14;
    v22[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC568]))
    {
      v7 = -[_PXAssetResourceBag initWithResourceType:atURL:]([_PXAssetResourceBag alloc], "initWithResourceType:atURL:", 2, v5);
      v21 = v7;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = &v21;
    }
    else
    {
      if (!objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC520]))
      {
        v16 = 0;
        goto LABEL_9;
      }
      v7 = -[_PXAssetResourceBag initWithResourceType:atURL:]([_PXAssetResourceBag alloc], "initWithResourceType:atURL:", 1, v5);
      v20 = v7;
      v17 = (void *)MEMORY[0x1E0C99D20];
      v18 = &v20;
    }
    objc_msgSend(v17, "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v16;
}

- (id)_px_sharedMediaVideoComplementFromURL:()PhotosUICore
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D75318];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleAtURL:", v4);

  return v5;
}

- (uint64_t)_px_shareMediaTypeFromUniformTypeIdentifier:()PhotosUICore
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PFIsLivePhotoBundleType() & 1) != 0)
  {
    v1 = 3;
  }
  else if ((objc_msgSend(v0, "conformsToType:", *MEMORY[0x1E0CEC568]) & 1) != 0)
  {
    v1 = 1;
  }
  else if (objc_msgSend(v0, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    v1 = 2;
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
