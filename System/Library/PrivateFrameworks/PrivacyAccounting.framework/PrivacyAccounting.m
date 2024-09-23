id logger()
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global_206);
  return (id)logger_log;
}

id logger_0()
{
  if (logger_onceToken_0 != -1)
    dispatch_once(&logger_onceToken_0, &__block_literal_global_194);
  return (id)logger_log_0;
}

id logger_1()
{
  if (logger_onceToken_1 != -1)
    dispatch_once(&logger_onceToken_1, &__block_literal_global_117);
  return (id)logger_log_1;
}

id logger_2()
{
  if (logger_onceToken_2 != -1)
    dispatch_once(&logger_onceToken_2, &__block_literal_global_85);
  return (id)logger_log_2;
}

void PARegisterUserInfoValueProviderForPAErrorDomain()
{
  if (PARegisterUserInfoValueProviderForPAErrorDomain_registerOnce != -1)
    dispatch_once(&PARegisterUserInfoValueProviderForPAErrorDomain_registerOnce, &__block_literal_global_9);
}

void sub_1A5DE395C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1A5DE3DB0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DE40D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  __destructor_8_s0_s8_s16(&a33);
  _Unwind_Resume(a1);
}

void sub_1A5DE4294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A5DE4C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A5DE4E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A5DE4E94(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DE4EF0(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DE5788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1A5DE5BE4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1A5DE6494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1A5DE6630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1A5DE68E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __logger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivacyAccounting", "PATCCAccess");
  v1 = (void *)logger_log;
  logger_log = (uint64_t)v0;

}

void __logger_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivacyAccounting", "PAAccessReader");
  v1 = (void *)logger_log_0;
  logger_log_0 = (uint64_t)v0;

}

void __logger_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivacyAccounting", "PACoalescingIntervalTracker");
  v1 = (void *)logger_log_1;
  logger_log_1 = (uint64_t)v0;

}

void __logger_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivacyAccounting", "PALSUtils");
  v1 = (void *)logger_log_2;
  logger_log_2 = (uint64_t)v0;

}

PAProcessStateMonitor *PASharedProcessStateMonitor()
{
  return +[PAProcessStateMonitor sharedInstance](PAProcessStateMonitor, "sharedInstance");
}

void sub_1A5DE8700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A5DE8894(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DEA4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PAImplicitClientIdentityForEntitlementDictionary(void *a1, void *a2)
{
  return implicitIdentityForEntitlementDictionary(a1, a2, 0);
}

id implicitIdentityForEntitlementDictionary(void *a1, void *a2, char *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.attribution.app-store-app.usage-reporting-only.implicitly-assumed-identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.attribution.app-store-app.usage-reporting-only.implicitly-assumed-identity"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "hasPrefix:", CFSTR("/"));
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v14 = (void *)tcc_identity_create();
LABEL_14:

        goto LABEL_15;
      }
      logger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        implicitIdentityForEntitlementDictionary_cold_1();

    }
    v14 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.attribution.usage-reporting-only.implicitly-assumed-identity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = CFSTR("com.apple.private.attribution.usage-reporting-only.implicitly-assumed-identity");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.attribution.implicitly-assumed-identity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v15 = 0;
      v14 = 0;
      if (!a3)
        goto LABEL_17;
      goto LABEL_16;
    }
    v11 = CFSTR("com.apple.private.attribution.implicitly-assumed-identity");
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  implicitIdentityEntryToTCCIdentity(v8, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  v15 = 1;
  if (a3)
LABEL_16:
    *a3 = v15;
LABEL_17:

  return v14;
}

id PAImplicitClientIdentityForBundle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  implicitIdentityForEntitlementDictionary(v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL PAEntitlementDictionaryBelongsToSystemProcess(void *a1)
{
  void *v1;
  _BOOL8 v2;

  implicitIdentityForEntitlementDictionary(a1, CFSTR("<anonymous entitlement dictionary>"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = tcc_identity_get_type() != 0;
  else
    v2 = 0;

  return v2;
}

BOOL PABundleRecordBelongsToSystemProcess(void *a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "entitlements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("com.apple.private.attribution.implicitly-assumed-identity"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = tcc_identity_get_type() != 0;
  else
    v3 = 0;

  return v3;
}

id PAAuthenticatedClientIdentity(_OWORD *a1, void *a2)
{
  __int128 v3;
  const __CFAllocator *v4;
  id v5;
  SecTaskRef v6;
  __SecTask *v7;
  const __CFArray *v8;
  CFDictionaryRef v9;
  __CFError *v10;
  __CFError *v11;
  BOOL v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  PALazyAuditTokenBasedClientIdentity *v20;
  __int128 v21;
  PALazyAuditTokenBasedClientIdentity *v22;
  void *v23;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v3;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = a2;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    *(_QWORD *)token.val = CFSTR("com.apple.private.attribution.explicitly-assumed-identities");
    *(_QWORD *)&token.val[2] = CFSTR("com.apple.private.attribution.implicitly-assumed-identity");
    *(_QWORD *)&token.val[4] = CFSTR("com.apple.private.attribution.usage-reporting-only.implicitly-assumed-identity");
    *(_QWORD *)&token.val[6] = CFSTR("com.apple.private.attribution.app-store-app.usage-reporting-only.implicitly-assumed-identity");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &token, 4);
    v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    error = 0;
    v9 = SecTaskCopyValuesForEntitlements(v7, v8, &error);
    v10 = error;
    v11 = v10;
    if (v9)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (!v12)
    {
      logger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        PAAuthenticatedClientIdentity_cold_1((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);

    }
    CFRelease(v7);

  }
  else
  {
    logger();
    v8 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_impl(&dword_1A5DE1000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "Failed to create SecTaskRef for audit token", (uint8_t *)&token, 2u);
    }
    v9 = 0;
  }

  v20 = [PALazyAuditTokenBasedClientIdentity alloc];
  v21 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v21;
  v22 = -[PALazyAuditTokenBasedClientIdentity initWithAuditToken:](v20, "initWithAuditToken:", &token);
  PAAuthenticatedClientIdentityWithClientProperties(v9, v22, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id PAAuthenticatedClientIdentityWithClientProperties(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t type;
  unint64_t v28;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  id v36;
  void *v38;
  int v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSObject *obj;
  id v46;
  uint64_t v47;
  id v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  int buf;
  unint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v49 = 0;
  implicitIdentityForEntitlementDictionary(v5, v6, &v49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v49)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (v10)
    goto LABEL_36;
  if (!v8)
  {
    if (v7)
    {
LABEL_14:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.attribution.explicitly-assumed-identities"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v7;
      v16 = v15;
      v46 = v6;
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          obj = v16;
          v47 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
          if (v47)
          {
            v42 = v6;
            v41 = v16;
            v43 = v7;
            v44 = v5;
            v17 = *(_QWORD *)v51;
            v18 = v46;
            while (2)
            {
              for (i = 0; i != v47; ++i)
              {
                if (*(_QWORD *)v51 != v17)
                  objc_enumerationMutation(obj);
                v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                v21 = v48;
                v22 = v20;
                v23 = v18;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v24 = v17;
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("type"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("value"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  type = tcc_identity_get_type();
                  v28 = type;
                  if (type >= 4)
                  {
                    logger();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                    {
                      buf = 134217984;
                      v56 = v28;
                      _os_log_fault_impl(&dword_1A5DE1000, v31, OS_LOG_TYPE_FAULT, "Unexpected tcc_identity_type_t: %llu", (uint8_t *)&buf, 0xCu);
                    }

                    v29 = 0;
                  }
                  else
                  {
                    v29 = off_1E4FA4E30[type];
                  }
                  if (objc_msgSend(v25, "isEqual:", v29))
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v26, "isEqual:", v32);

                    if ((v33 & 1) != 0)
                    {

LABEL_49:
                      v36 = v21;
                      v7 = v43;
                      v5 = v44;
                      v6 = v42;
                      goto LABEL_39;
                    }
                  }
                  v34 = objc_msgSend(v25, "isEqual:", CFSTR("wildcard"));

                  v18 = v46;
                  v17 = v24;
                  if ((v34 & 1) != 0)
                    goto LABEL_49;
                }
                else
                {
                  logger();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                  {
                    buf = 138543618;
                    v56 = (unint64_t)v18;
                    v57 = 2114;
                    v58 = v22;
                    _os_log_fault_impl(&dword_1A5DE1000, v30, OS_LOG_TYPE_FAULT, "BUG IN %{public}@! They have a malformed explicitly assumed identity entitlement. Each entry should be a dictionary describing an identity, but we got %{public}@", (uint8_t *)&buf, 0x16u);
                  }

                }
              }
              v47 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
              if (v47)
                continue;
              break;
            }
            v7 = v43;
            v5 = v44;
            v16 = v41;
            v6 = v42;
          }
        }
        else
        {
          logger();
          obj = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
            PAAuthenticatedClientIdentityWithClientProperties_cold_2();
        }

      }
      objc_msgSend(v46, "identity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = areTCCIdentitiesEqual(v48, v38);

      if (v39)
      {
        v35 = v46;
      }
      else
      {
        logger();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
          PAAuthenticatedClientIdentityWithClientProperties_cold_1((uint64_t)v46, (uint64_t)v48, v40);

        v35 = v46;
      }
      goto LABEL_37;
    }
LABEL_36:
    v35 = v6;
LABEL_37:
    objc_msgSend(v35, "identity");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (v7 && !areTCCIdentitiesEqual(v8, v7))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.private.attribution.permit-mixed-identities"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if ((v12 & 1) == 0)
    {
      logger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        PAAuthenticatedClientIdentityWithClientProperties_cold_3((uint64_t)v6, (uint64_t)v7, v13);

      goto LABEL_12;
    }
    goto LABEL_14;
  }
LABEL_12:
  v14 = v9;
LABEL_38:
  v36 = v14;
LABEL_39:

  return v36;
}

uint64_t areTCCIdentitiesEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t type;
  void *v7;
  void *v8;
  int v9;
  uint64_t verifier_type;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
    goto LABEL_9;
  if ((v3 == 0) == (v4 != 0))
    goto LABEL_8;
  type = tcc_identity_get_type();
  if (type != tcc_identity_get_type())
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (!v9 || (verifier_type = tcc_identity_get_verifier_type(), verifier_type != tcc_identity_get_verifier_type()))
  {
LABEL_8:
    v13 = 0;
    goto LABEL_10;
  }
  if (!verifier_type)
  {
LABEL_9:
    v13 = 1;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_verifier_code_requirement_string());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_verifier_code_requirement_string());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

LABEL_10:
  return v13;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __lookupTCCIdentity_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    logger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __lookupTCCIdentity_block_invoke_cold_1(a3, v7, v8, v9, v10, v11, v12, v13);

  }
}

id implicitIdentityEntryToTCCIdentity(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      logger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        implicitIdentityEntryToTCCIdentity_cold_3();
      v8 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (tccIdentityTypeForIdentityTypeString_once != -1)
      dispatch_once(&tccIdentityTypeForIdentityTypeString_once, &__block_literal_global_201);
    objc_msgSend((id)tccIdentityTypeForIdentityTypeString_mapping, "objectForKeyedSubscript:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[NSObject intValue](v6, "intValue");
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
      v7 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_retainAutorelease(v7);
        -[NSObject UTF8String](v7, "UTF8String");
        v8 = (void *)tcc_identity_create();
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      logger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        implicitIdentityEntryToTCCIdentity_cold_2();

    }
    else
    {
      logger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        implicitIdentityEntryToTCCIdentity_cold_1((uint64_t)v4, v3, v7);
    }
    v8 = 0;
    goto LABEL_18;
  }
  v8 = 0;
LABEL_20:

  return v8;
}

void __tccIdentityTypeForIdentityTypeString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("bundleID");
  v2[1] = CFSTR("path");
  v3[0] = &unk_1E4FAC4D0;
  v3[1] = &unk_1E4FAC4E8;
  v2[2] = CFSTR("hostedUUID");
  v2[3] = CFSTR("fileProviderID");
  v3[2] = &unk_1E4FAC500;
  v3[3] = &unk_1E4FAC518;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tccIdentityTypeForIdentityTypeString_mapping;
  tccIdentityTypeForIdentityTypeString_mapping = v0;

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return tcc_object_copy_description();
}

BOOL PAPBReplayKitAccessReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PAPBAccess *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(PAPBApplication);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (PAPBApplicationReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1A5DEC800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A5DECB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s8_s16(id *a1)
{

}

void sub_1A5DECC90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DED10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1A5DED50C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DEE28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A5DEE4A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1A5DEE6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1A5DEEA00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_1A5DEEA7C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL writeBytesToStream(void *a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  _BOOL8 v14;

  v7 = a1;
  if (a3)
  {
    v8 = 0;
    v9 = 512;
    v10 = a3;
    while (1)
    {
      v11 = objc_msgSend(v7, "write:maxLength:", a2 + v8, v10);
      if (v11 < 0)
        break;
      if (!v11)
      {
        v9 = 640;
        break;
      }
      v10 -= v11;
      if (v10)
      {
        v8 += v11;
        if (v8 < a3)
          continue;
      }
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v9, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;
    if (a4 && v13)
    {
      v13 = objc_retainAutorelease(v13);
      *a4 = v13;
      v12 = 1;
    }
  }
  else
  {
LABEL_7:
    v12 = 0;
    v13 = 0;
  }
  v14 = !v12;

  return v14;
}

BOOL PAPBTCCAccessReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PAPBAccess *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(PAPBAccess **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PAPBAccessReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  PAPBApplication *v18;
  uint64_t result;
  uint64_t v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = objc_alloc_init(PAPBApplication);
          objc_storeStrong((id *)(a1 + 24), v18);
          if (PBReaderPlaceMark() && (PAPBApplicationReadFrom((uint64_t)v18, a2) & 1) != 0)
          {
            PBReaderRecallMark();
            goto LABEL_37;
          }

          return 0;
        case 2u:
          PBReaderReadData();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = v20;

          continue;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 52) |= 4u;
          while (2)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
              *(_QWORD *)(a2 + v25) = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v15 = v23++ >= 9;
                if (v15)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v24) = 0;
LABEL_48:
          v38 = 48;
          goto LABEL_53;
        case 4u:
          *(_BYTE *)(a1 + 52) |= 1u;
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v30 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v31 = 0;
          }
          *(_QWORD *)(a1 + 8) = v31;
          continue;
        case 5u:
          PBReaderReadData();
          v18 = (PAPBApplication *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend((id)a1, "addAssetIdentifiers:", v18);
LABEL_37:

          continue;
        case 6u:
          v32 = 0;
          v33 = 0;
          v24 = 0;
          *(_BYTE *)(a1 + 52) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v36;
        v24 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_50;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          LODWORD(v24) = 0;
          goto LABEL_52;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v24) = 0;
LABEL_52:
      v38 = 16;
