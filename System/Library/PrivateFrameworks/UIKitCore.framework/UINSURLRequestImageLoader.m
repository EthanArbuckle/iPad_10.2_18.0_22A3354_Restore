@implementation UINSURLRequestImageLoader

void __48___UINSURLRequestImageLoader__really_loadImage___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    +[UIImage imageWithData:](UIImage, "imageWithData:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v9);
    }
    else
    {
      _UIImageLoadingLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 32);
        v24 = 134218243;
        v25 = v23;
        v26 = 2113;
        v27 = v7;
        _os_log_error_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "Image loader %p could not create image from URL response: %{private}@", (uint8_t *)&v24, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 24);
      *(_QWORD *)(v16 + 24) = v15;

      v10 = 0;
    }
  }
  else
  {
    _UIImageLoadingLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "domain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "code");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "HTTPMethod");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 134219011;
      v25 = v18;
      v26 = 2114;
      v27 = v19;
      v28 = 2048;
      v29 = v20;
      v30 = 2113;
      v31 = v21;
      v32 = 2113;
      v33 = v22;
      _os_log_error_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Image loader %p received error: domain=%{public}@ code=%ld request=%{private}@ %{private}@", (uint8_t *)&v24, 0x34u);

    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v10 = *(void **)(v12 + 24);
    *(_QWORD *)(v12 + 24) = v13;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
