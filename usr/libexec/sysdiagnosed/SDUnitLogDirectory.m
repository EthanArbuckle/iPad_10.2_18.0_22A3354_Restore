@implementation SDUnitLogDirectory

+ (id)logRuleWithDirectory:(id)a3
{
  id v3;
  SDUnitLogDirectory *v4;
  SDUnitLogDirectory *v5;

  v3 = a3;
  v4 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogDirectory alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", 0, 0, 0, 0, 0);
  v5 = v4;
  if (v4)
  {
    -[SDUnitLogDirectory setDirectory:](v4, "setDirectory:", v3);
    -[SDUnitLogRule setHeadDir:](v5, "setHeadDir:", v3);
  }

  return v5;
}

+ (id)logRuleWithDirectory:(id)a3 withDepth:(unint64_t)a4 withDate:(id)a5 withFilter:(id)a6 newestFileCount:(unint64_t)a7 atInternalDirectory:(id)a8 withRuntimeChecks:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  SDUnitLogDirectory *v18;

  v14 = a3;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogDirectory alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v17, v16, a7, v15, a9);

  if (v18)
  {
    -[SDUnitLogDirectory setDirectory:](v18, "setDirectory:", v14);
    -[SDUnitLogRule setHeadDir:](v18, "setHeadDir:", v14);
    -[SDUnitLogRule setMaxDepth:](v18, "setMaxDepth:", a4);
  }

  return v18;
}

+ (id)logRuleWithDirectory:(id)a3 atInternalDirectory:(id)a4
{
  id v5;
  id v6;
  SDUnitLogDirectory *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[SDUnitLogRule initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:]([SDUnitLogDirectory alloc], "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", 0, 0, 0, v6, 0);

  if (v7)
  {
    -[SDUnitLogDirectory setDirectory:](v7, "setDirectory:", v5);
    -[SDUnitLogRule setHeadDir:](v7, "setHeadDir:", v5);
  }

  return v7;
}

- (id)getNextMatch
{
  SDUnitLogDirectory *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  SDUnitLogDirectory *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v34;
  id obj;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _BYTE v42[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](self, "matchEnumerator"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SDUnitLogRule setMatchEnumerator:](v2, "setMatchEnumerator:", v4);

    if (-[SDUnitLogRule resolveHomeDirs](v2, "resolveHomeDirs"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC0B0, "objectAtIndexedSubscript:", 0));
      if (objc_msgSend(v5, "hasPrefix:", v6))
      {

LABEL_6:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC0B0, "objectAtIndexedSubscript:", 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC0B0, "objectAtIndexedSubscript:", objc_msgSend(v10, "hasPrefix:", v11) ^ 1));

        -[SDUnitLogRule setHeadDir:](v2, "setHeadDir:", CFSTR("."));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v12, &stru_10009DC10));

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule _localUserHomeDirectories](v2, "_localUserHomeDirectories"));
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v14)
        {
          v15 = v14;
          v34 = v12;
          v16 = v2;
          v17 = 0;
          v18 = 0;
          v19 = *(_QWORD *)v38;
          do
          {
            v20 = 0;
            v21 = v17;
            v22 = v18;
            do
            {
              if (*(_QWORD *)v38 != v19)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v20);
              v24 = objc_autoreleasePoolPush();
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
              v41[0] = v25;
              v41[1] = v36;
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v26));

              v18 = (void *)objc_claimAutoreleasedReturnValue(+[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:](BFSDirectoryEnumerator, "BFSEnumeratorWithPath:withDepth:", v17, -[SDUnitLogRule maxDepth](v16, "maxDepth")));
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](v16, "matchEnumerator"));
              objc_msgSend(v27, "addObject:", v18);

              objc_autoreleasePoolPop(v24);
              v20 = (char *)v20 + 1;
              v21 = v17;
              v22 = v18;
            }
            while (v15 != v20);
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          }
          while (v15);

          v2 = v16;
          v12 = v34;
        }
        else
        {
          v18 = 0;
        }

        goto LABEL_17;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC0B0, "objectAtIndexedSubscript:", 1));
      v9 = objc_msgSend(v7, "hasPrefix:", v8);

      if (v9)
        goto LABEL_6;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](v2, "directory"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolvePathToMobileContainer:](v2, "resolvePathToMobileContainer:", v28));

    v30 = objc_retainAutorelease(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(v30, "fileSystemRepresentation"), 1, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BFSDirectoryEnumerator BFSEnumeratorWithPath:withDepth:](BFSDirectoryEnumerator, "BFSEnumeratorWithPath:withDepth:", v31, -[SDUnitLogRule maxDepth](v2, "maxDepth")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule matchEnumerator](v2, "matchEnumerator"));
    objc_msgSend(v32, "addObject:", v18);

LABEL_17:
  }
  return (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule advanceMatchEnumerator](v2, "advanceMatchEnumerator"));
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](self, "directory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SDUnitLogDirectory with directory '%@'"), v2));

  return v3;
}

- (void)resolvePaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule headDir](self, "headDir"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v3));
  -[SDUnitLogRule setHeadDir:](self, "setHeadDir:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[SDUnitLogDirectory directory](self, "directory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnitLogRule resolveCrashReporterPath:](self, "resolveCrashReporterPath:", v6));
  -[SDUnitLogDirectory setDirectory:](self, "setDirectory:", v5);

}

- (NSString)directory
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
