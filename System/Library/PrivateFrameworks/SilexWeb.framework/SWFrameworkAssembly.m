@implementation SWFrameworkAssembly

- (SWFrameworkAssembly)init
{
  SWFrameworkAssembly *v2;
  SWCoreAssembly *v3;
  SWFactoryAssembly *v4;
  SWManagerAssembly *v5;
  SWProviderAssembly *v6;
  SWSetupAssembly *v7;
  SWViewControllerAssembly *v8;
  uint64_t v9;
  NSArray *assemblies;
  objc_super v12;
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)SWFrameworkAssembly;
  v2 = -[SWFrameworkAssembly init](&v12, sel_init);
  if (v2)
  {
    SWSetupLogging();
    v3 = objc_alloc_init(SWCoreAssembly);
    v13[0] = v3;
    v4 = objc_alloc_init(SWFactoryAssembly);
    v13[1] = v4;
    v5 = objc_alloc_init(SWManagerAssembly);
    v13[2] = v5;
    v6 = objc_alloc_init(SWProviderAssembly);
    v13[3] = v6;
    v7 = objc_alloc_init(SWSetupAssembly);
    v13[4] = v7;
    v8 = objc_alloc_init(SWViewControllerAssembly);
    v13[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 6);
    v9 = objc_claimAutoreleasedReturnValue();
    assemblies = v2->_assemblies;
    v2->_assemblies = (NSArray *)v9;

  }
  return v2;
}

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assemblies, 0);
}

@end