LABEL_53:
      *(_DWORD *)(a1 + v38) = v24;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1A5DF0A90(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A5DF0BCC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

uint64_t PABundleRecordIsVisibleApplication(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EE80EFB0))
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "appTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", CFSTR("hidden")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.springboard")) ^ 1;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id PAAssociatedBundleIdentifiersForApplication(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void (**v4)(void *, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD aBlock[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __PAAssociatedBundleIdentifiersForApplication_block_invoke;
    aBlock[3] = &unk_1E4FA51A8;
    v3 = v2;
    v19 = v3;
    v4 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(v1, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v5);

    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v1, "applicationExtensionRecords", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v8);
    }

    v12 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void *PADefaultBundleRecordRetriever()
{
  if (PADefaultBundleRecordRetriever_once != -1)
    dispatch_once(&PADefaultBundleRecordRetriever_once, &__block_literal_global_6);
  return _Block_copy((const void *)PADefaultBundleRecordRetriever_result);
}

void sub_1A5DF1DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id coalesceGroupedRecordsToRepublish(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  PACoalescedAccessRecord *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v24[4];
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v10, "count") < 2)
        {
          objc_msgSend(v10, "firstObject");
          v18 = (PACoalescedAccessRecord *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "lastObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "access");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if ((a2 & 1) != 0)
          {
            objc_msgSend(v10, "lastObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "startTime");
            v15 = v14;

            objc_msgSend(v10, "valueForKeyPath:", CFSTR("@max.endTime"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "doubleValue");
          }
          else
          {
            objc_msgSend(v10, "valueForKeyPath:", CFSTR("@min.startTime"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            v15 = v20;

            objc_msgSend(v10, "lastObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "endTime");
          }
          v21 = v17;

          v18 = -[PACoalescedAccessRecord initWithAccess:startTime:endTime:count:]([PACoalescedAccessRecord alloc], "initWithAccess:startTime:endTime:count:", v12, objc_msgSend(v10, "count"), v15, v21);
        }
        objc_msgSend(v4, "addObject:", v18);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __coalesceGroupedRecordsToRepublish_block_invoke;
  v24[3] = &__block_descriptor_33_e59_q24__0__PACompleteAccessRecord_8__PACompleteAccessRecord_16l;
  v25 = a2;
  objc_msgSend(v4, "sortUsingComparator:", v24);
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

uint64_t __coalesceGroupedRecordsToRepublish_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v5, "startTime");
    v8 = v7;
    objc_msgSend(v6, "startTime");
    if (v8 >= v9)
    {
      objc_msgSend(v5, "startTime");
      v15 = v14;
      objc_msgSend(v6, "startTime");
      if (v15 <= v16)
        v10 = 0;
      else
        v10 = -1;
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    objc_msgSend(v5, "endTime");
    v12 = v11;
    objc_msgSend(v6, "endTime");
    if (v12 >= v13)
    {
      objc_msgSend(v5, "endTime");
      v18 = v17;
      objc_msgSend(v6, "endTime");
      v10 = v18 > v19;
    }
    else
    {
      v10 = -1;
    }
  }

  return v10;
}

uint64_t PAPBOutOfProcessPickerAccessReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  PAPBAccess *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PAPBLocationAccessReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  PAPBAccess *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PAPBAccess);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (PAPBAccessReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

const __CFString *PAApplicationIdentifierTypeToString(unint64_t a1)
{
  if (a1 > 4)
    return CFSTR("unknown");
  else
    return off_1E4FA5558[a1];
}

uint64_t PAPBApplicationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PAErrorBoolValueForUserInfoKey(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSNumber())
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

void sub_1A5DF6634()
{
  id v0;
  void *v1;
  unsigned int greenTeaDeviceCapability;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    greenTeaDeviceCapability = MobileGestalt_get_greenTeaDeviceCapability();

    qword_1EE809598 = greenTeaDeviceCapability;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1A5DF66BC()
{
  if (qword_1ECDD3180 != -1)
    swift_once();
  return qword_1EE809598;
}

id _PALoggingOptions.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id _PALoggingOptions.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PALoggingOptions();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for _PALoggingOptions()
{
  return objc_opt_self();
}

id _PALoggingOptions.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _PALoggingOptions();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for _PALoggingOptions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static _PALoggingOptions.defaultLoggingOptions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

void type metadata accessor for PAAccessCategory()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EE808C40)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EE808C40);
  }
}

uint64_t sub_1A5DF6840(uint64_t a1, uint64_t a2)
{
  return sub_1A5DF6AA8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1A5DF684C(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1A5DFF8E4();
  *a2 = 0;
  return result;
}

uint64_t sub_1A5DF68C0(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1A5DFF8F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1A5DF693C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1A5DFF8FC();
  v2 = sub_1A5DFF8D8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A5DF697C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1A5DFF8D8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1A5DF69C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A5DFF8FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1A5DF69E8()
{
  sub_1A5DF6C40(&qword_1EE808C60, (uint64_t)&unk_1A5E02230);
  sub_1A5DF6C40(&qword_1EE808C68, (uint64_t)&unk_1A5E021D0);
  return sub_1A5DFF9EC();
}

uint64_t sub_1A5DF6A54()
{
  return sub_1A5DF6C40(&qword_1EE808C48, (uint64_t)&unk_1A5E02194);
}

uint64_t sub_1A5DF6A78()
{
  return sub_1A5DF6C40(&qword_1EE808C50, (uint64_t)&unk_1A5E02168);
}

uint64_t sub_1A5DF6A9C(uint64_t a1, uint64_t a2)
{
  return sub_1A5DF6AA8(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1A5DF6AA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1A5DFF8FC();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1A5DF6AE4()
{
  sub_1A5DFF8FC();
  sub_1A5DFF908();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5DF6B24()
{
  uint64_t v0;

  sub_1A5DFF8FC();
  sub_1A5DFFA1C();
  sub_1A5DFF908();
  v0 = sub_1A5DFFA34();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A5DF6B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1A5DFF8FC();
  v2 = v1;
  if (v0 == sub_1A5DFF8FC() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1A5DFFA04();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1A5DF6C1C()
{
  return sub_1A5DF6C40(&qword_1EE808C58, (uint64_t)&unk_1A5E02204);
}

uint64_t sub_1A5DF6C40(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for PAAccessCategory();
    result = MEMORY[0x1A85B61B8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A5DF6C80()
{
  return 65259;
}

id InitialSwift.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id InitialSwift.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitialSwift();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for InitialSwift()
{
  return objc_opt_self();
}

id InitialSwift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitialSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for InitialSwift()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static InitialSwift.functionalFunction()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t AccessHistory.makeIterator()@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  _QWORD v7[2];

  v7[0] = *v1;
  v7[1] = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C70);
  v4 = sub_1A5DF6E30();
  a1[3] = v3;
  a1[4] = v4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(boxed_opaque_existential_1, v7, v3);
  return swift_bridgeObjectRetain();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A85B61A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1A5DF6E30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE808C78;
  if (!qword_1EE808C78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE808C70);
    result = MEMORY[0x1A85B61B8](MEMORY[0x1E0DEC908], v1);
    atomic_store(result, (unint64_t *)&qword_1EE808C78);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A85B61AC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A5DF6EC0@<X0>(uint64_t *a1@<X8>)
{
  AccessHistory.makeIterator()(a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5DF6ED8()
{
  return 0;
}

uint64_t sub_1A5DF6EE0()
{
  return 2;
}

uint64_t sub_1A5DF6EE8()
{
  uint64_t v0;

  v0 = sub_1A5DFCC90();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A5DF6F24()
{
  return sub_1A5DFF920();
}

uint64_t static AccessHistory<>.forReport.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;

  v43 = a1;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C80);
  v2 = MEMORY[0x1E0C80A78](v41, v1);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2, v5);
  v7 = (char *)&v39 - v6;
  v8 = sub_1A5DFF884();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v10 = *(_QWORD *)(v8 - 8);
  v12 = MEMORY[0x1E0C80A78](v8, v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v15);
  v17 = (char *)&v39 - v16;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C88);
  v19 = MEMORY[0x1E0C80A78](v42, v18);
  v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19, v22);
  v24 = (char *)&v39 - v23;
  sub_1A5DFF848();
  sub_1A5DFF854();
  sub_1A5DFEB64(&qword_1EE808C90, v9, MEMORY[0x1E0CB08B0]);
  result = sub_1A5DFF8CC();
  if ((result & 1) != 0)
  {
    v40 = v24;
    v44 = v21;
    v26 = v41;
    v27 = v17;
    v28 = v14;
    v29 = &v7[*(int *)(v41 + 48)];
    v30 = v7;
    v31 = v10;
    v32 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v32(v30, v27, v8);
    v39 = v29;
    v32(v29, v28, v8);
    v33 = &v4[*(int *)(v26 + 48)];
    v34 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
    v34(v4, v30, v8);
    v34(v33, v29, v8);
    v32(v44, v4, v8);
    v35 = *(void (**)(char *, uint64_t))(v31 + 8);
    v35(v33, v8);
    v36 = &v4[*(int *)(v26 + 48)];
    v32(v4, v30, v8);
    v32(v36, v39, v8);
    v37 = (uint64_t)v44;
    v32(&v44[*(int *)(v42 + 36)], v36, v8);
    v35(v4, v8);
    v38 = (uint64_t)v40;
    sub_1A5DFEA5C(v37, (uint64_t)v40, &qword_1EE808C88);
    static AccessHistory<>.forReport(in:)(v38, v43);
    return sub_1A5DFEAA0(v38, &qword_1EE808C88);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static AccessHistory<>.forReport(in:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C88);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5DFEBA4(a1, (uint64_t)v7, &qword_1EE808C88);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v13[0] = 0;
  v9 = objc_msgSend(v8, sel_publisherForReportWithError_, v13);

  if (v9)
  {
    v10 = v13[0];
    return sub_1A5DF734C((uint64_t)v7, v9, a2);
  }
  else
  {
    v12 = v13[0];
    sub_1A5DFEAA0((uint64_t)v7, &qword_1EE808C88);
    sub_1A5DFF830();

    return swift_willThrow();
  }
}

uint64_t sub_1A5DF734C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t result;
  id v39;
  char *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t aBlock;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t (*v50)(uint64_t);
  uint64_t v51;

  v41 = a1;
  v42 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E70);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AccessRecord(0);
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v44 = (uint64_t)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v13);
  v43 = (uint64_t)&v39 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C88);
  MEMORY[0x1E0C80A78](v15, v16);
  v40 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = MEMORY[0x1E0DEE9D8];
  v50 = (uint64_t (*)(uint64_t))nullsub_1;
  v51 = 0;
  v19 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v47 = 1107296256;
  v48 = sub_1A5DF89DC;
  v49 = &block_descriptor;
  v20 = _Block_copy(&aBlock);
  v50 = sub_1A5DFEC34;
  v51 = v18;
  aBlock = v19;
  v47 = 1107296256;
  v48 = sub_1A5DF8AC8;
  v49 = &block_descriptor_4;
  v21 = _Block_copy(&aBlock);
  v22 = a2;
  swift_retain();
  swift_release();
  v23 = objc_msgSend(v22, sel_sinkWithCompletion_shouldContinue_, v20, v21);

  _Block_release(v21);
  _Block_release(v20);

  swift_beginAccess();
  v24 = *(_QWORD *)(v18 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  if (!(v24 >> 62))
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v39 = v22;
    if (v25)
      goto LABEL_3;
LABEL_17:
    v27 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_18:
    swift_bridgeObjectRelease_n();
    v34 = v40;
    v33 = v41;
    v35 = sub_1A5DFEBA4(v41, (uint64_t)v40, &qword_1EE808C88);
    MEMORY[0x1E0C80A78](v35, v36);
    *(&v39 - 2) = v34;
    v45 = (_QWORD *)sub_1A5DF832C((uint64_t (*)(char *))sub_1A5DFEC3C, (uint64_t)(&v39 - 4), (uint64_t)v27);
    swift_bridgeObjectRetain();
    sub_1A5DF97AC(&v45);
    swift_bridgeObjectRelease();
    v37 = v45;
    sub_1A5DFEAA0((uint64_t)v34, &qword_1EE808C88);

    result = sub_1A5DFEAA0(v33, &qword_1EE808C88);
    *v42 = v37;
    return result;
  }
  swift_bridgeObjectRetain();
  v25 = sub_1A5DFF9D4();
  v39 = v22;
  if (!v25)
    goto LABEL_17;
LABEL_3:
  if (v25 >= 1)
  {
    v26 = 0;
    v27 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v28 = v8;
    do
    {
      if ((v24 & 0xC000000000000001) != 0)
        v29 = (void *)MEMORY[0x1A85B59FC](v26, v24);
      else
        v29 = (void *)swift_unknownObjectRetain();
      sub_1A5DF77C4(v29, (uint64_t)v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
      {
        sub_1A5DFEAA0((uint64_t)v7, &qword_1EE808E70);
      }
      else
      {
        v30 = v43;
        sub_1A5DFEADC((uint64_t)v7, v43);
        sub_1A5DFEADC(v30, v44);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v27 = (_QWORD *)sub_1A5DF94A8(0, v27[2] + 1, 1, v27);
        v32 = v27[2];
        v31 = v27[3];
        if (v32 >= v31 >> 1)
          v27 = (_QWORD *)sub_1A5DF94A8(v31 > 1, v32 + 1, 1, v27);
        v27[2] = v32 + 1;
        sub_1A5DFEADC(v44, (uint64_t)v27+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v32);
        v8 = v28;
      }
      ++v26;
    }
    while (v25 != v26);
    goto LABEL_18;
  }
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1A5DF77C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  char *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  char *v42;
  uint64_t result;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;

  v4 = sub_1A5DFF8A8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AccessRecord(0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9, v11);
  v13 = (_QWORD *)((char *)v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_opt_self();
  v14 = (void *)swift_dynamicCastObjCClass();
  v47 = v10;
  if (v14)
  {
    v15 = v14;
    v46 = a2;
    objc_msgSend(v14, sel_startTime);
    v17 = v16;
    objc_msgSend(v15, sel_endTime);
    if (v17 == v18)
    {
      objc_msgSend(v15, sel_startTime);
    }
    else
    {
      objc_msgSend(v15, sel_endTime);
      v21 = v20;
      objc_msgSend(v15, sel_startTime);
      if (v21 - v22 >= 60.0)
      {
        v23 = (char *)v13 + *(int *)(v9 + 28);
        v45[1] = &v23[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48)];
        objc_msgSend(v15, sel_startTime);
        sub_1A5DFF83C();
        objc_msgSend(v15, sel_endTime);
        sub_1A5DFF83C();
        type metadata accessor for AccessRecord.Timing(0);
        goto LABEL_9;
      }
      objc_msgSend(v15, sel_endTime);
    }
    sub_1A5DFF83C();
    type metadata accessor for AccessRecord.Timing(0);
LABEL_9:
    swift_storeEnumTagMultiPayload();
    a2 = v46;
    goto LABEL_13;
  }
  objc_opt_self();
  v19 = (void *)swift_dynamicCastObjCClass();
  if (v19)
  {
    objc_msgSend(v19, sel_startTime);
    sub_1A5DFF83C();
    type metadata accessor for AccessRecord.Timing(0);
  }
  else
  {
    objc_opt_self();
    v24 = (void *)swift_dynamicCastObjCClass();
    if (!v24)
    {
      objc_opt_self();
      v44 = swift_dynamicCastObjCClass();
      result = swift_unknownObjectRelease();
      if (!v44)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a2, 1, 1, v9);
      __break(1u);
      return result;
    }
    objc_msgSend(v24, sel_endTime);
    sub_1A5DFF83C();
    type metadata accessor for AccessRecord.Timing(0);
  }
  swift_storeEnumTagMultiPayload();
LABEL_13:
  v25 = objc_msgSend(a1, sel_access);
  v26 = objc_msgSend(v25, sel_identifier);

  sub_1A5DFF89C();
  v27 = sub_1A5DFF890();
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  *v13 = v27;
  v13[1] = v29;
  v30 = objc_msgSend(a1, sel_access);
  v31 = objc_msgSend(v30, sel_accessor);

  v32 = objc_msgSend(v31, sel_bundleID);
  v33 = sub_1A5DFF8FC();
  v35 = v34;

  v13[2] = v33;
  v13[3] = v35;
  v36 = objc_msgSend(a1, sel_access);
  v37 = objc_msgSend(v36, sel_category);

  v13[4] = (uint64_t)v37;
  v38 = objc_msgSend(a1, sel_access);
  v39 = objc_msgSend(v38, sel_accessCount);

  if (v39)
  {
    v40 = objc_msgSend(a1, sel_access);
    v41 = objc_msgSend(v40, sel_accessCount);

  }
  else
  {
    v41 = 0;
  }
  swift_unknownObjectRelease();
  v42 = (char *)v13 + *(int *)(v9 + 32);
  *(_QWORD *)v42 = v41;
  v42[8] = v39 == 0;
  sub_1A5DFEADC((uint64_t)v13, a2);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(a2, 0, 1, v9);
}

uint64_t sub_1A5DF7C60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  unsigned int (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  char v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  char v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  char *v56;
  char v57;
  char v58;
  char *v59;
  uint64_t v60;
  char v61;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;

  v69 = a2;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C88);
  v4 = MEMORY[0x1E0C80A78](v65, v3);
  v63 = (uint64_t)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v70 = (uint64_t)&v63 - v8;
  MEMORY[0x1E0C80A78](v7, v9);
  v67 = (uint64_t)&v63 - v10;
  v11 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E60);
  v17 = MEMORY[0x1E0C80A78](v15, v16);
  v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v20);
  v22 = (char *)&v63 - v21;
  v23 = sub_1A5DFF884();
  v24 = *(_QWORD *)(v23 - 8);
  v26 = MEMORY[0x1E0C80A78](v23, v25);
  v64 = (char *)&v63 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v26, v28);
  v68 = (char *)&v63 - v30;
  v32 = MEMORY[0x1E0C80A78](v29, v31);
  v66 = (char *)&v63 - v33;
  v35 = MEMORY[0x1E0C80A78](v32, v34);
  v72 = (char *)&v63 - v36;
  v38 = MEMORY[0x1E0C80A78](v35, v37);
  v40 = (char *)&v63 - v39;
  MEMORY[0x1E0C80A78](v38, v41);
  v71 = (char *)&v63 - v42;
  v43 = type metadata accessor for AccessRecord(0);
  sub_1A5DFEB20(a1 + *(int *)(v43 + 28), (uint64_t)v14, type metadata accessor for AccessRecord.Timing);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    v45 = &v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48)];
    v44 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v44(v40, v14, v23);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v45, v23);
  }
  else
  {
    v44 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v44(v40, v14, v23);
  }
  v44(v22, v40, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v22, 0, 1, v23);
  v46 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v46(v22, 1, v23) == 1)
  {
    sub_1A5DFF848();
    sub_1A5DFEAA0((uint64_t)v22, &qword_1EE808E60);
  }
  else
  {
    v44(v71, v22, v23);
  }
  v47 = v69;
  sub_1A5DF81B0(v19);
  if (v46(v19, 1, v23) == 1)
  {
    sub_1A5DFF854();
    sub_1A5DFEAA0((uint64_t)v19, &qword_1EE808E60);
  }
  else
  {
    v44(v72, v19, v23);
  }
  sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
  v48 = v71;
  v49 = sub_1A5DFF8C0();
  v50 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  v51 = v66;
  v50(v66, v48, v23);
  v52 = v67;
  sub_1A5DFEBA4(v47, v67, &qword_1EE808C88);
  if ((v49 & 1) != 0)
    v53 = sub_1A5DFF8CC();
  else
    v53 = 0;
  sub_1A5DFEAA0(v52, &qword_1EE808C88);
  v54 = *(void (**)(char *, uint64_t))(v24 + 8);
  v54(v51, v23);
  v55 = v70;
  sub_1A5DFEBA4(v47, v70, &qword_1EE808C88);
  v56 = v68;
  v50(v68, v72, v23);
  if ((v53 & 1) != 0)
  {
    v57 = 1;
  }
  else
  {
    v58 = sub_1A5DFF8C0();
    v59 = v64;
    v50(v64, v56, v23);
    v60 = v63;
    sub_1A5DFEBA4(v55, v63, &qword_1EE808C88);
    if ((v58 & 1) != 0)
    {
      v61 = sub_1A5DFF8CC();
      v59 = v64;
      v57 = v61;
    }
    else
    {
      v57 = 0;
    }
    sub_1A5DFEAA0(v60, &qword_1EE808C88);
    v54(v59, v23);
  }
  v54(v56, v23);
  sub_1A5DFEAA0(v55, &qword_1EE808C88);
  v54(v72, v23);
  v54(v71, v23);
  return v57 & 1;
}

