@implementation PXDeduplicationIdenticalSelectionFromSelection

void __PXDeduplicationIdenticalSelectionFromSelection_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int64x2_t v19;

  v7 = *(void **)(a1 + 32);
  v17 = a2;
  v18 = a3;
  v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v8 = a4;
  objc_msgSend(v7, "assetCollectionAtSectionIndexPath:", &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B3180, "indexPathSetWithItemIndexes:dataSourceIdentifier:section:", v8, a2, a3, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v9, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Different sections have the same collection ID?", (uint8_t *)&v17, 2u);
    }

  }
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v9, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v16);

}

@end
