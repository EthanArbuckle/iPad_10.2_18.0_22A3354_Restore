@implementation HTProcessInfo

+ (void)initialize
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)qword_100060280;
  qword_100060280 = (uint64_t)v2;

}

+ (void)addDisplayStateChangeEvent:(DisplayStateChangeEvent)a3
{
  int v3;

  v3 = dword_100060328;
  *((DisplayStateChangeEvent *)&unk_100060288 + dword_100060328) = a3;
  dword_100060328 = (v3 + 1) % 0xAu;
}

+ (void)checkForHangTimeouts:(unint64_t)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];

  os_unfair_lock_lock(&stru_10006032C);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)qword_100060280;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v8), "checkEventsForTimeouts:withType:", a3, 2, (_QWORD)v14));
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  os_unfair_lock_unlock(&stru_10006032C);
  if (v10)
  {
    v11 = sub_100024FF4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceName"));
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Hang for service name %@ timed out, recording", buf, 0xCu);

    }
    objc_msgSend(v10, "recordHang");
  }

}

- (unint64_t)getHangStartTime:(unint64_t)a3
{
  $A04E4E12E95AA3C9EB1FA918F18040EE *shmem_region;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v10;
  int v11;
  int v12;

  shmem_region = self->shmem_region;
  if (!shmem_region->var1)
    return -1;
  v6 = 0;
  v7 = -1;
  v8 = 380;
  do
  {
    if (!atomic_load((unsigned int *)((char *)shmem_region + v8 - 348)) && !*((_BYTE *)&shmem_region->var0 + v8))
    {
      v10 = *(_QWORD *)((char *)shmem_region + v8 - 372);
      if (a3 > v10 && sub_1000273EC(a3 - v10) > 250.0)
      {
        v11 = sub_100019AA8(self->pid);
        if (v10 >= v7)
          v12 = 1;
        else
          v12 = v11;
        if (!v12)
          v7 = v10;
      }
    }
    ++v6;
    shmem_region = self->shmem_region;
    v8 += 384;
  }
  while (v6 < shmem_region->var1);
  return v7;
}

+ (unint64_t)getEarliestPendingHangStartTime:(unint64_t)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *i;
  _QWORD *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  os_unfair_lock_lock(&stru_10006032C);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (id)qword_100060280;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    v9 = -1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v11 = *(_QWORD **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "getHangStartTime:", a3);
        if ((unint64_t)v12 < v9)
        {
          v13 = (unint64_t)v12;
          v14 = v11[3];
          v15 = sub_1000273EC(a3 - (_QWORD)v12);
          v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("detected pending hang in %@, duration %.2f ms"), v14, *(_QWORD *)&v15, (_QWORD)v21));

          v9 = v13;
          v7 = (void *)v16;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v9 = -1;
  }

  os_unfair_lock_unlock(&stru_10006032C);
  if (v7)
  {
    v17 = sub_100024FF4();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "getEarliestPendingHangStartTime: %@", buf, 0xCu);
    }

  }
  if (v9 == -1)
    v19 = 0;
  else
    v19 = v9;

  return v19;
}

+ (void)checkForHUDTimeouts:(unint64_t)a3
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

  os_unfair_lock_lock(&stru_10006032C);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)qword_100060280;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "checkEventsForHUDUpdate:", a3, (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&stru_10006032C);
}

+ (void)stopWatchingPid:(int)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  os_unfair_lock_lock(&stru_10006032C);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)qword_100060280;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (*(_DWORD *)(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i) + 56) == a3)
        {
          objc_msgSend((id)qword_100060280, "removeObject:", (_QWORD)v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(&stru_10006032C);
}

+ (void)stopWatchingAllPids
{
  os_unfair_lock_lock(&stru_10006032C);
  objc_msgSend((id)qword_100060280, "removeAllObjects");
  os_unfair_lock_unlock(&stru_10006032C);
}

+ (id)processForPid:(int)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _DWORD *v9;
  _DWORD *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  os_unfair_lock_lock(&stru_10006032C);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)qword_100060280;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_DWORD **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        if (v9[14] == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  os_unfair_lock_unlock(&stru_10006032C);
  return v10;
}

+ (id)startWatchingPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6
{
  uint64_t v9;
  uint64_t v10;
  HTProcessInfo *v11;
  id v12;
  NSObject *v13;
  HTProcessInfo *v14;
  HTProcessInfo *v15;
  int v17;
  HTProcessInfo *v18;

  v9 = *(_QWORD *)&a3;
  v10 = objc_claimAutoreleasedReturnValue(+[HTProcessInfo processForPid:](HTProcessInfo, "processForPid:"));
  if (v10)
  {
    v11 = (HTProcessInfo *)v10;
    v12 = sub_100024FF4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WARNING: %{public}@ was already being watched.", (uint8_t *)&v17, 0xCu);
    }

    v14 = 0;
  }
  else
  {
    v15 = -[HTProcessInfo initWithPid:sharedMem:length:bundleID:]([HTProcessInfo alloc], "initWithPid:sharedMem:length:bundleID:", v9, a4, a5, a6);
    if (v15)
    {
      os_unfair_lock_lock(&stru_10006032C);
      objc_msgSend((id)qword_100060280, "addObject:", v15);
      os_unfair_lock_unlock(&stru_10006032C);
    }
    v11 = v15;
    v14 = v11;
  }

  return v14;
}

