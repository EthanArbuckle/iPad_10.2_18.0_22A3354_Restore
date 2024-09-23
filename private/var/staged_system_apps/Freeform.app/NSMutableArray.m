@implementation NSMutableArray

- (void)crl_enqueue:(id)a3
{
  -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", a3, 0);
}

- (id)crl_pop
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self, "lastObject"));
  if (v3)
    -[NSMutableArray removeLastObject](self, "removeLastObject");
  return v3;
}

- (void)crl_addObjects:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  id v7;
  id *v8;
  uint64_t v9;

  v4 = a3;
  v8 = (id *)&v9;
  if (v4)
  {
    v5 = v4;
    do
    {
      -[NSMutableArray addObject:](self, "addObject:", v5);
      v6 = v8++;
      v7 = *v6;

      v5 = v7;
    }
    while (v7);
  }
}

- (void)crl_addNonNilObject:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self, "addObject:");
}

- (void)crl_addObjectsFromNonNilArray:(id)a3
{
  if (a3)
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:");
}

- (void)crl_removeObjectsIdenticalToObjectsInArray:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  id j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (NSMutableArray *)a3;
  v5 = v4;
  if (self == v4)
  {
    -[NSMutableArray removeAllObjects](self, "removeAllObjects");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v11 = -[NSMutableArray indexOfObjectIdenticalTo:](self, "indexOfObjectIdenticalTo:", v10);
          if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            for (j = v11;
                  j != (id)0x7FFFFFFFFFFFFFFFLL;
                  j = -[NSMutableArray indexOfObjectIdenticalTo:](self, "indexOfObjectIdenticalTo:", v10))
            {
              -[NSMutableArray removeObjectAtIndex:](self, "removeObjectAtIndex:", j);
            }
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
  }

}

- (void)crl_trimObjectsFromIndex:(unint64_t)a3
{
  char *v5;

  v5 = (char *)-[NSMutableArray count](self, "count");
  if ((unint64_t)v5 > a3)
    -[NSMutableArray removeObjectsInRange:](self, "removeObjectsInRange:", a3, &v5[-a3]);
}

- (unint64_t)crl_insertObject:(id)a3 usingComparator:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, -[NSMutableArray count](self, "count"), 1024, v6);

  -[NSMutableArray insertObject:atIndex:](self, "insertObject:atIndex:", v7, v8);
  return (unint64_t)v8;
}

- (void)crlaxAddObjectIfNotNil:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self, "addObject:");
}

- (void)crlaxAddObjectIfNotNilWithAssert:(id)a3
{
  id v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    -[NSMutableArray addObject:](self, "addObject:", v4);
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Parameter was nil."), v6, v7, v8, v9, v10, v11))abort();
  }

}

- (void)crlaxAddObjectsFromArrayIfNotNil:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v7;
    if (v6)
    {
      -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:", v7);
      v5 = v7;
    }
  }

}

- (void)crlaxAddObjectsFromArrayIfNotNilWithAssert:(id)a3
{
  id v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:", v4);
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Parameter was nil."), v6, v7, v8, v9, v10, v11))abort();
  }

}

- (void)crlaxAddObjectsInReverseOrder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reverseObjectEnumerator", 0));
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

- (id)crlaxPopObject
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self, "lastObject"));
  -[NSMutableArray removeLastObject](self, "removeLastObject");
  return v3;
}

@end
