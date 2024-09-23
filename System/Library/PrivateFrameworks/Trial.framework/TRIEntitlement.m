@implementation TRIEntitlement

+ (id)applicationBundleIdentifierFromSelf
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entitlementKeyForApplicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TRIEntitlement stringForCurrentProcessEntitlement:](TRIEntitlement, "stringForCurrentProcessEntitlement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)stringForCurrentProcessEntitlement:(id)a3
{
  id v4;
  SecTaskRef v5;
  SecTaskRef v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a1, "stringForEntitlement:fromSecTask:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v6);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "SecTaskCreateFromSelf() failed.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)stringForEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  id v5;
  void *v6;
  CFTypeID TypeID;

  v5 = a3;
  TypeID = CFStringGetTypeID();
  objc_msgSend((id)objc_opt_class(), "valueForEntitlement:fromSecTask:ofType:", v5, a4, &TypeID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entitlementKeyForApplicationBundleIdentifier
{
  return CFSTR("application-identifier");
}

+ (id)objectForCurrentProcessEntitlement:(id)a3
{
  id v4;
  SecTaskRef v5;
  SecTaskRef v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a1, "valueForEntitlement:fromSecTask:ofType:", v4, v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v6);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)valueForEntitlement:(id)a3 fromSecTask:(__SecTask *)a4 ofType:(unint64_t *)a5
{
  __CFString *v9;
  unint64_t v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  CFErrorRef v16;
  NSObject *v17;
  NSObject *v18;
  __CFString *v20;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  CFErrorRef v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  error = 0;
  if (a5)
  {
    v10 = *a5;
    if (v10 == CFStringGetTypeID() || v10 == CFArrayGetTypeID() || v10 == CFNumberGetTypeID())
    {
      v11 = (objc_class *)objc_opt_class();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIEntitlement.m"), 180, CFSTR("cannot validate entitlement with unsupported typeId %ld"), *a5);

  }
  v11 = 0;
LABEL_8:
  v13 = SecTaskCopyValueForEntitlement(a4, v9, &error);
  if (!v13)
  {
    v16 = error;
    TRILogCategory_ClientFramework();
    v17 = objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v9;
        v24 = 2112;
        v25 = error;
        _os_log_error_impl(&dword_19B89C000, v15, OS_LOG_TYPE_ERROR, "SecTaskCopyValueForEntitlement failed for \"%@\", error: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_19B89C000, v15, OS_LOG_TYPE_INFO, "Entitlement \"%@\" is not present.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  v14 = v13;
  if (v11 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(v11);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v20;
      v24 = 2112;
      v25 = (CFErrorRef)v9;
      _os_log_error_impl(&dword_19B89C000, v18, OS_LOG_TYPE_ERROR, "Unexpected entitlement class %@ for entitlement \"%@\", buf, 0x16u);

    }
    v15 = v14;
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  TRILogCategory_ClientFramework();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = (CFErrorRef)v14;
    _os_log_impl(&dword_19B89C000, v15, OS_LOG_TYPE_INFO, "Found entitlement: \"%@\" --> %@", buf, 0x16u);
  }
LABEL_22:

  if (error)
    CFRelease(error);

  return v14;
}

+ (BOOL)isEntitledToApplicationGroup:(id)a3 withAuditToken:(id *)a4
{
  return 1;
}

+ (id)applicationBundleIdentifierWithAuditToken:(id *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  _OWORD v8[2];

  objc_msgSend(a1, "entitlementKeyForApplicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  +[TRIEntitlement stringForEntitlement:withAuditToken:](TRIEntitlement, "stringForEntitlement:withAuditToken:", v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)codeSignIdentifierWithAuditToken:(id *)a3
{
  const __CFAllocator *v3;
  __int128 v4;
  __SecTask *v5;
  __SecTask *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  error = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(v3, &token);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, &error);
    if (error)
    {
      TRILogCategory_ClientFramework();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 138412290;
        *(_QWORD *)&token.val[1] = error;
        _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "SecTaskCopySigningIdentifier failed, error: %@", (uint8_t *)&token, 0xCu);
      }

      if (error)
        CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_error_impl(&dword_19B89C000, v9, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&token, 2u);
    }

    v7 = 0;
  }
  TRILogCategory_ClientFramework();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(_QWORD *)&token.val[1] = v7;
    _os_log_impl(&dword_19B89C000, v10, OS_LOG_TYPE_INFO, "code sign identifier from signature --> %@", (uint8_t *)&token, 0xCu);
  }

  return v7;
}

+ (id)teamIdWithAuditToken:(id *)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->var0[4];
  v15 = *(_OWORD *)a3->var0;
  v16 = v4;
  +[TRIEntitlement _teamIdFromSecTaskWithAuditToken:](TRIEntitlement, "_teamIdFromSecTaskWithAuditToken:", &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = *(_OWORD *)&a3->var0[4];
    v15 = *(_OWORD *)a3->var0;
    v16 = v8;
    +[TRIEntitlement stringForEntitlement:withAuditToken:](TRIEntitlement, "stringForEntitlement:withAuditToken:", CFSTR("com.apple.developer.team-identifier"), &v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  v10 = +[TRIEntitlement _isValidFormatForTeamId:](TRIEntitlement, "_isValidFormatForTeamId:", v9);
  TRILogCategory_ClientFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(v15) = 138412290;
      *(_QWORD *)((char *)&v15 + 4) = v9;
      _os_log_impl(&dword_19B89C000, v12, OS_LOG_TYPE_INFO, "valid team id: %@", (uint8_t *)&v15, 0xCu);
    }

    v13 = v9;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v15) = 138412290;
      *(_QWORD *)((char *)&v15 + 4) = v9;
      _os_log_error_impl(&dword_19B89C000, v12, OS_LOG_TYPE_ERROR, "invalid teamId: %@", (uint8_t *)&v15, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

+ (id)_teamIdFromSecTaskWithAuditToken:(id *)a3
{
  const __CFAllocator *v3;
  __int128 v4;
  SecTaskRef v5;
  SecTaskRef v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  audit_token_t token;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(v3, &token);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)SecTaskCopyTeamIdentifier();
    CFRelease(v6);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(token.val[0]) = 0;
      _os_log_error_impl(&dword_19B89C000, v8, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&token, 2u);
    }

    v7 = 0;
  }
  TRILogCategory_ClientFramework();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    token.val[0] = 138412290;
    *(_QWORD *)&token.val[1] = v7;
    _os_log_impl(&dword_19B89C000, v9, OS_LOG_TYPE_INFO, "team id from signature --> %@", (uint8_t *)&token, 0xCu);
  }

  return v7;
}

