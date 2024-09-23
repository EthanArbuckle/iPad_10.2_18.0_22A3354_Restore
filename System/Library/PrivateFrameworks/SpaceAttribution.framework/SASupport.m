@implementation SASupport

+ (BOOL)isItemMountedOnSystemVolume:(id)a3
{
  id v3;
  NSObject *v4;
  statfs v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(&v6, 0, 512);
  v3 = objc_retainAutorelease(a3);
  if (statfs((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0),
         &v6))
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SASupport isItemMountedOnSystemVolume:].cold.1();

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE1(v6.f_flags) >> 6) & 1;
  }

  return (char)v4;
}

+ (int)enableDirStatsForPath:(id)a3
{
  int v3;
  NSObject *v4;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6[0] = 0x100000001;
  v6[1] = 28;
  if (!fsctl((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), 0xC1104A71uLL, v6, 1u))
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[SASupport enableDirStatsForPath:].cold.1();
    v3 = 0;
    goto LABEL_8;
  }
  v3 = *__error();
  if (v3 != 2)
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SASupport enableDirStatsForPath:].cold.2();
LABEL_8:

  }
  return v3;
}

+ (int)setSpeculativeHierarchy:(id)a3 purgeable:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  NSObject *v9;
  uint64_t v11;

  v4 = a4;
  v5 = a3;
  v11 = 1;
  if (!v4)
    WORD2(v11) = 1;
  SALog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[SASupport setSpeculativeHierarchy:purgeable:].cold.2(v5, v4, v6);

  v7 = objc_retainAutorelease(v5);
  if (fsctl((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0xC0084A7EuLL, &v11, 1u))
  {
    v8 = *__error();
    SALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[SASupport setSpeculativeHierarchy:purgeable:].cold.1();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (int)clearSpeculativeHierarchyForPath:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  NSObject *v7;
  uint64_t v9;

  v3 = a3;
  v9 = 0;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SASupport clearSpeculativeHierarchyForPath:].cold.2(v3, v4);

  v5 = objc_retainAutorelease(v3);
  if (fsctl((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0xC0084A7EuLL, &v9, 0))
  {
    v6 = *__error();
    SALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SASupport clearSpeculativeHierarchyForPath:].cold.1();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getPathOfiNode:(unint64_t)a3 inVolume:(statfs *)a4
{
  void *v4;
  char v6[1024];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (fsgetpath(v6, 0x400uLL, &a4->f_fsid, a3) < 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v6, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (unint64_t)getDirStatKeyForOriginID:(unint64_t)a3 ofMount:(char *)a4
{
  NSObject *v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v6[2] = 0;
  v7 = 0u;
  v6[0] = 1;
  v6[1] = 3;
  v6[3] = a3;
  if (!fsctl(a4, 0xC1104A71uLL, v6, 1u))
    return v7;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[SASupport getDirStatKeyForOriginID:ofMount:].cold.1();

  return 0;
}

+ (unint64_t)getINodeForDirStatKey:(unint64_t)a3 ofMount:(char *)a4
{
  NSObject *v4;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v7 = 0u;
  v6[0] = 1;
  v6[1] = 33;
  v8 = a3;
  if (!fsctl(a4, 0xC1104A71uLL, v6, 0))
    return *((_QWORD *)&v7 + 1);
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[SASupport getINodeForDirStatKey:ofMount:].cold.1();

  return 0;
}

+ (int)getDirStatInfoForPath:(id)a3 info:(id *)a4
{
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int8x16_t v16[13];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  memset(v16, 0, sizeof(v16));
  v13 = 0u;
  v14 = 0u;
  v11 = 1;
  v12 = 1;
  v5 = objc_retainAutorelease(a3);
  if (fsctl((const char *)objc_msgSend(v5, "fileSystemRepresentation", 1), 0xC1104A71uLL, &v11, 1u))
  {
    v6 = *__error();
    if (v6 != 45)
    {
      SALog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[SASupport getDirStatInfoForPath:info:].cold.4();

    }
    goto LABEL_18;
  }
  if ((v12 & 4) == 0)
  {
    SALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SASupport getDirStatInfoForPath:info:].cold.1();
LABEL_17:

    v6 = 93;
    goto LABEL_18;
  }
  if ((~(_BYTE)v13 & 3) != 0)
  {
    SALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SASupport getDirStatInfoForPath:info:].cold.3();
    goto LABEL_17;
  }
  if ((v12 & 0x10) != 0)
  {
    SALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SASupport getDirStatInfoForPath:info:].cold.2();
    goto LABEL_17;
  }
  v6 = 0;
  if (a4)
  {
    v9 = v14;
    a4->var0 = v16[0].i64[0];
    *(int8x16_t *)&a4->var1 = vextq_s8(*(int8x16_t *)((char *)v16 + 8), *(int8x16_t *)((char *)v16 + 8), 8uLL);
    a4->var3 = v9;
  }
LABEL_18:

  return v6;
}

+ (int)enableDirStatInfoForPath:(id)a3 andGetInfo:(id *)a4
{
  id v5;
  int v6;

  v5 = a3;
  v6 = +[SASupport enableDirStatsForPath:](SASupport, "enableDirStatsForPath:", v5);
  if (!v6)
    v6 = +[SASupport getDirStatInfoForPath:info:](SASupport, "getDirStatInfoForPath:info:", v5, a4);

  return v6;
}

+ (BOOL)targetDeviceIsIpad
{
  if (targetDeviceIsIpad_onceToken != -1)
    dispatch_once(&targetDeviceIsIpad_onceToken, &__block_literal_global);
  return targetDeviceIsIpad_isiPad;
}

void __31__SASupport_targetDeviceIsIpad__block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  targetDeviceIsIpad_isiPad = objc_msgSend(v0, "intValue") == 3;

}

