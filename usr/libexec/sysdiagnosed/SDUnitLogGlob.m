@implementation SDUnitLogGlob

+ (id)logRuleWithGlob:(id)a3
{
  id v3;
  SDUnitLogGlob *v4;
  SDUnitLogGlob *v5;

  v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogGlob alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", 0, 0, 0, 0, 0);
  v5 = v4;
  if (v4)
    -[SDUnitLogGlob setGlob:](v4, "setGlob:", v3);

  return v5;
}

+ (id)logRuleWithGlob:(id)a3 withDate:(id)a4 withFilter:(id)a5 newestFileCount:(unint64_t)a6 atInternalDirectory:(id)a7 withRuntimeChecks:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  SDUnitLogGlob *v17;

  v13 = a3;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogGlob alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v16, v15, a6, v14, a8);

  if (v17)
    -[SDUnitLogGlob setGlob:](v17, "setGlob:", v13);

  return v17;
}

- (void)addGlobContents:(id)a3 toURLArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  size_t v12;
  void *v13;
  char *v14;
  void *v15;
  glob_t v16;
  uint8_t buf[4];
  id v18;

  v5 = a3;
  v6 = a4;
  memset(&v16, 0, sizeof(v16));
  v16.gl_matchc = 1000;
  v7 = sub_100026C34();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Querying glob %s", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v10 = objc_retainAutorelease(v5);
  objc_msgSend(v9, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Querying glob %s"), objc_msgSend(v10, "fileSystemRepresentation"));

  v11 = objc_retainAutorelease(v10);
  glob_b((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 4264, &stru_1000990C0, &v16);
  if (v16.gl_pathc)
  {
    v12 = 0;
    do
    {
      v13 = objc_autoreleasePoolPush();
      v14 = v16.gl_pathv[v12];
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, 0, 0));
        if (v15)
          objc_msgSend(v6, "addObject:", v15);

      }
      objc_autoreleasePoolPop(v13);
      ++v12;
    }
    while (v16.gl_pathc > v12);
  }
  globfree(&v16);

}

- (void)expandHomeDirectoriesForGlob:(id)a3 andAddToURLArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  if (!-[SDUnitLogRule resolveHomeDirs](self, "resolveHomeDirs"))
    goto LABEL_13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC098, "objectAtIndexedSubscript:", 0));
  if (!objc_msgSend(v6, "hasPrefix:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC098, "objectAtIndexedSubscript:", 1));
    v10 = objc_msgSend(v6, "hasPrefix:", v9);

    if (v10)
      goto LABEL_5;
LABEL_13:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolvePathToMobileContainer:](self, "resolvePathToMobileContainer:", v21));

    -[SDUnitLogGlob addGlobContents:toURLArray:](self, "addGlobContents:toURLArray:", v22, v7);
    goto LABEL_14;
  }

LABEL_5:
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC098, "objectAtIndexedSubscript:", 0));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC098, "objectAtIndexedSubscript:", objc_msgSend(v6, "hasPrefix:", v11) ^ 1));

  -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", CFSTR("."));
  v23 = (void *)v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v12, &stru_10009DC10));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule _localUserHomeDirectories](self, "_localUserHomeDirectories"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v18), "path"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", v13));
        -[SDUnitLogGlob addGlobContents:toURLArray:](self, "addGlobContents:toURLArray:", v20, v7);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

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
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SDUnitLogRule setMatchEnumerator:](self, "setMatchEnumerator:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
    -[SDUnitLogGlob expandHomeDirectoriesForGlob:andAddToURLArray:](self, "expandHomeDirectoriesForGlob:andAddToURLArray:", v6, v5);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        v13 = v10;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:](BFSDirectoryEnumerator, "BFSEnumeratorWithPath:withDepth:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12), 1, (_QWORD)v16));

          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));
          objc_msgSend(v14, "addObject:", v10);

          v12 = (char *)v12 + 1;
          v13 = v10;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);

    }
  }
  return (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule advanceMatchEnumerator](self, "advanceMatchEnumerator", (_QWORD)v16));
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SDUnitLogGlob with glob '%@'"), v2));

  return v3;
}

- (void)resolvePaths
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogGlob glob](self, "glob"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v4));
  -[SDUnitLogGlob setGlob:](self, "setGlob:", v3);

}

- (NSString)glob
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGlob:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glob, 0);
}

@end
