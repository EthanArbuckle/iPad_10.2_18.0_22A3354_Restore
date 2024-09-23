@implementation PHContentEditingOutput(PUPhotoEditSnapshot)

- (void)initWithPhotoEditSnapshot:()PUPhotoEditSnapshot appropriateForURL:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "initWithAdjustmentBaseVersion:mediaType:appropriateForURL:", 0, 1, a4);
  if (v7)
  {
    objc_msgSend(v6, "adjustmentData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBaseVersion:", objc_msgSend(v8, "baseVersion"));

    objc_msgSend(v6, "adjustmentData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustmentData:", v9);

    objc_msgSend(v6, "baseImageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPenultimateRenderedJPEGData:", v10);

    v11 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v6, "imageUTI");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeWithIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    objc_msgSend(v7, "renderedContentURLForType:error:", v13, &v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;
    if (v14)
    {
      objc_msgSend(v6, "imageData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v15;
      v17 = objc_msgSend(v16, "writeToURL:options:error:", v14, 1073741825, &v22);
      v18 = v22;

      if ((v17 & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      PLPhotoEditGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v18;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to write snapshot image data to rendered content URL with error: %@", buf, 0xCu);
      }
    }
    else
    {
      PLPhotoEditGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to retrieve rendered content URL for identifier: %{public}@, error: %@", buf, 0x16u);

      }
      v18 = v15;
    }

    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

@end
