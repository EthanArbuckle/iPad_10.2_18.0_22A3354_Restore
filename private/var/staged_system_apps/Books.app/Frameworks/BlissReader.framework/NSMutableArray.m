@implementation NSMutableArray

- (void)moveFirstObjectToLast
{
  id v3;

  if (-[NSMutableArray count](self, "count"))
  {
    v3 = -[NSMutableArray objectAtIndex:](self, "objectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", 0);
    -[NSMutableArray addObject:](self, "addObject:", v3);

  }
}

- (void)moveLastObjectToFirst
{
  id v3;

  if (-[NSMutableArray count](self, "count"))
  {
    v3 = -[NSMutableArray lastObject](self, "lastObject");
    -[NSMutableArray removeLastObject](self, "removeLastObject");
    -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v3, 0);

  }
}

- (void)shuffle
{
  char *v3;
  char *v4;
  char *i;

  v3 = (char *)-[NSMutableArray count](self, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self, "exchangeObjectAtIndex:withObjectAtIndex:", i, arc4random() % (unint64_t)(i + 1));
  }
}

- (void)tsaxAddObjectIfNotNil:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self, "addObject:");
}

- (void)tsaxAddObjectIfNotNilWithAssert:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t vars0;

  if (a3)
  {
    -[NSMutableArray addObject:](self, "addObject:");
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Parameter was nil."), v4, v5, v6, v7, v8, vars0))abort();
  }
}

- (void)tsaxAddObjectsFromArrayIfNotNil:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(a3, "count"))
      -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:", a3);
  }
}

- (void)tsaxAddObjectsFromArrayIfNotNilWithAssert:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t vars0;

  if (a3)
  {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Parameter was nil."), v4, v5, v6, v7, v8, vars0))abort();
  }
}

- (void)tsaxAddObjectsInReverseOrder:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (objc_msgSend(a3, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableArray addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (id)tsaxPopObject
{
  id v3;

  v3 = -[NSMutableArray lastObject](self, "lastObject");
  -[NSMutableArray removeLastObject](self, "removeLastObject");
  return v3;
}

@end