+ (BOOL)targetDeviceIsHomePod
{
  if (targetDeviceIsHomePod_onceToken != -1)
    dispatch_once(&targetDeviceIsHomePod_onceToken, &__block_literal_global_62);
  return targetDeviceIsHomePod_isHomePod;
}

void __34__SASupport_targetDeviceIsHomePod__block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  targetDeviceIsHomePod_isHomePod = objc_msgSend(v0, "isEqualToString:", CFSTR("HomePod"));

}

+ (void)markTimeStartForPhase:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (id)timesDict;
  objc_sync_enter(v4);
  if (!timesDict)
  {
    v5 = objc_opt_new();
    v6 = (void *)timesDict;
    timesDict = v5;

  }
  v7 = (void *)objc_opt_new();
  gettimeofday((timeval *)objc_msgSend(v7, "getTimeValAddr"), 0);
  objc_msgSend((id)timesDict, "setObject:forKeyedSubscript:", v7, v3);
  SALog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_2478E3000, v8, OS_LOG_TYPE_DEFAULT, "START: App Sizer %@", (uint8_t *)&v9, 0xCu);
  }

  objc_sync_exit(v4);
}

+ (void)markTimeEndForPhase:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t tv_usec;
  __darwin_time_t tv_sec;
  NSObject *v12;
  NSObject *v13;
  timeval v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (id)timesDict;
  objc_sync_enter(v4);
  objc_msgSend((id)timesDict, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)timesDict, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "timeVal");
    v9 = v8;

    v14.tv_sec = 0;
    *(_QWORD *)&v14.tv_usec = 0;
    gettimeofday(&v14, 0);
    tv_usec = v14.tv_usec;
    tv_sec = v14.tv_sec;
    SALog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2048;
      v18 = (float)((float)(1000000 * (tv_sec - v7) - v9 + tv_usec) / 1000000.0);
      _os_log_impl(&dword_2478E3000, v12, OS_LOG_TYPE_DEFAULT, "END: App Sizer %@ (%lf)", buf, 0x16u);
    }

    objc_msgSend((id)timesDict, "removeObjectForKey:", v3);
  }
  else
  {
    SALog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SASupport markTimeEndForPhase:].cold.1();

  }
  objc_sync_exit(v4);

}

+ (BOOL)volumeSupportsAttributionTags:(id)a3
{
  id v3;
  NSObject *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v9 = xmmword_2478F587C;
  v10 = 0;
  LODWORD(v8) = 0;
  v6 = 0u;
  v7 = 0u;
  v3 = objc_retainAutorelease(a3);
  if (getattrlist((const char *)objc_msgSend(v3, "UTF8String", 0, 0, 0, 0, v8), &v9, &v6, 0x24uLL, 0))
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SASupport volumeSupportsAttributionTags:].cold.1();

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE10(v7) >> 6) & 1;
  }

  return (char)v4;
}

