@implementation PUTilingDataSource

- (PUTilingDataSource)init
{
  PUTilingDataSource *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSHashTable *changeObservers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUTilingDataSource;
  v2 = -[PUTilingDataSource init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    changeObservers = v2->__changeObservers;
    v2->__changeObservers = (NSHashTable *)v9;

  }
  return v2;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingDataSource.m"), 28, CFSTR("concrete subclass must implement"));

  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUTilingDataSource identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingDataSource identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUTilingDataSource;
  -[PUTilingDataSource description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingDataSource identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" identifier=%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateIndexPathsStartingAtIndexPath:(id)a3 reverseDirection:(BOOL)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, _BYTE *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  char v30;

  v28 = a4;
  v7 = a3;
  v8 = (void (**)(id, void *, _BYTE *))a5;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingDataSource.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingDataSource.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startIndexPath != nil"));

LABEL_3:
  if ((unint64_t)objc_msgSend(v7, "length") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTilingDataSource.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[startIndexPath length] >= 2"));

  }
  if (v28)
    v9 = -1;
  else
    v9 = 1;
  v10 = objc_msgSend(v7, "length");
  v11 = v10 - 1;
  v12 = objc_msgSend(v7, "indexAtPosition:", v10 - 2);
  objc_msgSend(v7, "indexPathByRemovingLastIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathByRemovingLastIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[PUTilingDataSource numberOfSubItemsAtIndexPath:](self, "numberOfSubItemsAtIndexPath:", v14);
  v27 = v7;
  v16 = objc_msgSend(v7, "indexAtPosition:", v11);
  v30 = 0;
  if ((v12 & 0x8000000000000000) == 0)
  {
    v17 = v16;
    v18 = v12;
    do
    {
      if (v18 >= v15 || v30)
        break;
      objc_msgSend(v14, "indexPathByAddingIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[PUTilingDataSource numberOfSubItemsAtIndexPath:](self, "numberOfSubItemsAtIndexPath:", v19);
      v21 = v20 - 1;
      if (!v28)
        v21 = 0;
      if (v18 != v12)
        v17 = v21;
      if ((v17 & 0x8000000000000000) == 0)
      {
        v22 = v20;
        do
        {
          if (v17 >= v22)
            break;
          if (v30)
            break;
          objc_msgSend(v19, "indexPathByAddingIndex:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v8[2](v8, v23, &v30);

          v17 += v9;
        }
        while (v17 >= 0);
      }

      v18 += v9;
    }
    while (v18 >= 0);
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSHashTable)_changeObservers
{
  return self->__changeObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__changeObservers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
