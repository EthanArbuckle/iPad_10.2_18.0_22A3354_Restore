@implementation REObjectClassLoader

- (void)enumerateObjectsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    -[REClassLoader configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredClassForLoader");

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_objects;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v4[2](v4, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

uint64_t __50__REObjectClassLoader__enumerateClassesWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = objc_opt_class();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

- (void)_enumerateClassesWithBlock:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__REObjectClassLoader__enumerateClassesWithBlock___block_invoke;
    v6[3] = &unk_24CF8BCA0;
    v7 = v4;
    -[REObjectClassLoader enumerateObjectsWithBlock:](self, "enumerateObjectsWithBlock:", v6);

  }
}

- (REObjectClassLoader)initWithObjects:(id)a3 configuration:(id)a4
{
  id v7;
  REObjectClassLoader *v8;
  REObjectClassLoader *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REObjectClassLoader;
  v8 = -[REClassLoader initWithConfiguration:](&v11, sel_initWithConfiguration_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_objects, a3);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  REObjectClassLoader *v4;
  NSArray *objects;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;

  v4 = (REObjectClassLoader *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objects = self->_objects;
      v6 = v4->_objects;
      v7 = objects;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSArray isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSArray *objects;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objects = self->_objects;
  -[REClassLoader configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithObjects:configuration:", objects, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
