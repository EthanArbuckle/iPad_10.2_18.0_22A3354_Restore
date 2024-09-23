@implementation NSXPCConnection(WeatherDaemon)

- (id)wd_bundleIdentifier
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  _BYTE buf[32];
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a1, "auditToken");
  *(_OWORD *)buf = v25;
  *(_OWORD *)&buf[16] = v26;
  MSVBundleIDForAuditToken();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    WDLogForCategory(1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_1A6185000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrieve bundle identifier of the requesting application from the audit_token_t; instead, "
        "using bundle identifier.",
        buf,
        0xCu);
    }

  }
  v24 = 0;
  *(_OWORD *)buf = v25;
  *(_OWORD *)&buf[16] = v26;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;
  if (v5)
  {
    WDLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1A6185000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrieve bundle extension record with error: %{public}@.", buf, 0x16u);

    }
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[NSObject containingBundleRecord](v6, "containingBundleRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
    }
    else
    {
      WDLogForCategory(1uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v12;
        v28 = 2114;
        v29 = v8;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_1A6185000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting application extension %{public}@ (%{public}@) has a containing bundle which is not an application: %{public}@ (%{public}@).", buf, 0x34u);

      }
      v9 = 0;
    }
    objc_msgSend(v9, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      WDLogForCategory(1uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2114;
        *(_QWORD *)&buf[24] = v23;
        v28 = 2114;
        v29 = v15;
        v30 = 2114;
        v31 = v9;
        v32 = 2114;
        v33 = v19;
        _os_log_impl(&dword_1A6185000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Client is an application extension: %{public}@ (%{public}@). Using bundle identifier \"%{public}@\" from containing application: %{public}@ (%{public}@).", buf, 0x3Eu);

      }
      v20 = v15;

      v2 = v20;
    }

    goto LABEL_19;
  }
LABEL_20:
  v21 = v2;

  return v21;
}

- (id)wd_codesigningIdentifier
{
  const __CFAllocator *v1;
  __SecTask *v2;
  __SecTask *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFErrorRef error;
  audit_token_t token;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(a1, "auditToken");
  v2 = SecTaskCreateWithAuditToken(v1, &token);
  if (v2)
  {
    v3 = v2;
    error = 0;
    SecTaskCopySigningIdentifier(v2, &error);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      WDLogForCategory(1uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(WeatherDaemon) wd_codesigningIdentifier].cold.2((uint64_t)&error, v5, v6, v7, v8, v9, v10, v11);

      CFRelease(error);
    }
    CFRelease(v3);
  }
  else
  {
    WDLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(WeatherDaemon) wd_codesigningIdentifier].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v4 = 0;
  }
  return v4;
}

- (void)wd_codesigningIdentifier
{
  OUTLINED_FUNCTION_0(&dword_1A6185000, a2, a3, "could not copy code signing identifier: %{public}@", a5, a6, a7, a8, 2u);
}

@end