+ (BOOL)volumeSupportsCloneMapping:(id)a3
{
  id v3;
  NSObject *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v9 = xmmword_2478F587C;
  v10 = 0;
  LODWORD(v8) = 0;
  v6 = 0u;
  v7 = 0u;
  v3 = objc_retainAutorelease(a3);
  if (getattrlist((const char *)objc_msgSend(v3, "UTF8String", 0, 0, 0, 0, v8), &v9, &v6, 0x24uLL, 0))
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SASupport volumeSupportsCloneMapping:].cold.1();

    LOBYTE(v4) = 0;
  }
  else
  {
    LODWORD(v4) = (BYTE7(v7) >> 2) & 1;
  }

  return (char)v4;
}

+ (id)getResolvedURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  id v10;
  __int128 v12;
  _BYTE v13[24];
  _DWORD v14[258];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "path"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    bzero(v13, 0x420uLL);
    objc_msgSend(v4, "path", xmmword_2478F5894, 0);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

    if (getattrlist(v7, &v12, v13, 0x420uLL, 0) < 0)
    {
      SALog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[SASupport getResolvedURL:].cold.1();
      v10 = 0;
    }
    else
    {
      if (!v14[1])
      {
        v10 = 0;
        goto LABEL_12;
      }
      v8 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)v14 + v14[0]);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = v4;
  }
LABEL_12:

  return v10;
}

+ (id)getURLMountPoint:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  __int128 v9;
  _BYTE v10[4];
  _DWORD v11[258];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  bzero(v10, 0x40CuLL);
  objc_msgSend(a3, "path", xmmword_2478F58AC, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");

  if (getattrlist(v5, &v9, v10, 0x40CuLL, 1u) < 0)
  {
    SALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SASupport getURLMountPoint:].cold.1();

    goto LABEL_7;
  }
  if (!v11[1])
  {
LABEL_7:
    v6 = 0;
    return v6;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (char *)v11 + v11[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

+ (BOOL)targetDeviceIsWatch
{
  if (targetDeviceIsWatch_onceToken != -1)
    dispatch_once(&targetDeviceIsWatch_onceToken, &__block_literal_global_68);
  return targetDeviceIsWatch_isWatch;
}

void __32__SASupport_targetDeviceIsWatch__block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  targetDeviceIsWatch_isWatch = objc_msgSend(v0, "intValue") == 6;

}

+ (void)getLSAppRecordForBundle:(id)a3 reply:(id)a4
{
  objc_class *v5;
  void (**v6)(id, id, void *);
  id v7;
  void *v8;
  id v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x24BDC1540];
  v6 = (void (**)(id, id, void *))a4;
  v7 = a3;
  v10 = 0;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, &v10);

  v9 = v10;
  v6[2](v6, v9, v8);

}

+ (id)getPathOfNodeID:(unint64_t)a3 FSid:(fsid *)a4
{
  void *v5;
  int v6;
  NSObject *v7;
  char v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (fsgetpath(v9, 0x400uLL, a4, a3) < 0)
  {
    v6 = *__error();
    SALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SASupport getPathOfNodeID:FSid:].cold.1(v6, a3, v7);

    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)getFSPurgeableDataOnVolumes:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *context;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v32 = (id)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v39;
    v4 = &unk_2518F7650;
    v5 = 0x2576C6000uLL;
    v6 = 0x24BDD1000uLL;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(obj);
        v29 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v7);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v4, "allKeys");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v35;
          do
          {
            v12 = 0;
            v30 = v10;
            do
            {
              if (*(_QWORD *)v35 != v11)
                objc_enumerationMutation(v31);
              v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12);
              context = (void *)MEMORY[0x249583724]();
              objc_msgSend(v4, "objectForKeyedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "longLongValue");

              v16 = objc_msgSend((id)(v5 + 3496), "getFSPurgeableOnVolume:purgeableUrgency:", v8, v15);
              objc_msgSend(v32, "valueForKey:", v8);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedLongLong:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKey:", v18, v13);
              }
              else
              {
                v19 = v11;
                v20 = v8;
                v21 = v4;
                v22 = (void *)MEMORY[0x24BDBCED8];
                objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedLongLong:", v16);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v22;
                v4 = v21;
                v8 = v20;
                v11 = v19;
                objc_msgSend(v24, "dictionaryWithObjectsAndKeys:", v23, v13, 0);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                v5 = 0x2576C6000;
                v6 = 0x24BDD1000;
                v10 = v30;
                objc_msgSend(v32, "setValue:forKey:", v18, v8);
              }

              objc_autoreleasePoolPop(context);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v10);
        }

        v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v28);
  }

  return v32;
}

