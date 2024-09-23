@implementation MSDBasePrepareOperation

- (id)methodSelectors
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
  {
    v3 = (void *)objc_opt_new(NSArray, v2);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, 0));

  }
  return v3;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)_prepareStagingArea
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  unsigned __int8 v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagingRootPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "secondaryStagingRootPath"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondaryStagingRootPath"));
    objc_msgSend(v5, "addObject:", v10);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "fileExistsAtPath:", v17) & 1) == 0)
        {
          v24 = v14;
          v18 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v24);
          v19 = v24;

          if ((v18 & 1) == 0)
          {
            v21 = sub_1000604F0();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              sub_1000CCBA4(v17, v19, v22);

            v20 = 0;
            goto LABEL_18;
          }
          v14 = v19;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
        continue;
      break;
    }
    v20 = 1;
    v19 = v14;
  }
  else
  {
    v19 = 0;
    v20 = 1;
  }
LABEL_18:

  return v20;
}

@end
