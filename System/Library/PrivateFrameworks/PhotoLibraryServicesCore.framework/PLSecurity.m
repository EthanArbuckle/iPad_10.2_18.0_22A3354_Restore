@implementation PLSecurity

+ (id)connection:(id)a3 grantedEntitlements:(id)a4
{
  id v5;
  id v6;
  void *v7;
  SecTaskRef v8;
  SecTaskRef v9;
  uint64_t v10;
  audit_token_t v12;
  __int128 v13;
  __int128 v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    xpc_connection_get_audit_token();
    memset(&v12, 0, sizeof(v12));
    v8 = SecTaskCreateWithAuditToken(0, &v12);
    if (v8)
    {
      v9 = v8;
      objc_msgSend((id)objc_opt_class(), "_secTask:grantedEntitlements:", v8, v6);
      v10 = objc_claimAutoreleasedReturnValue();

      CFRelease(v9);
      v7 = (void *)v10;
    }
  }

  return v7;
}

+ (BOOL)connection:(id)a3 hasEntitlement:(id)a4
{
  id v6;
  SecTaskRef v7;
  SecTaskRef v8;
  char v9;
  audit_token_t v11;
  __int128 v12;
  __int128 v13;

  v6 = a4;
  if (a3
    && (v12 = 0u,
        v13 = 0u,
        xpc_connection_get_audit_token(),
        memset(&v11, 0, sizeof(v11)),
        (v7 = SecTaskCreateWithAuditToken(0, &v11)) != 0))
  {
    v8 = v7;
    v9 = objc_msgSend(a1, "secTask:hasEntitlement:", v7, v6);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)secTask:(__SecTask *)a3 hasEntitlement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_class();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_secTask:grantedEntitlements:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = objc_msgSend(v8, "count") != 0;
  return (char)a3;
}

+ (id)_secTask:(__SecTask *)a3 grantedEntitlements:(id)a4
{
  id v5;
  void *v6;
  CFDictionaryRef v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v7 = SecTaskCopyValuesForEntitlements(a3, (CFArrayRef)v5, 0);
    if (v7)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            -[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v13, (_QWORD)v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "BOOLValue");

            if (v15)
              objc_msgSend(v6, "addObject:", v13);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }

    }
  }

  return v6;
}

+ (BOOL)containsPhotoKitEntitlement:(id)a3
{
  return objc_msgSend(a3, "containsObject:", CFSTR("com.apple.photos.bourgeoisie"));
}

+ (BOOL)hasXPCStoreEntitlementOptInForToken:(id *)a3
{
  void *v3;
  void *v4;
  BOOL value;

  objc_msgSend(CFSTR("com.apple.private.photos.XPCStoreOptIn"), "UTF8String", 0, 0, 0, 0);
  v3 = (void *)xpc_copy_entitlement_for_token();
  v4 = v3;
  if (v3)
    value = xpc_BOOL_get_value(v3);
  else
    value = 0;

  return value;
}

+ (BOOL)isEntitledForPhotoKitOrPrivatePhotosTCCForToken:(id *)a3
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const char *CStringPtr;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD applier[5];
  __int128 v12;
  __int128 v13;

  objc_msgSend(CFSTR("com.apple.photos.bourgeoisie"), "UTF8String");
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)xpc_copy_entitlement_for_token();
  v4 = v3;
  if (v3 && xpc_BOOL_get_value(v3))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*MEMORY[0x1E0DB1188], 0x8000100u);
    v7 = (void *)xpc_copy_entitlement_for_token();
    v8 = v7;
    if (v7)
      v9 = CStringPtr == 0;
    else
      v9 = 1;
    if (v9)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __62__PLSecurity_isEntitledForPhotoKitOrPrivatePhotosTCCForToken___block_invoke;
      applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
      applier[4] = CStringPtr;
      v5 = !xpc_array_apply(v7, applier);
    }

  }
  return v5;
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  id v5;
  __int128 v6;
  SecTaskRef v7;
  SecTaskRef v8;
  BOOL v9;
  audit_token_t v11;

  v5 = a4;
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v11.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v11.val[4] = v6;
  v7 = SecTaskCreateWithAuditToken(0, &v11);
  if (v7)
  {
    v8 = v7;
    v9 = +[PLSecurity secTask:hasEntitlement:](PLSecurity, "secTask:hasEntitlement:", v7, v5);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)connection:(id)a3 valuesForEntitlements:(id)a4
{
  id v5;
  const __CFArray *v6;
  void *v7;
  __SecTask *v8;
  __SecTask *v9;
  CFDictionaryRef v10;
  const __CFArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const __CFArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  audit_token_t token;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const __CFArray *)a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v25 = 0u;
    v26 = 0u;
    xpc_connection_get_audit_token();
    memset(&token, 0, sizeof(token));
    v8 = SecTaskCreateWithAuditToken(0, &token);
    if (v8)
    {
      v9 = v8;
      v10 = SecTaskCopyValuesForEntitlements(v8, v6, 0);
      if (v10)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v19 = v6;
        v11 = v6;
        v12 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
              -[__CFDictionary objectForKey:](v10, "objectForKey:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v7, "setObject:forKey:", v17, v16);

            }
            v13 = -[__CFArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
          }
          while (v13);
        }

        v6 = v19;
      }
      CFRelease(v9);

    }
  }

  return v7;
}

+ (id)connection:(id)a3 valueForEntitlement:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "connection:valuesForEntitlements:", v8, v9, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isEntitledForPhotoKit
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PLSecurity_isEntitledForPhotoKit__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  pl_dispatch_once(&isEntitledForPhotoKit_onceToken, v3);
  return isEntitledForPhotoKit_selfEntitled;
}

+ (BOOL)connectionIsEntitledForPhotoKit:(id)a3
{
  return objc_msgSend(a1, "connection:hasEntitlement:", a3, CFSTR("com.apple.photos.bourgeoisie"));
}

BOOL __62__PLSecurity_isEntitledForPhotoKitOrPrivatePhotosTCCForToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *string_ptr;
  _BOOL8 v6;

  v4 = a3;
  v6 = 1;
  if (object_getClass(v4) == (Class)MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, *(const char **)(a1 + 32)))
      v6 = 0;
  }

  return v6;
}

void __35__PLSecurity_isEntitledForPhotoKit__block_invoke(uint64_t a1)
{
  SecTaskRef v2;
  SecTaskRef v3;

  v2 = SecTaskCreateFromSelf(0);
  if (v2)
  {
    v3 = v2;
    isEntitledForPhotoKit_selfEntitled = objc_msgSend(*(id *)(a1 + 32), "secTask:hasEntitlement:", v2, CFSTR("com.apple.photos.bourgeoisie"));
    CFRelease(v3);
  }
}

@end
