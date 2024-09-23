@implementation NSURLCredentialStorage(SafariCoreExtras)

- (uint64_t)safari_allRecentlyDeletedPasswordCredentialItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, 0, 1);
}

- (uint64_t)safari_allPasswordCredentialItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, 0, 0);
}

- (id)_safari_allCredentialItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:
{
  id v7;
  id v8;
  const __CFString *v9;
  BOOL v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  const void *v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  OSStatus v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _QWORD v36[2];
  _QWORD v37[2];
  CFTypeRef result[8];
  _BYTE buf[24];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3 == 2)
  {
    v8 = (id)*MEMORY[0x1E0CD6CC0];
    v9 = CFSTR("com.apple.webkit.webauthn.testing");
    v10 = shouldUseTestingAccessGroups == 0;
    v11 = CFSTR("com.apple.webkit.webauthn-recently-deleted.testing");
    if (!shouldUseTestingAccessGroups)
      v9 = CFSTR("com.apple.webkit.webauthn");
    v12 = CFSTR("com.apple.webkit.webauthn-recently-deleted");
  }
  else
  {
    if (a3 != 1)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      goto LABEL_17;
    }
    v8 = (id)*MEMORY[0x1E0CD6CB8];
    v9 = CFSTR("com.apple.cfnetwork.testing");
    v10 = shouldUseTestingAccessGroups == 0;
    v11 = CFSTR("com.apple.cfnetwork-recently-deleted.testing");
    if (!shouldUseTestingAccessGroups)
      v9 = CFSTR("com.apple.cfnetwork");
    v12 = CFSTR("com.apple.cfnetwork-recently-deleted");
  }
  if (v10)
    v11 = (__CFString *)v12;
  if (!a5)
    v11 = (__CFString *)v9;
  v13 = v11;
  v14 = (const void *)*MEMORY[0x1E0CD6898];
  result[0] = *(CFTypeRef *)MEMORY[0x1E0CD6C98];
  result[1] = v14;
  *(_QWORD *)buf = v8;
  *(_QWORD *)&buf[8] = v13;
  v15 = *MEMORY[0x1E0CD6B80];
  v16 = (const void *)*MEMORY[0x1E0CD6F30];
  result[2] = *(CFTypeRef *)MEMORY[0x1E0CD6B80];
  result[3] = v16;
  v17 = *MEMORY[0x1E0CD6F38];
  *(_QWORD *)&buf[16] = MEMORY[0x1E0C9AAB0];
  v40 = v17;
  v18 = (const void *)*MEMORY[0x1E0CD7018];
  result[4] = *(CFTypeRef *)MEMORY[0x1E0CD7010];
  result[5] = v18;
  v41 = MEMORY[0x1E0C9AAB0];
  v42 = MEMORY[0x1E0C9AAB0];
  v19 = (const void *)*MEMORY[0x1E0CD70A8];
  result[6] = *(CFTypeRef *)MEMORY[0x1E0CD7020];
  result[7] = v19;
  v43 = MEMORY[0x1E0C9AAB0];
  v44 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, result, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  if (objc_msgSend(v7, "length"))
  {
    v22 = *MEMORY[0x1E0CD6B60];
    v36[0] = v15;
    v36[1] = v22;
    v37[0] = MEMORY[0x1E0C9AAA0];
    v37[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addEntriesFromDictionary:", v23);

  }
LABEL_17:

  result[0] = 0;
  v24 = SecItemCopyMatching((CFDictionaryRef)v21, result);
  if (v24)
  {
    if (v24 == -25300)
    {
      v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *MEMORY[0x1E0CD6898];
        v27 = v25;
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v28;
        _os_log_impl(&dword_1B2621000, v27, OS_LOG_TYPE_DEFAULT, "No credential items found in access group %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v34 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:].cold.1(v34);
    }
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v29 = (void *)result[0];
    v30 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = objc_msgSend(v29, "count");
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6898]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v33;
      _os_log_impl(&dword_1B2621000, v31, OS_LOG_TYPE_DEFAULT, "Fetched %li credential items from access group %{public}@", buf, 0x16u);

    }
  }

  return v29;
}

- (id)_safari_allSidecarItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:
{
  id v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  __CFString *v11;
  const void *v12;
  const void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  OSStatus v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  __CFString *v46;
  id v47;
  CFTypeRef result[6];
  _BYTE buf[24];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = *MEMORY[0x1E0CD6CB8];
  v9 = (const void *)*MEMORY[0x1E0CD6F30];
  result[0] = *(CFTypeRef *)MEMORY[0x1E0CD6C98];
  result[1] = v9;
  v10 = *MEMORY[0x1E0CD6F38];
  *(_QWORD *)buf = v8;
  *(_QWORD *)&buf[8] = v10;
  v11 = (__CFString *)MEMORY[0x1E0C9AAB0];
  v12 = (const void *)*MEMORY[0x1E0CD7018];
  result[2] = *(CFTypeRef *)MEMORY[0x1E0CD7010];
  result[3] = v12;
  *(_QWORD *)&buf[16] = MEMORY[0x1E0C9AAB0];
  v50 = MEMORY[0x1E0C9AAB0];
  v13 = (const void *)*MEMORY[0x1E0CD70A8];
  result[4] = *(CFTypeRef *)MEMORY[0x1E0CD7020];
  result[5] = v13;
  v51 = MEMORY[0x1E0C9AAB0];
  v52 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, result, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (objc_msgSend(v7, "length"))
  {
    if (a3 == 1)
    {
      v42 = *MEMORY[0x1E0CD6898];
      v27 = CFSTR("com.apple.password-manager.testing");
      v28 = CFSTR("com.apple.password-manager-recently-deleted.testing");
      if (!shouldUseTestingAccessGroups)
      {
        v27 = CFSTR("com.apple.password-manager");
        v28 = CFSTR("com.apple.password-manager-recently-deleted");
      }
      if (!a5)
        v28 = (__CFString *)v27;
      v18 = v28;
      v19 = *MEMORY[0x1E0CD6B80];
      v45 = v18;
      v46 = (__CFString *)MEMORY[0x1E0C9AAA0];
      v20 = *MEMORY[0x1E0CD6B60];
    }
    else
    {
      if (a3)
        goto LABEL_21;
      v42 = *MEMORY[0x1E0CD6898];
      v16 = CFSTR("com.apple.password-manager.personal.testing");
      v17 = CFSTR("com.apple.password-manager.personal-recently-deleted.testing");
      if (!shouldUseTestingAccessGroups)
      {
        v16 = CFSTR("com.apple.password-manager.personal");
        v17 = CFSTR("com.apple.password-manager.personal-recently-deleted");
      }
      if (!a5)
        v17 = (__CFString *)v16;
      v18 = v17;
      v19 = *MEMORY[0x1E0CD6B80];
      v45 = v18;
      v46 = v11;
      v20 = *MEMORY[0x1E0CD6AC0];
    }
    v43 = v19;
    v44 = v20;
    v47 = v7;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = 3;
  }
  else
  {
    v21 = *MEMORY[0x1E0CD6B80];
    v45 = v11;
    v22 = *MEMORY[0x1E0CD6898];
    v42 = v21;
    v43 = v22;
    v23 = CFSTR("com.apple.password-manager.testing");
    v24 = CFSTR("com.apple.password-manager-recently-deleted.testing");
    if (!shouldUseTestingAccessGroups)
    {
      v23 = CFSTR("com.apple.password-manager");
      v24 = CFSTR("com.apple.password-manager-recently-deleted");
    }
    if (!a5)
      v24 = (__CFString *)v23;
    v18 = v24;
    v46 = v18;
    v25 = (void *)MEMORY[0x1E0C99D80];
    v26 = 2;
  }
  objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", &v45, &v42, v26, v42, v43, v44, v45, v46, v47);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addEntriesFromDictionary:", v29);

LABEL_21:
  result[0] = 0;
  v30 = SecItemCopyMatching((CFDictionaryRef)v15, result);
  if (v30)
  {
    if (v30 == -25300)
    {
      v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *MEMORY[0x1E0CD6898];
        v33 = v31;
        objc_msgSend(v15, "objectForKeyedSubscript:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v34;
        _os_log_impl(&dword_1B2621000, v33, OS_LOG_TYPE_DEFAULT, "No sidecar items found in access group %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v40 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:].cold.1(v40);
    }
    v35 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v35 = (void *)result[0];
    v36 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v36;
      v38 = objc_msgSend(v35, "count");
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6898]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl(&dword_1B2621000, v37, OS_LOG_TYPE_DEFAULT, "Fetched %li sidecar items from access group %{public}@", buf, 0x16u);

    }
  }

  return v35;
}

- (id)safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "_safari_allRecentlyDeletedPersonalSidecarEntriesInPersonalKeychain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__NSURLCredentialStorage_SafariCoreExtras__safari_allRecentlyDeletedPersonalSidecarsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E649D310;
  v5[4] = a1;
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_allPersonalSidecarsInPersonalKeychain
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "_safari_allPersonalSidecarEntriesInPersonalKeychain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsInPersonalKeychain__block_invoke;
  v5[3] = &unk_1E649D310;
  v5[4] = a1;
  objc_msgSend(v2, "safari_mapAndFilterObjectsUsingBlock:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_safari_allPersonalSidecarEntriesInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, 0, 0);
}

- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarEntriesInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, 0, 1);
}

- (uint64_t)_safari_moveKeychainItemsWithPersistentIdentifiers:()SafariCoreExtras toAccessGroup:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = *MEMORY[0x1E0CD6898];
  v42[0] = v6;
  v7 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v10)
  {
    v11 = v10;
    v25 = v6;
    v12 = *(_QWORD *)v27;
    v13 = *MEMORY[0x1E0CD70E0];
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v38 = v13;
        objc_msgSend(v15, "objectForKeyedSubscript:", v13, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if ((SecItemUpdateWithError() & 1) == 0)
        {
          v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
          v6 = v25;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v20 = *MEMORY[0x1E0CD68F8];
            v21 = v18;
            objc_msgSend(v15, "objectForKeyedSubscript:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(0, "safari_privacyPreservingDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v31 = v22;
            v32 = 2112;
            v33 = v23;
            v34 = 2112;
            v35 = v25;
            v36 = 2112;
            v37 = v24;
            _os_log_error_impl(&dword_1B2621000, v21, OS_LOG_TYPE_ERROR, "Unable to move credential %@ (%@) to access group %@: %@", buf, 0x2Au);

          }
          CFRelease(0);

          v7 = 0;
          goto LABEL_13;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      if (v11)
        continue;
      break;
    }
    v7 = 1;
    v6 = v25;
  }
LABEL_13:

  return v7;
}

