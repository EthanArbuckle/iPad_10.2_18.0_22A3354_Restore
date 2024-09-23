@implementation NSError

uint64_t __58__NSError_SafariCoreExtras__safari_privacyPreservingError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_privacyPreservingError");
}

void __85__NSError_SafariCoreExtras___safari_getPrivacyPreservingUserInfoProvidersUsingBlock___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__privacyPreservingUserInfoProviders;
  _safari_getPrivacyPreservingUserInfoProvidersUsingBlock__privacyPreservingUserInfoProviders = v0;

}

id __92__NSError_SafariSharedCloudKitExtras__safari_setUpCloudKitPrivacyPreservingUserInfoProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C94A48];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A48]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  v7 = *MEMORY[0x1E0C946F8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C946F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v7);

  v9 = *MEMORY[0x1E0C94808];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);

  v11 = *MEMORY[0x1E0C94B30];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94B30]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_privacyPreservingError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

  v14 = objc_msgSend(v2, "code");
  stringForCKErrorCode();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB2D50]);

  if (v14 == 26)
  {
    v19 = *MEMORY[0x1E0C94820];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94820]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, v19);
    goto LABEL_5;
  }
  if (v14 == 2)
  {
    v16 = *MEMORY[0x1E0C94940];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_2_0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, v16);

LABEL_5:
  }
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

void __58__NSError_SafariCoreExtras__safari_privacyPreservingError__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __91__NSError_SafariCoreExtras__safari_setPrivacyPreservingUserInfoProviderForDomain_provider___block_invoke(uint64_t a1, void *a2)
{
  const void *v3;
  id v4;
  id v5;

  v3 = *(const void **)(a1 + 40);
  v4 = a2;
  v5 = _Block_copy(v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));

}

uint64_t __92__NSError_SafariSharedCloudKitExtras__safari_setUpCloudKitPrivacyPreservingUserInfoProvider__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "safari_privacyPreservingError");
}

void __80__NSError_SafariSharedCloudKitExtras___safari_enumerateCloudKitErrorsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __86__NSError_SafariSharedCloudKitExtras__safari_hasOrContainsErrorWithCloudKitErrorCode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "code");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __97__NSError_SafariSharedCloudKitExtras__safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(v9, "code") == 1;
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "code") == *(_QWORD *)(a1 + 40))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }

    v6 = v9;
  }

}

void __94__NSError_SafariSharedCloudKitExtras__safari_containsCloudKitMissingZoneErrorForRecordZoneID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      if (objc_msgSend(v7, "safari_isCloudKitMissingZoneError"))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

}

void __103__NSError_SafariSharedCloudKitExtras___safari_isOrContainsCloudKitErrorOfCodes_checkInternalErrorCode___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v13 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v13, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "containsObject:", v12);

      if ((_DWORD)v11)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }

  }
}

void __102__NSError_SafariSharedCloudKitExtras__safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("RecordID: %@, Error: %@"), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
}

void __79__NSError_SafariCoreExtras__safari_privacyPreservingUserInfoProviderForDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __70__NSError_SafariCoreExtras__safari_isOrContainsClientSideNetworkError__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isOrContainsClientSideNetworkError");
}

@end
