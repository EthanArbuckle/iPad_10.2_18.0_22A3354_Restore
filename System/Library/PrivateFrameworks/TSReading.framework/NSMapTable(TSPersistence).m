@implementation NSMapTable(TSPersistence)

+ (uint64_t)newTspWeakObjectsMapTable
{
  return objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 5, 16);
}

+ (uint64_t)newTspStrongObjectsMapTable
{
  return objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 16);
}

- (void)enumerateObjectsUsingBlock:()TSPersistence
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = a1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10, &v15);

        if (v15)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)enumerateIdentifiersAndObjectsUsingBlock:()TSPersistence
{
  void (**v4)(id, uint64_t, void *, char *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v16 = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = a1;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10, v11, &v16);

        if (v16)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
