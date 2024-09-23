@implementation PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary

void __PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a4;
  _PXContentSyndicationAssetsToProccessFromSavingHelperResult(a2, v8, *(void **)(a1 + 40), a3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Syndication Assets Processing: No assets to process", v11, 2u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
