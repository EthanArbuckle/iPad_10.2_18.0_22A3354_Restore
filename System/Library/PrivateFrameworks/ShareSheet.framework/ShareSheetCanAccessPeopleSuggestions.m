@implementation ShareSheetCanAccessPeopleSuggestions

void ___ShareSheetCanAccessPeopleSuggestions_block_invoke()
{
  const __CFAllocator *Default;
  __SecTask *v1;
  __SecTask *v2;
  id v3;

  Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  if (v1)
  {
    v2 = v1;
    v3 = (id)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.sharesheet.allow-suggestions"), 0);
    CFRelease(v2);
    _ShareSheetCanAccessPeopleSuggestions_hostHasEntitlement = objc_msgSend(v3, "BOOLValue");

  }
}

void ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  _BYTE v17[24];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2_cold_2(a3, v7);

  }
  else
  {
    v8 = v5;
    *(_QWORD *)v17 = 0;
    *(_QWORD *)&v17[8] = v17;
    *(_QWORD *)&v17[16] = 0x2020000000;
    v9 = gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr;
    v18 = (const char *)gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr;
    if (!gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr)
    {
      v10 = (void *)TCCLibrary();
      v9 = dlsym(v10, "tcc_authorization_record_get_authorization_right");
      *(_QWORD *)(*(_QWORD *)&v17[8] + 24) = v9;
      gettcc_authorization_record_get_authorization_rightSymbolLoc_ptr = v9;
    }
    _Block_object_dispose(v17, 8);
    if (!v9)
    {
      __85___UIActivityApplicationExtensionsCache__startPrecachingContinuousExtensionDiscovery__block_invoke_cold_1();
      __break(1u);
    }
    v11 = ((uint64_t (*)(id))v9)(v8);

    v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
    v13 = (v11 & 0xFFFFFFFFFFFFFFFELL) == 2;
    share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = "no";
      v16 = *(_QWORD *)(a1 + 40);
      if (v12 == 2)
        v15 = "yes";
      *(_DWORD *)v17 = 138412802;
      *(_QWORD *)&v17[4] = v16;
      *(_WORD *)&v17[12] = 2082;
      *(_QWORD *)&v17[14] = "_ShareSheetCanAccessPeopleSuggestions_block_invoke";
      *(_WORD *)&v17[22] = 2082;
      v18 = v15;
      _os_log_impl(&dword_19E419000, v14, OS_LOG_TYPE_INFO, "TCC authorization request for service name:%@ (%{public}s) was granted: %{public}s", v17, 0x20u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v13;
  }

}

void ___ShareSheetCanAccessPeopleSuggestions_block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "_ShareSheetCanAccessPeopleSuggestions_block_invoke_2";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "TCC authorization request (%{public}s) failed: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
