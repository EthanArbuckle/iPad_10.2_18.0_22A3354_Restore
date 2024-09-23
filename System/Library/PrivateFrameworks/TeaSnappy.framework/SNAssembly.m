@implementation SNAssembly

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (SNAssembly)init
{
  SNAssembly *v2;
  SNTestAssembly *v3;
  uint64_t v4;
  NSArray *assemblies;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SNAssembly;
  v2 = -[SNAssembly init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SNTestAssembly);
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    assemblies = v2->_assemblies;
    v2->_assemblies = (NSArray *)v4;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assemblies, 0);
}

@end