- (BOOL)safari_moveCredentialTypesToRecentlyDeleted:()SafariCoreExtras onSavedAccount:
{
  id v6;
  _BOOL8 v7;

  v6 = a4;
  v7 = ((a3 & objc_msgSend(v6, "credentialTypes") & 1) == 0
     || objc_msgSend(a1, "_safari_movePasswordCredentialsFromSavedAccountToRecentlyDeleted:", v6)
     && objc_msgSend(a1, "_safari_movePasswordSidecarsFromSavedAccountToRecentlyDeleted:", v6))
    && ((a3 & objc_msgSend(v6, "credentialTypes") & 2) == 0
     || objc_msgSend(a1, "_safari_movePasskeyCredentialFromSavedAccountToRecentlyDeleted:", v6)
     && objc_msgSend(a1, "_safari_movePasskeySidecarsFromSavedAccountToRecentlyDeleted:", v6));

  return v7;
}

- (uint64_t)_safari_movePasswordCredentialsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;

  v4 = a3;
  objc_msgSend(a1, "_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "protectionSpaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 >= v8)
  {
    if (shouldUseTestingAccessGroups)
      v10 = CFSTR("com.apple.cfnetwork-recently-deleted.testing");
    else
      v10 = CFSTR("com.apple.cfnetwork-recently-deleted");
    v9 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v5, v10);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)_safari_movePasswordSidecarsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_safari_moveSidecarItemsByTypeToRecentlyDeleted:savedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_movePasskeyCredentialFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldUseTestingAccessGroups)
      v5 = CFSTR("com.apple.webkit.webauthn-recently-deleted.testing");
    else
      v5 = CFSTR("com.apple.webkit.webauthn-recently-deleted");
    v6 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_safari_movePasskeySidecarsFromSavedAccountToRecentlyDeleted:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_safari_moveSidecarItemsByTypeToRecentlyDeleted:savedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_moveSidecarItemsByTypeToRecentlyDeleted:()SafariCoreExtras savedAccount:
{
  id v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;

  v6 = a3;
  v7 = objc_msgSend(a4, "isSavedInPersonalKeychain");
  v8 = CFSTR("com.apple.password-manager.personal-recently-deleted.testing");
  if (shouldUseTestingAccessGroups)
  {
    v9 = CFSTR("com.apple.password-manager-recently-deleted.testing");
  }
  else
  {
    v8 = CFSTR("com.apple.password-manager.personal-recently-deleted");
    v9 = CFSTR("com.apple.password-manager-recently-deleted");
  }
  if (v7)
    v8 = (__CFString *)v9;
  v10 = v8;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E64CE2F8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v11, v10);

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E64CE310);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldUseTestingAccessGroups)
      v14 = CFSTR("com.apple.password-manager-recently-deleted.testing");
    else
      v14 = CFSTR("com.apple.password-manager-recently-deleted");
    v15 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)safari_recoverSavedAccountFromRecentlyDeleted:()SafariCoreExtras
{
  id v4;
  int v5;
  _BOOL8 v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "credentialTypes");
  v6 = ((v5 & 1) == 0
     || objc_msgSend(a1, "_safari_recoverPasswordCredentialsFromRecentlyDeletedSavedAccount:", v4)
     && objc_msgSend(a1, "_safari_recoverPasswordSidecarsFromRecentlyDeletedSavedAccount:", v4))
    && ((v5 & objc_msgSend(v4, "credentialTypes") & 2) == 0
     || objc_msgSend(a1, "_safari_recoverPasskeyCredentialFromRecentlyDeletedSavedAccount:", v4)
     && objc_msgSend(a1, "_safari_recoverPasskeySidecarsFromRecentlyDeletedSavedAccount:", v4));

  return v6;
}

- (uint64_t)_safari_recoverPasswordCredentialsFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;

  v4 = a3;
  objc_msgSend(a1, "_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v4, "protectionSpaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 >= v8)
  {
    if (shouldUseTestingAccessGroups)
      v10 = CFSTR("com.apple.cfnetwork.testing");
    else
      v10 = CFSTR("com.apple.cfnetwork");
    v9 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v5, v10);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)_safari_recoverPasswordSidecarsFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_safari_recoverSidecarItemsByType:forRecentlyDeletedSavedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_recoverPasskeyCredentialFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v8[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldUseTestingAccessGroups)
      v5 = CFSTR("com.apple.webkit.webauthn.testing");
    else
      v5 = CFSTR("com.apple.webkit.webauthn");
    v6 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_safari_recoverPasskeySidecarsFromRecentlyDeletedSavedAccount:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "_safari_recoverSidecarItemsByType:forRecentlyDeletedSavedAccount:", v5, v4);

  return v6;
}

- (uint64_t)_safari_recoverSidecarItemsByType:()SafariCoreExtras forRecentlyDeletedSavedAccount:
{
  id v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;

  v6 = a3;
  v7 = objc_msgSend(a4, "isSavedInPersonalKeychain");
  v8 = CFSTR("com.apple.password-manager.personal.testing");
  if (shouldUseTestingAccessGroups)
  {
    v9 = CFSTR("com.apple.password-manager.testing");
  }
  else
  {
    v8 = CFSTR("com.apple.password-manager.personal");
    v9 = CFSTR("com.apple.password-manager");
  }
  if (v7)
    v8 = (__CFString *)v9;
  v10 = v8;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E64CE2F8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v11, v10);

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E64CE310);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (shouldUseTestingAccessGroups)
      v14 = CFSTR("com.apple.password-manager.testing");
    else
      v14 = CFSTR("com.apple.password-manager");
    v15 = objc_msgSend(a1, "_safari_moveKeychainItemsWithPersistentIdentifiers:toAccessGroup:", v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:()SafariCoreExtras
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  const __CFDictionary *v8;
  uint64_t v9;
  uint64_t i;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  OSStatus v15;
  OSStatus v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v22;
  id v23;
  CFTypeRef result;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "protectionSpaces");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v6 = 138412802;
    v22 = v6;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        v11 = v8;
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v3, "user", v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "sharedGroupID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        queryForUserInProtectionSpace(v13, v12, 1, v14, objc_msgSend(v3, "isRecentlyDeleted"));
        v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        result = 0;
        v15 = SecItemCopyMatching(v8, &result);
        if (v15)
        {
          v16 = v15;
          v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            continue;
          v18 = v17;
          objc_msgSend(v3, "user");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "host");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v22;
          v30 = v19;
          v31 = 2112;
          v32 = v20;
          v33 = 2048;
          v34 = v16;
          _os_log_error_impl(&dword_1B2621000, v18, OS_LOG_TYPE_ERROR, "Unable to query for password credential item for %@ (%@): %ld", buf, 0x20u);

        }
        else
        {
          v19 = (void *)result;
          objc_msgSend(v23, "addObject:", result);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (!v7)
      {

        break;
      }
    }
  }

  return v23;
}

- (id)_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:()SafariCoreExtras
{
  id v3;
  const __CFDictionary *v4;
  NSObject *v5;
  void *v6;
  CFTypeRef result;

  v3 = a3;
  queryForPasskeyFromSavedAccount(v3);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  if (SecItemCopyMatching(v4, &result))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:].cold.1(v5, v3);
    v6 = 0;
  }
  else
  {
    v6 = (void *)result;
  }

  return v6;
}

- (BOOL)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  const __CFDictionary *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFDictionary *v35;
  OSStatus v36;
  _BOOL8 v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const __CFDictionary *query;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  _QWORD v53[4];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canCurrentUserEditSavedAccountsInGroupWithID:", v9);

  if ((v11 & 1) == 0)
  {
    if (!shouldUseTestingAccessGroups)
    {
      v39 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_setCredential:forHTMLFormProtectionSpace:forGroupID:].cold.3();
    }
    goto LABEL_24;
  }
  if (objc_msgSend(v7, "persistence") != 3)
    goto LABEL_24;
  objc_msgSend(v8, "authenticationMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C92B40]) & 1) == 0)
  {

    goto LABEL_24;
  }
  v13 = objc_msgSend(v8, "isProxy");

  if ((v13 & 1) != 0)
  {
LABEL_24:
    v37 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v7, "user");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  queryForUserInProtectionSpace(v14, v8, 0, v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  v19 = *MEMORY[0x1E0CD6898];
  if (v18)
    -[NSURLCredentialStorage(SafariCoreExtras) safari_setCredential:forHTMLFormProtectionSpace:forGroupID:].cold.2(v17, v16, *MEMORY[0x1E0CD6898]);
  query = (const __CFDictionary *)v16;
  v53[0] = *MEMORY[0x1E0CD70D8];
  objc_msgSend(v7, "password");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "dataUsingEncoding:", 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v46;
  v44 = *MEMORY[0x1E0CD6A90];
  v53[1] = *MEMORY[0x1E0CD6A90];
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "user");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (%@)"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v23;
  v53[2] = *MEMORY[0x1E0CD69A0];
  _WBSLocalizedString(CFSTR("Web form password"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  v45 = v19;
  v53[3] = v19;
  if (shouldUseTestingAccessGroups)
    v26 = CFSTR("com.apple.cfnetwork.testing");
  else
    v26 = CFSTR("com.apple.cfnetwork");
  v54[2] = v24;
  v54[3] = v26;
  v27 = (void *)MEMORY[0x1E0C99D80];
  v28 = v26;
  objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (const __CFDictionary *)objc_msgSend(v29, "mutableCopy");
  v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v41 = v31;
    -[__CFDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v45);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543619;
    v50 = v42;
    v51 = 2113;
    v52 = v43;
    _os_log_debug_impl(&dword_1B2621000, v41, OS_LOG_TYPE_DEBUG, "Attributes for credential SecItemUpdate: { accessGroup: %{public}@, label: %{private}@ }", buf, 0x16u);

  }
  objc_msgSend(v7, "user");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v7, "user");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CD68F8]);

  }
  if (SecItemUpdate(query, v30))
  {
    v34 = (void *)-[__CFDictionary mutableCopy](v30, "mutableCopy");
    objc_msgSend(v34, "addEntriesFromDictionary:", query);
    v35 = v34;

    v36 = SecItemAdd(v35, 0);
    v37 = v36 == 0;
    if (v36)
    {
      v38 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_setCredential:forHTMLFormProtectionSpace:forGroupID:].cold.1();
      v37 = 0;
    }
    v30 = v35;
  }
  else
  {
    v37 = 1;
  }

