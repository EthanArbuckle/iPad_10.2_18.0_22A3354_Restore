@implementation NSArray(SpringBoard)

- (id)sb_arrayByInsertingOrMovingObject:()SpringBoard toIndex:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "mutableCopy");
  v8 = objc_msgSend(a1, "indexOfObject:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v7, "removeObjectAtIndex:", v8);
  objc_msgSend(v7, "insertObject:atIndex:", v6, a4);

  return v7;
}

- (id)sb_arrayByAddingOrMovingObject:()SpringBoard
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  v6 = objc_msgSend(a1, "indexOfObject:", v4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "removeObjectAtIndex:", v6);
  objc_msgSend(v5, "addObject:", v4);

  return v5;
}

- (id)sb_arrayByRemovingObject:()SpringBoard
{
  id v5;
  id v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+SpringBoard.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  if (objc_msgSend(a1, "containsObject:", v5))
  {
    v6 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v6, "removeObject:", v5);
  }
  else
  {
    v6 = a1;
  }

  return v6;
}

- (id)sb_arrayByRemovingObjects:()SpringBoard
{
  id v4;
  id v5;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (id)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v5, "removeObjectsInArray:", v4);
  }
  else
  {
    v5 = a1;
  }

  return v5;
}

@end
