@implementation RoutingAppLaunchRecord

- (id)rankedRoutingAppProxiesWithProxies:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
        objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppLaunchRecord appIDsSortedByMostRecentLaunch:](self, "appIDsSortedByMostRecentLaunch:", v5));
  v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), (_QWORD)v23));
        objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v15;
}

- (RoutingAppLaunchRecord)init
{
  return -[RoutingAppLaunchRecord initWithRecentlyLaunchedApps:](self, "initWithRecentlyLaunchedApps:", &__NSArray0__struct);
}

- (RoutingAppLaunchRecord)initWithRecentlyLaunchedApps:(id)a3
{
  id v4;
  RoutingAppLaunchRecord *v5;
  id v6;
  RoutingAppLaunchRecord *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutingAppLaunchRecord;
  v5 = -[RoutingAppLaunchRecord init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    -[RoutingAppLaunchRecord setRecentlyLaunchedApps:](v5, "setRecentlyLaunchedApps:", v6);
    v7 = v5;

  }
  return v5;
}

- (id)appIDsSortedByMostRecentLaunch:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = malloc_type_malloc(8 * (_QWORD)objc_msgSend(v4, "count"), 0x100004000313F17uLL);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = -[NSMutableArray indexOfObject:](self->_recentlyLaunchedApps, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11));
        if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
          v13 = -1;
        else
          v13 = (uint64_t)v12;
        v5[v9 + (_QWORD)v11] = v13;
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v9 += (uint64_t)v11;
    }
    while (v8);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10099B16C;
  v17[3] = &unk_1011DD750;
  v18 = v6;
  v19 = v5;
  v14 = v6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sortedArrayUsingComparator:", v17));
  free(v5);

  return v15;
}

- (void)recordAppLaunch:(id)a3
{
  id v4;
  NSMutableArray *recentlyLaunchedApps;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recentlyLaunchedApps = self->_recentlyLaunchedApps;
  v8 = v4;
  if (!recentlyLaunchedApps)
  {
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    v7 = self->_recentlyLaunchedApps;
    self->_recentlyLaunchedApps = v6;

    v4 = v8;
    recentlyLaunchedApps = self->_recentlyLaunchedApps;
  }
  -[NSMutableArray removeObject:](recentlyLaunchedApps, "removeObject:", v4);
  -[NSMutableArray insertObject:atIndex:](self->_recentlyLaunchedApps, "insertObject:atIndex:", v8, 0);

}

- (NSMutableArray)recentlyLaunchedApps
{
  return (NSMutableArray *)-[NSMutableArray copy](self->_recentlyLaunchedApps, "copy");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recentlyLaunchedApps, CFSTR("_recentlyLaunchedApps"));
}

- (RoutingAppLaunchRecord)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  RoutingAppLaunchRecord *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString), CFSTR("_recentlyLaunchedApps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = &__NSArray0__struct;
  if (v6)
    v7 = v6;
  v8 = v7;

  v9 = -[RoutingAppLaunchRecord initWithRecentlyLaunchedApps:](self, "initWithRecentlyLaunchedApps:", v8);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRecentlyLaunchedApps:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyLaunchedApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyLaunchedApps, 0);
}

@end