+ (unint64_t)getFSPurgeableOnVolume:(id)a3 purgeableUrgency:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  int *v8;
  char *v9;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v11 = 0;
  v13 = 0u;
  v12 = a4;
  v5 = objc_retainAutorelease(a3);
  if (fsctl((const char *)objc_msgSend(v5, "fileSystemRepresentation", __PAIR128__(v12, 0), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 0xC0E84A70uLL,
         &v11,
         1u) < 0)
  {
    SALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 138412802;
      v28 = v5;
      v29 = 2048;
      v30 = a4;
      v31 = 2080;
      v32 = v9;
      _os_log_impl(&dword_2478E3000, v7, OS_LOG_TYPE_DEFAULT, "%@: Failed to get FSPurgeable data of urgency (%llu) with error: %s", buf, 0x20u);
    }

    v6 = 0;
  }
  else
  {
    v6 = v20;
  }

  return v6;
}

+ (BOOL)isFilePurgeable:(const char *)a3
{
  NSObject *v3;
  uint64_t v5;

  v5 = 0;
  if (!fsctl(a3, 0x40084A47uLL, &v5, 1u))
    return (v5 & 0xE00) != 0;
  SALog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[SASupport isFilePurgeable:].cold.1(v3);

  return 0;
}

+ (BOOL)isFileCloned:(const char *)a3
{
  NSObject *v3;
  _BOOL4 v4;
  _QWORD v6[2];

  v6[0] = 0;
  v6[1] = 0;
  if (fsctl(a3, 0x40104A0EuLL, v6, 1u))
  {
    SALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[SASupport isFileCloned:].cold.1(v3);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (LOBYTE(v6[0]) >> 1) & 1;
  }
  return v4;
}

+ (unint64_t)getInodeIDForPath:(id)a3
{
  id v3;
  NSObject *v4;
  __darwin_ino64_t st_ino;
  stat v7;

  memset(&v7, 0, sizeof(v7));
  v3 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0), &v7))
  {
    SALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SASupport getInodeIDForPath:].cold.1();

    st_ino = 0;
  }
  else
  {
    st_ino = v7.st_ino;
  }

  return st_ino;
}

+ (unint64_t)getCloneDstreamIDForPath:(id)a3
{
  NSObject *v3;
  uint64_t v5;
  unint64_t v6;

  v5 = 0;
  v6 = 0;
  if (!fsctl((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0), 0x40104A0EuLL, &v5, 1u))return v6;
  SALog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    +[SASupport isFileCloned:].cold.1(v3);

  return 0;
}

+ (void)getVolSizeFromAttrList:(const char *)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD, void *);
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  _QWORD v12[3];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v11, 0, 28);
  v12[2] = 0;
  v12[0] = 5;
  v12[1] = 2692743172;
  v5 = (void (**)(id, uint64_t, _QWORD, void *))a4;
  v6 = getattrlist(a3, v12, v11, 0x1CuLL, 1u);
  SALog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "+[SASupport getVolSizeFromAttrList:completionHandler:]";
      v15 = 2080;
      v16 = a3;
      v17 = 2048;
      v18 = v6;
      _os_log_error_impl(&dword_2478E3000, v8, OS_LOG_TYPE_ERROR, "%s: Can't get volume size for %s (err %li)", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[SASupport getVolSizeFromAttrList:completionHandler:].cold.1((uint64_t)a3, (uint64_t)v11, v8);

    v9 = 0;
  }
  if (*(_QWORD *)((char *)&v11[1] + 4) <= *(_QWORD *)((char *)&v11[2] + 4))
    v10 = *(_QWORD *)((char *)&v11[2] + 4);
  else
    v10 = *(_QWORD *)((char *)&v11[1] + 4);
  v5[2](v5, v10, *(_QWORD *)((char *)v11 + 4), v9);

}

