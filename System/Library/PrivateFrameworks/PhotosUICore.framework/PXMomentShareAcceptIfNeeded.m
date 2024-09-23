@implementation PXMomentShareAcceptIfNeeded

void __PXMomentShareAcceptIfNeeded_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD block[4];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Successfully accepted moment share: %@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    if (v9)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __PXMomentShareAcceptIfNeeded_block_invoke_144;
      block[3] = &unk_1E5148A40;
      v20 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    v10 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __PXMomentShareAcceptIfNeeded_block_invoke_2;
    v17[3] = &unk_1E5148600;
    v18 = v10;
    objc_msgSend(v18, "forceSyncMomentShareWithCompletion:", v17);
    v11 = v18;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to accept moment share: %@ due to error: %@", buf, 0x16u);
    }

    PXMomentShareAcceptError(*(void **)(a1 + 32), v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __PXMomentShareAcceptIfNeeded_block_invoke_146;
      v14[3] = &unk_1E5148CE0;
      v16 = v13;
      v11 = v11;
      v15 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], v14);

    }
  }

}

uint64_t __PXMomentShareAcceptIfNeeded_block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PXMomentShareAcceptIfNeeded_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v3;
      v7 = "Unable to force sync moment share %@: %@";
      v8 = v4;
      v9 = 22;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
  else if (v5)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v10;
    v7 = "Force sync moment share %@";
    v8 = v4;
    v9 = 12;
    goto LABEL_6;
  }

}

uint64_t __PXMomentShareAcceptIfNeeded_block_invoke_146(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

@end
