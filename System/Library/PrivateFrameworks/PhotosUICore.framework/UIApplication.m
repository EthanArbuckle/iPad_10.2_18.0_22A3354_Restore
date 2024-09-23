@implementation UIApplication

void __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != 1)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v7;
      v11 = 2048;
      v12 = a2;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to navigate to URL: %@ with result: %li error: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, a2 == 1, v5);

}

void __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_181(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0D22D88];
  v20[0] = *MEMORY[0x1E0D22DA8];
  v20[1] = v4;
  v21[0] = MEMORY[0x1E0C9AAB0];
  v21[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v3, v5, &v15);
  v7 = v15;

  if ((v6 & 1) == 0)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to navigate to URL: %@ with error: %@", buf, 0x16u);
    }

  }
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_183;
    v11[3] = &unk_1E5146308;
    v13 = v10;
    v14 = v6;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

uint64_t __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_183(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __80__UIApplication_PhotosUICore__px_navigateToOneUpShowingAsset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2D50];
  v5[0] = CFSTR("Cannot navigate to an asset without a UUID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PXUIApplicationErrorDomain"), -1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
