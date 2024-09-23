@implementation NSArray(SBHArrayUtilities)

- (BOOL)sbh_containsObjectInArray:()SBHArrayUtilities
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__NSArray_SBHArrayUtilities__sbh_containsObjectInArray___block_invoke;
  v4[3] = &unk_1E8D86DD8;
  v4[4] = a1;
  return objc_msgSend(a3, "indexOfObjectPassingTest:", v4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)sbh_containsAllObjectsInArray:()SBHArrayUtilities
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  if (v5 >= objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          if (!objc_msgSend(a1, "containsObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13))
          {
            v6 = 0;
            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_13:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sbh_arrayByRemovingObjectsFromArray:()SBHArrayUtilities
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectsInArray:", v4);

  return v5;
}

@end
