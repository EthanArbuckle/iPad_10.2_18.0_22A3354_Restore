void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void STStart()
{
  id v0;

  +[STStorageAppsMonitor sharedMonitor](STStorageAppsMonitor, "sharedMonitor");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sync");

}

void sub_20D6A6EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6A7224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D6A7BC0(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 40));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D6A7C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t STStorageAppSortByNameBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

uint64_t STStorageAppSortBySizeBlock_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "appSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userTotal");

  objc_msgSend(v5, "appSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userTotal");

  if (v7 <= v9)
  {
    if (v7 < v9)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v12);

    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void AppendSizeInfo(void *a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  void *v7;
  id v8;

  v8 = a1;
  v5 = a2;
  if (a3 >= 0)
    v6 = a3;
  else
    v6 = -a3;
  if (v6 >= 0xFA0)
  {
    STFormattedSize(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" %@:%@"), v5, v7);

    if (a3 < 0)
      objc_msgSend(v8, "appendFormat:", CFSTR("*"));
  }

}

id STStorageLog()
{
  if (STStorageLog_onceToken != -1)
    dispatch_once(&STStorageLog_onceToken, &__block_literal_global_2);
  return (id)STStorageLog__gSharedLog;
}

void STTokenLogSize(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  STFormattedSize(a1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  STLog(4, CFSTR("%@: %@"), v4, v5, v6, v7, v8, v9, (uint64_t)v10);

}

void STLog(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = (__CFString *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  switch(a1)
  {
    case 2:
      STStorageLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        STLog_cold_1((uint64_t)v12, v13);
      break;
    case 3:
      STStorageLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        STLog_cold_2((uint64_t)v12, v13);
      break;
    case 4:
      STStorageLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = CFSTR("StorageLogInvestigation");
        v19 = 2114;
        v20 = v12;
        v14 = "%@ - %{public}@";
        v15 = v13;
        v16 = 22;
LABEL_12:
        _os_log_impl(&dword_20D6A4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
      break;
    default:
      STStorageLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v12;
        v14 = "%{public}@";
        v15 = v13;
        v16 = 12;
        goto LABEL_12;
      }
      break;
  }

}

id STFormattedSize(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  NSLocalizedFileSizeDescription();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (a1 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-%@"), v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v2;
  }
  v5 = v4;

  return v5;
}

void STLogDuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  STLog(1, CFSTR("%@ completed in %0.2f sec"), a3, a4, a5, a6, a7, a8, a1);
}

void STLogSize(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  STFormattedSize(a1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("%@: %@"), v4, v5, v6, v7, v8, v9, (uint64_t)v10);

}

void STLogSizeVector(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = a2;
  v4 = a1;
  STFormattedSize(objc_msgSend(v4, "userTotal"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  STFormattedSize(objc_msgSend(v4, "docsAndData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  STFormattedSize(objc_msgSend(v4, "purgeable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  STFormattedSize(objc_msgSend(v4, "fixed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "dynamic");

  STFormattedSize(v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("%@: UT: %@ / DD: %@ / PG: %@ / FX: %@ / DY: %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v3);

}

id STFormattedShortDate(void *a1, char a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD block[4];
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __STFormattedShortDate_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v7 = a2;
  v2 = STFormattedShortDate_onceToken;
  v3 = a1;
  if (v2 != -1)
    dispatch_once(&STFormattedShortDate_onceToken, block);
  objc_msgSend((id)STFormattedShortDate__formatter, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id STMakeDirPath(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "length") && (objc_msgSend(v1, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR("/"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

uint64_t STSizeOfSystemVolume()
{
  if (STSizeOfSystemVolume_onceToken != -1)
    dispatch_once(&STSizeOfSystemVolume_onceToken, &__block_literal_global_93);
  return STSizeOfSystemVolume__gSystemSize;
}

uint64_t STVolumeSize(const char *a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _DWORD v9[6];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(v9, 0, 20);
  v12 = 0;
  v10 = 5;
  v11 = 2155872256;
  v2 = getattrlist(a1, &v10, v9, 0x14uLL, 0);
  STStorageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      STVolumeSize_cold_2((uint64_t)a1, v4);

    LODWORD(v11) = -2147483628;
    if (getattrlist(a1, &v10, v9, 0x14uLL, 0))
    {
      STStorageLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        STVolumeSize_cold_1((uint64_t)a1, v5);

      return 0;
    }
    else
    {
      v6 = *(_QWORD *)&v9[1] - *(_QWORD *)&v9[3];
      STStorageLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        v14 = a1;
        v15 = 2048;
        v16 = v6;
        _os_log_impl(&dword_20D6A4000, v7, OS_LOG_TYPE_INFO, "STVolumeSize: %{public}s volume: %lld", buf, 0x16u);
      }

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v14 = a1;
      v15 = 2048;
      v16 = *(_QWORD *)&v9[1];
      _os_log_impl(&dword_20D6A4000, v4, OS_LOG_TYPE_INFO, "STVolumeSize: %{public}s volume: %lld", buf, 0x16u);
    }

    return *(_QWORD *)&v9[1];
  }
  return v6;
}

id STSizeOfPath(void *a1)
{
  return STSizeOfPathWithOptions(a1, 0);
}

id STSizeOfPathWithOptions(void *a1, int a2)
{
  id v3;
  id v4;
  FTS *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FTS *v12;
  void *v13;
  FTSENT *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  FTSENT *v21;
  FTSENT *v22;
  uint64_t v24;
  void *v25;
  char v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  stat *fts_statp;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char *v49[3];

  v49[2] = *(char **)MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    v49[0] = (char *)objc_msgSend(v4, "fileSystemRepresentation");
    v49[1] = 0;
    v5 = fts_open(v49, 81, 0);
    if (v5)
    {
      v12 = v5;
      v13 = (void *)objc_opt_new();
      v14 = fts_read(v12);
      if (v14)
      {
        v21 = v14;
        v43 = 0;
        v45 = 0;
        v44 = *MEMORY[0x24BDBCCE8];
        do
        {
          v22 = v21;
          while (v22->fts_info == 8)
          {
            if (!a2)
            {
              v22 = v21;
              goto LABEL_23;
            }
            v47 = 0;
            v48 = 0;
            if (fsctl(v22->fts_path, 0x40104A0EuLL, &v47, 0) == -1 || v47 != 2)
              goto LABEL_23;
            v24 = v48;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v48);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v13, "containsObject:", v25);

            if ((v26 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v24);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v34);

LABEL_23:
              fts_statp = v22->fts_statp;
              if ((fts_statp->st_flags & 0x20) != 0)
              {
                v36 = (void *)MEMORY[0x212BA72F0]();
                v37 = (void *)MEMORY[0x24BDBCF48];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v22->fts_path);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "fileURLWithPath:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                v46 = 0;
                objc_msgSend(v39, "getResourceValue:forKey:error:", &v46, v44, 0);
                v45 += objc_msgSend(v46, "longLongValue");

                objc_autoreleasePoolPop(v36);
              }
              else
              {
                v47 = 0;
                if (v22->fts_info != 8 || (fsctl(v22->fts_path, 0x40084A47uLL, &v47, 0), !v47))
                  v45 += fts_statp->st_blocks << 9;
              }
              goto LABEL_28;
            }
            v22 = fts_read(v12);
            if (!v22)
              goto LABEL_29;
          }
          switch(v22->fts_info)
          {
            case 4u:
              STLog(2, CFSTR("path is unreadable: %s"), v15, v16, v17, v18, v19, v20, (uint64_t)v22->fts_path);
              break;
            case 7u:
              v27 = __error();
              STLog(3, CFSTR("error %d sizing %s"), v28, v29, v30, v31, v32, v33, *v27);
              v43 = 1;
              break;
            case 0xAu:
              STLog(2, CFSTR("stat failed for %s"), v15, v16, v17, v18, v19, v20, (uint64_t)v22->fts_path);
              break;
            case 0xCu:
            case 0xDu:
              goto LABEL_23;
            default:
              break;
          }
LABEL_28:
          v21 = fts_read(v12);
        }
        while (v21);
LABEL_29:
        fts_close(v12);
        v40 = v45;
        if ((v43 & 1) != 0)
        {
          v41 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {
        fts_close(v12);
        v40 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    STLog(2, CFSTR("Failed to open path: %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }
  v41 = 0;
LABEL_36:

  return v41;
}

id STSharedConcurrentQueue()
{
  if (STSharedConcurrentQueue_token != -1)
    dispatch_once(&STSharedConcurrentQueue_token, &__block_literal_global_109);
  return (id)STSharedConcurrentQueue_queue;
}

id STSharedConcurrentOpQueue()
{
  if (STSharedConcurrentOpQueue_token != -1)
    dispatch_once(&STSharedConcurrentOpQueue_token, &__block_literal_global_111);
  return (id)STSharedConcurrentOpQueue_opQueue;
}

id STSharedContainerSizingQueue()
{
  if (STSharedContainerSizingQueue_token != -1)
    dispatch_once(&STSharedContainerSizingQueue_token, &__block_literal_global_113);
  return (id)STSharedContainerSizingQueue_queue;
}

id STSharedPathSizingOpQueue()
{
  if (STSharedPathSizingOpQueue_token != -1)
    dispatch_once(&STSharedPathSizingOpQueue_token, &__block_literal_global_115);
  return (id)STSharedPathSizingOpQueue_opQueue;
}

id STSharedSerialQueue()
{
  if (STSharedSerialQueue_token != -1)
    dispatch_once(&STSharedSerialQueue_token, &__block_literal_global_116);
  return (id)STSharedSerialQueue_queue;
}

id STSharedSerialOpQueue()
{
  if (STSharedSerialOpQueue_token != -1)
    dispatch_once(&STSharedSerialOpQueue_token, &__block_literal_global_118);
  return (id)STSharedSerialOpQueue_opQueue;
}

id STStorageDataLocStr(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = STStorageDataLocStr_strToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&STStorageDataLocStr_strToken, &__block_literal_global_119);
  objc_msgSend((id)STStorageDataLocStr_strBundle, "localizedStringForKey:value:table:", v2, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t STStorageIsInternalInstall()
{
  if (STStorageIsInternalInstall_onceToken != -1)
    dispatch_once(&STStorageIsInternalInstall_onceToken, &__block_literal_global_123);
  return STStorageIsInternalInstall_isInternal;
}

uint64_t STStorageIsDeveloperRelease()
{
  if (STStorageIsDeveloperRelease_onceToken != -1)
    dispatch_once(&STStorageIsDeveloperRelease_onceToken, &__block_literal_global_126);
  return STStorageIsDeveloperRelease_isDeveloperRelease;
}

uint64_t STStorageDeviceIsiPad()
{
  if (STStorageDeviceIsiPad_onceToken != -1)
    dispatch_once(&STStorageDeviceIsiPad_onceToken, &__block_literal_global_131);
  return STStorageDeviceIsiPad_isiPad;
}

uint64_t STStorageComputePercentage(void *a1, void *a2)
{
  void *v3;
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a2;
  objc_msgSend(a1, "floatValue");
  v6 = v5;
  objc_msgSend(v4, "floatValue");
  v8 = v7;

  return objc_msgSend(v3, "numberWithInt:", (int)(float)((float)(v6 / v8) * 100.0));
}

uint64_t STPersonasAreSupported()
{
  if (STPersonasAreSupported_onceToken != -1)
    dispatch_once(&STPersonasAreSupported_onceToken, &__block_literal_global_3);
  return STPersonasAreSupported_personasSupported;
}

id STPersonaCopyPersonaUniqueStrings()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (STPersonasAreSupported_onceToken != -1)
    dispatch_once(&STPersonasAreSupported_onceToken, &__block_literal_global_3);
  if (!STPersonasAreSupported_personasSupported)
    goto LABEL_30;
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v1 = objc_msgSend(v0, "personaGenerationIdentifierWithError:", &v32);
  v2 = v32;

  if (!v1)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v2;
    objc_msgSend(v4, "listAllPersonaAttributesWithError:", &v31);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v31;

    if (v5)
    {
      v26 = v6;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings;
      STPersonaCopyPersonaUniqueStrings_personaUniqueStrings = v13;

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (!v16)
        goto LABEL_27;
      v17 = v16;
      v18 = *(_QWORD *)v28;
      while (1)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v20, "userPersonaUniqueString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v20, "isPersonalPersona") & 1) != 0)
          {
            v22 = 1;
            if (v21)
              goto LABEL_24;
          }
          else
          {
            if (objc_msgSend(v20, "isEnterprisePersona"))
              v22 = 2;
            else
              v22 = 0;
            if (v21)
            {
LABEL_24:
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings, "setObject:forKeyedSubscript:", v23, v21);

            }
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (!v17)
        {
LABEL_27:

          v6 = v26;
          goto LABEL_29;
        }
      }
    }
    STLog(2, CFSTR("Could not fetch persona attributes from UserManagement %@\n"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
LABEL_29:

LABEL_30:
    v24 = (id)objc_msgSend((id)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings, "copy");
    return v24;
  }
  if (v1 != STPersonaCopyPersonaUniqueStrings_previousGenerationId
    || STPersonaCopyPersonaUniqueStrings_personaUniqueStrings == 0)
  {
    STPersonaCopyPersonaUniqueStrings_previousGenerationId = v1;
    goto LABEL_11;
  }
  v24 = (id)STPersonaCopyPersonaUniqueStrings_personaUniqueStrings;

  return v24;
}

id DataContainersFromAppRecordWithPersonas(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedPersonas");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2 * objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    while (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeLastObject");
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      if ((unint64_t)(v11 - 1) > 1)
      {
        STPersonaUniqueStringOfType(1, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        STPersonaUniqueStringOfType(2, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v7, "addObject:", v12);
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

      }
      else
      {
        +[STContainer containerWithIdentifier:containerClass:personaUniqueString:](STContainer, "containerWithIdentifier:containerClass:personaUniqueString:", v5, 2, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v8, "addObject:", v12);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[STContainer containerWithIdentifier:containerClass:personaUniqueString:](STContainer, "containerWithIdentifier:containerClass:personaUniqueString:", v5, 2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v8, "addObject:", v14);

  }
  return v8;
}

id STPersonaUniqueStringOfType(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");

        if (v10 == a1)
        {
          v11 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

void STMCMDataContainersFromAppProxyWithPersonas(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
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

  v30 = a1;
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedPersonas");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v7, "managedPersonas");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      objc_msgSend(v7, "managedPersonas");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      while (1)
      {
        while (1)
        {

          if (!objc_msgSend(v16, "count"))
            goto LABEL_17;
          objc_msgSend(v16, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeLastObject");
          objc_msgSend(v30, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntegerValue");

          if ((unint64_t)(v18 - 1) <= 1)
            break;
          STPersonaUniqueStringOfType(1, v30);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          STPersonaUniqueStringOfType(2, v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v16, "addObject:", v20);
          if (v23)
            objc_msgSend(v16, "addObject:", v23);
LABEL_13:

        }
        if (objc_msgSend(v7, "isContainerized"))
        {
          +[STContainer containerWithIdentifier:containerClass:personaUniqueString:](STContainer, "containerWithIdentifier:containerClass:personaUniqueString:", v10, 2, v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = v19;
            objc_msgSend(v19, "url");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            STMakeDirPath(v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            STMakeDirPath(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v7, v24);

            objc_msgSend(v9, "setObject:forKey:", v20, v23);
            goto LABEL_13;
          }
        }
      }
    }
  }
  if (objc_msgSend(v7, "isContainerized"))
  {
    +[STContainer containerWithIdentifier:containerClass:personaUniqueString:](STContainer, "containerWithIdentifier:containerClass:personaUniqueString:", v10, 2, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v16 = v25;
      objc_msgSend(v25, "url");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      STMakeDirPath(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      STMakeDirPath(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v29);

      objc_msgSend(v9, "setObject:forKey:", v16, v28);
LABEL_17:

    }
  }

}

id STNameForCategoryKey(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (STNameForCategoryKey_onceToken != -1)
    dispatch_once(&STNameForCategoryKey_onceToken, &__block_literal_global_4);
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("CAT_SYSTEM")))
  {
    v2 = (id)STNameForCategoryKey_marketingSystemName;
  }
  else
  {
    STStorageDataLocStr(v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

const __CFString *STKeyForCategory(unsigned int a1)
{
  if (a1 > 8)
    return &stru_24C7607E8;
  else
    return off_24C75FAD0[a1];
}

void _UpdateSize(void *a1, _QWORD *a2, uint64_t a3)
{
  id v3;

  if (*a2 != a3)
  {
    *a2 = a3;
    v3 = a1;
    objc_msgSend(v3, "setIntSizesVar:", 0);
    objc_msgSend(v3, "setAppSizesVar:", 0);
    objc_msgSend(v3, "notifyAppSizeChanged");

  }
}

id SizesOfContainers(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    +[STMSizer sharedAppSizer](STMSizer, "sharedAppSizer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v1;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v4)
    {
      v5 = v4;
      v20 = 0;
      v21 = 0;
      v6 = 0;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "url");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "path");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "length"))
          {
            STMakeDirPath(v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v2, "updatedSizeOfItemForPath:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "longLongValue");

            if (v14)
            {
              if (objc_msgSend(v9, "containerClass") == 1)
              {
                v21 += v14;
              }
              else
              {
                v20 += v14;
                objc_msgSend(v12, "stringByAppendingString:", CFSTR("Library/Caches/"));
                v15 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v2, "updatedSizeOfItemForPath:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v6 += objc_msgSend(v16, "longLongValue");

                v12 = (void *)v15;
              }
            }
          }
          else
          {
            v12 = v11;
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v5);
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v6 = 0;
    }

    +[STSizeVector fixed:dynamic:purgeable:](STSizeVector, "fixed:dynamic:purgeable:", v21, v20, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = v19;
  }
  else
  {
    +[STSizeVector zero](STSizeVector, "zero");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void STMSizeOfFileTree(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a1;
  objc_msgSend(v5, "defaultManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "fileExistsAtPath:", v6) & 1) != 0)
  {
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    diskUsageList(v6, 0, a2, a3);

  }
  else
  {
    STLog(2, CFSTR("STMSizeOfFileTree: Could not get size of %@, file doesn't exist"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);

    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_QWORD *)(a3 + 24) = 1;
    *(_QWORD *)(a3 + 32) = 0;
  }

}

void diskUsageList(void *a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  unsigned int v74;
  unsigned int v75;
  int *v76;
  uint64_t v77;
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  char v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  blkcnt_t v123;
  blkcnt_t v124;
  int *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  _QWORD v143[4097];
  uint64_t v144;
  uint64_t v145;
  void *v146;
  _QWORD *v147;
  id v148;
  int *v149;
  id v150;
  int v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  id v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  stat v161;
  mach_timebase_info info;
  unint64_t v163;
  int v164;
  uint64_t v165;
  int v166;
  _DWORD v167[2];
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v156 = a2;
  memset(v167, 0, 7);
  if (v7)
  {
    if (a3)
    {
      memset(&v161.st_ino, 0, 32);
      *(_QWORD *)&v161.st_dev = 1;
      v14 = objc_retainAutorelease(v7);
      if (!fsctl((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 0xC0284A20uLL, &v161, 0))
      {
        *(_QWORD *)(a4 + 16) = 0;
        *(_QWORD *)(a4 + 24) = 0;
        *(_QWORD *)(a4 + 32) = 0;
        *(int8x16_t *)a4 = vextq_s8(*(int8x16_t *)&v161.st_uid, *(int8x16_t *)&v161.st_uid, 8uLL);
        goto LABEL_86;
      }
      v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      v143[4093] = v15;
      v143[4094] = v17;
      STLog(0, CFSTR("Asked to use fast sizing on %@ but fast sizing failed: %d (%s)"), v18, v19, v20, v21, v22, v23, (uint64_t)v14);
    }
    v24 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    info = 0;
    v163 = 0xA200000900000005;
    v164 = 0;
    v165 = 0x500000002;
    v166 = 768;
    mach_timebase_info(&info);
    v26 = mach_absolute_time();
    MEMORY[0x24BDAC7A8]();
    bzero(v143, 0x8000uLL);
    v27 = objc_retainAutorelease(v7);
    +[PathObject pathObjectWithPath:component:](PathObject, "pathObjectWithPath:component:", objc_msgSend(v27, "fileSystemRepresentation"), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v149 = (int *)v143;
      v144 = (uint64_t)v27;
      v145 = v26;
      v152 = v24;
      v147 = (_QWORD *)a4;
      objc_msgSend(v25, "addObject:", v34);
      v35 = objc_msgSend(v25, "count");
      v148 = v7;
      v146 = v34;
      if (v35)
      {
        v158 = 0;
        v159 = 0;
        v36 = 0;
        v37 = 0;
        v150 = v25;
        while (1)
        {
          memset(&v161, 0, sizeof(v161));
          objc_msgSend(v25, "objectAtIndex:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeObjectAtIndex:", 0);
          v39 = open((const char *)objc_msgSend(v38, "path"), 256);
          if ((v39 & 0x80000000) == 0)
            break;
          v54 = __error();
          strerror(*v54);
          STLog(2, CFSTR("Failed to open directory %@ : %s"), v55, v56, v57, v58, v59, v60, (uint64_t)v38);
          v37 = 1;
LABEL_79:

          if (!objc_msgSend(v25, "count"))
            goto LABEL_84;
        }
        v40 = v39;
        if (fstat(v39, &v161))
        {
          v47 = __error();
          strerror(*v47);
          STLog(2, CFSTR("fstat failed for %@ : %s"), v48, v49, v50, v51, v52, v53, (uint64_t)v38);
          v37 = 1;
LABEL_78:
          close(v40);
          goto LABEL_79;
        }
        v61 = v161.st_mode & 0xF000;
        if (v61 == 40960 || v61 == 0x8000)
        {
          v123 = v161.st_blocks << 9;
          ++v159;
          v158 += v161.st_blocks << 9;
          v160 = 0;
          fsctl((const char *)objc_msgSend(v38, "path"), 0x40084A47uLL, &v160, 0);
          if (v160)
            v124 = v123;
          else
            v124 = 0;
          v36 += v124;
          goto LABEL_78;
        }
        if (v61 != 0x4000)
        {
          STLog(1, CFSTR("%@ is not a file, link or directory, skipping."), v41, v42, v43, v44, v45, v46, (uint64_t)v38);
          goto LABEL_78;
        }
        v157 = v36;
        v62 = 0;
LABEL_16:
        v63 = v149;
        do
        {
          v64 = getattrlistbulk(v40, &v163, v63, 0x8000uLL, 0);
          if (v64 == -1)
          {
            v125 = __error();
            strerror(*v125);
            STLog(2, CFSTR("getattrlistbulk on entry %llu in %@ returned error %s"), v126, v127, v128, v129, v130, v131, v62);
            v37 = 1;
LABEL_77:
            v25 = v150;
            v36 = v157;
            goto LABEL_78;
          }
          v71 = v64;
          if (!v64)
            goto LABEL_77;
        }
        while (v64 < 1);
        while (1)
        {
          v73 = *v63;
          v72 = v63[1];
          v74 = v63[4];
          v75 = v63[5];
          if ((v72 & 0x20000000) != 0)
          {
            if (v63[6])
            {
              v82 = __error();
              v83 = strerror(*v82);
              STLog(2, CFSTR("Got error %s while processing entry %llu in %@"), v84, v85, v86, v87, v88, v89, (uint64_t)v83);
              goto LABEL_62;
            }
            v76 = v63 + 7;
            if ((v72 & 1) == 0)
            {
LABEL_22:
              v77 = 0;
              if ((v72 & 8) != 0)
                goto LABEL_23;
              goto LABEL_29;
            }
          }
          else
          {
            v76 = v63 + 6;
            if ((v72 & 1) == 0)
              goto LABEL_22;
          }
          v77 = (uint64_t)v76 + *v76;
          v76 += 2;
          if ((v72 & 8) != 0)
          {
LABEL_23:
            v79 = *v76++;
            v78 = v79;
            if ((v72 & 0x2000000) == 0)
              goto LABEL_30;
            goto LABEL_24;
          }
LABEL_29:
          v78 = 0;
          if ((v72 & 0x2000000) == 0)
          {
LABEL_30:
            v80 = 0;
            goto LABEL_31;
          }
LABEL_24:
          v81 = *(_QWORD *)v76;
          v76 += 2;
          v80 = v81;
LABEL_31:
          if (v78 != 2)
          {
            if ((v74 & 1) != 0)
            {
              v106 = *v76++;
              v103 = v106;
              if ((v74 & 4) == 0)
                goto LABEL_43;
LABEL_41:
              v105 = *(_QWORD *)v76;
              v76 += 2;
              v104 = v105;
            }
            else
            {
              v103 = 0;
              if ((v74 & 4) != 0)
                goto LABEL_41;
LABEL_43:
              v104 = 0;
            }
            LODWORD(v155) = v37;
            if ((v75 & 0x100) != 0)
            {
              v108 = *(_QWORD *)v76;
              v76 += 2;
              v107 = v108;
            }
            else
            {
              v107 = 0;
            }
            v154 = v80;
            v153 = v77;
            if ((v75 & 0x200) != 0)
              v109 = *v76;
            else
              LOBYTE(v109) = 0;
            if (v156 && (v109 & 1) != 0 && v107)
            {
              v151 = v103;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v104);
              v110 = v73;
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v107);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "setObject:forKeyedSubscript:", v111, v112);

              v103 = v151;
              v73 = v110;
            }
            if ((v109 & 8) != 0)
              v113 = v104;
            else
              v113 = 0;
            v157 += v113;
            if (v103 == 1)
            {
              v158 += v104;
              ++v159;
            }
            else
            {
              v114 = (void *)MEMORY[0x212BA72F0]();
              v115 = v152;
              v116 = v154;
              if ((objc_msgSend(v152, "containsIndex:", v154) & 1) != 0)
              {
                STLog(1, CFSTR("Skipping hardlinked file at %@/%s"), v117, v118, v119, v120, v121, v122, (uint64_t)v38);
              }
              else
              {
                v158 += v104;
                ++v159;
                objc_msgSend(v115, "addIndex:", v116);
              }
              objc_autoreleasePoolPop(v114);
            }
            v37 = v155;
            goto LABEL_69;
          }
          if ((v63[3] & 2) != 0 && !*v76)
          {
            STLog(1, CFSTR("Skipping empty directory at %@/%s"), v65, v66, v67, v68, v69, v70, (uint64_t)v38);
            goto LABEL_69;
          }
          if (v77)
          {
            v90 = (void *)MEMORY[0x212BA72F0]();
            +[PathObject pathObjectWithPath:component:](PathObject, "pathObjectWithPath:component:", objc_msgSend(v38, "path"), v77);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v91;
            if (v91)
            {
              v155 = v90;
              v99 = v73;
              v100 = v37;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(v91, "path"));
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              v102 = objc_msgSend(0, "containsObject:", v101);

              if ((v102 & 1) == 0)
                objc_msgSend(v150, "addObject:", v98);
              v37 = v100;
              v73 = v99;
              v90 = v155;
            }
            else
            {
              STLog(2, CFSTR("Failed to create path to child directory by appending \"%s\" to %@"), v92, v93, v94, v95, v96, v97, v77);
              v37 = 1;
            }

            objc_autoreleasePoolPop(v90);
            goto LABEL_69;
          }
          STLog(2, CFSTR("Failed to get name for directory item %llu in %@; not counting its children"),
            v65,
            v66,
            v67,
            v68,
            v69,
            v70,
            v62);
LABEL_62:
          v37 = 1;
LABEL_69:
          v63 = (int *)((char *)v63 + v73);
          ++v62;
          if (!--v71)
            goto LABEL_16;
        }
      }
      LOBYTE(v37) = 0;
      v36 = 0;
      v159 = 0;
      v158 = 0;
LABEL_84:
      mach_absolute_time();
      v132 = v158;
      objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v158, 0);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v36, 0);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = v159;
      STLog(1, CFSTR("result for %@: %llu files, %@ total, %@ purgeable, took %lf ms)"), v136, v137, v138, v139, v140, v141, v144);

      v142 = v147;
      *v147 = v132;
      v142[1] = v135;
      v142[2] = v36;
      v142[3] = 0;
      *((_BYTE *)v142 + 32) = v37;
      *(_DWORD *)((char *)v142 + 33) = v167[0];
      *((_DWORD *)v142 + 9) = *(_DWORD *)((char *)v167 + 3);
      v7 = v148;
      v24 = v152;
      v34 = v146;
    }
    else
    {
      STLog(2, CFSTR("unable to create PathObject from %@"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);
      free(v143);
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_BYTE *)(a4 + 32) = 1;
      *(_DWORD *)(a4 + 33) = 0;
      *(_DWORD *)(a4 + 36) = 0;
    }

  }
  else
  {
    STLog(2, CFSTR("Path is nil"), v8, v9, v10, v11, v12, v13, v143[4096]);
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_BYTE *)(a4 + 32) = 1;
    *(_DWORD *)(a4 + 33) = 0;
    *(_DWORD *)(a4 + 36) = 0;
  }
LABEL_86:

}

id STMSizesOfClones(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  _BYTE v5[40];

  v1 = (objc_class *)MEMORY[0x24BDBCED8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithCapacity:", 1000);
  diskUsageList(v2, v3, 0, (uint64_t)v5);

  return v3;
}

void *_CacheSizeForAppIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _OWORD v10[2];
  uint64_t v11;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v1, 1, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UIBackgroundModes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", CFSTR("continuous")) & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v2, "dataContainerURL");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v2, "dataContainerURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Library/Caches/"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      memset(v10, 0, sizeof(v10));
      diskUsageList(v3, 0, 1, (uint64_t)v10);
      v7 = *(_QWORD *)&v10[0] & ~(*(uint64_t *)&v10[0] >> 63);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CacheSize: %@"), v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      STLogSize(v7, v8);

      v4 = (void *)(_SizeOfOPurgeableAssets(v1) + v7);
    }

    goto LABEL_8;
  }
  v4 = 0;
LABEL_9:

  return v4;
}

uint64_t _SizeOfOPurgeableAssets(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v1 = a1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v2 = MEMORY[0x24BDAC760];
  v14 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = ___SizeOfOPurgeableAssets_block_invoke;
  v10[3] = &unk_24C75FB98;
  v10[4] = &v11;
  v3 = v1;
  v4 = v10;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v5 = getCacheManagementEnumerateAssetsSymbolLoc_ptr;
  v19 = getCacheManagementEnumerateAssetsSymbolLoc_ptr;
  if (!getCacheManagementEnumerateAssetsSymbolLoc_ptr)
  {
    v15[0] = v2;
    v15[1] = 3221225472;
    v15[2] = __getCacheManagementEnumerateAssetsSymbolLoc_block_invoke;
    v15[3] = &unk_24C75FBC0;
    v15[4] = &v16;
    __getCacheManagementEnumerateAssetsSymbolLoc_block_invoke((uint64_t)v15);
    v5 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v5)
  {
    ((void (*)(id, _QWORD, _QWORD *))v5)(v3, 0, v4);

    v6 = v12[3];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PurgeableAssets: %@"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    STLogSize(v6, v7);

    v8 = v12[3];
    _Block_object_dispose(&v11, 8);

    return v8;
  }
  else
  {
    dlerror();
    result = abort_report_np();
    __break(1u);
  }
  return result;
}

void sub_20D6B0044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t STMSizeOfPurgeableAssets(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
    v2 = _SizeOfOPurgeableAssets(v1);
  else
    v2 = 0;

  return v2;
}

void *__getCacheManagementEnumerateAssetsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CacheDeleteLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CacheDeleteLibraryCore_frameworkLibrary;
  }
  else
  {
    CacheDeleteLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CacheDeleteLibraryCore_frameworkLibrary;
    if (!CacheDeleteLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CacheManagementEnumerateAssets");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCacheManagementEnumerateAssetsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20D6B0C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CompressPath(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = objc_msgSend(&unk_24C768D70, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      v7 = v4 + v3;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(&unk_24C768D70);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        if ((objc_msgSend(v1, "hasPrefix:", v8) & 1) != 0)
        {
          v10 = objc_msgSend(v8, "length");
          objc_msgSend(&unk_24C768D88, "objectAtIndexedSubscript:", v4 + v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", 0, v10, v11);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(&unk_24C768D70, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v4 = v7;
      if (v3)
        continue;
      break;
    }
  }
  v9 = v1;
LABEL_11:

  return v9;
}

void sub_20D6B32A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D6B358C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _FSEventStreamCallback(uint64_t a1, void *a2, uint64_t a3, const char **a4, unsigned int *a5, uint64_t *a6)
{
  const __CFAllocator *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *context;
  id v30;
  void *v31;
  _QWORD block[4];
  id v33;
  id v34;

  v30 = a2;
  context = (void *)MEMORY[0x212BA72F0]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      v12 = *a5++;
      v11 = v12;
      v14 = *a6++;
      v13 = v14;
      if ((v11 & 0x10) == 0)
      {
        v15 = *a4;
        v16 = (__CFString *)CFStringCreateWithFileSystemRepresentation(v10, *a4);
        if (v16)
        {
          v23 = v16;
          -[__CFString lastPathComponent](v16, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("."));

          if ((v25 & 1) == 0)
          {
            if ((v11 & 0x20000) != 0)
            {
              STMakeDirPath(v23);
              v26 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v26;
            }
            +[STMSizeCacheEvent eventWithPath:flags:event:](STMSizeCacheEvent, "eventWithPath:flags:event:", v23, v11, v13);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v27);

          }
        }
        else
        {
          STLog(2, CFSTR("Error creating filesystem path for: %s"), v17, v18, v19, v20, v21, v22, (uint64_t)v15);
        }
      }
      ++a4;
      --a3;
    }
    while (a3);
  }
  objc_autoreleasePoolPop(context);
  if (objc_msgSend(v31, "count"))
  {
    v28 = _gSharedUpdateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___FSEventStreamCallback_block_invoke;
    block[3] = &unk_24C75F680;
    v33 = v30;
    v34 = v31;
    dispatch_async(v28, block);

  }
}

void sub_20D6B380C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D6B38A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id STTapToRadarURLWithTitleAndContent(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[8];

  v17[7] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1808];
  v4 = a2;
  v5 = a1;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v6, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Disk Space Triage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("951859"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v12;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("Always"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryItems:", v14);

  objc_msgSend(v6, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id STTapToRadarURLWithTitle(void *a1)
{
  return STTapToRadarURLWithTitleAndContent(a1, &stru_24C7607E8);
}

uint64_t CacheDeleteLibrary()
{
  uint64_t v0;
  void *v2;

  if (!CacheDeleteLibraryCore_frameworkLibrary_0)
    CacheDeleteLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = CacheDeleteLibraryCore_frameworkLibrary_0;
  if (!CacheDeleteLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_20D6B6C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void AddToMultiDict(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a1;
  v5 = a2;
  v6 = a3;
  objc_msgSend(v10, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v6);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setObject:forKey:", v9, v5);
    v6 = (id)v9;
  }

}

STStorageApp *getOrCreateApp(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  STStorageApp *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (STStorageApp *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_15;
  v9 = v6;
  v10 = v7;
  v24 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v9, 1, &v24);
  v12 = v24;
  v13 = v12;
  if (v11)
  {
    v14 = v12;
LABEL_5:
    v8 = -[STStorageApp initWithAppRecord:]([STStorageApp alloc], "initWithAppRecord:", v11);

    goto LABEL_6;
  }
  v23 = v12;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifierOfSystemPlaceholder:error:", v9, &v23);
  v14 = v23;

  if (v11)
    goto LABEL_5;
  v8 = -[STStorageApp initWithBundleIdentifier:name:vendorName:]([STStorageApp alloc], "initWithBundleIdentifier:name:vendorName:", v9, v9, 0);
  -[STStorageApp setAppKind:](v8, "setAppKind:", 3);
LABEL_6:
  +[STStorageDataManager overridesFor:](STStorageDataManager, "overridesFor:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "defaultName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "defaultName");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_11;
    objc_msgSend(v10, "name");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v17;
  -[STStorageApp setName:](v8, "setName:", v17);

LABEL_11:
  if (!-[STStorageApp isInstalled](v8, "isInstalled"))
  {
    objc_msgSend(v15, "unInstalledName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v15, "unInstalledName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[STStorageApp setName:](v8, "setName:", v21);

    }
  }
  -[STStorageApp setForceHidden:](v8, "setForceHidden:", objc_msgSend(v15, "forceHidden"));
  -[STStorageApp setUsageBundle:](v8, "setUsageBundle:", v10);

  objc_msgSend(v5, "setObject:forKey:", v8, v9);
LABEL_15:

  return v8;
}

STStorageApp *MakePseudoAppForContainer(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  STStorageApp *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  STStorageApp *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = a1;
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "vendorName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
        {
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v15, v12);

          }
          v16 = objc_msgSend(v14, "count");
          if (v16 > objc_msgSend(v8, "count"))
          {
            v17 = v14;

            v8 = v17;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  if (v8)
    v18 = v8;
  else
    v18 = v5;
  v19 = v18;

  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "vendorName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = [STStorageApp alloc];
  v23 = objc_msgSend(v21, "length");
  v24 = v21;
  if (!v23)
  {
    STStorageDataLocStr(CFSTR("SHARED_DATA"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)MEMORY[0x24BDD17C8];
  STStorageDataLocStr(CFSTR("SHARED_FMT %ld"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringWithFormat:", v26, objc_msgSend(v5, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[STStorageApp initWithBundleIdentifier:name:vendorName:](v22, "initWithBundleIdentifier:name:vendorName:", v30, v24, v27);

  if (!v23)
  -[STStorageApp setAppKind:](v28, "setAppKind:", 2);

  return v28;
}

id STMessagesExternalDataSize()
{
  uint64_t v0;
  void *v1;

  if (STMessagesExternalDataSize_onceToken != -1)
    dispatch_once(&STMessagesExternalDataSize_onceToken, &__block_literal_global_12);
  if (STMessagesExternalDataSize__messagesPlugin
    && (v0 = objc_msgSend((id)STMessagesExternalDataSize__messagesPlugin, "externDataSizeForApp:", CFSTR("com.apple.MobileSMS")), v0 >= 1))
  {
    +[STSizeVector docsAndData:](STSizeVector, "docsAndData:", v0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STSizeVector zero](STSizeVector, "zero");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_20D6B9EF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D6B9FC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D6BA2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  void *v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_20D6BA6C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSSearchQueryContextClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary();
  result = objc_getClass("CSSearchQueryContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryContextClass_block_invoke_cold_1();
  getCSSearchQueryContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreSpotlightLibrary()
{
  void *v0;

  if (!CoreSpotlightLibraryCore_frameworkLibrary)
    CoreSpotlightLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreSpotlightLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCSSearchQueryClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreSpotlightLibrary();
  result = objc_getClass("CSSearchQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCSSearchQueryClass_block_invoke_cold_1();
  getCSSearchQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void GetDeviceSpace(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD v13[3];

  memset(v12, 0, 20);
  v13[2] = 0;
  v13[0] = 5;
  v13[1] = 2147483668;
  if (getattrlist("/", v13, v12, 0x14uLL, 0))
  {
    v4 = __error();
    v5 = strerror(*v4);
    STLog(3, CFSTR("Error retreiving the attributes list for / : %s"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else
  {
    *a1 = *(_QWORD *)((char *)v12 + 4);
    *a2 = *(_QWORD *)((char *)&v12[1] + 4);
  }
}

id STDictLookup(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        objc_msgSend(v9, "objectForKey:", v10, (_QWORD)v13);
        v3 = (id)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          v9 = 0;
LABEL_12:

          v11 = 0;
          goto LABEL_13;
        }
        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v3;
  v11 = v9;
LABEL_13:

  return v11;
}

id STDictLookupFromPathString(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  STDictLookup(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void STSyncATCUsage()
{
  id v0;

  +[STStorageMediaMonitor sharedMonitor](STStorageMediaMonitor, "sharedMonitor");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sync");

}

id STGetCurrentMediaUsage()
{
  void *v0;
  void *v1;

  +[STStorageMediaMonitor sharedMonitor](STStorageMediaMonitor, "sharedMonitor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "atcDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

STMutableSizeDict *STSelectMediaUsage(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  STMutableSizeDict *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a1;
  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a2;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __STSelectMediaUsage_block_invoke;
  v13[3] = &unk_24C7601A0;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);

  v8 = v3;
  v9 = v7;
  v10 = objc_alloc_init(STMutableSizeDict);
  v11 = (void *)objc_opt_new();
  recursiveComputeMediaUsage(v10, v11, v8, v9, 0);

  return v10;
}

STMutableSizeDict *STComputeUsageBundleData(void *a1, void *a2)
{
  id v3;
  id v4;
  STMutableSizeDict *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(STMutableSizeDict);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v3;
  objc_msgSend(v3, "allAppsWithUsageBundles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "excludeUsageBundle") & 1) == 0)
        {
          if (!-[STMutableSizeDict hasKey:](v5, "hasKey:", v11))
            STLog(1, CFSTR("Adding %@ because of UsageBundleData"), v13, v14, v15, v16, v17, v18, v11);
          objc_msgSend(v24, "usageBundleForIdentifier:", v11);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "totalSize");
          +[STSizeVector docsAndData:](STSizeVector, "docsAndData:", (uint64_t)v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[STMutableSizeDict addSize:toKey:](v5, "addSize:toKey:", v21, v11);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageBundleData %@"), v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          STLogSizeVector(v21, v22);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  return v5;
}

STMutableSizeDict *STComputeFSOverrides(void *a1)
{
  id v1;
  void *v2;
  STMutableSizeDict *v3;
  STMutableSizeDict *v4;
  id v5;
  STMutableSizeDict *v6;
  STMutableSizeDict *v7;
  _QWORD v9[4];
  id v10;
  STMutableSizeDict *v11;

  v1 = a1;
  +[STMSizer sharedAppSizer](STMSizer, "sharedAppSizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(STMutableSizeDict);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __STComputeFSOverrides_block_invoke;
  v9[3] = &unk_24C7601C8;
  v10 = v2;
  v4 = v3;
  v11 = v4;
  v5 = v2;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = v11;
  v7 = v4;

  return v7;
}

STMutableSizeDict *STComputeCacheDeleteOverrides(void *a1)
{
  id v1;
  STMutableSizeDict *v2;
  void *v3;
  void *v4;
  void *v5;
  STMutableSizeDict *v6;
  id v7;
  id v8;
  STMutableSizeDict *v9;
  STMutableSizeDict *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  STMutableSizeDict *v15;

  v1 = a1;
  v2 = objc_alloc_init(STMutableSizeDict);
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheDeleteDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __STComputeCacheDeleteOverrides_block_invoke;
  v12[3] = &unk_24C7601F0;
  v13 = v5;
  v14 = v4;
  v6 = v2;
  v15 = v6;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v15;
  v10 = v6;

  return v10;
}

STMutableSizeDict *STFileProviderExternalDataSize(void *a1)
{
  id v1;
  STMutableSizeDict *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  STMutableSizeDict *v63;
  void *v64;
  void *v66;
  id v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id obj;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(STMutableSizeDict);
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v3, "isiCloudDriveAllowed");

  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheDeleteDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.FileProvider.cache-delete"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v7;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    STLog(3, CFSTR("'com.apple.FileProvider.cache-delete' value must be an NSDictionary.\nCACHE_DELETE_ITEMIZED_NONPURGEABLE value: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v63 = objc_alloc_init(STMutableSizeDict);
  }
  else
  {
    v66 = v6;
    v67 = v1;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = v1;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    v15 = v68;
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v81;
      v71 = *(_QWORD *)v81;
      while (2)
      {
        v18 = 0;
        v72 = v16;
        do
        {
          if (*(_QWORD *)v81 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v18);
          if ((objc_msgSend(v19, "isiCloudDriveProvider") ^ 1 | v15) == 1)
          {
            v74 = v18;
            objc_msgSend(v19, "providerID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "topLevelBundleIdentifier");
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v21;
            if (v21)
              v23 = (void *)v21;
            else
              v23 = v20;
            v24 = v23;

            v75 = v20;
            if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")))
            {
              objc_msgSend(v19, "storageURLs");
              v25 = objc_claimAutoreleasedReturnValue();
              v76 = 0u;
              v77 = 0u;
              v78 = 0u;
              v79 = 0u;
              v26 = objc_msgSend((id)v25, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v77;
                do
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v77 != v28)
                      objc_enumerationMutation((id)v25);
                    objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "path");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    STSizeOfPathWithOptions(v30, 1);
                    v31 = (void *)objc_claimAutoreleasedReturnValue();

                    v32 = objc_msgSend(v31, "longLongValue");
                    if (v32)
                    {
                      v33 = v32;
                      if (!-[STMutableSizeDict hasKey:](v2, "hasKey:", v24))
                        STLog(1, CFSTR("Adding %@ because of FPOverride"), v34, v35, v36, v37, v38, v39, (uint64_t)v24);
                      +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", v33, 0);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      -[STMutableSizeDict addSize:toKey:](v2, "addSize:toKey:", v40, v24);
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FPExternalData %@"), v24);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      STLogSizeVector(v40, v41);

                    }
                  }
                  v27 = objc_msgSend((id)v25, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
                }
                while (v27);
                v7 = v69;
                v15 = v68;
                v17 = v71;
              }
            }
            else
            {
              objc_msgSend(v70, "objectForKey:", v20);
              v25 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "objectForKey:", v20);
              v42 = objc_claimAutoreleasedReturnValue();
              if (v25 | v42)
              {
                if (!-[STMutableSizeDict hasKey:](v2, "hasKey:", v24))
                  STLog(1, CFSTR("Adding %@ because of FPOverride"), v43, v44, v45, v46, v47, v48, (uint64_t)v24);
                if (v25)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v64 = v75;
                    STLog(3, CFSTR("'%@' value must be an NSNumber.\ncacheDeleteDict value: %@"), v49, v50, v51, v52, v53, v54, (uint64_t)v75);
                    v6 = v66;
LABEL_41:
                    v63 = objc_alloc_init(STMutableSizeDict);

                    v1 = v67;
                    goto LABEL_42;
                  }
                }
                if (v42)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v6 = v66;
                    v64 = v75;
                    STLog(3, CFSTR("'%@' value must be an NSNumber.\nCACHE_DELETE_ITEMIZED_NONPURGEABLE value: %@"), v55, v56, v57, v58, v59, v60, (uint64_t)v75);
                    goto LABEL_41;
                  }
                }
                +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", objc_msgSend((id)v42, "longLongValue"), objc_msgSend((id)v25, "longLongValue"));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[STMutableSizeDict addSize:toKey:](v2, "addSize:toKey:", v61, v24);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FPExternalData %@"), v24);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                STLogSizeVector(v61, v62);

                v17 = v71;
              }

            }
            v16 = v72;
            v18 = v74;
          }
          ++v18;
        }
        while (v18 != v16);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        if (v16)
          continue;
        break;
      }
    }

    v63 = v2;
    v6 = v66;
    v1 = v67;
  }
LABEL_42:

  return v63;
}

void recursiveComputeMediaUsage(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v9 = a1;
  v10 = a2;
  v11 = a4;
  v12 = a5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __recursiveComputeMediaUsage_block_invoke;
  v17[3] = &unk_24C760218;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = v9;
  v13 = v9;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v17);

}

void __recursiveComputeMediaUsage_block_invoke(id *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(a1[4], "addObject:", a2);
  objc_msgSend(a1[4], "componentsJoinedByString:", CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = a1[6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v22;
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PhysicalSize"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_PurgeableSize"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v11 = objc_msgSend(v9, "longLongValue");
        v12 = v10 ? objc_msgSend(v10, "longLongValue") : 0;
        v13 = v11 - v12;
        if (v13 >= 1)
        {
          if ((objc_msgSend(a1[7], "hasKey:", v6) & 1) == 0)
            STLog(1, CFSTR("Adding %@ because of MediaUsage"), v14, v15, v16, v17, v18, v19, (uint64_t)v6);
          +[STSizeVector docsAndData:purgeable:](STSizeVector, "docsAndData:purgeable:", v13, v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[7], "addSize:toKey:", v20, v6);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MediaUsage %@"), v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          STLogSizeVector(v20, v21);

        }
      }

    }
    recursiveComputeMediaUsage(a1[7], a1[4], v8, a1[5], v6);

  }
  objc_msgSend(a1[4], "removeLastObject");

}

void STLog_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20D6A4000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void STLog_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_20D6A4000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void STVolumeSize_cold_1(uint64_t a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  __error();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_20D6A4000, a2, OS_LOG_TYPE_ERROR, "Error retrieving the total and available attributes list for %{public}s : %{errno}d", v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

void STVolumeSize_cold_2(uint64_t a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  __error();
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_20D6A4000, a2, OS_LOG_TYPE_FAULT, "Error retrieving the total attributes list for %{public}s : %{errno}d", v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

void __getCSSearchQueryContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getCSSearchQueryClass_block_invoke_cold_1(v0);
}

void __getCSSearchQueryClass_block_invoke_cold_1()
{
  abort_report_np();
  ALRegisterForPhotosAndVideosCount();
}

uint64_t ALRegisterForPhotosAndVideosCount()
{
  return MEMORY[0x24BE72210]();
}

uint64_t ALUnregisterForPhotosAndVideosCount()
{
  return MEMORY[0x24BE72218]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x24BDBC590](alloc, buffer);
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x24BDC1470](allocator, callback, context, pathsToWatch, sinceWhen, *(_QWORD *)&flags, latency);
}

FSEventStreamEventId FSEventStreamFlushAsync(FSEventStreamRef streamRef)
{
  return MEMORY[0x24BDC1478](streamRef);
}

FSEventStreamEventId FSEventStreamGetLatestEventId(ConstFSEventStreamRef streamRef)
{
  return MEMORY[0x24BDC1488](streamRef);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  MEMORY[0x24BDC1490](streamRef);
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  MEMORY[0x24BDC1498](streamRef);
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  MEMORY[0x24BDC14A0](streamRef, q);
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x24BDC14A8](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  MEMORY[0x24BDC14B0](streamRef);
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  return MEMORY[0x24BDC14C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x24BDD0FE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t container_copy_object()
{
  return MEMORY[0x24BDADA30]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x24BDADA78]();
}

uint64_t container_free_object()
{
  return MEMORY[0x24BDADAA0]();
}

uint64_t container_get_class()
{
  return MEMORY[0x24BDADAB0]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x24BDADAB8]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x24BDADB38]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x24BDADB68]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x24BDADB70]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x24BDADB78]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x24BDAE5B8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_resume(int token)
{
  return MEMORY[0x24BDAF188](*(_QWORD *)&token);
}

uint32_t notify_suspend(int token)
{
  return MEMORY[0x24BDAF1A0](*(_QWORD *)&token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