LABEL_25:
  return v37;
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  const __CFDictionary *v15;
  OSStatus v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const __CFDictionary *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  CFTypeRef v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canCurrentUserEditSavedAccountsInGroupWithID:", v11);

  if ((v13 & 1) != 0)
  {
    queryForUserInProtectionSpace(v9, v10, 1, v11, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (const __CFDictionary *)objc_msgSend(v14, "mutableCopy");

    v27 = 0;
    v16 = SecItemCopyMatching(v15, &v27);
    if (v16 != -25300)
    {
      if (v16)
      {
        v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.1();
      }
      else
      {
        v17 = (void *)v27;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = *MEMORY[0x1E0CD70E0];
          objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v19)
          {
            v28 = v18;
            v29[0] = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (const __CFDictionary *)objc_msgSend(v21, "mutableCopy");

            if (SecItemDelete(v22))
            {
              v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.3();
            }

          }
          else
          {
            v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.2();
          }

        }
      }
    }

  }
  else if (!shouldUseTestingAccessGroups)
  {
    v24 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasswordCredentialForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.4();
  }

}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFDictionary *v24;
  NSObject *v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  CFTypeRef result;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canCurrentUserEditSavedAccountsInGroupWithID:", v11);

  if ((v13 & 1) != 0)
  {
    v14 = v9;
    queryForUserInProtectionSpace(v14, v10, 1, v11, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
    result = 0;
    if (SecItemCopyMatching((CFDictionaryRef)v16, &result))
    {
      v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.2();
    }
    else
    {
      v19 = (void *)result;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v30 = 0;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __152__NSURLCredentialStorage_SafariCoreExtras__safari_deleteCredentialWithEmptyServerHostForUser_forHTMLFormProtectionSpace_forGroupID_fromRecentlyDeleted___block_invoke;
        v26[3] = &unk_1E649D258;
        v26[4] = &v27;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v26);
        v20 = *MEMORY[0x1E0CD6CB8];
        v21 = *MEMORY[0x1E0CD70E0];
        v32[0] = *MEMORY[0x1E0CD6C98];
        v32[1] = v21;
        v22 = v28[3];
        v33[0] = v20;
        v33[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (const __CFDictionary *)objc_msgSend(v23, "mutableCopy");

        if (SecItemDelete(v24))
        {
          v25 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.1();
        }

        _Block_object_dispose(&v27, 8);
      }

    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    v18 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteCredentialWithEmptyServerHostForUser:forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.3();
  }

}

- (id)_formattedLabelWithHost:()SafariCoreExtras user:
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  OSStatus v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  OSStatus v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[4];
  _QWORD v42[4];
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  queryForUserInProtectionSpace(v8, v7, 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const __CFDictionary *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v6, "password");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = SecItemCopyMatching(v10, 0);
    if (v12)
    {
      if (v12 == -25300)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = v13;
          objc_msgSend(v6, "user");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "host");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v46 = v15;
          v47 = 2113;
          v48 = v16;
          _os_log_impl(&dword_1B2621000, v14, OS_LOG_TYPE_INFO, "Credential for '%{private}@' in protection space %{private}@ doesn't exist.", buf, 0x16u);

        }
        objc_msgSend(a1, "safari_setCredential:forHTMLFormProtectionSpace:forGroupID:", v6, v7, &stru_1E64A2498);
      }
      else
      {
        v36 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.2();
      }
    }
    else
    {
      v18 = +[WBSFeatureAvailability supportsURLCredentialStorageAccessControlGroups](WBSFeatureAvailability, "supportsURLCredentialStorageAccessControlGroups");
      v19 = WBS_LOG_CHANNEL_PREFIXKeychain();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.6(v20);
        v21 = *MEMORY[0x1E0CD6988];
        -[__CFDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", CFSTR("default"), *MEMORY[0x1E0CD6988]);
        v22 = *MEMORY[0x1E0CD68F8];
        -[__CFDictionary removeObjectForKey:](v10, "removeObjectForKey:", *MEMORY[0x1E0CD68F8]);
        v40 = v21;
        v43 = v21;
        v44 = &stru_1E64A2498;
        v23 = SecItemUpdate(v10, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        if (v23 != -25300 && v23)
        {
          v37 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.3();
        }
        else
        {
          v38 = v22;
          v24 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.5(v24, v6);
          v41[0] = *MEMORY[0x1E0CD70D8];
          objc_msgSend(v6, "password");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "dataUsingEncoding:", 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v25;
          v41[1] = *MEMORY[0x1E0CD6A90];
          objc_msgSend(v7, "host");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "user");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_formattedLabelWithHost:user:", v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = v28;
          v41[2] = *MEMORY[0x1E0CD69A0];
          _WBSLocalizedString(CFSTR("Web form password"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v41[3] = v40;
          v42[2] = v29;
          v42[3] = CFSTR("default");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v30, "mutableCopy");

          objc_msgSend(v6, "user");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v6, "user");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, v38);

            objc_msgSend(v6, "user");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v34, v38);

          }
          -[__CFDictionary removeObjectForKey:](v10, "removeObjectForKey:", v40);
          if (SecItemUpdate(v10, (CFDictionaryRef)v31))
          {
            v35 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.4();
          }

        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.7();
      }
    }
  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_setDefaultCredential:forHTMLFormProtectionSpace:].cold.1(v17, v6);
  }

}

- (id)safari_allSafariCredentials
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WBSFeatureAvailability supportsURLCredentialStorageAccessControlGroups](WBSFeatureAvailability, "supportsURLCredentialStorageAccessControlGroups"))
  {
    if (shouldUseTestingAccessGroups)
      v3 = CFSTR("com.apple.cfnetwork.testing");
    else
      v3 = CFSTR("com.apple.cfnetwork");
    objc_msgSend(a1, "_allCredentialsWithAccessControlGroup:includeLegacyKeychain:", v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "allCredentials");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v2, "timeIntervalSinceNow");
    v13 = 136446466;
    v14 = "all_credentials_fetch";
    v15 = 2048;
    v16 = -v8;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_INFO, "#perf - %{public}s: %f", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v5, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA70];
  v11 = v9;

  return v11;
}

- (uint64_t)safari_allPasswordCredentialItemsFromGroupID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, 0);
}

- (uint64_t)safari_allRecentlyDeletedPasskeyCredentialItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 2, 0, 1);
}

- (uint64_t)safari_allRecentlyDeletedPasswordCredentialItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, 1);
}

- (uint64_t)safari_allRecentlyDeletedPasskeyCredentialItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allCredentialItemsOfType:groupID:fromRecentlyDeleted:", 2, a3, 1);
}

- (uint64_t)_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:()SafariCoreExtras
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  CFTypeRef cf;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0CD6988];
  v11[0] = &stru_1E64A2498;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cf = 0;
  v6 = SecItemUpdateWithError();

  if ((v6 & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_removeDefaultCommentFromKeychainItemsMatchingQuery:].cold.1((uint64_t)&cf, v7);
    CFRelease(cf);
  }

  return v6;
}

- (void)safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler:()SafariCoreExtras
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __123__NSURLCredentialStorage_SafariCoreExtras__safari_migrateKeychainItemsWithInvalidAuthenticationTypesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649B6B0;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_safari_migrateKeychainItemsWithInvalidAuthenticationTypes
{
  NSObject *v6;
  void *v7;
  id v8;

  v6 = a2;
  v7 = (void *)OUTLINED_FUNCTION_29();
  *(_DWORD *)a1 = 138412290;
  *a4 = v7;
  v8 = v7;
  _os_log_error_impl(&dword_1B2621000, v6, OS_LOG_TYPE_ERROR, "kSecAttrAccount value for keychain item was not of type string, got type: %@", a1, 0xCu);

}

- (id)_safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasswordOnSavedAccount___block_invoke;
  v11[3] = &unk_1E649D2E8;
  v11[4] = a1;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v7, "enumeratePasswordSidecarsWithBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)_safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount:()SafariCoreExtras
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __106__NSURLCredentialStorage_SafariCoreExtras___safari_getSidecarKeychainItemsByTypeForPasskeyOnSavedAccount___block_invoke;
  v11[3] = &unk_1E649D2E8;
  v11[4] = a1;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v7, "enumeratePasskeySidecarsWithBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (id)_safari_getKeychainItemForSidecar:()SafariCoreExtras ofType:groupID:fromRecentlyDeleted:
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  const __CFDictionary *v14;
  OSStatus v15;
  void *v16;
  NSObject *v17;
  CFTypeRef result;

  v9 = a3;
  if (a4)
    v10 = 1936220530;
  else
    v10 = 1835626085;
  v11 = a5;
  objc_msgSend(v9, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(v10, v12, v13, v11, a6, 1);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  result = 0;
  v15 = SecItemCopyMatching(v14, &result);
  if (v15 != -25300 && v15)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_getKeychainItemForSidecar:ofType:groupID:fromRecentlyDeleted:].cold.1(v17, v9);
    v16 = 0;
  }
  else
  {
    v16 = (void *)result;
  }

  return v16;
}

- (void)_safari_addKeychainItem:()SafariCoreExtras ofType:toSidecarDictionary:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);

    }
    objc_msgSend(v9, "addObject:", v11);

  }
}

- (id)safari_allSharedSidecarsForGroupID:()SafariCoreExtras fromRecentlyDeleted:
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__NSURLCredentialStorage_SafariCoreExtras__safari_allSharedSidecarsForGroupID_fromRecentlyDeleted___block_invoke;
  v8[3] = &unk_1E649D338;
  v8[4] = a1;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)safari_allPersonalSidecarsForGroupID:()SafariCoreExtras fromRecentlyDeleted:
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__NSURLCredentialStorage_SafariCoreExtras__safari_allPersonalSidecarsForGroupID_fromRecentlyDeleted___block_invoke;
  v8[3] = &unk_1E649D310;
  v8[4] = a1;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_safari_protectionSpaceFromKeychainDictionary:()SafariCoreExtras
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0C92C70];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AC8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6AD0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WBSHTTPProtocolFromSecAttrProtocolValue(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithHost:port:protocol:realm:authenticationMethod:", v6, v8, v10, 0, *MEMORY[0x1E0C92B40]);

  return v11;
}

- (id)_safari_dataFromSidecarDictionary:()SafariCoreExtras user:domain:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v14 = v12;
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v18 = v7;
      v19 = 2113;
      v20 = v8;
      v21 = 2114;
      v22 = v15;
      _os_log_fault_impl(&dword_1B2621000, v14, OS_LOG_TYPE_FAULT, "Unable to archive sidecar for %{private}@ (%{private}@): %{public}@", buf, 0x20u);

    }
  }

  return v9;
}

- (id)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;

  v7 = a4;
  v8 = a5;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (!v9)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_sidecarDictionaryFromData:user:domain:].cold.1(v12);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_sidecarDictionaryFromData:user:domain:].cold.2();
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v11 = v9;
LABEL_9:

  return v11;
}

- (void)safari_setSidecar:()SafariCoreExtras credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "canCurrentUserEditSavedAccountsInGroupWithID:", v15);

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = a1;
      v20 = v18;
      v21 = 1835626085;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = v23;
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "user");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "host");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543874;
          v30 = v26;
          v31 = 2112;
          v32 = v27;
          v33 = 2112;
          v34 = v28;
          _os_log_error_impl(&dword_1B2621000, v24, OS_LOG_TYPE_ERROR, "Attempted to set non-sidecar object of type %{public}@ for %@ (%@)", (uint8_t *)&v29, 0x20u);

        }
        goto LABEL_12;
      }
      v19 = a1;
      v20 = v18;
      v21 = 1936220530;
    }
    objc_msgSend(v19, "_safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:", v20, v21, v13, v14, v15, a7);
LABEL_12:

    goto LABEL_13;
  }
  if (!shouldUseTestingAccessGroups)
  {
    v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.1();
  }
