@implementation NSXPCConnection(TUCallServicesAdditions)

- (void)performBlockOnQueue:()TUCallServicesAdditions
{
  id v4;
  NSObject *v5;

  v4 = a3;
  objc_msgSend(a1, "_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (id)processName
{
  void *v1;
  __int128 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (proc_name(objc_msgSend(a1, "processIdentifier", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0),
         &v3,
         0x100u) < 1)
  {
    v1 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

- (__CFString)processBundleIdentifier
{
  __SecTask *v1;
  __SecTask *v2;
  __CFString *v3;
  audit_token_t v5[2];

  memset(&v5[1], 0, sizeof(audit_token_t));
  objc_msgSend(a1, "auditToken");
  v5[0] = v5[1];
  v1 = SecTaskCreateWithAuditToken(0, v5);
  if (!v1)
    return (__CFString *)0;
  v2 = v1;
  v3 = (__CFString *)SecTaskCopySigningIdentifier(v1, 0);
  CFRelease(v2);
  return v3;
}

+ (id)callServicesServerXPCInterface
{
  if (callServicesServerXPCInterface_onceToken != -1)
    dispatch_once(&callServicesServerXPCInterface_onceToken, &__block_literal_global_58);
  return (id)callServicesServerXPCInterface_xpcInterface;
}

+ (id)callServicesClientXPCInterface
{
  if (callServicesClientXPCInterface_onceToken != -1)
    dispatch_once(&callServicesClientXPCInterface_onceToken, &__block_literal_global_203);
  return (id)callServicesClientXPCInterface_xpcInterface;
}

@end
