@implementation PXSharedLibraryExitLibraryScope

void __PXSharedLibraryExitLibraryScope_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Exit Shared Library", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    PXSharedLibraryUserCanceledErrorWithDebugDescription(CFSTR("Exit Shared Library"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

void __PXSharedLibraryExitLibraryScope_block_invoke_254(uint64_t a1, void *a2)
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
    v7[2] = __PXSharedLibraryExitLibraryScope_block_invoke_2;
    v7[3] = &unk_1E5148A40;
    v8 = v3;
    PXSharedLibraryDismissProgressAlertWithPresentationEnvironment(v5, v6, v7);

  }
  else
  {
    v3[2](v3);
  }

}

void __PXSharedLibraryExitLibraryScope_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit Failed", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXSharedLibraryErrorDomain"), -1000, CFSTR("Simulated Error: Exit Failed"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __PXSharedLibraryExitLibraryScope_block_invoke_257;
    v8[3] = &unk_1E5148CE0;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v9 = v3;
    v10 = v5;
    v6 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
    v7 = v3;
    v6(v4, v8);

  }
}

void __PXSharedLibraryExitLibraryScope_block_invoke_2_258(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void (*v11)(uint64_t, _QWORD *);
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[8];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    PLSharedLibraryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Simulated Error: Exit Failed (ServerGeneratedLocalizedDescription)", buf, 2u);
    }

    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CD1D80];
    v5 = *MEMORY[0x1E0CD1DF0];
    v17[0] = *MEMORY[0x1E0CB2938];
    v17[1] = v5;
    v18[0] = CFSTR("Simulated Error: Exit Failed (ServerGeneratedLocalizedDescription)");
    v18[1] = CFSTR("<< Server Generated Localized Description >>");
    v17[2] = *MEMORY[0x1E0CD1C80];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://www.apple.com/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __PXSharedLibraryExitLibraryScope_block_invoke_267;
    v13[3] = &unk_1E5148CE0;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v14 = v8;
    v15 = v10;
    v11 = *(void (**)(uint64_t, _QWORD *))(v9 + 16);
    v12 = v8;
    v11(v9, v13);

  }
}

void __PXSharedLibraryExitLibraryScope_block_invoke_268(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "ExitLibraryScope", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v11;
      v12 = "Did exit library scope with identifier: %{public}@";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEFAULT;
      v15 = 12;
LABEL_9:
      _os_log_impl(&dword_1A6789000, v13, v14, v12, buf, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v5;
    v12 = "Failed to exit library scope with identifier: %{public}@, error: %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
    goto LABEL_9;
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    && (objc_msgSend(*(id *)(a1 + 48), "isCancelled") & 1) == 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __PXSharedLibraryExitLibraryScope_block_invoke_269;
    v16[3] = &unk_1E513DCD0;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v20 = a2;
    v17 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

void __PXSharedLibraryExitLibraryScope_block_invoke_269(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __PXSharedLibraryExitLibraryScope_block_invoke_2_270;
  v3[3] = &unk_1E5146308;
  v2 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v3);

}

uint64_t __PXSharedLibraryExitLibraryScope_block_invoke_2_270(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __PXSharedLibraryExitLibraryScope_block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __PXSharedLibraryExitLibraryScope_block_invoke_257(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __PXSharedLibraryExitLibraryScope_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
