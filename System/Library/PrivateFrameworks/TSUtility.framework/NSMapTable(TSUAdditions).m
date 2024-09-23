@implementation NSMapTable(TSUAdditions)

- (id)tsu_allKeys
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "keyEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)tsu_allObjects
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectEnumerator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)tsu_enumerateKeysAndObjectsUsingBlock:()TSUAdditions
{
  void (**v4)(id, uint64_t, void *, char *);
  void *v5;
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
    objc_msgSend(a1, "tsu_allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(a1, "objectForKey:", v10);
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