uint64_t sub_1A5DF81B0@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int EnumCaseMultiPayload;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1A5DFF884();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5DFEB20(v2, (uint64_t)v7, type metadata accessor for AccessRecord.Timing);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, 1, 1, v8);
      return sub_1A5DFEA20((uint64_t)v7, type metadata accessor for AccessRecord.Timing);
    }
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v15(v12, &v7[*(int *)(v16 + 48)], v8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  else
  {
    v15 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v15(v12, v7, v8);
  }
  v15(a1, v12, v8);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
}

uint64_t sub_1A5DF832C(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = type metadata accessor for AccessRecord(0);
  v26 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v25 = (uint64_t)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (char *)v22 - v13;
  v15 = MEMORY[0x1E0DEE9D8];
  v27 = MEMORY[0x1E0DEE9D8];
  v24 = *(_QWORD *)(a3 + 16);
  if (v24)
  {
    v16 = 0;
    v17 = MEMORY[0x1E0DEE9D8];
    v22[1] = a2;
    v23 = a3;
    v22[0] = a1;
    while (v16 < *(_QWORD *)(a3 + 16))
    {
      v18 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
      v15 = *(_QWORD *)(v26 + 72);
      sub_1A5DFEB20(a3 + v18 + v15 * v16, (uint64_t)v14, type metadata accessor for AccessRecord);
      v19 = a1(v14);
      if (v3)
      {
        sub_1A5DFEA20((uint64_t)v14, type metadata accessor for AccessRecord);
        swift_release();
        swift_bridgeObjectRelease();
        return v15;
      }
      if ((v19 & 1) != 0)
      {
        sub_1A5DFEADC((uint64_t)v14, v25);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1A5DF961C(0, *(_QWORD *)(v17 + 16) + 1, 1);
        v17 = v27;
        v21 = *(_QWORD *)(v27 + 16);
        v20 = *(_QWORD *)(v27 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_1A5DF961C(v20 > 1, v21 + 1, 1);
          v17 = v27;
        }
        *(_QWORD *)(v17 + 16) = v21 + 1;
        result = sub_1A5DFEADC(v25, v17 + v18 + v21 * v15);
        a3 = v23;
        a1 = (uint64_t (*)(char *))v22[0];
      }
      else
      {
        result = sub_1A5DFEA20((uint64_t)v14, type metadata accessor for AccessRecord);
      }
      if (v24 == ++v16)
      {
        v15 = v27;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t AccessIterator.next()()
{
  uint64_t v0;

  __swift_mutable_project_boxed_opaque_existential_1(v0, *(_QWORD *)(v0 + 24));
  return sub_1A5DFF974();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t AccessRecord.identifier.getter()
{
  swift_bridgeObjectRetain();
  return sub_1A5DFF980();
}

uint64_t AccessRecord.accessorID.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AccessRecord.AccessorID.hash(into:)()
{
  sub_1A5DFFA28();
  return sub_1A5DFF908();
}

uint64_t static AccessRecord.AccessorID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1A5DFFA04();
}

uint64_t AccessRecord.AccessorID.hashValue.getter()
{
  sub_1A5DFFA1C();
  sub_1A5DFFA28();
  sub_1A5DFF908();
  return sub_1A5DFFA34();
}

uint64_t sub_1A5DF86CC()
{
  sub_1A5DFFA1C();
  sub_1A5DFFA28();
  sub_1A5DFF908();
  return sub_1A5DFFA34();
}

uint64_t sub_1A5DF8728()
{
  sub_1A5DFFA28();
  return sub_1A5DFF908();
}

uint64_t sub_1A5DF8768()
{
  sub_1A5DFFA1C();
  sub_1A5DFFA28();
  sub_1A5DFF908();
  return sub_1A5DFFA34();
}

uint64_t sub_1A5DF87C0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1A5DFFA04();
}

id AccessRecord.category.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t AccessRecord.timing.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AccessRecord(0);
  return sub_1A5DFEB20(v1 + *(int *)(v3 + 28), a1, type metadata accessor for AccessRecord.Timing);
}

uint64_t type metadata accessor for AccessRecord(uint64_t a1)
{
  return sub_1A5DFE980(a1, qword_1EE808DB0);
}

uint64_t type metadata accessor for AccessRecord.Timing(uint64_t a1)
{
  return sub_1A5DFE980(a1, qword_1EE808DC8);
}

uint64_t AccessRecord.accessCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for AccessRecord(0) + 32));
}

uint64_t PAAccessReader._accessRecordsForReport(from:to:)(uint64_t a1, uint64_t a2)
{
  return sub_1A5DFCC94(a1, a2);
}

void sub_1A5DF89DC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_1A5DF8A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  swift_beginAccess();
  v3 = swift_unknownObjectRetain();
  MEMORY[0x1A85B599C](v3);
  if (*(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1A5DFF950();
  sub_1A5DFF968();
  sub_1A5DFF944();
  swift_endAccess();
  return 1;
}

uint64_t sub_1A5DF8AC8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t sub_1A5DF8D14@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  char *v15;
  uint64_t v17;

  v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1A5DFF884();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1
      + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  v13 = type metadata accessor for AccessRecord(0);
  sub_1A5DFEB20(v12 + *(int *)(v13 + 28), (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    v15 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48)];
    v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v11, v6, v7);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  }
  else
  {
    v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v11, v6, v7);
  }
  v14(a1, v11, v7);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
}

id sub_1A5DF8E88(void *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E60);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  a3();

  v10 = sub_1A5DFF884();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    v12 = (void *)sub_1A5DFF860();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return v12;
}

uint64_t sub_1A5DF8F50@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int EnumCaseMultiPayload;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1A5DFF884();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v1
      + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  v13 = type metadata accessor for AccessRecord(0);
  sub_1A5DFEB20(v12 + *(int *)(v13 + 28), (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, 1, 1, v7);
      return sub_1A5DFEA20((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
    }
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v16(v11, &v6[*(int *)(v17 + 48)], v7);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v16(v11, v6, v7);
  }
  v16(a1, v11, v7);
  return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
}