LABEL_13:

}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const __CFDictionary *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  OSStatus v48;
  void *v49;
  const __CFDictionary *v50;
  OSStatus v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const __CFDictionary *v64;
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[4];
  _QWORD v69[4];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "canCurrentUserEditSavedAccountsInGroupWithID:", v17);

  if ((v19 & 1) != 0)
  {
    if (objc_msgSend(v15, "persistence") == 3)
    {
      objc_msgSend(v16, "authenticationMethod");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0C92B40]) & 1) != 0)
      {
        v21 = objc_msgSend(v16, "isProxy");

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v15, "user");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "host");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v14, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
          {
LABEL_29:

            goto LABEL_30;
          }
          objc_msgSend(v15, "user");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(a4, v25, v16, v17, a8, 0);
          v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          if (a4 == 1936220530)
          {
            v33 = (void *)MEMORY[0x1E0CB3940];
            _WBSLocalizedString(CFSTR("Password Manager Shared Metadata: %@ (%@)"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "host");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "user");
            v64 = v26;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "localizedStringWithFormat:", v34, v35, v36);
            v30 = objc_claimAutoreleasedReturnValue();

            v26 = v64;
            v31 = CFSTR("Password Manager Shared Metadata");
          }
          else
          {
            if (a4 != 1835626085)
            {
              v54 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
              {
                v55 = v54;
                objc_msgSend(v16, "host");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "user");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218498;
                v71 = a4;
                v72 = 2112;
                v73 = v56;
                v74 = 2112;
                v75 = v57;
                _os_log_error_impl(&dword_1B2621000, v55, OS_LOG_TYPE_ERROR, "Invalid sidecar type (%lu) while setting sidecar for %@ (%@)", buf, 0x20u);

              }
              goto LABEL_28;
            }
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "host");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "user");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringWithFormat:", CFSTR("Password Manager Metadata: %@ (%@)"), v28, v29);
            v30 = objc_claimAutoreleasedReturnValue();

            v31 = CFSTR("Password Manager Metadata");
          }
          _WBSLocalizedString(v31, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = *MEMORY[0x1E0CD70D8];
          v65 = v24;
          v69[0] = v24;
          v60 = *MEMORY[0x1E0CD6BC8];
          v61 = v38;
          v68[0] = v38;
          v68[1] = v60;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *MEMORY[0x1E0CD6A90];
          v69[1] = v39;
          v69[2] = v30;
          v63 = (void *)v30;
          v41 = *MEMORY[0x1E0CD69A0];
          v59 = v40;
          v68[2] = v40;
          v68[3] = v41;
          v62 = (void *)v37;
          v69[3] = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 4);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v26;
          objc_msgSend(v42, "safari_dictionaryByMergingWithDictionary:", v26);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)objc_msgSend(v44, "mutableCopy");

          v46 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:].cold.4(v46, v45, v59);
          v47 = v45;
          v48 = SecItemAdd((CFDictionaryRef)v45, 0);
          v26 = v43;
          if (!v48)
          {
LABEL_27:

            v24 = v65;
LABEL_28:

            goto LABEL_29;
          }
          if (v48 != -25299)
          {
            v58 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:].cold.1();
            goto LABEL_27;
          }
          v66[0] = v61;
          v66[1] = v60;
          v67[0] = v65;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
          v50 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

          v51 = SecItemUpdate(v43, v50);
          v52 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:].cold.3(v52, v43);
            if (v51)
            {
LABEL_20:
              v53 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                -[NSURLCredentialStorage(SafariCoreExtras) _safari_setSidecarDictionary:type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:].cold.2();
            }
          }
          else if (v51)
          {
            goto LABEL_20;
          }

          goto LABEL_27;
        }
      }
      else
      {

      }
    }
  }
  else if (!shouldUseTestingAccessGroups)
  {
    v32 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.1();
  }
LABEL_30:

}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  const __CFDictionary *v17;
  OSStatus v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFDictionary *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  CFTypeRef v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "canCurrentUserEditSavedAccountsInGroupWithID:", v13);

  if ((v15 & 1) != 0)
  {
    if (a3)
      v16 = 1936220530;
    else
      v16 = 1835626085;
    queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(v16, v11, v12, v13, a7, 1);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v18 = SecItemCopyMatching(v17, &v30);
    if (v18 != -25300)
    {
      if (v18)
      {
        v28 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.1();
      }
      else
      {
        v19 = (void *)v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = *MEMORY[0x1E0CD70E0];
          objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
          {
            v23 = *MEMORY[0x1E0CD6CB8];
            v31[0] = *MEMORY[0x1E0CD6C98];
            v31[1] = v20;
            v32[0] = v23;
            v32[1] = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (const __CFDictionary *)objc_msgSend(v24, "mutableCopy");

            if (SecItemDelete(v25))
            {
              v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.3();
            }

          }
          else
          {
            v29 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.2();
          }

        }
      }
    }

  }
  else if (!shouldUseTestingAccessGroups)
  {
    v27 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteSidecarOfType:forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:].cold.4();
  }

}

- (uint64_t)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:", a3, 0);
}

- (uint64_t)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFDictionary *v11;
  void *v12;
  void *v13;
  OSStatus v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  CFTypeRef *v30;
  CFTypeRef result[3];
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  OSStatus v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v25, "protectionSpaces");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v34;
    v24 = *MEMORY[0x1E0CD6B80];
    v23 = *MEMORY[0x1E0CD6B60];
    v7 = *MEMORY[0x1E0CD6CB8];
    v8 = *MEMORY[0x1E0CD6C98];
    v9 = *MEMORY[0x1E0CD70E0];
    v21 = *MEMORY[0x1E0CD68F8];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        queryForPasswordFromSavedAccountAndProtectionSpace(v25, *(void **)(*((_QWORD *)&v33 + 1) + 8 * i), 1);
        v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        result[0] = 0;
        if (SecItemCopyMatching(v11, result))
        {
          v16 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:].cold.2();
          goto LABEL_22;
        }
        v12 = (void *)result[0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasswordToPersonalKeychain:withNewUsername:].cold.1(v17);

          goto LABEL_22;
        }
        v13 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v24);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v23);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v8);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v9);
        if (v26)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, v21);
        v14 = SecItemAdd((CFDictionaryRef)v13, 0);
        if (v14)
        {
          v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v38 = v14;
            _os_log_error_impl(&dword_1B2621000, v18, OS_LOG_TYPE_ERROR, "SecItemAdd for password credential from group to personal keychain failed with error %d", buf, 8u);
          }

LABEL_22:
          v15 = 0;
          goto LABEL_23;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend(v25, "_writeFormerlySharedSavedAccountMarkerForCredentialTypes:", 1);
  objc_msgSend(v25, "_copySharablePasswordSidecarDataFromSharedSidecarsToPersonalSidecars");
  result[0] = 0;
  result[1] = result;
  result[2] = (CFTypeRef)0x2020000000;
  v32 = 1;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __114__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasswordToPersonalKeychain_withNewUsername___block_invoke;
  v27[3] = &unk_1E649D360;
  v30 = result;
  v27[4] = a1;
  v28 = v26;
  v29 = v25;
  objc_msgSend(v29, "enumeratePasswordSidecarsWithBlock:", v27);

  _Block_object_dispose(result, 8);
  v15 = 1;
LABEL_23:

  return v15;
}

- (BOOL)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const void *v13;
  void *v14;
  id v15;
  _BOOL8 v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  id v23;
  CFTypeRef *v24;
  CFTypeRef cf;
  CFTypeRef *p_cf;
  uint64_t v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "protectionSpaces");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v8);
          queryForPasswordFromSavedAccountAndProtectionSpace(v6, *(void **)(*((_QWORD *)&v29 + 1) + 8 * i), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:", v12);
          cf = 0;
          v13 = (const void *)SecItemShareWithGroup();
          if (v13)
            CFRelease(v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "hasPasswordSidecars"))
    {
      objc_msgSend(v6, "_clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:", 1);
      objc_msgSend(v6, "_copySharablePasswordSidecarDataFromPersonalSidecarsToSharedSidecars");
      objc_msgSend(v6, "sharedGroupID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      cf = 0;
      p_cf = &cf;
      v27 = 0x2020000000;
      v28 = 1;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __94__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPassword_toGroupWithID___block_invoke;
      v19[3] = &unk_1E649D388;
      v15 = v14;
      v24 = &cf;
      v20 = v15;
      v21 = a1;
      v22 = v7;
      v23 = v6;
      objc_msgSend(v23, "enumeratePasswordSidecarsWithBlock:", v19);
      v16 = *((_BYTE *)p_cf + 24) != 0;

      _Block_object_dispose(&cf, 8);
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPassword:toGroupWithID:].cold.1();
    v16 = 0;
  }

  return v16;
}

- (BOOL)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras
{
  id v4;
  const __CFDictionary *v5;
  NSObject *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  OSStatus v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;
  CFTypeRef result;

  v4 = a3;
  queryForPasskeyFromSavedAccount(v4);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  result = 0;
  if (SecItemCopyMatching(v5, &result))
  {
    v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskeyToPersonalKeychain:].cold.3();
    v7 = 0;
  }
  else
  {
    v8 = (void *)result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD6B80]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD6B60]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CC0], *MEMORY[0x1E0CD6C98]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CD70E0]);
      v10 = SecItemAdd((CFDictionaryRef)v9, 0);
      v7 = v10 == 0;
      if (v10)
      {
        v11 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskeyToPersonalKeychain:].cold.1();
      }
      else
      {
        objc_msgSend(v4, "_writeFormerlySharedSavedAccountMarkerForCredentialTypes:", 2);
        if (objc_msgSend(v4, "hasPasskeySidecars"))
        {
          objc_msgSend(v4, "_copySharablePasskeySidecarDataFromSharedSidecarsToPersonalSidecars");
          v17[0] = 0;
          v17[1] = v17;
          v17[2] = 0x2020000000;
          v18 = 1;
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __97__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskeyToPersonalKeychain___block_invoke;
          v14[3] = &unk_1E649D3B0;
          v16 = v17;
          v14[4] = a1;
          v15 = v4;
          objc_msgSend(v15, "enumeratePasskeySidecarsWithBlock:", v14);

          _Block_object_dispose(v17, 8);
        }
      }

    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskeyToPersonalKeychain:].cold.2(v12);
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:
{
  id v6;
  id v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  _BOOL8 v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    queryForPasskeyFromSavedAccount(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:", v8);
    v25 = 0;
    v9 = (const void *)SecItemShareWithGroup();
    if (v9)
      CFRelease(v9);
    v11 = 1;
    if (objc_msgSend(v6, "hasPasskeySidecars"))
    {
      objc_msgSend(v6, "_clearFormerlySharedSavedAccountMarkerForCredentialTypesIfNecessary:", 2);
      objc_msgSend(v6, "_copySharablePasskeySidecarDataFromPersonalSidecarsToSharedSidecars");
      objc_msgSend(v6, "sharedGroupID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 1;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __93__NSURLCredentialStorage_SafariCoreExtras__safari_copySavedAccountWithPasskey_toGroupWithID___block_invoke;
      v15[3] = &unk_1E649D388;
      v13 = v12;
      v20 = &v21;
      v16 = v13;
      v17 = a1;
      v18 = v7;
      v19 = v6;
      objc_msgSend(v19, "enumeratePasskeySidecarsWithBlock:", v15);
      v11 = *((_BYTE *)v22 + 24) != 0;

      _Block_object_dispose(&v21, 8);
    }

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_copySavedAccountWithPasskey:toGroupWithID:].cold.1();
    v11 = 0;
  }

  return v11;
}

