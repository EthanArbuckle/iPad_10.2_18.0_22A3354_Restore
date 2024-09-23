@implementation PXPublishMomentShareWithCompletion

void __PXPublishMomentShareWithCompletion_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "pl_redactedShareURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXPublishMomentShareWithCompletion: Published moment share to URL: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "PXPublishMomentShareWithCompletion: Failed to publish moment share with error: %@", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __PXPublishMomentShareWithCompletion_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "selectAllItems");
}

@end