id sub_1A5DF9170()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)_s18AccessRecordObjectCMa(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1A5DF91CC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E88);
  v2 = sub_1A5DFF9E0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1A5DFEBA4(v6, (uint64_t)&v15, &qword_1EE808E90);
    v7 = v15;
    v8 = v16;
    result = sub_1A5DF9300(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1A5DFEBE8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1A5DF9300(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A5DFFA1C();
  sub_1A5DFF908();
  v4 = sub_1A5DFFA34();
  return sub_1A5DF9364(a1, a2, v4);
}

unint64_t sub_1A5DF9364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1A5DFFA04() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1A5DFFA04() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1A5DFFA04() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

size_t sub_1A5DF94A8(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E98);
  v10 = *(_QWORD *)(type metadata accessor for AccessRecord(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for AccessRecord(0) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

size_t sub_1A5DF961C(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_1A5DF9638(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

size_t sub_1A5DF9638(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E98);
  v10 = *(_QWORD *)(type metadata accessor for AccessRecord(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for AccessRecord(0) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1A5DF97AC(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for AccessRecord(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_1A5DFC838(v3);
  v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_1A5DF982C(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1A5DF982C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t result;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char *v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int EnumCaseMultiPayload;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(char *, uint64_t, uint64_t);
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(char *, uint64_t, uint64_t);
  int v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  void (*v155)(char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  void (*v163)(char *, uint64_t, uint64_t);
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  void (*v173)(char *, uint64_t, uint64_t);
  int v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  char *v179;
  int v180;
  void (*v181)(char *, uint64_t);
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  unint64_t v197;
  char *v198;
  char *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  BOOL v212;
  unint64_t v213;
  char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  uint64_t v221;
  BOOL v222;
  uint64_t v223;
  char v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  BOOL v229;
  uint64_t v230;
  uint64_t v231;
  char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  char *v241;
  char *v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  uint64_t v246;
  unint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  int v257;
  void (*v258)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v259;
  uint64_t v260;
  void (*v261)(char *, uint64_t, uint64_t);
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  unsigned int (*v265)(uint64_t, uint64_t, uint64_t);
  uint64_t v266;
  void (*v267)(char *, uint64_t, uint64_t);
  int v268;
  char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  char *v273;
  char *v274;
  char v275;
  uint64_t v276;
  char v277;
  void (*v278)(char *, uint64_t);
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  unint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  _QWORD *v287;
  unint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  char *v292;
  char *v293;
  char *v294;
  uint64_t v295;
  char *v296;
  char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  char *v301;
  char *v302;
  uint64_t v303;
  uint64_t v304;
  char *v305;
  char *v306;
  uint64_t v307;
  char *v308;
  char *v309;
  char *v310;
  uint64_t v311;
  char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  unint64_t v317;
  char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  char *v322;
  char *v323;
  char *v324;
  char *v325;
  char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  char *v336;
  uint64_t v337;
  void (*v338)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v339)(uint64_t, uint64_t, uint64_t);
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t *v343;
  uint64_t v344;

  v342 = type metadata accessor for AccessRecord.Timing(0);
  v3 = MEMORY[0x1E0C80A78](v342, v2);
  v337 = (uint64_t)&v289 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v3, v5);
  v8 = (char *)&v289 - v7;
  v10 = MEMORY[0x1E0C80A78](v6, v9);
  v313 = (uint64_t)&v289 - v11;
  v13 = MEMORY[0x1E0C80A78](v10, v12);
  v315 = (uint64_t)&v289 - v14;
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v295 = (uint64_t)&v289 - v17;
  MEMORY[0x1E0C80A78](v16, v18);
  v300 = (uint64_t)&v289 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E60);
  v22 = MEMORY[0x1E0C80A78](v20, v21);
  v324 = (char *)&v289 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x1E0C80A78](v22, v24);
  v27 = (char *)&v289 - v26;
  v29 = MEMORY[0x1E0C80A78](v25, v28);
  v327 = (uint64_t)&v289 - v30;
  v32 = MEMORY[0x1E0C80A78](v29, v31);
  v34 = (char *)&v289 - v33;
  v36 = MEMORY[0x1E0C80A78](v32, v35);
  v38 = (char *)&v289 - v37;
  v40 = MEMORY[0x1E0C80A78](v36, v39);
  v42 = (char *)&v289 - v41;
  v44 = MEMORY[0x1E0C80A78](v40, v43);
  v293 = (char *)&v289 - v45;
  v47 = MEMORY[0x1E0C80A78](v44, v46);
  v297 = (char *)&v289 - v48;
  MEMORY[0x1E0C80A78](v47, v49);
  v298 = (uint64_t)&v289 - v50;
  v51 = sub_1A5DFF884();
  v332 = *(_QWORD *)(v51 - 8);
  v333 = v51;
  v53 = MEMORY[0x1E0C80A78](v51, v52);
  v323 = (char *)&v289 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = MEMORY[0x1E0C80A78](v53, v55);
  v322 = (char *)&v289 - v57;
  v59 = MEMORY[0x1E0C80A78](v56, v58);
  v61 = (char *)&v289 - v60;
  v63 = MEMORY[0x1E0C80A78](v59, v62);
  v336 = (char *)&v289 - v64;
  v66 = MEMORY[0x1E0C80A78](v63, v65);
  v305 = (char *)&v289 - v67;
  v69 = MEMORY[0x1E0C80A78](v66, v68);
  v301 = (char *)&v289 - v70;
  v72 = MEMORY[0x1E0C80A78](v69, v71);
  v74 = (char *)&v289 - v73;
  v76 = MEMORY[0x1E0C80A78](v72, v75);
  v312 = (char *)&v289 - v77;
  v79 = MEMORY[0x1E0C80A78](v76, v78);
  v294 = (char *)&v289 - v80;
  v82 = MEMORY[0x1E0C80A78](v79, v81);
  v292 = (char *)&v289 - v83;
  v85 = MEMORY[0x1E0C80A78](v82, v84);
  v318 = (char *)&v289 - v86;
  MEMORY[0x1E0C80A78](v85, v87);
  v296 = (char *)&v289 - v88;
  v334 = type metadata accessor for AccessRecord(0);
  v319 = *(_QWORD *)(v334 - 8);
  v90 = MEMORY[0x1E0C80A78](v334, v89);
  v311 = (uint64_t)&v289 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = MEMORY[0x1E0C80A78](v90, v92);
  v335 = (uint64_t)&v289 - v94;
  v96 = MEMORY[0x1E0C80A78](v93, v95);
  v340 = (uint64_t)&v289 - v97;
  v99 = MEMORY[0x1E0C80A78](v96, v98);
  v344 = (uint64_t)&v289 - v100;
  v102 = MEMORY[0x1E0C80A78](v99, v101);
  v316 = (uint64_t)&v289 - v103;
  v105 = MEMORY[0x1E0C80A78](v102, v104);
  v320 = (uint64_t)&v289 - v106;
  v108 = MEMORY[0x1E0C80A78](v105, v107);
  v299 = (uint64_t)&v289 - v109;
  MEMORY[0x1E0C80A78](v108, v110);
  v303 = (uint64_t)&v289 - v111;
  v343 = a1;
  v112 = a1[1];
  result = sub_1A5DFF9F8();
  if (result >= v112)
  {
    if ((v112 & 0x8000000000000000) == 0)
    {
      if (v112)
        return sub_1A5DFB198(0, v112, 1, v343);
      return result;
    }
LABEL_198:
    __break(1u);
LABEL_199:
    __break(1u);
LABEL_200:
    __break(1u);
LABEL_201:
    __break(1u);
LABEL_202:
    __break(1u);
LABEL_203:
    __break(1u);
LABEL_204:
    __break(1u);
LABEL_205:
    __break(1u);
    return result;
  }
  if (v112 >= 0)
    v114 = v112;
  else
    v114 = v112 + 1;
  if (v112 < -1)
  {
LABEL_197:
    __break(1u);
    goto LABEL_198;
  }
  v325 = v8;
  v302 = v34;
  v306 = v74;
  v291 = result;
  v326 = v27;
  if (v112 <= 1)
  {
    v118 = MEMORY[0x1E0DEE9D8];
    v317 = MEMORY[0x1E0DEE9D8]
         + ((*(unsigned __int8 *)(v319 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v319 + 80));
    if (v112 != 1)
    {
      v123 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      v120 = (char *)MEMORY[0x1E0DEE9D8];
      if (v123 < 2)
      {
LABEL_174:
        swift_bridgeObjectRelease();
        *(_QWORD *)(v118 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_161;
    }
    v115 = 1;
    v290 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v115 = v112;
    v116 = v114 >> 1;
    result = sub_1A5DFF95C();
    *(_QWORD *)(result + 16) = v116;
    v117 = *(unsigned __int8 *)(v319 + 80);
    v290 = result;
    v317 = result + ((v117 + 32) & ~v117);
  }
  v119 = 0;
  v120 = (char *)MEMORY[0x1E0DEE9D8];
  v308 = v38;
  v309 = v42;
  v121 = v333;
  v331 = v61;
  v122 = v318;
  while (2)
  {
    v124 = v119;
    v125 = v119 + 1;
    v229 = v119 + 1 < v115;
    v310 = v120;
    v126 = v115;
    if (!v229)
    {
      v137 = v125;
      v138 = (uint64_t)v325;
LABEL_71:
      v191 = v332;
      if (v137 >= v126)
        goto LABEL_84;
      goto LABEL_72;
    }
    v127 = v124;
    v128 = *v343;
    v129 = *(_QWORD *)(v319 + 72);
    sub_1A5DFEB20(*v343 + v129 * v125, v303, type metadata accessor for AccessRecord);
    v314 = v127;
    v307 = v128;
    v341 = v129;
    v130 = v128 + v129 * v127;
    v131 = v299;
    sub_1A5DFEB20(v130, v299, type metadata accessor for AccessRecord);
    v132 = *(int *)(v334 + 28);
    sub_1A5DFEB20(v131 + v132, v300, type metadata accessor for AccessRecord.Timing);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload)
    {
      v134 = v332;
      if (EnumCaseMultiPayload == 1)
      {
        v135 = v121;
        v136 = v297;
        v338 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v332 + 56);
        v338(v297, 1, 1, v135);
        sub_1A5DFEA20(v300, type metadata accessor for AccessRecord.Timing);
        goto LABEL_24;
      }
      v142 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v143 = v300;
      v139 = v134;
      v140 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 32);
      v141 = v318;
      v140(v318, v300 + *(int *)(v142 + 48), v121);
      (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v143, v121);
    }
    else
    {
      v139 = v332;
      v140 = *(void (**)(char *, uint64_t, uint64_t))(v332 + 32);
      v140(v122, v300, v121);
      v141 = v122;
    }
    v135 = v121;
    v136 = v297;
    v140(v297, (uint64_t)v141, v135);
    v338 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v139 + 56);
    v338(v136, 0, 1, v135);
    v134 = v139;
LABEL_24:
    v144 = (uint64_t)v136;
    v145 = v298;
    sub_1A5DFEA5C(v144, v298, &qword_1EE808E60);
    v339 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v134 + 48);
    if (v339(v145, 1, v135) != 1)
    {
      v146 = v303 + v132;
      v147 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 32);
      v147(v296, v145, v135);
      sub_1A5DFEB20(v146, v295, type metadata accessor for AccessRecord.Timing);
      v148 = swift_getEnumCaseMultiPayload();
      v121 = v135;
      if (v148)
      {
        v149 = v294;
        if (v148 == 1)
        {
          v150 = (uint64_t)v293;
          v338(v293, 1, 1, v121);
          sub_1A5DFEA20(v295, type metadata accessor for AccessRecord.Timing);
          goto LABEL_32;
        }
        v151 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
        v152 = v295;
        v147(v149, v295 + *(int *)(v151 + 48), v121);
        (*(void (**)(uint64_t, uint64_t))(v332 + 8))(v152, v121);
      }
      else
      {
        v149 = v294;
        v147(v294, v295, v121);
      }
      v150 = (uint64_t)v293;
      v147(v293, (uint64_t)v149, v121);
      v338((char *)v150, 0, 1, v121);
LABEL_32:
      if (v339(v150, 1, v121) == 1)
      {
        sub_1A5DFEAA0(v150, &qword_1EE808E60);
        (*(void (**)(char *, uint64_t))(v332 + 8))(v296, v121);
        LODWORD(v330) = 1;
      }
      else
      {
        v153 = v292;
        v147(v292, v150, v121);
        sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
        v154 = v296;
        LODWORD(v330) = sub_1A5DFF8B4() ^ 1;
        v121 = v333;
        v155 = *(void (**)(char *, uint64_t))(v332 + 8);
        v155(v153, v333);
        v155(v154, v121);
      }
      goto LABEL_35;
    }
    sub_1A5DFEAA0(v145, &qword_1EE808E60);
    LODWORD(v330) = 0;
    v121 = v135;
LABEL_35:
    v122 = v318;
    sub_1A5DFEA20(v299, type metadata accessor for AccessRecord);
    result = sub_1A5DFEA20(v303, type metadata accessor for AccessRecord);
    v124 = v314;
    v137 = v314 + 2;
    if (v314 + 2 >= v126)
      goto LABEL_58;
    v329 = v341 * v125;
    v156 = v307;
    v328 = v341 * v137;
    v157 = (uint64_t)v302;
    do
    {
      sub_1A5DFEB20(v156 + v328, v320, type metadata accessor for AccessRecord);
      v158 = v316;
      sub_1A5DFEB20(v156 + v329, v316, type metadata accessor for AccessRecord);
      v159 = *(int *)(v334 + 28);
      sub_1A5DFEB20(v158 + v159, v315, type metadata accessor for AccessRecord.Timing);
      v160 = swift_getEnumCaseMultiPayload();
      if (v160)
      {
        if (v160 == 1)
        {
          v161 = v121;
          v162 = (uint64_t)v308;
          v338(v308, 1, 1, v161);
          sub_1A5DFEA20(v315, type metadata accessor for AccessRecord.Timing);
          goto LABEL_43;
        }
        v165 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
        v166 = v315;
        v167 = v332;
        v163 = *(void (**)(char *, uint64_t, uint64_t))(v332 + 32);
        v164 = v306;
        v163(v306, v315 + *(int *)(v165 + 48), v121);
        v168 = v166;
        v157 = (uint64_t)v302;
        (*(void (**)(uint64_t, uint64_t))(v167 + 8))(v168, v121);
      }
      else
      {
        v163 = *(void (**)(char *, uint64_t, uint64_t))(v332 + 32);
        v164 = v306;
        v163(v306, v315, v121);
      }
      v161 = v121;
      v162 = (uint64_t)v308;
      v163(v308, (uint64_t)v164, v161);
      v338((char *)v162, 0, 1, v161);
LABEL_43:
      v169 = v162;
      v170 = (uint64_t)v309;
      sub_1A5DFEA5C(v169, (uint64_t)v309, &qword_1EE808E60);
      if (v339(v170, 1, v161) == 1)
      {
        sub_1A5DFEAA0(v170, &qword_1EE808E60);
        v171 = 0;
        v121 = v161;
        goto LABEL_54;
      }
      v172 = v320 + v159;
      v173 = *(void (**)(char *, uint64_t, uint64_t))(v332 + 32);
      v173(v312, v170, v161);
      sub_1A5DFEB20(v172, v313, type metadata accessor for AccessRecord.Timing);
      v174 = swift_getEnumCaseMultiPayload();
      v121 = v161;
      if (v174)
      {
        if (v174 == 1)
        {
          v338((char *)v157, 1, 1, v161);
          sub_1A5DFEA20(v313, type metadata accessor for AccessRecord.Timing);
          goto LABEL_51;
        }
        v176 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
        v177 = v313;
        v175 = v305;
        v173(v305, v313 + *(int *)(v176 + 48), v121);
        (*(void (**)(uint64_t, uint64_t))(v332 + 8))(v177, v121);
      }
      else
      {
        v175 = v305;
        v173(v305, v313, v121);
      }
      v173((char *)v157, (uint64_t)v175, v121);
      v338((char *)v157, 0, 1, v121);
LABEL_51:
      if (v339(v157, 1, v121) == 1)
      {
        sub_1A5DFEAA0(v157, &qword_1EE808E60);
        (*(void (**)(char *, uint64_t))(v332 + 8))(v312, v121);
        v171 = 1;
      }
      else
      {
        v178 = v301;
        v173(v301, v157, v121);
        sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
        v179 = v312;
        v180 = sub_1A5DFF8B4();
        v121 = v333;
        v171 = v180 ^ 1;
        v181 = *(void (**)(char *, uint64_t))(v332 + 8);
        v181(v178, v333);
        v181(v179, v121);
      }
LABEL_54:
      v61 = v331;
      sub_1A5DFEA20(v316, type metadata accessor for AccessRecord);
      result = sub_1A5DFEA20(v320, type metadata accessor for AccessRecord);
      if (((v330 ^ v171) & 1) != 0)
        goto LABEL_57;
      ++v137;
      v156 += v341;
    }
    while (v126 != v137);
    v137 = v126;
LABEL_57:
    v122 = v318;
    v124 = v314;
LABEL_58:
    v138 = (uint64_t)v325;
    if ((v330 & 1) == 0)
      goto LABEL_71;
    if (v137 < v124)
      goto LABEL_199;
    if (v124 >= v137)
      goto LABEL_71;
    v182 = 0;
    v183 = v341 * (v137 - 1);
    v184 = v137 * v341;
    v185 = v124;
    v186 = v124 * v341;
    v304 = v126;
    do
    {
      if (v185 != v137 + v182 - 1)
      {
        v188 = v307;
        if (!v307)
          goto LABEL_204;
        v189 = v137;
        v190 = v307 + v186;
        v339 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))(v307 + v183);
        sub_1A5DFEADC(v307 + v186, v311);
        if (v186 < v183 || v190 >= v188 + v184)
        {
          v187 = (uint64_t)v339;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v187 = (uint64_t)v339;
          if (v186 != v183)
            swift_arrayInitWithTakeBackToFront();
        }
        result = sub_1A5DFEADC(v311, v187);
        v137 = v189;
        v126 = v304;
      }
      ++v185;
      --v182;
      v183 -= v341;
      v184 -= v341;
      v186 += v341;
    }
    while (v185 < v137 + v182);
    v138 = (uint64_t)v325;
    v61 = v331;
    v191 = v332;
    v122 = v318;
    v124 = v314;
    if (v137 >= v126)
    {
LABEL_84:
      if (v137 < v124)
        goto LABEL_191;
      goto LABEL_85;
    }
LABEL_72:
    v192 = v124;
    v212 = __OFSUB__(v137, v124);
    v193 = v137 - v124;
    if (v212)
      goto LABEL_196;
    if (v193 >= v291)
    {
      v124 = v192;
      goto LABEL_84;
    }
    if (__OFADD__(v192, v291))
      goto LABEL_200;
    if (v192 + v291 >= v126)
      v194 = v126;
    else
      v194 = v192 + v291;
    if (v194 < v192)
      goto LABEL_201;
    if (v137 == v194)
    {
      v124 = v192;
      if (v137 < v192)
        goto LABEL_191;
      goto LABEL_85;
    }
    v248 = *(_QWORD *)(v319 + 72);
    v249 = v248 * (v137 - 1);
    v124 = v192;
    v328 = v248;
    v341 = v137 * v248;
    v314 = v192;
    v307 = v194;
    while (2)
    {
      v251 = 0;
      v252 = v124;
      v329 = v249;
      v330 = v137;
      while (2)
      {
        v253 = *v343;
        v339 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))(v341 + v251);
        sub_1A5DFEB20(v341 + v251 + v253, v344, type metadata accessor for AccessRecord);
        v338 = (void (*)(char *, uint64_t, uint64_t, uint64_t))(v249 + v251);
        v254 = v249 + v251 + v253;
        v255 = v340;
        sub_1A5DFEB20(v254, v340, type metadata accessor for AccessRecord);
        v256 = *(int *)(v334 + 28);
        sub_1A5DFEB20(v255 + v256, v138, type metadata accessor for AccessRecord.Timing);
        v257 = swift_getEnumCaseMultiPayload();
        if (v257)
        {
          if (v257 == 1)
          {
            v258 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v191 + 56);
            v259 = v121;
            v260 = (uint64_t)v326;
            v258(v326, 1, 1, v259);
            sub_1A5DFEA20(v138, type metadata accessor for AccessRecord.Timing);
            goto LABEL_142;
          }
          v262 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
          v261 = *(void (**)(char *, uint64_t, uint64_t))(v191 + 32);
          v261(v61, v138 + *(int *)(v262 + 48), v121);
          (*(void (**)(uint64_t, uint64_t))(v191 + 8))(v138, v121);
        }
        else
        {
          v261 = *(void (**)(char *, uint64_t, uint64_t))(v191 + 32);
          v261(v61, v138, v121);
        }
        v259 = v121;
        v260 = (uint64_t)v326;
        v261(v326, (uint64_t)v61, v259);
        v258 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v191 + 56);
        v258((char *)v260, 0, 1, v259);
LABEL_142:
        v263 = v260;
        v264 = v327;
        sub_1A5DFEA5C(v263, v327, &qword_1EE808E60);
        v265 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v191 + 48);
        if (v265(v264, 1, v259) == 1)
        {
          sub_1A5DFEAA0(v264, &qword_1EE808E60);
          sub_1A5DFEA20(v340, type metadata accessor for AccessRecord);
          result = sub_1A5DFEA20(v344, type metadata accessor for AccessRecord);
          v121 = v259;
          v250 = v330;
          v61 = v331;
          v249 = v329;
          goto LABEL_133;
        }
        v266 = v344 + v256;
        v267 = *(void (**)(char *, uint64_t, uint64_t))(v191 + 32);
        v267(v336, v264, v259);
        sub_1A5DFEB20(v266, v337, type metadata accessor for AccessRecord.Timing);
        v268 = swift_getEnumCaseMultiPayload();
        v121 = v259;
        if (v268)
        {
          v269 = v323;
          if (v268 == 1)
          {
            v270 = (uint64_t)v324;
            v258(v324, 1, 1, v259);
            sub_1A5DFEA20(v337, type metadata accessor for AccessRecord.Timing);
            goto LABEL_149;
          }
          v271 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
          v272 = v337;
          v267(v269, v337 + *(int *)(v271 + 48), v259);
          (*(void (**)(uint64_t, uint64_t))(v332 + 8))(v272, v259);
        }
        else
        {
          v269 = v323;
          v267(v323, v337, v259);
        }
        v270 = (uint64_t)v324;
        v267(v324, (uint64_t)v269, v259);
        v258((char *)v270, 0, 1, v259);