+ (id)getVolumesPaths
{
  if (getVolumesPaths_onceToken != -1)
    dispatch_once(&getVolumesPaths_onceToken, &__block_literal_global_84);
  return (id)getVolumesPaths_volumesPaths;
}

void __28__SASupport_getVolumesPaths__block_invoke()
{
  int v0;
  int v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  statfs *v9;

  v9 = 0;
  v0 = getmntinfo_r_np(&v9, 2);
  if (v0)
  {
    v1 = v0;
    v2 = objc_opt_new();
    v3 = (void *)getVolumesPaths_volumesPaths;
    getVolumesPaths_volumesPaths = v2;

    if (v1 >= 1)
    {
      v4 = 0;
      v5 = 2168 * v1;
      do
      {
        v6 = (void *)getVolumesPaths_volumesPaths;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9[v4 / 0x878].f_mntonname);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v7);

        v4 += 2168;
      }
      while (v5 != v4);
    }
    free(v9);
  }
  else
  {
    SALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __28__SASupport_getVolumesPaths__block_invoke_cold_1();

  }
}

+ (id)getEnterpriseVolumesPaths
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int16 v18;
  uint8_t v19[4];
  char *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[SASupport getVolumesPaths](SASupport, "getVolumesPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v3 = objc_opt_new();
  v4 = (void *)getEnterpriseVolumesPaths_enterpriseVolumesPaths;
  getEnterpriseVolumesPaths_enterpriseVolumesPaths = v3;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        if (fsctl((const char *)objc_msgSend(v10, "fileSystemRepresentation", (_QWORD)v14), 0x40024A6CuLL, &v18, 0))
        {
          SALog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            +[SASupport getEnterpriseVolumesPaths].cold.1(v19, &v20, v11);

        }
        else if (v18 == 576)
        {
          objc_msgSend((id)getEnterpriseVolumesPaths_enterpriseVolumesPaths, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v7);
  }

  v12 = (id)getEnterpriseVolumesPaths_enterpriseVolumesPaths;
  return v12;
}

+ (void)isItemMountedOnSystemVolume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int *v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  char *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_13();
  v9 = *MEMORY[0x24BDAC8D0];
  v2 = __error();
  v3 = 136315650;
  v4 = "+[SASupport isItemMountedOnSystemVolume:]";
  v5 = 2112;
  v6 = v1;
  v7 = 2080;
  v8 = OUTLINED_FUNCTION_8(v2);
  _os_log_error_impl(&dword_2478E3000, v0, OS_LOG_TYPE_ERROR, "%s: statfs failed for %@ with error %s", (uint8_t *)&v3, 0x20u);
}

+ (void)enableDirStatsForPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16(&dword_2478E3000, v0, v1, "Enabled APFSIOC_DIR_STATS_OP for %s", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)enableDirStatsForPath:.cold.2()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10[4];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v1, v2, v3, v4, v5, v6, v7, v8, v10[0], v10[1], v10[2], v10[3]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v9, "APFSIOC_DIR_STATS_OP : DIR_STATS_OP_SET failed for %s : %s", (uint8_t *)v10);
  OUTLINED_FUNCTION_0();
}

+ (void)setSpeculativeHierarchy:purgeable:.cold.1()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10[4];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v1, v2, v3, v4, v5, v6, v7, v8, v10[0], v10[1], v10[2], v10[3]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v9, "APFSIOC_SPEC_TELEM_OP (set) failed for %@ with %s", (uint8_t *)v10);
  OUTLINED_FUNCTION_0();
}

+ (void)setSpeculativeHierarchy:(NSObject *)a3 purgeable:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  OUTLINED_FUNCTION_2();
  v6 = 2080;
  v7 = v4;
  _os_log_debug_impl(&dword_2478E3000, a3, OS_LOG_TYPE_DEBUG, "Setting hierarchy on path %s, purgeable %s", v5, 0x16u);
  OUTLINED_FUNCTION_0();
}

+ (void)clearSpeculativeHierarchyForPath:.cold.1()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10[4];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v1, v2, v3, v4, v5, v6, v7, v8, v10[0], v10[1], v10[2], v10[3]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v9, "APFSIOC_SPEC_TELEM_OP (unset) failed for %@ with %s", (uint8_t *)v10);
  OUTLINED_FUNCTION_0();
}

+ (void)clearSpeculativeHierarchyForPath:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16(&dword_2478E3000, a2, v3, "Un-Setting hierarchy on path %s.", v4);
  OUTLINED_FUNCTION_0();
}