- (uint64_t)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras fromRecentlyDeleted:
{
  return objc_msgSend(a1, "_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:withNewUsername:fromRecentlyDeleted:", a3, 0, a4);
}

- (BOOL)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras withNewUsername:fromRecentlyDeleted:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  OSStatus v20;
  _BOOL8 v21;
  NSObject *v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v9;
    if (!v9)
    {
      objc_msgSend(v8, "user");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "protectionSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v15, v16, 0, a5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    v18 = *MEMORY[0x1E0CD6BC8];
    v24[0] = *MEMORY[0x1E0CD70D8];
    v24[1] = v18;
    v25[0] = v14;
    v25[1] = &unk_1E64CE328;
    v24[2] = *MEMORY[0x1E0CD6AC0];
    v25[2] = &stru_1E64A2498;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v19);

    v20 = SecItemAdd((CFDictionaryRef)v17, 0);
    v21 = v20 == 0;
    if (v20)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:withNewUsername:fromRecentlyDeleted:].cold.1();
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:()SafariCoreExtras forGroupWithID:fromRecentlyDeleted:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  OSStatus v20;
  _BOOL8 v21;
  NSObject *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "protectionSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "protectionSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v15, v16, v9, a5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *MEMORY[0x1E0CD6BC8];
    v24[0] = *MEMORY[0x1E0CD70D8];
    v24[1] = v18;
    v25[0] = v14;
    v25[1] = &unk_1E64CE328;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEntriesFromDictionary:", v19);

    v20 = SecItemAdd((CFDictionaryRef)v17, 0);
    v21 = v20 == 0;
    if (v20)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:forGroupWithID:fromRecentlyDeleted:].cold.1();
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)_safari_copyPersonalSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  OSStatus v21;
  _BOOL8 v22;
  NSObject *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectionSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v9, "user");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "protectionSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v16, v17, v10, a6, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x1E0CD6BC8];
    v25[0] = *MEMORY[0x1E0CD70D8];
    v25[1] = v19;
    v26[0] = v15;
    v26[1] = &unk_1E64CE328;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEntriesFromDictionary:", v20);

    v21 = SecItemAdd((CFDictionaryRef)v18, 0);
    v22 = v21 == 0;
    if (v21)
    {
      v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_copyPersonalSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:].cold.1();
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (uint64_t)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  CFTypeRef cf;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "user");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "protectionSpace");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "host");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_safari_dataFromSidecarDictionary:user:domain:", v18, v19, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v17 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v10, "user");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "protectionSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1936220530, v22, v23, v12, a6, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = *MEMORY[0x1E0CD6BC8];
    v31[0] = *MEMORY[0x1E0CD70D8];
    v31[1] = v25;
    v32[0] = v15;
    v32[1] = &unk_1E64CE340;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addEntriesFromDictionary:", v26);

    if (!SecItemAdd((CFDictionaryRef)v24, 0))
    {

      goto LABEL_4;
    }
    v27 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:].cold.1();

LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v10, "user");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protectionSpace");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1936220530, v13, v14, v11, a6, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  cf = 0;
  v16 = (const void *)SecItemShareWithGroup();
  if (!v16)
  {
    v28 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_copySharedSidecar:fromGroupWithID:toGroupWithID:fromRecentlyDeleted:].cold.2((uint64_t)v12, (uint64_t)&cf, v28);
    CFRelease(cf);
    goto LABEL_13;
  }
  CFRelease(v16);
LABEL_4:
  v17 = 1;
LABEL_14:

LABEL_15:
  return v17;
}

- (uint64_t)safari_deleteAllItemsForGroupID:()SafariCoreExtras
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(a1, "_safari_deleteAllPasswordCredentialsForGroupID:", v4);
    v6 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:", v4);
    v7 = objc_msgSend(a1, "_safari_deleteAllPasskeyCredentialsForGroupID:", v4);
    v8 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:", v4);
    v9 = objc_msgSend(a1, "_safari_deleteAllSharedSidecarsForGroupID:", v4);
    v10 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:", v4);
    v11 = objc_msgSend(a1, "_safari_deleteAllPersonalSidecarsForGroupID:", v4);
    v12 = objc_msgSend(a1, "_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:", v4) & v11 & v10 & v9 & v8 & v7 & v6 & v5;
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteAllItemsForGroupID:].cold.1();
    v12 = 1;
  }

  return v12;
}

- (uint64_t)_safari_deleteAllPasswordCredentialsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.cfnetwork.testing");
  else
    v6 = CFSTR("com.apple.cfnetwork");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6B60];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllPasswordCredentialsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.cfnetwork-recently-deleted.testing");
  else
    v6 = CFSTR("com.apple.cfnetwork-recently-deleted");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6B60];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllPasskeyCredentialsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CC0];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.webkit.webauthn.testing");
  else
    v6 = CFSTR("com.apple.webkit.webauthn");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6B60];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllPasskeyCredentialsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CC0];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.webkit.webauthn-recently-deleted.testing");
  else
    v6 = CFSTR("com.apple.webkit.webauthn-recently-deleted");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6B60];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllSharedSidecarsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.password-manager.testing");
  else
    v6 = CFSTR("com.apple.password-manager");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6B60];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllSharedSidecarsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.password-manager-recently-deleted.testing");
  else
    v6 = CFSTR("com.apple.password-manager-recently-deleted");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6B60];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllPersonalSidecarsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.password-manager.personal.testing");
  else
    v6 = CFSTR("com.apple.password-manager.personal");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6AC0];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAB0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllPersonalSidecarsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:()SafariCoreExtras
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  const __CFDictionary *v11;
  OSStatus v12;
  OSStatus v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CD6CB8];
  v5 = *MEMORY[0x1E0CD6898];
  v18[0] = *MEMORY[0x1E0CD6C98];
  v18[1] = v5;
  if (shouldUseTestingAccessGroups)
    v6 = CFSTR("com.apple.password-manager.personal-recently-deleted.testing");
  else
    v6 = CFSTR("com.apple.password-manager.personal-recently-deleted");
  v19[0] = v4;
  v19[1] = v6;
  v7 = *MEMORY[0x1E0CD6AC0];
  v18[2] = *MEMORY[0x1E0CD6B80];
  v18[3] = v7;
  v19[2] = MEMORY[0x1E0C9AAB0];
  v19[3] = a3;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v6;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v12 = SecItemDelete(v11);
  v13 = v12;
  if (v12 != -25300)
  {
    if (v12)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) _safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:].cold.1();
    }
  }
  if (v13)
    v15 = v13 == -25300;
  else
    v15 = 1;
  v16 = v15;

  return v16;
}

- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarItemsInPersonalKeychain
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, &stru_1E64A2498, 1);
}

- (uint64_t)_safari_allRecentlyDeletedPersonalSidecarItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 0, a3, 1);
}

- (uint64_t)_safari_allRecentlyDeletedSharedSidecarItemsInGroupWithID:()SafariCoreExtras
{
  return objc_msgSend(a1, "_safari_allSidecarItemsOfType:groupID:fromRecentlyDeleted:", 1, a3, 1);
}

+ (id)safari_customTitleForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_safari_personalSidecarDictionaryForPasskeyWithUserHandle:relyingPartyID:groupID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v2, 4);
  else
    v3 = 0;

  return v3;
}

+ (void)safari_setLastUsedDate:()SafariCoreExtras forPasskeyWithUserHandle:relyingPartyID:groupID:context:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  WBSSavedAccountSidecar *v18;
  void *v19;
  void *v20;
  id v21;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(a1, "_safari_personalSidecarDictionaryForPasskeyWithUserHandle:relyingPartyID:groupID:", v15, v14, v13);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92C70], "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[WBSSavedAccountSidecar initWithUser:protectionSpace:dictionaryRepresentation:]([WBSSavedAccountSidecar alloc], "initWithUser:protectionSpace:dictionaryRepresentation:", v15, v17, v21);
  -[WBSSavedAccountSidecar setLastUsedDate:forContext:](v18, "setLastUsedDate:forContext:", v16, v12);

  objc_msgSend(MEMORY[0x1E0C92C60], "safari_credentialWithUser:password:persistence:", v15, &stru_1E64A2498, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C92C68], "sharedCredentialStorage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safari_setSidecar:credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:", v18, v19, v17, v13, 0);

}

- (id)_safari_dataFromGeneratedPasswordDictionary:()SafariCoreExtras domain:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;

  v5 = a4;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) _safari_dataFromGeneratedPasswordDictionary:domain:].cold.1((uint64_t)v5, v9, v7);
  }

  return v6;
}

- (id)_safari_accountStringForGeneratedPassword
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v0, "timeIntervalSinceReferenceDate");
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%f"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)safari_allGeneratedPasswordItems
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFDictionary *v12;
  OSStatus v13;
  OSStatus v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v25;
  CFTypeRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD6CB8];
  v1 = *MEMORY[0x1E0CD6F30];
  v26 = (CFTypeRef)*MEMORY[0x1E0CD6C98];
  v27 = v1;
  v2 = *MEMORY[0x1E0CD6F38];
  *(_QWORD *)buf = v0;
  *(_QWORD *)&buf[8] = v2;
  v3 = *MEMORY[0x1E0CD6898];
  if (shouldUseTestingAccessGroups)
    v4 = CFSTR("com.apple.password-manager.generated-passwords.testing");
  else
    v4 = CFSTR("com.apple.password-manager.generated-passwords");
  v5 = *MEMORY[0x1E0CD6B80];
  v28 = *MEMORY[0x1E0CD6898];
  v29 = v5;
  v6 = *MEMORY[0x1E0CD6B88];
  *(_QWORD *)&buf[16] = v4;
  v35 = v6;
  v7 = *MEMORY[0x1E0CD7018];
  v30 = *MEMORY[0x1E0CD7010];
  v31 = v7;
  v36 = MEMORY[0x1E0C9AAB0];
  v37 = MEMORY[0x1E0C9AAB0];
  v8 = *MEMORY[0x1E0CD70A8];
  v32 = *MEMORY[0x1E0CD7020];
  v33 = v8;
  v38 = MEMORY[0x1E0C9AAB0];
  v39 = MEMORY[0x1E0C9AAB0];
  v9 = (void *)MEMORY[0x1E0C99D80];
  v10 = v4;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", buf, &v26, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (const __CFDictionary *)objc_msgSend(v11, "mutableCopy", v26, v27, v28, v29, v30, v31, v32, v33, *(_QWORD *)buf, *(_QWORD *)&buf[8], *(_QWORD *)&buf[16], v35, v36, v37, v38, v39);
  v26 = 0;
  v13 = SecItemCopyMatching(v12, &v26);
  if (v13)
  {
    v14 = v13;
    if (v13 == -25300)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        v18 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_13;
      }
      v16 = v15;
      -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_1B2621000, v16, OS_LOG_TYPE_DEFAULT, "No recently generated password items found in access group %{public}@", buf, 0xCu);

    }
    else
    {
      v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v25 = v23;
      -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v14;
      _os_log_error_impl(&dword_1B2621000, v25, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed to fetch recently generated password items in access group %{public}@, result %i", buf, 0x12u);

    }
    goto LABEL_12;
  }
  v18 = (void *)v26;
  v19 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = objc_msgSend(v18, "count");
    -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl(&dword_1B2621000, v20, OS_LOG_TYPE_DEFAULT, "Fetched %li recently generated password items from access group %{public}@", buf, 0x16u);

  }
