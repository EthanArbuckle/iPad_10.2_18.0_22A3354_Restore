@implementation NSURLCredentialStorage

void __152__NSURLCredentialStorage_SafariCoreExtras__safari_deleteCredentialWithEmptyServerHostForUser_forHTMLFormProtectionSpace_forGroupID_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;

    *a4 = 1;
  }

}

id __71__NSURLCredentialStorage_SafariCoreExtras__safari_allSafariCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  objc_msgSend(a2, "authenticationMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C92B40]);

  if (v6)
    v7 = v4;
  else
    v7 = 0;

  return v7;
}

uint64_t __123__NSURLCredentialStorage_SafariCoreExtras__safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2621000, v2, OS_LOG_TYPE_INFO, "Starting migration for keychain items with invalid authentication types", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_safari_migrateKeychainItemsWithInvalidAuthenticationTypes");
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_INFO, "Finished migration for keychain items with invalid authentication types", v5, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v11);
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v7);
  }
  objc_msgSend(v10, "addObject:", v8);

}

__CFString *__102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &stru_1E64A2498;
  if (v2)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);
    v5 = (void *)v4;
    if (v4)
      v6 = (__CFString *)v4;
    else
      v6 = &stru_1E64A2498;
    v3 = v6;

  }
  return v3;
}

BOOL __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const __CFDictionary *v5;
  OSStatus v6;
  _BOOL8 v7;
  NSObject *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD70E0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v10 = v2;
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = SecItemDelete(v5);
    v7 = v6 == 0;
    if (v6)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_63_cold_1();
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __107__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v6, "sharedGroupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_safari_getKeychainItemForSidecar:ofType:groupID:fromRecentlyDeleted:", v7, a2, v8, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_safari_addKeychainItem:ofType:toSidecarDictionary:", v9, a2, *(_QWORD *)(a1 + 48));
}

void __106__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  objc_msgSend(v6, "sharedGroupID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_safari_getKeychainItemForSidecar:ofType:groupID:fromRecentlyDeleted:", v7, a2, v8, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_safari_addKeychainItem:ofType:toSidecarDictionary:", v9, a2, *(_QWORD *)(a1 + 48));
}

WBSSavedAccountSidecar *__88__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsInPersonalKeychain__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSSavedAccountSidecar *v11;
  void *v12;
  WBSSavedAccountSidecar *v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD68F8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [WBSSavedAccountSidecar alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v11, "initWithUser:protectionSpace:dictionaryRepresentation:", v12, v10, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

WBSSavedAccountSidecar *__103__NSURLCredentialStorage_SafariCoreExtras__safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSSavedAccountSidecar *v11;
  void *v12;
  WBSSavedAccountSidecar *v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD68F8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [WBSSavedAccountSidecar alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v11, "initWithUser:protectionSpace:dictionaryRepresentation:", v12, v10, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

WBSSavedAccountSharedSidecar *__99__NSURLCredentialStorage_SafariCoreExtras__safari_allSharedSidecarsForGroupID_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSSavedAccountSharedSidecar *v11;
  void *v12;
  WBSSavedAccountSharedSidecar *v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD68F8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [WBSSavedAccountSharedSidecar alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WBSSavedAccountSharedSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v11, "initWithUser:protectionSpace:dictionaryRepresentation:", v12, v10, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

WBSSavedAccountSidecar *__101__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsForGroupID_fromRecentlyDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSSavedAccountSidecar *v11;
  void *v12;
  WBSSavedAccountSidecar *v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CD68F8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_safari_sidecarDictionaryFromData:user:domain:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_safari_protectionSpaceFromKeychainDictionary:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [WBSSavedAccountSidecar alloc];
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:](v11, "initWithUser:protectionSpace:dictionaryRepresentation:", v12, v10, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __114__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasswordToPersonalKeychain_withNewUsername___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a3;
  if (a2 != 1)
  {
    v8 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:withNewUsername:fromRecentlyDeleted:", v7, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "isRecentlyDeleted"));
    v7 = v8;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *a4 = 1;
  }

}

void __94__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPassword_toGroupWithID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  if (a2 == 1)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "_safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
  }
  else
  {
    if (a2)
      goto LABEL_8;
    v7 = objc_msgSend(*(id *)(a1 + 32), "length");
    v8 = *(void **)(a1 + 40);
    if (v7)
      v9 = objc_msgSend(v8, "_safari_copyPersonalSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
    else
      v9 = objc_msgSend(v8, "_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:forGroupWithID:fromRecentlyDeleted:", v10, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v9;
LABEL_8:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a4 = 1;

}

void __97__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskeyToPersonalKeychain___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a3;
  if (a2 != 1)
  {
    v8 = v7;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:fromRecentlyDeleted:", v7, objc_msgSend(*(id *)(a1 + 40), "isRecentlyDeleted"));
    v7 = v8;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;
  }

}

void __93__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskey_toGroupWithID___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;

  v12 = a3;
  if (a2 == 1)
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "_safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted"));
  }
  else
  {
    if (a2)
      goto LABEL_8;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = objc_msgSend(*(id *)(a1 + 56), "isRecentlyDeleted");
    if (v7)
      v11 = objc_msgSend(v8, "_safari_copyPersonalSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:", v12, v7, v9, v10);
    else
      v11 = objc_msgSend(v8, "_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:forGroupWithID:fromRecentlyDeleted:", v12, v9, v10);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
LABEL_8:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a4 = 1;

}

void __97__NSURLCredentialStorage_SafariCoreExtras__safari_test_purgeKeychainItemsFromTestingAccessGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OSStatus v9;
  OSStatus v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x1E0CD6898];
  v19[0] = *MEMORY[0x1E0CD6C98];
  v19[1] = v6;
  v20[0] = v4;
  v20[1] = v5;
  v7 = *MEMORY[0x1E0CD6B88];
  v8 = *MEMORY[0x1E0CD70A8];
  v19[2] = *MEMORY[0x1E0CD6B80];
  v19[3] = v8;
  v20[2] = v7;
  v20[3] = MEMORY[0x1E0C9AAB0];
  v9 = SecItemDelete((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  if (v9)
  {
    v10 = v9;
    if (v9 == -25300)
    {
      v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543618;
        v14 = v4;
        v15 = 2114;
        v16 = v5;
        _os_log_impl(&dword_1B2621000, v11, OS_LOG_TYPE_DEFAULT, "No %{public}@ entries found to delete in %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 138543874;
        v14 = v4;
        v15 = 2114;
        v16 = v5;
        v17 = 2048;
        v18 = v10;
        _os_log_error_impl(&dword_1B2621000, v12, OS_LOG_TYPE_ERROR, "Failed to delete all %{public}@ entries in %{public}@, result %ld", (uint8_t *)&v13, 0x20u);
      }
    }
  }

}

void __102__NSURLCredentialStorage_SafariCoreExtras___safari_migrateKeychainItemsWithInvalidAuthenticationTypes__block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to delete keychain item with invalid authentication type: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
