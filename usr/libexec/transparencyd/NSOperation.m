@implementation NSOperation

- (id)selfname
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));

  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@)"), v7, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v9;
}

- (void)linearDependencies:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  objc_sync_enter(v4);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        if (*(NSOperation **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8) != self)
          -[NSOperation addDependency:](self, "addDependency:", (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "addObject:", self);
  objc_sync_exit(v5);

}

- (void)linearDependenciesWithSelfFirst:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSOperation *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  objc_sync_enter(v4);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(NSOperation **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (v9 != self)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "isPending", (_QWORD)v10))
          {
            -[NSOperation addDependency:](v9, "addDependency:", self);
            if (-[NSOperation isPending](v9, "isPending"))
              goto LABEL_11;
            -[NSOperation removeDependency:](v9, "removeDependency:", self);
          }
          -[NSOperation addDependency:](self, "addDependency:", v9);
        }
LABEL_11:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "addObject:", self);
  objc_sync_exit(v5);

}

- (id)pendingDependenciesString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation dependencies](self, "dependencies"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexesOfObjectsPassingTest:", &stru_10024C998));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectsAtIndexes:", v7));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", ")));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, v9));

  }
  else
  {
    v10 = &stru_1002508B8;
  }

  return v10;
}

- (id)description
{
  __CFString *v3;
  unsigned int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSOperation isFinished](self, "isFinished"))
  {
    v3 = CFSTR("finished");
  }
  else if (-[NSOperation isCancelled](self, "isCancelled"))
  {
    v3 = CFSTR("cancelled");
  }
  else if (-[NSOperation isExecuting](self, "isExecuting"))
  {
    v3 = CFSTR("executing");
  }
  else
  {
    v4 = -[NSOperation isReady](self, "isReady");
    v3 = CFSTR("pending");
    if (v4)
      v3 = CFSTR("ready");
  }
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation selfname](self, "selfname"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@%@>"), v6, v5, v7));

  return v8;
}

- (id)debugDescription
{
  __CFString *v3;
  unsigned int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[NSOperation isFinished](self, "isFinished"))
  {
    v3 = CFSTR("finished");
  }
  else if (-[NSOperation isCancelled](self, "isCancelled"))
  {
    v3 = CFSTR("cancelled");
  }
  else if (-[NSOperation isExecuting](self, "isExecuting"))
  {
    v3 = CFSTR("executing");
  }
  else
  {
    v4 = -[NSOperation isReady](self, "isReady");
    v3 = CFSTR("pending");
    if (v4)
      v3 = CFSTR("ready");
  }
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation selfname](self, "selfname"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation pendingDependenciesString:](self, "pendingDependenciesString:", CFSTR(" dep:")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ (%p): %@%@>"), v6, self, v5, v7));

  return v8;
}

- (BOOL)isPending
{
  if (-[NSOperation isExecuting](self, "isExecuting") || -[NSOperation isFinished](self, "isFinished"))
    return 0;
  else
    return !-[NSOperation isCancelled](self, "isCancelled");
}

- (void)addNullableDependency:(id)a3
{
  if (a3)
    -[NSOperation addDependency:](self, "addDependency:");
}

- (void)removeDependenciesUponCompletion
{
  _QWORD v3[4];
  id v4;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001A1C84;
  v3[3] = &unk_10023A970;
  objc_copyWeak(&v4, &location);
  -[NSOperation setCompletionBlock:](self, "setCompletionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end