LABEL_13:

  return v18;
}

- (WBSGeneratedPassword)safari_addGeneratedPassword:()SafariCoreExtras forProtectionSpace:wasGeneratedInPrivateBrowsingSession:
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const void *v29;
  __CFString *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  WBSGeneratedPassword *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  OSStatus v45;
  OSStatus v46;
  NSObject *v47;
  void *v48;
  NSObject *v50;
  void *v51;
  const void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  _QWORD v57[4];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  CFTypeRef result[8];
  _BYTE buf[24];
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v8, "host");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_1B2621000, v11, OS_LOG_TYPE_DEFAULT, "Adding generated password for %@", buf, 0xCu);

  }
  +[WBSGeneratedPassword keychainDictionaryRepresentationWithPassword:](WBSGeneratedPassword, "keychainDictionaryRepresentationWithPassword:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_dataFromGeneratedPasswordDictionary:domain:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1, "_safari_accountStringForGeneratedPassword");
    v16 = objc_claimAutoreleasedReturnValue();
    v53 = v15;
    v17 = v15;
    v55 = v8;
    v18 = v8;
    v19 = *MEMORY[0x1E0CD6CB8];
    v20 = (const void *)*MEMORY[0x1E0CD6910];
    result[0] = *(CFTypeRef *)MEMORY[0x1E0CD6C98];
    result[1] = v20;
    v21 = *MEMORY[0x1E0CD6920];
    *(_QWORD *)buf = v19;
    *(_QWORD *)&buf[8] = v21;
    result[2] = *(CFTypeRef *)MEMORY[0x1E0CD6A90];
    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = a5;
    _WBSLocalizedString(CFSTR("Generated Password for %@"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "host");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[16] = v26;
    result[3] = *(CFTypeRef *)MEMORY[0x1E0CD69A0];
    _WBSLocalizedString(CFSTR("Generated Password"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = (const void *)*MEMORY[0x1E0CD6898];
    if (shouldUseTestingAccessGroups)
      v30 = CFSTR("com.apple.password-manager.generated-passwords.testing");
    else
      v30 = CFSTR("com.apple.password-manager.generated-passwords");
    v66 = v27;
    v67 = v30;
    v31 = (const void *)*MEMORY[0x1E0CD6B80];
    v52 = v29;
    result[4] = v29;
    result[5] = v31;
    v32 = (const void *)*MEMORY[0x1E0CD68F8];
    v68 = MEMORY[0x1E0C9AAB0];
    v69 = v16;
    v54 = (void *)v16;
    v33 = (const void *)*MEMORY[0x1E0CD70D8];
    result[6] = v32;
    result[7] = v33;
    v70 = v17;
    v34 = (void *)MEMORY[0x1E0C99D80];
    v35 = v30;
    objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", buf, result, 8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)objc_msgSend(v36, "mutableCopy");
    if (v23)
    {
      v58 = *MEMORY[0x1E0CD6B50];
      +[WBSGeneratedPassword privateBrowsingSentinel](WBSGeneratedPassword, "privateBrowsingSentinel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *MEMORY[0x1E0CD6AC8];
      v61 = (uint64_t)v38;
      v62 = &unk_1E64CE358;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v58, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addEntriesFromDictionary:", v39);
    }
    else
    {
      v58 = *MEMORY[0x1E0CD6AD0];
      v61 = objc_msgSend(v18, "safari_protocolAsSecAttrProtocolValue");
      v59 = *MEMORY[0x1E0CD6B50];
      objc_msgSend(v18, "host");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v38;
      v60 = *MEMORY[0x1E0CD6AC8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "port"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v58, 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addEntriesFromDictionary:", v41);

    }
    v42 = *MEMORY[0x1E0CD7010];
    v56[0] = *MEMORY[0x1E0CD7020];
    v56[1] = v42;
    v57[0] = MEMORY[0x1E0C9AAB0];
    v57[1] = MEMORY[0x1E0C9AAB0];
    v43 = *MEMORY[0x1E0CD70A8];
    v56[2] = *MEMORY[0x1E0CD7018];
    v56[3] = v43;
    v57[2] = MEMORY[0x1E0C9AAB0];
    v57[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addEntriesFromDictionary:", v44);

    result[0] = 0;
    v45 = SecItemAdd((CFDictionaryRef)v37, result);
    v15 = v53;
    if (v45)
    {
      v46 = v45;
      v47 = WBS_LOG_CHANNEL_PREFIXKeychain();
      v8 = v55;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v50 = v47;
        objc_msgSend(v37, "objectForKeyedSubscript:", v52);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v46;
        _os_log_error_impl(&dword_1B2621000, v50, OS_LOG_TYPE_ERROR, "SecItemAdd failed to add generated password item in access group %{public}@: status=%ld", buf, 0x16u);

      }
      v40 = 0;
    }
    else
    {
      v48 = (void *)result[0];
      v40 = -[WBSGeneratedPassword initWithKeychainItemDictionary:]([WBSGeneratedPassword alloc], "initWithKeychainItemDictionary:", result[0]);

      v8 = v55;
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (WBSGeneratedPassword)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const __CFDictionary *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  WBSGeneratedPassword *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  void *v34;
  _BYTE buf[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "protectionSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_1B2621000, v9, OS_LOG_TYPE_DEFAULT, "Updating generated password for %@", buf, 0xCu);

  }
  objc_msgSend(v6, "keychainPersistentReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "keychainDictionaryRepresentationWithPassword:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "protectionSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "host");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_safari_dataFromGeneratedPasswordDictionary:domain:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v23 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(a1, "_safari_accountStringForGeneratedPassword");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CD70E0];
    v33 = *MEMORY[0x1E0CD70E0];
    v34 = v12;
    v19 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v20 = *MEMORY[0x1E0CD70D8];
    v31[0] = *MEMORY[0x1E0CD68F8];
    v31[1] = v20;
    v32[0] = v17;
    v32[1] = v16;
    if (SecItemUpdate(v19, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2)))
    {
      v21 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_updateGeneratedPassword:withPassword:].cold.3();
    }
    else
    {
      *(_QWORD *)buf = 0;
      v24 = *MEMORY[0x1E0CD7010];
      v29[0] = v18;
      v29[1] = v24;
      v30[0] = v12;
      v30[1] = MEMORY[0x1E0C9AAB0];
      v25 = *MEMORY[0x1E0CD7020];
      v29[2] = *MEMORY[0x1E0CD7018];
      v29[3] = v25;
      v30[2] = MEMORY[0x1E0C9AAB0];
      v30[3] = MEMORY[0x1E0C9AAB0];
      v29[4] = *MEMORY[0x1E0CD6F30];
      v30[4] = *MEMORY[0x1E0CD6F40];
      if (!SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5), (CFTypeRef *)buf))
      {
        v28 = *(void **)buf;
        v23 = -[WBSGeneratedPassword initWithKeychainItemDictionary:]([WBSGeneratedPassword alloc], "initWithKeychainItemDictionary:", *(_QWORD *)buf);

        goto LABEL_16;
      }
      v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_updateGeneratedPassword:withPassword:].cold.2();
    }
    v23 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[NSURLCredentialStorage(SafariCoreExtras) safari_updateGeneratedPassword:withPassword:].cold.1();
  v23 = 0;
LABEL_18:

  return v23;
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  OSStatus v31;
  OSStatus v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  OSStatus v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  _QWORD v52[10];
  _BYTE buf[24];
  __CFString *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "protectionSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1B2621000, v7, OS_LOG_TYPE_DEFAULT, "Removing generated password item for %@", buf, 0xCu);

  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%f"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v13 = *MEMORY[0x1E0CD6CB8];
  v14 = *MEMORY[0x1E0CD6910];
  v52[0] = *MEMORY[0x1E0CD6C98];
  v52[1] = v14;
  v15 = *MEMORY[0x1E0CD6920];
  *(_QWORD *)buf = v13;
  *(_QWORD *)&buf[8] = v15;
  v16 = *MEMORY[0x1E0CD6898];
  v52[2] = *MEMORY[0x1E0CD68F8];
  v52[3] = v16;
  if (shouldUseTestingAccessGroups)
    v17 = CFSTR("com.apple.password-manager.generated-passwords.testing");
  else
    v17 = CFSTR("com.apple.password-manager.generated-passwords");
  *(_QWORD *)&buf[16] = v11;
  v54 = v17;
  v18 = *MEMORY[0x1E0CD6B88];
  v19 = *MEMORY[0x1E0CD6F30];
  v52[4] = *MEMORY[0x1E0CD6B80];
  v52[5] = v19;
  v20 = *MEMORY[0x1E0CD6F40];
  v55 = v18;
  v56 = v20;
  v21 = *MEMORY[0x1E0CD7018];
  v52[6] = *MEMORY[0x1E0CD7010];
  v52[7] = v21;
  v57 = MEMORY[0x1E0C9AAB0];
  v58 = MEMORY[0x1E0C9AAB0];
  v22 = *MEMORY[0x1E0CD70A8];
  v52[8] = *MEMORY[0x1E0CD7020];
  v52[9] = v22;
  v59 = MEMORY[0x1E0C9AAB0];
  v60 = MEMORY[0x1E0C9AAB0];
  v23 = (void *)MEMORY[0x1E0C99D80];
  v24 = v17;
  objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", buf, v52, 10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(v25, "mutableCopy");
  if (v12)
  {
    v46 = *MEMORY[0x1E0CD6AD0];
    v49 = objc_msgSend(v12, "safari_protocolAsSecAttrProtocolValue");
    v47 = *MEMORY[0x1E0CD6B50];
    objc_msgSend(v12, "host");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v27;
    v48 = *MEMORY[0x1E0CD6AC8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "port"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v46, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEntriesFromDictionary:", v29);

  }
  else
  {
    v46 = *MEMORY[0x1E0CD6B50];
    +[WBSGeneratedPassword privateBrowsingSentinel](WBSGeneratedPassword, "privateBrowsingSentinel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0CD6AC8];
    v49 = (uint64_t)v27;
    v50 = &unk_1E64CE358;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v46, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEntriesFromDictionary:", v28);
  }

  objc_msgSend(v3, "keychainPersistentReference");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    goto LABEL_10;
  v36 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    objc_msgSend(v12, "host");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v38;
    _os_log_impl(&dword_1B2621000, v37, OS_LOG_TYPE_DEFAULT, "Removing generated password item for %@", buf, 0xCu);

  }
  *(_QWORD *)buf = 0;
  v39 = SecItemCopyMatching((CFDictionaryRef)v26, (CFTypeRef *)buf);
  if (!v39)
  {
    v42 = *(void **)buf;
    objc_msgSend(*(id *)buf, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v44 = *MEMORY[0x1E0CD70E0];
      v45 = v30;
      v31 = SecItemDelete((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
      if (v31)
      {
        v32 = v31;
        v33 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = v33;
          objc_msgSend(v12, "host");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v35;
          *(_WORD *)&buf[22] = 2048;
          v54 = (__CFString *)v32;
          _os_log_error_impl(&dword_1B2621000, v34, OS_LOG_TYPE_ERROR, "Failed to delete recently generated password item for date %@ and host %@: status=%ld", buf, 0x20u);

        }
      }
    }
    else
    {
      v41 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteGeneratedPassword:].cold.3();
    }
    goto LABEL_26;
  }
  if (v39 == -25300)
  {
    v40 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteGeneratedPassword:].cold.2((uint64_t)v5, v40, v12);
  }
  else
  {
    v43 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deleteGeneratedPassword:].cold.1((uint64_t)v5, v43, v12);
  }
  v30 = 0;
LABEL_26:

}

- (void)safari_deleteAllGeneratedPasswords
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Error deleting all generated password items in Keychain, status=%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)safari_test_setUseTestingAccessGroups:()SafariCoreExtras
{
  NSObject *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  shouldUseTestingAccessGroups = a3;
  v3 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (shouldUseTestingAccessGroups)
      v4 = CFSTR("com.apple.cfnetwork.testing");
    else
      v4 = CFSTR("com.apple.cfnetwork");
    v5 = v4;
    if (shouldUseTestingAccessGroups)
      v6 = CFSTR("com.apple.webkit.webauthn.testing");
    else
      v6 = CFSTR("com.apple.webkit.webauthn");
    v7 = v6;
    if (shouldUseTestingAccessGroups)
      v8 = CFSTR("com.apple.password-manager.testing");
    else
      v8 = CFSTR("com.apple.password-manager");
    v9 = v8;
    if (shouldUseTestingAccessGroups)
      v10 = CFSTR("com.apple.password-manager.personal.testing");
    else
      v10 = CFSTR("com.apple.password-manager.personal");
    v11 = v10;
    if (shouldUseTestingAccessGroups)
      v12 = CFSTR("com.apple.password-manager.generated-passwords.testing");
    else
      v12 = CFSTR("com.apple.password-manager.generated-passwords");
    v13 = v12;
    v23 = 138413314;
    v24 = v5;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v11;
    v31 = 2112;
    v32 = v13;
    _os_log_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEFAULT, "Password Manager Keychain Access Groups:\n\t         Passwords: %@\n\t          Passkeys: %@\n\t          Sidecars: %@\t Personal Sidecars: %@\n\tRecently Generated: %@\n", (uint8_t *)&v23, 0x34u);

  }
  v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (shouldUseTestingAccessGroups)
      v15 = CFSTR("com.apple.cfnetwork-recently-deleted.testing");
    else
      v15 = CFSTR("com.apple.cfnetwork-recently-deleted");
    v16 = v15;
    if (shouldUseTestingAccessGroups)
      v17 = CFSTR("com.apple.webkit.webauthn-recently-deleted.testing");
    else
      v17 = CFSTR("com.apple.webkit.webauthn-recently-deleted");
    v18 = v17;
    if (shouldUseTestingAccessGroups)
      v19 = CFSTR("com.apple.password-manager-recently-deleted.testing");
    else
      v19 = CFSTR("com.apple.password-manager-recently-deleted");
    v20 = v19;
    if (shouldUseTestingAccessGroups)
      v21 = CFSTR("com.apple.password-manager.personal-recently-deleted.testing");
    else
      v21 = CFSTR("com.apple.password-manager.personal-recently-deleted");
    v22 = v21;
    v23 = 138413058;
    v24 = v16;
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v22;
    _os_log_impl(&dword_1B2621000, v14, OS_LOG_TYPE_DEFAULT, "Password Manager Recently Deleted Keychain Access Groups:\n\t        Passwords: %@\n\t         Passkeys: %@\n\t         Sidecars: %@\tPersonal Sidecars: %@\n", (uint8_t *)&v23, 0x2Au);

  }
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  OSStatus v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFDictionary *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  CFTypeRef v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[WBSOngoingSharingGroupProvider sharedProvider](WBSOngoingSharingGroupProvider, "sharedProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canCurrentUserEditSavedAccountsInGroupWithID:", v6);

  if ((v8 & 1) != 0)
  {
    queryForPasskeyFromSavedAccount(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "length");
    if (v10)
      v11 = MEMORY[0x1E0C9AAA0];
    else
      v11 = MEMORY[0x1E0C9AAB0];
    if (v10)
      v12 = v6;
    else
      v12 = 0;
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6B80]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CD6B60]);
    v24 = 0;
    v13 = SecItemCopyMatching((CFDictionaryRef)v9, &v24);
    if (v13 != -25300)
    {
      if (v13)
      {
        v22 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:].cold.1();
      }
      else
      {
        v14 = (void *)v24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = *MEMORY[0x1E0CD70E0];
          objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70E0]);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
          {
            v25 = v15;
            v26[0] = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (const __CFDictionary *)objc_msgSend(v18, "mutableCopy");

            if (SecItemDelete(v19))
            {
              v20 = WBS_LOG_CHANNEL_PREFIXKeychain();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:].cold.3();
            }

          }
          else
          {
            v23 = WBS_LOG_CHANNEL_PREFIXKeychain();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:].cold.2();
          }

        }
      }
    }

  }
  else if (!shouldUseTestingAccessGroups)
  {
    v21 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[NSURLCredentialStorage(SafariCoreExtras) safari_deletePasskeyFromSavedAccount:groupID:].cold.4();
  }

}

