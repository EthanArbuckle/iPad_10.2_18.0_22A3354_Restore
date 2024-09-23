@implementation PLSandboxHelper

+ (BOOL)processCanWriteSandboxForPath:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(a1) = objc_msgSend(a1, "processWithID:canWriteSandboxForPath:", getpid(), v4);

  return (char)a1;
}

+ (BOOL)processWithID:(int)a3 canWriteSandboxForPath:(id)a4
{
  objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  return sandbox_check() == 0;
}

+ (BOOL)processCanReadSandboxForPath:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(a1) = objc_msgSend(a1, "processWithID:canReadSandboxForPath:", getpid(), v4);

  return (char)a1;
}

+ (BOOL)processWithID:(int)a3 canReadSandboxForPath:(id)a4
{
  objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  return sandbox_check() == 0;
}

+ (BOOL)fileURLHasSecurityScope:(id)a3
{
  const void *v3;
  const void *v4;

  v3 = (const void *)MEMORY[0x19AEC2960](a3, a2);
  v4 = v3;
  if (v3)
    CFRelease(v3);
  return v4 != 0;
}

@end
