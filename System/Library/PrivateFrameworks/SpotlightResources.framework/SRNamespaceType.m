@implementation SRNamespaceType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_parameterNames, 0);
}

- (NSSet)parameterNames
{
  return (NSSet *)self->_parameterNames;
}

- (NSString)namespaceId
{
  return self->_namespaceId;
}

- (void)addParameterName:(id)a3
{
  -[NSMutableSet addObject:](self->_parameterNames, "addObject:", a3);
}

- (void)setNamespaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setNamespaceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SRNamespaceType)init
{
  SRNamespaceType *v2;
  NSMutableSet *v3;
  NSMutableSet *parameterNames;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRNamespaceType;
  v2 = -[SRNamespaceType init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    parameterNames = v2->_parameterNames;
    v2->_parameterNames = v3;

  }
  return v2;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setParameterNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

@end
