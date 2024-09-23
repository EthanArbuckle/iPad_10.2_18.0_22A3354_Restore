@implementation SXColumnStack

- (SXColumnStack)initWithNumberOfColumns:(unint64_t)a3
{
  SXColumnStack *v4;
  NSArray *i;
  void *v6;
  NSArray *columnStack;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXColumnStack;
  v4 = -[SXColumnStack init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    for (i = (NSArray *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](i, "addObject:", v6);

    }
    columnStack = v4->_columnStack;
    v4->_columnStack = i;

  }
  return v4;
}

- (void)addComponentBlueprint:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "columnRange");
  if (v4 < v4 + v5)
  {
    v6 = v4;
    v7 = v5;
    do
    {
      -[SXColumnStack columnStack](self, "columnStack");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v10);
      ++v6;
      --v7;
    }
    while (v7);
  }

}

- (id)allComponentsBeforeComponent:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "columnRange");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 + v7;
  if (v5 < v5 + v7)
  {
    do
    {
      -[SXColumnStack columnStack](self, "columnStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
LABEL_4:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          if (*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16) == v4)
            break;
          objc_msgSend(v8, "addObject:");
          if (v14 == ++v16)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
            if (v14)
              goto LABEL_4;
            break;
          }
        }
      }

      ++v5;
    }
    while (v5 != v9);
  }

  return v8;
}

- (id)componentsBeforeComponent:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "columnRange");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 < v5 + v7)
  {
    do
    {
      -[SXColumnStack columnStack](self, "columnStack");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "indexOfObjectIdenticalTo:", v4);
      if (v11)
      {
        objc_msgSend(v10, "objectAtIndex:", v11 - 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

      }
      ++v5;
      --v7;
    }
    while (v7);
  }

  return v8;
}

- (id)allComponentsAfterComponent:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "columnRange");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 + v7;
  if (v5 < v5 + v7)
  {
    do
    {
      -[SXColumnStack columnStack](self, "columnStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v21;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v16)
              objc_enumerationMutation(v12);
            v18 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v17);
            if (v15)
            {
              objc_msgSend(v8, "addObject:", v18);
              v15 = 1;
            }
            else
            {
              v15 = v18 == v4;
            }
            ++v17;
          }
          while (v14 != v17);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

      ++v5;
    }
    while (v5 != v9);
  }

  return v8;
}

- (id)componentsAfterComponent:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "columnRange");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 < v5 + v7)
  {
    do
    {
      -[SXColumnStack columnStack](self, "columnStack");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "indexOfObjectIdenticalTo:", v4);
      if (v11 < objc_msgSend(v10, "count") - 1)
      {
        objc_msgSend(v10, "objectAtIndex:", v11 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

      }
      ++v5;
      --v7;
    }
    while (v7);
  }

  return v8;
}

- (unint64_t)rangeInBounds:(_NSRange)a3
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = a3.location + a3.length;
  -[SXColumnStack columnStack](self, "columnStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 <= objc_msgSend(v4, "count");

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SXColumnStack columnStack](self, "columnStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)columnStack
{
  return self->_columnStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnStack, 0);
}

@end
