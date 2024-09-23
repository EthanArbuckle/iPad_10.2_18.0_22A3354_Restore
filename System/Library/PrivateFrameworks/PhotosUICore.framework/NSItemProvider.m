@implementation NSItemProvider

void __78__NSItemProvider_PhotosUICore__px_createStreamShareSourceWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _PXItemProviderTemporaryURL(v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeItemAtURL:error:", v11, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v13, "moveItemAtURL:toURL:error:", v5, v11, &v29);
    v7 = v29;

    if (v7)
    {
      PLDragAndDropGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v31 = "-[NSItemProvider(PhotosUICore) px_createStreamShareSourceWithCompletionBlock:]_block_invoke";
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v7;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "%s: failed to move to tmp location file for %@ error: %@", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_32;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0D71B58]);
    v17 = objc_msgSend(*(id *)(a1 + 32), "_px_shareMediaTypeFromUniformTypeIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v16, "setMediaType:", v17);
    if ((unint64_t)(v17 - 1) < 2)
    {
      if (v5)
      {
        objc_msgSend(v16, "setMediaURL:", v11);
LABEL_16:
        v20 = *(_QWORD *)(a1 + 48);
        if (v20)
          (*(void (**)(uint64_t, id, _QWORD))(v20 + 16))(v20, v16, 0);
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      PLDragAndDropGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v24 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v31 = v24;
      v32 = 2112;
      v33 = 0;
      v23 = "Couldn't get url from provider:%@ error:%@";
      goto LABEL_24;
    }
    if (v17)
    {
      if (v17 != 3)
      {
LABEL_26:
        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Couldn't share item from provider %@"), *(_QWORD *)(a1 + 32));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        }
        PLDragAndDropGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v31 = v28;
          _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEFAULT, "Couldn't share item with provider %@", buf, 0xCu);
        }

        goto LABEL_31;
      }
      objc_msgSend(*(id *)(a1 + 32), "_px_sharedMediaVideoComplementFromURL:", v11);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        objc_msgSend(v16, "setVideoComplement:", v18);
        objc_msgSend(v16, "setMediaURL:", v11);

        goto LABEL_16;
      }
      PLDragAndDropGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v31 = v25;
        v32 = 2112;
        v33 = 0;
        v23 = "Couldn't get live photo from provider:%@ error:%@";
        goto LABEL_24;
      }
    }
    else
    {
      PLDragAndDropGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v31 = v22;
        v32 = 2112;
        v33 = 0;
        v23 = "Media type unknown, couldn't get url from provider:%@ error:%@";
LABEL_24:
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  v7 = v6;
  PLDragAndDropGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v31 = "-[NSItemProvider(PhotosUICore) px_createStreamShareSourceWithCompletionBlock:]_block_invoke";
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%s: failed to load file representation for %@ error: %@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_33:

}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v5 = a2;
  v6 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__25981;
  v19[4] = __Block_byref_object_dispose__25982;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_128;
  v14[3] = &unk_1E512B8A8;
  v9 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = *(id *)(a1 + 48);
  v10 = v5;
  v17 = v10;
  v18 = v19;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2;
  v11[3] = &unk_1E511A428;
  v12 = *(id *)(a1 + 56);
  v13 = v19;
  objc_msgSend(v7, "performChanges:completionHandler:", v14, v11);

  _Block_object_dispose(v19, 8);
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _BYTE *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _BYTE *v29;
  id v30;
  uint8_t v31[4];
  uint64_t v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    PLDragAndDropGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v34 = v7;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%s: failed to load file representation for %@ error: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _PXItemProviderTemporaryURL(v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeItemAtURL:error:", v11, 0);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v13, "copyItemAtURL:toURL:error:", v5, v11, &v30);
    v7 = (uint64_t (*)(uint64_t, uint64_t))v30;

    if (v7)
    {
      PLDragAndDropGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        v34 = v7;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "%s: failed to move to tmp location file for %@ error: %@", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v34 = __Block_byref_object_copy__25981;
      v35 = __Block_byref_object_dispose__25982;
      v36 = 0;
      objc_msgSend(*(id *)(a1 + 32), "_px_assetResourceBagsFromUniformTypeIdentifier:atURL:", *(_QWORD *)(a1 + 40), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = MEMORY[0x1E0C809B0];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_140;
        v25[3] = &unk_1E513D0D8;
        v26 = v5;
        v27 = *(id *)(a1 + 48);
        v28 = v16;
        v29 = buf;
        v21[0] = v18;
        v21[1] = 3221225472;
        v21[2] = __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2_141;
        v21[3] = &unk_1E512E218;
        v23 = *(id *)(a1 + 56);
        v24 = buf;
        v22 = v11;
        objc_msgSend(v17, "performChanges:completionHandler:", v25, v21);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Couldn't get valid resources %@"), *(_QWORD *)(a1 + 32));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PLDragAndDropGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v31 = 138412290;
          v32 = v20;
          _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "Couldn't share item with provider %@", v31, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

      _Block_object_dispose(buf, 8);
    }

  }
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_140(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CD1448]);
  objc_msgSend(v2, "setShouldMoveFile:", 0);
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOriginalFilename:", v3);

  objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImportSessionID:", *(_QWORD *)(a1 + 40));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = *(id *)(a1 + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "resourceType", (_QWORD)v17);
        objc_msgSend(v10, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addResourceWithType:fileURL:options:", v11, v12, v2);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "placeholderForCreatedAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2_141(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    PLDragAndDropGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke_2";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "%s: failed to perform creationRequest with error: %@", buf, 0x16u);
    }

    v7 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_msgSend(v5, "copy");
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  objc_msgSend(v9, "removeItemAtURL:error:", v10, &v14);
  v11 = v14;

  if (v11)
  {
    PLDragAndDropGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v16 = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke";
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "%s: failed to remove item at url  %@ with error: %@", buf, 0x20u);
    }

  }
}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_128(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_px_assetResourceTypeFromUniformTypeIdentifier:", *(_QWORD *)(a1 + 40));
  v8 = objc_alloc_init(MEMORY[0x1E0CD1448]);
  objc_msgSend(v8, "setShouldMoveFile:", 0);
  objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImportSessionID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "addResourceWithType:data:options:", v2, *(_QWORD *)(a1 + 56), v8);
  objc_msgSend(v3, "placeholderForCreatedAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __82__NSItemProvider_PhotosUICore__px_createAssetWithImportSessionID_completionBlock___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    PLDragAndDropGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[NSItemProvider(PhotosUICore) px_createAssetWithImportSessionID:completionBlock:]_block_invoke_2";
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "%s: failed to perform creationRequest with error: %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

@end
