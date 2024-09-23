@implementation REBlockClassLoader

- (void)_enumerateClassesWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, void *);
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (self->_block)
  {
    -[REClassLoader configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "desiredClassForLoader");

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    (*((void (**)(void))self->_block + 2))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "isSubclassOfClass:", v6))
            v4[2](v4, v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __49__REBlockClassLoader__enumerateClassesWithBlock___block_invoke;
    v13[3] = &unk_24CF8BC28;
    v13[4] = self;
    v15 = v6;
    v14 = v4;
    -[REBlockClassLoader _enumerateBundleConfigurations:](self, "_enumerateBundleConfigurations:", v13);

  }
}

- (void)_enumerateBundleConfigurations:(id)a3
{
  void (**v4)(id, void *);
  void (**block)(id);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  block = (void (**)(id))self->_block;
  if (block)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    block[2](block);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "isSubclassOfClass:", objc_opt_class()))
          {
            v11 = (void *)objc_opt_new();
            v4[2](v4, v11);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

void __49__REBlockClassLoader__enumerateClassesWithBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "desiredClassFromBundle:forKey:", v4, 0);

  if (v6)
  {
    if (objc_msgSend(v6, "isSubclassOfClass:", a1[6]))
      (*(void (**)(void))(a1[5] + 16))();
  }
}

- (REBlockClassLoader)initWithBlock:(id)a3 configuration:(id)a4
{
  id v6;
  REBlockClassLoader *v7;
  uint64_t v8;
  id block;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REBlockClassLoader;
  v7 = -[REClassLoader initWithConfiguration:](&v11, sel_initWithConfiguration_, a4);
  if (v7)
  {
    v8 = MEMORY[0x2199B2434](v6);
    block = v7->_block;
    v7->_block = (id)v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id block;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  block = self->_block;
  -[REClassLoader configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithBlock:configuration:", block, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  REBlockClassLoader *v4;
  REBlockClassLoader *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (REBlockClassLoader *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x2199B2434](self->_block);
      v7 = (void *)MEMORY[0x2199B2434](v5->_block);
      if (v6 == v7)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
