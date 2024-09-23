@implementation VIEntitlementManager

+ (id)valueForEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  void *v6;
  NSObject *v7;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v11;
  __int16 v12;
  CFErrorRef v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length") && (v4 = SecTaskCreateFromSelf(0)) != 0)
  {
    v5 = v4;
    error = 0;
    v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      if (+[VILogger shouldLogMessage](_TtC18VisualIntelligence8VILogger, "shouldLogMessage"))
      {
        +[VILogger log](_TtC18VisualIntelligence8VILogger, "log");
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v11 = v3;
          v12 = 2114;
          v13 = error;
          _os_log_impl(&dword_1D467C000, v7, OS_LOG_TYPE_ERROR, "Error reading entitlement %{public}@: %{public}@", buf, 0x16u);
        }

      }
      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)BOOLForEntitlement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[VIEntitlementManager valueForEntitlement:](VIEntitlementManager, "valueForEntitlement:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[VIEntitlementManager valueForEntitlement:](VIEntitlementManager, "valueForEntitlement:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

@end