+ (BOOL)shouldSaveFenceHangLogs
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  _BYTE *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "isInternal");

  if ((v3 & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    os_unfair_lock_lock(&stru_10006032C);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (id)qword_100060280;
    v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v5);
          v8 = *(_BYTE **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v8, "isInForeground", (_QWORD)v10) && v8[72])
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }
        v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_14:

    os_unfair_lock_unlock(&stru_10006032C);
  }
  return (char)v4;
}

+ (BOOL)isAnyThirdPartyDeveloperProcessForeground
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  os_unfair_lock_lock(&stru_10006032C);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (id)qword_100060280;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isInForeground", (_QWORD)v8)
          && (objc_msgSend(v6, "isDeveloperApp") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  os_unfair_lock_unlock(&stru_10006032C);
  return (char)v3;
}

- (BOOL)isInForeground
{
  const char *v3;
  const char *v4;
  NSUInteger v5;
  $A04E4E12E95AA3C9EB1FA918F18040EE *shmem_region;
  uint64_t var1;
  size_t v8;
  const char *var12;
  unsigned int v10;

  v3 = -[NSString UTF8String](self->processBundleID, "UTF8String");
  if (v3)
  {
    v4 = v3;
    v5 = -[NSString lengthOfBytesUsingEncoding:](self->processBundleID, "lengthOfBytesUsingEncoding:", 4);
    shmem_region = self->shmem_region;
    var1 = shmem_region->var1;
    if ((_DWORD)var1)
    {
      v8 = v5;
      var12 = shmem_region->var2[0].var12;
      while (strncmp(v4, var12, v8))
      {
        var12 += 384;
        if (!--var1)
          goto LABEL_6;
      }
      v10 = atomic_load((unsigned int *)var12 - 23);
      LOBYTE(v3) = v10 == 0;
    }
    else
    {
LABEL_6:
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (HTProcessInfo)initWithPid:(int)a3 sharedMem:(void *)a4 length:(unint64_t)a5 bundleID:(const char *)a6
{
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  NSObject *v19;
  HTProcessInfo *v20;
  HTProcessInfo *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  NSString *processBundleID;
  id v27;
  uint64_t v28;
  BOOL v29;
  char v30;
  id v31;
  int v32;
  HTProcessInfo *v33;
  char v35;
  dispatch_source_t v36;
  OS_dispatch_source *appExitSource;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  unint64_t processPath;
  int pid;
  _QWORD v45[5];
  int v46;
  objc_super v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  uint64_t v51;

  v11 = sub_100018DA4(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (!v12)
  {
    v18 = sub_100024FF4();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = a3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unable to identify process name of pid %d", buf, 8u);
    }

    goto LABEL_26;
  }
  if (a5 >> 3 <= 0x204)
  {
    v13 = sub_100024FF4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v49 = a5;
      v50 = 2048;
      v51 = 4136;
      v15 = "Shared memory region smaller than expected: %zu < %zu";
      v16 = v14;
      v17 = 22;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (*(_DWORD *)a4 != 7)
  {
    v31 = sub_100024FF4();
    v14 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(_DWORD *)a4;
      *(_DWORD *)buf = 67109120;
      LODWORD(v49) = v32;
      v15 = "Client is not vending the current protocol version: %u";
      v16 = v14;
      v17 = 8;
      goto LABEL_24;
    }
LABEL_25:

    munmap(a4, a5);
LABEL_26:
    v33 = 0;
    goto LABEL_27;
  }
  v47.receiver = self;
  v47.super_class = (Class)HTProcessInfo;
  v20 = -[HTProcessInfo init](&v47, "init");
  v21 = v20;
  if (v20)
  {
    v20->pid = a3;
    v20->shmem_length = a5;
    v20->shmem_region = ($A04E4E12E95AA3C9EB1FA918F18040EE *)a4;
    objc_storeStrong((id *)&v20->processPath, v12);
    v22 = objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](v21->processPath, "lastPathComponent"));
    v23 = (void *)v22;
    if (v22)
      v24 = (__CFString *)v22;
    else
      v24 = CFSTR("[Unknown]");
    objc_storeStrong((id *)&v21->processName, v24);

    v25 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a6));
    processBundleID = v21->processBundleID;
    v21->processBundleID = (NSString *)v25;

    v27 = -[NSString rangeOfString:options:](v21->processBundleID, "rangeOfString:options:", CFSTR("com.apple."), 1);
    if (v28)
      v29 = v27 == 0;
    else
      v29 = 0;
    v30 = v29;
    v21->isFirstPartyApp = v30;
    if (v29)
      v35 = sub_10001744C(v21->processBundleID);
    else
      v35 = 0;
    v21->shouldDisableProcess = v35;
    v21->shouldSaveHangLogs = -[HTProcessInfo checkShouldSaveHangLogs](v21, "checkShouldSaveHangLogs");
    v36 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, (dispatch_queue_t)qword_100060538);
    appExitSource = v21->appExitSource;
    v21->appExitSource = (OS_dispatch_source *)v36;

    v38 = v21->appExitSource;
    if (v38)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10001B018;
      v45[3] = &unk_10004DCE8;
      v46 = a3;
      v45[4] = v21;
      dispatch_source_set_event_handler(v38, v45);
      dispatch_resume((dispatch_object_t)v21->appExitSource);
    }
    else
    {
      v39 = sub_100024FF4();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v49) = a3;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Unable to setup up dispatch source to monitor PROC_EXIT for new proc %u", buf, 8u);
      }

    }
    v41 = sub_100024FF4();
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      processPath = (unint64_t)v21->processPath;
      pid = v21->pid;
      *(_DWORD *)buf = 138543618;
      v49 = processPath;
      v50 = 1024;
      LODWORD(v51) = pid;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "New proc: %{public}@(%u)", buf, 0x12u);
    }

  }
  self = v21;
  v33 = self;
