@implementation NSXPCConnection(PGAdditions)

- (uint64_t)PG_remoteObjectProxyWithDebugMethodAndPointerProem:()PGAdditions
{
  return objc_msgSend(a1, "PG_remoteObjectProxyWithDebugMethodAndPointerProem:errorHandler:", a3, 0);
}

- (id)PG_remoteObjectProxyWithDebugMethodAndPointerProem:()PGAdditions errorHandler:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__NSXPCConnection_PGAdditions__PG_remoteObjectProxyWithDebugMethodAndPointerProem_errorHandler___block_invoke;
  v12[3] = &unk_1E6231298;
  v13 = v6;
  v14 = a1;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)PG_hasScreenSharingEntitlement
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.pegasus.canShowScreenSharing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);

  return v2;
}

@end
