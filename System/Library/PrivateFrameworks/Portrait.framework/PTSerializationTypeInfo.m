@implementation PTSerializationTypeInfo

- (PTSerializationTypeInfo)initWithType:(unsigned int)a3 providerClass:(Class)a4
{
  PTSerializationTypeInfo *v6;
  PTSerializationTypeInfo *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTSerializationTypeInfo;
  v6 = -[PTSerializationTypeInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = a3;
    objc_storeStrong((id *)&v6->_providerClass, a4);
  }
  return v7;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (Class)providerClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setProviderClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isAtomContainerType
{
  return self->_isAtomContainerType;
}

- (void)setIsAtomContainerType:(BOOL)a3
{
  self->_isAtomContainerType = a3;
}

- (BOOL)isProviderArrayType
{
  return self->_isProviderArrayType;
}

- (void)setIsProviderArrayType:(BOOL)a3
{
  self->_isProviderArrayType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerClass, 0);
}

@end
