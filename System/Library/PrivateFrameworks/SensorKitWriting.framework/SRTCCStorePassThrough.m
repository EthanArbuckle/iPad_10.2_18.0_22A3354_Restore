@implementation SRTCCStorePassThrough

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    SRLogTCCStore = (uint64_t)os_log_create("com.apple.SensorKit", "TCCStore");
}

- (id)bundleIdentifiersForService:(id)a3
{
  return (id)TCCAccessCopyBundleIdentifiersForService();
}

- (id)bundleIdentifiersDisabledForService:(id)a3
{
  return (id)TCCAccessCopyBundleIdentifiersDisabledForService();
}

- (BOOL)isOverriddenForService:(id)a3
{
  NSObject *v4;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!TCCAccessGetOverride())
  {
    v4 = SRLogTCCStore;
    if (os_log_type_enabled((os_log_t)SRLogTCCStore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v7 = a3;
      _os_log_error_impl(&dword_245CD7000, v4, OS_LOG_TYPE_ERROR, "Could not retrieve authorization override information for TCC service %{public}@", buf, 0xCu);
    }
  }
  return 0;
}

- (id)informationForBundleId:(id)a3
{
  return (id)TCCAccessCopyInformationForBundleId();
}

- (BOOL)setOverride:(BOOL)a3 forService:(id)a4
{
  return TCCAccessSetOverride() != 0;
}

- (BOOL)resetService:(id)a3 forBundleId:(id)a4
{
  return TCCAccessResetForBundleId() != 0;
}

- (BOOL)resetService:(id)a3
{
  return TCCAccessReset() != 0;
}

- (BOOL)setValue:(BOOL)a3 forService:(id)a4 bundleId:(id)a5
{
  return TCCAccessSetForBundleId() != 0;
}

- (int64_t)preflightAuthorizationStatusForService:(id)a3
{
  int v3;

  v3 = TCCAccessPreflight();
  if (v3 == 1)
    return 2;
  else
    return v3 == 0;
}

- (void)requestAccessForService:(id)a3 completion:(id)a4
{
  TCCAccessRequest();
}

- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4
{
  return TCCAccessCheckAuditToken() != 0;
}

@end
