@implementation NSArray(TVMLKitAdditions)

- (id)tv_randomizedArray
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
          if (_TVGetUpTimeMicros_onceToken != -1)
            dispatch_once(&_TVGetUpTimeMicros_onceToken, &__block_literal_global_11);
          v6 = (unint64_t)(*(double *)&_TVGetUpTimeMicros_sTimerToMicrosMultiplier * (double)mach_absolute_time());
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

- (id)tv_arrayByMappingObjectsUsingBlock:()TVMLKitAdditions
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
  v12 = __64__NSArray_TVMLKitAdditions__tv_arrayByMappingObjectsUsingBlock___block_invoke;
  v13 = &unk_24EB85A60;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
