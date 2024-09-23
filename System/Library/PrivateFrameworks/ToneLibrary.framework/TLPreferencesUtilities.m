@implementation TLPreferencesUtilities

+ (__CFString)preferencesDomain
{
  return CFSTR("com.apple.springboard");
}

+ (__CFString)copySharedResourcesPreferencesDomain
{
  return (__CFString *)objc_msgSend(a1, "copySharedResourcesPreferencesDomainForDomain:", objc_msgSend(a1, "preferencesDomain"));
}

+ (__CFString)copySharedResourcesPreferencesDomainForDomain:(__CFString *)a3
{
  return (__CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
}

+ (id)perWatchPreferencesDomain
{
  return CFSTR("com.apple.ToneLibrary");
}

+ (void)migratePerTopicPreferencesInDomain:(__CFString *)a3 withRegularPreferenceKeys:(const void *)a4 regularPreferenceKeysCount:(unint64_t)a5 intoSinglePerTopicPreferenceWithSuffix:(id)a6 usingPreferencesScope:(int)a7
{
  uint64_t v7;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  uint64_t *v23;
  id v24;
  __CFString *v25;
  int v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  id v30;
  __CFString *v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v7 = *(_QWORD *)&a7;
  v12 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_msgSend(a1, "_existingPerTopicPreferenceKeyPrefixesWithRegularPreferenceKeys:regularPreferenceKeysCount:", a4, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke;
  v27[3] = &unk_1E952ABD0;
  v16 = v14;
  v30 = a1;
  v31 = a3;
  v32 = v7;
  v28 = v16;
  v29 = &v33;
  objc_msgSend(a1, "_enumerateKeysAndValuesWithEligibleKeyPrefixes:inDomain:usingPreferencesScope:withBlock:", v13, a3, v7, v27);
  v18 = v15;
  v19 = 3221225472;
  v20 = __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke_2;
  v21 = &unk_1E952ABF8;
  v17 = v12;
  v24 = a1;
  v25 = a3;
  v26 = v7;
  v22 = v17;
  v23 = &v33;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v18);
  if (*((_BYTE *)v34 + 24))
    objc_msgSend(a1, "_synchronizeDomain:usingPreferencesScope:", a3, v7, v18, v19, v20, v21);

  _Block_object_dispose(&v33, 8);
}

void __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, v8);
  }
  objc_msgSend(v10, "setObject:forKey:", v7, v9);
  objc_msgSend(*(id *)(a1 + 48), "_setValue:forKey:inDomain:usingPreferencesScope:", 0, v11, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __175__TLPreferencesUtilities_migratePerTopicPreferencesInDomain_withRegularPreferenceKeys_regularPreferenceKeysCount_intoSinglePerTopicPreferenceWithSuffix_usingPreferencesScope___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingString:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_setValue:forKey:inDomain:usingPreferencesScope:", v5, v7, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

+ (BOOL)canAccessNanoRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TLPreferencesUtilities_canAccessNanoRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistryOnceToken != -1)
    dispatch_once(&canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistryOnceToken, block);
  return canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistry;
}

void __47__TLPreferencesUtilities_canAccessNanoRegistry__block_invoke(uint64_t a1)
{
  SecTaskRef v2;
  SecTaskRef v3;
  char v4;
  char v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "_valueForEntitlement:task:", CFSTR("com.apple.nano.nanoregistry.generalaccess"), v2);
    v5 = objc_msgSend(*(id *)(a1 + 32), "_valueForEntitlement:task:", CFSTR("com.apple.nano.nanoregistry"), v3);
    CFRelease(v3);
    canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistry = v4 | v5;
    TLLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = canAccessNanoRegistry__TLPreferenceUtilitiesCanAccessNanoRegistry;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "Can access NanoRegistry: %{BOOL}u.", (uint8_t *)v7, 8u);
    }

  }
}

+ (BOOL)_valueForEntitlement:(id)a3 task:(__SecTask *)a4
{
  __CFString *v5;
  void *v6;
  NSObject *v7;
  CFTypeID v8;
  char v9;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  error = 0;
  v6 = (void *)SecTaskCopyValueForEntitlement(a4, v5, &error);
  TLLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "Value of \"%{public}@\" entitlement for current process: %{public}@.", buf, 0x16u);
  }

  if (v6)
  {
    v8 = CFGetTypeID(v6);
    if (v8 == CFBooleanGetTypeID())
      v9 = objc_msgSend(v6, "BOOLValue");
    else
      v9 = 0;
    CFRelease(v6);
  }
  else
  {
    v9 = 0;
  }
  if (error)
    CFRelease(error);

  return v9;
}

+ (id)_existingPerTopicPreferenceKeyPrefixesWithRegularPreferenceKeys:(const void *)a3 regularPreferenceKeysCount:(unint64_t)a4
{
  id i;
  void *v7;

  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); a4; --a4)
  {
    if (*a3)
    {
      objc_msgSend((id)*a3, "stringByAppendingString:", CFSTR("-"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v7);

    }
    ++a3;
  }
  return i;
}

+ (void)_enumerateKeysAndValuesWithEligibleKeyPrefixes:(id)a3 inDomain:(__CFString *)a4 usingPreferencesScope:(int)a5 withBlock:(id)a6
{
  uint64_t v7;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = *(_QWORD *)&a5;
  v13 = a3;
  v10 = a6;
  v11 = objc_msgSend(a1, "_copyAllKeysAndValuesFromDomain:usingPreferencesScope:", a4, v7);
  if (v11)
  {
    v12 = (void *)v11;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __114__TLPreferencesUtilities__enumerateKeysAndValuesWithEligibleKeyPrefixes_inDomain_usingPreferencesScope_withBlock___block_invoke;
    v14[3] = &unk_1E952AC20;
    v15 = v13;
    v16 = v10;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);
    CFRelease(v12);

  }
}

void __114__TLPreferencesUtilities__enumerateKeysAndValuesWithEligibleKeyPrefixes_inDomain_usingPreferencesScope_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      v8 = v6;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = *(id *)(a1 + 32);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            if (objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              goto LABEL_13;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

}

+ (__CFDictionary)_copyAllKeysAndValuesFromDomain:(__CFString *)a3 usingPreferencesScope:(int)a4
{
  CFStringRef *v4;

  if (!a4)
  {
    v4 = (CFStringRef *)MEMORY[0x1E0C9B230];
    return CFPreferencesCopyMultiple(0, a3, (CFStringRef)*MEMORY[0x1E0C9B260], *v4);
  }
  if (a4 == 1)
  {
    v4 = (CFStringRef *)MEMORY[0x1E0C9B250];
    return CFPreferencesCopyMultiple(0, a3, (CFStringRef)*MEMORY[0x1E0C9B260], *v4);
  }
  return 0;
}

+ (void)_setValue:(void *)a3 forKey:(__CFString *)a4 inDomain:(__CFString *)a5 usingPreferencesScope:(int)a6
{
  if (a6 == 1)
  {
    CFPreferencesSetValue(a4, a3, a5, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  }
  else if (!a6)
  {
    CFPreferencesSetAppValue(a4, a3, a5);
  }
}

+ (void)_synchronizeDomain:(__CFString *)a3 usingPreferencesScope:(int)a4
{
  CFStringRef *v4;

  if (a4)
  {
    if (a4 != 1)
      return;
    v4 = (CFStringRef *)MEMORY[0x1E0C9B250];
  }
  else
  {
    v4 = (CFStringRef *)MEMORY[0x1E0C9B230];
  }
  CFPreferencesSynchronize(a3, (CFStringRef)*MEMORY[0x1E0C9B260], *v4);
}

@end
