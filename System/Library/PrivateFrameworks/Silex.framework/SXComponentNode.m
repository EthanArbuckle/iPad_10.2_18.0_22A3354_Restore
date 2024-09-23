@implementation SXComponentNode

- (_QWORD)initWithComponentIdentifier:(uint64_t)a3 andAttribute:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v6 = a2;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)SXComponentNode;
    v7 = objc_msgSendSuper2(&v15, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[2] = a3;
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[3];
      a1[3] = v8;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)a1[4];
      a1[4] = v10;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)a1[5];
      a1[5] = v12;

    }
  }

  return a1;
}

- (void)addComponentDependency:(uint64_t)a1
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  if (a1)
  {
    v3 = *(void **)(a1 + 24);
    v4 = a2;
    objc_msgSend(v3, "addObject:", v4);
    v5 = v4[4];
    v6 = (void *)v4[2];

    v7 = v6;
    if (v5 == 1)
    {
      v8 = 32;
    }
    else
    {
      if (v5 != 2)
      {
LABEL_7:

        return;
      }
      v8 = 40;
    }
    v9 = v7;
    objc_msgSend(*(id *)(a1 + v8), "addObject:", v7);
    v7 = v9;
    goto LABEL_7;
  }
}

- (id)dependencies
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (uint64_t)hasDependencyToComponentIdentifier:(uint64_t)a3 attribute:
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (a1)
  {
    v6 = 40;
    if (a3 == 1)
      v6 = 32;
    a1 = objc_msgSend(*(id *)(a1 + v6), "containsObject:", v5);
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  SXComponentNode *v4;
  SXComponentNode *v5;
  char v6;

  v4 = (SXComponentNode *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4->_attribute == self->_attribute)
  {
    v6 = -[NSString isEqualToString:](v4->_componentIdentifier, "isEqualToString:", self->_componentIdentifier);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_attribute ^ -[NSString hash](self->_componentIdentifier, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *v5;
  int64_t attribute;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self)
  {
    v5 = self->_componentIdentifier;
    attribute = self->_attribute;
  }
  else
  {
    v5 = 0;
    attribute = 0;
  }
  NSStringFromDependencyAttribute(attribute);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; componentIdentifier: %@>; attribute: %@>"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSizeDependencies, 0);
  objc_storeStrong((id *)&self->_toPositionDependencies, 0);
  objc_storeStrong((id *)&self->_mutableDependencies, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
