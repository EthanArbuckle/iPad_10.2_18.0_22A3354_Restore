@implementation SCProcessUtility

+ (id)hostApplicationWithAuditToken:(id *)a3 bundleID:(id)a4
{
  return a4;
}

+ (id)applicationProcessIdListForProcessId:(int)a3 hostProcessIdentifier:(int *)a4
{
  uint64_t v4;
  __objc2_class_ro **p_info;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[10];

  v4 = *(_QWORD *)&a3;
  p_info = RPCaptureSession.info;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SCProcessUtility listAllRunningProcesses:](SCProcessUtility, "listAllRunningProcesses:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v33 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v7, &v33));
  v32 = v33;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hostProcess"));
  v10 = objc_msgSend(v9, "pid");

  v11 = +[SCProcessUtility isValidProcessId:](SCProcessUtility, "isValidProcessId:", v10);
  if (v11)
  {
    v12 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SCProcessUtility getHostedPidsForPid:](SCProcessUtility, "getHostedPidsForPid:", v4));
    v14 = objc_msgSend(v13, "mutableCopy");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
    objc_msgSend(v14, "addObject:", v15);
    v16 = 0;
    v17 = 0;
    LODWORD(v18) = (_DWORD)v10;
  }
  else
  {
    v18 = +[SCProcessUtility parentProcessIdForProcessId:](SCProcessUtility, "parentProcessIdForProcessId:", v4);
    if (!+[SCProcessUtility isValidProcessId:](SCProcessUtility, "isValidProcessId:", v18))
    {
      v14 = 0;
      v20 = 0;
      v17 = 0;
      goto LABEL_7;
    }
    v12 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SCProcessUtility listOfProcessesMatchingSameParentPid:withProcessList:](SCProcessUtility, "listOfProcessesMatchingSameParentPid:withProcessList:", v18, v6));
    v17 = objc_msgSend(v19, "mutableCopy");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v18));
    objc_msgSend(v17, "addObject:", v15);
    v14 = 0;
    v16 = v18;
  }
  v20 = v11 ^ 1;

  *a4 = v18;
  LODWORD(v18) = v16;
  v6 = v12;
  p_info = (__objc2_class_ro **)(RPCaptureSession + 32);
LABEL_7:
  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v35 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    v36 = 1024;
    v37 = 77;
    v38 = 1024;
    v39 = v4;
    v40 = 1024;
    *(_DWORD *)v41 = (_DWORD)v10;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d processId=%d hostPid=%d parentPid=%d", buf, 0x24u);
  }
  if (((v11 | v20) & 1) == 0 && objc_msgSend(p_info + 16, "isValidProcessId:", v4))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_info + 16, "getHostedPidsForPid:", v4));
    v22 = objc_msgSend(v21, "mutableCopy");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_info + 16, "listOfProcessesMatchingSameParentPid:withProcessList:", v4, v6));
    v24 = objc_msgSend(v23, "mutableCopy");

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    objc_msgSend(v24, "addObject:", v25);

    *a4 = v4;
    v14 = v22;
    v17 = v24;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v14));
  v27 = objc_msgSend(v26, "mutableCopy");

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v35 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    v36 = 1024;
    v37 = 88;
    v38 = 1024;
    v39 = v4;
    v40 = 2112;
    *(_QWORD *)v41 = v27;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d processId=%d has relatedPids=%@", buf, 0x22u);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v27));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allObjects"));

  return v29;
}

+ (id)getHostedPidsForPid:(int)a3
{
  return +[NSMutableArray array](NSMutableArray, "array", *(_QWORD *)&a3);
}

+ (int)parentProcessIdForProcessId:(int)a3
{
  int v3;
  BOOL v4;
  size_t v6;
  int v7[2];
  int v8;
  int v9;
  _OWORD v10[35];
  int v11;

  memset(v10, 0, 512);
  v6 = 648;
  *(_QWORD *)v7 = 0xE00000001;
  v8 = 1;
  v9 = a3;
  v3 = sysctl(v7, 4u, v10, &v6, 0, 0);
  if (v6)
    v4 = v3 < 0;
  else
    v4 = 1;
  if (v4)
    return 0;
  else
    return v11;
}

+ (id)listOfProcessesMatchingSameParentPid:(int)a3 withProcessList:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a4;
  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[SCProcessUtility listAllRunningProcesses:](SCProcessUtility, "listAllRunningProcesses:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (+[SCProcessUtility parentProcessIdForProcessId:](SCProcessUtility, "parentProcessIdForProcessId:", objc_msgSend(v12, "intValue", (_QWORD)v14)) == a3)objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)listAllRunningProcesses:(id)a3
{
  id v3;
  __objc2_class_ro **p_info;
  void *v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  char *v10;
  __objc2_class_ro **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  unsigned int *v17;
  size_t v18;
  size_t size;
  int v20[2];
  int v21;
  size_t v22;
  int v23;
  int v24[2];

  v3 = a3;
  p_info = RPCaptureSession.info;
  if (!dword_100095D40)
  {
    v22 = 4;
    *(_QWORD *)v24 = 0x800000001;
    if (sysctl(v24, 2u, &dword_100095D40, &v22, 0, 0) == -1)
      dword_100095D40 = 4096;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0;
  v22 = 0xE00000001;
  size = 0;
  if ((sysctl((int *)&v22, 3u, 0, &size, 0, 0) & 0x80000000) == 0)
  {
    v6 = (unsigned int *)malloc_type_malloc(size, 0xFE8D3DC7uLL);
    if (v6)
    {
      v17 = v6;
      if ((sysctl((int *)&v22, 3u, v6, &size, 0, 0) & 0x80000000) == 0 && (int)((int)size / 0x288uLL) >= 1)
      {
        v7 = ((int)size / 0x288uLL);
        v8 = v17 + 10;
        do
        {
          v9 = *v8;
          if ((_DWORD)v9)
          {
            v18 = *((int *)p_info + 848);
            v10 = (char *)malloc_type_malloc(size, 0xA2A3D528uLL);
            *(_QWORD *)v20 = 0x3100000001;
            v21 = v9;
            if (!sysctl(v20, 3u, v10, &v18, 0, 0))
            {
              if (v3)
              {
                v11 = p_info;
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10 + 4, 4));
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByDeletingPathExtension"));

                if (objc_msgSend(v14, "isEqualToString:", v3))
                {
                  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
                  objc_msgSend(v5, "addObject:", v16);

                  free(v10);
                  break;
                }
                p_info = v11;
              }
              else
              {
                v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
                objc_msgSend(v5, "addObject:", v14);
              }

            }
            free(v10);
          }
          v8 += 162;
          --v7;
        }
        while (v7);
      }
      free(v17);
    }
  }

  return v5;
}

+ (int)avcdProcessId
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCProcessUtility listAllRunningProcesses:](SCProcessUtility, "listAllRunningProcesses:", CFSTR("avconferenced")));
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
    v4 = objc_msgSend(v3, "unsignedIntValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isValidProcessId:(int)a3
{
  return a3 > 1;
}

@end
