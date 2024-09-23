@implementation PXMomentShareAcceptError

void __PXMomentShareAcceptError_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Will trash moment share: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __PXMomentShareAcceptError_block_invoke_130;
  v13[3] = &unk_1E5149198;
  v14 = *(id *)(a1 + 32);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __PXMomentShareAcceptError_block_invoke_2;
  v10[3] = &unk_1E5148348;
  v11 = *(id *)(a1 + 32);
  v12 = v4;
  v9 = v4;
  objc_msgSend(v7, "performChanges:completionHandler:", v13, v10);

}

void __PXMomentShareAcceptError_block_invoke_130(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD1688];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trashMomentShares:", v2);

}

void __PXMomentShareAcceptError_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v12 = 138412290;
      v13 = v8;
      v9 = "Did trash moment share: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v12 = 138412290;
    v13 = v5;
    v9 = "Unable to trash moment share: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);
}

@end
