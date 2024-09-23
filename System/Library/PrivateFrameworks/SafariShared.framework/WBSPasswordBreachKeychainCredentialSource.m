@implementation WBSPasswordBreachKeychainCredentialSource

- (NSArray)credentials
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  OSStatus v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[8];
  CFTypeRef result;
  _BYTE v34[128];
  _QWORD v35[8];
  _QWORD v36[10];

  v36[8] = *MEMORY[0x1E0C80C00];
  result = 0;
  v2 = *MEMORY[0x1E0CD6CB8];
  v3 = *MEMORY[0x1E0CD6898];
  v35[0] = *MEMORY[0x1E0CD6C98];
  v35[1] = v3;
  v36[0] = v2;
  v36[1] = CFSTR("com.apple.cfnetwork");
  v4 = *MEMORY[0x1E0CD6B88];
  v5 = *MEMORY[0x1E0CD6910];
  v35[2] = *MEMORY[0x1E0CD6B80];
  v35[3] = v5;
  v6 = *MEMORY[0x1E0CD6920];
  v36[2] = v4;
  v36[3] = v6;
  v7 = *MEMORY[0x1E0CD6F38];
  v8 = *MEMORY[0x1E0CD7010];
  v35[4] = *MEMORY[0x1E0CD6F30];
  v35[5] = v8;
  v36[4] = v7;
  v36[5] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0CD7020];
  v35[6] = *MEMORY[0x1E0CD7018];
  v35[7] = v9;
  v36[6] = MEMORY[0x1E0C9AAB0];
  v36[7] = MEMORY[0x1E0C9AAB0];
  v10 = SecItemCopyMatching((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 8), &result);
  if (v10)
  {
    v11 = v10;
    if (v10 == -25300)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Keychain does not contain any saved passwords.", buf, 2u);
      }
    }
    else
    {
      v25 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachKeychainCredentialSource credentials].cold.1(v11, v25);
    }
    v27 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D89BE0], "dontSaveMarker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = (id)result;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      v18 = *MEMORY[0x1E0CD68F8];
      v19 = *MEMORY[0x1E0CD6B50];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "safari_stringForKey:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isEqualToString:", v13) & 1) == 0)
          {
            objc_msgSend(v21, "objectForKeyedSubscript:", v19);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "length"))
            {
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C40]), "initWithSecItemDictionary:", v21);
              if (v24)
                objc_msgSend(v27, "addObject:", v24);

            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v16);
    }

  }
  return (NSArray *)v27;
}

- (id)savedAccountsForPersistentIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D89CF8];
  v4 = a3;
  objc_msgSend(v3, "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccountsForPersistentIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)credentials
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch passwords. SecItemCopyMatching failed with error code %{public}d.", (uint8_t *)v2, 8u);
}

@end
