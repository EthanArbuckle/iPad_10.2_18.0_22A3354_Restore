@implementation SUItemValidator

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemValidator;
  -[SUItemValidator dealloc](&v3, sel_dealloc);
}

- (void)addCollectionValidationTests:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_collectionTests)
    self->_collectionTests = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_collectionTests, "containsObject:", v9) & 1) == 0)
        {
          v10 = (void *)objc_msgSend(v9, "copy");
          -[NSMutableArray addObject:](self->_collectionTests, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (void)addItemValidationTests:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_itemTests)
    self->_itemTests = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_itemTests, "containsObject:", v9) & 1) == 0)
        {
          v10 = (void *)objc_msgSend(v9, "copy");
          -[NSMutableArray addObject:](self->_itemTests, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (void)removeValidationTest:(id)a3
{
  -[NSMutableArray removeObject:](self->_collectionTests, "removeObject:");
  -[NSMutableArray removeObject:](self->_itemTests, "removeObject:", a3);
}

- (BOOL)validateItems:(id)a3 error:(id *)a4
{
  return -[SUItemValidator validateItems:offers:error:](self, "validateItems:offers:error:", a3, 0, a4);
}

- (BOOL)validateItems:(id)a3 offers:(id)a4 error:(id *)a5
{
  NSMutableArray *collectionTests;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id *v26;
  NSMutableArray *obj;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  collectionTests = self->_collectionTests;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](collectionTests, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v12)
        objc_enumerationMutation(collectionTests);
      v14 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v13), "validateItems:offers:error:", a3, a4, &v38);
      if (!v14)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](collectionTests, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->_itemTests;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (!v28)
    {
      LOBYTE(v14) = 1;
      if (a5)
        goto LABEL_26;
      return v14;
    }
    v29 = *(_QWORD *)v31;
    v26 = a5;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
        v17 = objc_msgSend(a3, "count");
        v18 = objc_msgSend(a4, "count");
        if (v17 >= 1)
        {
          v19 = v18;
          v20 = 0;
          while (1)
          {
            v21 = objc_msgSend(a3, "objectAtIndex:", v20);
            v22 = v20 >= v19 ? 0 : objc_msgSend(a4, "objectAtIndex:", v20);
            v23 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v21);
            if ((objc_msgSend(v16, "validateItems:offers:error:", v23, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v22, 0), &v38) & 1) == 0)break;
            if (v17 == ++v20)
              goto LABEL_21;
          }
          LOBYTE(v14) = 0;
          a5 = v26;
          goto LABEL_25;
        }
LABEL_21:
        ++v15;
      }
      while (v15 != v28);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      LOBYTE(v14) = 1;
      a5 = v26;
      v28 = v24;
      if (v24)
        continue;
      break;
    }
  }
LABEL_25:
  if (a5)
LABEL_26:
    *a5 = v38;
  return v14;
}

- (NSArray)validationTests
{
  NSArray *v3;
  NSArray *v4;

  v3 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = v3;
  if (self->_collectionTests)
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  if (self->_itemTests)
    -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:");
  return v4;
}

@end
