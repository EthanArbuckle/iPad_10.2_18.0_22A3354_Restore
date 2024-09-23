@implementation NSError(RCErrorAdditions)

+ (id)rc_errorWithCode:()RCErrorAdditions description:additionalUserInfo:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  if (v8)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCErrorDomain"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)rc_errorWithCode:()RCErrorAdditions description:
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", a3, a4, 0);
}

+ (uint64_t)rc_notCachedError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 4, CFSTR("The operation could not be completed with just the contents of the cache."), MEMORY[0x1E0C9AA70]);
}

+ (uint64_t)rc_notAvailableError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 5, CFSTR("The requested data is not available."), MEMORY[0x1E0C9AA70]);
}

+ (id)rc_offlineErrorWithReason:()RCErrorAdditions
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("RCErrorOfflineReasonKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 7, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)rc_missingConfigErrorWithUnderlyingError:()RCErrorAdditions
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqual:", v4),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Failed to load the configuration."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCErrorDomain"), 10, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (uint64_t)rc_parsingError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 9, CFSTR("The response could not be parsed into a valid configuration."), MEMORY[0x1E0C9AA70]);
}

+ (id)rc_endpointErrorWithUnderlyingEndpointErrors:()RCErrorAdditions
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "description", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("The endpoint returned one or more errors."), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, CFSTR("RCErrorEndpointErrorsKey"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCErrorDomain"), 14, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (uint64_t)rc_unknownBackgroundNetworkOperationError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 12, CFSTR("The background URL session did become invalid but not error was provided."), MEMORY[0x1E0C9AA70]);
}

@end