LABEL_27:

  return v33;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  if (objc_msgSend(v3, "thirdPartyDevHangHUDEnabled"))
    v4 = -[HTProcessInfo isDeveloperApp](self, "isDeveloperApp");
  else
    v4 = 0;

  return v4;
}

- (id)checkEventsForTimeouts:(unint64_t)a3 withType:(int64_t)a4
{
  NSObject *v4;
  $A04E4E12E95AA3C9EB1FA918F18040EE *shmem_region;
  unint64_t v9;
  double v10;
  uint64_t v11;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  HTTimeoutHangInfo *v17;
  id v19;
  NSObject *v20;
  __CFString *v21;
  NSString *v22;
  NSString *processBundleID;
  int v24;
  id v25;
  _BOOL4 v26;
  __CFString *v27;
  NSString *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  NSString *v33;
  id v34;
  void *v35;
  __CFString *v36;
  NSString *v37;
  char *v38;
  char *v39;
  NSString *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  __CFString *v45;
  NSString *v46;
  NSString *v47;
  void *v48;
  id v49;
  HTTimeoutHangInfo *v50;
  void *v51;
  uint64_t v52;
  _BOOL8 v53;
  const __CFString *v54;
  _BYTE *v55;
  int v56;
  void *v57;
  double v58;
  id v59;
  NSObject *v60;
  const __CFString *v61;
  _BOOL4 isFirstPartyApp;
  void *v63;
  void *v64;
  id v65;
  HTTimeoutHangInfo *v66;
  void *v67;
  char *v68;
  uint64_t v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  NSString *v75;
  _QWORD v76[7];
  _QWORD v77[7];
  _QWORD v78[7];
  uint8_t buf[4];
  NSString *v80;
  __int16 v81;
  double v82;
  __int16 v83;
  unint64_t v84;

  shmem_region = self->shmem_region;
  if (!shmem_region->var1)
    goto LABEL_11;
  v9 = 0;
  v10 = (double)a3;
  v11 = 380;
  while (1)
  {
    if (!atomic_load((unsigned int *)((char *)shmem_region + v11 - 348)))
    {
      v13 = *(_QWORD *)((char *)shmem_region + v11 - 372);
      v14 = sub_1000273EC((unint64_t)(v10 - (double)v13));
      v15 = v14;
      if (a4 == 2)
      {
        v4 = objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v16 = (double)(unint64_t)-[NSObject runloopHangTimeoutDurationMSec](v4, "runloopHangTimeoutDurationMSec");

        if (v15 <= v16)
          goto LABEL_10;
      }
      else if (a4 != 8 || v14 <= 250.0)
      {
        goto LABEL_10;
      }
      if ((sub_100028A38(v13, a3, (uint64_t)self->shmem_region->var3, 0) & 1) == 0)
        break;
    }
LABEL_10:
    ++v9;
    shmem_region = self->shmem_region;
    v11 += 384;
    if (v9 >= shmem_region->var1)
      goto LABEL_11;
  }
  *(_QWORD *)((char *)shmem_region + v11 - 372) = -1;
  if (*((_BYTE *)&shmem_region->var0 + v11))
  {
    *((_BYTE *)&shmem_region->var0 + v11) = 0;
    v19 = sub_100024FF4();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = sub_100019D58(a4);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue(v21);
      processBundleID = self->processBundleID;
      *(_DWORD *)buf = 138543874;
      v80 = v22;
      v81 = 2114;
      v82 = *(double *)&processBundleID;
      v83 = 2048;
      v84 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Hang %{public}@ detected for bundleid %{public}@ for already reported user switched away hang, startTime %llu", buf, 0x20u);

    }
    goto LABEL_11;
  }
  if (!sub_100019AA8(self->pid))
    goto LABEL_25;
  v24 = strncmp((const char *)shmem_region + v11 - 256, "com.apple.HangTracer.HangTracerTests.testbundleid", 0x100uLL);
  v25 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v25);
  v26 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v24)
  {
    if (v26)
    {
      v36 = sub_100019D58(a4);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue(v36);
      *(_DWORD *)buf = 138543362;
      v80 = v37;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Hang %{public}@ detected: xctest with debugger attached will still be tracked as non-debugger hang", buf, 0xCu);

    }
LABEL_25:
    if (a4 == 2)
    {
      v38 = (char *)shmem_region + v11;
      kdebug_trace(606208012, v13, a3, *(_QWORD *)(v38 - 332), 0);
      v39 = v38 - 320;
      j__ADClientPushValueForDistributionKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.ht_always_on.%s.%@"), v38 - 320, self->processBundleID), v15);
      v40 = self->processBundleID;
      v41 = sub_1000198D4();
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      sub_100019944(CFSTR("Timed Out Runloop Hang"), v40, v13, a3, v42);

      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_10001BA78;
      v77[3] = &unk_10004DD10;
      v77[4] = self;
      v77[5] = 2;
      *(double *)&v77[6] = v15;
      AnalyticsSendEventLazy(off_10005F828, v77);
      v43 = sub_100024FF4();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = sub_100019D58(2uLL);
        v46 = (NSString *)objc_claimAutoreleasedReturnValue(v45);
        v47 = self->processBundleID;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v49 = objc_msgSend(v48, "runloopHangTimeoutDurationMSec");
        *(_DWORD *)buf = 138543874;
        v80 = v46;
        v81 = 2114;
        v82 = *(double *)&v47;
        v39 = v38 - 320;
        v83 = 2048;
        v84 = (unint64_t)v49;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Hang %{public}@ detected, %{public}@ hang is over timeout threshold of %llu exceeded => capturing hang log", buf, 0x20u);

      }
      v50 = [HTTimeoutHangInfo alloc];
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v39));
      v52 = *(_QWORD *)(v38 - 332);
      v53 = *(v38 - 344) != 0;
      LOBYTE(v73) = 0;
      LOBYTE(v71) = -[HTProcessInfo isThirdPartyDevSupportModeHang](self, "isThirdPartyDevSupportModeHang");
      v17 = -[HTTimeoutHangInfo initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:](v50, "initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:", v51, v52, v13, a3, v53, 2, 0, v71, self, v73);

      v54 = CFSTR("com.apple.hangtracer.DaemonTimeout.HangCount");
      goto LABEL_48;
    }
    j__ADClientPushValueForDistributionKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.ht_app_exit_hang.%s.%s"), (char *)shmem_region + v11 - 320, (char *)shmem_region + v11 - 256), v15);
    v55 = (char *)shmem_region + v11 - 342;
    v56 = *v55;
    if (!*v55)
      goto LABEL_35;
    v4 = objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    if (v15 > (double)(unint64_t)-[NSObject runloopHangDurationThresholdMSec](v4, "runloopHangDurationThresholdMSec"))
    {

LABEL_38:
      v59 = sub_100024FF4();
      v60 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = CFSTR("first party");
        isFirstPartyApp = self->isFirstPartyApp;
        if (!self->isFirstPartyApp)
          v61 = CFSTR("third party");
        v74 = *(double *)&v61;
        v75 = self->processBundleID;
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v64 = v63;
        if (isFirstPartyApp)
          v65 = objc_msgSend(v63, "runloopHangDurationThresholdMSec");
        else
          v65 = objc_msgSend(v63, "runloopHangThirdPartyDurationThresholdMSec");
        *(_DWORD *)buf = 138543874;
        v80 = v75;
        v81 = 2112;
        v82 = v74;
        v83 = 2048;
        v84 = (unint64_t)v65;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Hang on App Exit detected, %{public}@ hang is over %@ log threshold of %llu exceeded => capturing hang log", buf, 0x20u);

      }
      v66 = [HTTimeoutHangInfo alloc];
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", (char *)shmem_region + v11 - 320));
      v68 = (char *)shmem_region + v11;
      v69 = *(_QWORD *)((char *)shmem_region + v11 - 332);
      v70 = *(v68 - 344) != 0;
      LOBYTE(v73) = 0;
      LOBYTE(v72) = -[HTProcessInfo isThirdPartyDevSupportModeHang](self, "isThirdPartyDevSupportModeHang");
      v17 = -[HTTimeoutHangInfo initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:](v66, "initWithServiceName:threadID:startTime:endTime:saveTailspin:subType:userActionData:isThirdPartyDevSupportModeHang:processInfo:captureMicroHang:", v67, v69, v13, a3, v70, 8, 0, v72, self, v73);

      j__ADClientAddValueForScalarKey(CFSTR("com.apple.ht_app_exit_hang.log_capture"), 1);
      goto LABEL_47;
    }
    if (*v55)
    {

    }
    else
    {
LABEL_35:
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v58 = (double)(unint64_t)objc_msgSend(v57, "runloopHangThirdPartyDurationThresholdMSec");

      if (v56)
      if (v15 > v58)
        goto LABEL_38;
    }
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10001BB7C;
    v76[3] = &unk_10004DD10;
    v76[4] = self;
    v76[5] = 8;
    *(double *)&v76[6] = v15;
    AnalyticsSendEventLazy(off_10005F828, v76);
    v17 = 0;
