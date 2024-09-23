@implementation NSOperation

- (id)selfname
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%@)"), v6, v7));

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  return v8;
}

- (void)linearDependencies:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  int v16;
  _BYTE v17[128];

  v4 = a3;
  objc_sync_enter(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        if (*(NSOperation **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8) != self)
          -[NSOperation addDependency:](self, "addDependency:", (_QWORD)v11);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v5, "addObject:", self);
  if ((unint64_t)objc_msgSend(v5, "count") >= 0x65)
  {
    v9 = sub_10000EF14("SecError");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = 100;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ckks-operation: linear dependencies exceeds %d operations", buf, 8u);
    }

  }
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
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _DWORD *v10;
  __CFString *v11;
  _DWORD *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperation dependencies](self, "dependencies"));
  v7 = objc_msgSend(v6, "copy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexesOfObjectsPassingTest:", &stru_1002E8C48));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectsAtIndexes:", v8));

  if (objc_msgSend(v9, "count"))
  {
    off_100340C30();
    if (*v10 < 0x15u)
    {
      v12 = v10;
      v24 = v5;
      ++*v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v20 = objc_autoreleasePoolPush();
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));
            objc_msgSend(v13, "addObject:", v21);

            objc_autoreleasePoolPop(v20);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v16);
      }

      --*v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v4, v22));

      v5 = v24;
    }
    else
    {
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<recursion too deep>")));
    }
  }
  else
  {
    v11 = &stru_1002EE888;
  }

  objc_autoreleasePoolPop(v5);
  return v11;
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

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100142D90;
  v3[3] = &unk_1002EB598;
  objc_copyWeak(&v4, &location);
  -[NSOperation setCompletionBlock:](self, "setCompletionBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end
