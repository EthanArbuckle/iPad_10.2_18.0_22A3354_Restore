@implementation PVEffectRegistryEntry

- (PVEffectRegistryEntry)initWithClass:(Class)a3 andProperties:(id)a4
{
  id v7;
  PVEffectRegistryEntry *v8;
  PVEffectRegistryEntry *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PVEffectRegistryEntry;
  v8 = -[PVEffectRegistryEntry init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_effectClass = a3;
    objc_storeStrong((id *)&v8->_effectProperties, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PVEffectRegistryEntry;
  -[PVEffectRegistryEntry dealloc](&v2, sel_dealloc);
}

- (Class)effectClass
{
  return self->_effectClass;
}

- (id)effectProperties
{
  return self->_effectProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectProperties, 0);
}

@end
