@implementation PXFlexMusicImageLoader

void __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFURL *v3;
  const __CFDictionary *v4;
  CGImageSourceRef v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD block[5];
  id v18;
  uint64_t v19;
  _BYTE buf[12];
  __int16 v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "maxSize");
  v3 = v2;
  v23[0] = *MEMORY[0x1E0CBD240];
  *(_QWORD *)buf = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v23, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = CGImageSourceCreateWithURL(v3, v4);

  if (v5 && (v6 = PXCreateCGImageFromImageSourceWithMaxPixelSize(), CFRelease(v5), v6))
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FlexMusic returned a local file URL, but we could not use it to create an image: %@"), v3);
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23[0] = *MEMORY[0x1E0CB2938];
    *(_QWORD *)buf = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", CFSTR("PXAudioAssetImageProviderErrorDomain"), 3, v10);

    v7 = objc_retainAutorelease(v11);
    v6 = 0;
  }

  v12 = v7;
  if (!v6)
  {
    PLAudioPlaybackGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v14;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to decode artwork image from URL: %@. Error: %@", buf, 0x16u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke_39;
  block[3] = &unk_1E5145560;
  v15 = *(_QWORD *)(a1 + 40);
  v18 = v12;
  v19 = v6;
  block[4] = v15;
  v16 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(void);
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "artworkAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Finished download data from Flex Music song, but we could not use it to create an image: %@"), v3);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v12 = *MEMORY[0x1E0CB2938];
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_dictionaryBySettingObject:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("PXAudioAssetImageProviderErrorDomain"), 3, v7);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 48);
  *(_QWORD *)(v9 + 48) = v8;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v11[2]();

}

void __58___PXFlexMusicImageLoader__handleDownloadCompleted_error___block_invoke_39(uint64_t a1)
{
  void (**v2)(void);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

void __47___PXFlexMusicImageLoader_startWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleDownloadCompleted:error:", a2, v5);

}

@end