LABEL_47:
    v54 = CFSTR("com.apple.ht_app_exit_hang.count");
LABEL_48:
    j__ADClientAddValueForScalarKey(v54, 1);
    return v17;
  }
  if (v26)
  {
    v27 = sub_100019D58(a4);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138543618;
    v80 = v28;
    v81 = 2048;
    v82 = v15 / 1000.0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Hang %{public}@ detected: %.2fs (debugger attached, not reporting)", buf, 0x16u);

  }
  v29 = sub_100019D58(a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  j__ADClientPushValueForDistributionKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.ht_debugger_attached.%@.%s"), v30, (char *)shmem_region + v11 - 256), v15);

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_10001B974;
  v78[3] = &unk_10004DD10;
  v78[4] = self;
  v78[5] = a4;
  *(double *)&v78[6] = v15;
  AnalyticsSendEventLazy(off_10005F828, v78);
  v31 = sub_100019D58(a4);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = self->processBundleID;
  v34 = sub_1000198D4();
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  sub_100019944(v32, v33, v13, a3, v35);

LABEL_11:
  v17 = 0;
  return v17;
}

- (void)checkEventsForHUDUpdate:(unint64_t)a3
{
  $A04E4E12E95AA3C9EB1FA918F18040EE *shmem_region;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t *v9;
  double v10;

  if (-[HTProcessInfo shouldDisplayNonFenceHangToHUD](self, "shouldDisplayNonFenceHangToHUD"))
  {
    shmem_region = self->shmem_region;
    if (shmem_region->var1)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = (char *)shmem_region + v6 * 384;
        v9 = (uint64_t *)&shmem_region->var2[v6];
        v10 = 0.0;
        if (sub_100019F70(a3, (uint64_t)v9, &v10))
          sub_100023F4C((uint64_t)(v8 + 124), a3, *v9, 0x7FFFFFFFFFFFFFFFLL, 0, 0, v10);
        ++v7;
        shmem_region = self->shmem_region;
        ++v6;
      }
      while (v7 < shmem_region->var1);
    }
  }
}

