@implementation PXPhotoKitAssetFilePromise

+ (id)filePromiseWithAsset:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id *v15;
  void *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:error:", v7, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v8)
  {
    objc_msgSend(v8, "variants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E53EC180);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = 2;
    else
      v12 = 1;

    if ((objc_msgSend(v7, "isRAW") & 1) != 0)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v16);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    v15 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v15 + 4, a3);
    objc_storeStrong(v15 + 1, v8);
    v15[2] = (id)v12;
    v17 = v15[5];
    v15[5] = (id)v13;

  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "No export request for asset %@ with error %@.", buf, 0x16u);
    }

    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v15;
}

- (id)fileNameForType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;

  -[PXPhotoKitAssetFilePromise asset](self, "asset", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D752F0];
  -[PXPhotoKitAssetFilePromise fileType](self, "fileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "typeWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "px_exportFilename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "preferredOrFallbackFilenameExtensionForType:", v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = CFSTR("data");
  }
  objc_msgSend(v9, "stringByAppendingPathExtension:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)writeToURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  PHAssetExportRequest *exportRequest;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[PXPhotoKitAssetFilePromise asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CD1418]);
  objc_msgSend(v9, "setTreatLivePhotoAsStill:", 1);
  objc_msgSend(v9, "setFlattenSlomoVideos:", 1);
  objc_msgSend(v9, "setDontAllowRAW:", 1);
  objc_msgSend(v9, "setVariant:", self->_variant);
  exportRequest = self->_exportRequest;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__PXPhotoKitAssetFilePromise_writeToURL_completionHandler___block_invoke;
  v14[3] = &unk_1E511EAC0;
  v15 = v8;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  -[PHAssetExportRequest exportWithOptions:completionHandler:](exportRequest, "exportWithOptions:completionHandler:", v9, v14);

}

- (PHAsset)asset
{
  return self->_asset;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_exportRequest, 0);
}

void __59__PXPhotoKitAssetFilePromise_writeToURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "playbackStyle");
  if ((unint64_t)(v7 - 1) < 3)
  {
    v8 = (_QWORD *)MEMORY[0x1E0CD18B0];
  }
  else
  {
    if ((unint64_t)(v7 - 4) >= 2)
    {
      if (!v7)
      {
        PLUIGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Trying to drag unsupported playback style", buf, 2u);
        }

      }
      goto LABEL_11;
    }
    v8 = (_QWORD *)MEMORY[0x1E0CD18B8];
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v15 = 0;
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", v10, v12, &v15);
    v13 = v15;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_14:

    goto LABEL_15;
  }
LABEL_11:
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("No export URL available for %@"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_15:

}

@end
