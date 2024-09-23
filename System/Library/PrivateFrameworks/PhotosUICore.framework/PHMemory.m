@implementation PHMemory

void __52__PHMemory_PhotosUICore__px_blockableFeatureActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  PXBlockableMemoryFeatureActionInfo *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    PLMemoriesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Skip duplicate blockable feature: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    PXLocalizedStringFromTable(v5, CFSTR("PhotosUICore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXBlockableMemoryFeatureActionInfo initWithActionType:localizedTitle:]([PXBlockableMemoryFeatureActionInfo alloc], "initWithActionType:localizedTitle:", v6, v8);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

  }
}

void __61__PHMemory_PhotosUICore__px_assignStoryTitleCategoryIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A85CE17C](objc_msgSend(v2, "setStoryTitleCategory:", *(_QWORD *)(a1 + 40)));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PHMemory_PhotosUICore__px_assignStoryTitleCategoryIfNeeded__block_invoke_2;
  v8[3] = &unk_1E5124E40;
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "px_photosGraphDataByMutatingPropertiesUsingBlock:error:", v8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v2, "setPhotosGraphData:", v5);
  }
  else
  {
    PLStoryGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_INFO, "Failed to persist storyTitleCategory to photosGraphData on memory: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v3);

}

void __61__PHMemory_PhotosUICore__px_assignStoryTitleCategoryIfNeeded__block_invoke_133(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLStoryGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v10 = "Persisted storyTitleCategory: '%@' on memory: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v11, v12, v10, (uint8_t *)&v16, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = 138412802;
    v17 = v14;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v5;
    v10 = "Failed to persist storyTitleCategory: '%@' on memory: %@, error: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEBUG;
    v13 = 32;
    goto LABEL_6;
  }

}

uint64_t __61__PHMemory_PhotosUICore__px_assignStoryTitleCategoryIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("storyTitleCategory"));
}

void __74__PHMemory_PhotosUICore__px_mutatedPhotosGraphPropertiesWithRejectReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    v4 = a2;
    objc_msgSend(v3, "numberWithUnsignedInteger:", v2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:");

  }
  else
  {
    v5 = a2;
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("PHMemoryGraphPropertyRejectReasonKey"));
  }

}

@end
