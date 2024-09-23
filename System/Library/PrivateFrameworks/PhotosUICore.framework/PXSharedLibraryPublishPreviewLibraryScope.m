@implementation PXSharedLibraryPublishPreviewLibraryScope

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Publish Shared Library Preview", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Publish Shared Library Preview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HandleError(v3, *(void **)(a1 + 32));

}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = v3;
  if (v3)
    _ExpungeLibraryScope(v3, 0);
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    PLSharedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Publish Shared Library Preview", v7, 2u);
    }

    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Publish Shared Library Preview"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HandleError(v6, *(void **)(a1 + 40));

  }
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_200(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  void (**v8)(_QWORD);

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_2;
    v7[3] = &unk_1E5148A40;
    v8 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v5, v6, v7);

  }
  else
  {
    v3[2](v3);
  }

}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Publish Shared Library Preview Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Publish Shared Library Preview Failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_203;
    v7[3] = &unk_1E5148CE0;
    v8 = v3;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
    v6 = v3;
    v5(v4, v7);

  }
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_2_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (a2)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_4;
      v10[3] = &unk_1E513DB18;
      v16 = *(_QWORD *)(a1 + 72);
      v6 = *(void **)(a1 + 40);
      v11 = *(id *)(a1 + 32);
      v13 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 64);
      _ActivateLibraryScope(v6, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(*(id *)(a1 + 32), "addChild:withPendingUnitCount:", v7, 1);

      v8 = v11;
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 56);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_3_205;
      v17[3] = &unk_1E5145688;
      v18 = *(id *)(a1 + 40);
      v19 = v5;
      v20 = *(id *)(a1 + 64);
      (*(void (**)(uint64_t, _QWORD *))(v9 + 16))(v9, v17);

      v8 = v18;
    }

  }
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_3_205(void **a1)
{
  _ExpungeLibraryScope(a1[4], 0);
  _HandleError(a1[5], a1[6]);
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if ((a2 & 1) != 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_6;
      v9[3] = &unk_1E513DAF0;
      v15 = *(_QWORD *)(a1 + 72);
      v6 = *(void **)(a1 + 40);
      v10 = *(id *)(a1 + 32);
      v12 = *(id *)(a1 + 48);
      v11 = *(id *)(a1 + 40);
      v13 = *(id *)(a1 + 56);
      v14 = *(id *)(a1 + 64);
      _RefetchLibraryScope(v6, v9);

      v7 = v10;
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 56);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_5;
      v16[3] = &unk_1E5145688;
      v17 = *(id *)(a1 + 40);
      v18 = v5;
      v19 = *(id *)(a1 + 64);
      (*(void (**)(uint64_t, _QWORD *))(v8 + 16))(v8, v16);

      v7 = v17;
    }

  }
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_5(void **a1)
{
  _ExpungeLibraryScope(a1[4], 0);
  _HandleError(a1[5], a1[6]);
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_7;
    v8[3] = &unk_1E5148370;
    v9 = v5;
    v12 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 40);
    v11 = v6;
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);

  }
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_7(uint64_t a1)
{
  uint64_t v2;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    _ExpungeLibraryScope(*(void **)(a1 + 40), 0);
    _HandleError(*(void **)(a1 + 48), *(void **)(a1 + 56));
  }
}

void __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_203(uint64_t a1)
{
  _HandleError(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __PXSharedLibraryPublishPreviewLibraryScope_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
