@implementation RBLaunchdInterface

- (id)copyJobWithPid:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE043B8], "copyJobWithPid:", *(_QWORD *)&a3);
}

- (id)jobWithPlist:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE043B8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPlist:", v4);

  return v5;
}

- (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(MEMORY[0x24BE043B8], "submitExtension:overlay:domain:error:", a3, a4, a5, a6);
}

- (id)domainForPid:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE043B0], "domainForPid:", *(_QWORD *)&a3);
}

- (id)instancePropertiesFromOverlay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("XPCService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_SandboxProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSandboxProfile:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("XPCService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EnvironmentVariables"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnvironmentVariables:", v8);

  return v4;
}

- (id)forJob:(id)a3 createInstance:(unsigned __int8)a4[16] properties:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a3, "createInstance:properties:error:", a4, a5, a6);
}

+ (id)interface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__RBLaunchdInterface_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1)
    dispatch_once(&interface_onceToken, block);
  return (id)interface_singleton;
}

void __31__RBLaunchdInterface_interface__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___RBLaunchdInterface;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)interface_singleton;
  interface_singleton = v1;

}

- (id)domainForUser:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE043B0], "domainForUser:", *(_QWORD *)&a3);
}

- (id)currentDomain
{
  return (id)objc_msgSend(MEMORY[0x24BE043B0], "currentDomain");
}

- (id)jobWithPlist:(id)a3 domain:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE043B8];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithPlist:domain:", v7, v6);

  return v8;
}

- (id)copyJobWithLabel:(id)a3 domain:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE043B8], "copyJobWithLabel:domain:", a3, a4);
}

- (id)copyJobsManagedBy:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE043B8], "copyJobsManagedBy:error:", a3, a4);
}

- (id)propertiesForPid:(int)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE043A8], "propertiesForPid:error:", *(_QWORD *)&a3, a4);
}

- (id)propertiesForJob:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE043A8], "propertiesForJob:error:", a3, a4);
}

@end
