@implementation RESortedDictionary

- (RESortedDictionary)init
{
  RESortedDictionary *v2;
  uint64_t v3;
  NSMutableArray *order;
  uint64_t v5;
  NSMutableDictionary *values;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RESortedDictionary;
  v2 = -[RESortedDictionary init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    order = v2->_order;
    v2->_order = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    values = v2->_values;
    v2->_values = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (RESortedDictionary)initWithCapacity:(unint64_t)a3
{
  RESortedDictionary *v4;
  uint64_t v5;
  NSMutableArray *order;
  uint64_t v7;
  NSMutableDictionary *values;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RESortedDictionary;
  v4 = -[RESortedDictionary init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    order = v4->_order;
    v4->_order = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    values = v4->_values;
    v4->_values = (NSMutableDictionary *)v7;

  }
  return v4;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_values, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RESortedDictionary *v4;
  RESortedDictionary *v5;
  NSMutableDictionary *values;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  int v10;
  char v11;
  NSMutableArray *order;
  NSMutableArray *v13;
  NSMutableArray *v14;
  NSMutableArray *v15;

  v4 = (RESortedDictionary *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      values = self->_values;
      v7 = v5->_values;
      if (values == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = values;
        v10 = -[NSMutableDictionary isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      order = self->_order;
      v13 = v5->_order;
      v14 = order;
      v15 = v14;
      if (v14 == v13)
        v11 = 1;
      else
        v11 = -[NSMutableArray isEqual:](v14, "isEqual:", v13);

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableArray copy](self->_order, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSMutableDictionary mutableCopy](self->_values, "mutableCopy");
  v8 = (void *)v4[1];
  v4[1] = v7;

  return v4;
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_values, "count");
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", a3);
}

- (void)removeObjectForKey:(id)a3
{
  NSMutableDictionary *values;
  id v5;
  uint64_t v6;
  id v7;

  values = self->_values;
  v5 = a3;
  -[NSMutableDictionary removeObjectForKey:](values, "removeObjectForKey:", v5);
  v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_order, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, -[NSMutableArray count](self->_order, "count"), 256, &__block_literal_global_21);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    v7 = (id)-[NSMutableArray objectAtIndex:](self->_order, "objectAtIndex:", v6);
}

uint64_t __41__RESortedDictionary_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[RESortedDictionary objectForKey:](self, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[NSMutableArray insertObject:atIndex:](self->_order, "insertObject:atIndex:", v6, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_order, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, -[NSMutableArray count](self->_order, "count"), 1280, &__block_literal_global_3_0));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v8, v6);

}

uint64_t __39__RESortedDictionary_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)removeAllObjects
{
  -[NSMutableDictionary removeAllObjects](self->_values, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_order, "removeAllObjects");
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  -[RESortedDictionary enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  NSMutableArray *order;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (v6)
  {
    order = self->_order;
    v9[1] = 3221225472;
    v9[2] = __61__RESortedDictionary_enumerateObjectsWithOptions_usingBlock___block_invoke;
    v9[3] = &unk_24CF8CAF8;
    v9[4] = self;
    v8 = v6;
    v9[0] = MEMORY[0x24BDAC760];
    v10 = v6;
    -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](order, "enumerateObjectsWithOptions:usingBlock:", a3, v9);

    v6 = v8;
  }

}

void __61__RESortedDictionary_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end
