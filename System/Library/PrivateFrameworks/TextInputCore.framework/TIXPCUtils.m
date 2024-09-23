@implementation TIXPCUtils

+ (id)obtainApplicationIdentifierFromConnection:(id)a3
{
  __SecTask *v3;
  __SecTask *v4;
  void *v5;
  NSObject *v6;
  void *v8;
  CFErrorRef error;
  audit_token_t token;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 && (objc_msgSend(a3, "auditToken"), (v3 = SecTaskCreateWithAuditToken(0, &token)) != 0))
  {
    v4 = v3;
    error = 0;
    v5 = (void *)SecTaskCopyValueForEntitlement(v3, CFSTR("application-identifier"), &error);
    if (error)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Cannot obtain application identifier: %@"), "+[TIXPCUtils obtainApplicationIdentifierFromConnection:]", error);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      CFRelease(error);
    }
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)obtainBundleIdentifierFromConnection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3
    && (objc_msgSend(a3, "_xpcConnection"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = (void *)xpc_connection_copy_bundle_id(),
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    free(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
