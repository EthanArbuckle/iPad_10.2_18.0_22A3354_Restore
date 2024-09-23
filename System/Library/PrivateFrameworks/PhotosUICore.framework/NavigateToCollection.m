@implementation NavigateToCollection

void ___NavigateToCollection_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE buf[12];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v6;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.photos.CPAnalytics.navigateTo%@Succeeded"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLUserStatusUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Did navigate to: %{public}@", buf, 0xCu);
    }

  }
  else
  {
    PLUserStatusUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to navigate to: %{public}@, error: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.photos.CPAnalytics.navigateTo%@Failed"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)MEMORY[0x1E0D09910];
  v14 = *MEMORY[0x1E0D09830];
  *(_QWORD *)buf = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendEvent:withPayload:", v9, v13);

}

@end