+ (id)displayStateArray
{
  void *v2;
  unint64_t v3;
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = dword_100060328;
  v4 = 10;
  do
  {
    v5 = (char *)&unk_100060288 + 16 * v3;
    v6 = *(_QWORD *)v5;
    if (*(_QWORD *)v5)
    {
      v7 = *((unsigned int *)v5 + 2);
      v8 = sub_100024FF4();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        v14 = v6;
        v15 = 1024;
        v16 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "timestamp: %llu, status: %d", buf, 0x12u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v6));
      objc_msgSend(v2, "addObject:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
      objc_msgSend(v2, "addObject:", v11);

    }
    v3 = (v3 + 1) % 0xA;
    --v4;
  }
  while (v4);
  return v2;
}

+ (id)recentAppsDict
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];

  v2 = sub_100024FF4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10002EA9C(v3);

  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = mach_absolute_time();
  os_unfair_lock_lock(&stru_10006032C);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (id)qword_100060280;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend((id)v11, "startTimeWithinMS:ofCurrentTime:", 10000, v5))
        {
          v12 = *(_QWORD *)(v11 + 32);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i"), *(unsigned int *)(v11 + 56)));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

          v14 = sub_100024FF4();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = *(_DWORD *)(v11 + 56);
            v17 = *(_QWORD *)(v11 + 32);
            *(_DWORD *)buf = 67109378;
            v24 = v16;
            v25 = 2112;
            v26 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Found Recent App: pid=%i path=%@", buf, 0x12u);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&stru_10006032C);
  return v4;
}

- (BOOL)startTimeWithinMS:(unint64_t)a3 ofCurrentTime:(unint64_t)a4
{
  $A04E4E12E95AA3C9EB1FA918F18040EE *shmem_region;
  unint64_t v7;
  BOOL v8;
  double v9;
  uint64_t v10;

  shmem_region = self->shmem_region;
  if (!shmem_region->var1)
    return 0;
  v7 = 0;
  v8 = 0;
  v9 = (double)a3;
  v10 = 380;
  do
  {
    if (!*((_BYTE *)&shmem_region->var0 + v10)
      && sub_1000273EC(a4 - *(_QWORD *)((char *)shmem_region + v10 - 372)) < v9)
    {
      v8 = 1;
    }
    ++v7;
    shmem_region = self->shmem_region;
    v10 += 384;
  }
  while (v7 < shmem_region->var1);
  return v8;
}

