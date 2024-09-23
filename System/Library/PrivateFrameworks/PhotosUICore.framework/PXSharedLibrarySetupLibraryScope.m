@implementation PXSharedLibrarySetupLibraryScope

void __PXSharedLibrarySetupLibraryScope_block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Create Shared Library", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Create Shared Library"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HandleError(v3, *(void **)(a1 + 32));

}

void __PXSharedLibrarySetupLibraryScope_block_invoke_163(uint64_t a1, void *a2)
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

void __PXSharedLibrarySetupLibraryScope_block_invoke_167(uint64_t a1, void *a2)
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
    v7[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_2;
    v7[3] = &unk_1E5148A40;
    v8 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v5, v6, v7);

  }
  else
  {
    v3[2](v3);
  }

}

void __PXSharedLibrarySetupLibraryScope_block_invoke_3(uint64_t a1)
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
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Create Shared Library Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Create Shared Library Failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_172;
    v7[3] = &unk_1E5148CE0;
    v8 = v3;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
    v6 = v3;
    v5(v4, v7);

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_2_173(uint64_t a1)
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
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Create Shared Library Failed (CPLExitMode)", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0CD1D80], 6007, CFSTR("Simulated Error: Create Shared Library Failed (CPLExitMode)"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_176;
    v7[3] = &unk_1E5148CE0;
    v8 = v3;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
    v6 = v3;
    v5(v4, v7);

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_2_177(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  __int16 v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    if (v5)
    {
      v7 = *(__int16 *)(a1 + 112);
      v8 = *(void **)(a1 + 48);
      v9 = *(void **)(a1 + 56);
      v10 = *(void **)(a1 + 64);
      v11 = *(void **)(a1 + 72);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_4;
      v15[3] = &unk_1E513DB90;
      v21 = *(_QWORD *)(a1 + 104);
      v12 = *(void **)(a1 + 40);
      v16 = *(id *)(a1 + 32);
      v18 = *(id *)(a1 + 80);
      v17 = v5;
      v19 = *(id *)(a1 + 88);
      v20 = *(id *)(a1 + 96);
      v22 = *(_WORD *)(a1 + 112);
      _UpdateRulesForLibraryScope(v17, v7, v12, v8, v9, v10, v11, v15);

      v13 = v16;
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 88);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_3_178;
      v23[3] = &unk_1E5148CE0;
      v24 = v6;
      v25 = *(id *)(a1 + 96);
      (*(void (**)(uint64_t, _QWORD *))(v14 + 16))(v14, v23);

      v13 = v24;
    }

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_3_178(uint64_t a1)
{
  _HandleError(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

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
      v6 = *(__int16 *)(a1 + 80);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_6;
      v11[3] = &unk_1E513DB18;
      v17 = *(_QWORD *)(a1 + 72);
      v7 = *(void **)(a1 + 40);
      v12 = *(id *)(a1 + 32);
      v14 = *(id *)(a1 + 48);
      v13 = *(id *)(a1 + 40);
      v15 = *(id *)(a1 + 56);
      v16 = *(id *)(a1 + 64);
      _MarkSharedAssetsForLibraryScopeIfNecessary(v7, v6, v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount") + 1);
        objc_msgSend(*(id *)(a1 + 32), "addChild:withPendingUnitCount:", v8, 1);
      }

      v9 = v12;
    }
    else
    {
      v10 = *(_QWORD *)(a1 + 56);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_5;
      v18[3] = &unk_1E5145688;
      v19 = *(id *)(a1 + 40);
      v20 = v5;
      v21 = *(id *)(a1 + 64);
      (*(void (**)(uint64_t, _QWORD *))(v10 + 16))(v10, v18);

      v9 = v19;
    }

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_5(void **a1)
{
  _ExpungeLibraryScope(a1[4], 0);
  _HandleError(a1[5], a1[6]);
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_7;
  v7[3] = &unk_1E513DB68;
  v14 = *(_QWORD *)(a1 + 72);
  v8 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v15 = a2;
  v12 = *(id *)(a1 + 56);
  v10 = v5;
  v13 = *(id *)(a1 + 64);
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __PXSharedLibrarySetupLibraryScope_block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    || objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (*(_BYTE *)(a1 + 88))
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_9;
      v5[3] = &unk_1E513DB40;
      v11 = *(_QWORD *)(a1 + 80);
      v2 = *(void **)(a1 + 40);
      v6 = *(id *)(a1 + 32);
      v8 = *(id *)(a1 + 56);
      v7 = *(id *)(a1 + 40);
      v9 = *(id *)(a1 + 64);
      v10 = *(id *)(a1 + 72);
      _PublishLibraryScope(v2, v5);

      v3 = v6;
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 64);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_8;
      v12[3] = &unk_1E5145688;
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 72);
      (*(void (**)(uint64_t, _QWORD *))(v4 + 16))(v4, v12);

      v3 = v13;
    }

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_8(void **a1)
{
  _ExpungeLibraryScope(a1[4], 0);
  _HandleError(a1[5], a1[6]);
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
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
      v10[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_11;
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
      v17[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_10;
      v17[3] = &unk_1E5145688;
      v18 = *(id *)(a1 + 40);
      v19 = v5;
      v20 = *(id *)(a1 + 64);
      (*(void (**)(uint64_t, _QWORD *))(v9 + 16))(v9, v17);

      v8 = v18;
    }

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_10(void **a1)
{
  _ExpungeLibraryScope(a1[4], 0);
  _HandleError(a1[5], a1[6]);
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_11(uint64_t a1, char a2, void *a3)
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
      v9[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_13;
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
      v16[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_12;
      v16[3] = &unk_1E5145688;
      v17 = *(id *)(a1 + 40);
      v18 = v5;
      v19 = *(id *)(a1 + 64);
      (*(void (**)(uint64_t, _QWORD *))(v8 + 16))(v8, v16);

      v7 = v17;
    }

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_12(void **a1)
{
  _ExpungeLibraryScope(a1[4], 0);
  _HandleError(a1[5], a1[6]);
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_13(uint64_t a1, void *a2, void *a3)
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
    v8[2] = __PXSharedLibrarySetupLibraryScope_block_invoke_14;
    v8[3] = &unk_1E5148370;
    v9 = v5;
    v12 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 40);
    v11 = v6;
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);

  }
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_14(uint64_t a1)
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

void __PXSharedLibrarySetupLibraryScope_block_invoke_176(uint64_t a1)
{
  _HandleError(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void __PXSharedLibrarySetupLibraryScope_block_invoke_172(uint64_t a1)
{
  _HandleError(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __PXSharedLibrarySetupLibraryScope_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