+ (void)getDirStatKeyForOriginID:ofMount:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2478E3000, v0, v1, "DirStatForOriginID: APFSIOC_DIR_STATS_OP for %llu returned errno %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)getINodeForDirStatKey:ofMount:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2478E3000, v0, v1, "INodeForDirStatKey: APFSIOC_DIR_STATS_OP for %llu returned errno %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

+ (void)getDirStatInfoForPath:info:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, (uint64_t)v0, "dir-stat for %@ (flags 0x%llx) is not in saf mode.", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)getDirStatInfoForPath:info:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, v0, v1, "dir-stats for %@ is possibly inconsistent.", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)getDirStatInfoForPath:info:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, (uint64_t)v0, "dir-stat for %@ (attributes 0x%llx) does not count clones and purgeables.", v1);
  OUTLINED_FUNCTION_3();
}

+ (void)getDirStatInfoForPath:info:.cold.4()
{
  NSObject *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10[4];

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(v1, v2, v3, v4, v5, v6, v7, v8, v10[0], v10[1], v10[2], v10[3]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v9, "APFSIOC_DIR_STATS_OP: DIR_STATS_OP_GET failed for %@ : %s", (uint8_t *)v10);
  OUTLINED_FUNCTION_0();
}

+ (void)markTimeEndForPhase:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, v0, v1, "END: Unknown phase %@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)volumeSupportsAttributionTags:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, v0, v1, "Failed to get volume (%@) attribution tag capability", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)volumeSupportsCloneMapping:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, v0, v1, "Failed to get volume (%@) clone mapping capability", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)getResolvedURL:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  __error();
  v0 = __error();
  OUTLINED_FUNCTION_8(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12(&dword_2478E3000, v1, v2, "%s: Failed to resolve path (%s) with error %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_15();
}

+ (void)getURLMountPoint:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13();
  __error();
  v0 = __error();
  OUTLINED_FUNCTION_8(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_12(&dword_2478E3000, v1, v2, "%s: Failed to get path (%s) mount point with error %d (%s)", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_15();
}

+ (void)getPathOfNodeID:(os_log_t)log FSid:.cold.1(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_2478E3000, log, OS_LOG_TYPE_ERROR, "fsgetpath returned errno %d for nodeID %llu", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_3();
}

+ (void)isFilePurgeable:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, a1, v3, "fsctl APFSIOC_GET_PURGEABLE_FILE_FLAGS failed with error: %s", v4);
  OUTLINED_FUNCTION_0();
}

+ (void)isFileCloned:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, a1, v3, "fsctl APFSIOC_GET_CLONE_INFO failed with error: %s", v4);
  OUTLINED_FUNCTION_0();
}

+ (void)getInodeIDForPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_2478E3000, v0, v1, "Failed to stat path %@", v2);
  OUTLINED_FUNCTION_3();
}

+ (void)getVolSizeFromAttrList:(os_log_t)log completionHandler:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 12);
  v4 = *(_QWORD *)(a2 + 20);
  v5 = *(_QWORD *)(a2 + 4);
  v6 = 136316162;
  v7 = "+[SASupport getVolSizeFromAttrList:completionHandler:]";
  v8 = 2080;
  v9 = a1;
  v10 = 2048;
  v11 = v3;
  v12 = 2048;
  v13 = v4;
  v14 = 2048;
  v15 = v5;
  _os_log_debug_impl(&dword_2478E3000, log, OS_LOG_TYPE_DEBUG, "%s:%s:used:%llu:reserved:%llu:capacity:%llu", (uint8_t *)&v6, 0x34u);
}

void __28__SASupport_getVolumesPaths__block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8(v0);
  __error();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6(&dword_2478E3000, v1, v2, "unable to get mounts: %s (%d)\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_0();
}

+ (void)getEnterpriseVolumesPaths
{
  int *v6;
  char *v7;

  v6 = __error();
  v7 = OUTLINED_FUNCTION_8(v6);
  *(_DWORD *)a1 = 136315138;
  *a2 = v7;
  _os_log_debug_impl(&dword_2478E3000, a3, OS_LOG_TYPE_DEBUG, "APFSIOC_GET_VOLUME_ROLE returned with error: %s", a1, 0xCu);
}

@end