LABEL_149:
        if (v265(v270, 1, v259) == 1)
        {
          sub_1A5DFEAA0(v270, &qword_1EE808E60);
          v191 = v332;
          (*(void (**)(char *, uint64_t))(v332 + 8))(v336, v259);
          sub_1A5DFEA20(v340, type metadata accessor for AccessRecord);
          result = sub_1A5DFEA20(v344, type metadata accessor for AccessRecord);
          v138 = (uint64_t)v325;
          v61 = v331;
          v249 = v329;
          goto LABEL_152;
        }
        v273 = v322;
        v267(v322, v270, v121);
        sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
        v274 = v336;
        v275 = sub_1A5DFF8B4();
        v276 = v332;
        v121 = v333;
        v277 = v275;
        v278 = *(void (**)(char *, uint64_t))(v332 + 8);
        v278(v273, v333);
        v278(v274, v121);
        v191 = v276;
        sub_1A5DFEA20(v340, type metadata accessor for AccessRecord);
        result = sub_1A5DFEA20(v344, type metadata accessor for AccessRecord);
        v138 = (uint64_t)v325;
        v61 = v331;
        v249 = v329;
        if ((v277 & 1) == 0)
        {
LABEL_152:
          v279 = *v343;
          if (!*v343)
            goto LABEL_202;
          v280 = v279 + v249 + v251;
          sub_1A5DFEADC(v279 + v341 + v251, v335);
          swift_arrayInitWithTakeFrontToBack();
          result = sub_1A5DFEADC(v335, v280);
          v251 -= v328;
          ++v252;
          v250 = v330;
          if (v330 == v252)
            goto LABEL_133;
          continue;
        }
        break;
      }
      v250 = v330;
LABEL_133:
      v137 = v250 + 1;
      v249 += v328;
      v341 += v328;
      v124 = v314;
      if (v137 != v307)
        continue;
      break;
    }
    v137 = v307;
    v122 = v318;
    if (v307 < v314)
    {
LABEL_191:
      __break(1u);
      goto LABEL_192;
    }
LABEL_85:
    v195 = v124;
    result = swift_isUniquelyReferenced_nonNull_native();
    v330 = v137;
    if ((result & 1) != 0)
    {
      v120 = v310;
    }
    else
    {
      result = (uint64_t)sub_1A5DFC67C(0, *((_QWORD *)v310 + 2) + 1, 1, v310);
      v120 = (char *)result;
    }
    v197 = *((_QWORD *)v120 + 2);
    v196 = *((_QWORD *)v120 + 3);
    v123 = v197 + 1;
    if (v197 >= v196 >> 1)
    {
      result = (uint64_t)sub_1A5DFC67C((char *)(v196 > 1), v197 + 1, 1, v120);
      v120 = (char *)result;
    }
    *((_QWORD *)v120 + 2) = v123;
    v198 = v120 + 32;
    v199 = &v120[16 * v197 + 32];
    v200 = v330;
    *(_QWORD *)v199 = v195;
    *((_QWORD *)v199 + 1) = v200;
    if (!v197)
    {
      v123 = 1;
LABEL_15:
      v115 = v343[1];
      v119 = v330;
      if (v330 >= v115)
      {
        v118 = v290;
        if (v123 < 2)
          goto LABEL_174;
LABEL_161:
        v281 = *v343;
        while (1)
        {
          v282 = v123 - 2;
          if (v123 < 2)
            break;
          if (!v281)
            goto LABEL_205;
          v283 = (uint64_t)v120;
          v284 = *(_QWORD *)&v120[16 * v282 + 32];
          v285 = *(_QWORD *)&v120[16 * v123 + 24];
          v286 = v321;
          result = sub_1A5DFB880(v281 + *(_QWORD *)(v319 + 72) * v284, v281 + *(_QWORD *)(v319 + 72) * *(_QWORD *)&v120[16 * v123 + 16], v281 + *(_QWORD *)(v319 + 72) * v285, v317);
          if (v286)
            goto LABEL_159;
          if (v285 < v284)
            goto LABEL_193;
          v321 = 0;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_1A5DFC824(v283);
            v283 = result;
          }
          if (v282 >= *(_QWORD *)(v283 + 16))
            goto LABEL_194;
          v287 = (_QWORD *)(v283 + 32 + 16 * v282);
          *v287 = v284;
          v287[1] = v285;
          v288 = *(_QWORD *)(v283 + 16);
          if (v123 > v288)
            goto LABEL_195;
          result = (uint64_t)memmove((void *)(v283 + 32 + 16 * (v123 - 1)), (const void *)(v283 + 32 + 16 * v123), 16 * (v288 - v123));
          v120 = (char *)v283;
          *(_QWORD *)(v283 + 16) = v288 - 1;
          v123 = v288 - 1;
          if (v288 <= 2)
            goto LABEL_174;
        }
LABEL_192:
        __break(1u);
LABEL_193:
        __break(1u);
LABEL_194:
        __break(1u);
LABEL_195:
        __break(1u);
LABEL_196:
        __break(1u);
        goto LABEL_197;
      }
      continue;
    }
    break;
  }
  while (2)
  {
    v201 = v123 - 1;
    if (v123 >= 4)
    {
      v206 = &v198[16 * v123];
      v207 = *((_QWORD *)v206 - 8);
      v208 = *((_QWORD *)v206 - 7);
      v212 = __OFSUB__(v208, v207);
      v209 = v208 - v207;
      if (v212)
        goto LABEL_180;
      v211 = *((_QWORD *)v206 - 6);
      v210 = *((_QWORD *)v206 - 5);
      v212 = __OFSUB__(v210, v211);
      v204 = v210 - v211;
      v205 = v212;
      if (v212)
        goto LABEL_181;
      v213 = v123 - 2;
      v214 = &v198[16 * v123 - 32];
      v216 = *(_QWORD *)v214;
      v215 = *((_QWORD *)v214 + 1);
      v212 = __OFSUB__(v215, v216);
      v217 = v215 - v216;
      if (v212)
        goto LABEL_182;
      v212 = __OFADD__(v204, v217);
      v218 = v204 + v217;
      if (v212)
        goto LABEL_184;
      if (v218 >= v209)
      {
        v236 = &v198[16 * v201];
        v238 = *(_QWORD *)v236;
        v237 = *((_QWORD *)v236 + 1);
        v212 = __OFSUB__(v237, v238);
        v239 = v237 - v238;
        if (v212)
          goto LABEL_190;
        v229 = v204 < v239;
      }
      else
      {
LABEL_103:
        if ((v205 & 1) != 0)
          goto LABEL_183;
        v213 = v123 - 2;
        v219 = &v198[16 * v123 - 32];
        v221 = *(_QWORD *)v219;
        v220 = *((_QWORD *)v219 + 1);
        v222 = __OFSUB__(v220, v221);
        v223 = v220 - v221;
        v224 = v222;
        if (v222)
          goto LABEL_185;
        v225 = &v198[16 * v201];
        v227 = *(_QWORD *)v225;
        v226 = *((_QWORD *)v225 + 1);
        v212 = __OFSUB__(v226, v227);
        v228 = v226 - v227;
        if (v212)
          goto LABEL_187;
        if (__OFADD__(v223, v228))
          goto LABEL_189;
        if (v223 + v228 < v204)
          goto LABEL_115;
        v229 = v204 < v228;
      }
      if (v229)
        v201 = v213;
    }
    else
    {
      if (v123 == 3)
      {
        v203 = *((_QWORD *)v120 + 4);
        v202 = *((_QWORD *)v120 + 5);
        v212 = __OFSUB__(v202, v203);
        v204 = v202 - v203;
        v205 = v212;
        goto LABEL_103;
      }
      v230 = *((_QWORD *)v120 + 4);
      v231 = *((_QWORD *)v120 + 5);
      v212 = __OFSUB__(v231, v230);
      v223 = v231 - v230;
      v224 = v212;
LABEL_115:
      if ((v224 & 1) != 0)
        goto LABEL_186;
      v232 = &v198[16 * v201];
      v234 = *(_QWORD *)v232;
      v233 = *((_QWORD *)v232 + 1);
      v212 = __OFSUB__(v233, v234);
      v235 = v233 - v234;
      if (v212)
        goto LABEL_188;
      if (v235 < v223)
        goto LABEL_15;
    }
    v240 = v201 - 1;
    if (v201 - 1 >= v123)
    {
      __break(1u);
LABEL_177:
      __break(1u);
LABEL_178:
      __break(1u);
LABEL_179:
      __break(1u);
LABEL_180:
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      __break(1u);
LABEL_183:
      __break(1u);
LABEL_184:
      __break(1u);
LABEL_185:
      __break(1u);
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
LABEL_188:
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
      goto LABEL_191;
    }
    if (!*v343)
      goto LABEL_203;
    v241 = v120;
    v242 = &v198[16 * v240];
    v243 = *(_QWORD *)v242;
    v244 = &v198[16 * v201];
    v245 = *((_QWORD *)v244 + 1);
    v246 = v321;
    result = sub_1A5DFB880(*v343 + *(_QWORD *)(v319 + 72) * *(_QWORD *)v242, *v343 + *(_QWORD *)(v319 + 72) * *(_QWORD *)v244, *v343 + *(_QWORD *)(v319 + 72) * v245, v317);
    if (!v246)
    {
      if (v245 < v243)
        goto LABEL_177;
      if (v201 > *((_QWORD *)v241 + 2))
        goto LABEL_178;
      *(_QWORD *)v242 = v243;
      *(_QWORD *)&v198[16 * v240 + 8] = v245;
      v247 = *((_QWORD *)v241 + 2);
      if (v201 >= v247)
        goto LABEL_179;
      v321 = 0;
      v123 = v247 - 1;
      result = (uint64_t)memmove(&v198[16 * v201], v244 + 16, 16 * (v247 - 1 - v201));
      v120 = v241;
      *((_QWORD *)v241 + 2) = v247 - 1;
      v229 = v247 > 2;
      v61 = v331;
      v122 = v318;
      if (!v229)
        goto LABEL_15;
      continue;
    }
    break;
  }
  v118 = v290;