- (void)recordHang:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subtype:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11
{
  void *v11;
  _BOOL4 v13;
  double v17;
  _BOOL4 isFirstPartyApp;
  _BOOL4 v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSString *processName;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  NSString *processBundleID;
  id v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  unsigned int v38;
  id v39;
  NSObject *v40;
  NSString *v41;
  void *v42;
  unsigned int v43;
  char v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  id v50;
  NSObject *v51;
  NSString *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  NSString *v59;
  id v60;
  NSObject *v61;
  NSString *v62;
  id v63;
  NSObject *v64;
  NSString *v65;
  char v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  HTHangInfo *v70;
  uint64_t pid;
  BOOL v72;
  NSString *v73;
  NSString *processPath;
  HTHangInfo *v75;
  double v76;
  uint64_t v77;
  id v79;
  id v80;
  _QWORD v81[7];
  uint8_t buf[4];
  unint64_t v83;
  __int16 v84;
  double v85;
  __int16 v86;
  id v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  double v91;

  v13 = a7;
  v80 = a3;
  v79 = a9;
  v17 = sub_1000273EC(a6 - a5);
  isFirstPartyApp = self->isFirstPartyApp;
  if (self->isFirstPartyApp)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    if (v17 > (double)(unint64_t)objc_msgSend(v11, "runloopHangDurationThresholdMSec"))
    {
      v19 = 1;
LABEL_8:

      goto LABEL_9;
    }
    if (self->isFirstPartyApp)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v19 = v17 > (double)(unint64_t)objc_msgSend(v20, "runloopHangThirdPartyDurationThresholdMSec");

  if (isFirstPartyApp)
    goto LABEL_8;
LABEL_9:
  if (a8 != 9 && (v19 || a11))
  {
    v21 = sub_100024FF4();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      processName = self->processName;
      v24 = sub_100019D58(a8);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      *(_DWORD *)buf = 138544386;
      v83 = (unint64_t)processName;
      v84 = 2048;
      v85 = v17 / 1000.0;
      v86 = 2114;
      v87 = v80;
      v88 = 2114;
      v89 = v25;
      v90 = 2048;
      v91 = (double)(unint64_t)objc_msgSend(v26, "runloopHangDurationThresholdMSec") / 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Hang detected %.2fs (%{public}@, %{public}@) duration > capture threshold %.2fs after accounting for assertion overlaps", buf, 0x34u);

    }
    if (a8 == 10)
    {
      v27 = sub_100024FF4();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = sub_100019D58(0xAuLL);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 134218242;
        v83 = a6;
        v84 = 2114;
        v85 = *(double *)&v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "hang endTime  %llu for hangsubType %{public}@", buf, 0x16u);

      }
    }
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10001C988;
    v81[3] = &unk_10004DD10;
    v81[4] = self;
    v81[5] = a8;
    *(double *)&v81[6] = v17;
    AnalyticsSendEventLazy(off_10005F828, v81);
    if (a8 != 8)
    {
      j__ADClientPushValueForDistributionKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.hangtracer.%@.%@"), v80, self->processBundleID), v17);
      v31 = sub_100019D58(a8);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      processBundleID = self->processBundleID;
      v34 = sub_100019864();
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      sub_100019944(v32, processBundleID, a5, a6, v35);

    }
    v36 = -[HTProcessInfo shouldDisplayNonFenceHangToHUD](self, "shouldDisplayNonFenceHangToHUD");
    if (v13)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v38 = objc_msgSend(v37, "htTailspinEnabled");

      if (!v38)
      {
        v57 = sub_100024FF4();
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = self->processName;
          *(_DWORD *)buf = 138543362;
          v83 = (unint64_t)v59;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@: HangTracer tailspin support is disabled, not saving a report!", buf, 0xCu);
        }

        v44 = 0;
        v45 = 5;
        goto LABEL_47;
      }
      if (!self->shouldSaveHangLogs)
      {
        v60 = sub_100024FF4();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = self->processName;
          *(_DWORD *)buf = 138543362;
          v83 = (unint64_t)v62;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: Tried to save tailspin, but shouldSaveHangLogs said NO", buf, 0xCu);
        }

        v44 = 0;
        v45 = 4;
        goto LABEL_47;
      }
      if (!sub_100028648())
      {
        v63 = sub_100024FF4();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          v65 = self->processName;
          *(_DWORD *)buf = 138543362;
          v83 = (unint64_t)v65;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}@: Tried to save tailspin, but tailspin support is not present on this device!", buf, 0xCu);
        }

        v44 = 0;
        v45 = 3;
        goto LABEL_47;
      }
      if (+[HTTailspin hasAppExceededGeneratedLogsCountForDuration:procName:isFirstPartyApp:](HTTailspin, "hasAppExceededGeneratedLogsCountForDuration:procName:isFirstPartyApp:", self->processName, self->isFirstPartyApp, v17))
      {
        v39 = sub_100024FF4();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = self->processName;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
          v43 = objc_msgSend(v42, "runLoopHangPerPeriodLogLimit");
          *(_DWORD *)buf = 138543618;
          v83 = (unint64_t)v41;
          v84 = 1024;
          LODWORD(v85) = v43;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ hit its Generated Log limit of %u for this reporting period. Not saving a report!", buf, 0x12u);

        }
        j__ADClientAddValueForScalarKey(CFSTR("com.apple.hangtracer.HTLogsMissedDueToProcessLimit.Total"), 1);
        j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.hangtracer.HTLogsMissedDueToProcessLimit.%@"), self->processName), 1);
        v44 = 0;
        v45 = 2;
        goto LABEL_47;
      }
      if (+[HTTailspin hasExceededDailyLimit:isFirstPartyApp:](HTTailspin, "hasExceededDailyLimit:isFirstPartyApp:", self->isFirstPartyApp, v17))
      {
        v45 = 1;
        j__ADClientAddValueForScalarKey(CFSTR("com.apple.hangtracer.HTLogsMissedDueToGlobalLimit.Total"), 1);
        j__ADClientAddValueForScalarKey(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.hangtracer.HTLogsMissedDueToGlobalLimit.%@"), self->processName), 1);
        v44 = 0;
        goto LABEL_47;
      }
      v44 = 1;
    }
    else
    {
      v44 = 0;
    }
    v45 = 11;
