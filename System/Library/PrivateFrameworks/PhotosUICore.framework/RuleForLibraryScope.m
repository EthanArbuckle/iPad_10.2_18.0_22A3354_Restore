@implementation RuleForLibraryScope

void ___RuleForLibraryScope_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "dateRangeCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    PXSharedLibraryStartDateFromExclusiveCondition(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9)
    {
      PLSharedLibraryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v11;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Library scope has multiple start date rules: %{public}@", (uint8_t *)&v17, 0xCu);

      }
    }
    else
    {
      objc_storeStrong(v8, v6);
    }

  }
  objc_msgSend(v3, "personCondition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "personUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      PLSharedLibraryGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Library scope has multiple person UUID rules: %{public}@", (uint8_t *)&v17, 0xCu);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v14);
    }

  }
}

@end