LABEL_159:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v118 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A5DFB198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  int EnumCaseMultiPayload;
  uint64_t v57;
  void (*v58)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  void (*v60)(_BYTE *, uint64_t, uint64_t);
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  void (*v67)(_BYTE *, uint64_t, uint64_t);
  int v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  _BYTE *v73;
  _BYTE *v74;
  _BYTE *v75;
  char v76;
  void (*v77)(_BYTE *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[16];
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  _BYTE *v84;
  _BYTE *v85;
  _BYTE *v86;
  _BYTE *v87;
  uint64_t *v88;
  _BYTE *v89;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94;
  _BYTE *v95;
  _BYTE *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE *v104;

  v82 = a1;
  v100 = type metadata accessor for AccessRecord.Timing(0);
  v8 = MEMORY[0x1E0C80A78](v100, v7);
  v96 = &v80[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = &v80[-v11];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E60);
  v15 = MEMORY[0x1E0C80A78](v13, v14);
  v86 = &v80[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = MEMORY[0x1E0C80A78](v15, v17);
  v90 = &v80[-v19];
  MEMORY[0x1E0C80A78](v18, v20);
  v22 = &v80[-v21];
  v23 = sub_1A5DFF884();
  v99 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x1E0C80A78](v23, v24);
  v27 = &v80[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = MEMORY[0x1E0C80A78](v25, v28);
  v83 = &v80[-v30];
  v32 = MEMORY[0x1E0C80A78](v29, v31);
  v34 = &v80[-v33];
  MEMORY[0x1E0C80A78](v32, v35);
  v95 = &v80[-v36];
  v93 = type metadata accessor for AccessRecord(0);
  v38 = MEMORY[0x1E0C80A78](v93, v37);
  v94 = &v80[-((v39 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v41 = MEMORY[0x1E0C80A78](v38, v40);
  v101 = &v80[-v42];
  result = MEMORY[0x1E0C80A78](v41, v43);
  v104 = &v80[-v46];
  v92 = a3;
  v81 = a2;
  if (a3 != a2)
  {
    v47 = a4;
    v48 = (uint64_t)v12;
    v91 = *(_QWORD *)(v45 + 72);
    v102 = v91 * v92;
    v103 = v91 * (v92 - 1);
    v84 = v27;
    v85 = v12;
    v87 = v34;
    v88 = a4;
    v89 = v22;
LABEL_6:
    v49 = 0;
    v50 = v82;
    while (1)
    {
      v51 = *v47;
      v52 = v102 + v49;
      sub_1A5DFEB20(v102 + v49 + v51, (uint64_t)v104, type metadata accessor for AccessRecord);
      v97 = v103 + v49;
      v53 = v103 + v49 + v51;
      v54 = v101;
      sub_1A5DFEB20(v53, (uint64_t)v101, type metadata accessor for AccessRecord);
      v55 = *(int *)(v93 + 28);
      sub_1A5DFEB20((uint64_t)&v54[v55], v48, type metadata accessor for AccessRecord.Timing);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v98 = v52;
      if (EnumCaseMultiPayload)
      {
        v57 = v99;
        if (EnumCaseMultiPayload == 1)
        {
          v58 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v99 + 56);
          v59 = (uint64_t)v90;
          v58(v90, 1, 1, v23);
          sub_1A5DFEA20(v48, type metadata accessor for AccessRecord.Timing);
          goto LABEL_14;
        }
        v61 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
        v60 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v57 + 32);
        v60(v34, v48 + *(int *)(v61 + 48), v23);
        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v48, v23);
      }
      else
      {
        v57 = v99;
        v60 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v99 + 32);
        v60(v34, v48, v23);
      }
      v62 = v90;
      v60(v90, (uint64_t)v34, v23);
      v59 = (uint64_t)v62;
      v58 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v57 + 56);
      v58((_BYTE *)v59, 0, 1, v23);
LABEL_14:
      v63 = v57;
      v64 = (uint64_t)v89;
      sub_1A5DFEA5C(v59, (uint64_t)v89, &qword_1EE808E60);
      v65 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48);
      if (v65(v64, 1, v23) == 1)
      {
        sub_1A5DFEAA0(v64, &qword_1EE808E60);
        sub_1A5DFEA20((uint64_t)v101, type metadata accessor for AccessRecord);
        result = sub_1A5DFEA20((uint64_t)v104, type metadata accessor for AccessRecord);
        v34 = v87;
        v47 = v88;
LABEL_5:
        v103 += v91;
        v102 += v91;
        if (++v92 == v81)
          return result;
        goto LABEL_6;
      }
      v66 = (uint64_t)&v104[v55];
      v67 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v63 + 32);
      v67(v95, v64, v23);
      sub_1A5DFEB20(v66, (uint64_t)v96, type metadata accessor for AccessRecord.Timing);
      v68 = swift_getEnumCaseMultiPayload();
      if (v68)
      {
        if (v68 == 1)
        {
          v69 = (uint64_t)v86;
          v58(v86, 1, 1, v23);
          sub_1A5DFEA20((uint64_t)v96, type metadata accessor for AccessRecord.Timing);
          v70 = v99;
          goto LABEL_21;
        }
        v72 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
        v73 = v96;
        v71 = v84;
        v67(v84, (uint64_t)&v96[*(int *)(v72 + 48)], v23);
        v70 = v99;
        (*(void (**)(_BYTE *, uint64_t))(v99 + 8))(v73, v23);
        v69 = (uint64_t)v86;
      }
      else
      {
        v71 = v84;
        v67(v84, (uint64_t)v96, v23);
        v69 = (uint64_t)v86;
        v70 = v99;
      }
      v67((_BYTE *)v69, (uint64_t)v71, v23);
      v58((_BYTE *)v69, 0, 1, v23);
LABEL_21:
      if (v65(v69, 1, v23) == 1)
      {
        sub_1A5DFEAA0(v69, &qword_1EE808E60);
        (*(void (**)(_BYTE *, uint64_t))(v70 + 8))(v95, v23);
        sub_1A5DFEA20((uint64_t)v101, type metadata accessor for AccessRecord);
        result = sub_1A5DFEA20((uint64_t)v104, type metadata accessor for AccessRecord);
        v34 = v87;
        v47 = v88;
        v48 = (uint64_t)v85;
      }
      else
      {
        v74 = v83;
        v67(v83, v69, v23);
        sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
        v75 = v95;
        v76 = sub_1A5DFF8B4();
        v77 = *(void (**)(_BYTE *, uint64_t))(v70 + 8);
        v77(v74, v23);
        v77(v75, v23);
        sub_1A5DFEA20((uint64_t)v101, type metadata accessor for AccessRecord);
        result = sub_1A5DFEA20((uint64_t)v104, type metadata accessor for AccessRecord);
        v34 = v87;
        v47 = v88;
        v48 = (uint64_t)v85;
        if ((v76 & 1) != 0)
          goto LABEL_5;
      }
      v78 = *v47;
      if (!*v47)
      {
        __break(1u);
        return result;
      }
      v79 = v78 + v103 + v49;
      sub_1A5DFEADC(v78 + v102 + v49, (uint64_t)v94);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_1A5DFEADC((uint64_t)v94, v79);
      v49 -= v91;
      if (v92 == ++v50)
        goto LABEL_5;
    }
  }
  return result;
}

uint64_t sub_1A5DFB880(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t result;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  int64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  uint64_t v87;
  uint64_t v88;
  int EnumCaseMultiPayload;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(_BYTE *, uint64_t, uint64_t, uint64_t);
  void (*v93)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v94;
  _BYTE *v95;
  _BYTE *v96;
  unsigned int (*v97)(_BYTE *, uint64_t, uint64_t);
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  void (*v102)(_BYTE *, _BYTE *, uint64_t);
  int v103;
  _BYTE *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  unsigned int v109;
  _BYTE *v110;
  _BYTE *v111;
  char v112;
  void (*v113)(_BYTE *, uint64_t);
  unint64_t v114;
  uint64_t v116;
  uint64_t v117;
  int v118;
  _BYTE *v119;
  void (*v120)(_BYTE *, uint64_t, uint64_t, uint64_t);
  uint64_t v121;
  void (*v122)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v123;
  _BYTE *v124;
  _BYTE *v125;
  uint64_t v126;
  uint64_t (*v127)(uint64_t, uint64_t, uint64_t);
  char v128;
  uint64_t v129;
  _BYTE *v130;
  void (*v131)(_BYTE *, uint64_t, uint64_t);
  uint64_t v132;
  _BYTE *v133;
  int v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t v137;
  _BYTE *v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  _BYTE *v142;
  _BYTE *v143;
  void (*v144)(_BYTE *, uint64_t);
  _BYTE *v145;
  _BYTE *v146;
  unint64_t v147;
  _BYTE *v148;
  _BYTE v149[16];
  _BYTE *v150;
  _BYTE *v151;
  _BYTE *v152;
  _BYTE *v153;
  _BYTE *v154;
  _BYTE *v155;
  _BYTE *v156;
  _BYTE *v157;
  _BYTE *v158;
  _BYTE *v159;
  _BYTE *v160;
  _BYTE *v161;
  _BYTE *v162;
  _BYTE *v163;
  _BYTE *v164;
  _BYTE *v165;
  uint64_t v166;
  uint64_t v167;
  unint64_t v168;
  _BYTE *v169;
  _BYTE *v170;
  _BYTE *v171;
  _BYTE *v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  _BYTE *v176;
  _BYTE *v177;

  v173 = type metadata accessor for AccessRecord.Timing(0);
  v9 = MEMORY[0x1E0C80A78](v173, v8);
  v155 = &v149[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v170 = &v149[-v13];
  v15 = MEMORY[0x1E0C80A78](v12, v14);
  v161 = &v149[-v16];
  MEMORY[0x1E0C80A78](v15, v17);
  v169 = &v149[-v18];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E60);
  v21 = MEMORY[0x1E0C80A78](v19, v20);
  v157 = &v149[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = MEMORY[0x1E0C80A78](v21, v23);
  v163 = &v149[-v25];
  v27 = MEMORY[0x1E0C80A78](v24, v26);
  v29 = &v149[-v28];
  v31 = MEMORY[0x1E0C80A78](v27, v30);
  v154 = &v149[-v32];
  v34 = MEMORY[0x1E0C80A78](v31, v33);
  v162 = &v149[-v35];
  MEMORY[0x1E0C80A78](v34, v36);
  v38 = &v149[-v37];
  v39 = sub_1A5DFF884();
  v40 = *(_QWORD *)(v39 - 8);
  v42 = MEMORY[0x1E0C80A78](v39, v41);
  v153 = &v149[-((v43 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v45 = MEMORY[0x1E0C80A78](v42, v44);
  v151 = &v149[-v46];
  v48 = MEMORY[0x1E0C80A78](v45, v47);
  v164 = &v149[-v49];
  v51 = MEMORY[0x1E0C80A78](v48, v50);
  v160 = &v149[-v52];
  v54 = MEMORY[0x1E0C80A78](v51, v53);
  v156 = &v149[-v55];
  v57 = MEMORY[0x1E0C80A78](v54, v56);
  v150 = &v149[-v58];
  v60 = MEMORY[0x1E0C80A78](v57, v59);
  v165 = &v149[-v61];
  MEMORY[0x1E0C80A78](v60, v62);
  v159 = &v149[-v63];
  v174 = type metadata accessor for AccessRecord(0);
  v65 = MEMORY[0x1E0C80A78](v174, v64);
  v67 = &v149[-((v66 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v69 = MEMORY[0x1E0C80A78](v65, v68);
  v172 = &v149[-v70];
  v72 = MEMORY[0x1E0C80A78](v69, v71);
  v152 = &v149[-v73];
  result = MEMORY[0x1E0C80A78](v72, v74);
  v171 = &v149[-v76];
  v166 = *(_QWORD *)(v77 + 72);
  if (!v166)
  {
    __break(1u);
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  v158 = v29;
  v78 = (_BYTE *)a1;
  if (a2 - a1 == 0x8000000000000000 && v166 == -1)
    goto LABEL_94;
  v79 = a3 - a2;
  if (a3 - a2 != 0x8000000000000000 || v166 != -1)
  {
    v80 = (uint64_t)(a2 - a1) / v166;
    v177 = (_BYTE *)a1;
    v176 = (_BYTE *)a4;
    v167 = v40;
    if (v80 < v79 / v166)
    {
      v81 = v80 * v166;
      v172 = v38;
      if (a4 < (unint64_t)v78 || (unint64_t)&v78[v81] <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
        v82 = v165;
        v83 = (uint64_t)v152;
      }
      else
      {
        v82 = v165;
        v83 = (uint64_t)v152;
        if ((_BYTE *)a4 != v78)
          swift_arrayInitWithTakeBackToFront();
      }
      v170 = (_BYTE *)(a4 + v81);
      v175 = a4 + v81;
      if (v81 >= 1 && a2 < a3)
      {
        v87 = a4;
        v168 = a3;
        while (1)
        {
          sub_1A5DFEB20(a2, (uint64_t)v171, type metadata accessor for AccessRecord);
          sub_1A5DFEB20(v87, v83, type metadata accessor for AccessRecord);
          v88 = *(int *)(v174 + 28);
          sub_1A5DFEB20(v83 + v88, (uint64_t)v169, type metadata accessor for AccessRecord.Timing);
          EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload)
          {
            v90 = (uint64_t)v162;
            if (EnumCaseMultiPayload == 1)
            {
              v91 = v40;
              v92 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v40 + 56);
              v92(v162, 1, 1, v39);
              sub_1A5DFEA20((uint64_t)v169, type metadata accessor for AccessRecord.Timing);
              goto LABEL_27;
            }
            v94 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
            v95 = v169;
            v93 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v40 + 32);
            v93(v82, &v169[*(int *)(v94 + 48)], v39);
            (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v95, v39);
          }
          else
          {
            v93 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v40 + 32);
            v93(v82, v169, v39);
            v90 = (uint64_t)v162;
          }
          v93((_BYTE *)v90, v82, v39);
          v91 = v40;
          v92 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v40 + 56);
          v92((_BYTE *)v90, 0, 1, v39);
LABEL_27:
          v96 = v172;
          sub_1A5DFEA5C(v90, (uint64_t)v172, &qword_1EE808E60);
          v97 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v91 + 48);
          if (v97(v96, 1, v39) == 1)
          {
            sub_1A5DFEAA0((uint64_t)v96, &qword_1EE808E60);
            sub_1A5DFEA20(v83, type metadata accessor for AccessRecord);
            sub_1A5DFEA20((uint64_t)v171, type metadata accessor for AccessRecord);
            v40 = v91;
            v82 = v165;
            v98 = v166;
LABEL_29:
            v99 = (unint64_t)v177;
            v100 = (unint64_t)&v176[v98];
            if (v177 < v176 || (unint64_t)v177 >= v100)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v177 != v176)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v176 = (_BYTE *)v100;
            v106 = a2;
            goto LABEL_50;
          }
          v101 = (uint64_t)&v171[v88];
          v102 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v91 + 32);
          v102(v159, v96, v39);
          sub_1A5DFEB20(v101, (uint64_t)v161, type metadata accessor for AccessRecord.Timing);
          v103 = swift_getEnumCaseMultiPayload();
          if (v103)
          {
            v104 = v156;
            if (v103 == 1)
            {
              v105 = (uint64_t)v154;
              v92(v154, 1, 1, v39);
              sub_1A5DFEA20((uint64_t)v161, type metadata accessor for AccessRecord.Timing);
              goto LABEL_41;
            }
            v107 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
            v108 = v161;
            v102(v104, &v161[*(int *)(v107 + 48)], v39);
            (*(void (**)(_BYTE *, uint64_t))(v167 + 8))(v108, v39);
          }
          else
          {
            v104 = v156;
            v102(v156, v161, v39);
          }
          v105 = (uint64_t)v154;
          v102(v154, v104, v39);
          v92((_BYTE *)v105, 0, 1, v39);
LABEL_41:
          v109 = v97((_BYTE *)v105, 1, v39);
          v40 = v167;
          v82 = v165;
          if (v109 == 1)
          {
            sub_1A5DFEAA0(v105, &qword_1EE808E60);
            (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v159, v39);
            sub_1A5DFEA20(v83, type metadata accessor for AccessRecord);
            sub_1A5DFEA20((uint64_t)v171, type metadata accessor for AccessRecord);
            v98 = v166;
          }
          else
          {
            v110 = v150;
            v102(v150, (_BYTE *)v105, v39);
            sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
            v111 = v159;
            v112 = sub_1A5DFF8B4();
            v113 = *(void (**)(_BYTE *, uint64_t))(v40 + 8);
            v113(v110, v39);
            v83 = (uint64_t)v152;
            v113(v111, v39);
            sub_1A5DFEA20(v83, type metadata accessor for AccessRecord);
            sub_1A5DFEA20((uint64_t)v171, type metadata accessor for AccessRecord);
            v98 = v166;
            if ((v112 & 1) != 0)
              goto LABEL_29;
          }
          v99 = (unint64_t)v177;
          v106 = a2 + v98;
          if ((unint64_t)v177 < a2 || (unint64_t)v177 >= v106)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v177 == (_BYTE *)a2)
          {
            v99 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
LABEL_50:
          v177 = (_BYTE *)(v99 + v98);
          if (v176 < v170)
          {
            v87 = (uint64_t)v176;
            a2 = v106;
            if (v106 < v168)
              continue;
          }
          goto LABEL_92;
        }
      }
      goto LABEL_92;
    }
    v84 = v79 / v166 * v166;
    if (a4 < a2 || a2 + v84 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
      v85 = v164;
    }
    else
    {
      v85 = v164;
      if (a4 != a2)
        swift_arrayInitWithTakeBackToFront();
    }
    v165 = (_BYTE *)a4;
    v114 = a4 + v84;
    v175 = a4 + v84;
    v177 = (_BYTE *)a2;
    v162 = v78;
    if (v84 < 1 || (unint64_t)v78 >= a2)
    {
LABEL_92:
      sub_1A5DFC774((unint64_t *)&v177, (unint64_t *)&v176, (uint64_t *)&v175);
      return 1;
    }
    v116 = -v166;
    v166 = (uint64_t)v67;
    v169 = (_BYTE *)v116;
    while (1)
    {
      sub_1A5DFEB20(v114 + v116, (uint64_t)v172, type metadata accessor for AccessRecord);
      v171 = (_BYTE *)(a2 + v116);
      sub_1A5DFEB20(a2 + v116, (uint64_t)v67, type metadata accessor for AccessRecord);
      v117 = *(int *)(v174 + 28);
      sub_1A5DFEB20((uint64_t)&v67[v117], (uint64_t)v170, type metadata accessor for AccessRecord.Timing);
      v118 = swift_getEnumCaseMultiPayload();
      if (v118)
      {
        if (v118 == 1)
        {
          v119 = (_BYTE *)a2;
          v120 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v40 + 56);
          v121 = (uint64_t)v163;
          v120(v163, 1, 1, v39);
          sub_1A5DFEA20((uint64_t)v170, type metadata accessor for AccessRecord.Timing);
          goto LABEL_65;
        }
        v123 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
        v124 = v170;
        v122 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v40 + 32);
        v122(v85, &v170[*(int *)(v123 + 48)], v39);
        (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v124, v39);
      }
      else
      {
        v122 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v40 + 32);
        v122(v85, v170, v39);
      }
      v119 = (_BYTE *)a2;
      v125 = v163;
      v122(v163, v85, v39);
      v121 = (uint64_t)v125;
      v120 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v40 + 56);
      v120((_BYTE *)v121, 0, 1, v39);