+ (void)safari_test_purgeKeychainItemsFromTestingAccessGroups
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Refusing to dump data from testing access groups while not in testing mode!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (id)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  OSStatus v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  CFTypeRef cf;
  CFTypeRef result;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[6];
  _QWORD v33[8];

  v33[6] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (shouldUseTestingAccessGroups)
  {
    v8 = *MEMORY[0x1E0CD6C98];
    v9 = *MEMORY[0x1E0CD6CC0];
    v33[0] = *MEMORY[0x1E0CD6CC0];
    v10 = *MEMORY[0x1E0CD6900];
    v32[0] = v8;
    v32[1] = v10;
    objc_msgSend(a3, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v11;
    v32[2] = *MEMORY[0x1E0CD6898];
    v12 = CFSTR("com.apple.webkit.webauthn.testing");
    v13 = CFSTR("com.apple.webkit.webauthn-recently-deleted.testing");
    if (!shouldUseTestingAccessGroups)
    {
      v12 = CFSTR("com.apple.webkit.webauthn");
      v13 = CFSTR("com.apple.webkit.webauthn-recently-deleted");
    }
    if (a5)
      v12 = (__CFString *)v13;
    v14 = v12;
    v15 = *MEMORY[0x1E0CD70A8];
    v16 = MEMORY[0x1E0C9AAB0];
    v33[2] = v14;
    v33[3] = MEMORY[0x1E0C9AAB0];
    v17 = *MEMORY[0x1E0CD7010];
    v32[3] = v15;
    v32[4] = v17;
    v32[5] = *MEMORY[0x1E0CD6B80];
    v33[4] = MEMORY[0x1E0C9AAB0];
    v33[5] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    result = 0;
    v19 = SecItemAdd(v18, &result);
    v20 = (void *)result;
    if (v19)
    {
      v21 = 0;
      v22 = (id)result;
    }
    else
    {
      if (objc_msgSend(v7, "length"))
      {
        cf = 0;
        v30[0] = v8;
        v30[1] = v17;
        v31[0] = v9;
        v31[1] = v16;
        v30[2] = *MEMORY[0x1E0CD6F30];
        v31[2] = *MEMORY[0x1E0CD6F40];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "safari_dictionaryByMergingWithDictionary:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)SecItemShareWithGroup();
        if (SecItemDelete(v18))
        {
          v26 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[NSURLCredentialStorage(SafariCoreExtras) safari_test_addTestingPasskeyItemWithCredentialID:groupID:toRecentlyDeleted:].cold.1();
        }

      }
      else
      {
        v25 = v20;
      }
      v22 = v25;
      v21 = v22;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)safari_mostRecentLastModifiedDateForCredentialsOnSavedAccount:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if ((objc_msgSend(v4, "credentialTypes") & 1) != 0)
  {
    objc_msgSend(a1, "_safari_lastModifiedDateForPasswordCredentialsOnSavedAccount:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if ((objc_msgSend(v4, "credentialTypes") & 2) != 0)
  {
    objc_msgSend(a1, "_safari_lastModifiedDateForPasskeyCredentialOnSavedAccount:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v5, "laterDate:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    else
    {
      v5 = v6;
    }

  }
  return v5;
}

- (id)_safari_lastModifiedDateForPasswordCredentialsOnSavedAccount:()SafariCoreExtras
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_safari_getCredentialItemsFromKeychainForPasswordInSavedAccount:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x1E0CD6A98];
    v7 = *MEMORY[0x1E0CD6990];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v1);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v7);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        if (v4)
        {
          objc_msgSend(v4, "laterDate:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v14;
        }
        else
        {
          v4 = v13;
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_safari_lastModifiedDateForPasskeyCredentialOnSavedAccount:()SafariCoreExtras
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A98]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (BOOL)safari_test_saveCredential:()SafariCoreExtras withArbitraryProtectionSpace:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queryForUserInProtectionSpace(v7, v5, 0, &stru_1E64A2498, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = *MEMORY[0x1E0CD6910];
  objc_msgSend(v5, "authenticationMethod");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C92B40]))
  {
    v10 = (id *)MEMORY[0x1E0CD6920];
LABEL_11:
    v11 = *v10;
    goto LABEL_12;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C92B38]))
  {
    v10 = (id *)MEMORY[0x1E0CD6918];
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C92B48]))
  {
    v10 = (id *)MEMORY[0x1E0CD6928];
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C92B50]))
  {
    v10 = (id *)MEMORY[0x1E0CD6930];
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C92B58]))
  {
    v10 = (id *)MEMORY[0x1E0CD6938];
    goto LABEL_11;
  }
  v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    +[NSURLCredentialStorage(SafariCoreExtras) safari_test_saveCredential:withArbitraryProtectionSpace:].cold.1();
  v11 = 0;
