@implementation PXCollectionDeletionAlertControllerForCollection

void __PXCollectionDeletionAlertControllerForCollection_block_invoke(uint64_t a1)
{
  PXDeleteCollectionsAction *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PXDeleteCollectionsAction initWithCollection:]([PXDeleteCollectionsAction alloc], "initWithCollection:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PXCollectionDeletionAlertControllerForCollection_block_invoke_2;
  v6[3] = &unk_1E5148348;
  v3 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  -[PXAction executeWithUndoManager:completionHandler:](v2, "executeWithUndoManager:completionHandler:", v3, v6);
  PLSAggregateDictionaryAddValueForScalarKey();
  v4 = (void *)MEMORY[0x1E0D09910];
  v9 = *MEMORY[0x1E0D09818];
  v10[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.albumDeleted"), v5);

}

uint64_t __PXCollectionDeletionAlertControllerForCollection_block_invoke_153(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __PXCollectionDeletionAlertControllerForCollection_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIActionsGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v5;
      _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed to delete collection %{public}@ with error %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

@end
