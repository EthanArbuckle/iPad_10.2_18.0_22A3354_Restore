@implementation _PASEntitlement

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 logHandle:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  SecTaskRef v8;
  SecTaskRef v9;
  char v10;
  uint8_t v12[16];

  v5 = a3;
  v6 = (id)MEMORY[0x1E0C81028];
  if (a4)
    v6 = a4;
  v7 = v6;
  v8 = SecTaskCreateFromSelf(0);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_class(), "_trueBooleanEntitlementCheckWithSecTask:entitlement:logHandle:", v8, v5, v7);
    CFRelease(v9);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1A0957000, v7, OS_LOG_TYPE_ERROR, "_PASEntitlement: SecTaskCreateFromSelf() failed.", v12, 2u);
    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)taskWithAuditToken:(id *)a3 hasTrueBooleanEntitlement:(id)a4 logHandle:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  __int128 v10;
  SecTaskRef v11;
  SecTaskRef v12;
  char v13;
  audit_token_t v15;

  v7 = a4;
  v8 = (id)MEMORY[0x1E0C81028];
  if (a5)
    v8 = a5;
  v9 = v8;
  v10 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v15.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v15.val[4] = v10;
  v11 = SecTaskCreateWithAuditToken(0, &v15);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend((id)objc_opt_class(), "_trueBooleanEntitlementCheckWithSecTask:entitlement:logHandle:", v11, v7, v9);
    CFRelease(v12);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15.val[0]) = 0;
      _os_log_error_impl(&dword_1A0957000, v9, OS_LOG_TYPE_ERROR, "_PASEntitlement: SecTaskCreateWithAuditToken() failed.", (uint8_t *)&v15, 2u);
    }
    v13 = 0;
  }

  return v13;
}

+ (BOOL)_trueBooleanEntitlementCheckWithSecTask:(__SecTask *)a3 entitlement:(id)a4 logHandle:(id)a5
{
  __CFString *v9;
  id v10;
  void *v11;
  NSObject *v12;
  const __CFBoolean *v13;
  const __CFBoolean *v14;
  CFTypeID v15;
  int Value;
  BOOL v17;
  const char *v18;
  CFErrorRef v19;
  void *v21;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASEntitlement.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entitlementName"));

  }
  v11 = (void *)MEMORY[0x1E0C81028];
  if (v10)
    v11 = v10;
  v12 = v11;

  error = 0;
  v13 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(a3, v9, &error);
  if (v13)
  {
    v14 = v13;
    v15 = CFGetTypeID(v13);
    if (v15 == CFBooleanGetTypeID())
    {
      Value = CFBooleanGetValue(v14);
      v17 = Value != 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v18 = "NO";
        if (Value)
          v18 = "YES";
        *(_DWORD *)buf = 138412546;
        v24 = v9;
        v25 = 2080;
        v26 = (void *)v18;
        _os_log_impl(&dword_1A0957000, v12, OS_LOG_TYPE_INFO, "_PASEntitlement: Found BOOLean entitlement: \"%@\" --> %s", buf, 0x16u);
      }
    }
    else
    {
      v17 = 0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl(&dword_1A0957000, v12, OS_LOG_TYPE_DEFAULT, "_PASEntitlement: Found entitlement \"%@\" but it is not BOOLean.", buf, 0xCu);
        v17 = 0;
      }
    }
    CFRelease(v14);
  }
  else
  {
    v19 = error;
    if (error)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = 0;
LABEL_18:
        CFRelease(v19);
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      v25 = 2112;
      v26 = v19;
      _os_log_error_impl(&dword_1A0957000, v12, OS_LOG_TYPE_ERROR, "_PASEntitlement: SecTaskCopyValueForEntitlement failed for \"%@\", error: %@", buf, 0x16u);
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v17 = 0;
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1A0957000, v12, OS_LOG_TYPE_INFO, "_PASEntitlement: Entitlement \"%@\" is not present.", buf, 0xCu);
    }
    v17 = 0;
  }
  v19 = error;
  if (error)
    goto LABEL_18;
LABEL_19:

  return v17;
}

@end
