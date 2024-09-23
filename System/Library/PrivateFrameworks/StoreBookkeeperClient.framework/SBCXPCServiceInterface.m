@implementation SBCXPCServiceInterface

+ (id)newListener
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v2);

  return v3;
}

+ (id)serviceName
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBCXPCService.m"), 123, CFSTR("Subclass %@ must implement +%@"), v6, v7);

  return 0;
}

+ (id)serviceInterface
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBCXPCService.m"), 129, CFSTR("Subclass %@ must implement +%@"), v6, v7);

  return 0;
}

+ (id)serviceClientInterface
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBCXPCService.m"), 135, CFSTR("Subclass %@ must implement +%@"), v6, v7);

  return 0;
}

- (id)newServiceConnection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v2, 0);
  objc_msgSend((id)objc_opt_class(), "serviceInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend((id)objc_opt_class(), "serviceClientInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);

  return v3;
}

@end
