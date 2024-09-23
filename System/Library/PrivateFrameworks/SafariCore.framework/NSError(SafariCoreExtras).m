@implementation NSError(SafariCoreExtras)

+ (void)safari_setPrivacyPreservingUserInfoProviderForDomain:()SafariCoreExtras provider:
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__NSError_SafariCoreExtras__safari_setPrivacyPreservingUserInfoProviderForDomain_provider___block_invoke;
  v10[3] = &unk_1E649CEF0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:", v10);

}

- (uint64_t)safari_matchesErrorDomain:()SafariCoreExtras andCode:
{
  uint64_t result;

  result = objc_msgSend(a1, "safari_matchesErrorDomain:");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == a4;
  return result;
}

- (uint64_t)safari_matchesErrorDomain:()SafariCoreExtras
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (id)safari_privacyPreservingDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "safari_privacyPreservingError");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)safari_privacyPreservingError
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  __CFString *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *(*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_privacyPreservingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v4);

  v7 = *MEMORY[0x1E0CB2F70];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_7_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v7);

  objc_msgSend(a1, "domain");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &stru_1E64A2498;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  v35 = 0;
  v14 = (void *)objc_opt_class();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __58__NSError_SafariCoreExtras__safari_privacyPreservingError__block_invoke_2;
  v27 = &unk_1E649CF18;
  v29 = &v30;
  v15 = v13;
  v28 = v15;
  objc_msgSend(v14, "_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:", &v24);
  v16 = v31[5];
  if (v16)
  {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v17, v24, v25, v26, v27);

  }
  objc_msgSend(a1, "userInfo", v24, v25, v26, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safari_stringForKey:", CFSTR("WBSPrivacyPreservingDescription"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (!-[__CFString length](v15, "length")
      || (objc_msgSend(MEMORY[0x1E0CB35C8], "userInfoValueProviderForDomain:", v15),
          v20 = objc_claimAutoreleasedReturnValue(),
          (v21 = (void *)v20) == 0))
    {
      v19 = 0;
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, void *, const __CFString *))(v20 + 16))(v20, a1, CFSTR("WBSPrivacyPreservingDescription"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_12;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("WBSPrivacyPreservingDescription"));
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v15, objc_msgSend(a1, "code"), v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v30, 8);
  return v22;
}

+ (void)_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:()SafariCoreExtras
{
  uint64_t v3;
  void (**v4)(id, uint64_t);

  v3 = _safari_getPrivacyPreservingUserInfoProvidersUsingBlock__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__onceToken, &__block_literal_global_20);
  os_unfair_lock_lock((os_unfair_lock_t)&_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__lock);
  v4[2](v4, _safari_getPrivacyPreservingUserInfoProvidersUsingBlock__privacyPreservingUserInfoProviders);

  os_unfair_lock_unlock((os_unfair_lock_t)&_safari_getPrivacyPreservingUserInfoProvidersUsingBlock__lock);
}

+ (id)safari_errorWithDomain:()SafariCoreExtras code:privacyPreservingDescription:
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([a1 alloc], "safari_initWithDomain:code:privacyPreservingDescription:", v9, a4, v8);

  return v10;
}

- (uint64_t)safari_initWithDomain:()SafariCoreExtras code:privacyPreservingDescription:
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5)
  {
    v13 = CFSTR("WBSPrivacyPreservingDescription");
    v14[0] = a5;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = a5;
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    a5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = objc_msgSend(a1, "initWithDomain:code:userInfo:", v8, a4, a5);

  return v11;
}

+ (id)safari_privacyPreservingUserInfoProviderForDomain:()SafariCoreExtras
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *(*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__NSError_SafariCoreExtras__safari_privacyPreservingUserInfoProviderForDomain___block_invoke;
  v8[3] = &unk_1E649CF18;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  objc_msgSend(a1, "_safari_getPrivacyPreservingUserInfoProvidersUsingBlock:", v8);
  v6 = _Block_copy((const void *)v12[5]);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)safari_isOrContainsClientSideNetworkError
{
  void *v2;
  int v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v3)
  {
    v4 = objc_msgSend(a1, "code") + 1020;
    if (v4 < 0x14 && ((0x88803u >> v4) & 1) != 0)
      return 1;
  }
  objc_msgSend(a1, "underlyingErrors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_containsObjectPassingTest:", &__block_literal_global_4);

  return v6;
}

- (uint64_t)safari_isSQLiteError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.Safari.SQLite"));

  return v2;
}

- (uint64_t)safari_isSQLiteCorruptionError
{
  uint64_t result;

  result = objc_msgSend(a1, "safari_isSQLiteError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 11;
  return result;
}

- (uint64_t)safari_isOrContainsNetworkUnavailableError
{
  if ((objc_msgSend(a1, "safari_isOrContainsClientSideNetworkError") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 3);
}

- (uint64_t)safari_matchesErrorDomainsAndCodes:()SafariCoreExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