LABEL_12:

  v25[0] = v11;
  v24[1] = *MEMORY[0x1E0CD70D8];
  objc_msgSend(v6, "password");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v13;
  v24[2] = *MEMORY[0x1E0CD6A90];
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "host");
  v23 = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (%@)"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = *MEMORY[0x1E0CD69A0];
  _WBSLocalizedString(CFSTR("Web form password"), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v19);

  v20 = SecItemAdd((CFDictionaryRef)v8, 0) == 0;
  return v20;
}

+ (id)_safari_personalSidecarDictionaryForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  const __CFDictionary *v12;
  OSStatus v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  CFTypeRef result;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C92C70];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queryForSidecarOfTypeWithUserAndProtectionSpaceInGroupWithID(1835626085, v10, v11, v9, 0, 1);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  result = 0;
  v13 = SecItemCopyMatching(v12, &result);
  if (v13)
  {
    if (v13 == -25300)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *MEMORY[0x1E0CD6898];
        v16 = v14;
        -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1B2621000, v16, OS_LOG_TYPE_DEFAULT, "Passkey sidecar fetching: no sidecar items found in access group %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v24 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[NSURLCredentialStorage(SafariCoreExtras) _safari_personalSidecarDictionaryForPasskeyWithUserHandle:relyingPartyID:groupID:].cold.1(v24);
    }
    v23 = 0;
  }
  else
  {
    v18 = (void *)result;
    objc_msgSend(a1, "sharedCredentialStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_safari_sidecarDictionaryFromData:user:domain:", v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

- (void)_safari_getCredentialItemFromKeychainForPasskeyInSavedAccount:()SafariCoreExtras .cold.1(void *a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "passkeyCredentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "passkeyRelyingPartyID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_31(&dword_1B2621000, v2, v7, "Unable to query for passkey credential item for %@ (%@): %ld", (uint8_t *)&v8);

  OUTLINED_FUNCTION_27();
}

- (void)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemAdd failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:.cold.2(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  os_log_type_t v12;
  const char *v13;
  uint8_t *v14;

  v5 = a1;
  objc_msgSend(a2, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B60]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_26();
  _os_log_debug_impl(v10, v11, v12, v13, v14, 0x2Au);

}

- (void)safari_setCredential:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "The user tried to update credential in a group they have read only permission in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed while trying to delete password credential in group %{private}@: %ld");
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Password credential in group %{private}@ did not contain valid persistent identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete password credential from group %{private}@: %ld");
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deletePasswordCredentialForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "The user tried to delete a credential in a group they have read only permission in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete credential with empty host: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed while trying to delete credential with empty host: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_deleteCredentialWithEmptyServerHostForUser:()SafariCoreExtras forHTMLFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "The user tried to delete credential in a group they have read only permission in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.1(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "user");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = a2;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_25(&dword_1B2621000, v2, v5, "Attempting to set a credential for '%{private}@' with no password as default for %{private}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed with status %i.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemUpdate failed to remove default status from credential with result %i.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemUpdate failed to set default credential with status %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.5(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "user");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = a2;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_32(&dword_1B2621000, v2, v5, "Making '%{private}@' credential default for protection space %{private}@.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.6(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xCu);

  OUTLINED_FUNCTION_4();
}

- (void)safari_setDefaultCredential:()SafariCoreExtras forHTMLFormProtectionSpace:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Keychain access groups not supported. Skipping setting default credential.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_safari_allCredentialItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20(), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(&dword_1B2621000, v4, v5, "SecItemCopyMatching failed to fetch credential items in access group %{public}@, result %i", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_safari_removeDefaultCommentFromKeychainItemsMatchingQuery:()SafariCoreExtras .cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v2, v4, "Unable to remove default comment from keychain item: %@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)_safari_getKeychainItemForSidecar:()SafariCoreExtras ofType:groupID:fromRecentlyDeleted:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "protectionSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v4;
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_31(&dword_1B2621000, v3, v7, "Unable to query for sidecar item for %@ (%@): %ld", (uint8_t *)&v8);

}

- (void)_safari_allSidecarItemsOfType:()SafariCoreExtras groupID:fromRecentlyDeleted:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20(), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(&dword_1B2621000, v4, v5, "SecItemCopyMatching failed to fetch sidecar items in access group %{public}@, result %i", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_19(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v3, "Error deserializing sidecar data: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

- (void)_safari_sidecarDictionaryFromData:()SafariCoreExtras user:domain:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2113;
  v4 = v0;
  OUTLINED_FUNCTION_25(&dword_1B2621000, v1, (uint64_t)v1, "Extracted non-Dictionary sidecar from Keychain for %{private}@ (%{private}@)", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_setSidecar:()SafariCoreExtras credential:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "The user tried to update a sidecar in a group they have read only permission in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to create new sidecar Keychain item. status=%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Unable to update existing sidecar Keychain item. status=%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.3(void *a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[14];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CD6898];
  v4 = a1;
  objc_msgSend(a2, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CD68F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  v10 = v6;
  v11 = 2113;
  v12 = v8;
  _os_log_debug_impl(&dword_1B2621000, v4, OS_LOG_TYPE_DEBUG, "Query for sidecar SecItemUpdate: { accessGroup: %{public}@, service: %{public}@, account: %{private}@ }", v9, 0x20u);

  OUTLINED_FUNCTION_27();
}

- (void)_safari_setSidecarDictionary:()SafariCoreExtras type:credential:htmlFormProtectionSpace:groupID:fromRecentlyDeleted:.cold.4(void *a1, void *a2, uint64_t a3)
{
  NSObject *v3;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20(), "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138543619;
  v11 = v7;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_32(&dword_1B2621000, v3, v9, "Attributes for sidecar SecItemAdd: { accessGroup: %{public}@, label: %{private}@ }", (uint8_t *)&v10);

  OUTLINED_FUNCTION_2();
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed while trying to delete sidecar entry: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Sidecar entry did not contain valid persistent identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete sidecar entry: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deleteSidecarOfType:()SafariCoreExtras forUser:htmlFormProtectionSpace:forGroupID:fromRecentlyDeleted:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "The user tried to delete a sidecar in a group they have read only permission in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  v1 = OUTLINED_FUNCTION_19(a1);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v2, "SecItemCopyMatching for password credential received unexpected class %@", v3);

  OUTLINED_FUNCTION_4();
}

- (void)safari_copySavedAccountWithPasswordToPersonalKeychain:()SafariCoreExtras withNewUsername:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed while trying to move password credential to personal keychain with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Trying to copy a password to a shared group but did not specify a group ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_copySavedAccountWithPassword:()SafariCoreExtras toGroupWithID:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v3, v5, "Failed to copy password item to group with error: %{public}@", v6);

  OUTLINED_FUNCTION_4();
}

- (void)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemAdd for password credential from group to personal keychain failed with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras .cold.2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  v1 = OUTLINED_FUNCTION_19(a1);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v1, v2, "SecItemCopyMatching for passkey credential received unexpected class %@", v3);

  OUTLINED_FUNCTION_4();
}

- (void)safari_copySavedAccountWithPasskeyToPersonalKeychain:()SafariCoreExtras .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_3(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed while trying to move passkey credential to personal keychain with error %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Trying to copy a passkey to a shared group but did not specify a group ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_copySavedAccountWithPasskey:()SafariCoreExtras toGroupWithID:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v3, v5, "Failed to share password to group with error: %{public}@", v6);

  OUTLINED_FUNCTION_4();
}

- (void)_safari_copyPersonalSidecarFromSharedPersonalAccessGroupToPersonalKeychain:()SafariCoreExtras withNewUsername:fromRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to move personal sidecar from personal access group for shared credentials to personal keychain with error %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_copyPersonalSidecarFromPersonalKeychainToSharedPersonalAccessGroup:()SafariCoreExtras forGroupWithID:fromRecentlyDeleted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Failed to copy personal sidecar to personal sidecar access group for shared group %{private}@, error %ld");
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_copyPersonalSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Error updating shared sidecar after sharing with group %@, error %ld");
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1B2621000, v0, v1, "Error adding shared sidecar to group %{private}@, error %ld");
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_copySharedSidecar:()SafariCoreExtras fromGroupWithID:toGroupWithID:fromRecentlyDeleted:.cold.2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(), "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, v3, v7, "Error sharing shared sidecar with group %@, error %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)safari_deleteAllItemsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Invalid group ID passed into method to delete all items from group after exit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_safari_deleteAllPasswordCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete passwords from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllRecentlyDeletedPasswordCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete recently deleted passwords from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllPasskeyCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete passkeys from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllRecentlyDeletedPasskeyCredentialsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete recently deleted passkeys from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllSharedSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete shared sidecars from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllRecentlyDeletedSharedSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete recently deleted shared sidecars from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllPersonalSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete personal sidecars from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_deleteAllRecentlyDeletedPersonalSidecarsForGroupID:()SafariCoreExtras .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete recently deleted personal sidecars from exited group: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_safari_dataFromGeneratedPasswordDictionary:()SafariCoreExtras domain:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_28(a1, a2);
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138478083;
  v9 = a1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_25(&dword_1B2621000, v5, v7, "Unable to archive generated password for %{private}@: %{public}@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Tried to update generated password record that had not been previously persisted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to fetch updated generated password item in Keychain: status=%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_updateGeneratedPassword:()SafariCoreExtras withPassword:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Failed to update generated password item in Keychain: status=%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_28(a1, a2);
  objc_msgSend(a3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, v5, v7, "Unable to fetch generated password item for date %@ and host %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras .cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_28(a1, a2);
  objc_msgSend(a3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_1(&dword_1B2621000, v5, v7, "No generated password item found for date %@ and host %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2();
}

- (void)safari_deleteGeneratedPassword:()SafariCoreExtras .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Unable to get persistent reference for generated password item in Keychain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemCopyMatching failed while trying to delete recently deleted passkey credential: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Recently deleted passkey credential did not contain valid persistent identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "SecItemDelete failed while trying to delete recently deleted passkey credential: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)safari_deletePasskeyFromSavedAccount:()SafariCoreExtras groupID:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9(&dword_1B2621000, v0, v1, "The user tried to delete a passkey in a group they have read only permission in.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, v0, v1, "Unable to delete unshared record", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)safari_test_addTestingPasskeyItemWithCredentialID:()SafariCoreExtras groupID:toRecentlyDeleted:.cold.2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_18(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, v2, v4, "Unable to create testing passkey item, error %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

+ (void)safari_test_saveCredential:()SafariCoreExtras withArbitraryProtectionSpace:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, v0, v1, "Encountered unexpected authentication method: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_safari_personalSidecarDictionaryForPasskeyWithUserHandle:()SafariCoreExtras relyingPartyID:groupID:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_20(), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(&dword_1B2621000, v4, v5, "Passkey sidecar fetching: SecItemCopyMatching failed to fetch sidecar items in access group %{public}@, result %i", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
