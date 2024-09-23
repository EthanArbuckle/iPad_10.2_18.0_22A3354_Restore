@implementation NSMutableSet(WiFiKit)

- (void)compareAndUpdateDuplicateScanRecords:()WiFiKit
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "intersectSet:", v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      v15 = v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __62__NSMutableSet_WiFiKit__compareAndUpdateDuplicateScanRecords___block_invoke;
        v17[3] = &unk_24DC36168;
        v17[4] = v10;
        objc_msgSend(v4, "objectsPassingTest:", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count") == 1)
        {
          objc_msgSend(v11, "anyObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "compare:", v10) == 1)
          {
            objc_msgSend(a1, "removeObject:", v10);
            v7 = v15;
            objc_msgSend(a1, "addObject:", v12);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v13, "minusSet:", a1);
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addObjectsFromArray:", v14);

  }
}

@end