LABEL_47:
    v66 = v36 ^ 1;
    if (a8 == 10)
      v66 = 1;
    if ((v66 & 1) == 0)
    {
      v67 = -[NSString UTF8String](self->processBundleID, "UTF8String");
      v68 = mach_absolute_time();
      sub_100023F4C((uint64_t)v67, v68, a5, a6, v44, a8 == 2, v17);
    }
    if ((v44 & 1) != 0)
    {
      v48 = v80;
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@: timeout %.0fms"), v80, self->processName, *(_QWORD *)&v17));
      v70 = [HTHangInfo alloc];
      pid = self->pid;
      v72 = self->isFirstPartyApp;
      v73 = self->processName;
      processPath = self->processPath;
      v56 = v79;
      BYTE2(v77) = v36;
      BYTE1(v77) = a10;
      LOBYTE(v77) = v72;
      v75 = -[HTHangInfo initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:](v70, "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:", pid, a4, a5, a6, a6, 0, a8, v77, v80, v69, v73, processPath, v79);
      +[HTHangInfo addHang:](HTHangInfo, "addHang:", v75);
      +[HTHangInfo getHangWaitTimeout](HTHangInfo, "getHangWaitTimeout");
      if (v76 <= 0.0)
        +[HTTailspin collectTailspinAndUpdateTelemtry](HTTailspin, "collectTailspinAndUpdateTelemtry");
      else
        sub_10000DBC4(v76);

    }
    else
    {
      +[HTTailspin notifyHTTailSpinResult:failReason:hangSubType:htBugType:](HTTailspin, "notifyHTTailSpinResult:failReason:hangSubType:htBugType:", 0, v45, a8, sub_100019DBC(self->isFirstPartyApp, a10, v17));
      v56 = v79;
      v48 = v80;
    }
    goto LABEL_57;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](HTHangInfo, "allHangs"));
  v47 = objc_msgSend(v46, "count");

  v48 = v80;
  if (v47)
  {
    +[HTHangInfo getHangWaitTimeout](HTHangInfo, "getHangWaitTimeout");
    if (v49 <= 0.0)
      +[HTTailspin collectTailspinAndUpdateTelemtry](HTTailspin, "collectTailspinAndUpdateTelemtry");
    else
      sub_10000DBC4(v49);
  }
  v50 = sub_100024FF4();
  v51 = objc_claimAutoreleasedReturnValue(v50);
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = self->processName;
    v53 = sub_100019D58(a8);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    *(_DWORD *)buf = 138544386;
    v83 = (unint64_t)v52;
    v84 = 2048;
    v85 = v17 / 1000.0;
    v86 = 2114;
    v87 = v80;
    v88 = 2114;
    v89 = v54;
    v90 = 2048;
    v91 = (double)(unint64_t)objc_msgSend(v55, "runloopHangDurationThresholdMSec") / 1000.0;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@: Hang detected %.2fs (%{public}@, %{public}@) duration < capture threshold %.2fs after accounting for assertion overlaps, not capturing tailspin for it", buf, 0x34u);

  }
  v56 = v79;
LABEL_57:

}