LABEL_65:
      v126 = (uint64_t)v158;
      sub_1A5DFEA5C(v121, (uint64_t)v158, &qword_1EE808E60);
      v127 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 48);
      if (v127(v126, 1, v39) != 1)
      {
        v168 = a3;
        v130 = &v172[v117];
        v131 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v40 + 32);
        v131(v160, v126, v39);
        v132 = (uint64_t)v130;
        v133 = v155;
        sub_1A5DFEB20(v132, (uint64_t)v155, type metadata accessor for AccessRecord.Timing);
        v134 = swift_getEnumCaseMultiPayload();
        if (v134)
        {
          if (v134 == 1)
          {
            v135 = v157;
            v120(v157, 1, 1, v39);
            v136 = (uint64_t)v133;
            v137 = (uint64_t)v135;
            sub_1A5DFEA20(v136, type metadata accessor for AccessRecord.Timing);
LABEL_73:
            v140 = v127(v137, 1, v39);
            v141 = v167;
            if (v140 == 1)
            {
              sub_1A5DFEAA0(v137, &qword_1EE808E60);
              v129 = v141;
              (*(void (**)(_BYTE *, uint64_t))(v141 + 8))(v160, v39);
              v128 = 1;
            }
            else
            {
              v142 = v151;
              v131(v151, v137, v39);
              sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
              v143 = v160;
              v128 = sub_1A5DFF8B4() ^ 1;
              v129 = v141;
              v144 = *(void (**)(_BYTE *, uint64_t))(v141 + 8);
              v144(v142, v39);
              v144(v143, v39);
            }
            a3 = v168;
            goto LABEL_77;
          }
          v139 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
          v138 = v153;
          v131(v153, (uint64_t)&v133[*(int *)(v139 + 48)], v39);
          (*(void (**)(_BYTE *, uint64_t))(v167 + 8))(v133, v39);
        }
        else
        {
          v138 = v153;
          v131(v153, (uint64_t)v133, v39);
        }
        v137 = (uint64_t)v157;
        v131(v157, (uint64_t)v138, v39);
        v120((_BYTE *)v137, 0, 1, v39);
        goto LABEL_73;
      }
      sub_1A5DFEAA0(v126, &qword_1EE808E60);
      v128 = 0;
      v129 = v40;
LABEL_77:
      v67 = (_BYTE *)v166;
      v116 = (uint64_t)v169;
      v145 = &v169[a3];
      sub_1A5DFEA20(v166, type metadata accessor for AccessRecord);
      sub_1A5DFEA20((uint64_t)v172, type metadata accessor for AccessRecord);
      if ((v128 & 1) != 0)
      {
        if (a3 < (unint64_t)v119 || v145 >= v119)
        {
          v148 = v171;
          swift_arrayInitWithTakeFrontToBack();
          v146 = v148;
          v116 = (uint64_t)v169;
          v40 = v129;
          v85 = v164;
        }
        else
        {
          v116 = (uint64_t)v169;
          v40 = v129;
          v85 = v164;
          v146 = v171;
          if ((_BYTE *)a3 != v119)
          {
            swift_arrayInitWithTakeBackToFront();
            v146 = v171;
          }
        }
        v177 += v116;
      }
      else
      {
        v147 = v175;
        v175 += v116;
        if (a3 < v147 || (unint64_t)v145 >= v147)
        {
          swift_arrayInitWithTakeFrontToBack();
          v146 = v119;
          v40 = v129;
          v85 = v164;
        }
        else
        {
          v40 = v129;
          v85 = v164;
          if (a3 != v147)
            swift_arrayInitWithTakeBackToFront();
          v146 = v119;
        }
      }
      v114 = v175;
      if (v175 > (unint64_t)v165)
      {
        a2 = (unint64_t)v146;
        a3 = (unint64_t)v145;
        if (v146 > v162)
          continue;
      }
      goto LABEL_92;
    }
  }
LABEL_95:
  __break(1u);
  return result;
}

char *sub_1A5DFC67C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808EA0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1A5DFC774(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for AccessRecord(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_13;
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_1A5DFC824(uint64_t a1)
{
  return sub_1A5DFC67C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

size_t sub_1A5DFC838(_QWORD *a1)
{
  return sub_1A5DF9638(0, a1[2], 0, a1);
}

uint64_t _s17PrivacyAccounting12AccessRecordV6TimingO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  int EnumCaseMultiPayload;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  char *v50;
  char *v51;
  char v52;
  void (*v53)(char *, uint64_t);
  char v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v69 = a2;
  v3 = sub_1A5DFF884();
  v67 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  v5 = MEMORY[0x1E0C80A78](v3, v4);
  v64 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5, v7);
  v65 = (char *)&v64 - v9;
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v66 = (char *)&v64 - v12;
  v14 = MEMORY[0x1E0C80A78](v11, v13);
  v16 = (char *)&v64 - v15;
  MEMORY[0x1E0C80A78](v14, v17);
  v19 = (char *)&v64 - v18;
  v20 = type metadata accessor for AccessRecord.Timing(0);
  v22 = MEMORY[0x1E0C80A78](v20, v21);
  v24 = (char *)&v64 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x1E0C80A78](v22, v25);
  v28 = (char *)&v64 - v27;
  MEMORY[0x1E0C80A78](v26, v29);
  v31 = (char *)&v64 - v30;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E68);
  v34 = MEMORY[0x1E0C80A78](v32, v33);
  v36 = (char *)&v64 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = (uint64_t)&v36[*(int *)(v34 + 48)];
  sub_1A5DFEB20(a1, (uint64_t)v36, type metadata accessor for AccessRecord.Timing);
  sub_1A5DFEB20(v69, v37, type metadata accessor for AccessRecord.Timing);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_1A5DFEB20((uint64_t)v36, (uint64_t)v28, type metadata accessor for AccessRecord.Timing);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v39 = v67;
        v40 = v68;
        (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v16, v37, v68);
        v41 = sub_1A5DFF86C();
        v42 = *(void (**)(char *, uint64_t))(v39 + 8);
        v42(v16, v40);
        v42(v28, v40);
LABEL_17:
        sub_1A5DFEA20((uint64_t)v36, type metadata accessor for AccessRecord.Timing);
        return v41 & 1;
      }
      (*(void (**)(char *, uint64_t))(v67 + 8))(v28, v68);
      goto LABEL_13;
    }
    sub_1A5DFEB20((uint64_t)v36, (uint64_t)v24, type metadata accessor for AccessRecord.Timing);
    v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48);
    v44 = &v24[v43];
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v45 = v37 + v43;
      v47 = v66;
      v46 = v67;
      v48 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 32);
      v49 = v68;
      v48(v66, v37, v68);
      v50 = v65;
      v48(v65, (uint64_t)v44, v49);
      v51 = v64;
      v48(v64, v45, v49);
      v52 = sub_1A5DFF86C();
      v53 = *(void (**)(char *, uint64_t))(v46 + 8);
      v53(v24, v49);
      if ((v52 & 1) == 0)
      {
        v53(v51, v49);
        v53(v50, v49);
        v53(v47, v49);
        sub_1A5DFEA20((uint64_t)v36, type metadata accessor for AccessRecord.Timing);
        goto LABEL_14;
      }
      v54 = sub_1A5DFF86C();
      v55 = v51;
      v41 = v54;
      v53(v55, v49);
      v53(v50, v49);
      v56 = v47;
      v57 = v49;
LABEL_16:
      v53(v56, v57);
      goto LABEL_17;
    }
    v58 = *(void (**)(char *, uint64_t))(v67 + 8);
    v59 = v44;
    v60 = v68;
    v58(v59, v68);
    v58(v24, v60);
  }
  else
  {
    sub_1A5DFEB20((uint64_t)v36, (uint64_t)v31, type metadata accessor for AccessRecord.Timing);
    if (!swift_getEnumCaseMultiPayload())
    {
      v61 = v67;
      v62 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v19, v37, v68);
      v41 = sub_1A5DFF86C();
      v53 = *(void (**)(char *, uint64_t))(v61 + 8);
      v53(v19, v62);
      v56 = v31;
      v57 = v62;
      goto LABEL_16;
    }
    (*(void (**)(char *, uint64_t))(v67 + 8))(v31, v68);
  }
LABEL_13:
  sub_1A5DFEAA0((uint64_t)v36, &qword_1EE808E68);
LABEL_14:
  v41 = 0;
  return v41 & 1;
}

uint64_t sub_1A5DFCC94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t result;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  void (*v40)(char *, uint64_t, uint64_t);
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  objc_class *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  objc_super v69;
  _QWORD v70[3];
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char *v74;

  v66 = a1;
  v3 = sub_1A5DFF80C();
  v64 = *(char **)(v3 - 8);
  v65 = (char *)v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v63 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E70);
  MEMORY[0x1E0C80A78](v6, v7);
  v58 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AccessRecord(0);
  v67 = *(_QWORD *)(v9 - 8);
  v68 = v9;
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14);
  v16 = (char *)&v57 - v15;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C80);
  v18 = MEMORY[0x1E0C80A78](v60, v17);
  v20 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18, v21);
  v23 = (char *)&v57 - v22;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C88);
  v25 = MEMORY[0x1E0C80A78](v59, v24);
  v27 = (char *)&v57 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25, v28);
  v61 = (uint64_t)&v57 - v29;
  v30 = sub_1A5DFF884();
  sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
  v31 = a2;
  v32 = v66;
  if ((sub_1A5DFF8B4() & 1) != 0)
  {
    LODWORD(v70[0]) = 22;
    sub_1A5DF91CC(MEMORY[0x1E0DEE9D8]);
    sub_1A5DFEB64(&qword_1EE808E80, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADE88]);
    v33 = v63;
    v34 = v65;
    sub_1A5DFF818();
    sub_1A5DFF800();
    (*((void (**)(char *, char *))v64 + 1))(v33, v34);
    return swift_willThrow();
  }
  else
  {
    result = sub_1A5DFF8CC();
    if ((result & 1) != 0)
    {
      v63 = v13;
      v65 = v27;
      v36 = v60;
      v37 = &v23[*(int *)(v60 + 48)];
      v38 = v32;
      v39 = *(_QWORD **)(v30 - 8);
      v40 = (void (*)(char *, uint64_t, uint64_t))v39[2];
      v40(v23, v38, v30);
      v64 = v37;
      v40(v37, v31, v30);
      v41 = &v20[*(int *)(v36 + 48)];
      v40(v20, (uint64_t)v23, v30);
      v40(v41, (uint64_t)v37, v30);
      v42 = (void (*)(char *, char *, uint64_t))v39[4];
      v43 = (uint64_t)v65;
      v42(v65, v20, v30);
      v44 = (void (*)(char *, uint64_t))v39[1];
      v44(v41, v30);
      v45 = &v20[*(int *)(v36 + 48)];
      v42(v20, v23, v30);
      v42(v45, v64, v30);
      v42((char *)(v43 + *(int *)(v59 + 36)), v45, v30);
      v44(v20, v30);
      v46 = v61;
      sub_1A5DFEA5C(v43, v61, &qword_1EE808C88);
      v47 = v62;
      static AccessHistory<>.forReport(in:)(v46, &v74);
      result = sub_1A5DFEAA0(v46, &qword_1EE808C88);
      if (!v47)
      {
        v66 = 0;
        v48 = v74;
        v73 = MEMORY[0x1E0DEE9D8];
        sub_1A5DFF9B0();
        v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808C70);
        v71 = v49;
        v72 = sub_1A5DF6E30();
        v70[0] = v48;
        v70[1] = 0;
        v65 = v48;
        swift_bridgeObjectRetain();
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v70, v49);
        v50 = (uint64_t)v58;
        sub_1A5DFF974();
        v51 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v50, 1, v68);
        v52 = (uint64_t)v63;
        if (v51 != 1)
        {
          do
          {
            sub_1A5DFEADC(v50, (uint64_t)v16);
            sub_1A5DFEB20((uint64_t)v16, v52, type metadata accessor for AccessRecord);
            v53 = (objc_class *)_s18AccessRecordObjectCMa(0);
            v54 = objc_allocWithZone(v53);
            sub_1A5DFEB20(v52, (uint64_t)v54+ OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record, type metadata accessor for AccessRecord);
            v69.receiver = v54;
            v69.super_class = v53;
            objc_msgSendSuper2(&v69, sel_init);
            sub_1A5DFEA20(v52, type metadata accessor for AccessRecord);
            sub_1A5DFEA20((uint64_t)v16, type metadata accessor for AccessRecord);
            sub_1A5DFF998();
            sub_1A5DFF9BC();
            sub_1A5DFF9C8();
            sub_1A5DFF9A4();
            __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v70, v71);
            sub_1A5DFF974();
          }
          while ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v50, 1, v68) != 1);
        }
        sub_1A5DFEAA0((uint64_t)v70, &qword_1EE808E78);
        sub_1A5DFEAA0(v50, &qword_1EE808E70);
        swift_bridgeObjectRelease();
        _s18AccessRecordObjectCMa(0);
        v55 = (void *)sub_1A5DFF938();
        swift_release();
        v56 = objc_msgSend(v55, sel_objectEnumerator);

        return (uint64_t)v56;
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t _s17PrivacyAccounting20ReverseChronologicalO15isOrderedBeforeySbAA12AccessRecordV6TimingO_AHtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int EnumCaseMultiPayload;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  char v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  _QWORD v40[2];

  v40[1] = a1;
  v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE808E60);
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v9, v12);
  v15 = (char *)v40 - v14;
  MEMORY[0x1E0C80A78](v13, v16);
  v18 = (char *)v40 - v17;
  v19 = sub_1A5DFF884();
  v20 = *(_QWORD *)(v19 - 8);
  v22 = MEMORY[0x1E0C80A78](v19, v21);
  v40[0] = (char *)v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x1E0C80A78](v22, v24);
  v27 = (char *)v40 - v26;
  MEMORY[0x1E0C80A78](v25, v28);
  v30 = (char *)v40 - v29;
  sub_1A5DFEB20(a2, (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v15, 1, 1, v19);
      sub_1A5DFEA20((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
      goto LABEL_7;
    }
    v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v32(v27, &v6[*(int *)(v33 + 48)], v19);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v19);
  }
  else
  {
    v32 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v32(v27, v6, v19);
  }
  v32(v15, v27, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v15, 0, 1, v19);