+ (id)stringForEntitlement:(id)a3 withAuditToken:(id *)a4
{
  id v6;
  __int128 v7;
  SecTaskRef v8;
  SecTaskRef v9;
  void *v10;
  NSObject *v11;
  audit_token_t v13;

  v6 = a3;
  v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v13.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v13.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(0, &v13);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a1, "stringForEntitlement:fromSecTask:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13.val[0]) = 0;
      _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)objectForEntitlement:(id)a3 withAuditToken:(id *)a4
{
  id v6;
  __int128 v7;
  SecTaskRef v8;
  SecTaskRef v9;
  void *v10;
  NSObject *v11;
  audit_token_t v13;

  v6 = a3;
  v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v13.val = *(_OWORD *)a4->var0;
  *(_OWORD *)&v13.val[4] = v7;
  v8 = SecTaskCreateWithAuditToken(0, &v13);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a1, "valueForEntitlement:fromSecTask:ofType:", v6, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
  }
  else
  {
    TRILogCategory_ClientFramework();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13.val[0]) = 0;
      _os_log_error_impl(&dword_19B89C000, v11, OS_LOG_TYPE_ERROR, "SecTaskCreateWithAuditToken() failed.", (uint8_t *)&v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

+ (BOOL)_isValidFormatForTeamId:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;
  BOOL v7;
  BOOL v8;

  v3 = a3;
  if (objc_msgSend(v3, "length") != 10)
    goto LABEL_13;
  v4 = 0;
  do
  {
    v5 = objc_msgSend(v3, "characterAtIndex:", v4);
    v7 = (v5 - 65) < 0x1A || (v5 - 48) < 0xA;
    if (v4 > 8)
      break;
    ++v4;
  }
  while (v7);
  if (v7)
    v8 = 1;
  else
LABEL_13:
    v8 = 0;

  return v8;
}

@end
