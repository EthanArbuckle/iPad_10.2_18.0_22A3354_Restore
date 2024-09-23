@implementation NSMutableArray(PhotosUIFoundation)

- (id)px_popFirst
{
  void *v2;

  if (objc_msgSend(a1, "count"))
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", 0);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)px_popLast
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(a1, "count"))
  {
    v2 = objc_msgSend(a1, "count") - 1;
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)px_popRange:()PhotosUIFoundation
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "removeObjectsInRange:", a3, a4);
  return v8;
}

- (id)px_popFirstPassingTest:()PhotosUIFoundation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v4 = v2;
    objc_msgSend(a1, "objectAtIndex:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "removeObjectAtIndex:", v4);
  }
  return v3;
}

- (void)px_insertObjects:()PhotosUIFoundation atIndex:
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x24BDD15E0];
  v7 = a3;
  v8 = (id)objc_msgSend([v6 alloc], "initWithIndexesInRange:", a4, objc_msgSend(v7, "count"));
  objc_msgSend(a1, "insertObjects:atIndexes:", v7, v8);

}

- (void)px_addObjectIfNotNil:()PhotosUIFoundation
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)px_addObject:()PhotosUIFoundation removingFirstObjectIfNeededToKeepMaximumCount:
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    while (objc_msgSend(a1, "count") >= a4)
      objc_msgSend(a1, "removeObjectAtIndex:", 0);
    objc_msgSend(a1, "addObject:", v7);
    v6 = v7;
  }

}

@end
