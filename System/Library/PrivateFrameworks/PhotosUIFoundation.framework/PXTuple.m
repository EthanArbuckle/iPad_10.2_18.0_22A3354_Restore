@implementation PXTuple

- (unint64_t)hash
{
  return self->_hash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXTuple objects](self, "objects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)objects
{
  return self->_objects;
}

- (PXTuple)initWithObjects:(id)a3
{
  id v5;
  PXTuple *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSArray *objects;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTuple.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[objects count] > 0"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PXTuple;
  v6 = -[PXTuple init](&v22, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      v12 = 1;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copy");
          -[NSArray addObject:](v7, "addObject:", v14);
          v12 = objc_msgSend(v14, "hash") - v12 + 32 * v12;

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 1;
    }

    objects = v6->_objects;
    v6->_hash = v12;
    v6->_objects = v7;

  }
  return v6;
}

- (PXTuple)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTuple.m"), 18, CFSTR("%s is not available as initializer"), "-[PXTuple init]");

  abort();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXTuple;
  -[PXTuple description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTuple objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
