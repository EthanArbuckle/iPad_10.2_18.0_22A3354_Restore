@implementation _UIViewServiceDeputyXPCInterfaceInvocationFactory

+ (id)invocationForConnectionSelector:(id)a3
{
  id v3;
  Protocol *v4;
  const char *v5;
  char *types;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "connectionProtocol");
  v4 = (Protocol *)objc_claimAutoreleasedReturnValue();
  v5 = (const char *)objc_msgSend(v3, "connectionSelector");
  types = protocol_getMethodDescription(v4, v5, 1, 1).types;
  if (!types)
    types = protocol_getMethodDescription(v4, v5, 0, 1).types;
  v7 = (void *)MEMORY[0x1E0C99DB8];
  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invocationWithMethodSignature:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
