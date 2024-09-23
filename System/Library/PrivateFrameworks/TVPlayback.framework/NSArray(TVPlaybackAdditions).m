@implementation NSArray(TVPlaybackAdditions)

- (id)tvp_randomizedArray
{
  uint64_t v2;
  unsigned int v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend(a1, "count");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v3 - 1;
      if (v3 != 1)
      {
        do
        {
          if (ATVGetUpTimeMicros_onceToken != -1)
            dispatch_once(&ATVGetUpTimeMicros_onceToken, &__block_literal_global_15);
          v6 = (unint64_t)(*(double *)&ATVGetUpTimeMicros_sTimerToMicrosMultiplier * (double)mach_absolute_time());
          v7 = (arc4random() + v6) % v3;
          objc_msgSend(v4, "objectAtIndex:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectAtIndex:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "replaceObjectAtIndex:withObject:", v7, v9);
          objc_msgSend(v4, "replaceObjectAtIndex:withObject:", v5, v8);

          --v3;
          --v5;
        }
        while ((_DWORD)v5);
      }
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)tvp_arrayByMappingObjectsUsingBlock:()TVPlaybackAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __68__NSArray_TVPlaybackAdditions__tvp_arrayByMappingObjectsUsingBlock___block_invoke;
  v13 = &unk_24F15D458;
  v14 = v5;
  v15 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tvp_objectsPassingTest:()TVPlaybackAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)tvp_shallowIsEqualToArray:()TVPlaybackAdditions
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    v17 = 1;
  }
  else
  {
    if (!v4)
      goto LABEL_14;
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("*** %s: array argument is not an NSArray"), "-[NSArray(TVPlaybackAdditions) tvp_shallowIsEqualToArray:]");
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], objc_claimAutoreleasedReturnValue(), 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v19);
    }
    v8 = objc_msgSend(v5, "count");
    if (v8 == objc_msgSend(a1, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = a1;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v5, "objectAtIndex:", v12 + i);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15 != v16)
            {
              v17 = 0;
              goto LABEL_17;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          v12 += i;
          if (v11)
            continue;
          break;
        }
      }
      v17 = 1;
LABEL_17:

    }
    else
    {
LABEL_14:
      v17 = 0;
    }
  }

  return v17;
}

@end