+ (void)recordFenceHang:(id)a3 startTime:(unint64_t)a4 endTime:(unint64_t)a5 reportedTime:(unint64_t)a6 blownFenceId:(unint64_t)a7 saveTailspin:(BOOL)a8 subtype:(int64_t)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 captureMicroHang:(BOOL)a11
{
  id v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  id v22;
  NSObject *v23;
  void *v24;
  unsigned int v25;
  double v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  void *v33;
  HTHangInfo *v34;
  double v35;
  uint64_t v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  id v40;

  v15 = a3;
  v16 = sub_1000273EC(a5 - a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v18 = objc_msgSend(v17, "runloopHangDurationThresholdMSec");

  if (a9 != 9 && (v16 > (double)(unint64_t)v18 || a11))
  {
    v22 = sub_100024FF4();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v38 = v16 / 1000.0;
      v39 = 2114;
      v40 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Fence-hang: Hang detected %.2fs (%{public}@) > capture threshold", buf, 0x16u);
    }

    j__ADClientAddValueForScalarKey(CFSTR("com.apple.hangtracer.HTLogsFenceHang.PreTailspin"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v25 = objc_msgSend(v24, "shouldDisplayFenceHangToHUD");

    if (v25)
    {
      v26 = sub_1000273EC(a5 - a4 - 24000000);
      v27 = mach_absolute_time();
      sub_100023F4C((uint64_t)"Fence Hang", v27, a4 + 12000000, a5 - 12000000, 1, a9 == 2, v26);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v29 = objc_msgSend(v28, "htTailspinEnabled");

    if (v29)
    {
      if (+[HTProcessInfo shouldSaveFenceHangLogs](HTProcessInfo, "shouldSaveFenceHangLogs"))
      {
        if (sub_100028648())
        {
          if (!+[HTTailspin hasExceededDailyFenceLogLimit](HTTailspin, "hasExceededDailyFenceLogLimit"))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@: timeout %.0fms"), v15, CFSTR("AppTBD"), *(_QWORD *)&v16));
            BYTE2(v36) = v25;
            BYTE1(v36) = a10;
            LOBYTE(v36) = 0;
            v34 = -[HTHangInfo initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:]([HTHangInfo alloc], "initWithPid:threadID:startTime:endTime:reportedTime:blownFenceID:hangSubtype:isFirstPartyApp:isThirdPartyDevSupportModeHang:displayedInHUD:serviceName:reason:processName:processPath:userActionData:", 0, 0, a4, a5, a6, a7, a9, v36, v15, v33, CFSTR("AppTBD"), &stru_10004F0D8, 0);
            +[HTHangInfo addHang:](HTHangInfo, "addHang:", v34);
            +[HTHangInfo getHangWaitTimeout](HTHangInfo, "getHangWaitTimeout");
            if (v35 <= 0.0)
              +[HTTailspin collectTailspinAndUpdateTelemtry](HTTailspin, "collectTailspinAndUpdateTelemtry");
            else
              sub_10000DBC4(v35);

            goto LABEL_24;
          }
          v30 = 1;
        }
        else
        {
          v30 = 3;
        }
      }
      else
      {
        v30 = 14;
      }
    }
    else
    {
      v30 = 5;
    }
    +[HTTailspin notifyHTTailSpinResult:failReason:hangSubType:htBugType:](HTTailspin, "notifyHTTailSpinResult:failReason:hangSubType:htBugType:", 0, v30, a9, 0);
    goto LABEL_24;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[HTHangInfo allHangs](HTHangInfo, "allHangs"));
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    +[HTHangInfo getHangWaitTimeout](HTHangInfo, "getHangWaitTimeout");
    if (v21 <= 0.0)
      +[HTTailspin collectTailspinAndUpdateTelemtry](HTTailspin, "collectTailspinAndUpdateTelemtry");
    else
      sub_10000DBC4(v21);
  }
  v31 = sub_100024FF4();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v38 = v16 / 1000.0;
    v39 = 2114;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Fence-hang: Hang detected %.2fs (%{public}@), duration < capture threshold after accounting for assertion overlaps, not capturing tailspin for it", buf, 0x16u);
  }

LABEL_24:
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%d)"), self->processName, self->pid);
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $A04E4E12E95AA3C9EB1FA918F18040EE *shmem_region;
  NSObject *appExitSource;
  objc_super v13;

  v3 = sub_100024FF4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10002EADC((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  shmem_region = self->shmem_region;
  if (shmem_region)
  {
    munmap(shmem_region, self->shmem_length);
    self->shmem_region = 0;
  }
  appExitSource = self->appExitSource;
  if (appExitSource)
    dispatch_source_cancel(appExitSource);
  v13.receiver = self;
  v13.super_class = (Class)HTProcessInfo;
  -[HTProcessInfo dealloc](&v13, "dealloc");
}

- (id)getApplicationByBundleId:(id)a3
{
  LSApplicationRecord *appInfo;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString *processBundleID;
  LSApplicationRecord *v15;
  id v16;
  LSApplicationRecord *v17;
  id v18;
  NSObject *v19;
  NSString *v20;
  LSApplicationRecord *v21;
  id v23;
  uint8_t buf[4];
  NSString *v25;
  __int16 v26;
  id v27;

  appInfo = self->appInfo;
  if (!appInfo)
  {
    v5 = sub_100024FF4();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_10002EB48((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);

    v13 = objc_alloc((Class)LSApplicationRecord);
    processBundleID = self->processBundleID;
    v23 = 0;
    v15 = (LSApplicationRecord *)objc_msgSend(v13, "initWithBundleIdentifier:allowPlaceholder:error:", processBundleID, 0, &v23);
    v16 = v23;
    v17 = self->appInfo;
    self->appInfo = v15;

    if (v16)
    {
      v18 = sub_100024FF4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->processBundleID;
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "There was an error querying the LS database for bundle id %{public}@: %@", buf, 0x16u);
      }

      v21 = self->appInfo;
      self->appInfo = 0;

    }
    appInfo = self->appInfo;
  }
  return appInfo;
}

- (BOOL)isDeveloperApp
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;

  if (self->isFirstPartyApp)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v5 = objc_msgSend(v4, "thirdPartyIncludeNonDevelopmentApps");

  if ((v5 & 1) != 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HTProcessInfo getApplicationByBundleId:](self, "getApplicationByBundleId:", self->processBundleID));
  v7 = objc_msgSend(v6, "isProfileValidated");

  return v7;
}

- (BOOL)checkShouldSaveHangLogs
{
  unsigned int v2;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  unsigned int v15;

  if (self->shouldDisableProcess)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "isInternal");

    if ((v5 & 1) != 0)
    {
      LOBYTE(v2) = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
      v13 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getHighestPrioritySettingValue:matchingSelector:contextPrefixOut:", CFSTR("HangTracerEnabled"), "BOOLValue", &v13));
      v8 = v13;

      if (v7)
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("HTThirdPartyDevSupport"))
          && !-[HTProcessInfo isDeveloperApp](self, "isDeveloperApp"))
        {
          LOBYTE(v2) = 0;
        }
        else
        {
          LOBYTE(v2) = objc_msgSend(v7, "BOOLValue");
        }
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
        v2 = objc_msgSend(v9, "hangtracerDaemonEnabled");

        v10 = sub_100024FF4();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v15 = v2;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No overriden settings found to be enabling or disabling hangtracing. Using default of %{BOOL}d.", buf, 8u);
        }

      }
    }
  }
  return v2;
}

- (BOOL)shouldDisplayNonFenceHangToHUD
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v7;
  unsigned int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  if ((objc_msgSend(v3, "isInternal") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v5 = objc_msgSend(v4, "hudEnabled");

    if (v5)
      return !self->shouldDisableProcess;
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v8 = objc_msgSend(v7, "thirdPartyDevHangHUDEnabled");

  return v8 && -[HTProcessInfo isDeveloperApp](self, "isDeveloperApp");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->appInfo, 0);
  objc_storeStrong((id *)&self->appExitSource, 0);
  objc_storeStrong((id *)&self->processBundleID, 0);
  objc_storeStrong((id *)&self->processPath, 0);
  objc_storeStrong((id *)&self->processName, 0);
}

@end
