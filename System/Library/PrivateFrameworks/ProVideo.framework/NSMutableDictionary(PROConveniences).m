@implementation NSMutableDictionary(PROConveniences)

- (void)addObject:()PROConveniences toSetForKey:
{
  void *v7;
  void *v8;
  uint64_t v9;

  v9 = a3;
  v7 = (void *)objc_msgSend(a1, "objectForKey:", a4);
  if (v7)
  {
    objc_msgSend(v7, "addObject:", a3);
  }
  else
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E20], "allocWithZone:", objc_msgSend(a1, "zone")), "initWithObjects:count:", &v9, 1);
    objc_msgSend(a1, "setObject:forKey:", v8, a4);

  }
}

- (void)removeObject:()PROConveniences fromSetForKey:
{
  void *result;
  void *v8;

  result = (void *)objc_msgSend(a1, "objectForKey:", a4);
  if (result)
  {
    v8 = result;
    if (objc_msgSend(result, "count") == 1)
      return (void *)objc_msgSend(a1, "removeObjectForKey:", a4);
    else
      return (void *)objc_msgSend(v8, "removeObject:", a3);
  }
  return result;
}

- (uint64_t)objectsInAllSetsForKeys:()PROConveniences
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = (void *)objc_msgSend(a3, "objectEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_msgSend(a1, "objectForKey:", v6);
      if (!v8)
        break;
      if (v7)
        objc_msgSend(v7, "intersectSet:", v8);
      else
        v7 = (void *)objc_msgSend(v8, "mutableCopy");
      v6 = objc_msgSend(v4, "nextObject");
      if (!v6)
      {
        if (!v7)
          goto LABEL_11;
        goto LABEL_9;
      }
    }
    objc_msgSend(v7, "removeAllObjects");
    if (v7)
    {
LABEL_9:
      v9 = objc_msgSend(v7, "allObjects", v6);
      goto LABEL_12;
    }
  }
LABEL_11:
  v9 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v7 = 0;
LABEL_12:

  return v9;
}

@end
