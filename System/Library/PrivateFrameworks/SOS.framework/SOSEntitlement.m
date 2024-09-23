@implementation SOSEntitlement

+ (BOOL)currentProcessHasEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  CFErrorRef error;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  CFErrorRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      sos_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v13 = v6;
        v14 = 2112;
        v15 = v3;
        v16 = 2112;
        v17 = error;
        _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected value %@ for %@ entitlement: %@", buf, 0x20u);
      }

      v7 = 0;
    }
    else
    {
      v7 = objc_msgSend(v6, "BOOLValue");
    }
    CFRelease(v5);

  }
  else
  {
    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Unexpected NULL value returned from SecTaskCreateFromSelf()", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

@end