LABEL_7:
  sub_1A5DFEA5C((uint64_t)v15, (uint64_t)v18, &qword_1EE808E60);
  v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v34(v18, 1, v19) == 1)
  {
    sub_1A5DFEAA0((uint64_t)v18, &qword_1EE808E60);
    v35 = 0;
  }
  else
  {
    v36 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v36(v30, v18, v19);
    sub_1A5DF81B0(v11);
    if (v34(v11, 1, v19) == 1)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v30, v19);
      sub_1A5DFEAA0((uint64_t)v11, &qword_1EE808E60);
      v35 = 1;
    }
    else
    {
      v37 = v40[0];
      v36((char *)v40[0], v11, v19);
      sub_1A5DFEB64(&qword_1EE808C90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B0]);
      v35 = sub_1A5DFF8B4() ^ 1;
      v38 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v38(v37, v19);
      v38((uint64_t)v30, v19);
    }
  }
  return v35 & 1;
}

void sub_1A5DFD5A8()
{
  JUMPOUT(0x1A85B61B8);
}

unint64_t sub_1A5DFD5BC()
{
  unint64_t result;

  result = qword_1EE808C98[0];
  if (!qword_1EE808C98[0])
  {
    result = MEMORY[0x1A85B61B8](&protocol conformance descriptor for AccessRecord.AccessorID, &type metadata for AccessRecord.AccessorID);
    atomic_store(result, qword_1EE808C98);
  }
  return result;
}

uint64_t sub_1A5DFD600()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for AccessHistory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AccessHistory);
}

uint64_t sub_1A5DFD614(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1A5DFD668(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *sub_1A5DFD6A0(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1A5DFD840(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t sub_1A5DFD878(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1A5DFD8C0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for AccessIterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AccessIterator);
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessRecord(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = (void *)a2[4];
    v10 = *(int *)(a3 + 28);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    a1[4] = (uint64_t)v9;
    type metadata accessor for AccessRecord.Timing(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = v9;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v16 = sub_1A5DFF884();
      v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
      v17(v11, v12, v16);
      v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v17(&v11[*(int *)(v18 + 48)], &v12[*(int *)(v18 + 48)], v16);
    }
    else
    {
      v14 = sub_1A5DFF884();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
    }
    swift_storeEnumTagMultiPayload();
    v19 = *(int *)(a3 + 32);
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    v20[8] = v21[8];
  }
  return v4;
}

uint64_t destroy for AccessRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = a1 + *(int *)(a2 + 28);
  type metadata accessor for AccessRecord.Timing(0);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v7 = sub_1A5DFF884();
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9(v4, v7);
    v8 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48);
    return ((uint64_t (*)(uint64_t, uint64_t))v9)(v8, v7);
  }
  else if (result <= 1)
  {
    v6 = sub_1A5DFF884();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  return result;
}

_QWORD *initializeWithCopy for AccessRecord(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = (void *)a2[4];
  a1[4] = v8;
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  type metadata accessor for AccessRecord.Timing(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = v8;
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v14 = sub_1A5DFF884();
    v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v15(v10, v11, v14);
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v15(&v10[*(int *)(v16 + 48)], &v11[*(int *)(v16 + 48)], v14);
  }
  else
  {
    v13 = sub_1A5DFF884();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v11, v13);
  }
  swift_storeEnumTagMultiPayload();
  v17 = *(int *)(a3 + 32);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  return a1;
}

_QWORD *assignWithCopy for AccessRecord(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = (void *)a2[4];
  v7 = (void *)a1[4];
  a1[4] = v6;
  v8 = v6;

  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    sub_1A5DFEA20((uint64_t)a1 + v9, type metadata accessor for AccessRecord.Timing);
    type metadata accessor for AccessRecord.Timing(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v13 = sub_1A5DFF884();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      v14(v10, v11, v13);
      v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
    }
    else
    {
      v12 = sub_1A5DFF884();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  v16 = *(int *)(a3 + 32);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)v18;
  v17[8] = v18[8];
  *(_QWORD *)v17 = v19;
  return a1;
}

uint64_t initializeWithTake for AccessRecord(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  type metadata accessor for AccessRecord.Timing(0);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v11 = sub_1A5DFF884();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
    v12(v8, v9, v11);
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v12(v8 + *(int *)(v13 + 48), v9 + *(int *)(v13 + 48), v11);
  }
  else
  {
    v10 = sub_1A5DFF884();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  }
  swift_storeEnumTagMultiPayload();
  v14 = *(int *)(a3 + 32);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *(_BYTE *)(v15 + 8) = *(_BYTE *)(v16 + 8);
  return a1;
}

_QWORD *assignWithTake for AccessRecord(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = (void *)a1[4];
  a1[4] = a2[4];

  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    sub_1A5DFEA20((uint64_t)a1 + v9, type metadata accessor for AccessRecord.Timing);
    type metadata accessor for AccessRecord.Timing(0);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v13 = sub_1A5DFF884();
      v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
      v14(v10, v11, v13);
      v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v14(&v10[*(int *)(v15 + 48)], &v11[*(int *)(v15 + 48)], v13);
    }
    else
    {
      v12 = sub_1A5DFF884();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  v16 = *(int *)(a3 + 32);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessRecord()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5DFE098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for AccessRecord.Timing(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AccessRecord()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A5DFE120(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for AccessRecord.Timing(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1A5DFE194()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AccessRecord.Timing(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AccessRecord.AccessorID(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AccessRecord.AccessorID()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AccessRecord.AccessorID(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AccessRecord.AccessorID(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessRecord.AccessorID(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessRecord.AccessorID(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_1A5DFE350()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccessRecord.AccessorID()
{
  return &type metadata for AccessRecord.AccessorID;
}

uint64_t *initializeBufferWithCopyOfBuffer for AccessRecord.Timing(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v8 = sub_1A5DFF884();
      v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v9((uint64_t *)((char *)a1 + *(int *)(v10 + 48)), (uint64_t *)((char *)a2 + *(int *)(v10 + 48)), v8);
    }
    else
    {
      v6 = sub_1A5DFF884();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for AccessRecord.Timing(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    v4 = sub_1A5DFF884();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
    v6(a1, v4);
    v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0) + 48);
    return ((uint64_t (*)(uint64_t, uint64_t))v6)(v5, v4);
  }
  else if (result <= 1)
  {
    v3 = sub_1A5DFF884();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

uint64_t initializeWithCopy for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v5 = sub_1A5DFF884();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
    v6(a1, a2, v5);
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    v4 = sub_1A5DFF884();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1A5DFEA20(a1, type metadata accessor for AccessRecord.Timing);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v5 = sub_1A5DFF884();
      v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
      v6(a1, a2, v5);
      v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      v4 = sub_1A5DFF884();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v5 = sub_1A5DFF884();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32);
    v6(a1, a2, v5);
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
    v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
  }
  else
  {
    v4 = sub_1A5DFF884();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for AccessRecord.Timing(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1A5DFEA20(a1, type metadata accessor for AccessRecord.Timing);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v5 = sub_1A5DFF884();
      v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32);
      v6(a1, a2, v5);
      v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE808DA0);
      v6(a1 + *(int *)(v7 + 48), a2 + *(int *)(v7 + 48), v5);
    }
    else
    {
      v4 = sub_1A5DFF884();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AccessRecord.Timing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AccessRecord.Timing(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1A5DFE8C4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A5DFE8D4()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  result = sub_1A5DFF884();
  if (v1 <= 0x3F)
  {
    v3 = *(_QWORD *)(result - 8) + 64;
    v4 = v3;
    swift_getTupleTypeLayout2();
    v5 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of static AccessOrder.isOrderedBefore(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for ReverseChronological()
{
  return &type metadata for ReverseChronological;
}

uint64_t sub_1A5DFE964()
{
  return _s18AccessRecordObjectCMa(0);
}

uint64_t _s18AccessRecordObjectCMa(uint64_t a1)
{
  return sub_1A5DFE980(a1, (uint64_t *)&unk_1EE808E50);
}

uint64_t sub_1A5DFE980(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A5DFE9B4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for AccessRecord(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1A5DFEA20(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A5DFEA5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A5DFEAA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A5DFEADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccessRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A5DFEB20(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A5DFEB64(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1A85B61B8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A5DFEBA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1A5DFEBE8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1A5DFEBF8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1A5DFEC34(uint64_t a1)
{
  uint64_t v1;

  return sub_1A5DF8A2C(a1, v1);
}

uint64_t sub_1A5DFEC3C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A5DF7C60(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1A85B617C](a1, v6, a5);
}

void implicitIdentityForEntitlementDictionary_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, v0, (uint64_t)v0, "BUG IN %{public}@! Encountered malformed implicitly assumed identity (app store app version) entitlement. The value is not a string %{public}@", v1);
  OUTLINED_FUNCTION_4();
}

void PAAuthenticatedClientIdentity_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A5DE1000, a2, a3, "Failed to retrieve entitlements for process.  Got %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void PAAuthenticatedClientIdentityWithClientProperties_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, a3, v5, "BUG IN %@! They are attempting to assume an identity that they aren't entitled to: %{public}@", v6);

  OUTLINED_FUNCTION_3();
}

void PAAuthenticatedClientIdentityWithClientProperties_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, v0, (uint64_t)v0, "BUG IN %{public}@! They have a malformed explicitly assumed identity entitlement. The value is not an array: %{public}@", v1);
  OUTLINED_FUNCTION_4();
}

void PAAuthenticatedClientIdentityWithClientProperties_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, a3, v5, "BUG IN %{public}@! They attempted to provide a runtime-determined identity (%{public}@) while using the assumed-identity entitlement", v6);

  OUTLINED_FUNCTION_3();
}

void __lookupTCCIdentity_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A5DE1000, a2, a3, "TCC attribution for client failed with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void implicitIdentityEntryToTCCIdentity_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, a3, v5, "BUG IN %{public}@! Encountered malformed implicitly assumed identity entitlement. Bad identity type: %{public}@", v6);

  OUTLINED_FUNCTION_3();
}

void implicitIdentityEntryToTCCIdentity_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, v0, (uint64_t)v0, "BUG IN %{public}@! Encountered malformed implicitly assumed identity entitlement. Bad identity value: %{public}@", v1);
  OUTLINED_FUNCTION_4();
}

void implicitIdentityEntryToTCCIdentity_cold_3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A5DE1000, v0, (uint64_t)v0, "BUG IN %{public}@! Encountered malformed implicitly assumed identity entitlement. The value is not a dictionary describing the identity: %{public}@", v1);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_1A5DFF800()
{
  return MEMORY[0x1E0CADE70]();
}

uint64_t sub_1A5DFF80C()
{
  return MEMORY[0x1E0CADE90]();
}

uint64_t sub_1A5DFF818()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1A5DFF824()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A5DFF830()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A5DFF83C()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1A5DFF848()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1A5DFF854()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1A5DFF860()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A5DFF86C()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1A5DFF878()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A5DFF884()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A5DFF890()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A5DFF89C()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1A5DFF8A8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A5DFF8B4()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1A5DFF8C0()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1A5DFF8CC()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1A5DFF8D8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A5DFF8E4()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1A5DFF8F0()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1A5DFF8FC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A5DFF908()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A5DFF914()
{
  return MEMORY[0x1E0DEAAB8]();
}

uint64_t sub_1A5DFF920()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1A5DFF92C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A5DFF938()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A5DFF944()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A5DFF950()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A5DFF95C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A5DFF968()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A5DFF974()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1A5DFF980()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1A5DFF98C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A5DFF998()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A5DFF9A4()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A5DFF9B0()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A5DFF9BC()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A5DFF9C8()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A5DFF9D4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A5DFF9E0()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A5DFF9EC()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1A5DFF9F8()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1A5DFFA04()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A5DFFA10()
{
  return MEMORY[0x1E0DED980]();
}

uint64_t sub_1A5DFFA1C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A5DFFA28()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A5DFFA34()
{
  return MEMORY[0x1E0DEDF40]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98480](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1E0C98488](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x1E0C984C0](formatter, formatString);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_greenTeaDeviceCapability()
{
  return MEMORY[0x1E0DE2C28]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6600](task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t tcc_authorization_record_get_service()
{
  return MEMORY[0x1E0DB1220]();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return MEMORY[0x1E0DB1230]();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1E0DB1240]();
}

uint64_t tcc_identity_copy_external_representation()
{
  return MEMORY[0x1E0DB1288]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

uint64_t tcc_identity_create_from_external_representation()
{
  return MEMORY[0x1E0DB1298]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1E0DB12A0]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1E0DB12A8]();
}

uint64_t tcc_identity_get_verifier_code_requirement_string()
{
  return MEMORY[0x1E0DB12B0]();
}

uint64_t tcc_identity_get_verifier_type()
{
  return MEMORY[0x1E0DB12B8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1E0DB12C8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1E0DB12F0]();
}

uint64_t tcc_object_copy_description()
{
  return MEMORY[0x1E0DB1310]();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return MEMORY[0x1E0DB1338]();
}

uint64_t tcc_server_singleton_default()
{
  return MEMORY[0x1E0DB1368]();
}

uint64_t tcc_service_get_CF_name()
{
  return MEMORY[0x1E0DB1370]();
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

