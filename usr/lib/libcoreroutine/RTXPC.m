@implementation RTXPC

+ (id)signingIdentifierOfConnection:(id)a3
{
  id v3;
  void *v4;
  __SecTask *v5;
  __SecTask *v6;
  __CFString *v7;
  audit_token_t v9;

  v3 = a3;
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(&v9, 0, sizeof(v9));
  v5 = SecTaskCreateWithAuditToken(0, &v9);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, 0);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)executablePathOfConnection:(id)a3
{
  void *v4;
  _BYTE buffer[4096];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(objc_msgSend(a3, "processIdentifier"), buffer, 0x1000u) < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)clientCodeSignatureIsValid:(id)a3 error:(id *)a4
{
  return 1;
}

@end
