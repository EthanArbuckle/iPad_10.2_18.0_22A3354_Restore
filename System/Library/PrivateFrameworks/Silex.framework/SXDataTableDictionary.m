@implementation SXDataTableDictionary

+ (SXDataTableDictionary)dataTableDictionaryWithRows:(unint64_t)a3 andColumns:(unint64_t)a4
{
  return (SXDataTableDictionary *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRows:andColumns:", a3, a4);
}

- (SXDataTableDictionary)initWithRows:(unint64_t)a3 andColumns:(unint64_t)a4
{
  SXDataTableDictionary *v6;
  SXDataTableDictionary *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *storage;
  uint64_t v11;
  NSMutableIndexSet *indexes;
  objc_super v14;

  if (a3 == -1 || a4 == -1)
  {

    return 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SXDataTableDictionary;
    v6 = -[SXDataTableDictionary init](&v14, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_numberOfRows = a3;
      v6->_numberOfColumns = a4;
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDataTableDictionary arrayWithObject:forCount:](v7, "arrayWithObject:forCount:", v8, a4 * a3);
      v9 = objc_claimAutoreleasedReturnValue();
      storage = v7->_storage;
      v7->_storage = (NSMutableArray *)v9;

      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v11 = objc_claimAutoreleasedReturnValue();
      indexes = v7->_indexes;
      v7->_indexes = (NSMutableIndexSet *)v11;

    }
  }
  return v7;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathOfObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v4 = a3;
  -[SXDataTableDictionary storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -1;
    v8 = -1;
  }
  else
  {
    v7 = -[SXDataTableDictionary indexPathForIndex:](self, "indexPathForIndex:", v6);
  }
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)objectForIndexPath:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = -[SXDataTableDictionary indexForIndexPath:](self, "indexForIndexPath:", a3.var0, a3.var1);
  if (v4 == -1)
  {
    v7 = 0;
  }
  else
  {
    v5 = v4;
    -[SXDataTableDictionary storage](self, "storage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
    v9 = 0;
  else
    v9 = v7;
  v10 = v9;

  return v10;
}

- (void)setObject:(id)a3 forIndexPath:(id)a4
{
  unint64_t var1;
  unint64_t var0;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  v7 = -[SXDataTableDictionary indexForIndexPath:](self, "indexForIndexPath:", var0, var1);
  if (v7 != -1)
  {
    v8 = v7;
    if (v11)
    {
      -[SXDataTableDictionary indexes](self, "indexes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addIndex:", v8);

      -[SXDataTableDictionary storage](self, "storage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v8, v11);

    }
    else
    {
      -[SXDataTableDictionary removeObjectForIndexPath:](self, "removeObjectForIndexPath:", var0, var1);
    }
  }

}

- (void)removeObjectForIndexPath:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = -[SXDataTableDictionary indexForIndexPath:](self, "indexForIndexPath:", a3.var0, a3.var1);
  if (v4 != -1)
  {
    v5 = v4;
    -[SXDataTableDictionary indexes](self, "indexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeIndex:", v5);

    -[SXDataTableDictionary storage](self, "storage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v5, v7);

  }
}

- (void)removeAllObjects
{
  void *v3;
  _QWORD v4[5];

  -[SXDataTableDictionary indexes](self, "indexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SXDataTableDictionary_removeAllObjects__block_invoke;
  v4[3] = &unk_24D68B550;
  v4[4] = self;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v4);

}

uint64_t __41__SXDataTableDictionary_removeAllObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "indexPathForIndex:", a2);
  return objc_msgSend(v2, "removeObjectForIndexPath:", v3, v4);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t *v13;
  unint64_t v14;
  _QWORD v16[10];
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = a3->var3;
  -[SXDataTableDictionary indexes](self, "indexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (var0 < v11)
  {
    a3->var1 = a4;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    -[SXDataTableDictionary indexes](self, "indexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __67__SXDataTableDictionary_countByEnumeratingWithState_objects_count___block_invoke;
    v16[3] = &unk_24D68B578;
    v16[6] = &v18;
    v16[7] = var0;
    v16[8] = a5;
    v16[9] = a4;
    v16[4] = self;
    v16[5] = v17;
    objc_msgSend(v12, "enumerateIndexesUsingBlock:", v16);

    _Block_object_dispose(v17, 8);
  }
  v13 = v19;
  a3->var0 = v19[3] + var0;
  v14 = v13[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

_QWORD *__67__SXDataTableDictionary_countByEnumeratingWithState_objects_count___block_invoke(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(result[5] + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >= result[7])
  {
    v4 = result;
    if (*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) < result[8])
    {
      v5 = (void *)result[4];
      v6 = objc_msgSend(v5, "indexPathForIndex:", a2);
      result = (id)objc_msgSend(v5, "objectForIndexPath:", v6, v7);
      *(_QWORD *)(v4[9] + 8 * (*(_QWORD *)(*(_QWORD *)(v4[6] + 8) + 24))++) = result;
      v2 = *(_QWORD *)(v4[5] + 8);
      v3 = *(_QWORD *)(v2 + 24);
    }
  }
  *(_QWORD *)(v2 + 24) = v3 + 1;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathForIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v5 = -[SXDataTableDictionary numberOfColumns](self, "numberOfColumns");
  v6 = a3 / v5 * v5;
  v7 = a3 % v5;
  v8 = v6 / -[SXDataTableDictionary numberOfColumns](self, "numberOfColumns");
  v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (unint64_t)indexForIndexPath:(id)a3
{
  unint64_t var1;
  unint64_t var0;

  var1 = a3.var1;
  var0 = a3.var0;
  if (a3.var0 >= -[SXDataTableDictionary numberOfRows](self, "numberOfRows")
    || var1 >= -[SXDataTableDictionary numberOfColumns](self, "numberOfColumns"))
  {
    return -1;
  }
  else
  {
    return var1 + -[SXDataTableDictionary numberOfColumns](self, "numberOfColumns") * var0;
  }
}

- (id)arrayWithObject:(id)a3 forCount:(unint64_t)a4
{
  id v5;
  void *i;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; --a4)
    objc_msgSend(i, "addObject:", v5);

  return i;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("{\n"));
  if (-[SXDataTableDictionary numberOfRows](self, "numberOfRows"))
  {
    v4 = 0;
    do
    {
      if (-[SXDataTableDictionary numberOfColumns](self, "numberOfColumns"))
      {
        v5 = 0;
        do
        {
          -[SXDataTableDictionary objectForIndexPath:](self, "objectForIndexPath:", v4, v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{row: %lu, column: %lu}"), v4, v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "description");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("\t%@ = %@ \n"), v7, v8);

          ++v5;
        }
        while (v5 < -[SXDataTableDictionary numberOfColumns](self, "numberOfColumns"));
      }
      ++v4;
    }
    while (v4 < -[SXDataTableDictionary numberOfRows](self, "numberOfRows"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (NSMutableIndexSet)indexes
{
  return self->_indexes;
}

- (void)setIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_indexes, a3);
}

- (NSMutableArray)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
}

@end
