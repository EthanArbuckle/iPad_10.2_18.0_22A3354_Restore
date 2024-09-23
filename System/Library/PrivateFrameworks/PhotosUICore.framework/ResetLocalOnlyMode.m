@implementation ResetLocalOnlyMode

uint64_t ___ResetLocalOnlyMode_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CD15E0];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = ___ResetLocalOnlyMode_block_invoke_2;
  v8[3] = &unk_1E5148B78;
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "resetLocalOnlyLibraryScopesAndAllLibraryScopeAssetStatesWithPhotoLibrary:completion:", v5, v8);

  return 1;
}

void ___ResetLocalOnlyMode_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  __CFString *v4;
  void *v5;
  _QWORD v6[4];
  __CFString *v7;
  id v8;
  id v9;
  _QWORD block[4];
  const __CFString *v11;
  __CFString *v12;
  id v13;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ResetLocalOnlyMode_block_invoke_3;
    block[3] = &unk_1E51457C8;
    v11 = CFSTR("Successfully reset local-only LibraryScopes");
    v12 = CFSTR("All local-only LibraryScopes were deleted and libraryScopeShareStates were reset on all Assets");
    v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v4 = (__CFString *)v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reset action failed: %@"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = ___ResetLocalOnlyMode_block_invoke_4;
    v6[3] = &unk_1E51457C8;
    v7 = CFSTR("Failed to reset local-only LibraryScopes");
    v8 = v5;
    v9 = *(id *)(a1 + 32);
    v4 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void ___ResetLocalOnlyMode_block_invoke_3(uint64_t a1)
{
  _PresentAlert(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
}

void ___ResetLocalOnlyMode_block_invoke_4(uint64_t a1)
{
  _PresentAlert(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
}

@end
