@implementation SDUnitLogPathArray

+ (id)logRuleWithPaths:(id)a3
{
  id v3;
  SDUnitLogPathArray *v4;
  id v5;

  v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogPathArray alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", 0, 0, 0, 0, 0);
  if (v4)
  {
    v5 = objc_msgSend(v3, "mutableCopy");
    -[SDUnitLogPathArray setPaths:](v4, "setPaths:", v5);

  }
  return v4;
}

+ (id)logRuleWithMutablePaths:(id)a3
{
  id v3;
  SDUnitLogPathArray *v4;
  SDUnitLogPathArray *v5;

  v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogPathArray alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", 0, 0, 0, 0, 0);
  v5 = v4;
  if (v4)
    -[SDUnitLogPathArray setPaths:](v4, "setPaths:", v3);

  return v5;
}

+ (id)logRuleWithPaths:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  SDUnitLogPathArray *v17;
  id v18;

  v13 = a3;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogPathArray alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v16, v15, a6, v14, a8);

  if (v17)
  {
    v18 = objc_msgSend(v13, "mutableCopy");
    -[SDUnitLogPathArray setPaths:](v17, "setPaths:", v18);

  }
  return v17;
}

- (void)expandHomeDirectoriesAtPath:(id)a3 andAddToURLArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  if (!-[SDUnitLogRule resolveHomeDirs](self, "resolveHomeDirs"))
    goto LABEL_13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC080, "objectAtIndexedSubscript:", 0));
  if (!objc_msgSend(v6, "hasPrefix:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC080, "objectAtIndexedSubscript:", 1));
    v10 = objc_msgSend(v6, "hasPrefix:", v9);

    if (v10)
      goto LABEL_5;
LABEL_13:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolvePathToMobileContainer:](self, "resolvePathToMobileContainer:", v6));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v22));
    objc_msgSend(v7, "addObject:", v23);

    goto LABEL_14;
  }

LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC080, "objectAtIndexedSubscript:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC080, "objectAtIndexedSubscript:", objc_msgSend(v6, "hasPrefix:", v11) ^ 1));

  -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", CFSTR("."));
  v24 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v12, &stru_10009DC10));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule _localUserHomeDirectories](self, "_localUserHomeDirectories"));
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
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "path"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingPathComponent:", v13));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v20));
        objc_msgSend(v7, "addObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v6 = v24;
LABEL_14:

}

- (id)getNextMatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SDUnitLogRule setMatchEnumerator:](self, "setMatchEnumerator:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          -[SDUnitLogPathArray expandHomeDirectoriesAtPath:andAddToURLArray:](self, "expandHomeDirectoriesAtPath:andAddToURLArray:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:](BFSDirectoryEnumerator, "BFSEnumeratorWithPath:withDepth:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), 1, (_QWORD)v20));

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
          objc_msgSend(v18, "addObject:", v14);

          v16 = (char *)v16 + 1;
          v17 = v14;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);

    }
  }
  return (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule advanceMatchEnumerator](self, "advanceMatchEnumerator", (_QWORD)v20));
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SDUnitLogPathArray with %lu paths"), objc_msgSend(v2, "count")));

  return v3;
}

- (void)resolvePaths
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v5));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v8, v5);

      ++v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogPathArray paths](self, "paths"));
      v11 = objc_msgSend(v10, "count");

    }
    while ((unint64_t)v11 > v5);
  }
}

- (NSMutableArray)paths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
