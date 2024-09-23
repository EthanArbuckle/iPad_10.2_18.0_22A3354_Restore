@implementation PXFilterGroup

- (PXFilterGroup)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFilterGroup.m"), 22, CFSTR("%s is not available as initializer"), "-[PXFilterGroup init]");

  abort();
}

- (PXFilterGroup)initWithName:(id)a3 filterIdentifiers:(id)a4
{
  id v7;
  id v8;
  PXFilterGroup *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSArray *filterIdentifiers;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFilterGroup.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filterIdentifiers"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PXFilterGroup;
  v9 = -[PXFilterGroup init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    filterIdentifiers = v9->_filterIdentifiers;
    v9->_filterIdentifiers = (NSArray *)v12;

  }
  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXFilterGroup filterIdentifiers](self, "filterIdentifiers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v6 ^= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hash");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[PXFilterGroup name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  return v10 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  PXFilterGroup *v5;
  PXFilterGroup *v6;
  PXFilterGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v5 = (PXFilterGroup *)a3;
  v6 = v5;
  if (v5)
  {
    if (self == v5)
    {
      v14 = 1;
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[PXFilterGroup name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[PXFilterGroup name](v7, "name");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
          goto LABEL_8;
      }
      -[PXFilterGroup name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFilterGroup name](v7, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (v8)
      {

        if (v11)
        {
LABEL_8:
          -[PXFilterGroup filterIdentifiers](self, "filterIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXFilterGroup filterIdentifiers](v7, "filterIdentifiers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

LABEL_13:
          goto LABEL_14;
        }
      }
      else
      {

        if ((v11 & 1) != 0)
          goto LABEL_8;
      }
      v14 = 0;
      goto LABEL_13;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)filterIdentifiers
{
  return self->_filterIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)groupWithName:(id)a3 filterIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:filterIdentifiers:", v7, v6);

  return v8;
}

@end
