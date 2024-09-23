@implementation NSError(SafariSharedCloudKitExtras)

+ (uint64_t)safari_setUpCloudKitPrivacyPreservingUserInfoProvider
{
  return objc_msgSend(a1, "safari_setPrivacyPreservingUserInfoProviderForDomain:provider:", *MEMORY[0x1E0C947D8], &__block_literal_global_19);
}

- (void)_safari_enumerateCloudKitErrorsWithBlock:()SafariSharedCloudKitExtras
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(id, void *, _BYTE *);
  char v13;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v6)
  {
    v13 = 0;
    v4[2](v4, a1, &v13);
    if (!v13 && objc_msgSend(a1, "code") == 2)
    {
      objc_msgSend(a1, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safari_dictionaryForKey:", *MEMORY[0x1E0C94940]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __80__NSError_SafariSharedCloudKitExtras___safari_enumerateCloudKitErrorsWithBlock___block_invoke;
      v10[3] = &unk_1E649CE00;
      v11 = v8;
      v12 = v4;
      v9 = v8;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
  }

}

- (uint64_t)safari_hasOrContainsErrorWithCloudKitErrorCode:()SafariSharedCloudKitExtras
{
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__NSError_SafariSharedCloudKitExtras__safari_hasOrContainsErrorWithCloudKitErrorCode___block_invoke;
  v5[3] = &unk_1E649CE28;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "_safari_enumerateCloudKitErrorsWithBlock:", v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:()SafariSharedCloudKitExtras
{
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__NSError_SafariSharedCloudKitExtras__safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode___block_invoke;
  v5[3] = &unk_1E649CE28;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "_safari_enumerateCloudKitErrorsWithBlock:", v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)safari_isInCloudKitErrorDomain
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  return v2;
}

- (uint64_t)safari_isCloudKitBatchTooLargeError
{
  uint64_t result;

  result = objc_msgSend(a1, "safari_isInCloudKitErrorDomain");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 27;
  return result;
}

- (uint64_t)safari_isCloudKitNonExistentRecordError
{
  uint64_t result;

  result = objc_msgSend(a1, "safari_isInCloudKitErrorDomain");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 11;
  return result;
}

- (uint64_t)safari_isCloudKitMissingZoneError
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C947D8];
  v6[0] = &unk_1E64D1160;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "safari_matchesErrorDomainsAndCodes:", v2);

  return v3;
}

- (uint64_t)safari_isOrContainsCloudKitMissingZoneError
{
  return objc_msgSend(a1, "_safari_isOrContainsCloudKitErrorOfCodes:checkInternalErrorCode:", &unk_1E64D1178, 0);
}

- (BOOL)safari_containsCloudKitMissingZoneErrorForRecordZoneID:()SafariSharedCloudKitExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safari_isCloudKitMissingZoneError");

  if ((v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __94__NSError_SafariSharedCloudKitExtras__safari_containsCloudKitMissingZoneErrorForRecordZoneID___block_invoke;
    v11[3] = &unk_1E649CE50;
    v12 = v4;
    v13 = &v14;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }

  return v9;
}

- (BOOL)_safari_isOrContainsCloudKitErrorOfCodes:()SafariSharedCloudKitExtras checkInternalErrorCode:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  if (objc_msgSend(a1, "safari_isInCloudKitErrorDomain"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "code");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = 1;
    }
    else if (v8 == 2)
    {
      objc_msgSend(a1, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v22 = 0;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __103__NSError_SafariSharedCloudKitExtras___safari_isOrContainsCloudKitErrorOfCodes_checkInternalErrorCode___block_invoke;
        v15[3] = &unk_1E649CE78;
        v16 = v7;
        v17 = &v19;
        v18 = a4;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);
        v11 = *((_BYTE *)v20 + 24) != 0;

        _Block_object_dispose(&v19, 8);
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID:()SafariSharedCloudKitExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C947D8];
  v7 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((v7 & 1) != 0)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C94FF8], "itemErrorFromError:forID:", a1, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "code") != 2)
      {
        v17 = v9;
        goto LABEL_12;
      }

    }
    objc_msgSend(a1, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(a1, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __102__NSError_SafariSharedCloudKitExtras__safari_errorByAddingCloudKitPrivacyPreservingUserInfoForItemID___block_invoke;
      v21[3] = &unk_1E649CEA0;
      v14 = v13;
      v22 = v14;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v21);
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("; "));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = CFSTR("None");
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A48]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request UUID: %@; Partial errors: %@"), v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("WBSPrivacyPreservingDescription"));

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v6, objc_msgSend(a1, "code"), v12);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v17 = a1;
LABEL_12:
    objc_msgSend(v17, "safari_errorByAddingRequestUUIDInPrivacyPreservingUserInfo");
    v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v16 = a1;
LABEL_16:

  return v16;
}

- (id)safari_errorByAddingRequestUUIDInPrivacyPreservingUserInfo
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C947D8];
  v4 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A48]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Request UUID: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("WBSPrivacyPreservingDescription"));

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v3, objc_msgSend(a1, "code"), v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = a1;
  }
  return v10;
}

- (uint64_t)safari_isUnrecoverableCloudKitError
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = objc_msgSend(a1, "safari_isInCloudKitErrorDomain");
  if ((_DWORD)result)
  {
    v3 = objc_msgSend(a1, "code");
    result = 1;
    if (v3 <= 0x23)
    {
      if (((1 << v3) & 0xBE31FB722) != 0)
        return result;
      if (((1 << v3) & 0x41CE048DCLL) != 0)
        return 0;
    }
    v4 = v3 - 110;
    if (v4 > 0x1E || ((1 << v4) & 0x40307C07) == 0)
      return 0;
  }
  return result;
}

@end
