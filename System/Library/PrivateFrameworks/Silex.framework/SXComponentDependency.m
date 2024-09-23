@implementation SXComponentDependency

+ (id)componentDependencyFromComponentIdentifier:(void *)a3 toComponentIdentifier:(void *)a4 fromLayoutAttribute:(void *)a5 toAttribute:(void *)a6 withDescriptor:
{
  id v10;
  id v11;
  id v12;
  id *v13;

  v10 = a6;
  v11 = a3;
  v12 = a2;
  objc_opt_self();
  v13 = -[SXComponentDependency initWithComponentDependencyFromComponentIdentifier:toComponentIdentifier:fromLayoutAttribute:toAttribute:withDescriptor:]((id *)[SXComponentDependency alloc], v12, v11, a4, a5, v10);

  return v13;
}

- (id)initWithComponentDependencyFromComponentIdentifier:(void *)a3 toComponentIdentifier:(void *)a4 fromLayoutAttribute:(void *)a5 toAttribute:(void *)a6 withDescriptor:
{
  id v12;
  id v13;
  id v14;
  id *v15;
  objc_super v17;

  v12 = a2;
  v13 = a3;
  v14 = a6;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)SXComponentDependency;
    v15 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v15;
    if (v15)
    {
      objc_storeStrong(v15 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
      a1[4] = a5;
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  SXComponentDependency *v4;
  BOOL v5;

  v4 = (SXComponentDependency *)a3;
  v5 = v4 == self
    || -[NSString isEqualToString:](self->_fromComponentIdentifier, "isEqualToString:", v4->_fromComponentIdentifier)
    && -[NSString isEqualToString:](self->_toComponentIdentifier, "isEqualToString:", v4->_toComponentIdentifier)
    && self->_fromDependencyAttribute == v4->_fromDependencyAttribute
    && self->_toDependencyAttribute == v4->_toDependencyAttribute;

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_fromComponentIdentifier, "hash");
  return -[NSString hash](self->_toComponentIdentifier, "hash") ^ v3 ^ self->_fromDependencyAttribute ^ self->_toDependencyAttribute;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  int64_t toDependencyAttribute;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_fromComponentIdentifier;
    v7 = self->_toComponentIdentifier;
    NSStringFromDependencyAttribute(self->_fromDependencyAttribute);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    toDependencyAttribute = self->_toDependencyAttribute;
  }
  else
  {
    NSStringFromDependencyAttribute(0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = 0;
    toDependencyAttribute = 0;
  }
  NSStringFromDependencyAttribute(toDependencyAttribute);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; from component: %@; to component: %@; dependencyAttribute: %@; toDependencyAttribute: %@>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_toComponentIdentifier, 0);
  objc_storeStrong((id *)&self->_fromComponentIdentifier, 0);
}

@end
