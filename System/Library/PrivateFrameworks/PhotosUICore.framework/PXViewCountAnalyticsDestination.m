@implementation PXViewCountAnalyticsDestination

- (void)processEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.incrementAssetViewCount")))
  {
    objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D09828]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__PXViewCountAnalyticsDestination_processEvent___block_invoke;
    v18[3] = &unk_1E5149198;
    v7 = &v19;
    v8 = v5;
    v19 = v8;
    v17 = 0;
    v9 = objc_msgSend(v6, "performChangesAndWait:error:", v18, &v17);
    v10 = v17;
    if ((v9 & 1) == 0)
    {
      PXAssertGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v10;
LABEL_12:
        _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Unable to process change request for viewCount change: %@", buf, 0xCu);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photos.CPAnalytics.incrementMemoryViewCount")))
  {
    objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D09818]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_128;
    v15[3] = &unk_1E5149198;
    v7 = &v16;
    v8 = v12;
    v16 = v8;
    v14 = 0;
    v13 = objc_msgSend(v6, "performChangesAndWait:error:", v15, &v14);
    v10 = v14;
    if ((v13 & 1) == 0)
    {
      PXAssertGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v10;
        goto LABEL_12;
      }
LABEL_8:

    }
LABEL_9:

  }
}

void __48__PXViewCountAnalyticsDestination_processEvent___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "incrementViewCount");

}

void __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_128(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastMoviePlayedDate:", v1);
  objc_msgSend(v2, "setLastViewedDate:", v1);
  objc_msgSend(v2, "incrementPlayCount");

}

@end
