@implementation PSSpecifierUpdateOperation

+ (id)insertOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithOperation:specifier:index:", 1, v6, v8);

  return v9;
}

+ (id)reloadOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithOperation:specifier:index:", 3, v6, v8);

  return v9;
}

+ (id)removeOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithOperation:specifier:index:", 4, v6, v8);

  return v9;
}

+ (id)_removeOneSpecifierOnlyOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithOperation:specifier:fromIndex:toIndex:removingGroupSpecifierRemovesEntireGroup:", 4, v6, v8, 0, 0);

  return v9;
}

+ (id)moveOperationWithSpecifier:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithOperation:specifier:fromIndex:toIndex:", 2, v8, v10, v11);

  return v12;
}

- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 index:(id)a5
{
  return -[PSSpecifierUpdateOperation initWithOperation:specifier:fromIndex:toIndex:](self, "initWithOperation:specifier:fromIndex:toIndex:", a3, a4, a5, 0);
}

- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 fromIndex:(id)a5 toIndex:(id)a6
{
  return -[PSSpecifierUpdateOperation initWithOperation:specifier:fromIndex:toIndex:removingGroupSpecifierRemovesEntireGroup:](self, "initWithOperation:specifier:fromIndex:toIndex:removingGroupSpecifierRemovesEntireGroup:", a3, a4, a5, a6, 1);
}

- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 fromIndex:(id)a5 toIndex:(id)a6 removingGroupSpecifierRemovesEntireGroup:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  PSSpecifierUpdateOperation *v16;
  PSSpecifierUpdateOperation *v17;
  objc_super v19;

  v7 = a7;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PSSpecifierUpdateOperation;
  v16 = -[PSSpecifierUpdateOperation init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_operation = a3;
    objc_storeStrong((id *)&v16->_specifier, a4);
    objc_storeStrong((id *)&v17->_index, a5);
    objc_storeStrong((id *)&v17->_toIndex, a6);
    -[PSSpecifierUpdateOperation setRemovingGroupSpecifierRemovesEntireGroup:](v17, "setRemovingGroupSpecifierRemovesEntireGroup:", v7);
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithOperation:specifier:fromIndex:toIndex:", self->_operation, self->_specifier, self->_index, self->_toIndex);
}

- (id)description
{
  unint64_t operation;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *toIndex;
  NSNumber *index;
  __CFString *v10;
  void *v11;
  objc_super v13;

  operation = self->_operation;
  if (operation > 4)
    v4 = CFSTR("***Unknown Operation***");
  else
    v4 = off_1E4A66890[operation];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)PSSpecifierUpdateOperation;
  -[PSSpecifierUpdateOperation description](&v13, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier identifier](self->_specifier, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  index = self->_index;
  toIndex = self->_toIndex;
  if (toIndex)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" -> %@"), self->_toIndex);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E4A69238;
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: %@ ID: %@, index: %@%@, specifier: %@"), v6, v4, v7, index, v10, self->_specifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (toIndex)

  return v11;
}

- (BOOL)applyToArray:(id)a3
{
  id v4;
  int64_t operation;
  PSSpecifier *specifier;
  NSNumber *v7;
  _BOOL4 v8;
  NSNumber *index;
  unint64_t v10;
  PSSpecifier *v11;
  PSSpecifier *v12;
  PSSpecifier *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;

  v4 = a3;
  operation = self->_operation;
  switch(operation)
  {
    case 4:
      v8 = -[PSSpecifierUpdateOperation removingGroupSpecifierRemovesEntireGroup](self, "removingGroupSpecifierRemovesEntireGroup");
      index = self->_index;
      if (v8)
      {
        if (index)
        {
          v10 = -[NSNumber unsignedIntegerValue](index, "unsignedIntegerValue");
          objc_msgSend(v4, "objectAtIndex:", v10);
          v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!self->_specifier)
            goto LABEL_28;
          v10 = objc_msgSend(v4, "indexOfObject:");
          v11 = self->_specifier;
        }
        v13 = v11;
        objc_msgSend(v4, "removeObjectAtIndex:", v10);
        if (!-[PSSpecifier cellType](v13, "cellType"))
        {
          while (objc_msgSend(v4, "count") > v10)
          {
            objc_msgSend(v4, "objectAtIndex:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "cellType");

            if (!v15)
              break;
            objc_msgSend(v4, "removeObjectAtIndex:", v10);
          }
        }

        break;
      }
      if (index)
      {
        objc_msgSend(v4, "removeObjectAtIndex:", -[NSNumber unsignedIntegerValue](index, "unsignedIntegerValue"));
        break;
      }
      if (self->_specifier)
      {
        objc_msgSend(v4, "removeObject:");
        break;
      }
LABEL_28:
      v16 = 0;
      goto LABEL_29;
    case 2:
      if (self->_index && self->_toIndex)
      {
        v12 = self->_specifier;
        if (!v12)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", -[NSNumber unsignedIntegerValue](self->_index, "unsignedIntegerValue"));
          v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "removeObjectAtIndex:", -[NSNumber unsignedIntegerValue](self->_index, "unsignedIntegerValue"));
        objc_msgSend(v4, "insertObject:atIndex:", v12, -[NSNumber unsignedIntegerValue](self->_toIndex, "unsignedIntegerValue"));

        break;
      }
      goto LABEL_28;
    case 1:
      specifier = self->_specifier;
      if (specifier)
      {
        v7 = self->_index;
        if (v7)
        {
          objc_msgSend(v4, "insertObject:atIndex:", specifier, -[NSNumber unsignedIntegerValue](v7, "unsignedIntegerValue"));
          break;
        }
      }
      goto LABEL_28;
  }
  v16 = 1;
LABEL_29:

  return v16;
}

- (int64_t)operation
{
  return self->_operation;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (NSNumber)toIndex
{
  return self->_toIndex;
}

- (void)setToIndex:(id)a3
{
  objc_storeStrong((id *)&self->_toIndex, a3);
}

- (BOOL)removingGroupSpecifierRemovesEntireGroup
{
  return self->_removingGroupSpecifierRemovesEntireGroup;
}

- (void)setRemovingGroupSpecifierRemovesEntireGroup:(BOOL)a3
{
  self->_removingGroupSpecifierRemovesEntireGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIndex, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
